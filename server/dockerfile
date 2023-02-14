# syntax=docker/dockerfile:1

FROM node:16.5.0-alpine3.11

EXPOSE 8080

USER root

COPY . /server

WORKDIR /server

RUN yarn install 

RUN yarn global add nodemon

RUN yarn add cors express mysql express-session bcryptjs passport passport-local passport-jwt jsonwebtoken prisma @prisma/client dotenv nodemon passport-github2 passport-discord discord.js octokit

RUN cd api; npx prisma generate

CMD ["nodemon", "index.js"]
