create  database nyavalleycurio
use nyavalleycurio

-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    login_credentials VARCHAR(255),
    customer_info TEXT,
    registration_date DATE
);

-- Curios table (single store managed by you)
CREATE TABLE Curios (
    curio_id INT PRIMARY KEY,
    curio_name VARCHAR(255),
    curio_description TEXT,
    curio_type VARCHAR(50), -- e.g., Wooden Carving, Stone Carving, Beaded Necklace, Painting, Antique
    rarity_level VARCHAR(50), -- e.g., Common, Rare, Very Rare
    origin_country VARCHAR(100),
    material VARCHAR(100), -- e.g., Wood, Stone, Beads, Canvas
    price DECIMAL(10, 2),
    creation_date DATE, -- Relevant for antiques and paintings
    stock_quantity INT -- Tracks available items
);

-- Shopping Cart table
CREATE TABLE Shopping_Cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    curio_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (curio_id) REFERENCES Curios(curio_id)
);

-- Shopping Requests table
CREATE TABLE Shopping_Requests (
    request_id INT PRIMARY KEY,
    customer_id INT,
    curio_id INT,
    request_date DATE,
    request_details TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (curio_id) REFERENCES Curios(curio_id)
);

-- Shopping History table
CREATE TABLE Shopping_History (
    history_id INT PRIMARY KEY,
    customer_id INT,
    request_id INT,
    purchase_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (request_id) REFERENCES Shopping_Requests(request_id)
);

-- Credit Verification table
CREATE TABLE Credit_Verification (
    verification_id INT PRIMARY KEY,
    customer_id INT,
    credit_card_info TEXT,
    verification_status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Shipping table
CREATE TABLE Shipping (
    shipping_id INT PRIMARY KEY,
    request_id INT,
    shipping_date DATE,
    shipping_status VARCHAR(50),
    FOREIGN KEY (request_id) REFERENCES Shopping_Requests(request_id)
);

-- E-Commerce Admin table (you as the admin)
CREATE TABLE E_Commerce_Admin (
    admin_id INT PRIMARY KEY,
    login_credentials VARCHAR(255)
);

-- Comments table
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    customer_id INT,
    comment_text TEXT,
    comment_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255), -- e.g., Wooden Carvings, Stone Carvings, Beaded Jewelry, Paintings, Antiques
    curio_subtype VARCHAR(100) -- e.g., Tribal Carving, Sculpted Stone, Handmade Beads
);
