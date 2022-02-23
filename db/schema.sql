CREATE DATABASE filmarket_db;
\c filmarket_db;

CREATE TABLE marketplace (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    artist TEXT,
    caption TEXT,
    price INTEGER
);

CREATE TABLE gallery (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    artist TEXT,
    caption TEXT,
    price INTEGER
);




