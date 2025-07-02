# OnlineStreamingPlatform

**OnlineStreamingPlatform** is a project developed for Yandex Practicum.  
It is an online cinema platform built with Python and PostgreSQL.

## Installation

> Add installation instructions here later if needed, e.g.:
> ```bash
> pip install -r requirements.txt
> ```

## `load_persons.py`

This script populates the PostgreSQL database with fake data.  
By default, it inserts **100,000 persons** into the `person` table and links them to films via the `person_film_work` table.

You can customize the number of records by editing the `PERSONS_COUNT` variable inside the script.

## `movies_database.ddl`

This file contains the **SQL schema** used to create the core tables of the database.

### Included tables:
- `film_work`
- `genre`
- `person`
- `genre_film_work` (many-to-many relation between films and genres)
- `person_film_work` (many-to-many relation between films and persons with roles)

The schema uses attributes and structures recommended in the Yandex Practicum course materials.