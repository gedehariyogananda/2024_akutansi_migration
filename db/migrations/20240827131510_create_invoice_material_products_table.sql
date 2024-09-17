-- migrate:up

CREATE TABLE invoice_material_products (
    invoice_id VARCHAR(100) NOT NULL,
    material_product_id VARCHAR(100) NOT NULL,
    quantity_sold integer NOT NULL,
    company_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (invoice_id, material_product_id, company_id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (material_product_id) REFERENCES material_products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE invoice_material_products;

