-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create PRODUCT table
CREATE TABLE PRODUCT (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create INVENTORY table
CREATE TABLE INVENTORY (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL REFERENCES PRODUCT(product_id) ON DELETE CASCADE,
    quantity INT NOT NULL CHECK (quantity >= 0),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data into CUSTOMER
INSERT INTO CUSTOMER (name, email, phone, address) VALUES
('João Silva', 'joao.silva@example.com', '11987654321', 'Rua das Flores, 123'),
('Maria Souza', 'maria.souza@example.com', '21987654321', 'Av. Central, 456'),
('Carlos Pereira', 'carlos.pereira@example.com', '31987654321', 'Praça das Árvores, 789'),
('Ana Oliveira', 'ana.oliveira@example.com', '41987654321', 'Rua Azul, 321'),
('Pedro Santos', 'pedro.santos@example.com', '51987654321', 'Travessa Verde, 654');

-- Insert data into PRODUCT
INSERT INTO PRODUCT (name, description, price, stock_quantity) VALUES
('Notebook', 'Notebook potente para trabalho e jogos', 4500.00, 10),
('Smartphone', 'Celular com câmera de alta resolução', 2500.00, 15),
('Mouse Gamer', 'Mouse ergonômico com DPI ajustável', 150.00, 30),
('Teclado Mecânico', 'Teclado mecânico RGB para gamers', 300.00, 20),
('Monitor 27"', 'Monitor de alta resolução para produtividade', 1200.00, 12);

-- Insert data into INVENTORY
INSERT INTO INVENTORY (product_id, quantity) VALUES
(1, 10), -- Notebook
(2, 15), -- Smartphone
(3, 30), -- Mouse Gamer
(4, 20), -- Teclado Mecânico
(5, 12); -- Monitor 27"
