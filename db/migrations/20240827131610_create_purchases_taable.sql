-- migrate:up

CREATE TABLE purchases (
    id VARCHAR(100) DEFAULT uuid_generate_v4(),
    total_purchase_amount decimal(10,2) not null,
    company_id VARCHAR(100) not null,
    created_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

-- migrate:down
DROP TABLE purchases;

