CREATE DATABASE DigitalProductWebsiteData

USE DigitalProductWebsiteData

-- Create the "users" table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100)
);

-- Create the "products" table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description VARCHAR(500),
    category VARCHAR(50)
);

-- Create the "downloads" table
CREATE TABLE downloads (
    download_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    download_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
