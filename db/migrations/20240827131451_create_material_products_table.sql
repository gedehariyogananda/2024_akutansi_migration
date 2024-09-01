-- migrate:up

CREATE TABLE material_products (
    id integer not null primary key generated always as identity,
    material_product_name varchar(255) not null,
    stock_type_id integer not null,
    is_available_for_sale boolean not null default false,
    unit_price decimal(10,2) NULL
    total_stock integer not null,
    company_id integer not null,
    created_at TIMESTAMP WITH TIME ZONE,
    foreign key (stock_type_id) references stock_types (id),
    foreign key (company_id) references companies (id) on delete cascade on update cascade

);

-- migrate:down
DROP TABLE material_products;

-- unit_price null, terisi if is_available_for_sale true

