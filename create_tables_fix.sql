CREATE TABLE IF NOT EXISTS genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS compilations (
    compilation_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks (
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    duration_seconds INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS artist_genres (
    artist_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE IF NOT EXISTS album_artists (
    album_id INTEGER NOT NULL,
    artist_id INTEGER NOT NULL,
    PRIMARY KEY (album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE IF NOT EXISTS compilation_tracks (
    compilation_id INTEGER NOT NULL,
    track_id INTEGER NOT NULL,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES compilations(compilation_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);