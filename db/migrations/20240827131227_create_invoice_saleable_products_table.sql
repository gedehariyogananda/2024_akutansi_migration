-- migrate:up

CREATE TABLE invoice_saleable_products (
    invoice_id VARCHAR(100) NOT NULL,
    saleable_product_id VARCHAR(100) NOT NULL,
    quantity_sold integer NOT NULL, 
    company_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (invoice_id,saleable_product_id, company_id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (saleable_product_id) REFERENCES saleable_products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE invoice_saleable_products;

