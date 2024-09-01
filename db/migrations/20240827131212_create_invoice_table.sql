-- migrate:up

CREATE TYPE invoice_status AS ENUM ('WAITING', 'PROCESS', 'DONE', 'CANCEL');

CREATE TABLE invoices (
    id integer not null primary key generated always as identity,
    invoice_number varchar(255) not null,
    invoice_date timestamp with time zone not null,
    total_amount decimal(10,2) not null,
    status_invoice varchar(255) not null default 'WAITING',
    company_id integer not null,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE invoices;

