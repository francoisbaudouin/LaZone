const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
require("dotenv").config();

const hash = async (password) => {
  // Generate salt
  const salt = await bcrypt.genSalt(10);
  
  // Hash the password
  password = await bcrypt.hash(password, salt);
  
  return password;
};

//compare hashed password's
const compare = async (hash, pass) => {
  return bcrypt.compare(hash, pass);
};

//generate tokens
const generateToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRE
  });
};

module.exports = {
  hash,
  compare,
  generateToken
};