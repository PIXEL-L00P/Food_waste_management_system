-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2026 at 05:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_waste_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`admin_id`, `name`, `phone`, `email`, `role`) VALUES
(1, 'Sanika Heeya', '01700000001', 'sanika@admin.com', 'System Manager'),
(2, 'Adibur Rahman', '01700000002', 'adi@admin.com', 'Food Inspector'),
(3, 'Tashfia Aatha', '01700000003', 'Aastha@admin.com', 'Verification Officer'),
(4, 'Nowshin Riana', '01700000004', 'riana@admin.com', 'Distribution Manager'),
(5, 'Sajid Mollik', '01700000005', 'sajid@admin.com', 'Audit Officer');

-- --------------------------------------------------------

--
-- Table structure for table `distributionproof`
--

CREATE TABLE `distributionproof` (
  `proof_id` int(11) NOT NULL,
  `claim_id` int(11) DEFAULT NULL,
  `photos` varchar(200) DEFAULT NULL,
  `number_of_people_served` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `area_cover` varchar(100) DEFAULT NULL,
  `verification_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distributionproof`
--

INSERT INTO `distributionproof` (`proof_id`, `claim_id`, `photos`, `number_of_people_served`, `timestamp`, `area_cover`, `verification_status`) VALUES
(1, 1, 'photo1.jpg', 50, '2026-04-10 17:05:00', 'Mirpur', 'Verified'),
(2, 2, 'photo2.jpg', 20, '2026-04-11 17:50:00', 'Dhanmondi', 'Verified'),
(3, 3, 'photo3.jpg', 70, '2026-04-10 16:00:00', 'Agrabad', 'Verified'),
(4, 4, 'photo5.jpg', 40, '2026-04-12 18:30:00', 'Uttara', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `donationclaim`
--

CREATE TABLE `donationclaim` (
  `claim_id` int(11) NOT NULL,
  `ngo_id` int(11) DEFAULT NULL,
  `donation_id` int(11) DEFAULT NULL,
  `quantity_value` int(11) DEFAULT NULL,
  `quantity_unit` varchar(20) DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `distribution_area` varchar(100) DEFAULT NULL,
  `distribution_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donationclaim`
--

INSERT INTO `donationclaim` (`claim_id`, `ngo_id`, `donation_id`, `quantity_value`, `quantity_unit`, `pickup_time`, `distribution_area`, `distribution_time`, `status`) VALUES
(1, 1, 1, 20, 'kg', '2026-04-10 14:00:00', 'Mirpur', '2026-04-10 16:00:00', 'Completed'),
(2, 2, 2, 15, 'pieces', '2026-04-11 15:00:00', 'Dhanmondi', '2026-04-11 17:00:00', 'Completed'),
(3, 3, 3, 40, 'kg', '2026-04-10 13:00:00', 'Agrabad', '2026-04-10 15:00:00', 'Completed'),
(4, 3, 4, 20, 'kg', '2026-04-12 15:00:00', 'Uttara', '2026-04-12 17:00:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `fooddonation`
--

CREATE TABLE `fooddonation` (
  `donation_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `food_type` varchar(50) DEFAULT NULL,
  `quantity_value` int(11) DEFAULT NULL,
  `quantity_unit` varchar(20) DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `preparation_time` time DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `packaging_info` varchar(100) DEFAULT NULL,
  `pickup_start_time` datetime DEFAULT NULL,
  `pickup_end_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fooddonation`
--

INSERT INTO `fooddonation` (`donation_id`, `restaurant_id`, `food_type`, `quantity_value`, `quantity_unit`, `manufacture_date`, `preparation_time`, `expiry_date`, `packaging_info`, `pickup_start_time`, `pickup_end_time`, `status`) VALUES
(1, 1, 'Cooked Rice', 50, 'kg', '2026-04-10', '10:00:00', '2026-04-10 18:00:00', 'Sealed Container', '2026-04-10 12:00:00', '2026-04-10 16:00:00', 'Unavailable'),
(2, 2, 'Frozen Chicken', 15, 'pieces', '2026-04-11', '09:00:00', '2026-04-12 20:00:00', 'Refrigerated', '2026-04-11 12:30:00', '2026-04-11 17:00:00', 'Unavailable'),
(3, 4, 'Vegetables', 40, 'kg', '2026-04-10', '07:30:00', '2026-04-10 17:00:00', 'Cold Storage', '2026-04-10 09:00:00', '2026-04-10 13:00:00', 'Unavailable'),
(4, 1, 'Cooked Curry', 25, 'kg', '2026-04-12', '11:00:00', '2026-04-12 19:00:00', 'Insulated Box', '2026-04-12 13:30:00', '2026-04-12 17:30:00', 'Unavailable'),
(5, 4, 'Leftover Pasta', 20, 'kg', '2026-04-13', '09:30:00', '2026-04-13 18:00:00', 'Sealed Box', '2026-04-13 12:00:00', '2026-04-13 15:00:00', 'Unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `foodverification`
--

CREATE TABLE `foodverification` (
  `verification_id` int(11) NOT NULL,
  `donation_id` int(11) DEFAULT NULL,
  `ngo_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `inspection_notes` varchar(200) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foodverification`
--

INSERT INTO `foodverification` (`verification_id`, `donation_id`, `ngo_id`, `status`, `inspection_notes`, `verified_at`) VALUES
(1, 1, 1, 'Verified', 'Food quality good', '2026-04-10 14:15:00'),
(2, 2, 2, 'Verified', 'Properly packed', '2026-04-11 15:33:00'),
(3, 3, 3, 'Verified', 'Vegetables fresh', '2026-04-10 13:25:00'),
(4, 4, 3, 'Pending', 'Awaiting inspection', '2026-04-10 15:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `ngo`
--

CREATE TABLE `ngo` (
  `ngo_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `reputation_score` float DEFAULT NULL,
  `ngo_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ngo`
--

INSERT INTO `ngo` (`ngo_id`, `user_id`, `name`, `location`, `phone`, `email`, `capacity`, `reputation_score`, `ngo_status`) VALUES
(1, 3, 'Helping Hands', 'Dhaka', '01911111111', 'help@gmail.com', 500, 4.6, 'Active'),
(2, 5, 'Food Savers', 'Dhaka', '01622222222', 'saver@gmail.com', 300, 4.1, 'Active'),
(3, 7, 'Care Givers', 'Chittagong', '01733333333', 'care@gmail.com', 400, 4.3, 'Active'),
(4, 8, 'Hope Foundation', 'Khulna', '01844444444', 'hope@gmail.com', 250, 3.8, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `ngodistributionrecord`
--

CREATE TABLE `ngodistributionrecord` (
  `record_id` int(11) NOT NULL,
  `ngo_id` int(11) DEFAULT NULL,
  `proof_id` int(11) DEFAULT NULL,
  `issued_at` datetime DEFAULT NULL,
  `negative_mark` int(11) DEFAULT NULL,
  `negative_reason` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ngodistributionrecord`
--

INSERT INTO `ngodistributionrecord` (`record_id`, `ngo_id`, `proof_id`, `issued_at`, `negative_mark`, `negative_reason`) VALUES
(1, 1, 1, '2026-04-10 17:30:00', 0, 'None'),
(2, 2, 2, '2026-04-11 18:30:00', 1, 'Late Delivery'),
(3, 3, 3, '2026-04-10 16:45:00', 0, 'None'),
(4, 3, 4, '2026-04-12 19:00:00', 0, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `food_type` varchar(50) DEFAULT NULL,
  `packaging_info` varchar(100) DEFAULT NULL,
  `reputation_score` float DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `hygiene_rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `user_id`, `name`, `location`, `phone`, `email`, `food_type`, `packaging_info`, `reputation_score`, `status`, `hygiene_rating`) VALUES
(1, 1, 'Green Kitchen', 'Dhaka', '01711111111', 'green@gmail.com', 'Cooked', 'Sealed Container', 4.5, 'Active', 4.8),
(2, 2, 'Fresh Bites', 'Dhaka', '01822222222', 'fresh@gmail.com', 'Frozen', 'Refrigerated', 4.2, 'Active', 4.5),
(3, 4, 'Urban Meals', 'Chittagong', '01933333333', 'urban@gmail.com', 'Dry Food', 'Box Packed', 4, 'Inactive', 4.2),
(4, 6, 'Daily Dine', 'Khulna', '01644444444', 'daily@gmail.com', 'Cooked', 'Insulated Box', 3.9, 'Active', 4);

-- --------------------------------------------------------

--
-- Table structure for table `restaurantcertificate`
--

CREATE TABLE `restaurantcertificate` (
  `certificate_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `donation_id` int(11) DEFAULT NULL,
  `issued_at` datetime DEFAULT NULL,
  `donation_rating` float DEFAULT NULL,
  `food_rating` float DEFAULT NULL,
  `negative_mark` int(11) DEFAULT NULL,
  `negative_reason` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurantcertificate`
--

INSERT INTO `restaurantcertificate` (`certificate_id`, `restaurant_id`, `donation_id`, `issued_at`, `donation_rating`, `food_rating`, `negative_mark`, `negative_reason`) VALUES
(1, 1, 1, '2026-04-10 18:30:00', 90, 4.5, 0, 'None'),
(2, 2, 2, '2026-04-11 18:00:00', 85, 3.5, 1, 'Late Packaging'),
(3, 4, 3, '2026-04-10 16:30:00', 88, 4, 0, 'None'),
(4, 1, 4, '2026-04-12 18:30:00', 92, 3.8, 0, 'None'),
(5, 4, 5, '2026-04-10 16:30:00', 80, 3.9, 2, 'Improper Label');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('restaurant','ngo') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `role`) VALUES
(1, 'green@rest.com', 'pass123', 'restaurant'),
(2, 'fresh@rest.com', 'pass123', 'restaurant'),
(3, 'help@ngo.com', 'pass123', 'ngo'),
(4, 'urban@rest.com', 'pass123', 'restaurant'),
(5, 'food@ngo.com', 'pass123', 'ngo'),
(6, 'daily@rest.com', 'pass123', 'restaurant'),
(7, 'care@ngo.com', 'pass123', 'ngo'),
(8, 'hope@ngo.com', 'pass123', 'ngo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `distributionproof`
--
ALTER TABLE `distributionproof`
  ADD PRIMARY KEY (`proof_id`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indexes for table `donationclaim`
--
ALTER TABLE `donationclaim`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `ngo_id` (`ngo_id`),
  ADD KEY `donation_id` (`donation_id`);

--
-- Indexes for table `fooddonation`
--
ALTER TABLE `fooddonation`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `foodverification`
--
ALTER TABLE `foodverification`
  ADD PRIMARY KEY (`verification_id`),
  ADD KEY `donation_id` (`donation_id`),
  ADD KEY `ngo_id` (`ngo_id`);

--
-- Indexes for table `ngo`
--
ALTER TABLE `ngo`
  ADD PRIMARY KEY (`ngo_id`);

--
-- Indexes for table `ngodistributionrecord`
--
ALTER TABLE `ngodistributionrecord`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `ngo_id` (`ngo_id`),
  ADD KEY `proof_id` (`proof_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Indexes for table `restaurantcertificate`
--
ALTER TABLE `restaurantcertificate`
  ADD PRIMARY KEY (`certificate_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `donation_id` (`donation_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `distributionproof`
--
ALTER TABLE `distributionproof`
  MODIFY `proof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donationclaim`
--
ALTER TABLE `donationclaim`
  MODIFY `claim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fooddonation`
--
ALTER TABLE `fooddonation`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `foodverification`
--
ALTER TABLE `foodverification`
  MODIFY `verification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ngo`
--
ALTER TABLE `ngo`
  MODIFY `ngo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ngodistributionrecord`
--
ALTER TABLE `ngodistributionrecord`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `restaurantcertificate`
--
ALTER TABLE `restaurantcertificate`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `distributionproof`
--
ALTER TABLE `distributionproof`
  ADD CONSTRAINT `distributionproof_ibfk_1` FOREIGN KEY (`claim_id`) REFERENCES `donationclaim` (`claim_id`);

--
-- Constraints for table `donationclaim`
--
ALTER TABLE `donationclaim`
  ADD CONSTRAINT `donationclaim_ibfk_1` FOREIGN KEY (`ngo_id`) REFERENCES `ngo` (`ngo_id`),
  ADD CONSTRAINT `donationclaim_ibfk_2` FOREIGN KEY (`donation_id`) REFERENCES `fooddonation` (`donation_id`);

--
-- Constraints for table `fooddonation`
--
ALTER TABLE `fooddonation`
  ADD CONSTRAINT `fooddonation_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- Constraints for table `foodverification`
--
ALTER TABLE `foodverification`
  ADD CONSTRAINT `foodverification_ibfk_1` FOREIGN KEY (`donation_id`) REFERENCES `fooddonation` (`donation_id`),
  ADD CONSTRAINT `foodverification_ibfk_2` FOREIGN KEY (`ngo_id`) REFERENCES `ngo` (`ngo_id`);

--
-- Constraints for table `ngodistributionrecord`
--
ALTER TABLE `ngodistributionrecord`
  ADD CONSTRAINT `ngodistributionrecord_ibfk_1` FOREIGN KEY (`ngo_id`) REFERENCES `ngo` (`ngo_id`),
  ADD CONSTRAINT `ngodistributionrecord_ibfk_2` FOREIGN KEY (`proof_id`) REFERENCES `distributionproof` (`proof_id`);

--
-- Constraints for table `restaurantcertificate`
--
ALTER TABLE `restaurantcertificate`
  ADD CONSTRAINT `restaurantcertificate_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  ADD CONSTRAINT `restaurantcertificate_ibfk_2` FOREIGN KEY (`donation_id`) REFERENCES `fooddonation` (`donation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
