  CREATE TABLE bookings (
    booking_id serial PRIMARY KEY,
    space_id INTEGER REFERENCES spaces (space_id),
    booking_start DATE NOT NULL,
    booking_end DATE NOT NULL,
    host_id INTEGER NOT NULL REFERENCES users (user_id),
    user_id INTEGER NOT NULL REFERENCES users (user_id)
  );