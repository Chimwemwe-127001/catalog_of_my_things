
CREATE TABLE item (
    id  INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (label_id) REFERENCES labels (id)

DROP TABLE IF EXISTS games;

CREATE TABLE games (
    id INT PRIMARY KEY,
    multiplayer VARCHAR(100),
    last_played_at DATE NOT NULL,
    genre_id INT ,
    lable_id INT ,
    source_id INT ,
    author_id INT ,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY genre_id REFERENCES genre (id),
    FOREIGN KEY lable_id REFERENCES lable (id),
    FOREIGN KEY author_id REFERENCES author (id),
    FOREIGN KEY source_id REFERENCES source (id)

);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE books (
    id  INT,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    FOREIGN KEY(id) REFERENCES item(id)
);