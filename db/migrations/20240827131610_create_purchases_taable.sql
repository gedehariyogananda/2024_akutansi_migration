-- migrate:up

CREATE TABLE purchases (
    id integer not null primary key generated always as identity,
    total_purchase_amount decimal(10,2) not null,
    created_at TIMESTAMP WITH TIME ZONE
);

-- migrate:down
DROP TABLE purchases;

