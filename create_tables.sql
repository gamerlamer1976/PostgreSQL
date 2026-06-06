-- =========================================================
-- СОЗДАНИЕ НЕЗАВИСИМЫХ ТАБЛИЦ (без внешних ключей)
-- =========================================================

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    release_year DATE NOT NULL
);

CREATE TABLE compilations (
    compilation_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    release_year DATE NOT NULL
);

-- =========================================================
-- СОЗДАНИЕ ЗАВИСИМЫХ ТАБЛИЦ (связь 1 ко многим)
-- =========================================================

CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    duration_seconds INT NOT NULL,
    album_id INT NOT NULL REFERENCES albums(album_id)
);

-- =========================================================
-- СОЗДАНИЕ СВЯЗУЮЩИХ ТАБЛИЦ (связи многие ко многим)
-- =========================================================

CREATE TABLE artist_genres (
    artist_id INT NOT NULL REFERENCES artists(artist_id),
    genre_id INT NOT NULL REFERENCES genres(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE album_artists (
    album_id INT NOT NULL REFERENCES albums(album_id),
    artist_id INT NOT NULL REFERENCES artists(artist_id),
    PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE compilation_tracks (
    compilation_id INT NOT NULL REFERENCES compilations(compilation_id),
    track_id INT NOT NULL REFERENCES tracks(track_id),
    PRIMARY KEY (compilation_id, track_id)
);