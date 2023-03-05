# syntax=docker/dockerfile:1

FROM node:latest

EXPOSE 8080

USER root

COPY . /server

WORKDIR /server

RUN yarn install 

RUN yarn global add nodemon

RUN yarn add cors express mysql snoowrap express-session bcryptjs passport passport-local passport-jwt @superfaceai/passport-twitter-oauth2 jsonwebtoken prisma @prisma/client dotenv nodemon passport-github2 passport-discord passport-facebook discord.js octokit node-sessionstorage twitter-api-v2 passport-google-oauth20 axios discord-oauth2

RUN cd api; npx prisma generate

CMD ["nodemon", "index.js"]
