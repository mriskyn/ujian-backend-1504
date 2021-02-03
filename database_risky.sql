-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 03, 2021 at 10:25 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend_2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `location` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location`) VALUES
(1, 'Bandung'),
(2, 'Jakarta'),
(3, 'Serpong');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name` varchar(85) NOT NULL,
  `release_date` int(11) NOT NULL,
  `release_month` int(11) NOT NULL,
  `release_year` int(11) NOT NULL,
  `duration_min` int(11) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `description` varchar(425) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `release_date`, `release_month`, `release_year`, `duration_min`, `genre`, `description`, `status`) VALUES
(1, 'Avengers: Endgame', 24, 4, 2019, 182, 'Action', 'After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance.', 2),
(2, 'Frozen 2', 20, 11, 2019, 113, 'Fantasy', 'Queen Elsa starts hearing a mysterious melodic voice calling to her. Unsettled, she answers it and that awakens the elemental spirits that lead her to a quest to restore an old injustice.', 2),
(3, 'Demon Slayer: Kimetsu no Yaiba the Movie: Mugen Train', 6, 1, 2021, 129, 'Anime', 'A youth begins a quest to fight demons and save his sister after finding his family slaughtered and his sister turned into a demon.', 1),
(4, 'Weathering with You', 21, 8, 2019, 111, 'Romance', 'A boy runs away to Tokyo and befriends a girl who appears to be able to manipulate the weather.', 2),
(5, 'The Nun', 5, 9, 2018, 96, 'Horror', 'When a young nun at a cloistered abbey in Romania takes her own life, a priest with a haunted past and a novitiate on the threshold of her final vows are sent by the Vatican to investigate. Together, they uncover the order\'s unholy secret. Risking not only their lives but their faith and their very souls, they confront a malevolent force in the form of a demonic nun.', 3),
(6, 'Spider-Man: Far From Home', 3, 7, 2019, 129, 'Action', 'As Spider-Man, a beloved superhero, Peter Parker faces four destructive elemental monsters while on holiday in Europe. Soon, he receives help from Mysterio, a fellow hero with mysterious origins.', 2),
(8, 'Black Widow', 4, 29, 2021, 133, 'Action', 'At birth the Black Widow (aka Natasha Romanova) is given to the KGB, which grooms her to become its ultimate operative. When the U.S.S.R. breaks up, the government tries to kill her as the action moves to present-day New York, where she is a freelance operative.', 1),
(9, 'Mulan', 25, 3, 2020, 120, 'Fantasy', 'A girl disguises as a male warrior and joins the imperial army in order to prevent her sick father from being forced to enlist as he has no male heir.', 2),
(10, 'Gundala', 20, 11, 2019, 105, 'Action', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movie_status`
--

CREATE TABLE `movie_status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_status`
--

INSERT INTO `movie_status` (`id`, `status`) VALUES
(1, 'upcoming'),
(2, 'on show'),
(3, 'has shown');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `movie_id`, `location_id`, `time_id`) VALUES
(1, 1, 1, 3),
(2, 1, 1, 4),
(3, 1, 1, 5),
(4, 1, 2, 1),
(5, 1, 2, 5),
(6, 1, 2, 6),
(7, 1, 3, 1),
(8, 1, 3, 2),
(9, 1, 3, 3),
(10, 2, 2, 2),
(11, 2, 2, 4),
(12, 2, 2, 6),
(13, 3, 1, 3),
(14, 3, 3, 5),
(15, 3, 3, 6),
(16, 4, 1, 1),
(17, 4, 2, 2),
(18, 4, 2, 4),
(19, 4, 3, 3),
(20, 5, 1, 5),
(21, 5, 2, 5),
(22, 5, 3, 5),
(23, 6, 1, 1),
(24, 6, 2, 2),
(25, 6, 3, 3),
(26, 8, 1, 4),
(27, 8, 1, 6),
(28, 9, 1, 1),
(29, 9, 1, 2),
(31, 9, 1, 3),
(32, 1, 1, 3),
(33, 1, 1, 3),
(34, 1, 1, 3),
(35, 1, 3, 3),
(36, 9, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `show_times`
--

CREATE TABLE `show_times` (
  `id` int(11) NOT NULL,
  `time` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `show_times`
--

INSERT INTO `show_times` (`id`, `time`) VALUES
(1, '9 AM'),
(2, '11 AM'),
(3, '1 PM'),
(4, '3 PM'),
(5, '7 PM'),
(6, '9 PM');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'not-active'),
(3, 'closed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uid` varchar(45) CHARACTER SET utf8 NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(225) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uid`, `username`, `email`, `password`, `role`, `status`) VALUES
(1, '16123352', 'risky', 'rsk@mail.com', '$2b$10$1z8bAhTIexd6iWzX2WtsTew/sTIUt36gjs3AcE2fWixSuVpCV7u5S', 1, 2),
(9, '16123473', 'riskyyyy', 'rskkk@mail.com', '$2b$10$6d/CkinCdHWR18ou4uaLw.kZplbk7LW47es5nq9pfMJhWelovbQd2', 2, 1),
(10, '16123473', 'riskyyyy', 'rskkk@mail.com', '$2b$10$8bVREcIBvK1zn8mlIOJLmeDPdl4dYKI/IqujqRKfs3f9b2mBkzubC', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `movie_status`
--
ALTER TABLE `movie_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foreign_key_location` (`location_id`),
  ADD KEY `fk_foreign_key_movie` (`movie_id`),
  ADD KEY `fk_foreign_key_time` (`time_id`);

--
-- Indexes for table `show_times`
--
ALTER TABLE `show_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foreign_key_role` (`role`),
  ADD KEY `fk_foreign_key_status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `movie_status`
--
ALTER TABLE `movie_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `show_times`
--
ALTER TABLE `show_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_foreign_key_status_movie` FOREIGN KEY (`status`) REFERENCES `movie_status` (`id`),
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`status`) REFERENCES `movie_status` (`id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_foreign_key_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `fk_foreign_key_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `fk_foreign_key_time` FOREIGN KEY (`time_id`) REFERENCES `show_times` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_foreign_key_role` FOREIGN KEY (`role`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_foreign_key_status` FOREIGN KEY (`status`) REFERENCES `status` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
