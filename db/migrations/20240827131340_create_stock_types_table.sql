-- migrate:up

CREATE TABLE stock_types (
    id integer not null primary key generated always as identity,
    type_name varchar(255) not null,
    created_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO stock_types (type_name, created_at) VALUES
('pcs', now()),
('botol', now()),
('liter', now()),
('gram', now()),
('kg', now()),
('pak', now());

-- migrate:down
DROP TABLE stock_types;

