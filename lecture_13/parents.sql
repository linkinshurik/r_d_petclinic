CREATE TABLE Parents (
    parent_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    child_id INT NOT NULL,
    tuition_fee NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (child_id) REFERENCES Children(child_id)
);