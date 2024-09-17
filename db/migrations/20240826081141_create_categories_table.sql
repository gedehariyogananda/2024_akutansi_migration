-- migrate:up

CREATE TABLE categories (
    id VARCHAR(100) DEFAULT uuid_generate_v4(),
    category_name varchar(255) not null,
    company_id VARCHAR(100) not null,
    created_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

INSERT INTO categories (id, category_name, company_id, created_at) VALUES
('078793df-0d81-51ca-9847-b4c34f506260','Makanan', '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),
('0795c197-fe7c-5fe3-b708-69fda3a060bf','Minuman', '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now());

-- migrate:down

