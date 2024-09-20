-- migrate:up

SET TIME ZONE 'Asia/Jakarta';
CREATE TABLE companies (
    id VARCHAR(100) PRIMARY KEY DEFAULT uuid_generate_v4(),
    code_company VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    image_company VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO companies (id,code_company,name, address, image_company, created_at, updated_at) VALUES
('073cebf0-4c4a-5d4f-9950-5ab3feaf1894','PAT-3239','PT Ari Ganteng', 'Jl. Merdeka No. 1, Jakarta', '/company-file/1726593321.png', now(), now());

-- migrate:down
DROP TABLE companies;
