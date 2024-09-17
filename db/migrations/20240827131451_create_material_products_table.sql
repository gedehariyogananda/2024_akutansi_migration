-- migrate:up

CREATE TABLE material_products (
    id VARCHAR(100) DEFAULT uuid_generate_v4(),
    material_product_name varchar(255) not null,
    stock_type_id VARCHAR(100) not null,
    is_available_for_sale boolean not null default false,
    unit_price_for_selling decimal(10,2) NULL,
    total_stock integer not null,
    company_id VARCHAR(100) not null,
    created_at TIMESTAMP WITH TIME ZONE,
    foreign key (stock_type_id) references stock_types (id),
    foreign key (company_id) references companies (id) on delete cascade on update cascade,
    primary key (id)

);

INSERT INTO material_products (material_product_name, stock_type_id, is_available_for_sale, unit_price_for_selling, total_stock, company_id, created_at) VALUES
('Susu', '180f3cd3-82fe-5e68-899c-1e29a9c59c82', false, NULL, 100, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),     -- Stock type: liter
('Garam', '1e3bf0ac-7406-55bf-b355-5dfecaf3aafe', false, NULL, 2000, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),   -- Stock type: gram
('Gula', '1e3bf0ac-7406-55bf-b355-5dfecaf3aafe', false, NULL, 1500, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),    -- Stock type: gram
('Kopi Bubuk', '1e3bf0ac-7406-55bf-b355-5dfecaf3aafe', false, NULL, 500, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()), -- Stock type: gram
('Syrup', '15b7989c-2cd4-50ee-9e6d-88b75273faa0', false, NULL, 50, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),     -- Stock type: botol
('Teh Celup', '206309ec-430f-5c95-9ce8-2531264b1cd7', false, NULL, 100, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),  -- Stock type: pak
('Air Mineral', '15b7989c-2cd4-50ee-9e6d-88b75273faa0', true, 5000.00, 500, '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()); -- Stock type: botol

-- migrate:down
DROP TABLE material_products;

-- unit_price null, terisi if is_available_for_sale true

