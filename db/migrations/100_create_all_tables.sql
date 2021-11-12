CREATE TABLE users
(
    user_id   SERIAL PRIMARY KEY,
    user_name VARCHAR(60) UNIQUE,
    password  VARCHAR(60)
);

CREATE TABLE spaces
(
    space_id          SERIAL PRIMARY KEY,
    space_name        VARCHAR(20),
    space_description VARCHAR(120),
    price_per_night   DOUBLE PRECISION,
    user_id           INTEGER REFERENCES users (user_id)

);

CREATE TABLE bookings
(
    booking_id    serial PRIMARY KEY,
    space_id      INTEGER REFERENCES spaces (space_id),
    booking_start DATE NOT NULL,
    booking_end   DATE NOT NULL,
    host_id       INTEGER NOT NULL REFERENCES users (user_id),
    user_id       INTEGER NOT NULL REFERENCES users (user_id)
  );

CREATE TABLE requests (
    request_id serial PRIMARY KEY,
    space_id INTEGER REFERENCES spaces (space_id),
    request_start DATE NOT NULL,
    request_end DATE NOT NULL,
    host_id INTEGER NOT NULL REFERENCES users (user_id),
    user_id INTEGER NOT NULL REFERENCES users (user_id)
  );
