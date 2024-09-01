-- migrate:up

CREATE TABLE material_products (
    id integer not null primary key generated always as identity,
    material_product_name varchar(255) not null,
    stock_type_id integer not null,
    is_available_for_sale boolean not null default false,
    unit_price_for_selling decimal(10,2) NULL,
    total_stock integer not null,
    company_id integer not null,
    created_at TIMESTAMP WITH TIME ZONE,
    foreign key (stock_type_id) references stock_types (id),
    foreign key (company_id) references companies (id) on delete cascade on update cascade

);

INSERT INTO material_products (material_product_name, stock_type_id, is_available_for_sale, unit_price_for_selling, total_stock, company_id, created_at) VALUES
('Susu', 3, false, NULL, 100, 1, now()),     -- Stock type: liter
('Garam', 4, false, NULL, 2000, 1, now()),   -- Stock type: gram
('Gula', 4, false, NULL, 1500, 1, now()),    -- Stock type: gram
('Kopi Bubuk', 4, false, NULL, 500, 1, now()), -- Stock type: gram
('Syrup', 2, false, NULL, 50, 1, now()),     -- Stock type: botol
('Teh Celup', 6, false, NULL, 100, 1, now()),  -- Stock type: pak
('Air Mineral', 2, true, 5000.00, 500, 1, now()); -- Stock type: botol

-- migrate:down
DROP TABLE material_products;

-- unit_price null, terisi if is_available_for_sale true

