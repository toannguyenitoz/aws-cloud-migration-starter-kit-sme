CREATE DATABASE IF NOT EXISTS scos_portal;
USE scos_portal;

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sku VARCHAR(30) NOT NULL,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

INSERT INTO products (sku, name, price) VALUES
('PAPER-A4-001', 'A4 Copy Paper Box', 29.95),
('PEN-BLK-010', 'Black Ballpoint Pens Pack', 8.50),
('CHAIR-ERG-100', 'Ergonomic Office Chair', 189.00);
