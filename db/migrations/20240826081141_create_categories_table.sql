-- migrate:up

CREATE TABLE categories (
    id integer not null primary key generated always as identity,
    category_name varchar(255) not null,
    company_id integer not null,
    created_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO categories (category_name, company_id, created_at) VALUES
('Makanan', 1, now()),
('Minuman', 1, now());

-- migrate:down

