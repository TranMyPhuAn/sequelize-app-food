-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `SequelizeMeta`;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20230320084008-create-users.js'),
('20230320084344-create-restaurants.js'),
('20230320084546-create-rate-res.js'),
('20230320124039-create-like-res.js'),
('20230320125250-create-food-type.js'),
('20230320125315-create-foods.js'),
('20230320125450-create-sub-food.js'),
('20230320125614-create-orders.js');

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food_type` (`type_id`, `type_name`, `createdAt`, `updatedAt`) VALUES
(1,	'Trái cây',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	'Thực vật',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	'Hải sản',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	'Động vật',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	'Chay',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'https://picsum.photos/1000',
  `price` float DEFAULT NULL,
  `des_cription` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `des_cription`, `type_id`, `createdAt`, `updatedAt`) VALUES
(1,	'Xoài',	'https://picsum.photos/1000',	300,	'Xoài lắc',	1,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	'Xà lách',	'https://picsum.photos/100',	500,	'Rau',	2,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	'Cá ngừ',	'https://picsum.photos/1000',	2000,	'Cá',	3,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	'Thịt bò',	'https://picsum.photos/1000',	2000,	'Thịt bò',	4,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	'Đậu khuôn',	'https://picsum.photos/1000',	300,	'Tàu hủ',	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	'Nấm',	'https://picsum.photos/1000',	400,	'Nấm chay',	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	'Mận',	'https://picsum.photos/1000',	500,	'Quả mận',	1,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	'Cà chua',	'https://picsum.photos/1000',	200,	'Cà chua',	2,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	'Mực',	'https://picsum.photos/1000',	2000,	'Mực loại 1',	3,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(10,	'Tôm',	'https://picsum.photos/1000',	3000,	'Tôm biển',	3,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(11,	'Thịt heo',	'https://picsum.photos/1000',	3000,	'thịt heo',	4,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(12,	'Thịt trâu',	'https://picsum.photos/1000',	5000,	'Thịt trâu',	4,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	'Mẫn cầu',	'https://picsum.photos/1000',	600,	'Mẫn cầu',	1,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(14,	'Đậu',	'https://picsum.photos/1000',	800,	'Lạc',	1,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(15,	'Bắp',	'https://picsum.photos/1000',	700,	'Ngô',	1,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(16,	'Mồng tơi',	'https://picsum.photos/1000',	300,	'Rau mồng tơi',	2,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(17,	'Quả chôm chôm',	'https://picsum.photos/1000',	400,	'quả chôm chôm',	1,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `createdAt`, `updatedAt`) VALUES
(2,	3,	'2021-12-04 02:05:53',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	1,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	6,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	2,	'2022-04-02 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	7,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	9,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	2,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	8,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	7,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	3,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(11,	5,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(11,	10,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(12,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	1,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	5,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	6,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	7,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	9,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(14,	7,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(15,	6,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(15,	7,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(15,	9,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(16,	3,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(18,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(19,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `createdAt`, `updatedAt`) VALUES
(1,	2,	3,	'FDSFDFG3234',	'1,2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(1,	4,	1,	'FDSF234',	'4',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	1,	2,	'DFSDF234',	'1,2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	2,	2,	'FWER2',	'2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	3,	1,	'SDFSF234',	'3',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	5,	3,	'SDFSDF234',	'5,1',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	1,	2,	'234SEDFS',	'1,4',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	3,	1,	'SDFSD234',	'3',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	1,	2,	'GHIJKL4',	'1,4',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	4,	3,	'GHSFSDFIJ0',	'4,2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	2,	2,	'SDFSDF',	'2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	3,	2,	'SDFWRWE',	'3',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	2,	1,	'MNOPQR5',	'2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	5,	1,	'OPQR456',	'5',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	1,	2,	'STUV789',	'1,2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	5,	3,	'SDFSDF',	'5,1',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	1,	1,	'EFGHSDFSIJ8',	'1',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	3,	3,	'WXYZ012',	'3,4',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(10,	2,	1,	'ABCDEF3',	'2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(10,	4,	2,	'KLMNOP9',	'4,2',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `createdAt`, `updatedAt`) VALUES
(1,	2,	5,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	3,	3,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	5,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	9,	5,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	8,	5,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	1,	5,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	3,	1,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	8,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	2,	3,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	9,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	6,	3,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	8,	3,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	2,	2,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	5,	4,	'2022-02-03 10:45:00',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `descs` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `descs`, `createdAt`, `updatedAt`) VALUES
(1,	'Quán nhậu 1977',	'https://limody.vn/wp-content/uploads/2020/10/mon-ngon-quan-1-13.jpg',	'Quán nhậu chú Chíp',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	'Sà Bì Chưởng',	'https://picsum.photos/1000',	'Độ Xeme Pewpew',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	'Nhà hàng Phú Thạnh',	'https://picsum.photos/1000',	'Nhà hàng chú',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	'Nhà Hàng Cơm Lam',	'https://picsum.photos/1000',	'Ăn là ghiền',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	'Nhà Hàng Thanh Mỹ',	'https://picsum.photos/1000',	'Nhà hàng trên sông nỗi',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	'Nhà Hàng PHú Mỹ An',	'https://picsum.photos/1000',	'Nhà hàng Chưa thành lập',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	'Nhà Hàng Hạnh Văn',	'https://picsum.photos/1000',	'Rất ngon',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	'Nhà Hàng Bò Viên',	'https://picsum.photos/1000',	'Ưa thích',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	'Nhà Hàng Exness',	'https://picsum.photos/1000',	'Cá Cảnh',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(10,	'Nhà Hàng Thạnh Mỹ',	'https://picsum.photos/1000',	'Ở Mỹ',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`, `createdAt`, `updatedAt`) VALUES
(1,	'Hành',	6.29,	2,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	'Tiêu',	7.32,	3,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	'Tỏi',	5.42,	13,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	'Ớt',	4.34,	2,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	'Muối',	5.53,	3,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	'Đường',	5.53,	4,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	'Bột ngọt',	5.35,	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	'Tiêu',	5.46,	13,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	'Rau răm',	5.34,	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(10,	'giá',	6.45,	2,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(11,	'rượu',	6.45,	3,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(12,	'bia',	5.45,	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	'gừng',	5.23,	4,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(14,	'nghệ',	6.23,	6,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(15,	'sốt chua cay',	7.45,	4,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(16,	'tương ớt',	7.66,	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(17,	'dầu',	8.56,	6,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(18,	'nước nắm',	7.76,	7,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(19,	'xì dầu',	5.85,	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(20,	'ngũ vị hương',	5.58,	5,	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1,	'Lê Văn Năm',	'lenam@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(2,	'Trần Văn Tin',	'vantin@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(3,	'Nguyễn Lê Huy',	'lehuy@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(4,	'Nguyễn Đức Vinh',	'ducvinh@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(5,	'Võ Duy Ghi',	'duyghi@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(6,	'Trương Nguyễn Hoàng Linh',	'hoangLinh@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(7,	'Lê Hoàng Kiệt',	'hoangKiet@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(8,	'Võ Văn Hoàng',	'hoangVo@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(9,	'Đỗ Văn Danh',	'danhDo@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(10,	'Hoàng Thịnh',	'thinhHoang@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(11,	'Trà Tấn Thanh Vũ',	'thanhVu@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(12,	'Nguyễn Thị Hồng Thúy',	'hongThuy@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(13,	'Nguyễn Thị Liễu',	'thiLieu@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(14,	'Trần Thị Mỹ Hạnh',	'myHanh@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(15,	'Cao Văn Nam',	'namVAn@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(16,	'Lê Quốc Đạt',	'datDiem@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(17,	'Hoàng Mạnh Thắng',	'manhthang@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(18,	'Lê CÔng Hậu',	'congHau@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(19,	'Thái Tử Nam',	'tsasm@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35'),
(20,	'Lê Quang Trung',	'quabTrung@gmail.com',	'123',	'2023-03-21 16:53:35',	'2023-03-21 16:53:35');

-- 2023-03-21 16:54:08
