
CREATE TABLE Users (
    UserId serial PRIMARY KEY,
    Username VARCHAR (50) UNIQUE NOT NULL,
    Pass VARCHAR (50) NOT NULL,
    Token VARCHAR (260)
);

CREATE TABLE Areas (
    id serial PRIMARY KEY,
);

CREATE TABLE Action (
    id serial PRIMARY KEY,
    serviceName 
);

-- INSERT INTO Users(username, pass) VALUES ('test', 'test');
