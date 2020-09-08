-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2020 at 12:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--
CREATE DATABASE IF NOT EXISTS `cms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cms`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `user_id`, `cat_title`) VALUES
(1, 35, 'Bootstrap'),
(2, 0, 'Javascript'),
(47, 0, 'IOS'),
(79, 54, 'OOP'),
(82, 0, 'PYTHON');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(49, 51, 'maulik', 'edwin@mzgm', 'dhbdfzd', 'approve', '2020-08-08'),
(50, 45, 'maulik', 'dasdfas@gma', 'zvazsv', 'approve', '2020-08-08'),
(51, 45, 'maulik', 'edwin@mzgm', 'sfsfafg', 'approve', '2020-08-08'),
(53, 44, 'gAhDAS', 'support@maulik.com', 'asfsAfA', 'approve', '2020-08-08');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(13, 35, 41);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`, `likes`) VALUES
(41, 2, 'Java01', '', 'demo', '2020-08-08', 'Koala.jpg', '<p>fgjhfgjfgjfl,lhjil,</p>', 'java,lli', 1, 'published', 138, 1),
(48, 2, 'Java', '', 'maulik', '2020-08-08', 'image_5.jpg', '<p>fgjhfgjfgjf</p>', 'java', 0, 'published', 3, 0),
(57, 1, 'OOP', '', 'maulik', '2020-08-13', 'image_2.jpg', '<p>grgsb</p>', 'vvt', 0, 'published', 0, 0),
(58, 2, 'Java', '', 'maulik', '2020-08-13', 'image_5.jpg', '<p>fgjhfgjfgjf</p>', 'java', 0, 'published', 0, 0),
(59, 2, 'Java01', '', 'demo', '2020-08-13', 'Koala.jpg', '<p>fgjhfgjfgjfl,lhjil,</p>', 'java,lli', 0, 'published', 2, 0),
(60, 1, 'OOP', '', 'maulik', '2020-08-13', 'image_2.jpg', '<p>grgsb</p>', 'vvt', 0, 'published', 25, 0),
(61, 2, 'Java', '', 'maulik', '2020-08-13', 'image_5.jpg', '<p>fgjhfgjfgjf</p>', 'java', 0, 'draft', 1, 0),
(62, 2, 'Java01', '', 'demo', '2020-08-13', 'Koala.jpg', '<p>fgjhfgjfgjfl,lhjil,</p>', 'java,lli', 0, 'draft', 0, 0),
(63, 1, 'test', '', 'maulik', '2020-08-15', '', '<p>dvsdvs</p>', 'OOP', 0, 'draft', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$ghhhhfhsfhsdfhdfshsf22',
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`, `token`) VALUES
(34, 'maulik', '$2y$12$Av5wLBNhg3zIAIhlPzIuCOo4p0NHnSfViWI39U/GEqT3bQ9p4o/7G', 'Maulik', 'hfdh', 'maulik@gmail.com', '', 'admin', '$2y$10$ghhhhfhsfhsdfhdfshsf22', ''),
(35, 'demo', '$2y$12$icVeYu1WcIw18nFtsAokjeR/efEc9xmn97krpw72p4I4H/FcV4Crq', 'Maulik', 'hfdh', 'demo@gmail.com', '', 'admin', '$2y$10$ghhhhfhsfhsdfhdfshsf22', 'cc13b92972257bfa0c133fac884f2f10f33797baaff7c52ad761cf95bb96aed179ddd1b66185255b933ea52b0adeb60717c8'),
(54, '123', '$2y$12$QWta1oVC8rOvqo8etgWonuFrlKHgfeAfdWM1wiO.oFZ2u4tR.bBUK', 'test', 'test', '001@gmail.com', '', 'subscriber', '$2y$10$ghhhhfhsfhsdfhdfshsf22', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

DROP TABLE IF EXISTS `users_online`;
CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(20, 'jj2434c87gqk5hvgf93rt39s10', 1596793493),
(21, 'b7dp9031ekb7hk2fl99gf6o5h9', 1596771724),
(22, 'fg5tsk4g9fofoa0e4tfmr1de8g', 1596969337),
(23, 'o3l328jffglkjukaa9of4o31um', 1596811680),
(24, '4p0fhth7nbesl3iu6sj8kn4a71', 1596976674),
(25, 'gemam63pkt7930n9idknk0mp6m', 1597403929),
(26, 'bsckmvqnhd6isooh9dfabpvmf1', 1597656333);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
