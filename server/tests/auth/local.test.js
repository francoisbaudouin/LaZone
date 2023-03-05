const request = require('supertest');

const app = require('../../index');
const { PrismaClient } = require('@prisma/client');
const { hash } = require('../../api/config/utils');
const passport = require('passport');
const passportConfig = require('../../api/config/passport');

const prisma = new PrismaClient();
let user;

beforeAll(async () => {
  await prisma.$connect();
});

afterAll(async () => {
  await prisma.$disconnect();
});

beforeEach(async () => {
  await prisma.users.deleteMany();
  user = await prisma.users.create({
    data: {
      email: 'test@example.com',
      password: await hash('password'),
      lastname: 'Doe',
      firstname: 'John',
      pseudo: 'johndoe',
    },
  });
});

afterEach(async () => {
  await prisma.users.deleteMany();
});

describe('passport.use("signUp")', () => {
  it('registers a new user with valid credentials', async () => {
    const newUser = {
      email: 'newuser@example.com',
      password: 'password',
      lastname: 'Smith',
      firstname: 'Jane',
      pseudo: 'janesmith',
    };

    const req = { body: newUser };
    const cb = jest.fn();

    await passportConfig.signUp(req, newUser.email, newUser.password, cb);

    expect(cb).toHaveBeenCalledWith(null, expect.objectContaining({ id: expect.any(Number) }));

    const dbUser = await prisma.users.findUnique({ where: { email: newUser.email } });
    expect(dbUser).toMatchObject({
      email: newUser.email,
      lastname: newUser.lastname,
      firstname: newUser.firstname,
      pseudo: newUser.pseudo,
    });
  });

  it('returns an error for an existing email address', async () => {
    const newUser = {
      email: 'test@example.com',
      password: 'password',
      lastname: 'Smith',
      firstname: 'Jane',
      pseudo: 'janesmith',
    };

    const req = { body: newUser };
    const cb = jest.fn();

    await passportConfig.signUp(req, newUser.email, newUser.password, cb);

    expect(cb).toHaveBeenCalledWith(null, false, expect.objectContaining({ message: 'Email already exists.' }));

    const dbUser = await prisma.users.findUnique({ where: { email: newUser.email } });
    expect(dbUser).toMatchObject(user);
  });
});