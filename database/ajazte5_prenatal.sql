-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2018 at 11:46 AM
-- Server version: 10.2.12-MariaDB-log
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajazte5_prenatal`
--

-- --------------------------------------------------------

--
-- Table structure for table `acm_account`
--

CREATE TABLE `acm_account` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acm_account`
--

INSERT INTO `acm_account` (`id`, `name`, `type`, `description`, `date`, `status`) VALUES
(1, 'Admin', '2', '1000', '2018-07-12', 1),
(2, '06/28/2018', '1', '`1000', '2018-07-12', 1),
(3, '23423423', '1', '234234', '2018-07-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `acm_invoice`
--

CREATE TABLE `acm_invoice` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `total` float NOT NULL,
  `vat` float NOT NULL,
  `discount` float NOT NULL,
  `grand_total` float NOT NULL,
  `paid` float NOT NULL,
  `due` float NOT NULL,
  `created_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acm_invoice`
--

INSERT INTO `acm_invoice` (`id`, `patient_id`, `total`, `vat`, `discount`, `grand_total`, `paid`, `due`, `created_id`, `date`, `status`) VALUES
(1, 'P9S49S95', 500, 25, 25, 500, 500, 0, 27, '2018-07-03', 1),
(2, 'sdfasd', 2000, 0, 0, 2000, 0, 2000, 2, '2018-07-12', 1),
(3, '2313', 0, 0, 0, 0, 0, 0, 2, '2018-07-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `acm_invoice_details`
--

CREATE TABLE `acm_invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `quantity` float NOT NULL,
  `price` float NOT NULL,
  `subtotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acm_invoice_details`
--

INSERT INTO `acm_invoice_details` (`id`, `invoice_id`, `account_id`, `description`, `quantity`, `price`, `subtotal`) VALUES
(70, 14, 8, 'Visit', 1, 50, 50),
(71, 15, 8, 'Doctor visit fee', 1, 500, 500),
(73, 16, 8, 'This is demo doctor', 3, 600, 1800),
(74, 17, 8, 'Doctor Visit', 1, 5000, 5000),
(75, 17, 9, 'Bed Fee', 1, 4000, 4000),
(76, 1, 0, '', 1, 500, 500),
(77, 2, 2, '', 2, 1000, 2000),
(78, 3, 2, '213123', 0, 0, 0),
(79, 3, 2, '123123', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acm_payment`
--

CREATE TABLE `acm_payment` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `pay_to` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  `created_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acm_payment`
--

INSERT INTO `acm_payment` (`id`, `account_id`, `pay_to`, `description`, `amount`, `created_id`, `date`, `status`) VALUES
(8, 10, 'Alamin', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 500, 2, '2017-01-16', 1),
(9, 11, 'Tanzil', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor', 400, 2, '2017-01-16', 1),
(10, 10, 'Jon Dye', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 200, 27, '2017-01-17', 1),
(11, 10, 'Kanye', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 500, 27, '2017-01-16', 1),
(12, 11, 'MR. RAHIM', '', 10000, 27, '2017-02-27', 1),
(13, 1, '324234', '', 0, 2, '2018-07-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `alert_type`
--

CREATE TABLE `alert_type` (
  `id` int(11) NOT NULL,
  `type` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alert_type`
--

INSERT INTO `alert_type` (`id`, `type`) VALUES
(1, 'Emergency'),
(2, 'Medical Advice'),
(3, 'Pain'),
(4, 'Antenatal Care'),
(5, 'Pregnancy');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `appointment_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `appointment_id`, `patient_id`, `doctor_id`, `department_id`, `schedule_id`, `serial_no`, `date`, `problem`, `created_by`, `create_date`, `status`) VALUES
(74, 'AERIUIM1', 'PUNACI3S', 15, NULL, 21, 1, '2017-01-13', 'Hi ! I have matha betha Problem', 1, '2017-01-12', 1),
(75, 'AU6167SP', 'P9S49S95', 15, NULL, 21, 2, '2017-01-13', 'Hi ! Sir I have Mathabetha problem', 8, '2017-01-12', 1),
(76, 'ASAXBOMC', 'PMXZFDP9', 1, NULL, 22, 29, '2017-01-14', 'Hi! hello how are', 2, '2017-01-12', 1),
(77, 'AZO0W67W', 'PUNACI3S', 15, NULL, 21, 3, '2017-01-20', 'Pain ', 8, '2017-01-15', 1),
(78, 'ALEMBJQL', 'P79I35Q5', 12, NULL, 19, 1, '2017-01-22', '', 7, '2017-01-16', 1),
(79, 'AL4WVCVD', 'PPPZJP52', 1, NULL, 24, 1, '2017-01-18', 'TE$ST', 7, '2017-01-16', 1),
(80, 'AZ0YMNYW', 'PNR6B7EY', 1, NULL, 21, 1, '2017-10-18', 'Hi ! I am in problem', 8, '2017-01-16', 1),
(81, 'AMUYVE7L', 'PR5JXID6', 1, NULL, 25, 2, '2017-01-16', 'He sir How are you', 2, '2017-01-16', 1),
(84, 'AK6VLKQ1', 'PYRT7ZOS', 1, NULL, 24, 2, '2017-01-18', 'Test', 1, '2017-01-16', 1),
(85, 'ARUMVG9X', 'P43O0999', 12, NULL, 19, 1, '2017-03-05', 'TEST', 0, '2017-02-28', 1),
(97, 'ATJPS3QD', 'PWBQ2LIR', 1, NULL, 26, 1, '2017-10-08', 'TEST', 2, '2017-10-03', 1),
(98, 'AOV0EX6V', 'P43O0999', 1, NULL, 26, 2, '2017-10-08', 'TEST', 1, '2017-10-03', 1),
(99, 'AG7QSRVG', 'P3GWY7V3', 12, NULL, 24, 1, '2017-10-04', 'TEST', 1, '2017-10-03', 1),
(100, 'A3NYEKF2', 'PL8XEPGJ', 1, NULL, 20, 1, '2017-10-06', 'TEST', 1, '2017-10-03', 1),
(101, 'ADZ5XSNT', 'PL8XEPGJ', 1, NULL, 26, 3, '2017-10-08', 'TEST', 1, '2017-10-03', 1),
(102, 'A69YI1XW', 'PR5JXID6', 12, NULL, 24, 2, '2017-10-04', 'TEST', 1, '2017-10-03', 1),
(103, 'AWZQ25KR', 'P4SKM8O6', 12, NULL, 24, 3, '2017-10-04', 'TEST', 7, '2017-10-03', 1),
(104, 'AO31WUAH', 'PC7XX3B8', 1, NULL, 26, 4, '2017-10-08', 'TEST', 0, '2017-10-03', 1),
(105, 'AYY5DUC7', 'P73FYR4H', 1, NULL, 20, 2, '2017-10-06', 'TEST', 0, '2017-10-05', 1),
(106, 'ABIC772V', 'PY6K4ZNF', 1, NULL, 20, 3, '2017-10-06', 'test', 0, '2017-10-05', 1),
(114, 'A3TC768W', 'PY6K4ZNF', 1, NULL, 20, 1, '2017-10-13', '', 0, '2017-10-07', 1),
(115, 'ASEVGS1F', 'PXVA8KUS', 12, NULL, 24, 1, '2017-10-11', 'TEST', 1, '2017-10-08', 1),
(116, 'AWWSI9NP', 'P3NMSGOR', 1, NULL, 27, 1, '2017-10-09', 'Test', 7, '2017-10-08', 1),
(117, 'AFNMKYYN', 'PLCWTP8G', 1, NULL, 27, 2, '2017-10-09', '', 8, '2017-10-08', 1),
(118, 'A170KPPP', 'PV53V0HJ', 1, NULL, 20, 2, '2017-10-13', 'Test Problem', 0, '2017-10-10', 1),
(119, 'APG978ZK', 'PHGWD0W0', 16, NULL, 25, 1, '2017-12-11', 'jjghjghj', 29, '2017-12-11', 1),
(120, 'ACV6WK7Y', 'P9XA38LW', 1, NULL, 27, 1, '2017-12-18', '', 0, '2017-12-14', 1),
(121, 'A6W3OZJS', 'PNLAD4L3', 1, NULL, 28, 1, '2018-06-25', 'headache', 2, '2018-06-21', 1),
(122, 'ATNAJ4P6', 'P9S49S95', 1, NULL, 30, 1, '2018-07-02', 'ffdfsfssfsfsfsfsfsfsssssssssssssdfsdfsfsfsfdsfsdf', 1, '2018-06-28', 1),
(123, 'AY8OK0L8', 'P9S49S95', 1, NULL, 31, 1, '2018-07-01', 'fgdgdfgfdg', 1, '2018-06-28', 1),
(124, 'APJE1WB0', 'P9S49S95', 12, NULL, 37, 4, '2018-07-01', 'fasffafaffadfaf', 29, '2018-06-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `audio_language`
--

CREATE TABLE `audio_language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audio_language`
--

INSERT INTO `audio_language` (`id`, `name`) VALUES
(1, 'English'),
(2, 'Urdu'),
(3, 'Datch');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` varchar(20) DEFAULT NULL,
  `bill_type` varchar(20) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `admission_id` varchar(20) DEFAULT NULL,
  `discount` float DEFAULT 0,
  `tax` float DEFAULT 0,
  `total` float DEFAULT 0,
  `payment_method` varchar(10) DEFAULT NULL,
  `card_cheque_no` varchar(100) DEFAULT NULL,
  `receipt_no` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `bill_id`, `bill_type`, `bill_date`, `admission_id`, `discount`, `tax`, `total`, `payment_method`, `card_cheque_no`, `receipt_no`, `note`, `date`, `status`) VALUES
(2, 'BLQOSOI6F', 'ipd', '2018-06-28', 'UNI901GQ', 20, 0, 300, 'Cash', '', '', 'gdgdfgdfgdgdgdfgdfg', '2018-06-28 11:27:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill_admission`
--

CREATE TABLE `bill_admission` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_admission`
--

INSERT INTO `bill_admission` (`id`, `admission_id`, `patient_id`, `doctor_id`, `package_id`, `admission_date`, `discharge_date`, `insurance_id`, `policy_no`, `agent_name`, `guardian_name`, `guardian_relation`, `guardian_contact`, `guardian_address`, `status`) VALUES
(1, 'UNI901GQ', 'P9S49S95', 1, 1, '2018-06-28', '2018-07-04', 1, '20', 'faraz', 'name', 'name', '200000000', 'asdasdsadasd', 1),
(2, 'UWS1ZST5', 'P9S49S95', 13, 2, '2018-07-18', '2018-07-11', 1, 'sdfsdf', '324324', '234324', '3324', 'dfsdf', 'sdfsdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill_advanced`
--

CREATE TABLE `bill_advanced` (
  `id` int(11) UNSIGNED NOT NULL,
  `admission_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `amount` float DEFAULT 0,
  `payment_method` varchar(255) DEFAULT NULL,
  `cash_card_or_cheque` varchar(10) DEFAULT NULL COMMENT '1 cash, 2 card, 3 cheque',
  `receipt_no` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bill_details`
--

CREATE TABLE `bill_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` varchar(20) DEFAULT NULL,
  `admission_id` varchar(20) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT 0,
  `amount` float DEFAULT 0,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bill_package`
--

CREATE TABLE `bill_package` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `services` text DEFAULT NULL,
  `discount` float DEFAULT 0,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_package`
--

INSERT INTO `bill_package` (`id`, `name`, `description`, `services`, `discount`, `status`) VALUES
(1, 'dfgdfgdfg', 'dfgdf', '[]', 20, 1),
(2, '4435435', 'sdfdsf', '[]', 0, 1),
(3, 'asdad', 'asdasd', '[]', 0, 1),
(4, '32423', '234234', '[]', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill_service`
--

CREATE TABLE `bill_service` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` float DEFAULT 0,
  `amount` float DEFAULT 0,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_service`
--

INSERT INTO `bill_service` (`id`, `name`, `description`, `quantity`, `amount`, `status`) VALUES
(1, 'fddffd', '', 0, 0, 1),
(2, '32432', '234234', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bm_bed`
--

CREATE TABLE `bm_bed` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `limit` int(3) NOT NULL,
  `charge` float NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bm_bed_assign`
--

CREATE TABLE `bm_bed_assign` (
  `id` int(11) NOT NULL,
  `serial` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `assign_date` date NOT NULL,
  `discharge_date` date NOT NULL,
  `assign_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cm_patient`
--

CREATE TABLE `cm_patient` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `case_manager_id` int(11) NOT NULL,
  `ref_doctor_id` int(11) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_address` text DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cm_patient`
--

INSERT INTO `cm_patient` (`id`, `patient_id`, `case_manager_id`, `ref_doctor_id`, `hospital_name`, `hospital_address`, `doctor_name`, `created_by`, `date`, `status`) VALUES
(1, 'PUNACI3S', 31, 12, 'Indus Hospital', 'Sector 39 Korangi Creek, Karachi, Karachi City, Sindh', 'sdasdadadada', 2, '2018-06-29', 1),
(2, 'PUNACI3S', 30, 15, 'Sindh Institute of Urology and Transplantation', 'Chand Bibi Rd, Ranchore Lane, Karachi, Karachi City, Sindh 74200', 'Adeeb Rizvi', 2, '2018-07-13', 1),
(3, 'PUNACI3S', 31, 16, 'NICVD National Institute of Cardiovascular Diseases', 'Rafiqi (H.J) Shaheed Road، Karachi Cantonment, Karachi, Karachi City, Sindh 75510', 'Adeeb Rizvi', 2, '2018-07-13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cm_status`
--

CREATE TABLE `cm_status` (
  `id` int(11) NOT NULL,
  `critical_status` varchar(255) NOT NULL DEFAULT '1',
  `cm_patient_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_sms_info`
--

CREATE TABLE `custom_sms_info` (
  `custom_sms_id` int(11) NOT NULL,
  `reciver` varchar(100) NOT NULL,
  `gateway` text NOT NULL,
  `message` text NOT NULL,
  `sms_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_sms_info`
--

INSERT INTO `custom_sms_info` (`custom_sms_id`, `reciver`, `gateway`, `message`, `sms_date_time`) VALUES
(56, '03042161678', 'nexmo', 'Hello, faraz sheikh. \r\nYour ID: PNLAD4L3,  \r\nThank you for the registration.', '2018-06-21 03:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dprt_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dprt_id`, `name`, `description`, `status`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `hidden_attach_file` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `upload_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `patient_id`, `doctor_id`, `description`, `hidden_attach_file`, `date`, `upload_by`) VALUES
(2, 'P9S49S95', 1, '<p>sadadadadsadasdd</p>', './assets/attachments/827c38c0fc6e20e2373907cd8a1aa3d0.pdf', '2018-06-28', 2),
(3, 'P9S49S95', 1, '<p>dasdasdsadsadsadadd</p>', './assets/attachments/df22880d080e1929a29e59aabffdab87.pdf', '2018-06-28', 1),
(4, 'P9S49S95', 29, '<p>ffsfsfsdfsdf</p>', './assets/attachments/0fa7ce3a1a530f0702a0ed8b83ec8bab.pdf', '2018-06-28', 29);

-- --------------------------------------------------------

--
-- Table structure for table `emergency_alert`
--

CREATE TABLE `emergency_alert` (
  `id` int(11) NOT NULL,
  `alert_id` int(11) DEFAULT NULL,
  `patient_id` varchar(250) DEFAULT NULL,
  `patient_name` varchar(250) DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `is_read` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_alert`
--

INSERT INTO `emergency_alert` (`id`, `alert_id`, `patient_id`, `patient_name`, `location`, `is_read`) VALUES
(1, 1, 'P9S49S95', 'sikander', 'karachi', 1),
(2, 1, 'P9S49S95', 'sikander', 'karachi', 1),
(4, 1, 'P9S49S95', 'sikander', '0', 0),
(5, 1, 'P9S49S95', 'sikander', 'Nagram - Nilmatha Rd, Sevai, Uttar Pradesh 226002, India', 0),
(6, 1, 'P9S49S95', 'sikander', 'Nagram - Nilmatha Rd, Sevai, Uttar Pradesh 226002, India', 0),
(7, 1, 'P9S49S95', 'sikander ', '0', 0),
(8, 3, 'PUNACI3S', 'Sikander Ali', '744 Tariq Rd, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', 0),
(9, 3, 'PUNACI3S', 'Sikander Ali', '0', 0),
(10, 3, 'PUNACI3S', 'Sikander Ali', '744 Tariq Rd, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', 0),
(11, 4, 'PUNACI3S', 'Sikander Ali', '744 Tariq Rd, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', 0),
(12, 1, 'PUNACI3S', 'Sikander Ali', '0', 0),
(13, 5, 'PUNACI3S', 'Sikander Ali', '0', 0),
(14, 2, 'PUNACI3S', 'Sikander Ali', '744 Tariq Rd, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', 0),
(15, 3, 'PUNACI3S', 'Sikander Ali', '744 Tariq Rd, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `enquiry_id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `enquiry` text DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`enquiry_id`, `email`, `phone`, `name`, `enquiry`, `checked`, `ip_address`, `user_agent`, `checked_by`, `created_date`, `status`) VALUES
(56, 'tanzil4091@gmail.com', '1922296392', 'Tanzil Ahmad', 'Hi ! I want to add your Hospital', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 2, '2017-01-16 05:29:20', 1),
(57, 'sumch@gmail.com', '1922296398', 'Tarek', 'Hi ! I want to work with hospital', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 7, '2017-01-16 05:30:05', 1),
(58, 'jon@gmail.com', '1782296392', 'Jon Doy', 'Hi ! How are you. i want to work with demo hospital limited.', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 7, '2017-01-16 05:31:15', 1),
(59, 'john@doe.com', '01255564757845', 'John Doe', '<p>HELLO</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-26 09:32:46', 0),
(60, 'john@doe.com', '01255564757845', 'John Doe', '<p>HELLO</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 7, '2017-02-26 09:34:20', 0),
(62, 'john@doe.com', '01312323456', 'John Doe', '<p>Hello World!</p>\r\n<p>Ãƒâ€šÃ‚Â </p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-26 11:25:20', 1),
(63, 'receptionist@demo.com', '0123456789', 'Test', '<p>HELLO ADMIN!</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-27 09:06:10', 1),
(64, 'test@demo.com', '0123456789', 'Test', 'Need a Doctor for Check-up?\r\nJUST MAKE AN APPOINTMENT & YOU\'RE DONE !', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-27 10:32:02', 1),
(65, 'swift@example.com', '1234567890', 'Swift', 'Need a Doctor for Check-up?\r\nJUST MAKE AN APPOINTMENT & YOU\'RE DONE !', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-28 11:39:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `family_planning`
--

CREATE TABLE `family_planning` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family_planning`
--

INSERT INTO `family_planning` (`id`, `name`, `language`, `file_name`, `description`, `status`) VALUES
(9, 'abc', '2', 'fba528428d5cae3c0994954a625f43e9.wav', 'sdasdsadasdasdasd', 0),
(10, 'qwert', '3', 'ca872426ef5e7c0dca313e621cdf3c50.wav', 'asdasdasdasdasd', 0),
(11, 'Admin', '2', '5f0d63ca378c90ec45e96a1860a55c59.wav', 'asdasdasdasdasd', 0),
(12, 'Admin', '2', 'fbf45c05a475f8e9496ae14ee9a29919.wav', 'asdasdasd', 0),
(13, 'abc.mp3', '1', '8695e9d707cd23d1464512010ceef950.wav', 'sdasdasd', 1),
(14, 'ROOT123', '2', '0db222aaa4e59ff903ead3bebbc2df1f.wav', 'dasdasdasd', 1),
(15, 'Admin', '2', '0ca9366f3c032168fd93d9826644c09c.wav', 'asdasdasd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ha_birth`
--

CREATE TABLE `ha_birth` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ha_birth`
--

INSERT INTO `ha_birth` (`id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`) VALUES
(1, 'tariq center', 'dfgdfg', 'P9S49S95', 13, '2018-07-16', 1),
(2, 'sd', 'sdsd', '345345', 0, '2018-07-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ha_category`
--

CREATE TABLE `ha_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ha_death`
--

CREATE TABLE `ha_death` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ha_death`
--

INSERT INTO `ha_death` (`id`, `title`, `description`, `patient_id`, `doctor_id`, `date`, `status`) VALUES
(1, 'hgjhj', 'fdgfdg', 'P9S49S95', 37, '2018-07-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ha_investigation`
--

CREATE TABLE `ha_investigation` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ha_medicine`
--

CREATE TABLE `ha_medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `manufactured_by` varchar(255) NOT NULL,
  `create_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ha_operation`
--

CREATE TABLE `ha_operation` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inc_insurance`
--

CREATE TABLE `inc_insurance` (
  `id` int(11) NOT NULL,
  `insurance_name` varchar(255) DEFAULT NULL,
  `service_tax` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `insurance_no` varchar(50) DEFAULT NULL,
  `insurance_code` varchar(50) DEFAULT NULL,
  `disease_charge` text DEFAULT NULL COMMENT 'array(name, charge)',
  `hospital_rate` varchar(50) DEFAULT NULL,
  `insurance_rate` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inc_insurance`
--

INSERT INTO `inc_insurance` (`id`, `insurance_name`, `service_tax`, `discount`, `remark`, `insurance_no`, `insurance_code`, `disease_charge`, `hospital_rate`, `insurance_rate`, `total`, `status`) VALUES
(1, 'dasddadas', '30', '20', 'dfdadadad', '465454', 'dsadasdsad', '{\"20\":\"10\"}', '20', '10', '30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inc_limit_approval`
--

CREATE TABLE `inc_limit_approval` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `disease_details` text DEFAULT NULL COMMENT 'name, description',
  `consultant_id` int(11) DEFAULT NULL COMMENT 'doctor list',
  `policy_name` varchar(255) DEFAULT NULL,
  `policy_no` varchar(100) DEFAULT NULL,
  `policy_holder_name` varchar(255) DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `approval_breakup` text DEFAULT NULL COMMENT 'name, charge',
  `total` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) UNSIGNED NOT NULL,
  `phrase` text NOT NULL,
  `english` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES
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
(485, 'update_bill', 'Update Bill'),
(486, 'family_planning', 'Family Planning'),
(487, 'add_audio', 'Add Audio'),
(488, 'audio_messages', 'List of Audio Messages'),
(489, 'file_name', 'File Name'),
(490, 'audio', 'Audio'),
(491, 'invalid_audio', 'Invalid Audio'),
(492, 'select_audio', 'Select Audio'),
(493, 'midwife', 'MidWife');

-- --------------------------------------------------------

--
-- Table structure for table `mail_setting`
--

CREATE TABLE `mail_setting` (
  `id` int(11) NOT NULL,
  `protocol` varchar(20) NOT NULL,
  `mailpath` varchar(255) NOT NULL,
  `mailtype` varchar(20) NOT NULL,
  `validate_email` varchar(20) NOT NULL,
  `wordwrap` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_setting`
--

INSERT INTO `mail_setting` (`id`, `protocol`, `mailpath`, `mailtype`, `validate_email`, `wordwrap`) VALUES
(5, 'sendmail', '/usr/sbin/sendmail', 'html', 'false', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unseen, 1=seen, 2=delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `subject`, `message`, `datetime`, `sender_status`, `receiver_status`) VALUES
(49, 8, 29, 'kljkljkljk', '<p>tyutyutuytututyutyu</p>', '2018-06-21 03:16:30', 1, 1),
(50, 1, 13, 'abc', '<p>asdasd</p>', '2018-07-16 03:01:36', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `assign_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `title`, `description`, `start_date`, `end_date`, `assign_by`, `status`) VALUES
(1, '2234', '<p>dsfsd</p>', '2018-07-03', '2018-07-16', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) NOT NULL,
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
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `patient_id`, `firstname`, `middlename`, `lastname`, `email`, `password`, `phone`, `mobile`, `address`, `sex`, `blood_group`, `date_of_birth`, `affliate`, `picture`, `created_by`, `create_date`, `status`) VALUES
(153, 'P9S49S95', 'faraz', 'sadasd', 'sasa', 'faraz@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '0000000000000', NULL, NULL, 'Male', NULL, '1989-06-27', NULL, NULL, 2, '2018-06-28', 1),
(154, 'PUNACI3S', 'Sikander', 'Ali', 'Ali', 'sikander@fsdsolutions.com', '827ccb0eea8a706c4c34a16891f84e7b', '03337132071', NULL, NULL, 'Male', NULL, '2001-01-01', NULL, NULL, 2, '2018-07-04', 1),
(155, 'P2RJD923', '123', '123', '123', 'syed_hamza08@yahoo.com', '827ccb0eea8a706c4c34a16891f84e7b', 'abcs', NULL, NULL, 'Male', NULL, '1970-01-01', NULL, NULL, 2, '2018-07-11', 1),
(156, 'P6J8WPBA', '123', '12345', '32434', 'sadialiaqat124@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'asdasd', NULL, NULL, 'Male', NULL, '2018-07-18', NULL, NULL, 2, '2018-07-17', 1),
(157, 'PCLVNYKC', '123', '123', '456', 'shariq@fsdsolutions.com', '827ccb0eea8a706c4c34a16891f84e7b', 'sdfsdf', NULL, NULL, 'Male', NULL, '1970-01-01', NULL, NULL, 2, '2018-07-18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_detail`
--

CREATE TABLE `patient_detail` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `name_of_village` varchar(255) NOT NULL,
  `quarter` varchar(255) NOT NULL,
  `income` varchar(255) NOT NULL,
  `education` varchar(255) NOT NULL,
  `employment_status` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `residence` varchar(255) NOT NULL,
  `antenatal_visits` varchar(255) NOT NULL,
  `place_visits` longtext NOT NULL,
  `delivery` varchar(20) NOT NULL,
  `head_of_household` varchar(20) NOT NULL,
  `alive` varchar(20) NOT NULL,
  `dead` varchar(20) NOT NULL,
  `total_pregnancies` varchar(255) NOT NULL,
  `medical_history` mediumtext NOT NULL,
  `history_of_diabetes` mediumtext NOT NULL,
  `history_of_hypertension` mediumtext NOT NULL,
  `examination` mediumtext NOT NULL,
  `echography` mediumtext NOT NULL,
  `foetal_movements` varchar(50) NOT NULL,
  `foetal_presentation` varchar(50) NOT NULL,
  `foetal_presentation_detail` mediumtext NOT NULL,
  `drug_history` mediumtext NOT NULL,
  `antenatal_history` mediumtext NOT NULL,
  `hiv_screening_test` mediumtext NOT NULL,
  `on_arv_anti_retrovirial` mediumtext NOT NULL,
  `malaria_screening_test` mediumtext NOT NULL,
  `hepatitis_b_screening_test` mediumtext NOT NULL,
  `physical_exams` mediumtext NOT NULL,
  `treatments` mediumtext NOT NULL,
  `pih_anaemia_screening` mediumtext NOT NULL,
  `advise_counsel` mediumtext NOT NULL,
  `preventive_measures` mediumtext NOT NULL,
  `adherence_to_treatment` mediumtext NOT NULL,
  `bleeding_during_pregnancy` mediumtext NOT NULL,
  `vaccination_status` mediumtext NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_detail`
--

INSERT INTO `patient_detail` (`id`, `patient_id`, `name_of_village`, `quarter`, `income`, `education`, `employment_status`, `occupation`, `marital_status`, `language`, `religion`, `residence`, `antenatal_visits`, `place_visits`, `delivery`, `head_of_household`, `alive`, `dead`, `total_pregnancies`, `medical_history`, `history_of_diabetes`, `history_of_hypertension`, `examination`, `echography`, `foetal_movements`, `foetal_presentation`, `foetal_presentation_detail`, `drug_history`, `antenatal_history`, `hiv_screening_test`, `on_arv_anti_retrovirial`, `malaria_screening_test`, `hepatitis_b_screening_test`, `physical_exams`, `treatments`, `pih_anaemia_screening`, `advise_counsel`, `preventive_measures`, `adherence_to_treatment`, `bleeding_during_pregnancy`, `vaccination_status`, `latitude`, `longitude`) VALUES
(9, 'P9S49S95', 'lahore', 'sdasdad', '30,001-50,000 CFA', 'Other', 'Student', 'asdadadasd', 'Divorced', 'Fufulde', 'Muslim', 'Urban', '2', 'sdadsa', 'C-section', 'Female', '2', '0', '2', 'asdfffasdfasfsafasdfad', '13221113111', 'sdfsdfsdfsdfs', 'sdfsdfs', 'sdfsd', 'No (poor)', 'Hand - risky', '', 'sdfsdfsdsdfdsfs', 'sdfsdfsdfsdf', 'sfsdfsdfsfsdf', 'sdfsdfsfsdfsdfds', 'sdfsdfsdfsfcwthbdfwet', 'bergnmtyikiyeryrter', 'dghdjrtujktfterer', 'gherynfrtjrtyjer', 'tertehndhnreyehedhebews', 'retebrhhertjhjee', 'erreyhrhnjrtererrbbe', 'gbberberbrebebebrberb', 'ergergerrehejhejjjr', 'adadad', '31.5203696', '74.3587473'),
(10, 'PUNACI3S', 'Alil', 'quarter', 'Less than 10,000 CFA', 'Secondary', 'Student', 'NaN', 'Widowed', 'Pidgin English', 'Muslim', 'Urban', '2', 'aaaa', 'Normal', 'Male', '1', '1', '1', 'aaa', 'aa', 'aa', 'aa', 'aa', 'Yes (good)', 'Cephalic – Good', '', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', '', ''),
(11, 'P2RJD923', '12345', '1234', '10,001-30,000 CFA', 'Secondary', 'Employed for salary', 'business', 'Single, never married', 'Pidgin English', 'Christian (Catholic, Presbyterian, Baptist)', 'semi–urban', '123213', 'sadsad', 'C-section', 'Male', '23324', '32432', '324324', 'dsfsdf', 'dsfdsf', 'dsfsdfsdf', 'sdfdsf', 'sdfsdf', 'Yes (good)', 'Cephalic – Good', '', 'sdfsdf', 'sdfsdfdsf', 'sdfsdf', 'sdfsdfsdf', 'asdasdasd', 'asdasdas', 'asdasdasd', 'asdasdasdasdasd', 'asdasdas', 'asdasd', 'asdasd', 'asdasdsad', 'sadasdasd', 'asdasd', '34.0410619', '-118.26018899999997'),
(12, 'P6J8WPBA', 'karachi', 'sadfdf', '70001-90000', 'Secondary', 'Unable to work', 'business', 'Widowed', 'Local dialect-name of local dialect', 'Muslim', 'Urban', '234324', 'dsfdsfsdf', 'C-section', 'Male', '3', '3', '324', '324324', '234234', '234324', '324324', '234324', 'Yes (good)', 'Cephalic – Good', '', '234324', '324324', '234324', '234234', '234234', '234234', '23423432', '234234', '234324', '234324', '23432423', '234234', '234234324', '324234', '24.8607343', '67.00113639999995'),
(13, 'PCLVNYKC', 'abcd', '1234', '10,001-30,000 CFA', 'No formal education', 'Employed for salary', 'business', 'Married – Polygamy or Monogamy', 'Pidgin English', 'Christian (Catholic, Presbyterian, Baptist)', 'Urban', '1', 'ssdfds', 'C-section', 'Female', '2', '2', '32', 'dsfsdfsdf', 'sdfdsf', 'dsfsdf', 'sdfsdf', 'sdfsdf', 'Yes (good)', 'Breach - risky', '', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdfsdf', 'sdfsdfsdf', 'sdfsdf', 'sdfsdfsdf', 'sdfsdf', 'sdfsdfsdf', '42.3411626', '-71.08067059999996');

-- --------------------------------------------------------

--
-- Table structure for table `pr_case_study`
--

CREATE TABLE `pr_case_study` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `created_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `test` int(11) DEFAULT NULL,
  `test2` int(11) DEFAULT NULL,
  `delivery` varchar(20) NOT NULL,
  `head_of_household` varchar(20) NOT NULL,
  `alive` varchar(20) NOT NULL,
  `dead` varchar(20) NOT NULL,
  `total_pregnancies` varchar(255) NOT NULL,
  `medical_history` mediumtext NOT NULL,
  `history_of_diabetes` mediumtext NOT NULL,
  `history_of_hypertension` mediumtext NOT NULL,
  `examination` mediumtext NOT NULL,
  `echography` mediumtext NOT NULL,
  `foetal_movements` varchar(50) NOT NULL,
  `foetal_presentation` varchar(50) NOT NULL,
  `foetal_presentation_detail` mediumtext NOT NULL,
  `drug_history` mediumtext NOT NULL,
  `antenatal_history` mediumtext NOT NULL,
  `hiv_screening_test` mediumtext NOT NULL,
  `on_arv_anti_retrovirial` mediumtext NOT NULL,
  `malaria_screening_test` mediumtext NOT NULL,
  `hepatitis_b_screening_test` mediumtext NOT NULL,
  `physical_exams` mediumtext NOT NULL,
  `treatments` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pr_case_study`
--

INSERT INTO `pr_case_study` (`id`, `patient_id`, `food_allergies`, `tendency_bleed`, `heart_disease`, `high_blood_pressure`, `diabetic`, `surgery`, `accident`, `others`, `family_medical_history`, `current_medication`, `female_pregnancy`, `breast_feeding`, `health_insurance`, `low_income`, `reference`, `created_by`, `status`, `test`, `test2`, `delivery`, `head_of_household`, `alive`, `dead`, `total_pregnancies`, `medical_history`, `history_of_diabetes`, `history_of_hypertension`, `examination`, `echography`, `foetal_movements`, `foetal_presentation`, `foetal_presentation_detail`, `drug_history`, `antenatal_history`, `hiv_screening_test`, `on_arv_anti_retrovirial`, `malaria_screening_test`, `hepatitis_b_screening_test`, `physical_exams`, `treatments`) VALUES
(1, 'P9S49S95', 'sdasdasdadadas', 'sdsadadsad', 'dasdsadsadsad', 'sadsadadas', 'adasdsadasd', 'sdasdasdad', 'dasdadasd', 'adasdasdsad', 'dsadsad', 'dsadadsadaas', 'dsadadsad', 'adasdasdsa', 'sadsad', '50000', 'dasddsadaddsadasdsadsdd', 29, 1, NULL, NULL, 'Normal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 'P9S49S95', 'sdasdasdadada', 'sdsadadsad', 'dasdsadsadsad', 'sadsadadas', 'adasdsadasd', 'sdasdasdad', 'dasdadasd', 'adasdasdsad', 'dsadsad', 'dsadadsadaas', 'dsadadsad', 'adasdasdsa', 'sadsad', '11', 'dasddsadaddsadasdsadsdd', 1, 1, NULL, NULL, 'Normal', 'Female', '2', '2', '5', 'sadasd', 'SADASD', 'DASDASD', 'ASD', 'ADSD', 'No (poor)', 'Breach - risky', '', 'ASDAS', 'ASD', 'DASD', 'ASDASD', 'ASDASD', 'ASDASD', 'ASDAS', 'ADSDASD'),
(3, 'sads', 'sdfsd', 'sdfsd', 'sdfsdf', 'sdfsdfsdfdsfdsf', 'sdfsdf', 'sdfsdf', '', '', '', '', '', '', '', '', '', 0, 1, NULL, NULL, 'Normal', 'Grandparent', '0', '2', '2', 'dfdfs', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'Yes (good)', 'Breach - risky', '', 'sdfsd', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdfsd', 'sdfsdfsdf'),
(4, 'sdfsd', 'sdfsd', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, NULL, NULL, 'Normal', 'Grandparent', '', '', '', '', '', '', '', '', 'Yes (good)', 'Cephalic – Good', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pr_prescription`
--

CREATE TABLE `pr_prescription` (
  `id` int(11) UNSIGNED NOT NULL,
  `appointment_id` varchar(30) DEFAULT NULL,
  `patient_id` varchar(30) NOT NULL,
  `patient_type` varchar(50) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `chief_complain` text DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `policy_no` varchar(255) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `medicine` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `visiting_fees` float DEFAULT NULL,
  `patient_notes` text DEFAULT NULL,
  `reference_by` varchar(50) DEFAULT NULL,
  `reference_to` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pr_prescription`
--

INSERT INTO `pr_prescription` (`id`, `appointment_id`, `patient_id`, `patient_type`, `doctor_id`, `chief_complain`, `insurance_id`, `policy_no`, `weight`, `blood_pressure`, `medicine`, `diagnosis`, `visiting_fees`, `patient_notes`, `reference_by`, `reference_to`, `date`, `created_by`) VALUES
(1, 'ATNAJ4P6', 'P9S49S95', 'New', 1, 'dfgdfgdg', 0, 'dgdgdgdfg', '100', '200', '[{\"name\":\"dsdfsdf\",\"type\":\"dsdfds\",\"instruction\":\"sdfdsfsdfsdfsdfds\",\"days\":\"2\"},{\"name\":\"sfsfsd\",\"type\":\"sdfsdf\",\"instruction\":\"sdfsdfsf\",\"days\":\"\"}]', '[{\"name\":\"sdfsdf\",\"instruction\":\"sdfsdfsfdsfsdfsdf\"}]', 200, 'dgdfgdfgdfgdgdgffdgdgdfgdfgfdg', '1100', NULL, '2018-06-28', 1),
(2, 'A5GFWBKH29', 'P9S49S95', 'New', 1, 'fghfhfgh', 0, '20', '100', 'dfhdg', '[{\"name\":\"fghgfhfg\",\"type\":\"fghfgh\",\"instruction\":\"fhfghfghgfggfdgfdgfdggdgdg\",\"days\":\"15\"},{\"name\":\"gdfgdfgdfg\",\"type\":\"gdfgdfgfdg\",\"instruction\":\"fdgdgfdg\",\"days\":\"10\"}]', '[{\"name\":\"dfgdfgdfgdfgdfgdfgdg\",\"instruction\":\"gdfgfdgdg\"}]', 100000, 'dfsdfdsfsdfsdfsdfsdf', 'hhfghfgh', NULL, '2018-06-29', 29),
(4, 'AJ34708729', 'P9S49S95', 'New', 12, 'sadsad', 0, 'adasdad', 'dsad', 'asdsad', '[{\"name\":\"adasd\",\"type\":\"sdsa\",\"instruction\":\"asdasd\",\"days\":\"\"}]', '[{\"name\":\"asdasd\",\"instruction\":\"dad\"}]', 300, 'asdasd', 'adasd', NULL, '2018-06-29', 29);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `available_days` varchar(50) DEFAULT NULL,
  `per_patient_time` time DEFAULT NULL,
  `serial_visibility_type` tinyint(4) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `doctor_id`, `start_time`, `end_time`, `available_days`, `per_patient_time`, `serial_visibility_type`, `created_by`, `status`) VALUES
(30, 1, '03:05:00', '09:00:00', 'Monday', '05:00:00', 2, 0, 1),
(31, 1, '00:05:00', '23:00:00', 'Sunday', '00:10:00', 1, 0, 1),
(32, 1, '09:00:00', '00:00:00', 'Monday', '00:05:00', 2, 0, 1),
(37, 12, '03:05:00', '09:00:00', 'Sunday', '00:05:00', 1, 29, 1),
(38, 13, '08:10:30', '10:40:15', 'Tuesday', '03:00:00', 1, 0, 1),
(39, 37, '12:15:15', '10:15:15', 'Wednesday', '08:00:00', 2, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `time_zone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `title`, `description`, `email`, `phone`, `logo`, `favicon`, `language`, `site_align`, `footer_text`, `time_zone`) VALUES
(2, 'Demo Hospital Limited', '98 Green Road, Farmgate, Dhaka-1215', 'pre-natal@gmail.com', '1922296392', 'assets/images/apps/90908412f7fdadd81a40a3f79e9c3d52.png', 'assets/images/icons/a0ed8ec88e07205e07116f9098844bb8.ico', 'english', 'LTR', '2017Â©Copyright', 'Asia/Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `sms_delivery`
--

CREATE TABLE `sms_delivery` (
  `sms_delivery_id` int(11) NOT NULL,
  `ss_id` int(11) NOT NULL,
  `delivery_date_time` datetime NOT NULL,
  `sms_info_id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateway`
--

CREATE TABLE `sms_gateway` (
  `gateway_id` int(11) NOT NULL,
  `provider_name` text NOT NULL,
  `user` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `authentication` text NOT NULL,
  `link` text NOT NULL,
  `default_status` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_gateway`
--

INSERT INTO `sms_gateway` (`gateway_id`, `provider_name`, `user`, `password`, `authentication`, `link`, `default_status`, `status`) VALUES
(1, 'nexmo', '1d286ff1', '11a8b67955d4482f', 'Hospital', 'https://www.nexmo.com/', 1, 1),
(2, 'clickatell', 'clickatell', '9d2e2d3aa558ddcb', 'Hospital', 'https://www.clickatell.com/', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_info`
--

CREATE TABLE `sms_info` (
  `sms_info_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `sms_counter` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_schedule`
--

CREATE TABLE `sms_schedule` (
  `ss_id` int(11) NOT NULL,
  `ss_teamplate_id` int(11) NOT NULL,
  `ss_name` text NOT NULL,
  `ss_schedule` varchar(100) NOT NULL,
  `ss_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_schedule`
--

INSERT INTO `sms_schedule` (`ss_id`, `ss_teamplate_id`, `ss_name`, `ss_schedule`, `ss_status`) VALUES
(1, 2, 'One', '1:1:1', 1),
(2, 9, 'Summer offer', '10:3:0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `appointment` tinyint(1) DEFAULT NULL,
  `registration` tinyint(1) DEFAULT NULL,
  `schedule` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_setting`
--

INSERT INTO `sms_setting` (`id`, `appointment`, `registration`, `schedule`) VALUES
(2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_teamplate`
--

CREATE TABLE `sms_teamplate` (
  `teamplate_id` int(11) NOT NULL,
  `teamplate_name` text DEFAULT NULL,
  `teamplate` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `default_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_teamplate`
--

INSERT INTO `sms_teamplate` (`teamplate_id`, `teamplate_name`, `teamplate`, `type`, `status`, `default_status`) VALUES
(1, 'Appointment Template', 'Doctor, %doctor_name%. \r\nHello, %patient_name%. \r\nYour ID: %patient_id%, Appointment ID: %appointment_id%, Serial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', 'Appointment', 1, 0),
(2, 'Schedule', 'Doctor, %doctor_name%. \r\nHello, %patient_name%. \r\nYour ID: %patient_id%, Appointment ID: %appointment_id%, Serial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', 'Schedule', 1, 1),
(3, 'Registration', 'Hello, %patient_name%. \r\nYour ID: %patient_id%,  \r\nThank you for the registration.', 'Registration', 1, 1),
(4, 'Summer Offer', 'Hello, %patient_name%. Your ID: %patient_id%,\r\nYour promo code is 1010101.\r\nContact with us.\r\nThanks', 'Schedule', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sms_users`
--

CREATE TABLE `sms_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_users`
--

INSERT INTO `sms_users` (`id`, `user_id`, `receiver`, `message`, `date`) VALUES
(3, 8, '923337132071', 'fsdfsfsdf', '2018-06-21 07:18:25'),
(4, 29, '923337132071', 'sdasdasd', '2018-07-02 09:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
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
  `short_biography` text DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `specialist` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `user_role`, `designation`, `department_id`, `address`, `phone`, `mobile`, `short_biography`, `picture`, `specialist`, `date_of_birth`, `sex`, `blood_group`, `degree`, `created_by`, `create_date`, `update_date`, `status`) VALUES
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
(31, 'John', 'Doe', 'case2@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 9, NULL, NULL, 'India', NULL, '0123459689', NULL, '', NULL, NULL, 'Male', NULL, NULL, 2, '2017-10-28', NULL, 1),
(32, 'faraz', 'sheikh', 'faraz@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 10, '', 17, 'karachi,pakistan', '', '03042161678', '', '', '', '2018-06-21', 'Male', 'A+', '', 2, '2018-06-21', NULL, 1),
(36, 'Farheen', 'Khan', 'Khan@gmail.com', '4deaeb3f1661d3655e085b642910d5c1', 11, NULL, NULL, 'aasdasdasd', NULL, '03337132071', NULL, '', NULL, NULL, 'Female', NULL, NULL, 2, '2018-07-09', NULL, 1),
(37, '123', '456', 'syed_hamza08@yahoo.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'business', NULL, 'asdasdasdsadsad', 'sdfsdf3214234', 'dsffdf324234234', '<p>324234234</p>', '', 'dpt', '2018-07-11', 'Male', 'B+', '<p>wqewqewqe</p>', 2, '2018-07-11', NULL, 1),
(38, 'syeed', 'hamzaa', 'syed_hamza@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 'business', NULL, 'asdasda', '435435', '34534', '<p>asdasd</p>', '', 'asdasd', '2018-07-11', 'Male', 'O+', '<p>asdsadsad</p>', 2, '2018-07-27', NULL, 1),
(39, '32324', '23432', 'syed_hamzaaaa08@yahoo.com', '25d55ad283aa400af464c76d713c07ad', 4, NULL, NULL, 'eewrrwerewe', NULL, '234324324324324', NULL, '', NULL, NULL, 'Male', NULL, NULL, 2, '2018-07-16', NULL, 1),
(40, 'syed ', 'hamza', 'admin@jaria.com', '537816413185d5e09a471933aa10335c', 5, NULL, NULL, 'dfgfdgdfg', NULL, 'asdasdasd', NULL, 'assets/images/human_resources/22e0ba21480cfd542e17e3ae5719cec4.jpg', NULL, NULL, 'Male', NULL, NULL, 2, '2018-07-16', NULL, 1),
(41, 'syed', 'hamza', 'shariq@fsdsolutions.com', '827ccb0eea8a706c4c34a16891f84e7b', 4, NULL, NULL, 'asdasdsa', NULL, '033342664396', NULL, 'assets/images/human_resources/7a87b284de65b9ceef787e4f589c47d2.jpg', NULL, NULL, 'Male', NULL, NULL, 2, '2018-07-18', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `platform` enum('ios','android','windows') DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `device_id` varchar(45) DEFAULT NULL,
  `gcm_id` varchar(45) DEFAULT NULL COMMENT 'Google Cloud Message - ID',
  `notifications` tinyint(1) DEFAULT 1,
  `badges` int(10) UNSIGNED DEFAULT 0,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `last_activity_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ws_comment`
--

CREATE TABLE `ws_comment` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `add_to_website` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_comment`
--

INSERT INTO `ws_comment` (`id`, `item_id`, `name`, `email`, `comment`, `date`, `add_to_website`) VALUES
(64, 25, 'John Doe', 'doe@example.com', 'Hello World!', '2017-01-15 11:42:47', 1),
(65, 24, 'Tanzil Ahmad', 'tanzil4091@gmail.com', 'I highly recommend this application for hospital management', '2017-01-16 01:50:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_item`
--

CREATE TABLE `ws_item` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `icon_image` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `position` int(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `counter` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_item`
--

INSERT INTO `ws_item` (`id`, `name`, `icon_image`, `title`, `description`, `position`, `status`, `counter`, `date`) VALUES
(24, 'blog', 'assets_web/images/icon_image/2017-01-12/t.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 1, 1, 32, '2017-01-12'),
(25, 'blog', 'assets_web/images/icon_image/2017-01-12/e.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 2, 1, 32, '2017-01-12'),
(26, 'blog', 'assets_web/images/icon_image/2017-01-12/d.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 3, 1, 9, '2017-01-12'),
(27, 'blog', 'assets_web/images/icon_image/2017-01-12/m.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 4, 1, 4, '2017-01-12'),
(28, 'service', 'assets_web/images/icon_image/2017-05-14/u3.png', 'Emergency Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 1, 1, 0, '2017-05-14'),
(29, 'service', 'assets_web/images/icon_image/2017-01-13/u.png', 'Call Center 24/7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 2, 1, 0, '2017-01-13'),
(30, 'service', 'assets_web/images/icon_image/2017-01-13/h1.png', 'Cardiac Surgery', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 3, 1, 0, '2017-01-13'),
(31, 'service', 'assets_web/images/icon_image/2017-01-13/D.png', 'Dental Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 4, 1, 0, '2017-01-13'),
(32, 'service', 'assets_web/images/icon_image/2017-01-13/i.png', 'Ophthalmology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 5, 1, 0, '2017-01-13'),
(33, 'service', 'assets_web/images/icon_image/2017-05-14/u4.png', 'Neurology ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 6, 1, 0, '2017-05-14'),
(34, 'about', 'assets_web/images/icon_image/5adaedd86b35edde2f9de7e64d2b1ce2.jpg', 'ABOUT US', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed. Aenean id ante blandit, mattis lacus ac, placerat elit. Vestibulum purus nisl, aliquam ut velit sed, fermentum bibendum ipsum. Vivamus sagittis mi ac erat fermentum, sed molestie tellus tincidunt. Curabitur mauris nisi, molestie viverra semper eget, elementum et odio. Etiam enim massa, fringilla eu malesuada in, volutpat eget sapien. Nunc aliquam diam in ex facilisis, non feugiat tellus tristique. Integer quis lorem at justo mollis dictum. Aenean nec nibh eget arcu faucibus dictum ac sit amet augue. Aliquam quis rhoncus ex. In euismod felis mauris, vel euismod risus ornare sit amet. Nunc iaculis nec dolor vel eleifend. Sed quis felis at enim faucibus commodo. Donec quis condimentum velit, sit amet luctus leo. Curabitur a volutpat lorem. Duis ut leo quis erat pellentesque tincidunt. Ut eu enim eu ante faucibus tincidunt. Maecenas lorem purus, cursus in massa nec, convallis porta velit. Etiam aliquet tortor sed fermentum tempor. Maecenas quis ornare lacus, eu maximus purus. Mauris et pellentesque tellus, sed ullamcorper ipsum. Sed non volutpat risus. Donec sit amet sem vitae purus mollis sodales. Suspendisse ut ipsum sed lorem feugiat congue sed non tortor. Mauris laoreet lorem sed varius placerat. Nullam tincidunt neque vitae eros ullamcorper, laoreet finibus erat convallis. Vestibulum vehicula turpis dui, vitae ultrices ante fermentum in. Sed laoreet pharetra pretium. In hac habitasse platea dictumst. Morbi a bibendum velit. Phasellus luctus dignissim quam, et elementum mi aliquam sed. In non tortor nec libero porta egestas. Fusce id dictum augue, non condimentum eros. In in mi arcu. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam euismod dictum justo vel condimentum. Donec leo mauris, ultrices ac risus nec, efficitur finibus eros. Ut ut blandit ex, vel porta nulla. Integer ut dapibus lectus. Duis sollicitudin metus ipsum, vitae euismod nisl sagittis et.', 1, 1, 5, '2017-10-28'),
(35, 'about', 'assets_web/images/icon_image/2017-01-13/g.jpg', 'Our Vision & Mission ', '\r\n\r\n\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\nAenean id ante blandit, mattis lacus ac, placerat elit. Vestibulum purus nisl, aliquam ut velit sed, fermentum bibendum ipsum. Vivamus sagittis mi ac erat fermentum, sed molestie tellus tincidunt. Curabitur mauris nisi, molestie viverra semper eget, elementum et odio. Etiam enim massa, fringilla eu malesuada in, volutpat eget sapien. Nunc aliquam diam in ex facilisis, non feugiat tellus tristique. Integer quis lorem at justo mollis dictum. Aenean nec nibh eget arcu faucibus dictum ac sit amet augue. Aliquam quis rhoncus ex. In euismod felis mauris, vel euismod risus ornare sit amet. Nunc iaculis nec dolor vel eleifend. Sed quis felis at enim faucibus commodo. Donec quis condimentum velit, sit amet luctus leo. Curabitur a volutpat lorem. Duis ut leo quis erat pellentesque tincidunt.\r\nUt eu enim eu ante faucibus tincidunt. Maecenas lorem purus, cursus in massa nec, convallis porta velit. Etiam aliquet tortor sed fermentum tempor. Maecenas quis ornare lacus, eu maximus purus. Mauris et pellentesque tellus, sed ullamcorper ipsum. Sed non volutpat risus. Donec sit amet sem vitae purus mollis sodales. Suspendisse ut ipsum sed lorem feugiat congue sed non tortor. Mauris laoreet lorem sed varius placerat. Nullam tincidunt neque vitae eros ullamcorper, laoreet finibus erat convallis. Vestibulum vehicula turpis dui, vitae ultrices ante fermentum in. Sed laoreet pharetra pretium. In hac habitasse platea dictumst. Morbi a bibendum velit.\r\nPhasellus luctus dignissim quam, et elementum mi aliquam sed. In non tortor nec libero porta egestas. Fusce id dictum augue, non condimentum eros. In in mi arcu. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam euismod dictum justo vel condimentum. Donec leo mauris, ultrices ac risus nec, efficitur finibus eros. Ut ut blandit ex, vel porta nulla. Integer ut dapibus lectus. Duis sollicitudin metus ipsum, vitae euismod nisl sagittis et.\r\n\r\n\r\n', 2, 1, 4, '2017-01-13'),
(36, 'appointment', 'assets_web/images/icon_image/2017-01-13/6.png', 'Emergency Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 1, 1, 0, '2017-01-13'),
(37, 'appointment', 'assets_web/images/icon_image/2017-01-13/5.png', 'Test Appointment', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 2, 1, 0, '2017-01-13'),
(38, 'appointment', 'assets_web/images/icon_image/2017-01-13/N1.png', 'Neurology Surgery ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 3, 1, 0, '2017-02-20'),
(39, 'appointment', 'assets_web/images/icon_image/2017-05-14/51.png', 'Oncology ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 4, 1, 0, '2017-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `ws_section`
--

CREATE TABLE `ws_section` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `featured_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_section`
--

INSERT INTO `ws_section` (`id`, `name`, `title`, `description`, `featured_image`) VALUES
(19, 'service', 'Service We Offer', 'Our department & special service ', 'assets_web/images/uploads/2016-11-02/b.jpg'),
(20, 'about', 'About Us', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature froLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,m 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.', 'assets_web/images/uploads/bcbfe125c6e449ddeefff7ff8e496285.jpg'),
(23, 'appointment', 'Why Choose Us', 'Our department & special service ', 'assets_web/images/uploads/2016-11-06/d.png'),
(26, 'doctor', 'OUR DOCTOR', 'Our department & special service ', 'assets_web/images/uploads/2016-11-05/d.png'),
(27, 'department', 'DEPARTMENT', 'Our department & special service ', ''),
(28, 'blog', 'Latest Blog', 'Latest topics of the webstie', 'assets_web/images/uploads/2016-11-05/c.png');

-- --------------------------------------------------------

--
-- Table structure for table `ws_setting`
--

CREATE TABLE `ws_setting` (
  `id` int(11) NOT NULL,
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
  `twitter_api` text DEFAULT NULL,
  `google_map` text DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `vimeo` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `dribbble` varchar(100) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_setting`
--

INSERT INTO `ws_setting` (`id`, `title`, `description`, `logo`, `favicon`, `meta_tag`, `meta_keyword`, `email`, `phone`, `address`, `copyright_text`, `twitter_api`, `google_map`, `facebook`, `twitter`, `vimeo`, `instagram`, `dribbble`, `skype`, `google_plus`, `status`) VALUES
(1, 'Pre-Natal Management', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ', '', '', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ', '               Hospital, Appointment, System, \r\nHospital Appointment,Demo, Appointment', 'demo@hospital.com', '0123456788', '123/A, Street, State-12345, Demo', '<p>&copy; 2016 <a title=\"BdTask\" href=\"http://bdtask.com\" target=\"_blank\">bdtask</a>. All rights reserved</p>\r\n<p>&nbsp;</p>', '<a class=\"twitter-timeline\" data-lang=\"en\" data-dnt=\"true\" data-link-color=\"#207FDD\" href=\"https://twitter.com/taylorswift13\">Tweets by taylorswift13</a> <script async src=\"//platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d29215.021939977993!2d90.40923229999999!3d23.75173875!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sbn!2sbd!4v1477987829881\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'http://facebook.com/', 'http://', 'http://', 'http://', 'http://', 'http://', 'http://', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ws_slider`
--

CREATE TABLE `ws_slider` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws_slider`
--

INSERT INTO `ws_slider` (`id`, `title`, `subtitle`, `description`, `image`, `position`, `status`) VALUES
(1, 'Lorem Ipsum is simply dummy text of the printing ', 'Lorem Ipsum is simply dummy text of the printing ', '<p>Lorem Ipsum is simply dummy text of the printingLorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing</p>', 'assets_web/images/slider/2016-11-03/a2.jpg', 3, 1),
(2, 'Welcome to', 'Demo Hospital', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting</p>', 'assets_web/images/slider/2017-01-16/d1.jpg', 1, 1),
(3, 'Second Slide ', 'Welcome back - Second slide', '<p><strong>Lorem Ipsum</strong></p>\r\n<hr />\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n<ul>\r\n<li>Demo Hospital Limited</li>\r\n<li>&lt;script&gt;alert(2)&lt;/script&gt;</li>\r\n</ul>', 'assets_web/images/slider/2016-11-03/s.jpg', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acm_account`
--
ALTER TABLE `acm_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acm_invoice`
--
ALTER TABLE `acm_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acm_invoice_details`
--
ALTER TABLE `acm_invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acm_payment`
--
ALTER TABLE `acm_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alert_type`
--
ALTER TABLE `alert_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio_language`
--
ALTER TABLE `audio_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Index 3` (`bill_id`),
  ADD KEY `Index 2` (`admission_id`);

--
-- Indexes for table `bill_admission`
--
ALTER TABLE `bill_admission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Index 2` (`admission_id`);

--
-- Indexes for table `bill_advanced`
--
ALTER TABLE `bill_advanced`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ipd_bill_advanced_ipd_admission` (`admission_id`);

--
-- Indexes for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Key As Bill_ID` (`bill_id`),
  ADD KEY `Admission ID` (`admission_id`);

--
-- Indexes for table `bill_package`
--
ALTER TABLE `bill_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_service`
--
ALTER TABLE `bill_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bm_bed`
--
ALTER TABLE `bm_bed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bm_bed_assign`
--
ALTER TABLE `bm_bed_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_patient`
--
ALTER TABLE `cm_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_status`
--
ALTER TABLE `cm_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_sms_info`
--
ALTER TABLE `custom_sms_info`
  ADD PRIMARY KEY (`custom_sms_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dprt_id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_alert`
--
ALTER TABLE `emergency_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `family_planning`
--
ALTER TABLE `family_planning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ha_birth`
--
ALTER TABLE `ha_birth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ha_category`
--
ALTER TABLE `ha_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ha_death`
--
ALTER TABLE `ha_death`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ha_investigation`
--
ALTER TABLE `ha_investigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ha_medicine`
--
ALTER TABLE `ha_medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ha_operation`
--
ALTER TABLE `ha_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inc_insurance`
--
ALTER TABLE `inc_insurance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inc_limit_approval`
--
ALTER TABLE `inc_limit_approval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_setting`
--
ALTER TABLE `mail_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_detail`
--
ALTER TABLE `patient_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pr_case_study`
--
ALTER TABLE `pr_case_study`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pr_prescription`
--
ALTER TABLE `pr_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sms_delivery`
--
ALTER TABLE `sms_delivery`
  ADD PRIMARY KEY (`sms_delivery_id`);

--
-- Indexes for table `sms_gateway`
--
ALTER TABLE `sms_gateway`
  ADD PRIMARY KEY (`gateway_id`);

--
-- Indexes for table `sms_info`
--
ALTER TABLE `sms_info`
  ADD PRIMARY KEY (`sms_info_id`);

--
-- Indexes for table `sms_schedule`
--
ALTER TABLE `sms_schedule`
  ADD PRIMARY KEY (`ss_id`);

--
-- Indexes for table `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_teamplate`
--
ALTER TABLE `sms_teamplate`
  ADD PRIMARY KEY (`teamplate_id`);

--
-- Indexes for table `sms_users`
--
ALTER TABLE `sms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_devices_users1_idx` (`user_id`),
  ADD KEY `users_devices_token` (`token`);

--
-- Indexes for table `ws_comment`
--
ALTER TABLE `ws_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_item`
--
ALTER TABLE `ws_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_section`
--
ALTER TABLE `ws_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_setting`
--
ALTER TABLE `ws_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws_slider`
--
ALTER TABLE `ws_slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acm_account`
--
ALTER TABLE `acm_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `acm_invoice`
--
ALTER TABLE `acm_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `acm_invoice_details`
--
ALTER TABLE `acm_invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `acm_payment`
--
ALTER TABLE `acm_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `alert_type`
--
ALTER TABLE `alert_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `audio_language`
--
ALTER TABLE `audio_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill_admission`
--
ALTER TABLE `bill_admission`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill_advanced`
--
ALTER TABLE `bill_advanced`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_package`
--
ALTER TABLE `bill_package`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bill_service`
--
ALTER TABLE `bill_service`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bm_bed`
--
ALTER TABLE `bm_bed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bm_bed_assign`
--
ALTER TABLE `bm_bed_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cm_patient`
--
ALTER TABLE `cm_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cm_status`
--
ALTER TABLE `cm_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_sms_info`
--
ALTER TABLE `custom_sms_info`
  MODIFY `custom_sms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dprt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emergency_alert`
--
ALTER TABLE `emergency_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `enquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `family_planning`
--
ALTER TABLE `family_planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ha_birth`
--
ALTER TABLE `ha_birth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ha_category`
--
ALTER TABLE `ha_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ha_death`
--
ALTER TABLE `ha_death`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ha_investigation`
--
ALTER TABLE `ha_investigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ha_medicine`
--
ALTER TABLE `ha_medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ha_operation`
--
ALTER TABLE `ha_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inc_insurance`
--
ALTER TABLE `inc_insurance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inc_limit_approval`
--
ALTER TABLE `inc_limit_approval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT for table `mail_setting`
--
ALTER TABLE `mail_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `patient_detail`
--
ALTER TABLE `patient_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pr_case_study`
--
ALTER TABLE `pr_case_study`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pr_prescription`
--
ALTER TABLE `pr_prescription`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_delivery`
--
ALTER TABLE `sms_delivery`
  MODIFY `sms_delivery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_gateway`
--
ALTER TABLE `sms_gateway`
  MODIFY `gateway_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_info`
--
ALTER TABLE `sms_info`
  MODIFY `sms_info_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_schedule`
--
ALTER TABLE `sms_schedule`
  MODIFY `ss_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_teamplate`
--
ALTER TABLE `sms_teamplate`
  MODIFY `teamplate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_users`
--
ALTER TABLE `sms_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_comment`
--
ALTER TABLE `ws_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `ws_item`
--
ALTER TABLE `ws_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `ws_section`
--
ALTER TABLE `ws_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ws_setting`
--
ALTER TABLE `ws_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ws_slider`
--
ALTER TABLE `ws_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_ipd_bill_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `bill_advanced`
--
ALTER TABLE `bill_advanced`
  ADD CONSTRAINT `FK_ipd_bill_advanced_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD CONSTRAINT `fk_ipd_bill_details_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ipd_bill_details_ipd_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD CONSTRAINT `fk_users_devices_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
