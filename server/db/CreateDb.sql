
CREATE TABLE IF NOT EXISTS Users (
    UserId serial PRIMARY KEY,
    Username VARCHAR (50) UNIQUE NOT NULL,
    Email VARCHAR (50) UNIQUE NOT NULL,
    Pass VARCHAR (50) NOT NULL,
    Token VARCHAR (260)
);

CREATE TABLE IF NOT EXISTS Areas (
    id serial PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Actions (
    id serial PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Reactions (
    id serial PRIMARY KEY
);

INSERT INTO Users(username, Email, pass) VALUES ('test', 'test', 'test');
