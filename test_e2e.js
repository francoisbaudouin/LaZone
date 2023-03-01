const { chromium } = require('playwright');

describe('My Flutter App', () => {
  let browser, page;

  beforeAll(async () => {
    browser = await chromium.launch();
    page = await browser.newPage();
    await page.goto('http://localhost:8081'); // replace with your Flutter app URL
  });

  afterAll(async () => {
    await browser.close();
  });

  it('should display the welcome message', async () => {
    const message = await page.textContent('.welcome-message');
    expect(message).toEqual('Welcome to my Flutter App!');
  });

  it('should allow the user to sign in', async () => {
    await page.fill('#username', 'myusername');
    await page.fill('#password', 'mypassword');
    await page.click('#signin-button');
    const loggedInMessage = await page.textContent('.loggedin-message');
    expect(loggedInMessage).toEqual('Welcome, myusername!');
  });
});