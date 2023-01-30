SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE IF NOT EXISTS `db_lazone`;

USE `db_lazone`;

CREATE TABLE IF NOT EXISTS `users` (
    `id`            int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `email`         varchar(255) NOT NULL,
    `password`      varchar(255) NOT NULL,
    `lastname`      varchar(255) NOT NULL,
    `firstname`     varchar(255) NOT NULL,
    `pseudo`        varchar(255) NOT NULL,
    `created_at`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY `email` (`email`)
);

INSERT INTO users(email, firstname, lastname, password, pseudo) VALUES ('user0@email.com', 'john', 'doe', 'StrongPassword', 'user0');
