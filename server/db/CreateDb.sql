
CREATE TABLE Users (
    UserId serial PRIMARY KEY,
    Username VARCHAR (50) UNIQUE NOT NULL,
    Pass VARCHAR (50) NOT NULL,
    Token VARCHAR (260)
);

CREATE TABLE Areas (
    id serial PRIMARY KEY
);

CREATE TABLE Actions (
    id serial PRIMARY KEY
);

CREATE TABLE Reactions (
    id serial PRIMARY KEY
);

INSERT INTO Users(username, pass) VALUES ('test', 'test');
