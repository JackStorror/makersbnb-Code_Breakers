  CREATE TABLE requests (
    request_id serial PRIMARY KEY,
    space_id INTEGER REFERENCES spaces (space_id),
    request_start DATE NOT NULL,
    request_end DATE NOT NULL,
    host_id INTEGER NOT NULL REFERENCES users (user_id),
    user_id INTEGER NOT NULL REFERENCES users (user_id)
  );