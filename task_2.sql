-- Database table creation script for alx_book_store
-- All SQL keywords in uppercase as required

USE alx_book_store;

CREATE TABLE IF NOT EXISTS Authors (
    author_id INT NOT NULL,
    author_name VARCHAR(215) NOT NULL,
    PRIMARY KEY (author_id)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS Books (
    book_id INT NOT NULL,
    title VARCHAR(130) NOT NULL,
    author_id INT DEFAULT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE DEFAULT NULL,
    PRIMARY KEY (book_id),
    KEY (author_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT NOT NULL,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) DEFAULT NULL,
    address TEXT DEFAULT NULL,
    PRIMARY KEY (customer_id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT NOT NULL,
    customer_id INT DEFAULT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (order_id),
    KEY (customer_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT NOT NULL,
    order_id INT DEFAULT NULL,
    book_id INT DEFAULT NULL,
    quantity DOUBLE NOT NULL,
    PRIMARY KEY (orderdetailid),
    KEY (order_id),
    KEY (book_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;