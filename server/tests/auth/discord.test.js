const DiscordStrategy = require('passport-discord').Strategy;
const passport = require('passport');
require('dotenv').config();

describe('Passport Discord strategy', () => {
  const mockDone = jest.fn();
  const strategy = new DiscordStrategy({
    clientID: process.env.DISCORD_CLIENT_ID,
    clientSecret: process.env.DISCORD_CLIENT_SECRET,
    callbackURL: 'http://localhost:8080/auth/Discord/callback',
    scope: ['bot', 'identify']
  }, (accessToken, refreshToken, profile, done) => {
    try {
      return done(undefined, false);
    } catch (error) {
      console.error(error);
    }
  });

  it('should be defined', () => {
    expect(strategy).toBeDefined();
  });

  it('should have correct options', () => {
    expect(strategy._oauth2._clientId).toBe(process.env.DISCORD_CLIENT_ID);
    expect(strategy._oauth2._clientSecret).toBe(process.env.DISCORD_CLIENT_SECRET);
    expect(strategy._callbackURL).toBe('http://localhost:8080/auth/Discord/callback');
    expect(strategy._scope).toEqual(['bot', 'identify']);
  });

  it('should call done with correct arguments', () => {
    strategy.authenticate({ headers: {}, query: { code: '123' } });
    expect(mockDone).toHaveBeenCalledTimes(1);
    expect(mockDone).toHaveBeenCalledWith(undefined, false);
  });
});
