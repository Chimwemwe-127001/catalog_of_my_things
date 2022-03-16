DROP TABLE IF EXISTS games;

CREATE TABLE games (
    id INT PRIMARY KEY,
    multiplayer VARCHAR(100),
    last_played_at DATE NOT NULL,
    genre_id INT NOT NULL,
    lable_id INT NOT NULL,
    source_id INT NOT NULL,
    author_id INT NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY genre_id REFERENCES genre (id),
    FOREIGN KEY lable_id REFERENCES lable (id),
    FOREIGN KEY author_id REFERENCES author (id),
    FOREIGN KEY source_id REFERENCES source (id)
);

DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);




