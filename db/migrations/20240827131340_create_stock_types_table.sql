-- migrate:up

CREATE TABLE stock_types (
    id integer not null primary key generated always as identity,
    type_name varchar(255) not null,
    created_at TIMESTAMP WITH TIME ZONE
);

-- migrate:down
DROP TABLE stock_types;

