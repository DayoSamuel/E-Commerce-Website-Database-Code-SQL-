CREATE DATABASE  OnlineStoreData

USE OnlineStoreData
-- Table for userS
CREATE TABLE users (
  user_id INT IDENTITY(1,1) PRIMARY KEY,
  email NVARCHAR(50) NOT NULL,
  password NVARCHAR(50) NOT NULL,
  first_name NVARCHAR(50) NOT NULL,
  last_name NVARCHAR(50) NOT NULL,
  address NVARCHAR(50) NOT NULL,
  city NVARCHAR(50) NOT NULL,
  state_province NVARCHAR(50) NOT NULL,
  zip_postal_code NVARCHAR(20) NOT NULL,
  country NVARCHAR(50) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);

-- Table for products

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  product_description TEXT NOT NULL,
  product_image_url VARCHAR(200) NOT NULL,
  product_price DECIMAL(10,2) NOT NULL,
  product_category VARCHAR(50) NOT NULL
);

-- Table for reviews

CREATE TABLE reviews (
  review_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  user_id INT NOT NULL,
  review_text TEXT NULL,
  rating INT NULL,
  review_date DATE NULL,
  FOREIGN KEY (product_id) REFERENCES products(product_id) ,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table for orders

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  user_id INT NOT NULL,
  order_date DATE NOT NULL,
  order_total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table for order_items

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table for payments

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  payment_date DATE NOT NULL,
  payment_method VARCHAR(50) NOT NULL,
  payment_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Table for shippping

CREATE TABLE shipping (
  shipping_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  shipping_date DATE NULL,
  shipping_method VARCHAR(50) NULL,
  tracking_number VARCHAR(50) NOT NULL,
  shipping_address VARCHAR(200) NOT NULL,
  shipping_city VARCHAR(50)NOT NULL,
  shipping_state_province VARCHAR(50)NOT NULL,
  shipping_zip_postal_code VARCHAR(20)NOT NULL,
  shipping_country VARCHAR(50) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

