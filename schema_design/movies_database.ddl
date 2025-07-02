-- Таблица фильмов
CREATE TABLE IF NOT EXISTS content.film_work (
    id UUID PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    creation_date DATE,
    rating FLOAT,
    type TEXT,
    created TIMESTAMP WITH TIME ZONE,
    modified TIMESTAMP WITH TIME ZONE
);

-- Таблица жанров
CREATE TABLE IF NOT EXISTS content.genre (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created TIMESTAMP WITH TIME ZONE,
    modified TIMESTAMP WITH TIME ZONE
);

-- Таблица персон (актёры, режиссёры и т.д.)
CREATE TABLE IF NOT EXISTS content.person (
    id UUID PRIMARY KEY,
    full_name TEXT NOT NULL,
    created TIMESTAMP WITH TIME ZONE,
    modified TIMESTAMP WITH TIME ZONE
);

-- Промежуточная таблица жанр <-> фильм
CREATE TABLE IF NOT EXISTS content.genre_film_work (
    id UUID PRIMARY KEY,
    genre_id UUID NOT NULL,
    film_work_id UUID NOT NULL,
    created TIMESTAMP WITH TIME ZONE,

    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES content.genre(id) ON DELETE CASCADE,
    CONSTRAINT fk_film_work FOREIGN KEY (film_work_id) REFERENCES content.film_work(id) ON DELETE CASCADE,
    CONSTRAINT uniq_genre_film UNIQUE (genre_id, film_work_id)
);

-- Промежуточная таблица персона <-> фильм
CREATE TABLE IF NOT EXISTS content.person_film_work (
    id UUID PRIMARY KEY,
    person_id UUID NOT NULL,
    film_work_id UUID NOT NULL,
    role TEXT NOT NULL,
    created TIMESTAMP WITH TIME ZONE,

    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES content.person(id) ON DELETE CASCADE,
    CONSTRAINT fk_film_work_person FOREIGN KEY (film_work_id) REFERENCES content.film_work(id) ON DELETE CASCADE,
    CONSTRAINT uniq_person_film_work UNIQUE (person_id, film_work_id, role)
);
