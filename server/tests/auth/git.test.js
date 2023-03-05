const passport = require('passport');
const storage = require('node-sessionstorage')
const GitHubStrategy = require('passport-github2').Strategy;
const { PrismaClient } = require('@prisma/client');
require('dotenv').config();

const prisma = new PrismaClient();

jest.mock('node-sessionstorage');
storage.getItem.mockReturnValue('123');

describe('Passport GitHub strategy', () => {
  const prismaMock = {
    tokens: {
      create: jest.fn(),
    },
  };
  jest.spyOn(prisma, 'tokens').mockReturnValue(prismaMock.tokens);

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('should create a new token with valid inputs', async () => {
    const accessToken = '123';
    const refreshToken = '456';
    const profile = { username: 'testuser' };
    const done = jest.fn();

    await GitHubStrategy.prototype._verify(
      accessToken,
      refreshToken,
      profile,
      done
    );

    expect(prismaMock.tokens.create).toHaveBeenCalledTimes(1);
    expect(prismaMock.tokens.create).toHaveBeenCalledWith({
      data: {
        accessTokens: accessToken,
        refreshTokens: refreshToken,
        relatedServiceName: 'Github',
        userId: 123,
      },
    });
    expect(done).toHaveBeenCalledTimes(1);
    expect(done).toHaveBeenCalledWith(null, profile);
  });

  it('should handle errors', async () => {
    // Arrange
    const accessToken = '123';
    const refreshToken = '456';
    const profile = { username: 'testuser' };
    const done = jest.fn();
    const error = new Error('Oops! Something went wrong.');

    prismaMock.tokens.create.mockRejectedValue(error);

    await GitHubStrategy.prototype._verify(
      accessToken,
      refreshToken,
      profile,
      done
    );

    expect(prismaMock.tokens.create).toHaveBeenCalledTimes(1);
    expect(prismaMock.tokens.create).toHaveBeenCalledWith({
      data: {
        accessTokens: accessToken,
        refreshTokens: refreshToken,
        relatedServiceName: 'Github',
        userId: 123,
      },
    });
    expect(done).toHaveBeenCalledTimes(1);
    expect(done).toHaveBeenCalledWith(null, error);
  });

  it('should serialize and deserialize user', () => {
    const user = { username: 'testuser' };

    const serializedUser = passport.serializeUser(user, jest.fn());
    const deserializedUser = passport.deserializeUser(user, jest.fn());

    expect(serializedUser).toEqual(user);
    expect(deserializedUser).toEqual(user);
  });
});