-- migrate:up

CREATE TABLE invoice_saleable_products (
    invoice_id integer NOT NULL,
    saleable_product_id integer NOT NULL,
    unit_price decimal(10,2) NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (saleable_product_id) REFERENCES saleable_products(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE invoice_saleable_products;

