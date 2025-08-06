-- --------------------------------------------------------
-- Host:                         34.136.39.89
-- Server version:               8.0.31-google - (Google)
-- Server OS:                    Linux
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for books
CREATE DATABASE IF NOT EXISTS `books` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `books`;

-- Dumping structure for table books.books
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table books.books: ~0 rows (approximately)
DELETE FROM `books`;

-- Dumping structure for table books.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table books.order_details: ~38 rows (approximately)
DELETE FROM `order_details`;
INSERT INTO `order_details` (`name`, `email`, `phone_number`, `quantity`, `item_name`) VALUES
	('venkat', 'venkat@gmail.com', '7702665058', 1, NULL),
	('rajesh', 'rajesh@admin.com', '7702665058', 10, NULL),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@gmail.com', '07702664058', 11, NULL),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 11, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 2, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 2, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 2, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 3, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 2, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 2, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 1, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 1, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 2, 'non-veg starter'),
	('venkatasuresh.bukka', 'venkatasuresh.bukka@dxc.com', '7702665058', 4, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '3213131', 22, 'non-veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '3213131', 22, 'non-veg starter'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 22, 'soup'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 3, 'veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '21', 2, 'non-veg starter'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 3, 'veg starter'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 3, 'veg starter'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 1, 'veg starter'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '07702664058', 1, 'non-veg starter'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 111, 'biryani'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 1, 'soup'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 2, 'Fish and sea food'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 22, 'noodles'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 12, 'salads'),
	('venkatasuresh.bukka@dxc.com', 'venkatasuresh.bukka@dxc.com', '7702665058', 12, 'non-veg starter'),
	('Venkata Suresh Bukka', 'venkatasuresh.bukka@dxc.com', '07702664058', 20, 'veg starter'),
	('Raj', 'raj@gmail.com', '9875678765', 2, 'soup'),
	('venkat', 'venkat@gmail.com', '7702665058', 21, 'non-veg starter'),
	('robin', 'robin@gmail.com', '07702664058', 1, 'soup'),
	('Sumanth', 'sumanth@admin.com', '8125356545', 10, 'non-veg starter'),
	('Sumanth', 'sumanth@admin.com', '8125356545', 20, 'non-veg starter'),
	('Sumanth', 'sumanth@admin.com', '8125356545', 30, 'non-veg starter'),
	('Sumanth', 'sumanth@admin.com', '8125356545', 5, 'non-veg starter'),
	('Sumanth', 'sumanth@admin.com', '8125356545', 5, 'non-veg starter');

-- Dumping structure for table books.students
CREATE TABLE IF NOT EXISTS `students` (
  `stu_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `book_taken` varchar(255) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table books.students: ~0 rows (approximately)
DELETE FROM `students`;

-- Dumping structure for table books.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table books.users: ~6 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`username`, `email`, `password`, `id`) VALUES
	('venkat', 'venkat@gmail.com', 'venkat', NULL),
	('rajesh', 'rajesh@admin.com', 'rajesh', NULL),
	('venkat', 'venkat1@gmail.com', '123', NULL),
	('robin', 'venkat.work.0007@gmail.com', '123', NULL),
	('robin', 'robin@gmail.com', '123', NULL),
	('Sumanth', 'sumanth@admin.com', 'sam', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
