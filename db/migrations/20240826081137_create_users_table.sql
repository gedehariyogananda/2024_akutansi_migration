-- migrate:up

SET TIME ZONE 'Asia/Jakarta';
CREATE TABLE users (
    id integer not null primary key generated always as identity,
    username VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    company_id integer null,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255) NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO users (username, name, company_id, email, password, token, created_at, updated_at) VALUES
('ari', 'ari', 1, 'ari@gmail.com', 'password', 'tokencheck', now(), now());

-- migrate:down
DROP TABLE users;
