const request = require('supertest');
const express = require('express');
const passport = require('passport');
const storage = require('node-sessionstorage');
const router = require('../../api/routes/auth/git_auth.js');

jest.mock('@prisma/client');

const app = express();
app.use(express.json());
app.use('/', router);

describe('Github authentication', () => {
  it('get login URL and status 200', async () => {
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
});