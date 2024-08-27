-- migrate:up

CREATE TABLE material_products (
    id integer not null primary key generated always as identity,
    material_product_name varchar(255) not null,
    stock_type_id integer not null,
    is_available_for_sale boolean not null default false,
    created_at TIMESTAMP WITH TIME ZONE,
    foreign key (stock_type_id) references stock_types (id)
);

-- migrate:down
DROP TABLE material_products;

