CREATE TABLE Authors (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    items []
);

CREATE TABLE Games (
    id INTEGER PRIMARY KEY,
    publish_date DATE,
    multiplayer TEXT,
    last_played_at DATE,
    genre TEXT,
    source TEXT,
    label TEXT,
    author_id INTEGER,
    archived BOOLEAN,

    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

-- Book

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL,
  author_id INT,
  genre_id INT,
  label_id INT,
  source_id INT,
  archived BOOLEAN NOT NULL,
  publish_date DATE NOT NULL,
  FOREIGN KEY(label_id) REFERENCES label(id),
  FOREIGN KEY(author_id) REFERENCES author(id),
  FOREIGN KEY(genre_id) REFERENCES genre(id),
  FOREIGN KEY(source_id) REFERENCES source(id),
  PRIMARY KEY(id)
);

-- Label

CREATE TABLE label(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(50) NOT NULL,
  PRIMARY KEY(id)
);