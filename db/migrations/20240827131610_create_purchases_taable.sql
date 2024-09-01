-- migrate:up

CREATE TABLE purchases (
    id integer not null primary key generated always as identity,
    total_purchase_amount decimal(10,2) not null,
    company_id integer not null,
    created_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE purchases;

