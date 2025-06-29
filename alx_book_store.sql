-- ALX Book Store Database Schema
-- File: alx_book_store.sql
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    TIME_ZONE = "+00:00";

-- CREATE THE REQUIRED DATABASE
CREATE DATABASE IF NOT EXISTS `alx_book_store` DEFAULT CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_general_ci;

-- CREATE TABLES WITHIN THE DATABASE
CREATE TABLE
    `alx_book_store`.`authors` (
        `author_id` INT (11) NOT NULL,
        `author_name` VARCHAR(215) NOT NULL,
        PRIMARY KEY (`author_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE
    `alx_book_store`.`customers` (
        `customer_id` INT (11) NOT NULL,
        `customer_name` VARCHAR(215) NOT NULL,
        `email` VARCHAR(215) DEFAULT NULL,
        `address` TEXT DEFAULT NULL,
        PRIMARY KEY (`customer_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE
    `alx_book_store`.`books` (
        `book_id` INT (11) NOT NULL,
        `title` VARCHAR(130) NOT NULL,
        `author_id` INT (11) DEFAULT NULL,
        `price` DOUBLE NOT NULL,
        `publication_date` DATE DEFAULT NULL,
        PRIMARY KEY (`book_id`),
        INDEX `author_id` (`author_id`),
        CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `alx_book_store`.`authors` (`author_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE
    `alx_book_store`.`orders` (
        `order_id` INT (11) NOT NULL,
        `customer_id` INT (11) DEFAULT NULL,
        `order_date` DATE NOT NULL,
        PRIMARY KEY (`order_id`),
        INDEX `customer_id` (`customer_id`),
        CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `alx_book_store`.`customers` (`customer_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE
    `alx_book_store`.`order_details` (
        `orderdetailid` INT (11) NOT NULL,
        `order_id` INT (11) DEFAULT NULL,
        `book_id` INT (11) DEFAULT NULL,
        `quantity` DOUBLE NOT NULL,
        PRIMARY KEY (`orderdetailid`),
        INDEX `order_id` (`order_id`),
        INDEX `book_id` (`book_id`),
        CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `alx_book_store`.`orders` (`order_id`),
        CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `alx_book_store`.`books` (`book_id`)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

COMMIT;