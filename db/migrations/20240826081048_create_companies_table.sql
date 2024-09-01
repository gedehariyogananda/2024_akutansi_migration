-- migrate:up

SET TIME ZONE 'Asia/Jakarta';
CREATE TABLE companies (
    id integer not null primary key generated always as identity,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    image_company VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO companies (name, address, image_company, created_at, updated_at) VALUES
('PT Ari Ganteng', 'Jl. Merdeka No. 1, Jakarta', 'nusantara_jaya.png', now(), now());

-- migrate:down
DROP TABLE companies;
