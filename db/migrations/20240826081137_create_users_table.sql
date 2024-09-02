-- migrate:up

SET TIME ZONE 'Asia/Jakarta';
CREATE TABLE users (
    id integer not null primary key generated always as identity,
    username VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255) NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO users (username, phone, name, email, password, token, created_at, updated_at) VALUES
('ari','083133737660', 'ari', 'ari@gmail.com', 'password', 'tokencheck', now(), now());

-- migrate:down
DROP TABLE users;
