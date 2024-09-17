-- migrate:up

CREATE TABLE payment_methods (
    id VARCHAR(100) DEFAULT uuid_generate_v4(),
    method_name varchar(255) not null,
    company_id VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id)
);

INSERT INTO payment_methods (method_name, company_id, created_at) VALUES
('Cash', '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),
('Credit Card', '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),
('Debit Card', '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now()),
('E-Wallet', '073cebf0-4c4a-5d4f-9950-5ab3feaf1894', now());


-- migrate:down

