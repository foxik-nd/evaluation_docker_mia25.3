CREATE DATABASE IF NOT EXISTS docker_eval_db;

USE docker_eval_db;

CREATE TABLE test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(255) NOT NULL
);

INSERT INTO test_table (data) VALUES ('Data 1'), ('Data 2');