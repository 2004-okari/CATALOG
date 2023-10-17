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
