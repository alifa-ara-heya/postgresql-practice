CREATE TABLE "user" ( --user is a reserved keyword, hence the double quote
    id SERIAL PRIMARY KEY,
    userName VARCHAR(25) NOT NULL
)

-- on delete cascade
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL, --text type because we don't want to limit the user
    user_id INTEGER REFERENCES "user" (id) ON DELETE CASCADE --so that if the user_id gets deleted, the posts made by the user will also be deleted
);

-- on delete null
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL, --text type because we don't want to limit the user
    user_id INTEGER REFERENCES "user" (id) ON DELETE SET NULL --so that if the user_id gets deleted, the posts made by the user will be Null
);

-- on delete set default
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL, --text type because we don't want to limit the user
    user_id INTEGER REFERENCES "user" (id) ON DELETE SET DEFAULT DEFAULT 2 --so that if the user_id gets deleted, the posts made by the user will have a default user with id 2.
);

ALTER TABLE post ALTER COLUMN user_id SET NOT NULL;

DROP TABLE post;

DROP TABLE "user";

INSERT INTO
    "user" (username)
VALUES ('ayesha'),
    ('fatima'),
    ('khadija'),
    ('maryam');

SELECT * FROM "user";

SELECT * FROM post;

INSERT INTO
    post (title, user_id)
VALUES ('My first post!', 1),
    ('Just another update!', 2),
    ('Learning SQL is fun!', 3),
    ('Post number four!', 4),
    ('Quick post for practice.', 2);

INSERT INTO post (title, user_id) VALUES ('test', NULL)

-- deletion constraint
--restrict deletion- on Delete no action/ on delete restrict (default) -if there is a column in our table which is used by another table as foreign key, then we cannot delete the table

DELETE FROM "user" WHERE id = 4;
-- error if we keep the default value, but will work if we use on delete cascade, on delete set null