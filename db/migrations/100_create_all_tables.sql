CREATE TABLE spaces
(
    space_id          SERIAL PRIMARY KEY,
    space_name        VARCHAR(20),
    space_description VARCHAR(120),
    price_per_night   DOUBLE PRECISION
);

CREATE TABLE users
(
    user_id   SERIAL PRIMARY KEY,
    user_name VARCHAR(60) UNIQUE,
    password VARCHAR(60)
);

CREATE TABLE bookings
(
    booking_id    serial PRIMARY KEY,
    space_id      INTEGER REFERENCES spaces (space_id),
    booking_start DATE NOT NULL,
    booking_end   DATE NOT NULL
);