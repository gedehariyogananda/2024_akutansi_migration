-- migrate:up

CREATE TABLE saleable_products (
    id integer not null primary key generated always as identity,
    product_name varchar(255) not null,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

-- migrate:down
DROP TABLE saleable_products;

