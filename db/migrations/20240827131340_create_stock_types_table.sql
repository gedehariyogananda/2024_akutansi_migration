-- migrate:up

CREATE TABLE stock_types (
    id VARCHAR(100) DEFAULT uuid_generate_v4(),
    type_name varchar(255) not null,
    created_at TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (id)
);

INSERT INTO stock_types (id, type_name, created_at) VALUES
('0f293ddb-c359-5797-9117-07a72959f8b3','pcs', now()),
('15b7989c-2cd4-50ee-9e6d-88b75273faa0','botol', now()),
('180f3cd3-82fe-5e68-899c-1e29a9c59c82','liter', now()),
('1e3bf0ac-7406-55bf-b355-5dfecaf3aafe','gram', now()),
('1f654328-6696-57c7-a158-e13cfb6921d9','kg', now()),
('206309ec-430f-5c95-9ce8-2531264b1cd7','pak', now());

-- migrate:down
DROP TABLE stock_types;

