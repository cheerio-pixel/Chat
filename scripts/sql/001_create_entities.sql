CREATE SCHEMA chat;

CREATE TABLE chat.__version (
    version INTEGER PRIMARY KEY,
    description VARCHAR NOT NULL
)

CREATE TABLE chat.user (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL UNIQUE
);

-- As in Chat Room
CREATE TABLE chat.room (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE chat.user_room (
    user_id INTEGER NOT NULL REFERENCES user(id),
    room_id INTEGER NOT NULL REFERENCES room(Id),
    PRIMARY KEY (room_id, user_id)
);

CREATE TABLE chat.message (
    id SERIAL PRIMARY KEY,
    room_id INTEGER NOT NULL REFERENCES room(id),
    owner_id INTEGER NOT NULL REFERENCES user(id),
    created_at TIMESTAMPZ DEFAULT NOW(),
    content TEXT NOT NULL
);


INSERT INTO chat.__version(id, description)
VALUES (1, 'create_entities')
