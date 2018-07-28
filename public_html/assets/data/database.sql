-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table db_hospital_v260.acm_account
DROP TABLE IF EXISTS `acm_account`;
CREATE TABLE IF NOT EXISTS `acm_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.acm_account: ~4 rows (approximately)
/*!40000 ALTER TABLE `acm_account` DISABLE KEYS */;
INSERT IGNORE INTO `acm_account` (`id`, `name`, `type`, `description`, `date`, `status`) VALUES
	(8, 'Doctor Visit Fees', '1', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', '2017-02-28', 1),
	(9, 'Hospital Memo', '1', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor', '2017-02-19', 1),
	(10, 'Credit Account  of Hospital', '2', 'This is demo doctor This is demo doctorThis is demo doctorThis is demo doctorThis is demo doctor', '2017-01-16', 1),
	(11, 'Last Account', '2', 'This is demo doctorThis is demo doctorThis is demo doctorThis is demo doctorThis is demo doctor', '2017-01-16', 1);
/*!40000 ALTER TABLE `acm_account` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.acm_invoice
DROP TABLE IF EXISTS `acm_invoice`;
CREATE TABLE IF NOT EXISTS `acm_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `total` float NOT NULL,
  `vat` float NOT NULL,
  `discount` float NOT NULL,
  `grand_total` float NOT NULL,
  `paid` float NOT NULL,
  `due` float NOT NULL,
  `created_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.acm_invoice: ~4 rows (approximately)
/*!40000 ALTER TABLE `acm_invoice` DISABLE KEYS */;
INSERT IGNORE INTO `acm_invoice` (`id`, `patient_id`, `total`, `vat`, `discount`, `grand_total`, `paid`, `due`, `created_id`, `date`, `status`) VALUES
	(14, 'PNYXYXZM', 50, 7.5, 15, 42.5, 0, 42.5, 2, '2017-01-10', 1),
	(15, 'PL8XEPGJ', 500, 25, 100, 425, 425, 0, 2, '2017-01-15', 1),
	(16, 'PNR6B7EY', 1800, 180, 540, 1440, 0, 1440, 27, '2017-01-16', 1),
	(17, 'PZZWZDVA', 9000, 450, 180, 9270, 0, 9270, 27, '2017-02-27', 1);
/*!40000 ALTER TABLE `acm_invoice` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.acm_invoice_details
DROP TABLE IF EXISTS `acm_invoice_details`;
CREATE TABLE IF NOT EXISTS `acm_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `quantity` float NOT NULL,
  `price` float NOT NULL,
  `subtotal` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.acm_invoice_details: ~5 rows (approximately)
/*!40000 ALTER TABLE `acm_invoice_details` DISABLE KEYS */;
INSERT IGNORE INTO `acm_invoice_details` (`id`, `invoice_id`, `account_id`, `description`, `quantity`, `price`, `subtotal`) VALUES
	(70, 14, 8, 'Visit', 1, 50, 50),
	(71, 15, 8, 'Doctor visit fee', 1, 500, 500),
	(73, 16, 8, 'This is demo doctor', 3, 600, 1800),
	(74, 17, 8, 'Doctor Visit', 1, 5000, 5000),
	(75, 17, 9, 'Bed Fee', 1, 4000, 4000);
