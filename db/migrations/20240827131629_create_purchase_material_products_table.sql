-- migrate:up

CREATE TABLE purchase_material_products (
    purchase_id VARCHAR(100) NOT NULL,
    material_product_id VARCHAR(100) NOT NULL,
    unit_price decimal(10,2) NOT NULL,
    quantity_purchase integer NOT NULL, 
    company_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (purchase_id, material_product_id, company_id),
    FOREIGN KEY (purchase_id) REFERENCES purchases(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (material_product_id) REFERENCES material_products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE purchase_material_products;

