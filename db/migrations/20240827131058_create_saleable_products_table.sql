-- migrate:up

CREATE TABLE saleable_products (
    id VARCHAR(100) DEFAULT uuid_generate_v4(),
    product_name varchar(255) not null,
    unit_price decimal(10,2) NOT NULL,
    company_id VARCHAR(100) NOT NULL,
    category_id VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

INSERT INTO saleable_products (product_name, unit_price, company_id, category_id, created_at, updated_at) VALUES
('Cappuccino', 30000.00, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', '0795c197-fe7c-5fe3-b708-69fda3a060bf', now(), now()),
('Espresso', 25000.00, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', '0795c197-fe7c-5fe3-b708-69fda3a060bf', now(), now()),
('Latte', 35000.00, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', '0795c197-fe7c-5fe3-b708-69fda3a060bf', now(), now()),
('Mocha', 40000.00, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', '0795c197-fe7c-5fe3-b708-69fda3a060bf', now(), now()),
('Americano', 27000.00, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', '0795c197-fe7c-5fe3-b708-69fda3a060bf', now(), now()),
('Croissant', 15000.00, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', '078793df-0d81-51ca-9847-b4c34f506260', now(), now());



-- migrate:down
DROP TABLE saleable_products;

