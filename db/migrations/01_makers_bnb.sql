<<<<<<< HEAD
=======
CREATE TABLE spaces
(
    space_id          SERIAL PRIMARY KEY,
    space_name        VARCHAR(60),
    space_description VARCHAR(60),
    price_per_night   DOUBLE PRECISION
);

CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(60) UNIQUE
);

#add foreign key
ALTER TABLE spaces ADD COLUMN user_id INT;
ALTER TABLE spaces ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users (user_id);

# alternative

ALTER TABLE spaces ADD COLUMN user_id INTEGER REFERENCES users (user_id);
>>>>>>> WIP into this

CREATE TABLE spaces(space_id SERIAL PRIMARY KEY, space_name VARCHAR(20), space_description VARCHAR(120), price_per_night DOUBLE PRECISION) ;

<<<<<<< HEAD
CREATE TABLE users(user_id SERIAL PRIMARY KEY, user_name VARCHAR(60));
=======
#drop constraints
ALTER TABLE spaces
DROP CONSTRAINT user_id;
>>>>>>> WIP into this
