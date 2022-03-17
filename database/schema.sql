DROP TABLE IF EXISTS games;

CREATE TABLE games (
    id INT PRIMARY KEY,
    multiplayer VARCHAR(100),
    last_played_at DATE NOT NULL,
    genre_id INT,
    lable_id INT,
    source_id INT,
    author_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY genre_id REFERENCES genres (id),
    FOREIGN KEY lable_id REFERENCES lables (id),
    FOREIGN KEY author_id REFERENCES authors (id),
    FOREIGN KEY source_id REFERENCES sources (id)

);

CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE genres (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);

CREATE TABLE lables (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL,
);

CREATE TABLE sources (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
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
    genre_id INT,
    lable_id INT,
    source_id INT,
    author_id INT,
    FOREIGN KEY genre_id REFERENCES genres (id),
    FOREIGN KEY lable_id REFERENCES lables (id),
    FOREIGN KEY author_id REFERENCES authors (id),
    FOREIGN KEY source_id REFERENCES sources (id)
);

CREATE TABLE musicAlbum (
    id  INT,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    genre_id INT,
    lable_id INT,
    source_id INT,
    author_id INT,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY genre_id REFERENCES genres (id),
    FOREIGN KEY lable_id REFERENCES lables (id),
    FOREIGN KEY author_id REFERENCES authors (id),
    FOREIGN KEY source_id REFERENCES sources (id)
);