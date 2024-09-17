-- migrate:up

CREATE TYPE invoice_status AS ENUM ('WAITING', 'PROCESS', 'DONE', 'CANCEL');

CREATE TABLE invoices (
    id VARCHAR(100) DEFAULT uuid_generate_v4(),
    invoice_customer varchar(255) not null,
    invoice_number varchar(255) not null,
    invoice_date timestamp with time zone not null,
    total_amount decimal(10,2) not null,
    money_received decimal(10,2) null,
    status_invoice varchar(255) not null default 'WAITING',
    company_id VARCHAR(100) not null,
    payment_method_id VARCHAR(100) not null,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods (id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

-- migrate:down
DROP TABLE invoices;

