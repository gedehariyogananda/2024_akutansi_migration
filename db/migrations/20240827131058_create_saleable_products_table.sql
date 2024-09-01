-- migrate:up

CREATE TABLE saleable_products (
    id integer not null primary key generated always as identity,
    product_name varchar(255) not null,
    unit_price decimal(10,2) NOT NULL,
    company_id integer NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE saleable_products;

