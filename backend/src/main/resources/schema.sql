-- E-Commerce Database Schema
-- This file is optional as Spring Boot will auto-create tables with spring.jpa.hibernate.ddl-auto=update

CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'ROLE_USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Products Table
CREATE TABLE IF NOT EXISTS products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    category VARCHAR(50) NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category),
    INDEX idx_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Carts Table
CREATE TABLE IF NOT EXISTS carts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Cart Items Table
CREATE TABLE IF NOT EXISTS cart_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    UNIQUE KEY unique_cart_product (cart_id, product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Orders Table
CREATE TABLE IF NOT EXISTS orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    shipping_address VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    INDEX idx_user_id (user_id),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Order Items Table
CREATE TABLE IF NOT EXISTS order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert Default Admin User (password: admin123)
INSERT INTO users (name, email, password, role)
VALUES ('Admin User', 'admin@ecommerce.com', '$2a$10$XzqEwVhkxT8w.3bEYRHCweVFvCJZ9yHPXqKLmJUJKqQxJQ5YpXx9e', 'ROLE_ADMIN')
ON DUPLICATE KEY UPDATE name=name;

-- Insert Sample Products
INSERT INTO products (name, description, price, stock_quantity, category, image_url) VALUES
('Apple iPhone 15 Pro', 'The latest iPhone with A17 Pro chip, titanium design, and advanced camera system', 999.99, 50, 'Electronics', 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500'),
('Samsung Galaxy S24 Ultra', 'Premium Android smartphone with S Pen, 200MP camera, and AI features', 1199.99, 45, 'Electronics', 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=500'),
('Sony WH-1000XM5 Headphones', 'Industry-leading noise canceling wireless headphones', 399.99, 100, 'Electronics', 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=500'),
('MacBook Pro 16"', 'Powerful laptop with M3 Pro chip, 16GB RAM, 512GB SSD', 2499.99, 30, 'Computers', 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500'),
('Dell XPS 15', 'Premium Windows laptop with Intel Core i7, 16GB RAM, 512GB SSD', 1799.99, 35, 'Computers', 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500'),
('iPad Air', 'Powerful tablet with M1 chip, 10.9-inch Liquid Retina display', 599.99, 60, 'Tablets', 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500'),
('Samsung Galaxy Tab S9', 'Premium Android tablet with S Pen and 11-inch display', 799.99, 40, 'Tablets', 'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=500'),
('Apple Watch Series 9', 'Advanced smartwatch with health monitoring and fitness tracking', 429.99, 80, 'Wearables', 'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?w=500'),
('Fitbit Charge 6', 'Fitness tracker with heart rate monitoring and GPS', 159.99, 120, 'Wearables', 'https://images.unsplash.com/photo-1575311373937-040b8e1fd5b6?w=500'),
('Logitech MX Master 3S', 'Advanced wireless mouse with ergonomic design', 99.99, 150, 'Accessories', 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500'),
('Keychron K2 Mechanical Keyboard', 'Compact wireless mechanical keyboard for Mac and Windows', 89.99, 90, 'Accessories', 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500'),
('Anker PowerCore 20000mAh', 'High-capacity portable charger for smartphones and tablets', 49.99, 200, 'Accessories', 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c5?w=500')
ON DUPLICATE KEY UPDATE name=name;
