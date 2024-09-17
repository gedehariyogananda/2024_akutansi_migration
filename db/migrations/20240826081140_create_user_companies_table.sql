-- migrate:up

CREATE TABLE user_companies (
    user_id VARCHAR(100) NOT NULL,
    company_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (user_id, company_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO user_companies (user_id, company_id) VALUES ('048ba575-618d-5a13-9c9a-d483917e41c0', '073cebf0-4c4a-5d4f-9950-5ab3feaf1894');

-- migrate:down
DROP TABLE user_companies;
