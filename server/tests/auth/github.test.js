const request = require('supertest');
const express = require('express');
const passport = require('passport');
const storage = require('node-sessionstorage');
const router = require('../../api/routes/auth/git_auth.js'); // assuming your code is in a router.js file

jest.mock('@prisma/client');

const app = express();
app.use(express.json());
app.use('/', router);

describe('Github authentication', () => {
  it('should return 200 status code and Github login URL', async () => {
    const response = await request(app).get('/Github');
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty('url');
    expect(response.body.url).toMatch(/github\.com\/login\/oauth\/authorize/);
  });

  it('should return 201 status code and success message', async () => {
    const response = await request(app)
      .post('/Github')
      .send({ userId: '123456' });
    expect(response.status).toBe(201);
    expect(response.body).toHaveProperty('message', 'success');
  });

  it('should redirect to success URL on successful authentication', async () => {
    passport.authenticate.mockImplementation((strategy, options, callback) => {
      callback(null, { id: '123' }, null);
    });
    const response = await request(app).get('/Github/callback');
    expect(response.status).toBe(302);
    expect(response.header.location).toBe('http://localhost:8080/auth/success');
  });

  it('should return an error message if authentication fails', async () => {
    passport.authenticate.mockImplementation((strategy, options, callback) => {
      callback(new Error('Authentication failed'), null, null);
    });
    const response = await request(app).get('/Github/callback');
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty('message', 'Error, cannot retrieve git User.');
  });
});