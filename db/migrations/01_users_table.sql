CREATE TABLE users
(
    user_id   SERIAL PRIMARY KEY,
    user_name VARCHAR(60) UNIQUE,
    password  VARCHAR(60)
);

