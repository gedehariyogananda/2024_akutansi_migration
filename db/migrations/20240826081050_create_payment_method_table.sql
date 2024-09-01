-- migrate:up

CREATE TABLE payment_methods (
    id integer not null primary key generated always as identity,
    method_name varchar(255) not null,
    company_id integer NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE
);

INSERT INTO payment_methods (method_name, company_id, created_at) VALUES
('Cash', 1, now()),
('Credit Card', 1, now()),
('Debit Card', 1, now()),
('E-Wallet', 1, now());


-- migrate:down

