-- migrate:up

CREATE TABLE invoices (
    id integer not null primary key generated always as identity,
    invoice_number varchar(255) not null,
    invoice_date timestamp with time zone not null,
    total_amount decimal(10,2) not null,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

-- migrate:down
DROP TABLE invoices;

