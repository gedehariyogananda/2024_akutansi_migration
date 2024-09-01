-- migrate:up

CREATE TABLE saleable_products (
    id integer not null primary key generated always as identity,
    product_name varchar(255) not null,
    unit_price decimal(10,2) NOT NULL,
    company_id integer NOT NULL,
    category_id integer NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO saleable_products (product_name, unit_price, company_id, category_id, created_at, updated_at) VALUES
('Cappuccino', 30000.00, 1, 2, now(), now()),
('Espresso', 25000.00, 1, 2, now(), now()),
('Latte', 35000.00, 1, 2, now(), now()),
('Mocha', 40000.00, 1, 2, now(), now()),
('Americano', 27000.00, 1, 2, now(), now()),
('Croissant', 15000.00, 1, 1, now(), now());



-- migrate:down
DROP TABLE saleable_products;