/*!40000 ALTER TABLE `acm_invoice_details` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.acm_payment
DROP TABLE IF EXISTS `acm_payment`;
CREATE TABLE IF NOT EXISTS `acm_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `pay_to` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  `created_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.acm_payment: ~5 rows (approximately)
/*!40000 ALTER TABLE `acm_payment` DISABLE KEYS */;
INSERT IGNORE INTO `acm_payment` (`id`, `account_id`, `pay_to`, `description`, `amount`, `created_id`, `date`, `status`) VALUES
	(8, 10, 'Alamin', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 500, 2, '2017-01-16', 1),
	(9, 11, 'Tanzil', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor', 400, 2, '2017-01-16', 1),
	(10, 10, 'Jon Dye', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 200, 27, '2017-01-17', 1),
	(11, 10, 'Kanye', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 500, 27, '2017-01-16', 1),
	(12, 11, 'MR. RAHIM', '', 10000, 27, '2017-02-27', 1);
/*!40000 ALTER TABLE `acm_payment` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.appointment
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.appointment: ~25 rows (approximately)
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT IGNORE INTO `appointment` (`id`, `appointment_id`, `patient_id`, `department_id`, `doctor_id`, `schedule_id`, `serial_no`, `date`, `problem`, `created_by`, `create_date`, `status`) VALUES
	(74, 'AERIUIM1', 'PL8XEPGJ', 15, 15, 21, 1, '2017-01-13', 'Hi ! I have matha betha Problem', 1, '2017-01-12', 1),
	(75, 'AU6167SP', 'P3GWY7V3', 15, 15, 21, 2, '2017-01-13', 'Hi ! Sir I have Mathabetha problem', 8, '2017-01-12', 1),
	(76, 'ASAXBOMC', 'PMXZFDP9', 24, 1, 22, 29, '2017-01-14', 'Hi! hello how are', 2, '2017-01-12', 1),
	(77, 'AZO0W67W', 'PL8XEPGJ', 15, 15, 21, 3, '2017-01-20', 'Pain ', 8, '2017-01-15', 1),
	(78, 'ALEMBJQL', 'P79I35Q5', 12, 12, 19, 1, '2017-01-22', '', 7, '2017-01-16', 1),
	(79, 'AL4WVCVD', 'PPPZJP52', 12, 1, 24, 1, '2017-01-18', 'TE$ST', 7, '2017-01-16', 1),
	(80, 'AZ0YMNYW', 'PNR6B7EY', 15, 1, 21, 1, '2017-10-18', 'Hi ! I am in problem', 8, '2017-01-16', 1),
	(81, 'AMUYVE7L', 'PR5JXID6', 18, 1, 25, 2, '2017-01-16', 'He sir How are you', 2, '2017-01-16', 1),
	(84, 'AK6VLKQ1', 'PYRT7ZOS', 12, 1, 24, 2, '2017-01-18', 'Test', 1, '2017-01-16', 1),
	(85, 'ARUMVG9X', 'P43O0999', 12, 12, 19, 1, '2017-03-05', 'TEST', 0, '2017-02-28', 1),
	(97, 'ATJPS3QD', 'PWBQ2LIR', 12, 1, 26, 1, '2017-10-08', 'TEST', 2, '2017-10-03', 1),
	(98, 'AOV0EX6V', 'P43O0999', 12, 1, 26, 2, '2017-10-08', 'TEST', 1, '2017-10-03', 1),
	(99, 'AG7QSRVG', 'P3GWY7V3', 12, 12, 24, 1, '2017-10-04', 'TEST', 1, '2017-10-03', 1),
	(100, 'A3NYEKF2', 'PL8XEPGJ', 12, 1, 20, 1, '2017-10-06', 'TEST', 1, '2017-10-03', 1),
	(101, 'ADZ5XSNT', 'PL8XEPGJ', 12, 1, 26, 3, '2017-10-08', 'TEST', 1, '2017-10-03', 1),
	(102, 'A69YI1XW', 'PR5JXID6', 12, 12, 24, 2, '2017-10-04', 'TEST', 1, '2017-10-03', 1),
	(103, 'AWZQ25KR', 'P4SKM8O6', 12, 12, 24, 3, '2017-10-04', 'TEST', 7, '2017-10-03', 1),
	(104, 'AO31WUAH', 'PC7XX3B8', 12, 1, 26, 4, '2017-10-08', 'TEST', 0, '2017-10-03', 1),
	(105, 'AYY5DUC7', 'P73FYR4H', 12, 1, 20, 2, '2017-10-06', 'TEST', 0, '2017-10-05', 1),
	(106, 'ABIC772V', 'PY6K4ZNF', 12, 1, 20, 3, '2017-10-06', 'test', 0, '2017-10-05', 1),
	(114, 'A3TC768W', 'PY6K4ZNF', 12, 1, 20, 1, '2017-10-13', '', 0, '2017-10-07', 1),
	(115, 'ASEVGS1F', 'PXVA8KUS', 12, 12, 24, 1, '2017-10-11', 'TEST', 1, '2017-10-08', 1),
	(116, 'AWWSI9NP', 'P3NMSGOR', 12, 1, 27, 1, '2017-10-09', 'Test', 7, '2017-10-08', 1),
	(117, 'AFNMKYYN', 'PLCWTP8G', 12, 1, 27, 2, '2017-10-09', '', 8, '2017-10-08', 1),
	(118, 'A170KPPP', 'PV53V0HJ', 12, 1, 20, 2, '2017-10-13', 'Test Problem', 0, '2017-10-10', 1),
	(119, 'APG978ZK', 'PHGWD0W0', 18, 16, 25, 1, '2017-12-11', '', 0, '2017-12-11', 1),
	(120, 'ACV6WK7Y', 'P9XA38LW', 12, 1, 27, 1, '2017-12-18', '', 0, '2017-12-14', 1);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bill
DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(20) DEFAULT NULL,
  `bill_type` varchar(20) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `admission_id` varchar(20) DEFAULT NULL,
  `discount` float DEFAULT '0',
  `tax` float DEFAULT '0',
  `total` float DEFAULT '0',
  `payment_method` varchar(10) DEFAULT NULL,
  `card_cheque_no` varchar(100) DEFAULT NULL,
  `receipt_no` varchar(100) DEFAULT NULL,
  `note` text,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 3` (`bill_id`),
  KEY `Index 2` (`admission_id`),
  CONSTRAINT `FK_ipd_bill_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bill: ~3 rows (approximately)
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT IGNORE INTO `bill` (`id`, `bill_id`, `bill_type`, `bill_date`, `admission_id`, `discount`, `tax`, `total`, `payment_method`, `card_cheque_no`, `receipt_no`, `note`, `date`, `status`) VALUES
	(17, 'BLURDGODD', 'ipd', '2017-12-10', 'U1XWEV6W ', 500, 344.3, 6, 'Cash', 'EBL1231312', 'EBLP36565', '', '2017-12-17 06:23:09', 1),
	(19, 'BLRKY02DQ', 'ipd', '2017-12-11', 'U1XWEV6W', 500, 0, 1, 'Card', 'EBL1231312', 'EBLP36565', '', '2017-12-17 06:23:38', 1),
	(43, 'BLODMXRLI', 'ipd', '2017-12-17', 'UGN3LLOU', 162.5, 162.5, 3250, 'Cash', 'EXC012', 'ECX0123', 'Test Note', '2017-12-17 10:00:33', 1),
	(46, 'BLF08RJIP', 'ipd', '2017-12-17', 'UKPPPL3J', 500, 0, 4689, 'Cash', 'EXC012', 'ECX0123', '', '2017-12-17 10:10:32', 1),
	(47, 'BLDUM3E43', 'ipd', '2017-12-17', 'UGN3LLOU', 0, 0, 350, 'Cash', 'EXC012', 'ECX0123', '', '2017-12-17 10:13:52', 1),
	(48, 'BLLMZLFPG', 'ipd', '2017-12-17', 'UKPPPL3J', 10, 25, 1000, 'Cash', 'EXC012', 'ECX0123', '', '2017-12-17 10:14:46', 1),
	(50, 'BLDTL9983', 'ipd', '2017-12-17', 'UYNBWBXW', 500, 0, 5056, 'Cash', 'EXC012', '', '', '2017-12-17 10:21:46', 1);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bill_admission
DROP TABLE IF EXISTS `bill_admission`;
CREATE TABLE IF NOT EXISTS `bill_admission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `policy_no` varchar(100) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_relation` varchar(255) DEFAULT NULL,
  `guardian_contact` varchar(255) DEFAULT NULL,
  `guardian_address` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 2` (`admission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bill_admission: ~10 rows (approximately)
/*!40000 ALTER TABLE `bill_admission` DISABLE KEYS */;
INSERT IGNORE INTO `bill_admission` (`id`, `admission_id`, `patient_id`, `doctor_id`, `package_id`, `admission_date`, `discharge_date`, `insurance_id`, `policy_no`, `agent_name`, `guardian_name`, `guardian_relation`, `guardian_contact`, `guardian_address`, `status`) VALUES
	(9, 'UAKWFKPV', 'P3LFN0JJ', 1, 0, '2017-11-29', '2017-11-29', 0, '', '', '', '', '', '', 1),
	(10, 'U8KUSYFN', 'P3LFN0JJ', 1, 0, '2017-11-29', '2017-11-29', 0, '', '', '', '', '', '', 1),
	(11, 'UD3JEM6Y', 'P3LFN0JJ', 1, 0, '2017-11-29', '2017-11-29', 0, '', '', '', '', '', '', 1),
	(12, 'U903HT3K', 'P3LFN0JJ', 1, 0, '2017-11-29', '1970-01-01', 0, '', '', '', '', '', '', 1),
	(13, 'U5UF5NMG', 'P3LFN0JJ', 1, 0, '1970-01-01', '1970-01-01', 0, '', '', '', '', '', '', 1),
	(14, 'UAFH2J5K', 'PV53V0HJ', 13, 11, '2017-11-28', '2017-12-31', 5, '210', 'Elise Anderson', 'Jane Doe', 'Sister', '0123456789', '123/A, Demo street, NY-1000', 1),
	(17, 'U1XWEV6W', 'PV53V0HJ', 22, 7, '2017-11-29', '2017-11-30', 6, '1010', 'Elise Anderson', 'Jane Doe', 'Sister', '0123456789', 'test', 1),
	(18, 'UKPPPL3J', 'PV53V0HJ', 14, 7, '2017-12-11', NULL, 0, '', '', '', '', '', '', 1),
	(19, 'UGN3LLOU', 'P1RNKS9W', 16, 17, '2017-12-17', '2017-12-20', 5, 'SEC012', 'Test', 'John Doe', 'Brother', '0123456789', '123/A, demo street, NY-1000', 1),
	(20, 'UYNBWBXW', 'PJ447J2Z', 13, 7, '2017-12-17', '2017-12-19', 6, 'SEC013', '', '', '', '', '', 1);
/*!40000 ALTER TABLE `bill_admission` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bill_advanced
DROP TABLE IF EXISTS `bill_advanced`;
CREATE TABLE IF NOT EXISTS `bill_advanced` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `amount` float DEFAULT '0',
  `payment_method` varchar(255) DEFAULT NULL,
  `cash_card_or_cheque` varchar(10) DEFAULT NULL COMMENT '1 cash, 2 card, 3 cheque',
  `receipt_no` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ipd_bill_advanced_ipd_admission` (`admission_id`),
  CONSTRAINT `FK_ipd_bill_advanced_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bill_advanced: ~3 rows (approximately)
/*!40000 ALTER TABLE `bill_advanced` DISABLE KEYS */;
INSERT IGNORE INTO `bill_advanced` (`id`, `admission_id`, `patient_id`, `amount`, `payment_method`, `cash_card_or_cheque`, `receipt_no`, `date`) VALUES
	(7, 'U1XWEV6W', 'PV53V0HJ', 150, '', 'Cash', 'EB323', '2017-12-04 09:43:08'),
	(8, 'U1XWEV6W', 'PV53V0HJ', 100, '', 'Card', 'E135633', '2017-12-04 09:42:51'),
	(9, 'U1XWEV6W', 'PV53V0HJ', 1000, '', 'Cash', '', '2017-12-11 11:38:54'),
	(10, 'UGN3LLOU', 'P1RNKS9W', 1000, 'Card', 'Card', 'ECX0123', '2017-12-17 06:30:46');
/*!40000 ALTER TABLE `bill_advanced` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bill_details
DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE IF NOT EXISTS `bill_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(20) DEFAULT NULL,
  `admission_id` varchar(20) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT '0',
  `amount` float DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Key As Bill_ID` (`bill_id`),
  KEY `Admission ID` (`admission_id`),
  CONSTRAINT `fk_ipd_bill_details_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ipd_bill_details_ipd_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bill_details: ~14 rows (approximately)
/*!40000 ALTER TABLE `bill_details` DISABLE KEYS */;
INSERT IGNORE INTO `bill_details` (`id`, `bill_id`, `admission_id`, `package_id`, `service_id`, `quantity`, `amount`, `date`) VALUES
	(140, 'BLURDGODD', 'U1XWEV6W ', 0, 3, 10, 100, '2017-12-17'),
	(141, 'BLURDGODD', 'U1XWEV6W ', 0, 6, 1, 3456, '2017-12-17'),
	(142, 'BLURDGODD', 'U1XWEV6W ', 0, 2, 1, 100, '2017-12-17'),
	(143, 'BLURDGODD', 'U1XWEV6W ', 0, 11, 10, 233, '2017-12-17'),
	(150, 'BLRKY02DQ', 'U1XWEV6W', 0, 5, 1, 150, '2017-12-17'),
	(151, 'BLRKY02DQ', 'U1XWEV6W', 0, 6, 1, 100, '2017-12-17'),
	(152, 'BLRKY02DQ', 'U1XWEV6W', 0, 10, 1, 200, '2017-12-17'),
	(153, 'BLRKY02DQ', 'U1XWEV6W', 0, 4, 1, 500, '2017-12-17'),
	(154, 'BLRKY02DQ', 'U1XWEV6W', 0, 4, 1, 500, '2017-12-17'),
	(155, 'BLRKY02DQ', 'U1XWEV6W', 0, 11, 1, 233, '2017-12-17'),
	(256, 'BLODMXRLI', 'UGN3LLOU', 17, 5, 1, 150, '2017-12-17'),
	(257, 'BLODMXRLI', 'UGN3LLOU', 17, 10, 1, 200, '2017-12-17'),
	(258, 'BLODMXRLI', 'UGN3LLOU', 17, 4, 1, 500, '2017-12-17'),
	(259, 'BLODMXRLI', 'UGN3LLOU', 17, 3, 10, 50, '2017-12-17'),
	(260, 'BLODMXRLI', 'UGN3LLOU', 17, 10, 1, 200, '2017-12-17'),
	(261, 'BLODMXRLI', 'UGN3LLOU', 17, 10, 1, 200, '2017-12-17'),
	(262, 'BLODMXRLI', 'UGN3LLOU', 17, 4, 3, 500, '2017-12-17'),
	(270, 'BLF08RJIP', 'UKPPPL3J', 7, 3, 10, 100, '2017-12-17'),
	(271, 'BLF08RJIP', 'UKPPPL3J', 7, 6, 1, 3456, '2017-12-17'),
	(272, 'BLF08RJIP', 'UKPPPL3J', 7, 11, 1, 233, '2017-12-17'),
	(273, 'BLDUM3E43', 'UGN3LLOU', 17, 5, 1, 150, '2017-12-17'),
	(274, 'BLDUM3E43', 'UGN3LLOU', 17, 10, 1, 200, '2017-12-17'),
	(275, 'BLLMZLFPG', 'UKPPPL3J', 7, 3, 10, 100, '2017-12-17'),
	(280, 'BLDTL9983', 'UYNBWBXW', 7, 3, 10, 100, '2017-12-17'),
	(281, 'BLDTL9983', 'UYNBWBXW', 7, 6, 1, 3456, '2017-12-17'),
	(282, 'BLDTL9983', 'UYNBWBXW', 7, 2, 1, 100, '2017-12-17'),
	(283, 'BLDTL9983', 'UYNBWBXW', 7, 4, 1, 500, '2017-12-17');
/*!40000 ALTER TABLE `bill_details` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bill_package
DROP TABLE IF EXISTS `bill_package`;
CREATE TABLE IF NOT EXISTS `bill_package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `services` text,
  `discount` float DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bill_package: ~2 rows (approximately)
/*!40000 ALTER TABLE `bill_package` DISABLE KEYS */;
INSERT IGNORE INTO `bill_package` (`id`, `name`, `description`, `services`, `discount`, `status`) VALUES
	(7, 'Package lll', '', '[{"id":"3","name":"Nurse Fee","quantity":"10","amount":"100"},{"id":"6","name":"Hospital Fee","quantity":"1","amount":"3456"},{"id":"2","name":"OT","quantity":"1","amount":"100"},{"id":"4","name":"Room Rent","quantity":"1","amount":"500"}]', 500, 1),
	(17, 'Package 1', '', '[{"id":"5","name":"Doctor Fee","quantity":"1","amount":"150"},{"id":"10","name":"Hospital Fee","quantity":"1","amount":"200"},{"id":"4","name":"Room Rent","quantity":"1","amount":"500"},{"id":"3","name":"Nurse Fee","quantity":"10","amount":"50"}]', 20, 1);
/*!40000 ALTER TABLE `bill_package` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bill_service
DROP TABLE IF EXISTS `bill_service`;
CREATE TABLE IF NOT EXISTS `bill_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` float DEFAULT '0',
  `amount` float DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bill_service: ~7 rows (approximately)
/*!40000 ALTER TABLE `bill_service` DISABLE KEYS */;
INSERT IGNORE INTO `bill_service` (`id`, `name`, `description`, `quantity`, `amount`, `status`) VALUES
	(2, 'OT', 'Test', 1, 300, 1),
	(3, 'Nurse Fee', '', 10, 50, 1),
	(4, 'Room Rent', '', 1, 500, 1),
	(5, 'Doctor Fee', '', 1, 150, 1),
	(6, 'Hello', '', 1, 100, 1),
	(10, 'Hospital Fee', 'Test', 1, 200, 1),
	(11, 'Test Service', '', 1, 233, 1);
/*!40000 ALTER TABLE `bill_service` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bm_bed
DROP TABLE IF EXISTS `bm_bed`;
CREATE TABLE IF NOT EXISTS `bm_bed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `limit` int(3) NOT NULL,
  `charge` float NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bm_bed: ~4 rows (approximately)
/*!40000 ALTER TABLE `bm_bed` DISABLE KEYS */;
INSERT IGNORE INTO `bm_bed` (`id`, `type`, `description`, `limit`, `charge`, `status`) VALUES
	(1, 'NON-AC - 5th Floor', 'This is Test Bed', 20, 5000, 1),
	(2, 'AC - 4th Floor', 'This is Test bed\r\n', 5, 10000, 1),
	(3, 'AC - 3rd Floor', 'This is Test bed\r\n', 10, 12000, 1),
	(4, 'AC - 2nd Floor', 'This is Test bed\r\n', 2, 18000, 1);
/*!40000 ALTER TABLE `bm_bed` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bm_bed_assign
DROP TABLE IF EXISTS `bm_bed_assign`;
CREATE TABLE IF NOT EXISTS `bm_bed_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `assign_date` date NOT NULL,
  `discharge_date` date NOT NULL,
  `assign_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.bm_bed_assign: ~34 rows (approximately)
/*!40000 ALTER TABLE `bm_bed_assign` DISABLE KEYS */;
INSERT IGNORE INTO `bm_bed_assign` (`id`, `serial`, `patient_id`, `bed_id`, `description`, `assign_date`, `discharge_date`, `assign_by`, `status`) VALUES
	(206, 'AM4QD0', 'PA0I54ZM', 2, '', '2017-01-24', '2017-01-27', 2, 1),
	(207, 'AM4QD0', 'PA0I54ZM', 2, '', '2017-01-25', '2017-01-27', 2, 1),
	(208, 'AM4QD0', 'PA0I54ZM', 2, '', '2017-01-26', '2017-01-27', 2, 1),
	(209, 'AM4QD0', 'PA0I54ZM', 2, '', '2017-01-27', '2017-01-27', 2, 1),
	(223, 'WYUKLB', 'PA0I54ZM', 2, '', '2017-01-24', '2017-01-25', 2, 1),
	(224, 'WYUKLB', 'PA0I54ZM', 2, '', '2017-01-25', '2017-01-25', 2, 1),
	(241, '2ZUESF', 'P1RNKS9W', 1, '', '2017-01-24', '2017-01-28', 2, 1),
	(242, '2ZUESF', 'P1RNKS9W', 1, '', '2017-01-25', '2017-01-28', 2, 1),
	(243, '2ZUESF', 'P1RNKS9W', 1, '', '2017-01-26', '2017-01-28', 2, 1),
	(244, '2ZUESF', 'P1RNKS9W', 1, '', '2017-01-27', '2017-01-28', 2, 1),
	(245, '2ZUESF', 'P1RNKS9W', 1, '', '2017-01-28', '2017-01-28', 2, 1),
	(246, 'V5JDZV', 'PYRT7ZOS', 2, '', '2017-01-26', '2017-01-28', 2, 1),
	(247, 'V5JDZV', 'PYRT7ZOS', 2, '', '2017-01-27', '2017-01-28', 2, 1),
	(248, 'V5JDZV', 'PYRT7ZOS', 2, '', '2017-01-28', '2017-01-28', 2, 1),
	(254, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-24', '2017-01-31', 2, 1),
	(255, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-25', '2017-01-31', 2, 1),
	(256, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-26', '2017-01-31', 2, 1),
	(257, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-27', '2017-01-31', 2, 1),
	(258, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-28', '2017-01-31', 2, 1),
	(259, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-29', '2017-01-31', 2, 1),
	(260, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-30', '2017-01-31', 2, 1),
	(261, 'CQAGY3', 'P3GWY7V3', 1, '', '2017-01-31', '2017-01-31', 2, 1),
	(262, 'FXWA25', 'PA0I54ZM', 1, '', '2017-01-24', '2017-01-28', 2, 1),
	(263, 'FXWA25', 'PA0I54ZM', 1, '', '2017-01-25', '2017-01-28', 2, 1),
	(264, 'FXWA25', 'PA0I54ZM', 1, '', '2017-01-26', '2017-01-28', 2, 1),
	(265, 'FXWA25', 'PA0I54ZM', 1, '', '2017-01-27', '2017-01-28', 2, 1),
	(266, 'FXWA25', 'PA0I54ZM', 1, '', '2017-01-28', '2017-01-28', 2, 1),
	(270, '8G3DZ5', 'ASDFG', 1, '', '2017-02-23', '2017-02-23', 1, 1),
	(271, 'B6LJFN', 'PNR6B7EY', 2, '', '2017-02-23', '2017-02-28', 1, 1),
	(272, 'B6LJFN', 'PNR6B7EY', 2, '', '2017-02-24', '2017-02-28', 1, 1),
	(273, 'B6LJFN', 'PNR6B7EY', 2, '', '2017-02-25', '2017-02-28', 1, 1),
	(274, 'B6LJFN', 'PNR6B7EY', 2, '', '2017-02-26', '2017-02-28', 1, 1),
	(275, 'B6LJFN', 'PNR6B7EY', 2, '', '2017-02-27', '2017-02-28', 1, 1),
	(276, 'B6LJFN', 'PNR6B7EY', 2, '', '2017-02-28', '2017-02-28', 1, 1);
/*!40000 ALTER TABLE `bm_bed_assign` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.cm_patient
DROP TABLE IF EXISTS `cm_patient`;
CREATE TABLE IF NOT EXISTS `cm_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) NOT NULL,
  `case_manager_id` int(11) NOT NULL,
  `ref_doctor_id` int(11) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_address` text,
  `doctor_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.cm_patient: ~6 rows (approximately)
/*!40000 ALTER TABLE `cm_patient` DISABLE KEYS */;
INSERT IGNORE INTO `cm_patient` (`id`, `patient_id`, `case_manager_id`, `ref_doctor_id`, `hospital_name`, `hospital_address`, `doctor_name`, `created_by`, `date`, `status`) VALUES
	(1, 'P1XWEV6W', 30, 1, 'Demo Hospital ', '123, Apartment, Demo Street.\r\n', 'John Doe', 2, '2017-04-22', 1),
	(7, 'P45KRFCA', 30, 1, 'XYZ HOSPITAL', 'ABC, 1234, ABC street', 'XYZ', 2, '2017-04-22', 1),
	(9, 'PNR6B7EY', 30, 14, 'XYZ HOSPITAL', '', '', 2, '2017-04-22', 1),
	(10, 'P43O0999', 30, 17, 'TEST ', 'TEST', 'TEST', 2, '2017-04-23', 1),
	(11, 'P1XWEV6W', 31, 12, 'Demo Hospital, IN', 'Demo ', 'Demo Doctor', 2, '2017-04-23', 1),
	(12, 'P45KRFCA', 31, 1, '', '', '', 2, '2017-04-23', 1),
	(13, 'PNR6B7EY', 30, 12, 'Test Hospital Ltd.', '1234/C, Apartment, Example street, NY-1000', 'Mr. Doctor', 2, '2017-11-21', 1);
/*!40000 ALTER TABLE `cm_patient` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.cm_status
DROP TABLE IF EXISTS `cm_status`;
CREATE TABLE IF NOT EXISTS `cm_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `critical_status` varchar(255) NOT NULL DEFAULT '1',
  `cm_patient_id` int(11) NOT NULL,
  `description` text,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.cm_status: ~22 rows (approximately)
/*!40000 ALTER TABLE `cm_status` DISABLE KEYS */;
INSERT IGNORE INTO `cm_status` (`id`, `critical_status`, `cm_patient_id`, `description`, `datetime`) VALUES
	(20, 'Undeterminate', 1, 'This is test status\r\nand this status is "ok". ', '2017-04-22 13:02:16'),
	(21, 'Undeterminate', 1, 'TEST', '2017-04-22 13:04:22'),
	(22, 'Undeterminate', 12, 'One Star', '2017-04-22 13:16:01'),
	(23, 'Undeterminate', 12, 'Two Star', '2017-04-22 13:16:07'),
	(24, 'Undeterminate', 12, 'Five Star', '2017-04-22 13:16:15'),
	(25, 'Undeterminate', 12, 'Three Star', '2017-04-22 13:16:23'),
	(26, 'Undeterminate', 12, 'Four Star', '2017-04-22 13:35:36'),
	(33, 'Undeterminate', 1, 'Good', '2017-04-22 14:13:04'),
	(34, 'Undeterminate', 9, 'Critical', '2017-04-22 15:02:27'),
	(35, 'Undeterminate', 9, 'Fair !', '2017-04-22 15:02:36'),
	(36, 'Undeterminate', 12, '[removed]alert&#40;1&#41;[removed]', '2017-04-23 08:33:08'),
	(37, 'Undeterminate', 9, 'TEST', '2017-04-23 08:45:11'),
	(38, 'Undeterminate', 10, 'Undetermined', '2017-04-23 09:22:55'),
	(39, 'Undeterminate', 10, 'TEST ', '2017-04-23 09:49:19'),
	(40, 'Undeterminate', 10, 'TET', '2017-04-23 09:52:10'),
	(41, 'Undeterminate', 11, 'Undetermined status ', '2017-04-23 09:58:00'),
	(42, 'Undeterminate', 11, 'Current status is fair', '2017-04-23 09:58:30'),
	(43, 'HELLO #', 12, 'WORLD!', '2017-04-25 12:43:44'),
	(44, 'HELLO', 12, 'WORLD', '2017-04-25 12:52:57'),
	(45, 'ASFSD', 12, 'SFASF', '2017-04-25 12:52:57'),
	(46, 'ASFSD', 12, 'SFASF', '2017-04-25 12:52:57'),
	(47, 'ASFSD', 12, 'SFASF', '2017-04-25 12:52:57');
/*!40000 ALTER TABLE `cm_status` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.custom_sms_info
DROP TABLE IF EXISTS `custom_sms_info`;
CREATE TABLE IF NOT EXISTS `custom_sms_info` (
  `custom_sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `reciver` varchar(100) NOT NULL,
  `gateway` text NOT NULL,
  `message` text NOT NULL,
  `sms_date_time` datetime NOT NULL,
  PRIMARY KEY (`custom_sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.custom_sms_info: ~39 rows (approximately)
/*!40000 ALTER TABLE `custom_sms_info` DISABLE KEYS */;
INSERT IGNORE INTO `custom_sms_info` (`custom_sms_id`, `reciver`, `gateway`, `message`, `sms_date_time`) VALUES
	(6, '018217842552', 'nexmo', 'Hello, Jane Doe. Your ID: PWBQ2LIR, Appointment ID: AFW21D2F, Serial: 1 and Appointment Date: 15 October 2017. Thank you for the Appointment.', '2017-10-03 09:04:35'),
	(7, '1922296392', 'nexmo', 'Hello, Tanzil Ahmad. Your ID: PR5JXID6, Appointment ID: AO8CBBQD, Serial: 2 and Appointment Date: 08 October 2017. Thank you for the Appointment.', '2017-10-03 09:15:32'),
	(8, '018217842552', 'nexmo', 'Hello, Jane Doe. Your ID: PWBQ2LIR, Appointment ID: ATJTAZZW, Serial: 1 and Appointment Date: 04 October 2017. Thank you for the Appointment.', '2017-10-03 09:23:12'),
	(9, '01821742285', 'nexmo', 'Hello, Jahed Abdullah. Your ID: PC2YMXFN, Appointment ID: %appointment_id%, Serial: %sequence% and Appointment Date: %appointment_date%. Thank you for the Appointment.', '2017-10-03 09:37:25'),
	(10, '018217842552', 'nexmo', 'Hello, Jane Doe. \r\nYour Patient ID: PWBQ2LIR,\r\nAppointment ID: ATJPS3QD, \r\nSerial: 1 and\r\nAppointment Date: 08 October 2017. \r\nThank You.', '2017-10-03 12:20:55'),
	(11, '0123456789', 'nexmo', 'Hello, Sahed Abdullah. \r\nYour Patient ID: P43O0999,\r\nAppointment ID: AOV0EX6V, \r\nSerial: 2 and\r\nAppointment Date: 08 October 2017. \r\nThank You.', '2017-10-03 01:29:47'),
	(12, '018111111111', 'nexmo', 'Hello, Znakng  Xinaktar. \r\nYour Patient ID: P3GWY7V3,\r\nAppointment ID: AG7QSRVG, \r\nSerial: 1 and\r\nAppointment Date: 04 October 2017. \r\nThank You.', '2017-10-03 01:33:31'),
	(13, '01922296392', 'nexmo', 'Hello, Amer Ahmedullah . \r\nYour Patient ID: PL8XEPGJ,\r\nAppointment ID: A3NYEKF2, \r\nSerial: 1 and\r\nAppointment Date: 06 October 2017. \r\nThank You.', '2017-10-03 01:34:25'),
	(14, '01922296392', 'nexmo', 'Hello, Amer Ahmedullah . \r\nYour Patient ID: PL8XEPGJ,\r\nAppointment ID: ADZ5XSNT, \r\nSerial: 3 and\r\nAppointment Date: 08 October 2017. \r\nThank You.', '2017-10-03 01:36:16'),
	(15, '1922296392', 'nexmo', 'Hello, Tanzil Ahmad. \r\nYour Patient ID: PR5JXID6,\r\nAppointment ID: A69YI1XW, \r\nSerial: 2 and\r\nAppointment Date: 04 October 2017. \r\nThank You.', '2017-10-03 01:38:09'),
	(16, '01821742285', 'nexmo', 'Hello, Jane  Doe. \r\nYour Patient ID: P8U5B5VR,\r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and\r\nAppointment Date: %appointment_date%. \r\nThank You.', '2017-10-03 01:39:31'),
	(17, '01821742285', 'nexmo', 'Hello, Jony Alam. \r\nYour Patient ID: P4SKM8O6,\r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and\r\nAppointment Date: %appointment_date%. \r\nThank You.', '2017-10-03 01:42:21'),
	(18, '01821742285', 'nexmo', 'Hello, Jony Alam. \r\nYour Patient ID: P4SKM8O6,\r\nAppointment ID: AWZQ25KR, \r\nSerial: 3 and\r\nAppointment Date: 04 October 2017. \r\nThank You.', '2017-10-03 01:42:49'),
	(19, '01821742285', 'nexmo', 'Hello, Kawsar Jahan. \r\nYour Patient ID: PC7XX3B8,\r\nAppointment ID: A468SW9K, \r\nSerial: 4 and\r\nAppointment Date: 04 October 2017. \r\nThank You.', '2017-10-03 01:49:02'),
	(20, '01821742285', 'nexmo', 'Hello, Jahed Alam. \r\nYour Patient ID: P7Q6SFYR,\r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and\r\nAppointment Date: %appointment_date%. \r\nThank You.', '2017-10-03 01:50:50'),
	(21, '01821742285', 'nexmo', 'Hello, Jahed Alam. \r\nYour Patient ID: P7Q6SFYR,\r\nAppointment ID: AFCAH8QD, \r\nSerial: 5 and\r\nAppointment Date: 08 October 2017. \r\nThank You.', '2017-10-03 02:14:04'),
	(28, '0123456789', 'nexmo', 'Hello, Ashif Islam. \r\nYour Patient ID: P73FYR4H,\r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and\r\nAppointment Date: %appointment_date%. \r\nThank You.', '2017-10-05 07:31:20'),
	(29, '0123456789', 'nexmo', 'Hello, Ashif Islam. \r\nYour Patient ID: P73FYR4H,\r\nAppointment ID: AYY5DUC7, \r\nSerial: 2 and\r\nAppointment Date: 06 October 2017. \r\nThank You.', '2017-10-05 07:34:03'),
	(30, '0123456789', 'nexmo', 'Hello, Kamal Uddin. \r\nYour Patient ID: PY6K4ZNF,\r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and\r\nAppointment Date: %appointment_date%. \r\nThank You.', '2017-10-05 07:47:55'),
	(31, '0123456789', 'nexmo', 'Hello, Kamal Uddin. \r\nYour Patient ID: PY6K4ZNF,\r\nAppointment ID: ABIC772V, \r\nSerial: 3 and\r\nAppointment Date: 06 October 2017. \r\nThank You.', '2017-10-05 07:54:50'),
	(32, '0123456789', 'nexmo', '%doctor_name%. \r\nHello, Jahed Abduallah. \r\nYour ID: PS4ZNFBI, \r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', '2017-10-07 11:31:36'),
	(33, '0123456789', 'nexmo', '%doctor_name%. \r\nHello, Jahed Abduallah. \r\nYour ID: P7N8LTT1, \r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', '2017-10-07 11:32:49'),
	(34, '0123456789', 'nexmo', '%doctor_name%. \r\nHello, Jahed Abduallah. \r\nYour ID: PIBQOWSP, \r\nAppointment ID: %appointment_id%, \r\nSerial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', '2017-10-07 11:35:00'),
	(35, '0123456789', 'nexmo', 'Hello, Jahed Abduallah. \r\nYour ID: PH11SH74,  \r\nThank you for the registration.', '2017-10-07 11:39:55'),
	(36, '0123456789', 'nexmo', 'Samim Hasan Khan. Hello, Jahed Abduallah. Your ID: PH11SH74, Appointment ID: A0OLAUGR, Serial: 5 and Appointment Date: 08 October 2017. Thank you for the Appointment.', '2017-10-07 11:41:25'),
	(37, '0123456789', 'nexmo', 'Hello, Jahed Abduallah. \r\nYour ID: PJ447J2Z,  \r\nThank you for the registration.', '2017-10-07 11:54:07'),
	(38, '0123456789', 'nexmo', 'Samim Hasan Khan. Hello, Jahed Abduallah. Your ID: PJ447J2Z, Appointment ID: A4CM0XD8, Serial: 1 and Appointment Date: 09 October 2017. Thank you for the Appointment.', '2017-10-07 11:55:36'),
	(39, '0123456789', 'nexmo', 'Doctor, Samim Hasan Khan. \r\nHello, Jahed Abduallah. \r\nYour ID: PH11SH74, Appointment ID: AD8D8TIJ, Serial: 1 and Appointment Date: 13 October 2017. \r\nThank you for the Appointment.', '2017-10-07 02:05:09'),
	(40, '0123456789', 'nexmo', 'Doctor, Samim Hasan Khan. \r\nHello, Kamal Uddin. \r\nYour ID: PY6K4ZNF, Appointment ID: A0W0Y4VO, Serial: 1 and Appointment Date: 13 October 2017. \r\nThank you for the Appointment.', '2017-10-07 02:06:06'),
	(41, '0123456789', 'nexmo', 'TEST', '2017-10-07 02:07:12'),
	(42, '0123456789', 'nexmo', 'Hello, John Doe. \r\nYour ID: PXVA8KUS,  \r\nThank you for the registration.', '2017-10-08 07:31:48'),
	(43, '0123456789', 'nexmo', 'Doctor, Dr. Elvera  A. Lewis. \r\nHello, John Doe. \r\nYour ID: PXVA8KUS, Appointment ID: ASEVGS1F, Serial: 1 and Appointment Date: 11 October 2017. \r\nThank you for the Appointment.', '2017-10-08 07:32:32'),
	(44, '0123456789', 'nexmo', 'Hello, Jennifer Smith. \r\nYour ID: P3NMSGOR,  \r\nThank you for the registration.', '2017-10-08 07:35:37'),
	(45, '0123456789', 'nexmo', 'Doctor, Samim Hasan Khan. \r\nHello, Jennifer Smith. \r\nYour ID: P3NMSGOR, Appointment ID: AWWSI9NP, Serial: 1 and Appointment Date: 09 October 2017. \r\nThank you for the Appointment.', '2017-10-08 07:36:03'),
	(46, '0123456789', 'nexmo', 'Hello, Ema W.. \r\nYour ID: PLCWTP8G,  \r\nThank you for the registration.', '2017-10-08 07:39:23'),
	(47, '0123456789', 'nexmo', 'Doctor, Samim Hasan Khan. \r\nHello, Ema W.. \r\nYour ID: PLCWTP8G, Appointment ID: AFNMKYYN, Serial: 2 and Appointment Date: 09 October 2017. \r\nThank you for the Appointment.', '2017-10-08 07:39:46'),
	(48, '0123456789', 'nexmo', 'Hello, Kamal Uddin. \r\nYour ID: PV53V0HJ,  \r\nThank you for the registration.', '2017-10-10 08:05:02'),
	(49, '0123456789', 'nexmo', 'Doctor, Samim Hasan Khan. \r\nHello, Kamal Uddin. \r\nYour ID: PV53V0HJ, Appointment ID: A170KPPP, Serial: 2 and Appointment Date: 13 October 2017. \r\nThank you for the Appointment.', '2017-10-10 08:05:55'),
	(50, '0123456789', 'nexmo', 'Test Message', '2017-10-10 05:25:57'),
	(51, '0123456879', 'nexmo', 'Hello, Hello  World. \r\nYour ID: P3LFN0JJ,  \r\nThank you for the registration.', '2017-11-15 11:08:16'),
	(52, '0123456789', 'nexmo', 'Hello, HM ISHAK. \r\nYour ID: PHGWD0W0,  \r\nThank you for the registration.', '2017-12-11 05:01:31'),
	(53, '0123456789', 'nexmo', 'Doctor, Dr.Dilmara  Xyanturamana . \r\nHello, HM ISHAK. \r\nYour ID: PHGWD0W0, Appointment ID: APG978ZK, Serial: 1 and Appointment Date: 11 December 2017. \r\nThank you for the Appointment.', '2017-12-11 12:16:58'),
	(54, '0123456789', 'nexmo', 'Hello, Test Test. \r\nYour ID: P9XA38LW,  \r\nThank you for the registration.', '2017-12-14 11:03:34'),
	(55, '0123456789', 'nexmo', 'Doctor, Samim Hasan Khan. \r\nHello, Test Test. \r\nYour ID: P9XA38LW, Appointment ID: ACV6WK7Y, Serial: 1 and Appointment Date: 18 December 2017. \r\nThank you for the Appointment.', '2017-12-14 11:03:58');
/*!40000 ALTER TABLE `custom_sms_info` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dprt_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dprt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.department: ~12 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT IGNORE INTO `department` (`dprt_id`, `name`, `description`, `status`) VALUES
	(12, 'Microbiology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(13, 'Neonatal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(14, 'Nephrology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(15, 'Neurology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(16, 'Oncology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(17, 'Orthopaedics', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(18, 'Pharmacy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(19, 'Radiotherapy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(21, 'Rheumatology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(22, 'Gynaecology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(23, 'Obstetrics', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
	(25, 'General Surgery', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula.', 1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.document
DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `description` text,
  `hidden_attach_file` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `upload_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.document: ~5 rows (approximately)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT IGNORE INTO `document` (`id`, `patient_id`, `doctor_id`, `description`, `hidden_attach_file`, `date`, `upload_by`) VALUES
	(4, 'P1XWEV6W', 1, '<p>TET</p>', './assets/attachments/admin_kill-command_hi_bengali-1531392.zip', '2017-04-25', 2),
	(5, 'P1XWEV6W', 13, '<p>TET</p>', './assets/attachments/admin_chrysanthemum.jpg', '2017-04-25', 2),
	(6, 'P1XWEV6W', 13, '<p>TET</p>', './assets/attachments/admin_examplefile.pdf', '2017-04-25', 2),
	(9, 'P45KRFCA', 16, '<p>P45KRFCA</p>', './assets/attachments/admin_admin_examplefile.pdf', '2017-04-25', 2),
	(13, 'TEST', 0, '', '', '2017-10-28', 2);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.enquiry
DROP TABLE IF EXISTS `enquiry`;
CREATE TABLE IF NOT EXISTS `enquiry` (
  `enquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `enquiry` text,
  `checked` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`enquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.enquiry: ~9 rows (approximately)
/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT IGNORE INTO `enquiry` (`enquiry_id`, `email`, `phone`, `name`, `enquiry`, `checked`, `ip_address`, `user_agent`, `checked_by`, `created_date`, `status`) VALUES
	(56, 'tanzil4091@gmail.com', '1922296392', 'Tanzil Ahmad', 'Hi ! I want to add your Hospital', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 2, '2017-01-16 05:29:20', 1),
	(57, 'sumch@gmail.com', '1922296398', 'Tarek', 'Hi ! I want to work with hospital', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 7, '2017-01-16 05:30:05', 1),
	(58, 'jon@gmail.com', '1782296392', 'Jon Doy', 'Hi ! How are you. i want to work with demo hospital limited.', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 7, '2017-01-16 05:31:15', 1),
	(59, 'john@doe.com', '01255564757845', 'John Doe', '<p>HELLO</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-26 09:32:46', 0),
	(60, 'john@doe.com', '01255564757845', 'John Doe', '<p>HELLO</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 7, '2017-02-26 09:34:20', 0),
	(62, 'john@doe.com', '01312323456', 'John Doe', '<p>Hello World!</p>\r\n<p>Ã‚Â </p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-26 11:25:20', 1),
	(63, 'receptionist@demo.com', '0123456789', 'Test', '<p>HELLO ADMIN!</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-27 09:06:10', 1),
	(64, 'test@demo.com', '0123456789', 'Test', 'Need a Doctor for Check-up?\r\nJUST MAKE AN APPOINTMENT & YOU\'RE DONE !', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-27 10:32:02', 1),
	(65, 'swift@example.com', '1234567890', 'Swift', 'Need a Doctor for Check-up?\r\nJUST MAKE AN APPOINTMENT & YOU\'RE DONE !', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-28 11:39:52', 1);
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ha_birth
DROP TABLE IF EXISTS `ha_birth`;
CREATE TABLE IF NOT EXISTS `ha_birth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ha_birth: ~5 rows (approximately)
/*!40000 ALTER TABLE `ha_birth` DISABLE KEYS */;
INSERT IGNORE INTO `ha_birth` (`id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`) VALUES
	(1, 'Accident ', 'Insurance companies will try to pay you less than your claim is worth. Don\'t let them! Use our free case evaluation to get the true value of your injury case.\r\n\r\nAccidents that commonly result in compensation include:\r\n\r\nCar accident injuries\r\nPedestrian accidents\r\nHit and runs\r\nDrunk driving crashes\r\nDangerous road construction accidents\r\nMotorcycle accidents\r\nCommercial trucking accidents\r\nUninsured motorists\r\nYour case review will be performed by a local car accident attorney. They will provide you an accurate estimate of your claim value and can help you get money for lost wages, personal injuries, medical bills, and pain and suffering.\r\n\r\nThe case evaluation is of no obligation to you. However, even if you do choose to work with a car accident attorney, you pay $0 unless you win! There are no upfront fees.', 'PNYXYXZM', 13, '2017-01-09', 1),
	(2, 'Insurance companies will try to pay you less than .', 'PHP 5.5+ require at least Windows 2008/Vista, or 2008r2, 2012, 2012r2, 2016 or 7, 8, 8.1, 10. Either 32-Bit or 64-bit (aka X86 or X64. PHP does not run on Windows RT/WOA/ARM).\r\n\r\nPHP requires the Visual C runtime(CRT). Many applications require that so it may already be installed.\r\n\r\nPHP 5.5 and 5.6 require VC CRT 11 (Visual Studio 2012). See: Ã‚Â» https://www.microsoft.com/en-us/download/details.aspx?id=30679\r\n\r\nPHP 7.0+ requires VC CRT 14 (Visual Studio 2015). See: Ã‚Â» https://www.microsoft.com/en-us/download/details.aspx?id=48145\r\n\r\nYou MUST download the x86 CRT for PHP x86 builds and the x64 CRT for PHP x64 builds.\r\n\r\nIf CRT is already installed, the installer will tell you that and not change anything.\r\n\r\nThe CRT installer supports the /quiet and /norestart command-line switches, so you can script running it.\r\n\r\nVC11 CRT DLLs can be copied from your local machine to a remote machine(a `Copy Deployment` installation) instead of running the installer on the remote machine (such as a web server you have restricted access to). See: http://www.sitepoint.com/install-php53-windows/\r\n\r\nVC14 CRT does not support a `Copy Deployment` installation. VC14 CRT has many more DLLs(most in files with names starting with api-*). If you can find them all and copy them, it will also work (try a tool like Resource Hacker to get a list of all the DLLs to copy).', 'PMXZFDP9', 17, '2017-01-31', 1),
	(3, 'TEST', '', '12213', 0, '2017-02-23', 1),
	(4, 'TEST', '', '12213', 1, '2017-02-23', 1),
	(5, 'TEST', 'Ã Â¦â€¡Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â¨Ã Â§â€¡Ã Â¦Â° Ã Â¦ÂªÃ Â§ÂÃ Â¦Â°Ã Â¦Â¤Ã Â¦Â¿Ã Â¦Â°Ã Â¦â€¢Ã Â§ÂÃ Â¦Â·Ã Â¦Â¾ Ã Â¦Â¸Ã Â¦â€¢Ã Â§ÂÃ Â¦Â·Ã Â¦Â®Ã Â¦Â¤Ã Â¦Â¾ Ã Â¦â€¦Ã Â¦Â¬Ã Â¦Å“Ã Â§ÂÃ Â¦Å¾Ã Â¦Â¾ Ã Â¦â€¢Ã Â¦Â°Ã Â¦Â²Ã Â§â€¡ Ã Â¦Â¯Ã Â§ÂÃ Â¦â€¢Ã Â§ÂÃ Â¦Â¤Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â·Ã Â§ÂÃ Â¦Å¸Ã Â§ÂÃ Â¦Â°Ã Â¦â€¢Ã Â§â€¡ Ã Â¦Â®Ã Â§ÂÃ Â¦â€“Ã Â§â€¡Ã Â¦Â° Ã Â¦â€œÃ Â¦ÂªÃ Â¦Â° Ã Â¦â€¢Ã Â¦Â Ã Â¦Â¿Ã Â¦Â¨ Ã Â¦Å“Ã Â¦Â¬Ã Â¦Â¾Ã Â¦Â¬ Ã Â¦Â¦Ã Â§â€¡Ã Â¦Â¬Ã Â§â€¡ Ã Â¦Â¤Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¾Ã Â¥Â¤ Ã Â¦â€¡Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â¨Ã Â§â€¡Ã Â¦Â° Ã Â¦â€¦Ã Â¦Â­Ã Â¦Â¿Ã Â¦Å“Ã Â¦Â¾Ã Â¦Â¤ Ã Â¦Â°Ã Â§â€¡Ã Â¦Â­Ã Â¦Â²Ã Â§ÂÃ Â¦Â¯Ã Â§ÂÃ Â¦Â¶Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¿ Ã Â¦â€”Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¡Ã Â§â€¡Ã Â¦Â° Ã Â¦ÂÃ Â¦â€¢Ã Â¦Å“Ã Â¦Â¨ Ã Â¦â€¢Ã Â¦Â®Ã Â¦Â¾Ã Â¦Â¨Ã Â§ÂÃ Â¦Â¡Ã Â¦Â¾Ã Â¦Â° Ã Â¦â€”Ã Â¦Â¤Ã Â¦â€¢Ã Â¦Â¾Ã Â¦Â² Ã Â¦Â¬Ã Â§ÂÃ Â¦Â§Ã Â¦Â¬Ã Â¦Â¾Ã Â¦Â° Ã Â¦ÂÃ Â¦â€¡ Ã Â¦Â®Ã Â¦Â¨Ã Â§ÂÃ Â¦Â¤Ã Â¦Â¬Ã Â§ÂÃ Â¦Â¯ Ã Â¦â€¢Ã Â¦Â°Ã Â§â€¡Ã Â¦â€ºÃ Â§â€¡Ã Â¦Â¨Ã Â¥Â¤ Ã Â¦Â¬Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¤Ã Â¦Â¾ Ã Â¦Â¸Ã Â¦â€šÃ Â¦Â¸Ã Â§ÂÃ Â¦Â¥Ã Â¦Â¾ Ã Â¦Â°Ã Â§Å¸Ã Â¦Å¸Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¸Ã Â§â€¡Ã Â¦Â° Ã Â¦â€“Ã Â¦Â¬Ã Â¦Â°Ã Â§â€¡ Ã Â¦ÂÃ Â¦â€¡ Ã Â¦Â¤Ã Â¦Â¥Ã Â§ÂÃ Â¦Â¯ Ã Â¦Å“Ã Â¦Â¾Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â¨Ã Â§â€¹ Ã Â¦Â¹Ã Â§Å¸Ã Â¥Â¤\r\n\r\nÃ Â¦Â¯Ã Â§ÂÃ Â¦â€¢Ã Â§ÂÃ Â¦Â¤Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â·Ã Â§ÂÃ Â¦Å¸Ã Â§ÂÃ Â¦Â°Ã Â§â€¡Ã Â¦Â° Ã Â¦ÂªÃ Â§ÂÃ Â¦Â°Ã Â¦Â¤Ã Â¦Â¿ Ã Â¦â€¡Ã Â¦â„¢Ã Â§ÂÃ Â¦â€”Ã Â¦Â¿Ã Â¦Â¤ Ã Â¦â€¢Ã Â¦Â°Ã Â§â€¡ Ã Â¦â€”Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¡Ã Â§â€¡Ã Â¦Â° Ã Â¦Â¸Ã Â§ÂÃ Â¦Â¥Ã Â¦Â²Ã Â¦Â¬Ã Â¦Â¾Ã Â¦Â¹Ã Â¦Â¿Ã Â¦Â¨Ã Â§â‚¬Ã Â¦Â° Ã Â¦ÂªÃ Â§ÂÃ Â¦Â°Ã Â¦Â§Ã Â¦Â¾Ã Â¦Â¨ Ã Â¦Å“Ã Â§â€¡Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â°Ã Â§â€¡Ã Â¦Â² Ã Â¦Â®Ã Â§â€¹Ã Â¦Â¹Ã Â¦Â¾Ã Â¦Â®Ã Â§ÂÃ Â¦Â®Ã Â¦Â¦ Ã Â¦ÂªÃ Â¦Â¾Ã Â¦â€¢Ã Â¦ÂªÃ Â§â€¹Ã Â¦Â° Ã Â¦Â¬Ã Â¦Â²Ã Â§â€¡Ã Â¦Â¨, Ã Â¦â€¡Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â¨Ã Â¦â€¢Ã Â§â€¡ Ã Â¦Â®Ã Â§â€šÃ Â¦Â²Ã Â§ÂÃ Â¦Â¯Ã Â¦Â¾Ã Â§Å¸Ã Â¦Â¨Ã Â§â€¡Ã Â¦Â° Ã Â¦â€¢Ã Â§ÂÃ Â¦Â·Ã Â§â€¡Ã Â¦Â¤Ã Â§ÂÃ Â¦Â°Ã Â§â€¡ Ã Â¦Â¶Ã Â¦Â¤Ã Â§ÂÃ Â¦Â°Ã Â§ÂÃ Â¦Â° Ã Â¦Â­Ã Â§ÂÃ Â¦Â² Ã Â¦â€¢Ã Â¦Â°Ã Â¦Â¾ Ã Â¦â€°Ã Â¦Å¡Ã Â¦Â¿Ã Â¦Â¤ Ã Â¦Â¨Ã Â§Å¸Ã Â¥Â¤ Ã Â¦Â¤Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¾ Ã Â¦Â¯Ã Â¦Â¦Ã Â¦Â¿ Ã Â¦Â Ã Â¦â€¢Ã Â§ÂÃ Â¦Â·Ã Â§â€¡Ã Â¦Â¤Ã Â§ÂÃ Â¦Â°Ã Â§â€¡ Ã Â¦Â­Ã Â§ÂÃ Â¦Â² Ã Â¦â€¢Ã Â¦Â°Ã Â§â€¡, Ã Â¦Â¤Ã Â¦Â¾Ã Â¦Â¹Ã Â¦Â²Ã Â§â€¡ Ã Â¦Â®Ã Â§ÂÃ Â¦â€“Ã Â§â€¡Ã Â¦Â° Ã Â¦â€œÃ Â¦ÂªÃ Â¦Â° Ã Â¦Â¤Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¾ Ã Â¦â€¢Ã Â¦Â Ã Â¦Â¿Ã Â¦Â¨ Ã Â¦Å“Ã Â¦Â¬Ã Â¦Â¾Ã Â¦Â¬ Ã Â¦ÂªÃ Â¦Â¾Ã Â¦Â¬Ã Â§â€¡Ã Â¥Â¤\r\n\r\nÃ Â¦Å“Ã Â§â€¡Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â°Ã Â§â€¡Ã Â¦Â² Ã Â¦ÂªÃ Â¦Â¾Ã Â¦â€¢Ã Â¦ÂªÃ Â§â€¹Ã Â¦Â° Ã Â¦ÂÃ Â¦â€¡ Ã Â¦â€°Ã Â¦Â¦Ã Â§ÂÃ Â¦Â§Ã Â§Æ’Ã Â¦Â¤Ã Â¦Â¿ Ã Â¦Â°Ã Â§â€¡Ã Â¦Â­Ã Â¦Â²Ã Â§ÂÃ Â¦Â¯Ã Â§ÂÃ Â¦Â¶Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¿ Ã Â¦â€”Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¡Ã Â§â€¡Ã Â¦Â° Ã Â¦Â¸Ã Â¦â€šÃ Â¦Â¬Ã Â¦Â¾Ã Â¦Â¦ Ã Â¦â€œÃ Â§Å¸Ã Â§â€¡Ã Â¦Â¬Ã Â¦Â¸Ã Â¦Â¾Ã Â¦â€¡Ã Â¦Å¸Ã Â§â€¡ Ã Â¦ÂªÃ Â§ÂÃ Â¦Â°Ã Â¦â€¢Ã Â¦Â¾Ã Â¦Â¶Ã Â¦Â¿Ã Â¦Â¤ Ã Â¦Â¹Ã Â§Å¸Ã Â§â€¡Ã Â¦â€ºÃ Â§â€¡Ã Â¥Â¤\r\n\r\nÃ Â¦â€”Ã Â¦Â¤Ã Â¦â€¢Ã Â¦Â¾Ã Â¦Â² Ã Â¦Â°Ã Â§â€¡Ã Â¦Â­Ã Â¦Â²Ã Â§ÂÃ Â¦Â¯Ã Â§ÂÃ Â¦Â¶Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¿ Ã Â¦â€”Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¡Ã Â§â€¡Ã Â¦Â° Ã Â¦Â¤Ã Â¦Â¿Ã Â¦Â¨ Ã Â¦Â¦Ã Â¦Â¿Ã Â¦Â¨Ã Â§â€¡Ã Â¦Â° Ã Â¦Â¸Ã Â¦Â¾Ã Â¦Â®Ã Â¦Â°Ã Â¦Â¿Ã Â¦â€¢ Ã Â¦Â®Ã Â¦Â¹Ã Â§Å“Ã Â¦Â¾ Ã Â¦Â¶Ã Â§â€¡Ã Â¦Â· Ã Â¦Â¹Ã Â§Å¸Ã Â¥Â¤ Ã Â¦â€¡Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â¨Ã Â§â€¡Ã Â¦Â° Ã Â¦Â®Ã Â¦Â§Ã Â§ÂÃ Â¦Â¯ Ã Â¦â€œ Ã Â¦ÂªÃ Â§â€šÃ Â¦Â°Ã Â§ÂÃ Â¦Â¬Ã Â¦Â¾Ã Â¦Å¾Ã Â§ÂÃ Â¦Å¡Ã Â¦Â²Ã Â§â€¡ Ã Â¦ÂÃ Â¦â€¡ Ã Â¦Â®Ã Â¦Â¹Ã Â§Å“Ã Â¦Â¾ Ã Â¦â€¦Ã Â¦Â¨Ã Â§ÂÃ Â¦Â·Ã Â§ÂÃ Â¦Â Ã Â¦Â¿Ã Â¦Â¤ Ã Â¦Â¹Ã Â§Å¸Ã Â¥Â¤ Ã Â¦Â®Ã Â¦Â¹Ã Â§Å“Ã Â¦Â¾Ã Â§Å¸ Ã Â¦Â°Ã Â¦â€¢Ã Â§â€¡Ã Â¦Å¸, Ã Â¦Â¬Ã Â§Å“ Ã Â¦â€¢Ã Â¦Â¾Ã Â¦Â®Ã Â¦Â¾Ã Â¦Â¨, Ã Â¦Å¸Ã Â§ÂÃ Â¦Â¯Ã Â¦Â¾Ã Â¦â€šÃ Â¦â€¢, Ã Â¦Â¹Ã Â§â€¡Ã Â¦Â²Ã Â¦Â¿Ã Â¦â€¢Ã Â¦ÂªÃ Â§ÂÃ Â¦Å¸Ã Â¦Â¾Ã Â¦Â° Ã Â¦ÂªÃ Â§ÂÃ Â¦Â°Ã Â¦Â­Ã Â§Æ’Ã Â¦Â¤Ã Â¦Â¿ Ã Â¦Â¸Ã Â¦Â®Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â¸Ã Â§ÂÃ Â¦Â¤Ã Â§ÂÃ Â¦Â° Ã Â¦â€œ Ã Â¦Â¸Ã Â¦Â°Ã Â¦Å¾Ã Â§ÂÃ Â¦Å“Ã Â¦Â¾Ã Â¦Â® Ã Â¦Â¬Ã Â§ÂÃ Â¦Â¯Ã Â¦Â¬Ã Â¦Â¹Ã Â¦Â¾Ã Â¦Â° Ã Â¦â€¢Ã Â¦Â°Ã Â¦Â¾ Ã Â¦Â¹Ã Â§Å¸Ã Â¥Â¤\r\n\r\nÃ Â¦Å“Ã Â§â€¡Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â°Ã Â§â€¡Ã Â¦Â² Ã Â¦ÂªÃ Â¦Â¾Ã Â¦â€¢Ã Â¦ÂªÃ Â§â€¹Ã Â¦Â° Ã Â¦Â¬Ã Â¦Â²Ã Â§â€¡Ã Â¦Â¨, Ã Â¦Â¬Ã Â¦Â¿Ã Â¦Â¶Ã Â§ÂÃ Â¦Â¬ Ã Â¦â€Ã Â¦Â¦Ã Â§ÂÃ Â¦Â§Ã Â¦Â¤Ã Â§ÂÃ Â¦Â¯Ã Â§â€¡Ã Â¦Â° Ã Â¦ÂªÃ Â§ÂÃ Â¦Â°Ã Â¦Â¤Ã Â¦Â¿ Ã Â¦ÂÃ Â¦â€¡ Ã Â¦Â¸Ã Â¦Â¾Ã Â¦Â®Ã Â¦Â°Ã Â¦Â¿Ã Â¦â€¢ Ã Â¦Â®Ã Â¦Â¹Ã Â§Å“Ã Â¦Â¾Ã Â¦Â° Ã Â¦Â¬Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¤Ã Â¦Â¾Ã¢â‚¬â€Ã¢â‚¬ËœÃ Â¦Â¬Ã Â§â€¹Ã Â¦â€¢Ã Â¦Â¾Ã Â¦Â®Ã Â¦Â¿ Ã Â¦â€¢Ã Â§â€¡Ã Â¦Â¾Ã Â¦Â°Ã Â§â€¹ Ã Â¦Â¨Ã Â¦Â¾Ã¢â‚¬â„¢Ã Â¥Â¤ Ã Â¦Â­Ã Â§â€šÃ Â¦Â®Ã Â¦Â¿Ã Â¦Â¤Ã Â§â€¡ Ã Â¦â€¡Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â¨Ã Â§â€¡Ã Â¦Â° Ã Â¦Â¶Ã Â¦â€¢Ã Â§ÂÃ Â¦Â¤Ã Â¦Â¿ Ã Â¦â€ Ã Â¦Å“ Ã Â¦Â¸Ã Â¦Â¬Ã Â¦Â¾Ã Â¦â€¡ Ã Â¦Â¦Ã Â§â€¡Ã Â¦â€“Ã Â¦Â¤Ã Â§â€¡ Ã Â¦ÂªÃ Â¦Â¾Ã Â¦Å¡Ã Â§ÂÃ Â¦â€ºÃ Â§â€¡Ã Â¥Â¤\r\n\r\nÃ Â¦Â°Ã Â§â€¡Ã Â¦Â­Ã Â¦Â²Ã Â§ÂÃ Â¦Â¯Ã Â§ÂÃ Â¦Â¶Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¿ Ã Â¦â€”Ã Â¦Â¾Ã Â¦Â°Ã Â§ÂÃ Â¦Â¡Ã Â§â€¡Ã Â¦Â° Ã Â¦Â¦Ã Â¦Â¾Ã Â¦Â¬Ã Â¦Â¿, Ã Â¦Â¤Ã Â¦Â¾Ã Â¦Â°Ã Â¦Â¾ Ã Â¦â€°Ã Â¦Â¨Ã Â§ÂÃ Â¦Â¨Ã Â¦Â¤ Ã Â¦Â°Ã Â¦â€¢Ã Â§â€¡Ã Â¦Å¸Ã Â§â€¡Ã Â¦Â° Ã Â¦ÂªÃ Â¦Â°Ã Â§â‚¬Ã Â¦â€¢Ã Â§ÂÃ Â¦Â·Ã Â¦Â¾ Ã Â¦Å¡Ã Â¦Â¾Ã Â¦Â²Ã Â¦Â¿Ã Â§Å¸Ã Â§â€¡Ã Â¦â€ºÃ Â§â€¡Ã Â¥Â¤ Ã Â¦Â®Ã Â¦Â¹Ã Â§Å“Ã Â¦Â¾Ã Â§Å¸ Ã Â¦Â¡Ã Â§ÂÃ Â¦Â°Ã Â§â€¹Ã Â¦Â¨Ã Â¦â€œ Ã Â¦Â¬Ã Â§ÂÃ Â¦Â¯Ã Â¦Â¬Ã Â¦Â¹Ã Â¦Â¾Ã Â¦Â° Ã Â¦â€¢Ã Â¦Â°Ã Â¦Â¾ Ã Â¦Â¹Ã Â§Å¸Ã Â§â€¡Ã Â¦â€ºÃ Â§â€¡Ã Â¥Â¤\r\n\r\n\r\nÃ Â¦â€¢Ã Â§ÂÃ Â¦Â·Ã Â§â€¡Ã Â¦ÂªÃ Â¦Â£Ã Â¦Â¾Ã Â¦Â¸Ã Â§ÂÃ Â¦Â¤Ã Â§ÂÃ Â¦Â° Ã Â¦ÂªÃ Â¦Â°Ã Â§â‚¬Ã Â¦â€¢Ã Â§ÂÃ Â¦Â·Ã Â¦Â¾ Ã Â¦Â¨Ã Â¦Â¿Ã Â§Å¸Ã Â§â€¡ Ã Â¦Â¡Ã Â§â€¹Ã Â¦Â¨Ã Â¦Â¾Ã Â¦Â²Ã Â§ÂÃ Â¦Â¡ Ã Â¦Å¸Ã Â§ÂÃ Â¦Â°Ã Â¦Â¾Ã Â¦Â®Ã Â§ÂÃ Â¦ÂªÃ Â§â€¡Ã Â¦Â° Ã Â¦Â¯Ã Â§ÂÃ Â¦â€¢Ã Â§ÂÃ Â¦Â¤Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â·Ã Â§ÂÃ Â¦Å¸Ã Â§ÂÃ Â¦Â°Ã Â§â€¡Ã Â¦Â° Ã Â¦Â¹Ã Â§ÂÃ Â¦Â®Ã Â¦â€¢Ã Â¦Â¿-Ã Â¦Â§Ã Â¦Â®Ã Â¦â€¢Ã Â¦Â¿Ã Â¦Â° Ã Â¦Â®Ã Â¦Â§Ã Â§ÂÃ Â¦Â¯Ã Â§â€¡ Ã Â¦â€¡Ã Â¦Â°Ã Â¦Â¾Ã Â¦Â¨ Ã Â¦ÂÃ Â¦â€¡ Ã Â¦Â¸Ã Â¦Â¾Ã Â¦Â®Ã Â¦Â°Ã Â¦Â¿Ã Â¦â€¢ Ã Â¦Â®Ã Â¦Â¹Ã Â§Å“Ã Â¦Â¾ Ã Â¦Å¡Ã Â¦Â¾Ã Â¦Â²Ã Â¦Â¾Ã Â¦Â²Ã Â¥Â¤', 'PNR6B7EY', 1, '2017-02-23', 1);
/*!40000 ALTER TABLE `ha_birth` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ha_category
DROP TABLE IF EXISTS `ha_category`;
CREATE TABLE IF NOT EXISTS `ha_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ha_category: ~10 rows (approximately)
/*!40000 ALTER TABLE `ha_category` DISABLE KEYS */;
INSERT IGNORE INTO `ha_category` (`id`, `name`, `description`, `status`) VALUES
	(16, 'F', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.</p>', 1),
	(17, 'E', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.</p>', 1),
	(18, 'D', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.</p>', 1),
	(19, 'C', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.</p>', 1),
	(21, 'B', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.</p>', 1),
	(22, 'A', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.</p>', 1),
	(23, 'G', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.</p>', 1),
	(25, 'H', '<p>The quick brown fox jumps over the lazy dog</p>', 1),
	(27, 'I', '<p>How do I get started with my computer?</p>\r\n<div class="contentContainer">\r\n<h1 class="title">How do I get started with my computer?</h1>\r\n<p class="para">Ã‚Â </p>\r\n<p class="para">Getting Started contains a list of tasks you might want to perform when you set up your computer. Tasks in Getting Started include:</p>\r\n<ul class="unordered">\r\n<li class="listItem">\r\n<p class="para">Transferring files from another computer</p>\r\n</li>\r\n<li class="listItem">\r\n<p class="para">Adding new users to your computer</p>\r\n</li>\r\n<li class="listItem">\r\n<p class="para">Backing up your files</p>\r\n</li>\r\n<li class="listItem">\r\n<p class="para">Personalizing <span class="notLocalizable">Windows</span></p>\r\n</li>\r\n</ul>\r\n</div>\r\n<p>Ã‚Â </p>', 1),
	(28, 'J', '', 1);
/*!40000 ALTER TABLE `ha_category` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ha_death
DROP TABLE IF EXISTS `ha_death`;
CREATE TABLE IF NOT EXISTS `ha_death` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ha_death: ~3 rows (approximately)
/*!40000 ALTER TABLE `ha_death` DISABLE KEYS */;
INSERT IGNORE INTO `ha_death` (`id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`) VALUES
	(1, 'Accident', 'Insurance companies will try to pay you less than your claim is worth. Don\'t let them! Use our free case evaluation to get the true value of your injury case.\r\n\r\nAccidents that commonly result in compensation include:\r\n\r\nCar accident injuries\r\nPedestrian accidents\r\nHit and runs\r\nDrunk driving crashes\r\nDangerous road construction accidents\r\nMotorcycle accidents\r\nCommercial trucking accidents\r\nUninsured motorists\r\nYour case review will be performed by a local car accident attorney. They will provide you an accurate estimate of your claim value and can help you get money for lost wages, personal injuries, medical bills, and pain and suffering.\r\n\r\nThe case evaluation is of no obligation to you. However, even if you do choose to work with a car accident attorney, you pay $0 unless you win! There are no upfront fees.', 'PNYXYXZM', 0, '2017-01-09', 1),
	(2, 'Test', 'HELLO', 'PNYXYXZM', 0, '2017-02-01', 1),
	(3, 'TEST', '', '12213', 1, '2017-02-23', 1);
/*!40000 ALTER TABLE `ha_death` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ha_investigation
DROP TABLE IF EXISTS `ha_investigation`;
CREATE TABLE IF NOT EXISTS `ha_investigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ha_investigation: ~4 rows (approximately)
/*!40000 ALTER TABLE `ha_investigation` DISABLE KEYS */;
INSERT IGNORE INTO `ha_investigation` (`id`, `title`, `description`, `patient_id`, `doctor_id`, `picture`, `date`, `status`) VALUES
	(2, 'TEST', 'TEST', '32424', 12, '', '2017-02-05', 1),
	(5, 'TEST', '', '32424', 0, 'assets/images/investigation/2017-02-05/C.jpg', '2017-02-05', 1),
	(6, 'How do I get started with my computer?', 'Getting Started contains a list of tasks you might want to perform when you set up your computer. Tasks in Getting Started include:\r\n\r\nTransferring files from another computer\r\n\r\nAdding new users to your computer\r\n\r\nBacking up your files\r\n\r\nPersonalizing Windows\r\n\r\nClick to open Getting Started.\r\n\r\nThese topics will help you get started with Windows 7. You can also go to the Windows website to learn more about setting up a computer.\r\n\r\nShow contentHide content Protect your computer\r\nWhat is Action Center? \r\n\r\nInstall Windows updates \r\n\r\nWhy use a standard account instead of an administrator account? \r\n\r\nWindows Firewall: recommended links \r\n\r\nBack up your files \r\n\r\nShow contentHide content First week tasks\r\nConnect to the Internet \r\n\r\nTransfer files and settings from another computer \r\n\r\nCreate a user account \r\n\r\nWhat you need to set up a home network \r\n\r\nHow can I tell if Windows is activated? \r\n\r\nWindows Basics: all topics \r\n\r\nShow contentHide content Set up hardware and get drivers\r\nWhat is a driver? \r\n\r\nInstall a printer \r\n\r\nFind and install printer drivers \r\n\r\nInstalling new hardware: recommended links \r\n\r\nShow contentHide content Install programs\r\nInstall a program \r\n\r\nChange which programs Windows uses by default \r\n\r\nMake older programs run in this version of Windows \r\n', '32424', 1, 'assets/images/investigation/2017-02-05/H.jpg', '2017-02-05', 1),
	(7, 'gfhhgv', '', 'yyvgfgvf', 0, '', '2017-02-27', 1);
/*!40000 ALTER TABLE `ha_investigation` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ha_medicine
DROP TABLE IF EXISTS `ha_medicine`;
CREATE TABLE IF NOT EXISTS `ha_medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `manufactured_by` varchar(255) NOT NULL,
  `create_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ha_medicine: ~11 rows (approximately)
/*!40000 ALTER TABLE `ha_medicine` DISABLE KEYS */;
INSERT IGNORE INTO `ha_medicine` (`id`, `name`, `category_id`, `description`, `price`, `manufactured_by`, `create_date`, `status`) VALUES
	(5, 'General Surgery', 22, '<p><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cry.gif" alt="cry" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-sealed.gif" alt="sealed" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-wink.gif" alt="wink" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-surprised.gif" alt="surprised" /></p>', 160, 'Square', '2017-02-28', 1),
	(6, 'General Surgery', 19, '<p>HELLO WORLD!</p>', 160, 'Square', '2017-02-06', 1),
	(7, 'General Surgery', 21, '<p><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cry.gif" alt="cry" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-sealed.gif" alt="sealed" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-wink.gif" alt="wink" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-surprised.gif" alt="surprised" /></p>', 160, 'Square', '2017-02-06', 1),
	(8, 'General Surgery', 18, '<p><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cry.gif" alt="cry" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-sealed.gif" alt="sealed" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-wink.gif" alt="wink" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-surprised.gif" alt="surprised" /></p>', 160, 'Square', '2017-02-06', 1),
	(9, 'General Surgery', 17, '<p><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cry.gif" alt="cry" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-sealed.gif" alt="sealed" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-wink.gif" alt="wink" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-surprised.gif" alt="surprised" /></p>', 160, 'Square', '2017-02-06', 1),
	(10, 'General Surgery', 23, '<p><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cry.gif" alt="cry" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-sealed.gif" alt="sealed" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-wink.gif" alt="wink" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-surprised.gif" alt="surprised" /></p>', 160, 'Square', '2017-02-06', 1),
	(12, 'General Surgery', 21, '<p><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cry.gif" alt="cry" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-sealed.gif" alt="sealed" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-wink.gif" alt="wink" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-surprised.gif" alt="surprised" /></p>', 160, 'Square', '2017-02-06', 1),
	(13, 'General Surgery', 22, '<p><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cry.gif" alt="cry" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-sealed.gif" alt="sealed" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-wink.gif" alt="wink" /><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-surprised.gif" alt="surprised" /></p>', 160, 'Square', '2017-02-06', 1),
	(14, 'General Surgery', 27, '<h2>Cos&rsquo;&egrave; Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong> &egrave; un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum &egrave; considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assembl&ograve; per preparare un testo campione. &Egrave; sopravvissuto non solo a pi&ugrave; di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni &rsquo;60, con la diffusione dei fogli di caratteri trasferibili &ldquo;Letraset&rdquo;, che contenevano passaggi del Lorem Ipsum, e pi&ugrave; recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.</p>', 160, 'Square', '2017-02-07', 1),
	(15, 'New', 29, '<p>TEST</p>', 199, 'Acme', '2017-02-28', 1),
	(16, 'Test', 30, '<p>TEST Medicine</p>', 200, 'Acme', '2017-02-28', 1);
/*!40000 ALTER TABLE `ha_medicine` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ha_operation
DROP TABLE IF EXISTS `ha_operation`;
CREATE TABLE IF NOT EXISTS `ha_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ha_operation: ~2 rows (approximately)
/*!40000 ALTER TABLE `ha_operation` DISABLE KEYS */;
INSERT IGNORE INTO `ha_operation` (`id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`) VALUES
	(1, 'RWA', 'Insurance companies will try to pay you less than your claim is worth. Don\'t let them! Use our free case evaluation to get the true value of your injury case.\r\n\r\nAccidents that commonly result in compensation include:\r\n\r\nCar accident injuries\r\nPedestrian accidents\r\nHit and runs\r\nDrunk driving crashes\r\nDangerous road construction accidents\r\nMotorcycle accidents\r\nCommercial trucking accidents\r\nUninsured motorists\r\nYour case review will be performed by a local car accident attorney. They will provide you an accurate estimate of your claim value and can help you get money for lost wages, personal injuries, medical bills, and pain and suffering.\r\n\r\nThe case evaluation is of no obligation to you. However, even if you do choose to work with a car accident attorney, you pay $0 unless you win! There are no upfront fees. innovative', 'PNYXYXZM', 13, '2017-01-09', 1),
	(2, 'asdf', '', '12213', 1, '2017-02-23', 1);
/*!40000 ALTER TABLE `ha_operation` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.inc_insurance
DROP TABLE IF EXISTS `inc_insurance`;
CREATE TABLE IF NOT EXISTS `inc_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_name` varchar(255) DEFAULT NULL,
  `service_tax` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `remark` text,
  `insurance_no` varchar(50) DEFAULT NULL,
  `insurance_code` varchar(50) DEFAULT NULL,
  `disease_charge` text COMMENT 'array(name, charge)',
  `hospital_rate` varchar(50) DEFAULT NULL,
  `insurance_rate` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.inc_insurance: ~5 rows (approximately)
/*!40000 ALTER TABLE `inc_insurance` DISABLE KEYS */;
INSERT IGNORE INTO `inc_insurance` (`id`, `insurance_name`, `service_tax`, `discount`, `remark`, `insurance_no`, `insurance_code`, `disease_charge`, `hospital_rate`, `insurance_rate`, `total`, `status`) VALUES
	(4, 'test', '0', '0', '', '', '', '{"A":"2","B":"34"}', '0', '0', '0', 1),
	(5, 'MetLife', '0', '0', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Loroftware like Aldus PageMaker including versions of Lorem Ipsum. ', '', '', '{"Deficiency":"3 lak"}', '0', '0', '0', 1),
	(6, 'Allstate', '50%', '10%', 'LREM key count value \r\nAvailable since 1.0.0.\r\nTime complexity: O(N) where N is the length of the list.\r\nRemoves the first count occurrences of', 'E345D4', '120515', '{"Alpha 1 ":"4 lak","Antitrypsin ":"3.5 lak"}', '25%', '75%', '100%', 1);
/*!40000 ALTER TABLE `inc_insurance` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.inc_limit_approval
DROP TABLE IF EXISTS `inc_limit_approval`;
CREATE TABLE IF NOT EXISTS `inc_limit_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) DEFAULT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `disease_details` text COMMENT 'name, description',
  `consultant_id` int(11) DEFAULT NULL COMMENT 'doctor list',
  `policy_name` varchar(255) DEFAULT NULL,
  `policy_no` varchar(100) DEFAULT NULL,
  `policy_holder_name` varchar(255) DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `approval_breakup` text COMMENT 'name, charge',
  `total` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.inc_limit_approval: ~3 rows (approximately)
/*!40000 ALTER TABLE `inc_limit_approval` DISABLE KEYS */;
INSERT IGNORE INTO `inc_limit_approval` (`id`, `patient_id`, `room_no`, `disease_details`, `consultant_id`, `policy_name`, `policy_no`, `policy_holder_name`, `insurance_id`, `approval_breakup`, `total`, `date`, `status`) VALUES
	(5, 'PV53V0HJ', '15', '{"Disease":"Test 1","Disease 2":"Test Description 2"}', 15, 'Test Policy ', '10', 'Policy Holder', 6, '{"Test Disease":"10 Lak","Another disease":"5 Lak"}', '15 Lak', '2017-11-18', 1),
	(6, 'PV53V0Hj', '50', '{"Problem":"The quick brown fox jumps over the lazy dog\\r\\n\\r\\nthe quick brown fox jumps over the lazy dog\\r\\n\\r\\ntHe qUiCk bRoWn FoX JuMpS OvEr ThE lAzY DoG\\r\\n\\r\\nThe Quick Brown Fox Jumps Over The Lazy Dog","Another Problem":"Tet","Test1":"World"}', 12, 'Test Policy ', '23', 'Policy Holder', 5, '{"Problem":"2 Lak","A":"3 Lak","Disease":"10 Lak"}', '15 Lak', '2017-11-19', 1),
	(7, 'PHR2DQW0', '1', '{"Test 1":"Test Description 1","Test 2":"Test Description 2","Test 3":"Test Description 3"}', 13, 'Test Policy', '02', 'Test Policy Holder', 5, '{"Test 1":"1M","Test 2":"2M","Test 3":"3M"}', '6M', '2017-11-21', 1),
	(8, 'WER2345B', '03', '{"Test":"Test","Test2":"Test","TEST3":"TEST"}', 13, 'Test', '343', 'Test', 5, '{"TEST":"TESt"}', 'Test', '2017-11-23', 1);
/*!40000 ALTER TABLE `inc_limit_approval` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.language: ~414 rows (approximately)
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT IGNORE INTO `language` (`id`, `phrase`, `english`) VALUES
	(1, 'email', 'Email Address'),
	(2, 'password', 'Password'),
	(3, 'login', 'Log In'),
	(4, 'incorrect_email_password', 'Incorrect Email/Password!'),
	(5, 'user_role', 'User Role'),
	(6, 'please_login', 'Please Log In'),
	(7, 'setting', 'Setting'),
	(8, 'profile', 'Profile'),
	(9, 'logout', 'Log Out'),
	(10, 'please_try_again', 'Please Try Again'),
	(11, 'admin', 'Admin'),
	(12, 'doctor', 'Doctor'),
	(13, 'representative', 'Representative'),
	(14, 'dashboard', 'Dashboard'),
	(15, 'department', 'Department'),
	(16, 'add_department', 'Add Department'),
	(17, 'department_list', 'Department List'),
	(18, 'add_doctor', 'Add Doctor'),
	(19, 'doctor_list', 'Doctor List'),
	(20, 'add_representative', 'Add Representative'),
	(21, 'representative_list', 'Representative List'),
	(22, 'patient', 'Patient'),
	(23, 'add_patient', 'Add Patient'),
	(24, 'patient_list', 'Patient List'),
	(25, 'schedule', 'Schedule'),
	(26, 'add_schedule', 'Add Schedule'),
	(27, 'schedule_list', 'Schedule List'),
	(28, 'appointment', 'Appointment'),
	(29, 'add_appointment', 'Add Appointment'),
	(30, 'appointment_list', 'Appointment List'),
	(31, 'enquiry', 'Enquiry'),
	(32, 'language_setting', 'Language Setting'),
	(33, 'appointment_report', 'Appointment Report'),
	(34, 'assign_by_all', 'Assign by All'),
	(35, 'assign_by_doctor', 'Assign by Doctor'),
	(36, 'assign_to_doctor', 'Assign to Doctor'),
	(37, 'assign_by_representative', 'Assign by Representative'),
	(38, 'report', 'Report'),
	(39, 'assign_by_me', 'Assign by Me'),
	(40, 'assign_to_me', 'Assign to Me'),
	(41, 'website', 'Website'),
	(42, 'slider', 'Slider'),
	(43, 'section', 'Section'),
	(44, 'section_item', 'Section Item'),
	(45, 'comments', 'Comment'),
	(46, 'latest_enquiry', 'Latest Enquiry'),
	(47, 'total_progress', 'Total Progress'),
	(48, 'last_year_status', 'Showing status from the last year'),
	(49, 'department_name', 'Department Name'),
	(50, 'description', 'Description'),
	(51, 'status', 'Status'),
	(52, 'active', 'Active'),
	(53, 'inactive', 'Inactive'),
	(54, 'cancel', 'Cancel'),
	(55, 'save', 'Save'),
	(56, 'serial', 'SL.NO'),
	(57, 'action', 'Action'),
	(58, 'edit', 'Edit '),
	(59, 'delete', 'Delete'),
	(60, 'save_successfully', 'Save Successfully!'),
	(61, 'update_successfully', 'Update Successfully!'),
	(62, 'department_edit', 'Department Edit'),
	(63, 'delete_successfully', 'Delete successfully!'),
	(64, 'are_you_sure', 'Are You Sure ? '),
	(65, 'first_name', 'First Name'),
	(66, 'last_name', 'Last Name'),
	(67, 'phone', 'Phone No'),
	(68, 'mobile', 'Mobile No'),
	(69, 'blood_group', 'Blood Group'),
	(70, 'sex', 'Sex'),
	(71, 'date_of_birth', 'Date of Birth'),
	(72, 'address', 'Address'),
	(73, 'invalid_picture', 'Invalid Picture'),
	(74, 'doctor_profile', 'Doctor Profile'),
	(75, 'edit_profile', 'Edit Profile'),
	(76, 'edit_doctor', 'Edit Doctor'),
	(77, 'designation', 'Designation'),
	(78, 'short_biography', 'Short Biography'),
	(79, 'picture', 'Picture'),
	(80, 'specialist', 'Specialist'),
	(81, 'male', 'Male'),
	(82, 'female', 'Female'),
	(83, 'education_degree', 'Education/Degree'),
	(84, 'create_date', 'Create Date'),
	(85, 'view', 'View'),
	(86, 'doctor_information', 'Doctor Information'),
	(87, 'update_date', 'Update Date'),
	(88, 'print', 'Print'),
	(89, 'representative_edit', 'Representative Edit'),
	(90, 'patient_information', 'Patient Information'),
	(91, 'other', 'Other'),
	(92, 'patient_id', 'Patient ID'),
	(93, 'age', 'Age'),
	(94, 'patient_edit', 'Patient Edit'),
	(95, 'id_no', 'ID No.'),
	(96, 'select_option', 'Select Option'),
	(97, 'doctor_name', 'Doctor Name'),
	(98, 'day', 'Day'),
	(99, 'start_time', 'Start Time'),
	(100, 'end_time', 'End Time'),
	(101, 'per_patient_time', 'Per Patient Time'),
	(102, 'serial_visibility_type', 'Serial Visibility'),
	(103, 'sequential', 'Sequential'),
	(104, 'timestamp', 'Timestamp'),
	(105, 'available_days', 'Available Days'),
	(106, 'schedule_edit', 'Schedule Edit'),
	(107, 'available_time', 'Available Time'),
	(108, 'serial_no', 'Serial No'),
	(109, 'problem', 'Problem'),
	(110, 'appointment_date', 'Appointment Date'),
	(111, 'you_are_already_registered', 'You Are Already Registered'),
	(112, 'invalid_patient_id', 'Invalid patient ID'),
	(113, 'invalid_input', 'Invalid Input'),
	(114, 'no_doctor_available', 'No Doctor Available'),
	(115, 'invalid_department', 'Invalid Department!'),
	(116, 'no_schedule_available', 'No Schedule Available'),
	(117, 'please_fillup_all_required_fields', 'Please fillup all required filelds'),
	(118, 'appointment_id', 'Appointment ID'),
	(119, 'schedule_time', 'Schedule Time'),
	(120, 'appointment_information', 'Appointment Information'),
	(121, 'full_name', 'Full Name'),
	(122, 'read_unread', 'Read / Unread'),
	(123, 'date', 'Date'),
	(124, 'ip_address', 'IP Address'),
	(125, 'user_agent', 'User Agent'),
	(126, 'checked_by', 'Checked By'),
	(127, 'enquiry_date', 'Enquirey Date'),
	(128, 'enquiry_list', 'Enquiry List'),
	(129, 'filter', 'Filter'),
	(130, 'start_date', 'Start Date'),
	(131, 'end_date', 'End Date'),
	(132, 'application_title', 'Application Title'),
	(133, 'favicon', 'Favicon'),
	(134, 'logo', 'Logo'),
	(135, 'footer_text', 'Footer Text'),
	(136, 'language', 'Language'),
	(137, 'appointment_assign_by_all', 'Appointment Assign by All'),
	(138, 'appointment_assign_by_doctor', 'Appointment Assign by Doctor'),
	(139, 'appointment_assign_by_representative', 'Appointment Assign by Representative'),
	(140, 'appointment_assign_to_all_doctor', 'Appointment Assign to All Doctor'),
	(141, 'appointment_assign_to_me', 'Appointment Assign to Me'),
	(142, 'appointment_assign_by_me', 'Appointment Assign by Me'),
	(143, 'type', 'Type'),
	(144, 'website_title', 'Website Title'),
	(145, 'invalid_logo', 'Invalid Logo'),
	(146, 'details', 'Details'),
	(147, 'website_setting', 'Website Setting'),
	(148, 'submit_successfully', 'Submit Successfully!'),
	(149, 'application_setting', 'Application Setting'),
	(150, 'invalid_favicon', 'Invalid Favicon'),
	(151, 'new_enquiry', 'New Enquiry'),
	(152, 'information', 'Information'),
	(153, 'home', 'Home'),
	(154, 'select_department', 'Select Department'),
	(155, 'select_doctor', 'Select Doctor'),
	(156, 'select_representative', 'Select Representative'),
	(157, 'post_id', 'Post ID'),
	(158, 'thank_you_for_your_comment', 'Thank you for your comment!'),
	(159, 'comment_id', 'Comment ID'),
	(160, 'comment_status', 'Comment Status'),
	(161, 'comment_added_successfully', 'Comment Added Successfully'),
	(162, 'comment_remove_successfully', 'Comment Remove Successfully'),
	(163, 'select_item', 'Section Item'),
	(164, 'add_item', 'Add Item'),
	(165, 'menu_name', 'Menu Name'),
	(166, 'title', 'Title'),
	(167, 'position', 'Position'),
	(168, 'invalid_icon_image', 'Invalid Icon Image!'),
	(169, 'about', 'About'),
	(170, 'blog', 'Blog'),
	(171, 'service', 'Service'),
	(172, 'item_edit', 'Item Edit'),
	(173, 'registration_successfully', 'Registration Successfully'),
	(174, 'add_section', 'Add Section'),
	(175, 'section_name', 'Section Name'),
	(176, 'invalid_featured_image', 'Invalid Featured Image!'),
	(177, 'section_edit', 'Section Edit'),
	(178, 'meta_description', 'Meta Description'),
	(179, 'twitter_api', 'Twitter Api'),
	(180, 'google_map', 'Google Map'),
	(181, 'copyright_text', 'Copyright Text'),
	(182, 'facebook_url', 'Facebook URL'),
	(183, 'twitter_url', 'Twitter URL'),
	(184, 'vimeo_url', 'Vimeo URL'),
	(185, 'instagram_url', 'Instagram Url'),
	(186, 'dribbble_url', 'Dribbble URL'),
	(187, 'skype_url', 'Skype URL'),
	(188, 'add_slider', 'Add Slider'),
	(189, 'subtitle', 'Sub Title'),
	(190, 'slide_position', 'Slide Position'),
	(191, 'invalid_image', 'Invalid Image'),
	(192, 'image_is_required', 'Image is required'),
	(193, 'slider_edit', 'Slider Edit'),
	(194, 'meta_keyword', 'Meta Keyword'),
	(195, 'year', 'Year'),
	(196, 'month', 'Month'),
	(197, 'recent_post', 'Recent Post'),
	(198, 'leave_a_comment', 'Leave a Comment'),
	(199, 'submit', 'Submit'),
	(200, 'google_plus_url', 'Google Plus URL'),
	(201, 'website_status', 'Website Status'),
	(202, 'new_slide', 'New Slide'),
	(203, 'new_section', 'New Section'),
	(204, 'subtitle_description', 'Sub Title / Description'),
	(205, 'featured_image', 'Featured Image'),
	(206, 'new_item', 'New Item'),
	(207, 'item_position', 'Item Position'),
	(208, 'icon_image', 'Icon Image'),
	(209, 'post_title', 'Post Title'),
	(210, 'add_to_website', 'Add to Website'),
	(211, 'read_more', 'Read More'),
	(212, 'registration', 'Registration'),
	(213, 'appointment_form', 'Appointment Form'),
	(214, 'contact', 'Contact'),
	(215, 'optional', 'Optional'),
	(216, 'customer_comments', 'Customer Comments'),
	(217, 'need_a_doctor_for_checkup', 'Need a Doctor for Check-up?'),
	(218, 'just_make_an_appointment_and_you_are_done', 'JUST MAKE AN APPOINTMENT & YOU\'RE DONE ! '),
	(219, 'get_an_appointment', 'Get an appointment'),
	(220, 'latest_news', 'Latest News'),
	(221, 'latest_tweet', 'Latest Tweet'),
	(222, 'menu', 'Menu'),
	(223, 'select_user_role', 'Select User Role'),
	(224, 'site_align', 'Website Align'),
	(225, 'right_to_left', 'Right to Left'),
	(226, 'left_to_right', 'Left to Right'),
	(227, 'account_manager', 'Account Manager'),
	(228, 'add_invoice', 'Add Invoice'),
	(229, 'invoice_list', 'Invoice List'),
	(230, 'account_list', 'Account List'),
	(231, 'add_account', 'Add Account'),
	(232, 'account_name', 'Account Name'),
	(233, 'credit', 'Credit'),
	(234, 'debit', 'Debit'),
	(235, 'account_edit', 'Account Edit'),
	(236, 'quantity', 'Quantity'),
	(237, 'price', 'Price'),
	(238, 'total', 'Total'),
	(239, 'remove', 'Remove'),
	(240, 'add', 'Add'),
	(241, 'subtotal', 'Sub Total'),
	(242, 'vat', 'Vat'),
	(243, 'grand_total', 'Grand Total'),
	(244, 'discount', 'Discount'),
	(245, 'paid', 'Paid'),
	(246, 'due', 'Due'),
	(247, 'reset', 'Reset'),
	(248, 'add_or_remove', 'Add / Remove'),
	(249, 'invoice', 'Invoice'),
	(250, 'invoice_information', 'Invoice Information'),
	(251, 'invoice_edit', 'Invoice Edit'),
	(252, 'update', 'Update'),
	(253, 'all', 'All'),
	(254, 'patient_wise', 'Patient Wise'),
	(255, 'account_wise', 'Account Wise'),
	(256, 'debit_report', 'Debit Report'),
	(257, 'credit_report', 'Credit Report'),
	(258, 'payment_list', 'Payment List'),
	(259, 'add_payment', 'Add Payment'),
	(260, 'payment_edit', 'Payment Edit'),
	(261, 'pay_to', 'Pay To'),
	(262, 'amount', 'Amount'),
	(263, 'bed_type', 'Bed Type'),
	(264, 'bed_limit', 'Bed Capacity'),
	(265, 'charge', 'Charge'),
	(266, 'bed_list', 'Bed List'),
	(267, 'add_bed', 'Add Bed'),
	(268, 'bed_manager', 'Bed Manager'),
	(269, 'bed_edit', 'Bed Edit'),
	(270, 'bed_assign', 'Bed Assign'),
	(271, 'assign_date', 'Assign Date'),
	(272, 'discharge_date', 'Discharge Date'),
	(273, 'bed_assign_list', 'Bed Assign List'),
	(274, 'assign_by', 'Assign By'),
	(275, 'bed_available', 'Bed is Available'),
	(276, 'bed_not_available', 'Bed is Not Available'),
	(277, 'invlid_input', 'Invalid Input'),
	(278, 'allocated', 'Allocated'),
	(279, 'free_now', 'Free'),
	(280, 'select_only_avaiable_days', 'Select Only Avaiable Days'),
	(281, 'human_resources', 'Human Resources'),
	(282, 'nurse_list', 'Nurse List'),
	(283, 'add_employee', 'Add Employee'),
	(284, 'user_type', 'User Type'),
	(285, 'employee_information', 'Employee Information'),
	(286, 'employee_edit', 'Edit Employee'),
	(287, 'laboratorist_list', 'Laboratorist List'),
	(288, 'accountant_list', 'Accountant List'),
	(289, 'receptionist_list', 'Receptionist List'),
	(290, 'pharmacist_list', 'Pharmacist List'),
	(291, 'nurse', 'Nurse'),
	(292, 'laboratorist', 'Laboratorist'),
	(293, 'pharmacist', 'Pharmacist'),
	(294, 'accountant', 'Accountant'),
	(295, 'receptionist', 'Receptionist'),
	(296, 'noticeboard', 'Noticeboard'),
	(297, 'notice_list', 'Notice List'),
	(298, 'add_notice', 'Add Notice'),
	(299, 'hospital_activities', 'Hospital Activities'),
	(300, 'death_report', 'Death Report'),
	(301, 'add_death_report', 'Add Death Report'),
	(302, 'death_report_edit', 'Death Report Edit'),
	(303, 'birth_report', 'Birth Report'),
	(304, 'birth_report_edit', 'Birth Report Edit'),
	(305, 'add_birth_report', 'Add Birth Report'),
	(306, 'add_operation_report', 'Add Operation Report'),
	(307, 'operation_report', 'Operation Report'),
	(308, 'investigation_report', 'Investigation Report'),
	(309, 'add_investigation_report', 'Add Investigation Report'),
	(310, 'add_medicine_category', 'Add Medicine Category'),
	(311, 'medicine_category_list', 'Medicine Category List'),
	(312, 'category_name', 'Category Name'),
	(313, 'medicine_category_edit', 'Medicine Category Edit'),
	(314, 'add_medicine', 'Add Medicine'),
	(315, 'medicine_list', 'Medicine List'),
	(316, 'medicine_edit', 'Medicine Edit'),
	(317, 'manufactured_by', 'Manufactured By'),
	(318, 'medicine_name', 'Medicine Name'),
	(319, 'messages', 'Messages'),
	(320, 'inbox', 'Inbox'),
	(321, 'sent', 'Sent'),
	(322, 'new_message', 'New Message'),
	(323, 'sender', 'Sender Name'),
	(324, 'message', 'Message'),
	(325, 'subject', 'Subject'),
	(326, 'receiver_name', 'Send To'),
	(327, 'select_user', 'Select User'),
	(328, 'message_sent', 'Messages Sent'),
	(329, 'mail', 'Mail'),
	(330, 'send_mail', 'Send Mail'),
	(331, 'mail_setting', 'Mail Setting'),
	(332, 'protocol', 'Protocol'),
	(333, 'mailpath', 'Mail Path'),
	(334, 'mailtype', 'Mail Type'),
	(335, 'validate_email', 'Validate Email Address'),
	(336, 'true', 'True'),
	(337, 'false', 'False'),
	(338, 'attach_file', 'Attach File'),
	(339, 'wordwrap', 'Enable Word Wrap'),
	(340, 'send', 'Send'),
	(341, 'upload_successfully', 'Upload Successfully!'),
	(342, 'app_setting', 'App Setting'),
	(343, 'case_manager', 'Case Manager'),
	(344, 'patient_status', 'Patient Status'),
	(345, 'patient_status_edit', 'Edit Patient Status'),
	(346, 'add_patient_status', 'Add Patient Status'),
	(347, 'add_new_status', 'Add New Status'),
	(348, 'case_manager_list', 'Case Manager List'),
	(349, 'hospital_address', 'Hospital Address'),
	(350, 'ref_doctor_name', 'Ref. Doctor Name'),
	(351, 'hospital_name', 'Hospital Name'),
	(352, 'patient_name', 'Patient  Name'),
	(353, 'document_list', 'Document List'),
	(354, 'add_document', 'Add Document'),
	(355, 'upload_by', 'Upload By'),
	(356, 'documents', 'Documents'),
	(357, 'prescription', 'Prescription'),
	(358, 'add_prescription', 'Add Prescription'),
	(359, 'prescription_list', 'Prescription List'),
	(360, 'add_insurance', 'Add Insurance'),
	(361, 'insurance_list', 'Insurance List'),
	(362, 'insurance_name', 'Insurance Name'),
	(366, 'add_patient_case_study', 'Add Patient Case Study'),
	(367, 'patient_case_study_list', 'Patient Case Study List'),
	(368, 'food_allergies', 'Food Allergies'),
	(369, 'tendency_bleed', 'Tendency Bleed'),
	(370, 'heart_disease', 'Heart Disease'),
	(371, 'high_blood_pressure', 'High Blood Pressure'),
	(372, 'diabetic', 'Diabetic'),
	(373, 'surgery', 'Surgery'),
	(374, 'accident', 'Accident'),
	(375, 'others', 'Others'),
	(376, 'family_medical_history', 'Family Medical History'),
	(377, 'current_medication', 'Current Medication'),
	(378, 'female_pregnancy', 'Female Pregnancy'),
	(379, 'breast_feeding', 'Breast Feeding'),
	(380, 'health_insurance', 'Health Insurance'),
	(381, 'low_income', 'Low Income'),
	(382, 'reference', 'Reference'),
	(385, 'instruction', 'Instruction'),
	(386, 'medicine_type', 'Medicine Type'),
	(387, 'days', 'Days'),
	(388, 'weight', 'Weight'),
	(389, 'blood_pressure', 'Blood Pressure'),
	(390, 'old', 'Old'),
	(391, 'new', 'New'),
	(392, 'case_study', 'Case Study'),
	(393, 'chief_complain', 'Chief Complain'),
	(394, 'patient_notes', 'Patient Notes'),
	(395, 'visiting_fees', 'Visiting Fees'),
	(396, 'diagnosis', 'Diagnosis'),
	(397, 'prescription_id', 'Prescription ID'),
	(398, 'name', 'Name'),
	(399, 'prescription_information', 'Prescription Information'),
	(400, 'sms', 'SMS'),
	(401, 'gateway_setting', 'Gateway Setting'),
	(402, 'time_zone', 'Time Zone'),
	(403, 'username', 'User Name'),
	(404, 'provider', 'Provider'),
	(405, 'sms_template', 'SMS Template'),
	(406, 'template_name', 'Template Name'),
	(407, 'sms_schedule', 'SMS Schedule'),
	(408, 'schedule_name', 'Schedule Name'),
	(409, 'time', 'Time'),
	(410, 'already_exists', 'Already Exists'),
	(411, 'send_custom_sms', 'Send Custom SMS'),
	(412, 'sms_sent', 'SMS Sent!'),
	(413, 'custom_sms_list', 'Custom SMS List'),
	(414, 'reciver', 'Reciver'),
	(415, 'auto_sms_report', 'Auto SMS Report'),
	(417, 'user_sms_list', 'User SMS List'),
	(418, 'send_sms', 'Send SMS'),
	(419, 'new_sms', 'New SMS'),
	(420, 'sms_list', 'SMS List'),
	(421, 'insurance', 'Insurance'),
	(422, 'add_limit_approval', 'Add Limit Approval'),
	(423, 'limit_approval_list', 'Limit Approval List'),
	(424, 'service_tax', 'Service Tax'),
	(425, 'remark', 'Remark'),
	(426, 'insurance_no', 'Insurance No.'),
	(427, 'insurance_code', 'Insurance Code'),
	(428, 'hospital_rate', 'Hospital Rate'),
	(429, 'insurance_rate', 'Insurance Rate'),
	(430, 'disease_charge', 'Disease Charge'),
	(431, 'disease_name', 'Disease Name'),
	(432, 'room_no', 'Room No'),
	(433, 'disease_details', 'Disease Details'),
	(434, 'consultant_name', 'Consultant Name'),
	(435, 'policy_name', 'Policy Name'),
	(436, 'policy_no', 'Policy No.'),
	(437, 'policy_holder_name', 'Policy Holder Name'),
	(438, 'approval_breakup', ' Approval Charge Break up'),
	(439, 'limit_approval', 'Limit Approval'),
	(440, 'insurance_limit_approval', 'Insurance Limit Approval'),
	(441, 'billing', 'Billing'),
	(442, 'add_admission', 'Add Patient Admission'),
	(443, 'add_service', 'Add Service'),
	(444, 'service_list', 'Service List'),
	(445, 'service_name', 'Service Name'),
	(446, 'add_package', 'Add Package'),
	(447, 'package_list', 'Package List'),
	(448, 'package_name', 'Package Name'),
	(449, 'package_details', 'Package Details'),
	(450, 'edit_package', 'Edit Package'),
	(451, 'admission_date', 'Admission Date'),
	(452, 'guardian_name', 'Guardian Name'),
	(453, 'agent_name', 'Agent Name'),
	(454, 'guardian_relation', 'Guardian Relation'),
	(455, 'guardian_contact', 'Guardian Contact'),
	(456, 'guardian_address', 'Guardian Address'),
	(457, 'admission_list', 'Patient Admission List'),
	(458, 'admission_id', 'AID'),
	(459, 'edit_admission', 'Edit Admission'),
	(460, 'add_advance', 'Add Advance Payment'),
	(461, 'advance_list', 'Advance Payment List'),
	(462, 'receipt_no', 'Receipt No'),
	(463, 'cash_card_or_cheque', 'Cash / Card / Cheque'),
	(464, 'payment_method', 'Payment Method'),
	(465, 'add_bill', 'Add Bill'),
	(466, 'bill_list', 'Bill List'),
	(467, 'bill_date', 'Bill Date'),
	(468, 'total_days', 'Total Days'),
	(469, 'advance_payment', 'Advance Payment'),
	(470, 'cash', 'Cash'),
	(471, 'card', 'Card'),
	(472, 'cheque', 'Cheque'),
	(473, 'card_cheque_no', 'Card / Cheque No.'),
	(474, 'receipt', 'Receipt'),
	(475, 'tax', 'Tax'),
	(476, 'pay_advance', 'Pay Advance'),
	(477, 'payable', 'Payable'),
	(478, 'notes', 'Notes'),
	(479, 'rate', 'Rate'),
	(480, 'bill_id', 'Bill ID.'),
	(481, 'paid', 'Paid'),
	(482, 'unpaid', 'Unpaid'),
	(483, 'bill_details', 'Bill Details'),
	(484, 'signature', 'Signature'),
	(485, 'update_bill', 'Update Bill');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.mail_setting
DROP TABLE IF EXISTS `mail_setting`;
CREATE TABLE IF NOT EXISTS `mail_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(20) NOT NULL,
  `mailpath` varchar(255) NOT NULL,
  `mailtype` varchar(20) NOT NULL,
  `validate_email` varchar(20) NOT NULL,
  `wordwrap` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.mail_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `mail_setting` DISABLE KEYS */;
INSERT IGNORE INTO `mail_setting` (`id`, `protocol`, `mailpath`, `mailtype`, `validate_email`, `wordwrap`) VALUES
	(5, 'sendmail', '/usr/sbin/sendmail', 'html', 'false', 'true');
/*!40000 ALTER TABLE `mail_setting` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.message
DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.message: ~41 rows (approximately)
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT IGNORE INTO `message` (`id`, `sender_id`, `receiver_id`, `subject`, `message`, `datetime`, `sender_status`, `receiver_status`) VALUES
	(1, 2, 1, 'TEST', '<p>Ã‚Â TEST</p>', '2017-02-07 00:00:00', 2, 2),
	(3, 26, 3, 'TEST', '<p>receiver_id<strong></strong></p>', '2017-02-07 00:00:00', 0, 0),
	(10, 2, 17, 'TEST', '<p>bbjkjhjh</p>', '2017-02-07 11:34:41', 0, 0),
	(11, 2, 14, 'Google Search Google or type URL Say "Ok Google" Voice search has been turned off. Details ', '<div id="lga" class=""><img id="hplogo" title="Google" src="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png" alt="Google" width="272" height="92">\r\n<div id="logo-sub">Ã‚Â </div>\r\n</div>\r\n&lt;form id="f" action="https://www.google.com/search" method="get"&gt;\r\n<div id="hf">Ã‚Â </div>\r\n<div id="fkbx" class="">\r\n<div id="fkbx-text">Search Google or type URL</div>\r\n&lt;input id="q" tabindex="-1" autocomplete="off" name="q" type="url" /&gt;\r\n<div id="fkbx-spch" tabindex="0">Ã‚Â </div>\r\n</div>\r\n&lt;/form&gt;\r\n<div id="spch" class="spch s2fp">Ã‚Â </div>\r\n<div id="most-visited" class="mv-hide">Ã‚Â </div>', '2017-02-07 12:31:34', 0, 0),
	(12, 17, 2, 'TEST', '<p>bbjkjhjh</p>', '2017-02-07 11:34:41', 0, 1),
	(13, 26, 2, 'TEST', '<p>receiver_id<strong></strong></p>', '2017-02-07 00:00:00', 0, 1),
	(14, 1, 2, 'HELLO ', 'What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2017-02-08 06:12:13', 0, 1),
	(15, 1, 2, 'What is Lorem Ipsum?', '<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<p>Ã‚Â </p>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>', '2017-02-08 07:34:28', 1, 1),
	(16, 2, 1, 'Lorem Ipsum', '<h1>Lorem Ipsum</h1>\r\n<h4>"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."</h4>\r\n<h5>"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</h5>\r\n<hr>\r\n<div id="Content">\r\n<div id="Panes">\r\n<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<br>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>\r\n<div>\r\n<h2>Where can I get some?</h2>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n</div>\r\n</div>\r\n</div>', '2017-02-08 07:36:12', 1, 1),
	(17, 2, 22, 'What is Lorem Ipsum?', '<p>The quick brown fox jumps over the lazy dog!</p>', '2017-02-08 11:51:55', 1, 0),
	(18, 2, 15, 'What is Lorem Ipsum?', '<p>The quick brown fox jumps over the lazy dog!</p>', '2017-02-08 01:23:01', 1, 1),
	(19, 2, 1, 'HELLO', '<p>TEST</p>', '2017-02-09 07:41:33', 1, 1),
	(20, 2, 28, 'Subject', '<p>asdasd</p>', '2017-02-11 01:32:23', 1, 0),
	(21, 2, 19, 'Subject', '<p>Message</p>', '2017-02-13 05:58:31', 1, 0),
	(22, 1, 2, 'Subject', '<p>Message</p>', '2017-02-13 05:59:13', 1, 1),
	(23, 2, 1, 'TEST SUBJECT', '<p>HELLO WORLD</p>\r\n<p>Ã‚Â </p>', '2017-02-19 11:38:42', 1, 2),
	(24, 1, 19, 'hello', '<p>TEST</p>', '2017-02-22 01:31:33', 1, 0),
	(25, 27, 19, 'hello', '<p>TEST</p>', '2017-02-23 11:23:13', 1, 0),
	(26, 27, 24, 'hello', '<p>TEST</p>', '2017-02-23 11:23:31', 1, 1),
	(27, 27, 28, 'hello', '<p>TSET</p>', '2017-02-23 11:23:40', 1, 0),
	(28, 1, 27, 'hello', '<p>HELLO World</p>\r\n<p>Hello World!</p>\r\n<p>hElLo WoRld</p>\r\n<p>HeLlO wOrLd</p>', '2017-02-23 12:04:50', 1, 1),
	(29, 27, 1, 'hello', '<p>THIS IS TEST MESSAGE</p>', '2017-02-23 12:05:26', 1, 1),
	(30, 19, 2, 'HELLO', '<p>HELLO WORLD!</p>', '2017-02-25 09:45:52', 1, 1),
	(31, 29, 2, 'HELLO', '<p>TEST</p>', '2017-02-25 11:04:54', 1, 1),
	(32, 7, 2, 'TEST', '<p>TEST</p>', '2017-02-26 08:32:47', 1, 0),
	(33, 7, 29, 'TEST', '<p>TEST</p>', '2017-02-26 08:32:55', 1, 0),
	(34, 7, 1, 'TEST', '<p>STET</p>', '2017-02-26 08:33:05', 1, 1),
	(35, 28, 27, 'TEST', '<p>TEST</p>', '2017-02-26 11:56:26', 1, 0),
	(36, 28, 2, 'TEST', '<p>TEST</p>', '2017-02-26 11:56:40', 1, 0),
	(37, 24, 2, 'TEST', '<p>TEST MESSAGE</p>', '2017-02-28 05:57:19', 1, 1),
	(38, 7, 19, 'HELLO WORLD', '<p>HELLO WORLD</p>', '2017-02-28 01:27:40', 1, 0),
	(39, 7, 2, 'HELLO WORLD', '<p>HELLO WORLD<strong></strong></p>', '2017-02-28 01:27:49', 1, 1),
	(40, 7, 27, 'HELLO WORLD', '<p>HELLO WORLD</p>', '2017-02-28 01:27:54', 1, 1),
	(41, 7, 2, 'HELLO WORLD', '<p>HELLO WORLD</p>', '2017-02-28 01:28:00', 1, 2),
	(42, 30, 8, 'TEST', '<p>TEST</p>', '2017-04-23 07:45:16', 1, 0),
	(43, 30, 17, 'TEST', '<p>TEST2</p>', '2017-04-23 07:45:27', 1, 0),
	(44, 30, 18, 'TEST3', '<p>TE#</p>', '2017-04-23 07:45:36', 1, 0),
	(45, 30, 2, 'TEST', '<p>HELLO</p>', '2017-04-23 08:23:01', 1, 0),
	(46, 2, 30, 'TEST', '<p>TEST</p>', '2017-04-23 10:52:10', 0, 1),
	(47, 2, 30, 'TEST Again', '<p>TEST Again</p>', '2017-04-23 10:52:22', 0, 1),
	(48, 30, 2, 'TEST3', '<p>TEST</p>', '2017-04-23 10:55:23', 0, 1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.notice
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `assign_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.notice: ~4 rows (approximately)
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT IGNORE INTO `notice` (`id`, `title`, `description`, `start_date`, `end_date`, `assign_by`, `status`) VALUES
	(3, 'Font Awesome -The use of these trademarks does not indicate endorsement of the trademark holder by Font Awesome, nor vice versa.', '<section>\r\n<section class="hidden-print">\r\n<div class="stripe-ad">\r\n<section class="hidden-print">\r\n<div class="stripe-ad">\r\n<h1 class="lead"><strong>Font Awesome</strong> is fully open source and is GPL friendly. You can use it for commercial projects, open source projects, or really just about whatever you want.</h1>\r\n</div>\r\n</section>\r\n<section>\r\n<div class="alert alert-success">\r\n<ul class="fa-ul margin-bottom-none">\r\n<li>Attribution is no longer required as of Font Awesome 3.0 but is much appreciated: "Font Awesome by Dave Gandy - http://fontawesome.io".</li>\r\n</ul>\r\n</div>\r\n</section>\r\n<section>\r\n<h2 class="page-header">Font License</h2>\r\n<ul>\r\n<li>Applies to all desktop and webfont files in the following directory: <code>font-awesome/fonts/</code>.</li>\r\n<li>License: SIL OFL 1.1</li>\r\n<li>URL: <a href="http://scripts.sil.org/OFL">http://scripts.sil.org/OFL</a></li>\r\n</ul>\r\n</section>\r\n<section>\r\n<h2 class="page-header">Code License</h2>\r\n<ul>\r\n<li>Applies to all CSS and LESS files in the following directories: <code>font-awesome/css/</code>, <code>font-awesome/less/</code>, and <code>font-awesome/scss/</code>.</li>\r\n<li>License: MIT License</li>\r\n<li>URL: <a href="http://opensource.org/licenses/mit-license.html">http://opensource.org/licenses/mit-license.html</a></li>\r\n</ul>\r\n</section>\r\n<section>\r\n<h2 class="page-header">Documentation License</h2>\r\n<ul>\r\n<li>Applies to all Font Awesome project files that are not a part of the Font or Code licenses.</li>\r\n<li>License: CC BY 3.0</li>\r\n<li>URL: <a href="http://creativecommons.org/licenses/by/3.0/">http://creativecommons.org/licenses/by/3.0/</a></li>\r\n</ul>\r\n</section>\r\n<section>\r\n<h2 class="page-header">Brand Icons</h2>\r\n<ul class="margin-bottom-none padding-left-lg">\r\n<li>All brand icons are trademarks of their respective owners.</li>\r\n<li>The use of these trademarks does not indicate endorsement of the trademark holder by Font Awesome, nor vice versa.</li>\r\n<li>Brand icons should only be used to represent the company or product to which they refer.</li>\r\n<li class="strong">Please do not use brand logos for any purpose except to represent that particular brand or service.</li>\r\n</ul>\r\n</section>\r\n</div>\r\n</section>\r\n</section>', '2017-01-02', '2017-01-30', 2, 1),
	(4, 'Font Awesome is fully open source and is GPL friendly', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2017-01-30', '2017-01-31', 2, 1),
	(8, 'Lorem Ipsum', '<p><span class="cm-string"><strong>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</strong></span></p>\r\n<p><span class="cm-string"><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'</span><span class="cm-string">\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>\r\n<table style="border-color: #0283ed; background-color: #d9d4d4; width: 100%; height: 300px; margin-left: auto; margin-right: auto;" border="10" cellspacing="2" cellpadding="2">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: center;"><strong>SAT</strong></td>\r\n<td style="text-align: center;"><strong>SUN</strong></td>\r\n<td style="text-align: center;"><strong>MON</strong></td>\r\n<td style="text-align: center;"><strong>TUE</strong></td>\r\n<td style="text-align: center;"><strong>WED</strong></td>\r\n<td style="text-align: center;"><strong>THU</strong></td>\r\n<td style="text-align: center;"><strong>FRI</strong></td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: center;">A</td>\r\n<td style="text-align: center;">B</td>\r\n<td style="text-align: center;">C</td>\r\n<td style="text-align: center;">D</td>\r\n<td style="text-align: center;">E</td>\r\n<td style="text-align: center;">F</td>\r\n<td style="text-align: center;">G</td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: center;">H</td>\r\n<td style="text-align: center;">I</td>\r\n<td style="text-align: center;">J</td>\r\n<td style="text-align: center;">K</td>\r\n<td style="text-align: center;">L</td>\r\n<td style="text-align: center;">M</td>\r\n<td style="text-align: center;">N</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2017-01-01', '2017-01-02', 2, 1),
	(9, 'Summer Solstice 2016 (Southern Hemisphere)', '<p><a href="https://www.google.com/logos/doodles/2016/summer-solstice-2016-southern-hemisphere-5137503691472896.2-hp2x.gif"><strong><img src="https://www.google.com/logos/doodles/2016/summer-solstice-2016-southern-hemisphere-5137503691472896.2-hp2x.gif" alt="Visit http://google.com" width="390" height="132"></strong></a></p>\r\n<p><strong>Today</strong> marks the first day of <strong>summer</strong> and the longest day of the year for the southern hemisphere. The summer solstice is named for the brief time when the sun appears to pause its movement across the sky. At that moment, the tilt and rotation of the earth shifts our view of the sunÃ¢â‚¬â„¢s direction from northward to southward, causing it to hang momentarily suspended. Doodler Nate Swinehart created a family of anthropomorphized rocks to commemorate the change of season.Ã‚Â Enjoy the peak of summer in the southern hemisphere with todayÃ¢â‚¬â„¢s Doodle!</p>\r\n<p>Ã‚Â <img src="../../../assets/tinymce/plugins/emoticons/img/smiley-innocent.gif" alt="innocent"><img src="../../../assets/tinymce/plugins/emoticons/img/smiley-laughing.gif" alt="laughing"></p>\r\n<p>&lt;iframe src="//www.youtube.com/embed/i8z6c_71aWY" width="100%" height="200" allowfullscreen="allowfullscreen"&gt;&lt;/iframe&gt;</p>\r\n<p>Ã‚Â </p>\r\n<p>Ã‚Â </p>\r\n<p>Ã‚Â </p>\r\n<p>Ã‚Â </p>', '2017-01-30', '2017-01-31', 2, 1);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.patient
DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `affliate` varchar(50) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.patient: ~34 rows (approximately)
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT IGNORE INTO `patient` (`id`, `patient_id`, `firstname`, `lastname`, `email`, `password`, `phone`, `mobile`, `address`, `sex`, `blood_group`, `date_of_birth`, `affliate`, `picture`, `created_by`, `create_date`, `status`) VALUES
	(26, 'PHR2DQW0', 'Jajia Jannat ', 'Rahi', NULL, NULL, '0182222221111', '01911112223333', '301,bti central plaza', 'Male', 'A+', '2000-01-01', NULL, 'assets/images/patient/2017-01-16/p11.png', 2, '2017-01-12', 1),
	(27, 'P1RNKS9W', 'Jane ', 'Doe', NULL, NULL, '017344444111', '8801821742285', 'South Ferri Ghat,Padma River,Chandpur', 'Male', 'A+', '1999-01-01', NULL, 'assets/images/patient/2017-01-16/p10.png', 2, '2017-01-12', 1),
	(28, 'PMXZFDP9', 'Himik ', 'Andlazuna', NULL, NULL, '0182222221111', '01911112223333', 'jr,Road,Complex cirt', 'Male', 'A-', '1991-05-23', NULL, 'assets/images/patient/2017-01-16/p9.png', 2, '2017-01-12', 1),
	(29, 'P3GWY7V3', 'Znakng ', 'Xinaktar', NULL, NULL, '01711111122', '018111111111111', '231,East Patalipur,Sonamuri', 'Male', 'B+', '1980-02-03', NULL, 'assets/images/patient/2017-01-16/p8.png', 2, '2017-01-12', 1),
	(30, 'PA0I54ZM', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'O+', '1980-02-03', NULL, 'assets/images/patient/2017-01-16/p7.png', 2, '2017-01-12', 1),
	(31, 'PL8XEPGJ', 'Amer', 'Ahmedullah ', NULL, NULL, '017222222222', '01922296392', '231,East Patalipur,Sonamuri', 'Male', 'B+', '1970-01-01', NULL, 'assets/images/patient/2017-01-16/p6.png', 2, '2017-01-12', 1),
	(32, 'P79I35Q5', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'B+', '1980-02-03', NULL, 'assets/images/patient/2017-01-16/p4.png', 2, '2017-01-15', 1),
	(33, 'PT5L36X1', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', '', '0000-00-00', NULL, 'assets/images/patient/2017-01-16/p3.png', 2, '2017-01-16', 1),
	(34, 'PR5JXID6', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', '', '0000-00-00', NULL, 'assets/images/patient/2017-01-16/p2.png', 2, '2017-01-16', 1),
	(35, 'PPPZJP52', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'A-', '0000-00-00', NULL, 'assets/images/patient/2017-01-16/p1.png', 2, '2017-01-16', 1),
	(36, 'PNR6B7EY', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'B+', '1969-12-31', NULL, 'assets/images/patient/2017-01-16/p.png', 1, '2017-01-16', 1),
	(37, 'PYRT7ZOS', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'B-', '1969-12-31', NULL, 'assets/images/patient/2017-01-16/p5.png', 1, '2017-01-16', 1),
	(38, 'PZZWZDVA', 'Tuhin', 'Sorkar', NULL, NULL, '', '0123456789', 'Hello', 'Male', '', '2017-02-26', NULL, '', 26, '2017-02-26', 1),
	(39, 'P43O0999', 'Sahed', 'Abdullah', NULL, NULL, '', '0123456789', 'TEST', 'Male', 'A+', '2017-04-02', NULL, NULL, NULL, '2017-02-28', 1),
	(40, 'P1XWEV6W', 'Alex', 'Anderson', 'patient@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '02123456789', 'Kathal Bagan, Dhaka', 'Male', NULL, '1970-01-01', NULL, 'assets/images/patient/2017-03-02/i.jpg', 40, '2017-03-02', 1),
	(41, 'P72P7031', 'Tuhin', 'Sorkar', NULL, NULL, '012346578955', '01324658585585', 'TEST', 'Male', 'O+', '2017-04-20', NULL, '', 1, '2017-04-20', 1),
	(42, 'P45KRFCA', 'Jahed', 'Abdullah', 'jahed@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', '0123456789', '0123456788', 'Dhaka, Bangladesh', 'Male', 'B+', '1997-04-20', NULL, 'assets/images/patient/2017-04-20/i.jpg', 2, '2017-04-20', 1),
	(43, 'PJ3URDGO', 'kamal', 'uddin', 'kamal@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '1234567890', 'TEST', 'Male', 'B+', '2017-04-24', NULL, '', 1, '2017-04-24', 1),
	(44, 'PWBQ2LIR', 'Jane', 'Doe', NULL, NULL, '', '018217842552', 'test, street, NY', 'Female', 'B+', '0000-00-00', NULL, 'assets/images/patient/2017-07-03/d1.jpg', 1, '2017-07-03', 1),
	(45, 'PC2YMXFN', 'Jahed', 'Abdullah', 'jahed@example.com', '25d55ad283aa400af464c76d713c07ad', '02145', '01821742285', 'Dhaka', 'Male', 'O-', '1995-10-03', NULL, '', 2, '2017-10-03', 1),
	(46, 'P8U5B5VR', 'Jane ', 'Doe', 'jane@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '01821742285', 'TEST', 'Male', 'O-', '1997-10-03', NULL, '', 1, '2017-10-03', 1),
	(47, 'P4SKM8O6', 'Jony', 'Alam', 'jony@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '01821742285', 'TEST', 'Male', 'B+', '1997-10-03', NULL, '', 7, '2017-10-03', 1),
	(48, 'PC7XX3B8', 'Kawsar', 'Jahan', NULL, NULL, '0123456789', '01821742285', 'TEST', 'Male', 'O+', '2000-10-02', NULL, NULL, NULL, '2017-10-03', 1),
	(49, 'P7Q6SFYR', 'Jahed', 'Alam', NULL, NULL, '0123456789', '01821742285', 'TEST', 'Male', 'B+', '2017-10-10', NULL, NULL, NULL, '2017-10-03', 1),
	(50, 'PY0ICCOL', 'Jahir', 'Khan', 'jahir@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '01821742285', 'Dhaka', 'Male', 'B+', '1994-10-02', NULL, '', 2, '2017-10-04', 1),
	(51, 'P73FYR4H', 'Ashif', 'Islam', NULL, NULL, '0123456789', '0123456789', 'EST', 'Male', 'A+', '2017-10-05', NULL, NULL, 2, '2017-10-05', 1),
	(52, 'PY6K4ZNF', 'Kamal', 'Uddin', NULL, NULL, '0123456789', '0123456789', 'Test', 'Male', 'O+', '2017-10-05', NULL, NULL, 2, '2017-10-05', 1),
	(57, 'PIBQOWSP', 'Jahed', 'Abduallah', 'jahed1@example.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '0123456789', 'Dhaka', 'Male', 'B+', '1997-10-07', NULL, '', 2, '2017-10-07', 1),
	(58, 'PH11SH74', 'Jahed', 'Abduallah', 'jahed2@example.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '0123456789', 'Dhaka, Bangladesh', 'Male', 'O+', '1995-10-07', NULL, '', 2, '2017-10-07', 1),
	(59, 'PJ447J2Z', 'Jahed', 'Abduallah', NULL, NULL, '', '0123456789', 'TEST', 'Male', 'B+', '2017-10-06', NULL, NULL, NULL, '2017-10-07', 1),
	(60, 'PXVA8KUS', 'John', 'Doe', 'john@example.com', 'fcea920f7412b5da7be0cf42b8c93759', '', '0123456789', 'Test', 'Male', 'B+', '2017-10-01', NULL, '', 1, '2017-10-08', 1),
	(61, 'P3NMSGOR', 'Jennifer', 'Smith', 'jennifer@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '0123456789', 'NY, USA', 'Male', 'B+', '2017-10-08', NULL, '', 7, '2017-10-08', 1),
	(62, 'PLCWTP8G', 'Ema', 'W.', 'ema@example.com', '6a9edcb7b63821802aa44d35d531c9fc', '', '0123456789', 'UK', 'Male', 'AB+', '2017-10-08', NULL, '', 8, '2017-10-08', 1),
	(63, 'PV53V0HJ', 'Alex', 'Goot', 'alex@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', '0123456789', '0123456789', 'Dhaka, Bangladesh', 'Male', 'AB+', '2000-10-10', NULL, 'assets/images/patient/dbfc50c1e24e726ae3745f523122ebc7.jpg', 2, '2017-10-10', 1),
	(64, 'P3LFN0JJ', 'Hello ', 'World', 'admin@demo.com', '9e5317e838cb5bd8e98a013fffc2b30e', '', '0123456879', 'Test', 'Male', '', '2017-11-15', NULL, '', 2, '2017-11-15', 1),
	(65, 'PHGWD0W0', 'HM', 'ISHAK', NULL, NULL, '0123456789', '0123456789', '0123456789', 'Male', 'O+', '2017-12-11', NULL, NULL, 2, '2017-12-11', 1),
	(66, 'P9XA38LW', 'Test', 'Test', NULL, NULL, '0123456789', '0123456789', 'Test', 'Male', 'B+', '2017-12-14', NULL, NULL, 2, '2017-12-14', 1);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.pr_case_study
DROP TABLE IF EXISTS `pr_case_study`;
CREATE TABLE IF NOT EXISTS `pr_case_study` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) DEFAULT NULL,
  `food_allergies` varchar(255) DEFAULT NULL,
  `tendency_bleed` varchar(255) DEFAULT NULL,
  `heart_disease` varchar(255) DEFAULT NULL,
  `high_blood_pressure` varchar(255) DEFAULT NULL,
  `diabetic` varchar(255) DEFAULT NULL,
  `surgery` varchar(255) DEFAULT NULL,
  `accident` varchar(255) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `family_medical_history` varchar(255) DEFAULT NULL,
  `current_medication` varchar(255) DEFAULT NULL,
  `female_pregnancy` varchar(255) DEFAULT NULL,
  `breast_feeding` varchar(255) DEFAULT NULL,
  `health_insurance` varchar(255) DEFAULT NULL,
  `low_income` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.pr_case_study: ~2 rows (approximately)
/*!40000 ALTER TABLE `pr_case_study` DISABLE KEYS */;
INSERT IGNORE INTO `pr_case_study` (`id`, `patient_id`, `food_allergies`, `tendency_bleed`, `heart_disease`, `high_blood_pressure`, `diabetic`, `surgery`, `accident`, `others`, `family_medical_history`, `current_medication`, `female_pregnancy`, `breast_feeding`, `health_insurance`, `low_income`, `reference`, `status`) VALUES
	(2, 'P1RNKS9W', 'Yes', 'No', 'No', 'Yes', 'No', 'No', 'No', 'No', 'Yes', 'No', 'No', 'No', 'Yes', 'Yes', 'None', 1),
	(3, 'P1RNKS9W', 'No', 'No', 'No', 'No', 'No', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 1),
	(4, 'PNR6B7EY', 'Yes', 'No', 'No', 'Yes', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'Yes', 'Jane Doe', 1);
/*!40000 ALTER TABLE `pr_case_study` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.pr_prescription
DROP TABLE IF EXISTS `pr_prescription`;
CREATE TABLE IF NOT EXISTS `pr_prescription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appointment_id` varchar(30) DEFAULT NULL,
  `patient_id` varchar(30) NOT NULL,
  `patient_type` varchar(50) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `chief_complain` text,
  `insurance_id` int(11) DEFAULT NULL,
  `policy_no` varchar(255) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `medicine` text,
  `diagnosis` text,
  `visiting_fees` float DEFAULT NULL,
  `patient_notes` text,
  `reference_by` varchar(50) DEFAULT NULL,
  `reference_to` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.pr_prescription: ~15 rows (approximately)
/*!40000 ALTER TABLE `pr_prescription` DISABLE KEYS */;
INSERT IGNORE INTO `pr_prescription` (`id`, `appointment_id`, `patient_id`, `patient_type`, `doctor_id`, `chief_complain`, `insurance_id`, `policy_no`, `weight`, `blood_pressure`, `medicine`, `diagnosis`, `visiting_fees`, `patient_notes`, `reference_by`, `reference_to`, `date`) VALUES
	(1, 'PRK4YUVG', 'P1RNKS9W', 'New', 2, 'TEST', 0, NULL, '100', '100', '[{"name":"Acetaminophen","type":"","instruction":"Test Instruction ","days":""}]', '[{"name":"TE2","instruction":"TESt"},{"name":"TES@","instruction":"erwersd"},{"name":"asdfsdaf","instruction":"asdfsadf"}]', 2500, 'TEST', '', '0', '2017-06-15'),
	(2, 'P1XWEV6W', 'P1XWEV6W', 'Old', 2, 'TEST', 0, NULL, '100', '100', '[{"name":"Naproxen","type":"Tab","instruction":"Test Instruction","days":"3"},{"name":"Ciprofloxacin","type":"Tab","instruction":"Test Instruction","days":"4"},{"name":"Amoxicillin","type":"Tab","instruction":"Test Instruction","days":"5"}]', '[{"name":"X-Rays","instruction":"Test Instruction"},{"name":"Test","instruction":"Test Instruction"}]', 2000, 'Test Notes', '', '0', '2017-06-17'),
	(5, 'PRQN4V6Y', 'P1RNKS9W', 'Old', 1, 'Where does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. \r\nIt has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ', 1, NULL, '100', '50', '[{"name":"Naproxen","type":"TAB","instruction":"TEST","days":"2"},{"name":"Amoxicillin","type":"TAB","instruction":"","days":"3"},{"name":"Amoxicillin","type":"TAB","instruction":"","days":"3"},{"name":"Banana","type":"TAB","instruction":"","days":"3"},{"name":"Coconut","type":"Cap","instruction":"","days":"3"},{"name":"Melon","type":"Cap","instruction":"","days":"3"}]', '[{"name":"TEST","instruction":"TEST"},{"name":"TEST","instruction":"asdfsdaf"},{"name":"TEST AGAin","instruction":"Dsafasdf"}]', 222, 'Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. ', '', '0', '2017-07-02'),
	(6, 'PRG6PTKT', 'P1RNKS9W', 'New', 2, 'How would I go about removing a number of years from the date that piece of code gives me? ... For your situation you could take advantage of PHP\'s implicit type casting and simply use .... 1 hour ago - Sterling Archer ...', 5, NULL, '100', '10', '[{"name":"Apple","type":"Tab","instruction":"Test1","days":"1"},{"name":"Mango","type":"Cap","instruction":"Test2","days":"2"},{"name":"Orange","type":"Cap","instruction":"Test2","days":"2"},{"name":"Coconut","type":"Cap","instruction":"Test2","days":"2"},{"name":"Grape","type":"Liq","instruction":"T","days":"1"}]', '[{"name":"X Rays","instruction":"Test "},{"name":"ORM","instruction":"Test "}]', 100, 'How would I go about removing a number of years from the date that piece of code gives me? ... For your situation you could take advantage of PHP\'s implicit type casting and simply use .... 1 hour ago - Sterling Archer ...', '', '0', '2017-07-02'),
	(7, 'PRMJ2GRO', 'P1RNKS9W', 'New', 12, 'TSET', 1, NULL, '100', '10', '[{"name":"Apple","type":"Tab","instruction":"","days":"2"},{"name":"Banana","type":"TAB","instruction":"","days":"4"},{"name":"Test","type":"CAP","instruction":"","days":"3"}]', '[{"name":"X RAYS","instruction":"TEST"},{"name":"XSFS","instruction":"TEST"}]', 2000, 'TEST', 'No', NULL, '2017-06-20'),
	(8, 'PR3TC768', 'P1XWEV6W', 'New', 12, 'TEST', 0, NULL, '100', '10', '[{"name":"Apple","type":"Tab","instruction":"Test","days":"3"},{"name":"Banana","type":"Tab","instruction":"Test","days":"3"},{"name":"Lychee","type":"Cap","instruction":"Test","days":"3"},{"name":"Grape","type":"Tab","instruction":"Test","days":"3"}]', '[{"name":"X Rays","instruction":"Test"},{"name":"Gebe","instruction":"Test"}]', 2000, 'TEST', 'No', NULL, '2017-06-20'),
	(9, 'AL4WVCVD', 'PPPZJP52', 'New', 1, 'TEST', 0, NULL, '100', '', '[{"name":"General Surgery","type":"","instruction":"","days":""},{"name":"New","type":"","instruction":"","days":""}]', '[{"name":"","instruction":""}]', 0, '', '', NULL, '2017-07-02'),
	(10, 'ARUMVG9X', 'P43O0999', 'New', 1, 'TEST', 0, NULL, '100', '', '[{"name":"TEST","type":"","instruction":"","days":""}]', '[{"name":"","instruction":""}]', 0, '', '', NULL, '2017-07-02'),
	(11, 'AK6VLKQ1', 'PYRT7ZOS', 'New', 1, 'TEST', 0, NULL, '80', '', '[{"name":"General Surgery","type":"","instruction":"","days":""}]', '[{"name":"TEST","instruction":""}]', 0, '', '', NULL, '2017-07-02'),
	(12, 'AZ0YMNYW', 'PNR6B7EY', 'New', 2, 'TEST', 0, NULL, '58', '', '[{"name":"Test","type":"","instruction":"","days":""}]', '[{"name":"","instruction":""}]', 2000, '', '', NULL, '2017-07-03'),
	(13, 'AKPVATJ1', 'PNR6B7EY', 'New', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 5, '120', '100', '34', '[{"name":"General Surgery","type":"","instruction":"","days":""}]', '[{"name":"","instruction":""}]', 600, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'Jane Doe', NULL, '2017-11-21'),
	(14, 'APS3QD31', 'PNR6B7EY', 'New', 1, 'Back pain', 6, '150515', '10', '35', '[{"name":"General Surgery","type":"Tab","instruction":"Test","days":"2"},{"name":"New","type":"Cap","instruction":"Test","days":"4"}]', '[{"name":"Test","instruction":"Test"}]', 500, '100', 'Jane doe', NULL, '2017-11-21'),
	(16, 'AN41RUM1', 'PNR6B7EY', 'Old', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula', 6, '150515', '10', '35', '[{"name":"General Surgery","type":"Tab","instruction":"Test","days":"1"},{"name":"New","type":"Cap","instruction":"Test","days":"2"},{"name":"Test","type":"Cap","instruction":"Test 3","days":"3"}]', '[{"name":"X rays","instruction":"Test 1"},{"name":"Test ","instruction":"Test 2"}]', 500, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula', 'Jane doe', NULL, '2017-11-21'),
	(17, 'AYRNHGWD1', 'P1XWEV6W', 'New', 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, ', 5, '1205', '60kg', '50', '[{"name":"General Surgery","type":"Tab","instruction":" Lorem Ipsum passages, and more ","days":"3"},{"name":"Test","type":"CAP","instruction":"It was popularised in the 1960s with the release of Letraset sheets","days":"7"},{"name":"New","type":"Liquid ","instruction":"But also the leap into electronic typesetting","days":"3"}]', '[{"name":"Diagnosis 1","instruction":"It was popularised in the 1960s with the release "},{"name":"Diagnosis 2","instruction":"It was popularised in the 1960s with the release"}]', 1000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ', 'Jonny doe', NULL, '2017-11-21'),
	(18, 'APK7HJZS1', 'PNR6B7EY', 'New', 1, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', 6, '110', '60', '34', '[{"name":"General Surgery","type":"Tab","instruction":"There are many variations","days":"2"},{"name":"New","type":"Cap","instruction":"Don\'t look even slightly believable","days":"3"},{"name":"Test","type":"Luquid","instruction":"it has a more-or-less normal distribution of letters","days":"3"}]', '[{"name":"X-Rays","instruction":"it has a more-or-less normal distribution of letters"},{"name":"Test","instruction":"content of a page when looking at its layout."}]', 2000, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters', 'Jane doe', NULL, '2017-11-23');
/*!40000 ALTER TABLE `pr_prescription` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.schedule
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `available_days` varchar(50) DEFAULT NULL,
  `per_patient_time` time DEFAULT NULL,
  `serial_visibility_type` tinyint(4) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.schedule: ~15 rows (approximately)
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT IGNORE INTO `schedule` (`schedule_id`, `doctor_id`, `start_time`, `end_time`, `available_days`, `per_patient_time`, `serial_visibility_type`, `status`) VALUES
	(12, 13, '06:00:00', '11:00:00', 'Sunday', '00:00:30', 1, 1),
	(13, 12, '08:00:00', '16:00:00', 'Monday', '00:00:35', 2, 1),
	(14, 14, '13:00:00', '18:00:00', 'Tuesday', '00:00:40', 1, 1),
	(16, 16, '10:00:00', '14:00:00', 'Thursday', '00:00:25', 2, 1),
	(17, 17, '11:00:00', '17:00:00', 'Friday', '00:00:40', 1, 1),
	(18, 18, '03:00:00', '10:00:00', 'Saturday', '00:00:45', 1, 1),
	(19, 12, '04:00:00', '11:00:00', 'Sunday', '00:05:00', 1, 1),
	(20, 1, '03:00:00', '06:00:00', 'Friday', '00:30:00', 2, 1),
	(21, 15, '03:00:00', '06:00:00', 'Wednesday', '00:10:00', 1, 1),
	(22, 14, '02:00:00', '09:00:00', 'Saturday', '00:05:00', 1, 1),
	(23, 15, '04:00:00', '10:00:00', 'Friday', '00:00:25', 1, 1),
	(24, 12, '09:00:00', '13:00:00', 'Wednesday', '00:40:00', 2, 1),
	(25, 16, '02:15:15', '10:35:15', 'Monday', '00:05:00', 1, 1),
	(26, 1, '08:00:00', '12:00:00', 'Sunday', '00:45:00', 1, 1),
	(27, 1, '08:00:00', '12:00:00', 'Monday', '00:45:00', 1, 1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.setting
DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `time_zone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT IGNORE INTO `setting` (`setting_id`, `title`, `description`, `email`, `phone`, `logo`, `favicon`, `language`, `site_align`, `footer_text`, `time_zone`) VALUES
	(2, 'Demo Hospital Limited', '98 Green Road, Farmgate, Dhaka-1215', 'bdtask@gmail.com', '1922296392', 'assets/images/apps/90908412f7fdadd81a40a3f79e9c3d52.png', 'assets/images/icons/a0ed8ec88e07205e07116f9098844bb8.ico', 'english', 'LTR', '2017©Copyright', 'Asia/Dhaka');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_delivery
DROP TABLE IF EXISTS `sms_delivery`;
CREATE TABLE IF NOT EXISTS `sms_delivery` (
  `sms_delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `delivery_date_time` datetime NOT NULL,
  `sms_info_id` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`sms_delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_delivery: ~14 rows (approximately)
/*!40000 ALTER TABLE `sms_delivery` DISABLE KEYS */;
INSERT IGNORE INTO `sms_delivery` (`sms_delivery_id`, `ss_id`, `delivery_date_time`, `sms_info_id`, `message`) VALUES
	(1, 3, '2017-10-02 18:07:17', 1, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. Thank you for the Appointment.'),
	(2, 3, '2017-10-02 18:07:54', 1, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. Thank you for the Appointment.'),
	(3, 3, '2017-10-02 18:11:21', 1, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. Thank you for the Appointment.'),
	(4, 3, '2017-10-02 18:24:22', 1, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. Thank you for the Appointment.'),
	(5, 3, '2017-10-02 18:24:22', 2, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 November 2017. Thank you for the Appointment.'),
	(6, 3, '2017-10-02 18:33:39', 1, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. Thank you for the Appointment.'),
	(7, 3, '2017-10-02 18:33:39', 2, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 30 September 2017. Thank you for the Appointment.'),
	(8, 3, '2017-10-03 15:47:22', 1, 'Hello, Jajia Jannat  Rahi. Your ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. Thank you for the Appointment.'),
	(9, 5, '2017-10-07 16:04:18', 1, 'Doctor, Samim Hasan Khan. \r\nHello, Jajia Jannat  Rahi. \r\nYour ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. \r\nThank you for the Appointment.'),
	(10, 4, '2017-10-07 16:13:31', 5, 'Doctor, Dr. Elvera  A. Lewis. \r\nHello, Znakng  Xinaktar. \r\nYour ID: P3GWY7V3, Appointment ID: AG7QSRVG, Serial: 1 and Appointment Date: 04 October 2017. \r\nThank you for the Appointment.'),
	(11, 4, '2017-10-07 16:13:32', 8, 'Doctor, Dr. Elvera  A. Lewis. \r\nHello, Tanzil Ahmad. \r\nYour ID: PR5JXID6, Appointment ID: A69YI1XW, Serial: 2 and Appointment Date: 04 October 2017. \r\nThank you for the Appointment.'),
	(12, 4, '2017-10-07 16:13:32', 9, 'Doctor, Dr. Elvera  A. Lewis. \r\nHello, Jony Alam. \r\nYour ID: P4SKM8O6, Appointment ID: AWZQ25KR, Serial: 3 and Appointment Date: 04 October 2017. \r\nThank you for the Appointment.'),
	(13, 4, '2017-10-07 16:13:33', 10, 'Doctor, Dr. Elvera  A. Lewis. \r\nHello, Kawsar Jahan. \r\nYour ID: PC7XX3B8, Appointment ID: A468SW9K, Serial:  and Appointment Date: 04 October 2017. \r\nThank you for the Appointment.'),
	(14, 5, '2017-10-07 16:14:52', 1, 'Doctor, Samim Hasan Khan. \r\nHello, Jajia Jannat  Rahi. \r\nYour ID: PHR2DQW0, Appointment ID: AERIUIM1, Serial: 1 and Appointment Date: 01 October 2017. \r\nThank you for the Appointment.');
/*!40000 ALTER TABLE `sms_delivery` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_gateway
DROP TABLE IF EXISTS `sms_gateway`;
CREATE TABLE IF NOT EXISTS `sms_gateway` (
  `gateway_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_name` text NOT NULL,
  `user` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `authentication` text NOT NULL,
  `link` text NOT NULL,
  `default_status` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_gateway: ~2 rows (approximately)
/*!40000 ALTER TABLE `sms_gateway` DISABLE KEYS */;
INSERT IGNORE INTO `sms_gateway` (`gateway_id`, `provider_name`, `user`, `password`, `authentication`, `link`, `default_status`, `status`) VALUES
	(1, 'nexmo', '1d286ff1', '11a8b67955d4482f', 'Hospital', 'https://www.nexmo.com/', 1, 1),
	(2, 'clickatell', 'clickatell', '9d2e2d3aa558ddcb', 'Hospital', 'https://www.clickatell.com/', 0, 1);
/*!40000 ALTER TABLE `sms_gateway` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_info
DROP TABLE IF EXISTS `sms_info`;
CREATE TABLE IF NOT EXISTS `sms_info` (
  `sms_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `sms_counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sms_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_info: ~22 rows (approximately)
/*!40000 ALTER TABLE `sms_info` DISABLE KEYS */;
INSERT IGNORE INTO `sms_info` (`sms_info_id`, `doctor_id`, `patient_id`, `phone_no`, `appointment_id`, `appointment_date`, `status`, `sms_counter`) VALUES
	(1, 1, 'PHR2DQW0', '8801821742285', 'AERIUIM1', '2017-10-01 01:00:00', 1, 8),
	(2, 1, 'PHR2DQW0', '8801821742285', 'AERIUIM1', '2017-09-30 23:01:00', 0, 5),
	(3, 1, 'PWBQ2LIR', '018217842552', 'ATJPS3QD', '2017-10-08 00:00:00', 0, 0),
	(4, 1, 'P43O0999', '0123456789', 'AOV0EX6V', '2017-10-08 00:00:00', 0, 0),
	(5, 12, 'P3GWY7V3', '018111111111111', 'AG7QSRVG', '2017-10-04 00:00:00', 0, 1),
	(6, 1, 'PL8XEPGJ', '01922296392', 'A3NYEKF2', '2017-10-06 00:00:00', 0, 0),
	(7, 1, 'PL8XEPGJ', '01922296392', 'ADZ5XSNT', '2017-10-08 00:00:00', 0, 0),
	(8, 12, 'PR5JXID6', '1922296392', 'A69YI1XW', '2017-10-04 00:00:00', 0, 1),
	(9, 12, 'P4SKM8O6', '01821742285', 'AWZQ25KR', '2017-10-04 00:00:00', 0, 1),
	(10, 12, 'PC7XX3B8', '01821742285', 'A468SW9K', '2017-10-04 00:00:00', 0, 1),
	(11, 1, 'P7Q6SFYR', '01821742285', 'AFCAH8QD', '2017-10-08 00:00:00', 0, 0),
	(12, 1, 'P73FYR4H', '0123456789', 'AYY5DUC7', '2017-10-06 00:00:00', 0, 0),
	(13, 1, 'PY6K4ZNF', '0123456789', 'ABIC772V', '2017-10-06 00:00:00', 0, 0),
	(14, 1, 'PH11SH74', '0123456789', 'A0OLAUGR', '2017-10-08 00:00:00', 0, 0),
	(15, 1, 'PJ447J2Z', '0123456789', 'A4CM0XD8', '2017-10-09 00:00:00', 0, 0),
	(16, 1, 'PH11SH74', '0123456789', 'AD8D8TIJ', '2017-10-13 00:00:00', 0, 0),
	(17, 1, 'PY6K4ZNF', '0123456789', 'A0W0Y4VO', '2017-10-13 00:00:00', 0, 0),
	(18, 1, 'PY6K4ZNF', '0123456789', 'ATQRUNMJ', '2017-10-13 00:00:00', 0, 0),
	(19, 12, 'PXVA8KUS', '0123456789', 'ASEVGS1F', '2017-10-11 00:00:00', 0, 0),
	(20, 1, 'P3NMSGOR', '0123456789', 'AWWSI9NP', '2017-10-09 00:00:00', 0, 0),
	(21, 1, 'PLCWTP8G', '0123456789', 'AFNMKYYN', '2017-10-09 00:00:00', 0, 0),
	(22, 1, 'PV53V0HJ', '0123456789', 'A170KPPP', '2017-10-13 00:00:00', 0, 0),
	(23, 16, 'PHGWD0W0', '0123456789', 'APG978ZK', '2017-12-11 00:00:00', 0, 0),
	(24, 1, 'P9XA38LW', '0123456789', 'ACV6WK7Y', '2017-12-18 00:00:00', 0, 0);
/*!40000 ALTER TABLE `sms_info` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_schedule
DROP TABLE IF EXISTS `sms_schedule`;
CREATE TABLE IF NOT EXISTS `sms_schedule` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_teamplate_id` int(11) NOT NULL,
  `ss_name` text NOT NULL,
  `ss_schedule` varchar(100) NOT NULL,
  `ss_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_schedule: ~4 rows (approximately)
/*!40000 ALTER TABLE `sms_schedule` DISABLE KEYS */;
INSERT IGNORE INTO `sms_schedule` (`ss_id`, `ss_teamplate_id`, `ss_name`, `ss_schedule`, `ss_status`) VALUES
	(1, 2, 'One', '1:1:1', 1),
	(2, 2, 'TEST', '2:0:0', 1),
	(3, 2, 'My Test Schedule', '1:1:2', 1),
	(6, 9, 'Summer offer', '10:3:0', 1);
/*!40000 ALTER TABLE `sms_schedule` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_setting
DROP TABLE IF EXISTS `sms_setting`;
CREATE TABLE IF NOT EXISTS `sms_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appointment` tinyint(1) DEFAULT NULL,
  `registration` tinyint(1) DEFAULT NULL,
  `schedule` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `sms_setting` DISABLE KEYS */;
INSERT IGNORE INTO `sms_setting` (`id`, `appointment`, `registration`, `schedule`) VALUES
	(2, 1, 1, 1);
/*!40000 ALTER TABLE `sms_setting` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_teamplate
DROP TABLE IF EXISTS `sms_teamplate`;
CREATE TABLE IF NOT EXISTS `sms_teamplate` (
  `teamplate_id` int(11) NOT NULL AUTO_INCREMENT,
  `teamplate_name` text,
  `teamplate` text,
  `type` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `default_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teamplate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_teamplate: ~4 rows (approximately)
/*!40000 ALTER TABLE `sms_teamplate` DISABLE KEYS */;
INSERT IGNORE INTO `sms_teamplate` (`teamplate_id`, `teamplate_name`, `teamplate`, `type`, `status`, `default_status`) VALUES
	(1, 'Appointment Template', 'Doctor, %doctor_name%. \r\nHello, %patient_name%. \r\nYour ID: %patient_id%, Appointment ID: %appointment_id%, Serial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', 'Appointment', 1, 1),
	(2, 'Schedule', 'Doctor, %doctor_name%. \r\nHello, %patient_name%. \r\nYour ID: %patient_id%, Appointment ID: %appointment_id%, Serial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', 'Schedule', 1, 1),
	(3, 'Registration', 'Hello, %patient_name%. \r\nYour ID: %patient_id%,  \r\nThank you for the registration.', 'Registration', 1, 1),
	(4, 'Summer Offer', 'Hello, %patient_name%. Your ID: %patient_id%,\r\nYour promo code is 1010101.\r\nContact with us.\r\nThanks', 'Schedule', 1, 0);
/*!40000 ALTER TABLE `sms_teamplate` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_users
DROP TABLE IF EXISTS `sms_users`;
CREATE TABLE IF NOT EXISTS `sms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `message` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_users: ~33 rows (approximately)
/*!40000 ALTER TABLE `sms_users` DISABLE KEYS */;
INSERT IGNORE INTO `sms_users` (`id`, `user_id`, `receiver`, `message`, `date`) VALUES
	(1, 1, '0123456789', 'Hello World', '2017-10-08 13:30:00'),
	(2, 2, '01234567895', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s ', '2017-10-08 15:44:27'),
	(3, 1, '0123456789', 'Hello World', '2017-10-08 13:30:00'),
	(4, 2, '01234567895', 'Test Message', '2017-10-08 15:44:33'),
	(8, 1, '23123123123', 'TETS', '2017-10-09 12:04:42'),
	(9, 1, '0123456789', 'TEST', '2017-10-06 12:06:18'),
	(10, 1, '12345678890', 'Hello World', '2017-10-09 12:12:14'),
	(11, 1, '12345678890', 'Hello World', '2017-10-09 12:12:28'),
	(12, 1, '01234567890', 'asdhjgh fgsd fgsdfg sdf', '2017-10-09 12:16:46'),
	(13, 18, '1234567890', 'Hello world \r\n', '2017-10-09 12:35:56'),
	(14, 18, '2133423423423423', 'Naeem Khan\r\n', '2017-10-09 12:42:28'),
	(15, 18, '12321123123', 'Test Message', '2017-10-09 12:43:00'),
	(16, 18, '21312312', 'Try ', '2017-10-09 12:43:06'),
	(17, 8, '0123456789', 'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ', '2017-10-09 16:45:01'),
	(18, 1, '123456789097866543', 'TEST', '2017-10-09 01:02:41'),
	(19, 1, '0123334567890', 'adsf ghj kerw tyuyifg hjk', '2017-10-09 01:03:40'),
	(20, 13, '234567890', 'tyuopokm tuiu noihju gytjh gjg', '2017-10-09 01:33:39'),
	(21, 19, '324234234', 'eqw', '2017-10-09 01:40:22'),
	(22, 19, '324234', 'adsadfsa asdf ', '2017-10-09 01:41:06'),
	(23, 19, '345676765', 'TSETSDF', '2017-10-09 01:58:43'),
	(24, 29, '12345678923456', 'Test', '2017-10-10 07:06:22'),
	(25, 24, '23211231231', 'Pharmacist', '2017-10-10 07:10:28'),
	(26, 24, '12345672334', 'Test', '2017-10-10 07:15:18'),
	(27, 24, '12345678921345678', 'Pharmacist', '2017-10-10 07:21:48'),
	(28, 7, '1234567854', 'Test', '2017-10-10 07:34:11'),
	(29, 7, '3423423', 'Receptionist', '2017-10-10 07:34:23'),
	(30, 19, '123123123', 'Test Message', '2017-10-10 07:45:11'),
	(31, 29, '32423423423', 'Test', '2017-10-09 07:46:36'),
	(32, 24, '12345678', 'Test', '2017-10-10 07:47:24'),
	(33, 7, '1234567890', 'Test Message', '2017-10-10 07:48:13'),
	(34, 8, '21345678909', 'adsf asdf asdf', '2017-10-10 07:51:50'),
	(35, 29, '12345678903421', 'Test', '2017-10-10 08:29:37'),
	(36, 8, '012345678999', 'sad fsad sadf asdf', '2017-10-11 11:09:57');
/*!40000 ALTER TABLE `sms_users` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `user_role` tinyint(1) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `short_biography` text,
  `picture` varchar(255) DEFAULT NULL,
  `specialist` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.user: ~18 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `user_role`, `designation`, `department_id`, `address`, `phone`, `mobile`, `short_biography`, `picture`, `specialist`, `date_of_birth`, `sex`, `blood_group`, `degree`, `created_by`, `create_date`, `update_date`, `status`) VALUES
	(1, 'Samim Hasan', 'Khan', 'doctor@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Asstt. Profesor', 12, '98, Green Road, Farmgate, Dhaka -1205', '0123456798', '0123456798', '<p>TEST</p>', '', 'MBBS, DDB, FRSH', '2016-10-12', 'Male', 'A+', '<p>MBBS, DDB, FRSH</p>', 1, '2017-06-22', NULL, 1),
	(2, 'Jhon', 'Doe', 'admin@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, NULL, NULL, '98 Green Road, Farmgate, Dhaka-1215', NULL, '1922296392', NULL, 'assets/images/doctor/d49475ae2643ed555a40c75af42d074c.png', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2017-10-29', NULL, 1),
	(7, 'Hasan', 'Khan', 'receptionist@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 7, NULL, NULL, 'TEST', NULL, '018211555555', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 7, '2017-03-16', NULL, 1),
	(8, 'Ashik', 'Islam', 'representative@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 8, NULL, NULL, 'Dhaka, Bangladesh', NULL, '0123456789', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2017-10-28', NULL, 1),
	(12, 'Dr. Elvera ', 'A. Lewis', 'elvera@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'MBBS', 12, '3028 University Street Redmond, WA 98052 ', '01888237267', '01888237267', '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.</p>', '', 'Nose', '0000-00-00', 'Male', 'A+', '<p><strong>Bachelor\'s degrees</strong> are offered at all 4-year colleges and universities, from large public institutions to small private colleges. The two most common types of bachelor\'s degrees are the Bachelor of Arts (B.A.) and Bachelor of Science (', 2, '2017-01-10', NULL, 1),
	(13, 'Dr.Mesut ', 'Alzain', 'mesut@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Assistant Professor ', 13, '87,East Anadulala City ', '', '018111111111111', '', '', 'Neonatal', '1980-02-03', 'Male', 'A-', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
	(14, 'Dr.Ykayama', 'Durusalaln', 'murat1@bdtask.com', '8ce87b8ec346ff4c80635f667d1592ae', 2, 'Professor ', 24, '231,East Patalipur,Sonamuri', '01711111122', '01911112223333', '', '', 'Urology ', '1980-01-01', 'Female', 'A+', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
	(15, 'Dr.Zesika', 'Hayat', 'hayat@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Assistant Professor ', 15, '54,East Park Street,North Sonaimuri', '01711111122', '+0111133445782', '', '', 'Neurology ', '1991-05-23', 'Male', 'O-', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
	(16, 'Dr.Dilmara ', 'Xyanturamana ', 'dilmara@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Professor ', 18, 'South Ferri Ghat,Padma River,Chandpur', '01711111122', '+0123111189323', '', '', 'Medicine ', '1980-03-05', 'Male', 'A-', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
	(17, 'Dr. Ahmed ', 'Abdullah', 'ahemd@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Professor ', 12, '231,East Patalipur,Sonamuri', '0182222221111', '01911112223333', '', '', 'Microbiologist ', '1968-01-01', 'Male', 'A+', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
	(18, 'Dr.Huyan', 'Xinan', 'xinan@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Assistant Professor ', 22, '231,East Patalipur,Sonamuri,Nkhali', '0181111111112222', '+0111133445782', '', '', 'Gynecologist ', '1985-01-12', 'Male', '', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
	(19, 'Ahmed', 'Ziniya', 'laboratorist@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 4, NULL, NULL, '231,East Patalipur,Sonamuri', NULL, '+0111133445782', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 19, '2017-03-16', NULL, 1),
	(22, 'Dr. M', 'Murtaza', 'murtaz@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Professor', 15, '56/C, East Burbank, North City ', '092222223333', '019833333222', '<p>Write about doctor in here.doctor short biography.</p>', 'assets/images/doctor/6bcba52aacac5732a876d931158a68b8.jpg', 'Neurology ', '1987-03-21', 'Male', 'A+', '<p>MBBS,FCCS,DPD,ORCH(NEU),MCCCO</p>\r\n<p>[removed][removed]</p>', 2, '2017-11-19', NULL, 1),
	(24, 'Meshu', 'Munawar', 'pharmacist@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 6, NULL, NULL, 'Dhaka', NULL, '018211555555', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 24, '2017-03-16', NULL, 1),
	(27, 'Tuhin', 'Sorkar', 'accountant@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 3, NULL, NULL, 'TEST', NULL, '018211555555', NULL, 'assets/images/human_resources/7a31e551a1ace6e0091ec7f32aa69031.jpg', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2017-10-29', NULL, 1),
	(29, 'Bay', 'Smith', 'nurse@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 5, NULL, NULL, 'Dhaka, Bangladesh', NULL, '018211555555', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 29, '2017-03-16', NULL, 1),
	(30, 'Tuhin', 'Abdullah', 'case@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 9, NULL, NULL, 'TEST', NULL, '0123456788', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 30, '2017-04-23', NULL, 1),
	(31, 'John', 'Doe', 'case2@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 9, NULL, NULL, 'India', NULL, '0123459689', NULL, '', NULL, NULL, 'Male', NULL, NULL, 2, '2017-10-28', NULL, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_comment
DROP TABLE IF EXISTS `ws_comment`;
CREATE TABLE IF NOT EXISTS `ws_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `add_to_website` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_comment: ~2 rows (approximately)
/*!40000 ALTER TABLE `ws_comment` DISABLE KEYS */;
INSERT IGNORE INTO `ws_comment` (`id`, `item_id`, `name`, `email`, `comment`, `date`, `add_to_website`) VALUES
	(64, 25, 'John Doe', 'doe@example.com', 'Hello World!', '2017-01-15 11:42:47', 1),
	(65, 24, 'Tanzil Ahmad', 'tanzil4091@gmail.com', 'I highly recommend this application for hospital management', '2017-01-16 01:50:48', 1);
/*!40000 ALTER TABLE `ws_comment` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_item
DROP TABLE IF EXISTS `ws_item`;
CREATE TABLE IF NOT EXISTS `ws_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `icon_image` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `position` int(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `counter` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_item: ~16 rows (approximately)
/*!40000 ALTER TABLE `ws_item` DISABLE KEYS */;
INSERT IGNORE INTO `ws_item` (`id`, `name`, `icon_image`, `title`, `description`, `position`, `status`, `counter`, `date`) VALUES
	(24, 'blog', 'assets_web/images/icon_image/2017-01-12/t.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 1, 1, 27, '2017-01-12'),
	(25, 'blog', 'assets_web/images/icon_image/2017-01-12/e.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 2, 1, 27, '2017-01-12'),
	(26, 'blog', 'assets_web/images/icon_image/2017-01-12/d.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 3, 1, 5, '2017-01-12'),
	(27, 'blog', 'assets_web/images/icon_image/2017-01-12/m.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 4, 1, 0, '2017-01-12'),
	(28, 'service', 'assets_web/images/icon_image/2017-05-14/u3.png', 'Emergency Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 1, 1, 0, '2017-05-14'),
	(29, 'service', 'assets_web/images/icon_image/2017-01-13/u.png', 'Call Center 24/7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 2, 1, 0, '2017-01-13'),
	(30, 'service', 'assets_web/images/icon_image/2017-01-13/h1.png', 'Cardiac Surgery', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 3, 1, 0, '2017-01-13'),
	(31, 'service', 'assets_web/images/icon_image/2017-01-13/D.png', 'Dental Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 4, 1, 0, '2017-01-13'),
	(32, 'service', 'assets_web/images/icon_image/2017-01-13/i.png', 'Ophthalmology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 5, 1, 0, '2017-01-13'),
	(33, 'service', 'assets_web/images/icon_image/2017-05-14/u4.png', 'Neurology ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 6, 1, 0, '2017-05-14'),
	(34, 'about', 'assets_web/images/icon_image/5adaedd86b35edde2f9de7e64d2b1ce2.jpg', 'ABOUT US', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed. Aenean id ante blandit, mattis lacus ac, placerat elit. Vestibulum purus nisl, aliquam ut velit sed, fermentum bibendum ipsum. Vivamus sagittis mi ac erat fermentum, sed molestie tellus tincidunt. Curabitur mauris nisi, molestie viverra semper eget, elementum et odio. Etiam enim massa, fringilla eu malesuada in, volutpat eget sapien. Nunc aliquam diam in ex facilisis, non feugiat tellus tristique. Integer quis lorem at justo mollis dictum. Aenean nec nibh eget arcu faucibus dictum ac sit amet augue. Aliquam quis rhoncus ex. In euismod felis mauris, vel euismod risus ornare sit amet. Nunc iaculis nec dolor vel eleifend. Sed quis felis at enim faucibus commodo. Donec quis condimentum velit, sit amet luctus leo. Curabitur a volutpat lorem. Duis ut leo quis erat pellentesque tincidunt. Ut eu enim eu ante faucibus tincidunt. Maecenas lorem purus, cursus in massa nec, convallis porta velit. Etiam aliquet tortor sed fermentum tempor. Maecenas quis ornare lacus, eu maximus purus. Mauris et pellentesque tellus, sed ullamcorper ipsum. Sed non volutpat risus. Donec sit amet sem vitae purus mollis sodales. Suspendisse ut ipsum sed lorem feugiat congue sed non tortor. Mauris laoreet lorem sed varius placerat. Nullam tincidunt neque vitae eros ullamcorper, laoreet finibus erat convallis. Vestibulum vehicula turpis dui, vitae ultrices ante fermentum in. Sed laoreet pharetra pretium. In hac habitasse platea dictumst. Morbi a bibendum velit. Phasellus luctus dignissim quam, et elementum mi aliquam sed. In non tortor nec libero porta egestas. Fusce id dictum augue, non condimentum eros. In in mi arcu. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam euismod dictum justo vel condimentum. Donec leo mauris, ultrices ac risus nec, efficitur finibus eros. Ut ut blandit ex, vel porta nulla. Integer ut dapibus lectus. Duis sollicitudin metus ipsum, vitae euismod nisl sagittis et.', 1, 1, 1, '2017-10-28'),
	(35, 'about', 'assets_web/images/icon_image/2017-01-13/g.jpg', 'Our Vision & Mission ', '\r\n\r\n\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\nAenean id ante blandit, mattis lacus ac, placerat elit. Vestibulum purus nisl, aliquam ut velit sed, fermentum bibendum ipsum. Vivamus sagittis mi ac erat fermentum, sed molestie tellus tincidunt. Curabitur mauris nisi, molestie viverra semper eget, elementum et odio. Etiam enim massa, fringilla eu malesuada in, volutpat eget sapien. Nunc aliquam diam in ex facilisis, non feugiat tellus tristique. Integer quis lorem at justo mollis dictum. Aenean nec nibh eget arcu faucibus dictum ac sit amet augue. Aliquam quis rhoncus ex. In euismod felis mauris, vel euismod risus ornare sit amet. Nunc iaculis nec dolor vel eleifend. Sed quis felis at enim faucibus commodo. Donec quis condimentum velit, sit amet luctus leo. Curabitur a volutpat lorem. Duis ut leo quis erat pellentesque tincidunt.\r\nUt eu enim eu ante faucibus tincidunt. Maecenas lorem purus, cursus in massa nec, convallis porta velit. Etiam aliquet tortor sed fermentum tempor. Maecenas quis ornare lacus, eu maximus purus. Mauris et pellentesque tellus, sed ullamcorper ipsum. Sed non volutpat risus. Donec sit amet sem vitae purus mollis sodales. Suspendisse ut ipsum sed lorem feugiat congue sed non tortor. Mauris laoreet lorem sed varius placerat. Nullam tincidunt neque vitae eros ullamcorper, laoreet finibus erat convallis. Vestibulum vehicula turpis dui, vitae ultrices ante fermentum in. Sed laoreet pharetra pretium. In hac habitasse platea dictumst. Morbi a bibendum velit.\r\nPhasellus luctus dignissim quam, et elementum mi aliquam sed. In non tortor nec libero porta egestas. Fusce id dictum augue, non condimentum eros. In in mi arcu. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam euismod dictum justo vel condimentum. Donec leo mauris, ultrices ac risus nec, efficitur finibus eros. Ut ut blandit ex, vel porta nulla. Integer ut dapibus lectus. Duis sollicitudin metus ipsum, vitae euismod nisl sagittis et.\r\n\r\n\r\n', 2, 1, 0, '2017-01-13'),
	(36, 'appointment', 'assets_web/images/icon_image/2017-01-13/6.png', 'Emergency Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 1, 1, 0, '2017-01-13'),
	(37, 'appointment', 'assets_web/images/icon_image/2017-01-13/5.png', 'Test Appointment', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 2, 1, 0, '2017-01-13'),
	(38, 'appointment', 'assets_web/images/icon_image/2017-01-13/N1.png', 'Neurology Surgery ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 3, 1, 0, '2017-02-20'),
	(39, 'appointment', 'assets_web/images/icon_image/2017-05-14/51.png', 'Oncology ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 4, 1, 0, '2017-05-14');
/*!40000 ALTER TABLE `ws_item` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_section
DROP TABLE IF EXISTS `ws_section`;
CREATE TABLE IF NOT EXISTS `ws_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `featured_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_section: ~6 rows (approximately)
/*!40000 ALTER TABLE `ws_section` DISABLE KEYS */;
INSERT IGNORE INTO `ws_section` (`id`, `name`, `title`, `description`, `featured_image`) VALUES
	(19, 'service', 'Service We Offer', 'Our department & special service ', 'assets_web/images/uploads/2016-11-02/b.jpg'),
	(20, 'about', 'About Us', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature froLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,m 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.', 'assets_web/images/uploads/c9995ec146f42d86911bb35a39f3f280.jpg'),
	(23, 'appointment', 'Why Choose Us', 'Our department & special service ', 'assets_web/images/uploads/2016-11-06/d.png'),
	(26, 'doctor', 'OUR DOCTOR', 'Our department & special service ', 'assets_web/images/uploads/2016-11-05/d.png'),
	(27, 'department', 'DEPARTMENT', 'Our department & special service ', ''),
	(28, 'blog', 'Latest Blog', 'Latest topics of the webstie', 'assets_web/images/uploads/2016-11-05/c.png');
/*!40000 ALTER TABLE `ws_section` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_setting
DROP TABLE IF EXISTS `ws_setting`;
CREATE TABLE IF NOT EXISTS `ws_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `twitter_api` text,
  `google_map` text,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `vimeo` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `dribbble` varchar(100) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `ws_setting` DISABLE KEYS */;
INSERT IGNORE INTO `ws_setting` (`id`, `title`, `description`, `logo`, `favicon`, `meta_tag`, `meta_keyword`, `email`, `phone`, `address`, `copyright_text`, `twitter_api`, `google_map`, `facebook`, `twitter`, `vimeo`, `instagram`, `dribbble`, `skype`, `google_plus`, `status`) VALUES
	(3, 'Bdtask Hospital Limited', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ', '', '', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ', '               Hospital, Appointment, System, \r\nHospital Appointment,Demo, Appointment', 'demo@hospital.com', '0123456788', '123/A, Street, State-12345, Demo', '<p>&copy; 2016 <a title="BdTask" href="http://bdtask.com" target="_blank">bdtask</a>. All rights reserved</p>\r\n<p>&nbsp;</p>', '<a class="twitter-timeline" data-lang="en" data-dnt="true" data-link-color="#207FDD" href="https://twitter.com/taylorswift13">Tweets by taylorswift13</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d29215.021939977993!2d90.40923229999999!3d23.75173875!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sbn!2sbd!4v1477987829881" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>', 'http://facebook.com/', 'http://', 'http://', 'http://', 'http://', 'http://', 'http://', 1);
/*!40000 ALTER TABLE `ws_setting` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_slider
DROP TABLE IF EXISTS `ws_slider`;
CREATE TABLE IF NOT EXISTS `ws_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_slider: ~3 rows (approximately)
/*!40000 ALTER TABLE `ws_slider` DISABLE KEYS */;
INSERT IGNORE INTO `ws_slider` (`id`, `title`, `subtitle`, `description`, `image`, `position`, `status`) VALUES
	(1, 'Lorem Ipsum is simply dummy text of the printing ', 'Lorem Ipsum is simply dummy text of the printing ', '<p>Lorem Ipsum is simply dummy text of the printingLorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing</p>', 'assets_web/images/slider/2016-11-03/a2.jpg', 3, 1),
	(2, 'Welcome to', 'Demo Hospital', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting</p>', 'assets_web/images/slider/2017-01-16/d1.jpg', 1, 1),
	(5, 'Second Slide ', 'Welcome back - Second slide', '<p><strong>Lorem Ipsum</strong></p>\r\n<hr />\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n<ul>\r\n<li>Demo Hospital Limited</li>\r\n<li>&lt;script&gt;alert(2)&lt;/script&gt;</li>\r\n</ul>', 'assets_web/images/slider/2016-11-03/s.jpg', 1, 1);
/*!40000 ALTER TABLE `ws_slider` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
