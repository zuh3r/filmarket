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

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    password_digest TEXT
);

heroku pg:reset
heroku pg:push filmarket_db DATABASE_URL


INSERT INTO marketplace(name, image_url, artist, caption, price) VALUES('New York', 'https://images.unsplash.com/photo-1514565131-fce0801e5785?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2t5bGluZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60', 'Zuher Feki', 'New York City skyline', 250);

INSERT INTO marketplace(name, image_url, artist, caption, price) VALUES('Chicago', 'https://images.unsplash.com/photo-1534298261662-f8fdd25317db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2t5bGluZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60', 'Zuher Feki', 'Chicago skyline', 180);


INSERT INTO marketplace(name, image_url, artist, caption, price) VALUES('Miami', 'https://images.unsplash.com/photo-1535498730771-e735b998cd64?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2t5bGluZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60', 'Zuher Feki', 'Miami skyline', 210);

INSERT INTO marketplace(name, image_url, artist, caption, price) VALUES('Tokyo', 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dG9reW98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'Zuher Feki', 'Tokyo shopping mall', 200);

INSERT INTO marketplace(name, image_url, artist, caption, price) VALUES('Tokyo-Street', 'https://images.unsplash.com/photo-1536768139911-e290a59011e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dG9reW98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'Zuher Feki', 'Tokyo at night', 220);

INSERT INTO marketplace(name, image_url, artist, caption, price) VALUES('Paris', 'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFyaXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'Zuher Feki', 'Bridge over water in Paris', 230);