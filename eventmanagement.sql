-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2020 at 08:54 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `Category_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Category_name`) VALUES
(1, 'Concert'),
(2, 'Health and Fitness'),
(3, 'Leadership Training'),
(4, 'Info'),
(5, 'art and exhibition'),
(6, 'Makeup training');

-- --------------------------------------------------------

--
-- Table structure for table `categories_events`
--

CREATE TABLE `categories_events` (
  `id` int(11) NOT NULL DEFAULT 0,
  `category_name` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `total_tickets` int(15) DEFAULT NULL,
  `rate_per_ticket` int(15) DEFAULT NULL,
  `event_venue` varchar(45) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories_events`
--

INSERT INTO `categories_events` (`id`, `category_name`, `name`, `total_tickets`, `rate_per_ticket`, `event_venue`, `event_date`, `event_time`) VALUES
(1, 'Concert', 'Nepathtya', 7990, 1000, 'Gaucharan', '2020-02-14', '19:00:00'),
(3, 'Leadership Training', 'Anuradha Koirala', 500, 200, 'Sorakhutte', '2020-01-10', '01:30:00'),
(2, 'Health and Fitness', 'Ram Dev', 1000, 500, 'Tudikhel', '2020-02-03', '07:00:00'),
(5, 'art and exhibition', 'Vincent Van Gogh', 4560, 800, 'Lod', '2020-01-27', '15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Phone_number` varchar(15) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `Name`, `Phone_number`, `Address`, `Gender`) VALUES
(1, 'Yamima Moktan', '9852021368', 'Balaju', 'Female'),
(3, 'Suraj Pulami Magar', '9801555555', 'Koldhunga', 'Male'),
(4, 'Ayusha karki', '9856309876', 'Bhaktapur', 'Female'),
(5, 'Manju Munikar', '9870654123', 'Kalopul', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `customer_event_ticket`
--

CREATE TABLE `customer_event_ticket` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(30) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  `order_quantity` int(15) DEFAULT NULL,
  `total_amount` int(11) NOT NULL,
  `Customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_event_ticket`
--

INSERT INTO `customer_event_ticket` (`id`, `name`, `phone_number`, `event_id`, `book_date`, `order_quantity`, `total_amount`, `Customer_id`) VALUES
(1, 'Yamima Moktan', '9852021368', 1, '2020-02-05', 10, 9000, 1),
(1, 'Yamima Moktan', '9852021368', 3, '2020-01-31', 6, 6000, 1),
(3, 'Suraj Pulami Magar', '9801555555', 2, '2020-01-08', 5, 8000, 3),
(4, 'Ayusha karki', '9856309876', 2, '2020-02-03', 20, 7050, 4);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Total_tickets` int(15) DEFAULT NULL,
  `Rate_per_ticket` int(15) DEFAULT NULL,
  `Event_venue` varchar(45) DEFAULT NULL,
  `Event_date` date DEFAULT NULL,
  `Event_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `Category_id`, `Name`, `Total_tickets`, `Rate_per_ticket`, `Event_venue`, `Event_date`, `Event_time`) VALUES
(1, 1, 'Nepathtya', 7990, 1000, 'Gaucharan', '2020-02-14', '19:00:00'),
(2, 3, 'Anuradha Koirala', 500, 200, 'Sorakhutte', '2020-01-10', '01:30:00'),
(3, 2, 'Ram Dev', 1000, 500, 'Tudikhel', '2020-02-03', '07:00:00'),
(4, 5, 'Vincent Van Gogh', 4560, 800, 'Lod', '2020-01-27', '15:00:00'),
(5, 6, 'Lemi', 100, 500, 'Kathmandu Mall', '2020-02-05', '01:00:00'),
(6, 3, 'Lemi', 100, 500, 'Kathmandu Mall', '2020-02-05', '01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `event_tickets`
--

CREATE TABLE `event_tickets` (
  `event_tickets_id` int(11) NOT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Event_id` int(11) DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  `Order_quantity` int(15) DEFAULT NULL,
  `total_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_tickets`
--

INSERT INTO `event_tickets` (`event_tickets_id`, `Customer_id`, `Event_id`, `book_date`, `Order_quantity`, `total_amount`) VALUES
(1, 1, 1, '2020-02-05', 10, 9000),
(2, 1, 3, '2020-01-31', 6, 6000),
(3, 3, 2, '2020-01-08', 5, 8000),
(4, 4, 2, '2020-02-03', 20, 7050);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Category_id` (`Category_id`);

--
-- Indexes for table `event_tickets`
--
ALTER TABLE `event_tickets`
  ADD PRIMARY KEY (`event_tickets_id`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `Event_id` (`Event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_tickets`
--
ALTER TABLE `event_tickets`
  MODIFY `event_tickets_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `event_tickets`
--
ALTER TABLE `event_tickets`
  ADD CONSTRAINT `event_tickets_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `event_tickets_ibfk_2` FOREIGN KEY (`Event_id`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
