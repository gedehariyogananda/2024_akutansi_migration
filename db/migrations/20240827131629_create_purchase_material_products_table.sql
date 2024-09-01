-- migrate:up

CREATE TABLE purchase_material_products (
    purchase_id integer NOT NULL,
    material_product_id integer NOT NULL,
    unit_price decimal(10,2) NOT NULL,
    quantity_purchase integer NOT NULL, 
    company_id integer NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES purchases(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (material_product_id) REFERENCES material_products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- migrate:down
DROP TABLE purchase_material_products;

