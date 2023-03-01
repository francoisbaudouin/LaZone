const request = require('supertest');
const express = require('express');
const session = require('express-session');
const storage = require('node-sessionstorage');
const passport = require('passport');
const GithubStrategy = require('passport-github').Strategy;
const router = require('../../api/routes/auth/git_auth.js');
const app = express();

// Mock the Prisma client
jest.mock('@prisma/client');
const { PrismaClient } = require('@prisma/client');
const prismaMock = new PrismaClient();

// Mock the passport module
jest.mock('passport');
passport.use(new GithubStrategy({
  clientID: 'test_client_id',
  clientSecret: 'test_client_secret',
  callbackURL: 'http://localhost:8080/auth/Github/callback'
}, (accessToken, refreshToken, profile, cb) => {
  cb(null, profile);
}));
passport.serializeUser((user, done) => {
  done(null, user);
});
passport.deserializeUser((user, done) => {
  done(null, user);
});

// Set up the express app
app.use(express.urlencoded({ extended: true }));
app.use(session({ secret: 'test_secret' }));
app.use(passport.initialize());
app.use(passport.session());
app.use('/auth', router);

describe('Github authentication', () => {
  beforeEach(() => {
    jest.resetAllMocks();
    storage.clear();
  });

  it('should redirect to Github authentication page', async () => {
    const response = await request(app).get('/auth/Github');
    expect(response.statusCode).toBe(302);
    expect(response.headers.location).toMatch(/^https:\/\/github.com\/login\/oauth\/authorize\?client_id=test_client_id&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fauth%2FGithub%2Fcallback&scope=repo%2Cuser%2Cproject&response_type=code$/);
  });

  it('should store the user ID in session storage', async () => {
    const response = await request(app).post('/auth/Github').send({ userId: 'test_user_id' });
    expect(response.statusCode).toBe(201);
    expect(storage.getItem('userId')).toBe('test_user_id');
  });

  it('should redirect to success page after successful authentication', async () => {
    passport.authenticate.mockImplementationOnce((strategy, options, callback) => {
      callback(null, { id: 'test_user_id' });
    });
    const response = await request(app).get('/auth/Github/callback');
    expect(response.statusCode).toBe(302);
    expect(response.headers.location).toBe('http://localhost:8080/auth/success');
    expect(storage.getItem('userId')).toBe('test_user_id');
  });

  it('should return an error if authentication fails', async () => {
    passport.authenticate.mockImplementationOnce((strategy, options, callback) => {
      callback(new Error('test_error'));
    });
    const response = await request(app).get('/auth/Github/callback');
    expect(response.statusCode).toBe(200);
    expect(response.body.message).toBe('Error, cannot retrieve git User.');
    expect(storage.getItem('userId')).toBe(null);
  });
});