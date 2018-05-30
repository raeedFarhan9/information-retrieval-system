-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 27, 2018 at 09:22 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth`
--
CREATE DATABASE IF NOT EXISTS `auth` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `auth`;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `auth2`
--
CREATE DATABASE IF NOT EXISTS `auth2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `auth2`;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `active`, `email`, `last_name`, `name`, `password`) VALUES
(1, 1, 'admin@gmail.com', 's', 'Sam', 'sam'),
(2, 1, 'admin@gmail.com', 's', 'youtube', 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
--
-- Database: `axon-example`
--
CREATE DATABASE IF NOT EXISTS `axon-example` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `axon-example`;

-- --------------------------------------------------------

--
-- Table structure for table `association_value_entry`
--

DROP TABLE IF EXISTS `association_value_entry`;
CREATE TABLE IF NOT EXISTS `association_value_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `association_key` varchar(255) NOT NULL,
  `association_value` varchar(255) DEFAULT NULL,
  `saga_id` varchar(255) NOT NULL,
  `saga_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_query_object`
--

DROP TABLE IF EXISTS `complaint_query_object`;
CREATE TABLE IF NOT EXISTS `complaint_query_object` (
  `complaint_id` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `domain_event_entry`
--

DROP TABLE IF EXISTS `domain_event_entry`;
CREATE TABLE IF NOT EXISTS `domain_event_entry` (
  `global_index` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_identifier` varchar(255) NOT NULL,
  `meta_data` longblob,
  `payload` longblob NOT NULL,
  `payload_revision` varchar(255) DEFAULT NULL,
  `payload_type` varchar(255) NOT NULL,
  `time_stamp` varchar(255) NOT NULL,
  `aggregate_identifier` varchar(255) NOT NULL,
  `sequence_number` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`global_index`),
  UNIQUE KEY `UK8s1f994p4la2ipb13me2xqm1w` (`aggregate_identifier`,`sequence_number`),
  UNIQUE KEY `UK_fwe6lsa8bfo6hyas6ud3m8c7x` (`event_identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saga_entry`
--

DROP TABLE IF EXISTS `saga_entry`;
CREATE TABLE IF NOT EXISTS `saga_entry` (
  `saga_id` varchar(255) NOT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `saga_type` varchar(255) DEFAULT NULL,
  `serialized_saga` longblob,
  PRIMARY KEY (`saga_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `token_entry`
--

DROP TABLE IF EXISTS `token_entry`;
CREATE TABLE IF NOT EXISTS `token_entry` (
  `processor_name` varchar(255) NOT NULL,
  `segment` int(11) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `timestamp` varchar(255) NOT NULL,
  `token` longblob,
  `token_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processor_name`,`segment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Database: `boarddb`
--
CREATE DATABASE IF NOT EXISTS `boarddb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `boarddb`;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `board_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`board_id`),
  UNIQUE KEY `board_id_UNIQUE` (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`board_id`, `board_name`, `board_booking_id`, `status`) VALUES
(661, 'ggg', 'BOARD-6e8c5db0-e736-4eaf-afa2-53a6351ec1c3', 'CONFIRMED'),
(662, NULL, NULL, 'AVAILABLE'),
(663, NULL, NULL, 'AVAILABLE'),
(664, NULL, NULL, 'AVAILABLE'),
(665, NULL, NULL, 'AVAILABLE'),
(666, NULL, NULL, 'AVAILABLE'),
(667, NULL, NULL, 'AVAILABLE'),
(668, NULL, NULL, 'AVAILABLE'),
(669, NULL, NULL, 'AVAILABLE'),
(670, NULL, NULL, 'AVAILABLE'),
(671, NULL, NULL, 'AVAILABLE'),
(672, NULL, NULL, 'AVAILABLE'),
(673, NULL, NULL, 'AVAILABLE'),
(674, NULL, NULL, 'AVAILABLE'),
(675, NULL, NULL, 'AVAILABLE'),
(676, NULL, NULL, 'AVAILABLE'),
(677, NULL, NULL, 'AVAILABLE'),
(678, NULL, NULL, 'AVAILABLE'),
(679, NULL, NULL, 'AVAILABLE'),
(680, NULL, NULL, 'AVAILABLE');
--
-- Database: `channel_db`
--
CREATE DATABASE IF NOT EXISTS `channel_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `channel_db`;

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
CREATE TABLE IF NOT EXISTS `channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `channel_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`channel_id`),
  UNIQUE KEY `channel_id_UNIQUE` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`channel_id`, `channel_name`, `channel_booking_id`, `status`) VALUES
(381, 'yyyy', 'CHANNEL-955f0ada-5704-474f-afc6-3728c99dc4c1', 'CONFIRMED'),
(382, NULL, NULL, 'AVAILABLE'),
(383, NULL, NULL, 'AVAILABLE'),
(384, NULL, NULL, 'AVAILABLE'),
(385, NULL, NULL, 'AVAILABLE'),
(386, NULL, NULL, 'AVAILABLE'),
(387, NULL, NULL, 'AVAILABLE'),
(388, NULL, NULL, 'AVAILABLE'),
(389, NULL, NULL, 'AVAILABLE'),
(390, NULL, NULL, 'AVAILABLE'),
(391, NULL, NULL, 'AVAILABLE'),
(392, NULL, NULL, 'AVAILABLE'),
(393, NULL, NULL, 'AVAILABLE'),
(394, NULL, NULL, 'AVAILABLE'),
(395, NULL, NULL, 'AVAILABLE'),
(396, NULL, NULL, 'AVAILABLE'),
(397, NULL, NULL, 'AVAILABLE'),
(398, NULL, NULL, 'AVAILABLE'),
(399, NULL, NULL, 'AVAILABLE'),
(400, NULL, NULL, 'AVAILABLE');
--
-- Database: `commentdb`
--
CREATE DATABASE IF NOT EXISTS `commentdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `commentdb`;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_id_UNIQUE` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_name`, `comment_booking_id`, `status`) VALUES
(321, NULL, NULL, 'AVAILABLE'),
(322, NULL, NULL, 'AVAILABLE'),
(323, NULL, NULL, 'AVAILABLE'),
(324, NULL, NULL, 'AVAILABLE'),
(325, NULL, NULL, 'AVAILABLE'),
(326, NULL, NULL, 'AVAILABLE'),
(327, NULL, NULL, 'AVAILABLE'),
(328, NULL, NULL, 'AVAILABLE'),
(329, NULL, NULL, 'AVAILABLE'),
(330, NULL, NULL, 'AVAILABLE'),
(331, NULL, NULL, 'AVAILABLE'),
(332, NULL, NULL, 'AVAILABLE'),
(333, NULL, NULL, 'AVAILABLE'),
(334, NULL, NULL, 'AVAILABLE'),
(335, NULL, NULL, 'AVAILABLE'),
(336, NULL, NULL, 'AVAILABLE'),
(337, NULL, NULL, 'AVAILABLE'),
(338, NULL, NULL, 'AVAILABLE'),
(339, NULL, NULL, 'AVAILABLE'),
(340, NULL, NULL, 'AVAILABLE');
--
-- Database: `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh4c7lvsc298whoyd4w9ta25cr` (`post_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `description` varchar(250) NOT NULL,
  `posted_at` datetime DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mchce1gm7f6otpphxd6ixsdps` (`title`),
  KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `description`, `posted_at`, `title`, `user_id`) VALUES
(1, 'aa', 'aa', NULL, 'aa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `active`, `email`, `last_name`, `first_name`, `password`) VALUES
(1, 1, 'a@a.a', 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Database: `db1`
--
CREATE DATABASE IF NOT EXISTS `db1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db1`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh4c7lvsc298whoyd4w9ta25cr` (`post_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `description` varchar(250) NOT NULL,
  `posted_at` datetime DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mchce1gm7f6otpphxd6ixsdps` (`title`),
  KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `description`, `posted_at`, `title`, `user_id`) VALUES
(1, 'aaa', 'aaa', NULL, 'aaa', 2);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `active`, `email`, `last_name`, `first_name`, `password`) VALUES
(1, 1, 'aa@aa.aa', 'aa', 'aa', 'aa'),
(2, 1, 'admin@gmail.com', 's', 'Sam', 'sam'),
(3, 1, 'admin@gmail.com', 's', 'youtube', 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1);
--
-- Database: `dsdb`
--
CREATE DATABASE IF NOT EXISTS `dsdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_board_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `srcImg` varchar(255) DEFAULT NULL,
  `board_id` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_bookcategoryid_idx` (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `board`
--
ALTER TABLE `board`
  ADD CONSTRAINT `fk_user_board_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `flights`
--
CREATE DATABASE IF NOT EXISTS `flights` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `flights`;

-- --------------------------------------------------------

--
-- Table structure for table `available_seats`
--

DROP TABLE IF EXISTS `available_seats`;
CREATE TABLE IF NOT EXISTS `available_seats` (
  `seat_number` int(11) NOT NULL AUTO_INCREMENT,
  `travel_to` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `travel_from` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `traveller_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `seat_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`seat_number`),
  UNIQUE KEY `seat_number_UNIQUE` (`seat_number`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `available_seats`
--

INSERT INTO `available_seats` (`seat_number`, `travel_to`, `travel_from`, `traveller_name`, `seat_booking_id`, `status`) VALUES
(361, 'bbb', 'bbb', 'bbb', 'FLIGHT-33d491a5-6454-40dc-add6-4e5a7717f355', 'CONFIRMED'),
(362, 'ccc', 'ccc', 'ccc', 'FLIGHT-e1604a73-5e0c-4501-a2e8-0c31f50a1bcb', 'CONFIRMED'),
(363, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(364, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(365, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(366, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(367, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(368, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(369, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(370, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(371, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(372, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(373, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(374, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(375, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(376, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(377, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(378, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(379, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(380, NULL, NULL, NULL, NULL, 'AVAILABLE');
--
-- Database: `hotels`
--
CREATE DATABASE IF NOT EXISTS `hotels` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hotels`;

-- --------------------------------------------------------

--
-- Table structure for table `available_rooms`
--

DROP TABLE IF EXISTS `available_rooms`;
CREATE TABLE IF NOT EXISTS `available_rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `traveller_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nights` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `room_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_id_UNIQUE` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1261 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `available_rooms`
--

INSERT INTO `available_rooms` (`room_id`, `traveller_name`, `city`, `nights`, `room_booking_id`, `status`) VALUES
(1241, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1242, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1243, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1244, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1245, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1246, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1247, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1248, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1249, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1250, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1251, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1252, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1253, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1254, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1255, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1256, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1257, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1258, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1259, NULL, NULL, NULL, NULL, 'AVAILABLE'),
(1260, NULL, NULL, NULL, NULL, 'AVAILABLE');
--
-- Database: `irdb`
--
CREATE DATABASE IF NOT EXISTS `irdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `irdb`;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `image_url`, `price`, `product_id`, `version`) VALUES
(1, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(2, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(3, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(4, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(5, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(6, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(7, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(8, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(9, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(10, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(11, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(12, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(13, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(14, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(15, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(16, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(17, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(18, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(19, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(20, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(21, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(22, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(23, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(24, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(25, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(26, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(27, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(28, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(29, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(30, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(31, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(32, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(33, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(34, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(35, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(36, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(37, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(38, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(39, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(40, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(41, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(42, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(43, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(44, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(45, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(46, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(47, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(48, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(49, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(50, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(51, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(52, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(53, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(54, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(55, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(56, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(57, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(58, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(59, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(60, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(61, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(62, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(63, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(64, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(65, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(66, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(67, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(68, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(69, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(70, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(71, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(72, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(73, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(74, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(75, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(76, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(77, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(78, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(79, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(80, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(81, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(82, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(83, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(84, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(85, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(86, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(87, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(88, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(89, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(90, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(91, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(92, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(93, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(94, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(95, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(96, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(97, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(98, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(99, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(100, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(101, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(102, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(103, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(104, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(105, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(106, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(107, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(108, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(109, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(110, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(111, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(112, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0);
--
-- Database: `lmsdb`
--
CREATE DATABASE IF NOT EXISTS `lmsdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lmsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `book_tbl`
--

DROP TABLE IF EXISTS `book_tbl`;
CREATE TABLE IF NOT EXISTS `book_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `purechase_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_tbl`
--

INSERT INTO `book_tbl` (`id`, `author`, `book_name`, `purechase_date`) VALUES
(1, 'aaaa', 'aaaa', '2008-07-04 00:00:00'),
(3, 'C++', 'cccc', '2017-03-02 00:00:00'),
(4, 'python', 'pppp', '2018-03-02 00:00:00'),
(5, 'aaaa', 'aaaa', '2016-05-02 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);
--
-- Database: `oauth2_db`
--
CREATE DATABASE IF NOT EXISTS `oauth2_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `oauth2_db`;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(50) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `redirect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_user`
--

DROP TABLE IF EXISTS `client_user`;
CREATE TABLE IF NOT EXISTS `client_user` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FKcatxs6o2rpy2y6skeqj1t4vl3` (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Database: `photosdb`
--
CREATE DATABASE IF NOT EXISTS `photosdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `photosdb`;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `photo_src` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `photo_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `photo_id_UNIQUE` (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photo_id`, `photo_name`, `photo_src`, `photo_booking_id`, `status`) VALUES
(521, 'ggg', 'ggg', 'PHOTO-3e4acd82-d080-4479-866a-5fcec9952d28', 'CONFIRMED'),
(522, NULL, NULL, NULL, 'AVAILABLE'),
(523, NULL, NULL, NULL, 'AVAILABLE'),
(524, NULL, NULL, NULL, 'AVAILABLE'),
(525, NULL, NULL, NULL, 'AVAILABLE'),
(526, NULL, NULL, NULL, 'AVAILABLE'),
(527, NULL, NULL, NULL, 'AVAILABLE'),
(528, NULL, NULL, NULL, 'AVAILABLE'),
(529, NULL, NULL, NULL, 'AVAILABLE'),
(530, NULL, NULL, NULL, 'AVAILABLE'),
(531, NULL, NULL, NULL, 'AVAILABLE'),
(532, NULL, NULL, NULL, 'AVAILABLE'),
(533, NULL, NULL, NULL, 'AVAILABLE'),
(534, NULL, NULL, NULL, 'AVAILABLE'),
(535, NULL, NULL, NULL, 'AVAILABLE'),
(536, NULL, NULL, NULL, 'AVAILABLE'),
(537, NULL, NULL, NULL, 'AVAILABLE'),
(538, NULL, NULL, NULL, 'AVAILABLE'),
(539, NULL, NULL, NULL, 'AVAILABLE'),
(540, NULL, NULL, NULL, 'AVAILABLE');
--
-- Database: `pinterest`
--
CREATE DATABASE IF NOT EXISTS `pinterest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pinterest`;

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
CREATE TABLE IF NOT EXISTS `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi78dq62d5f9wn545wcdl4kohf` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdf2ga5low0yg96racryj3alkc` (`channel_id`),
  KEY `FKhro52ohfqfbay9774bev0qinr` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbaube8rnq6coeqb22rt2fv8hh` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Database: `postdb`
--
CREATE DATABASE IF NOT EXISTS `postdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `postdb`;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `post_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `post_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `post_id_UNIQUE` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_desc`, `post_booking_id`, `status`) VALUES
(181, NULL, NULL, NULL, 'AVAILABLE'),
(182, NULL, NULL, NULL, 'AVAILABLE'),
(183, NULL, NULL, NULL, 'AVAILABLE'),
(184, NULL, NULL, NULL, 'AVAILABLE'),
(185, NULL, NULL, NULL, 'AVAILABLE'),
(186, NULL, NULL, NULL, 'AVAILABLE'),
(187, NULL, NULL, NULL, 'AVAILABLE'),
(188, NULL, NULL, NULL, 'AVAILABLE'),
(189, NULL, NULL, NULL, 'AVAILABLE'),
(190, NULL, NULL, NULL, 'AVAILABLE'),
(191, NULL, NULL, NULL, 'AVAILABLE'),
(192, NULL, NULL, NULL, 'AVAILABLE'),
(193, NULL, NULL, NULL, 'AVAILABLE'),
(194, NULL, NULL, NULL, 'AVAILABLE'),
(195, NULL, NULL, NULL, 'AVAILABLE'),
(196, NULL, NULL, NULL, 'AVAILABLE'),
(197, NULL, NULL, NULL, 'AVAILABLE'),
(198, NULL, NULL, NULL, 'AVAILABLE'),
(199, NULL, NULL, NULL, 'AVAILABLE'),
(200, NULL, NULL, NULL, 'AVAILABLE');
--
-- Database: `rental_cars`
--
CREATE DATABASE IF NOT EXISTS `rental_cars` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rental_cars`;

-- --------------------------------------------------------

--
-- Table structure for table `available_cars`
--

DROP TABLE IF EXISTS `available_cars`;
CREATE TABLE IF NOT EXISTS `available_cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `traveller_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `days` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `car_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `car_id_UNIQUE` (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `available_cars`
--

INSERT INTO `available_cars` (`car_id`, `traveller_name`, `days`, `car_booking_id`, `status`) VALUES
(141, 'rrrr', '13', 'CAR-d3b7b427-196d-4906-b427-9b62fa71d8ba', 'CONFIRMED'),
(142, NULL, NULL, NULL, 'AVAILABLE'),
(143, NULL, NULL, NULL, 'AVAILABLE'),
(144, NULL, NULL, NULL, 'AVAILABLE'),
(145, NULL, NULL, NULL, 'AVAILABLE'),
(146, NULL, NULL, NULL, 'AVAILABLE'),
(147, NULL, NULL, NULL, 'AVAILABLE'),
(148, NULL, NULL, NULL, 'AVAILABLE'),
(149, NULL, NULL, NULL, 'AVAILABLE'),
(150, NULL, NULL, NULL, 'AVAILABLE'),
(151, NULL, NULL, NULL, 'AVAILABLE'),
(152, NULL, NULL, NULL, 'AVAILABLE'),
(153, NULL, NULL, NULL, 'AVAILABLE'),
(154, NULL, NULL, NULL, 'AVAILABLE'),
(155, NULL, NULL, NULL, 'AVAILABLE'),
(156, NULL, NULL, NULL, 'AVAILABLE'),
(157, NULL, NULL, NULL, 'AVAILABLE'),
(158, NULL, NULL, NULL, 'AVAILABLE'),
(159, NULL, NULL, NULL, 'AVAILABLE'),
(160, NULL, NULL, NULL, 'AVAILABLE');
--
-- Database: `springbootdb`
--
CREATE DATABASE IF NOT EXISTS `springbootdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `springbootdb`;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `image_url`, `price`, `product_id`, `version`) VALUES
(1, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(2, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0);
--
-- Database: `spring_auth2`
--
CREATE DATABASE IF NOT EXISTS `spring_auth2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `spring_auth2`;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_board_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`id`, `name`, `user_id`) VALUES
(1, 'aa', 1),
(2, 'bb', 1),
(3, 'bb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `srcImg` varchar(255) DEFAULT NULL,
  `board_id` int(11) UNSIGNED DEFAULT NULL,
  `src_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_bookcategoryid_idx` (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `active`, `email`, `last_name`, `name`, `password`) VALUES
(1, 1, 'admin@gmail.com', 's', 'Sam', 'sam'),
(2, 1, 'admin@gmail.com', 's', 'youtube', 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `board`
--
ALTER TABLE `board`
  ADD CONSTRAINT `FKfyf1fchnby6hndhlfaidier1r` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `fk_user_id_board_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `FKr59gmjjgs3p9ekvcxmoortmpm` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`),
  ADD CONSTRAINT `fk_photo_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
--
-- Database: `sprinmysql`
--
CREATE DATABASE IF NOT EXISTS `sprinmysql` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sprinmysql`;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_board_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`id`, `name`, `user_id`) VALUES
(1, '1board', 1),
(2, 'bb', 1),
(3, 'cc', 1),
(12, 'dddd', NULL),
(13, 'dddd', 1),
(14, 'dddd', NULL),
(15, NULL, 1),
(16, NULL, 1),
(17, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(82),
(82),
(82);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `photo_booking_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `board_id` int(11) UNSIGNED DEFAULT NULL,
  `src_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_bookcategoryid_idx` (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `name`, `photo_booking_id`, `status`, `description`, `board_id`, `src_img`) VALUES
(62, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(63, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(64, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(65, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(66, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(67, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(68, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(69, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(70, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(71, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(72, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(73, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(74, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(75, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(76, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(77, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(78, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(79, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(80, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL),
(81, NULL, NULL, 'AVAILABLE', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `image_url`, `price`, `product_id`, `version`) VALUES
(40, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(31, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(29, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(28, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(27, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(25, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(26, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(24, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(23, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(21, '1', '1', '1.00', '1', 0),
(22, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(32, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(33, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(34, '2', '2', '2.00', '2', 0),
(35, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(36, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(37, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(39, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(41, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(42, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(43, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(44, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(45, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(46, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(47, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(48, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(49, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(50, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(51, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(52, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(53, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(54, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(55, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(56, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(57, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(58, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(59, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(60, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(61, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(62, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(63, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(64, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(65, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(66, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(67, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(68, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(69, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(70, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(71, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(72, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(73, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(74, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(75, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(76, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(77, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(78, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(79, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(80, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(81, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(82, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(83, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(84, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(85, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(86, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(87, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(88, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0),
(89, 'Spring Framework Guru Shirt', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_shirt-rf412049699c14ba5b68bb1c09182bfa2_8nax2_512.jpg', '18.95', '235268845711068308', 0),
(90, 'Spring Framework Guru Mug', 'https://springframework.guru/wp-content/uploads/2015/04/spring_framework_guru_coffee_mug-r11e7694903c348e1a667dfd2f1474d95_x7j54_8byvr_512.jpg', '11.95', '168639393495335947', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
CREATE TABLE IF NOT EXISTS `ranking` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `photo_id` int(11) UNSIGNED DEFAULT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_photo_id_idx` (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `email`, `password`) VALUES
(1, '1', '1', '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `board`
--
ALTER TABLE `board`
  ADD CONSTRAINT `fk_user_board_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `fk_book_bookcategoryid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_photo_id_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_board_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `srcImg` varchar(255) DEFAULT NULL,
  `board_id` int(11) UNSIGNED DEFAULT NULL,
  `src_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_bookcategoryid_idx` (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `active`, `email`, `last_name`, `name`, `password`) VALUES
(1, 1, 'admin@gmail.com', 's', 'Sam', 'sam'),
(2, 1, 'admin@gmail.com', 's', 'youtube', 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `board`
--
ALTER TABLE `board`
  ADD CONSTRAINT `FKfyf1fchnby6hndhlfaidier1r` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `fk_user_id_board_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `FKr59gmjjgs3p9ekvcxmoortmpm` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`),
  ADD CONSTRAINT `fk_photo_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
--
-- Database: `tmblr_agency`
--
CREATE DATABASE IF NOT EXISTS `tmblr_agency` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tmblr_agency`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `identifier` varchar(40) CHARACTER SET utf8 NOT NULL,
  `comment_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `post_title` varchar(45) CHARACTER SET utf8 NOT NULL,
  `post_desc` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `booking_item`
--

DROP TABLE IF EXISTS `booking_item`;
CREATE TABLE IF NOT EXISTS `booking_item` (
  `booking_identifier` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(45) COLLATE utf8_bin NOT NULL,
  `details` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `to_booking_idx` (`booking_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_item`
--
ALTER TABLE `booking_item`
  ADD CONSTRAINT `to_booking` FOREIGN KEY (`booking_identifier`) REFERENCES `booking` (`identifier`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `travel_agency`
--
CREATE DATABASE IF NOT EXISTS `travel_agency` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `travel_agency`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `identifier` varchar(40) CHARACTER SET utf8 NOT NULL,
  `traveller_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `travel_from` varchar(45) CHARACTER SET utf8 NOT NULL,
  `travel_to` varchar(45) CHARACTER SET utf8 NOT NULL,
  `nights` int(11) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`identifier`, `traveller_name`, `travel_from`, `travel_to`, `nights`) VALUES
('3dabc4fe-de60-4040-95c6-51d30135bffc', 'ddd', 'ddd', 'ddd', 13);

-- --------------------------------------------------------

--
-- Table structure for table `booking_item`
--

DROP TABLE IF EXISTS `booking_item`;
CREATE TABLE IF NOT EXISTS `booking_item` (
  `booking_identifier` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(45) COLLATE utf8_bin NOT NULL,
  `details` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `to_booking_idx` (`booking_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking_item`
--

INSERT INTO `booking_item` (`booking_identifier`, `type`, `details`, `id`) VALUES
('3dabc4fe-de60-4040-95c6-51d30135bffc', 'HOTEL', '3dabc4fe-de60-4040-95c6-51d30135bffc', 103),
('3dabc4fe-de60-4040-95c6-51d30135bffc', 'FLIGHT', 'BOARD-88208c10-b1d8-432d-afb8-122f731fbf5f', 104),
('3dabc4fe-de60-4040-95c6-51d30135bffc', 'CAR', 'PHOTO-0cdde371-c863-4c4e-9057-24137901a066', 105);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_item`
--
ALTER TABLE `booking_item`
  ADD CONSTRAINT `to_booking` FOREIGN KEY (`booking_identifier`) REFERENCES `booking` (`identifier`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `upload_agency`
--
CREATE DATABASE IF NOT EXISTS `upload_agency` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `upload_agency`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `identifier` varchar(40) CHARACTER SET utf8 NOT NULL,
  `board_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo_name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `photo_src` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `booking_item`
--

DROP TABLE IF EXISTS `booking_item`;
CREATE TABLE IF NOT EXISTS `booking_item` (
  `booking_identifier` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(45) COLLATE utf8_bin NOT NULL,
  `details` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `to_booking_idx` (`booking_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_item`
--
ALTER TABLE `booking_item`
  ADD CONSTRAINT `to_booking` FOREIGN KEY (`booking_identifier`) REFERENCES `booking` (`identifier`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `video_db`
--
CREATE DATABASE IF NOT EXISTS `video_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `video_db`;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `video_src` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `video_booking_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE KEY `video_id_UNIQUE` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `video_name`, `video_src`, `video_booking_id`, `status`) VALUES
(241, 'zzzz', 'zzzz', 'VIDEO-e85735c4-7a0a-4e89-be6a-ca4292722002', 'CONFIRMED'),
(242, 'yyyy', 'yyyy', 'VIDEO-bea13d8f-deb7-4b59-a26f-41f5ca06e7e1', 'CONFIRMED'),
(243, NULL, NULL, NULL, 'AVAILABLE'),
(244, NULL, NULL, NULL, 'AVAILABLE'),
(245, NULL, NULL, NULL, 'AVAILABLE'),
(246, NULL, NULL, NULL, 'AVAILABLE'),
(247, NULL, NULL, NULL, 'AVAILABLE'),
(248, NULL, NULL, NULL, 'AVAILABLE'),
(249, NULL, NULL, NULL, 'AVAILABLE'),
(250, NULL, NULL, NULL, 'AVAILABLE'),
(251, NULL, NULL, NULL, 'AVAILABLE'),
(252, NULL, NULL, NULL, 'AVAILABLE'),
(253, NULL, NULL, NULL, 'AVAILABLE'),
(254, NULL, NULL, NULL, 'AVAILABLE'),
(255, NULL, NULL, NULL, 'AVAILABLE'),
(256, NULL, NULL, NULL, 'AVAILABLE'),
(257, NULL, NULL, NULL, 'AVAILABLE'),
(258, NULL, NULL, NULL, 'AVAILABLE'),
(259, NULL, NULL, NULL, 'AVAILABLE'),
(260, NULL, NULL, NULL, 'AVAILABLE');
--
-- Database: `write_agency`
--
CREATE DATABASE IF NOT EXISTS `write_agency` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `write_agency`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `identifier` varchar(40) CHARACTER SET utf8 NOT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `video_name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `video_src` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`identifier`, `channel_name`, `video_name`, `video_src`) VALUES
('da0098e0-5a34-48ee-af10-324fe006e277', 'yyyy', 'yyyy', 'yyyy');

-- --------------------------------------------------------

--
-- Table structure for table `booking_item`
--

DROP TABLE IF EXISTS `booking_item`;
CREATE TABLE IF NOT EXISTS `booking_item` (
  `booking_identifier` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(45) COLLATE utf8_bin NOT NULL,
  `details` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `to_booking_idx` (`booking_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking_item`
--

INSERT INTO `booking_item` (`booking_identifier`, `type`, `details`, `id`) VALUES
('da0098e0-5a34-48ee-af10-324fe006e277', 'VIDEO', 'CHANNEL-955f0ada-5704-474f-afc6-3728c99dc4c1', 83),
('da0098e0-5a34-48ee-af10-324fe006e277', 'VIDEO', 'VIDEO-bea13d8f-deb7-4b59-a26f-41f5ca06e7e1', 84);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_item`
--
ALTER TABLE `booking_item`
  ADD CONSTRAINT `to_booking` FOREIGN KEY (`booking_identifier`) REFERENCES `booking` (`identifier`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
