# syntax=docker/dockerfile:1

FROM node:latest

EXPOSE 8080

USER root

COPY . /server

WORKDIR /server

RUN yarn install 

RUN yarn global add nodemon

RUN yarn add cors axios express mysql express-session bcryptjs passport passport-local passport-jwt passport-facebook @superfaceai/passport-twitter-oauth2 jsonwebtoken prisma @prisma/client dotenv nodemon passport-github2 passport-discord discord.js octokit node-sessionstorage twitter-api-v2 passport-google-oauth20
RUN cd api; npx prisma generate

CMD ["nodemon", "index.js"]
