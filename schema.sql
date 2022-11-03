CREATE TABLE music_albums (
  id INT GENERATED ALWAYS AS IDENTITY,
  FOREIGN KEY(genre_id) REFERENCES genre(id) 
  FOREIGN KEY(author_id) REFERENCES author(id) 
  FOREIGN KEY(source_id) REFERENCES source(id) 
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
);

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100)
);