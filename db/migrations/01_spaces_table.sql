CREATE TABLE spaces
(
    space_id          SERIAL PRIMARY KEY,
    space_name        VARCHAR(20),
    space_description VARCHAR(120),
    price_per_night   DOUBLE PRECISION,
    user_id           INTEGER REFERENCES users (user_id),
);