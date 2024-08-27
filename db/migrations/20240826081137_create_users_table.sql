-- migrate:up

SET TIME ZONE 'Asia/Jakarta';
CREATE TABLE users (
    id integer not null primary key generated always as identity,
    username VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    company_id integer not null,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE users;
