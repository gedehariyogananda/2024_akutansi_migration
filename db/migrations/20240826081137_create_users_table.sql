-- migrate:up

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

SET TIME ZONE 'Asia/Jakarta';
CREATE TABLE users (
    id VARCHAR(100) PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255) NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO users (id,username, phone, name, email, password, token, created_at, updated_at) VALUES
('048ba575-618d-5a13-9c9a-d483917e41c0','ari','083133737660', 'ari', 'ari@gmail.com', '$2a$10$PI9hV1gmxXWUVRDHwQSrT.VOkggfLRTGvYVduPDVXd8upkoqqyfkC', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21wYW55SWQiOiIwNzNjZWJmMC00YzRhLTVkNGYtOTk1MC01YWIzZmVhZjE4OTQiLCJleHAiOjE3MzQzNjk2MTgsInVzZXJJZCI6IjA0OGJhNTc1LTYxOGQtNWExMy05YzlhLWQ0ODM5MTdlNDFjMCJ9.iDN5miZViGXW9SjKVlgjN3-blDYFKE6eRU1ZPcdonfw', now(), now());

-- migrate:down
DROP TABLE users;
