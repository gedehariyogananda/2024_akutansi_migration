-- migrate:up

CREATE TABLE user_companies (
    user_id integer NOT NULL,
    company_id integer NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO user_companies (user_id, company_id) VALUES (1,1);

-- migrate:down
DROP TABLE user_companies;

