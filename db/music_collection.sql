DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL4,
  name VARCHAR(255),
  title VARCHAR(255),
  artist_id INT REFERENCES artists(id)
);
