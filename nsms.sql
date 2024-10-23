-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2024 at 03:18 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_year`
--

CREATE TABLE `academic_year` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `deleted` int(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `academic_year`
--

INSERT INTO `academic_year` (`id`, `name`, `start`, `end`, `deleted`, `created_at`, `updated_at`) VALUES
(1, '2019-2020', '2019-12-12', '2019-12-19', 0, '2019-12-12 21:33:00', '2020-04-14 20:12:09'),
(2, '2020-2021', '2020-11-12', '2021-12-12', 0, NULL, NULL),
(3, '2021-2022', '2021-01-12', '2022-12-12', 0, NULL, NULL),
(4, '2023-2024', '2023-12-12', '2024-11-12', 0, NULL, NULL),
(5, '2024-2025', '2024-10-12', '2025-10-12', 0, NULL, NULL),
(6, '2024-2025', '2024-10-12', '2025-10-12', 0, NULL, NULL),
(7, '2025-2026', '2025-10-12', '2026-11-12', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api_banner`
--

CREATE TABLE `api_banner` (
  `id` int(11) NOT NULL,
  `image_link` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_class`
--

CREATE TABLE `api_class` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_class`
--

INSERT INTO `api_class` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ថ្នាកទី ៧', '2020-08-10 17:00:00', NULL),
(2, 'ថ្នាកទី ៨', '2020-08-26 17:00:00', NULL),
(3, 'ថ្នាក់ទី ៩', '2020-08-26 17:00:00', NULL),
(4, 'ថ្នាកទី ១០', '2020-08-26 17:00:00', NULL),
(5, 'ថ្នាក់ទី ១១', '2020-08-26 17:00:00', NULL),
(6, 'ថ្នាកទី ១២', '2020-08-26 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api_feedback`
--

CREATE TABLE `api_feedback` (
  `id` int(100) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `number_phone` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_feedback`
--

INSERT INTO `api_feedback` (`id`, `name`, `number_phone`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Hello', 'Yes', 'asdasdasad', '2020-08-30 18:39:41', '2020-08-30 18:39:41'),
(2, 'Sieng Roeun', '012478569', 'Sienasdiqmasdasd', '2020-08-30 19:10:00', '2020-08-30 19:10:00'),
(3, 'ខែ', 'សាសា', 'សាាសាា', '2020-09-02 00:13:16', '2020-09-02 00:13:16'),
(4, 'Hello', '012478569', 'Good school in battambang', '2020-09-02 21:52:29', '2020-09-02 21:52:29'),
(5, '+855966561101', '+855966561101', '+855966561101', '2020-09-03 02:58:09', '2020-09-03 02:58:09'),
(6, 'Hello', 'Boy', 'Hi', '2020-09-04 01:00:15', '2020-09-04 01:00:15'),
(7, 'Hello', 'Hello', 'Hello', '2020-09-06 18:33:32', '2020-09-06 18:33:32'),
(8, 'Hello', '012 999 222', 'Teach my hand', '2020-09-06 20:31:03', '2020-09-06 20:31:03'),
(9, 'Hello', '0969872209', 'អរគុណ Dewey', '2020-09-07 01:30:15', '2020-09-07 01:30:15'),
(10, 'Hello', 'asda', 'asda', '2020-09-07 02:16:32', '2020-09-07 02:16:32'),
(11, 'សៀង រៀន', '012555888', 'សាលាចំនេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅដែលល្អសម្រាប់ខ្ញុំ', '2020-09-07 03:29:34', '2020-09-07 03:29:34'),
(12, 'Hello', '012 555 999', 'Hello IT', '2020-09-07 03:38:21', '2020-09-07 03:38:21'),
(13, 'Hello', '012478569', 'Test 1', '2020-09-07 18:47:48', '2020-09-07 18:47:48'),
(14, 'សៀង រើន', '012478569', 'សាលារៀនដែលល្អ', '2020-09-08 20:48:45', '2020-09-08 20:48:45'),
(15, 'សៀង រើន', '012478569', 'សួស្ដី', '2020-09-09 00:48:05', '2020-09-09 00:48:05'),
(16, 'hello', '012i98', '6373u3u', '2020-09-09 01:57:32', '2020-09-09 01:57:32'),
(17, 'Sieng', 'Roeun', '1231231', '2020-09-21 21:20:54', '2020-09-21 21:20:54'),
(18, 'asda', 'sd1231', 'asda', '2020-09-22 21:09:31', '2020-09-22 21:09:31'),
(19, 'Hello', 'asd', 'asdasd', '2020-09-30 00:38:48', '2020-09-30 00:38:48'),
(20, 'Sieng Roeun', '012478569', 'Slow App', '2020-11-30 00:40:30', '2020-11-30 00:40:30'),
(21, 'Sieng Roeun', '012478569', 'Good App', '2021-04-18 21:07:34', '2021-04-18 21:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `api_holiday`
--

CREATE TABLE `api_holiday` (
  `id` int(11) NOT NULL,
  `holiday_name` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `detail` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_holiday`
--

INSERT INTO `api_holiday` (`id`, `holiday_name`, `date`, `detail`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Year', '2021-01-01', 'New Year’s Day is the first day of the year, or January 1, in the Gregorian calendar.', 1, NULL, NULL),
(2, 'Victory over Genocide Day', '2021-01-07', 'Victory over Genocide Day is a public holiday in Cambodia', 1, '2020-10-01 01:58:51', '2020-10-01 01:58:51'),
(3, 'International Women Day', '2021-03-08', 'International Women Day is a public holiday in Cambodia', 1, '2020-10-01 01:58:51', '2020-10-01 01:58:51'),
(4, 'March Equinox', '2021-03-20', 'March Equinox in Cambodia (Phnom Penh)', 1, '2020-10-01 02:46:16', '2020-10-01 02:46:16'),
(5, 'Khmer New Year Day (Day 1)', '2021-04-13', 'Khmer New Year Day (Day 1) is a postponed/working day in Cambodia', 1, '2020-10-01 02:46:16', '2020-10-01 02:46:16'),
(6, 'Khmer New Year Day (Day 2)', '2021-04-14', 'Khmer New Year Day (Day 2) is a postponed/working day in Cambodia', 1, '2020-10-01 02:46:16', '2020-10-01 02:46:16'),
(7, 'Khmer New Year Day (Day 3)', '2021-04-15', 'Khmer New Year Day (Day 3) is a postponed/working day in Cambodia', 1, '2020-10-01 02:46:16', '2020-10-01 02:46:16'),
(9, 'Khmer New Year Day (Day 4)', '2021-04-16', 'Khmer New Year Day (Day 4) is a postponed/working day in Cambodia', 1, '2020-10-01 02:46:16', '2020-10-01 02:46:16'),
(10, 'Labour Day', '2021-05-01', 'May Day, or Labor Day, is a day off for workers in many countries around the world.', 1, '2020-10-01 02:46:16', '2020-10-01 02:46:16'),
(11, 'Visak Bochea Day', '2021-05-06', 'Visak Bochea Day is a public holiday in Cambodia', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(12, 'Royal Ploughing Ceremony', '2021-05-10', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(13, 'hday of His Majesty Preah Bat Samdech Preah Boromneath NORODOM SIHAMONI, King of Cambodia', '2021-05-14', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(14, 'Birthday of Her Majesty the Queen-Mother NORODOM MONINEATH SIHANOUK of Cambodia', '2021-06-18', 'Birthday of Her Majesty the Queen-Mother NORODOM MONINEATH SIHANOUK of Cambodia', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(15, 'Pchum Ben Day', '2021-09-16', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(16, 'Pchum Ben Day', '2021-09-17', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(17, 'Pchum Ben Day', '2021-09-18', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(18, 'Constitution Day', '2021-09-24', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(19, 'Mourning Day of the Late King-Father NORODOM SIHANOUK of Cambodia', '2021-10-15', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(20, '	Coronation Day of His Majesty Preah Bat Samdech Preah Boromneath NORODOM SIHAMONI, King of Cambodia', '2021-10-29', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(21, 'Water Festival', '2021-10-30', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(22, 'Water Festival', '2021-10-31', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(23, 'Water Festival', '2021-11-01', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31'),
(24, 'National Independence Day', '2021-11-09', '', 1, '2020-10-01 03:12:31', '2020-10-01 03:12:31');

-- --------------------------------------------------------

--
-- Table structure for table `api_promotion`
--

CREATE TABLE `api_promotion` (
  `id` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `post_date` date NOT NULL,
  `status` int(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_promotion`
--

INSERT INTO `api_promotion` (`id`, `id_cat`, `title`, `description`, `image`, `post_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'A5PWInoA0IKLPsOPI62yLHMh1Tfgl53V3JNm1wkV.jpeg', '2020-09-03', 0, '2020-09-02 21:52:59', '2020-09-02 21:52:59'),
(2, 1, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'k94CrCrJJWkFgJwLxhBoUq0u6RFZL6euKHTtQ6n5.jpeg', '2020-09-03', 0, '2020-09-02 21:53:13', '2020-09-02 21:53:13'),
(3, 1, 'Cambodian-American-Chinese Curriculum.', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។ The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'iDFx9bwJA52mfLFGwHtr2yPy5sF9mKYQUOaIIqmd.jpeg', '2020-09-03', 0, '2020-09-02 21:59:57', '2020-09-02 21:59:57'),
(4, 2, 'កម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'o25g9ozirgQRRQJjKtDdDYfOQRMh2LEeEo00tgss.jpeg', '2020-09-03', 0, '2020-09-02 22:01:46', '2020-09-02 22:01:46'),
(5, 1, 'The only true International School in', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\nThe only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'djk7J9Yefe7Xito8gHMOl6gfKiDGVQyUVY7GTerL.jpeg', '2020-09-03', 0, '2020-09-02 22:02:26', '2020-09-02 22:02:26'),
(6, 1, 'Promotion សម្រាប់ខេត្តបាត់ដំបង', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'ZgVanincjkIQbwAGLHCesGvwybEQFYclccYS3Zfz.jpeg', '2020-09-03', 0, '2020-09-02 22:03:21', '2020-09-02 22:03:21'),
(7, 1, 'ពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\nThe only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\nThe only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\nThe only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\nThe only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'pz43rI7j35UXBCUBzTu4zSjCo3BA0JnXsquVHoO5.jpeg', '2020-09-03', 0, '2020-09-03 01:21:15', '2020-09-03 01:21:15'),
(8, 2, 'ឱកាសអាហារូបករណ៍ពិសេសរហូតដល់ ៣០%', 'ឱកាសអាហារូបករណ៍ពិសេសរហូតដល់ ៣០% សម្រាប់ការចុះឈ្មោះចាប់ពីថ្ងៃនេះរហូតដល់ថ្ងៃទី១៥ ខែកញ្ញា ឆ្នាំ២០២០។ សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី បានត្រៀមខ្លួនបើកសាលាឡើងវិញក្នុងដំណាក់កាលទី២ ស្របតាមគោលការណ៍ប្រតិបត្តិស្តង់ដាររបស់ក្រសួងអប់រំ យុវជន និងកីឡា រួចជាស្រេច រងចាំតែការអនុញ្ញាតតែប៉ុណ្ណោះ។ ការសិក្សាតាមរយៈប្រព័ន្ធអនឡាញចូលរៀននៅថ្ងៃទី១ ខែកញ្ញា ឆ្នាំ២០២០។\r\n\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់នៅក្នុងភូមិភាគពាយព្យ នៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សាចំណេះទូទៅខ្មែរ និងចំណេះទូទៅអាមេរិកាំង ពេញលេញ និងពិតប្រាកដ ចាប់ពីកម្រិតមត្តេយ្យ រហូតដល់ ថ្នាក់ទី១២។\r\nThe only true International school in western Cambodia offers a full and unique K-12 Cambodian-American Curriculum.', 'Wl8FUVb31FjXIuoggN3unLtlkoWhEUU5gfjiiAFJ.jpeg', '2020-09-03', 0, '2020-09-03 01:24:39', '2020-09-03 01:24:39'),
(9, 2, 'ចាប់ពីកម្រិតមត្តេយ្យ រហូតដល់ ថ្នាក់ទី១២', 'ឱកាសអាហារូបករណ៍ពិសេសរហូតដល់ ៣០% សម្រាប់ការចុះឈ្មោះចាប់ពីថ្ងៃនេះរហូតដល់ថ្ងៃទី១៥ ខែកញ្ញា ឆ្នាំ២០២០។ សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី បានត្រៀមខ្លួនបើកសាលាឡើងវិញក្នុងដំណាក់កាលទី២ ស្របតាមគោលការណ៍ប្រតិបត្តិស្តង់ដាររបស់ក្រសួងអប់រំ យុវជន និងកីឡា រួចជាស្រេច រងចាំតែការអនុញ្ញាតតែប៉ុណ្ណោះ។ ការសិក្សាតាមរយៈប្រព័ន្ធអនឡាញចូលរៀននៅថ្ងៃទី១ ខែកញ្ញា ឆ្នាំ២០២០។\r\n\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី ជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់នៅក្នុងភូមិភាគពាយព្យ នៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សាចំណេះទូទៅខ្មែរ និងចំណេះទូទៅអាមេរិកាំង ពេញលេញ និងពិតប្រាកដ ចាប់ពីកម្រិតមត្តេយ្យ រហូតដល់ ថ្នាក់ទី១២។\r\nThe only true International school in western Cambodia offers a full and unique K-12 Cambodian-American Curriculum.', '1PHm31mQ4C7Stakx0Dpa8mHbch2AiOGqlZgloVlw.jpeg', '2020-09-03', 0, '2020-09-03 02:05:34', '2020-09-03 02:05:34'),
(10, 3, 'ចាប់ពីកម្រិតមត្តេយ្យ រហូតដល់ ថ្នាក់ទី១២', 'ចាប់ពីកម្រិតមត្តេយ្យ រហូតដល់ ថ្នាក់ទី១២', 'lcEFPUkjNbJUckWskpKQxpO84x3PeZ05AouwI3CU.jpeg', '2020-09-03', 0, '2020-09-03 02:06:31', '2020-09-03 02:06:31'),
(11, 3, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\nThe only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'FYV5osZNYsMNmMrxyWIykUIB6VuDJRZB3FGVETCX.jpeg', '2020-09-03', 0, '2020-09-03 02:08:03', '2020-09-03 02:08:03'),
(18, 3, 'Tes', 'Test', 'djk7J9Yefe7Xito8gHMOl6gfKiDGVQyUVY7GTerL.jpeg', '2020-09-04', 0, '2020-09-03 17:00:00', '2020-08-31 17:00:00'),
(19, 3, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'Go65VE06qU19c7W03RJJukVelEpTafC9LfE7I2qV.jpeg', '2020-09-04', 0, '2020-09-03 20:20:10', '2020-09-03 20:20:10'),
(20, 3, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'V80O9i9f23wUpjDTam9nXveqmW9jXzIksU8QSS9Q.jpeg', '2020-09-04', 0, '2020-09-03 20:21:39', '2020-09-03 20:21:39'),
(21, 3, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'eOniQPwkJ7cE72gJZndBZ6KxHNQMJSnU2kZ4dziE.jpeg', '2020-09-04', 0, '2020-09-03 20:22:08', '2020-09-03 20:22:08'),
(22, 3, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'Hznq8JbI2XzkorpZe0Y7qhSkR1uHKBiK4dYjETcW.jpeg', '2020-09-04', 0, '2020-09-03 20:22:38', '2020-09-03 20:22:38'),
(23, 2, 'សូមស្វាគមន៍ឆ្នាំសិក្សាថ្មី', 'សូមស្វាគមន៍ឆ្នាំសិក្សាថ្មី', 'ny8A0oqkWMH4MXlN6hGq2wsPYtFDQKPx86URaABF.jpeg', '2020-09-04', 0, '2020-09-03 20:51:07', '2020-09-03 20:51:07'),
(24, 1, 'ផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'OPFKEVF8e62qmZg2n8hH4DxChd2unIl1WPlLSlB0.jpeg', '2020-09-07', 0, '2020-09-06 20:51:07', '2020-09-06 20:51:07'),
(25, 1, 'កម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'HbCj4vg0YqzXgqnVzu3HjN5GOwrt95Ty2H0CnMDw.jpeg', '2020-09-07', 0, '2020-09-06 20:55:10', '2020-09-06 20:55:10'),
(26, 1, 'កម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២', 'កម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២', 'i8B0K5l1e1Pp5rvBXILSfKVFAFe7FCjtF0z01upk.jpeg', '2020-09-07', 0, '2020-09-06 20:56:12', '2020-09-06 20:56:12'),
(27, 1, 'The only true International School in Western Cambodia', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'mOWw3TbVHLvP5jRll9BrQfZLMaWSZOoRhvsKUDr8.jpeg', '2020-09-07', 0, '2020-09-06 20:57:54', '2020-09-06 20:57:54'),
(28, 3, 'The only true International School in Western Cambodia', 'The only true International School in Western Cambodia', '0GbkUdcvy3EUaBSxjikS774wbGAHbHKhsaHkLWJN.jpeg', '2020-09-07', 0, '2020-09-06 20:58:36', '2020-09-06 20:58:36'),
(29, 3, 'The only true International School in Western Cambodia', 'The only true International School in Western Cambodia', 'PdsetosrWWDtTCgDsCgpnqaN9gfK5k0kG2216CZc.jpeg', '2020-09-07', 0, '2020-09-06 20:59:18', '2020-09-06 20:59:18'),
(30, 1, 'Test', 'ad', 'B251CFfi03uh5FDKjYsFtsw5KW2JYVl6sDQ7osS0.jpeg', '2020-09-07', 0, '2020-09-06 21:00:54', '2020-09-06 21:00:54'),
(31, 3, 'Hello', 'asda', 'LjVNh8FrDgzuzUrpGELcW86ybfS5HnApWKkExpqt.jpeg', '2020-09-07', 0, '2020-09-06 21:02:25', '2020-09-06 21:02:25'),
(32, 2, 'កម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២', 'កម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២', 'hyQvDsa0AwDYlMD6FVefcuhxAq3DxpvlSIBgjL2G.jpeg', '2020-09-07', 0, '2020-09-06 21:06:02', '2020-09-06 21:06:02'),
(33, 3, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'kXgqKjAnTDUzsghS5Pj9fcK4LGnCXMis1uQ3hNZD.jpeg', '2020-09-07', 0, '2020-09-06 21:08:39', '2020-09-06 21:08:39'),
(34, 2, 'ឧកាសពិសេសៗសម្រាប់ប្អូនៗ', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'C5CaJj7mDAtSciRjoO29nZLME3zirTxBGmqoXH3e.jpeg', '2020-09-07', 0, '2020-09-07 01:02:20', '2020-09-07 01:02:20'),
(35, 1, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'dVUgTQNfQyrQT099jQMA89PHWQkawh5l4UpEMKVd.jpeg', '2020-09-07', 0, '2020-09-07 01:03:45', '2020-09-07 01:03:45'),
(36, 2, 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី', 'CpjRF6KB05hYdah6pyLGzJqOalGDHw4UojWSFqPA.jpeg', '2020-09-07', 0, '2020-09-07 01:10:31', '2020-09-07 01:10:31'),
(37, 1, 'សូមស្វាគមន៍ប្អូនៗ', 'សូមស្វាគមន៍ប្អូនៗ', '4o7MYP51AqehgJQPPiMv4UfMI3xokUPZSY8UED3q.jpeg', '2020-09-07', 0, '2020-09-07 03:01:49', '2020-09-07 03:01:49'),
(38, 1, 'Cambodian-American-Chinese Curriculum.', 'សាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.\r\nសាលាចំណេះទូទៅអន្តរជាតិ ឌូវី គឺជាសាលាចំណេះទូទៅអន្តរជាតិតែមួយគត់ក្នុងភូមិភាគពាយព្យនៃប្រទេសកម្ពុជា ដែលផ្តល់ជូនកម្មវិធីសិក្សា ខ្មែរអាមេរិកាំង ចិន ពេញលេញ និងពិតប្រាកដចាប់ពីកម្រិតមត្តេយ្យសិក្សារហូតដល់ថ្នាក់ទី១២។\r\n        The only true International School in Western Cambodia offers the full and unique K-12 Cambodian-American-Chinese Curriculum.', 'ElezHIrChqv7HZOY2q7CspMQKb81z53c8u4J9DSj.jpeg', '2020-09-09', 0, '2020-09-08 21:49:51', '2020-09-08 21:49:51'),
(39, 1, 'Dewey Internaltional School Discount 20%', 'Discount 40%', 'lSTzBFV3ygmsDlwQVW2emIszgiSFT9Mhhuf1zhKm.jpeg', '2020-09-23', 0, '2020-09-23 04:03:00', '2020-09-23 04:03:00'),
(40, 1, 'សាលាអន្តរជាតិ Dewey', 'សួស្ដី', 'DdkDD9ZFsvkaciaH03awipmgOG2N1j4WG8m339kD.jpeg', '2020-09-30', 0, '2020-09-30 02:15:40', '2020-09-30 02:15:40'),
(41, 1, 'Promotion Covid 19', 'Hello', 'uUp0mY4CDELQrWa6TX9KNilHXrfpraOCK3eSmwjL.jpeg', '2020-12-01', 0, '2020-12-01 03:21:05', '2020-12-01 03:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `api_province`
--

CREATE TABLE `api_province` (
  `id` int(11) NOT NULL,
  `province_name` varchar(250) NOT NULL,
  `status` int(2) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_province`
--

INSERT INTO `api_province` (`id`, `province_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'All Province', 0, '2020-08-12 04:35:22', '2020-08-12 04:35:22'),
(2, 'BattamBang', 0, '2020-08-12 04:35:22', '2020-08-12 04:35:22'),
(3, 'Banteay Meanchey', 0, '2020-08-12 04:35:22', '2020-08-12 04:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `api_subject`
--

CREATE TABLE `api_subject` (
  `id` int(11) NOT NULL,
  `subject_title` varchar(250) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `code_color` varchar(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_subject`
--

INSERT INTO `api_subject` (`id`, `subject_title`, `icon`, `code_color`, `created_at`, `updated_at`) VALUES
(1, 'ប្រវិត្តវិទ្យា', 'assets/icon/story.png', '#E7B2B5', NULL, NULL),
(2, 'ភូមិវិទ្យា', 'assets/icon/geo.png', '#DEB2B5', NULL, NULL),
(3, 'គីមីវិទ្យា', 'assets/icon/chemistry.png', '#94CFD6', '2020-08-03 10:08:35', '2020-08-03 10:08:35'),
(4, 'ភាសាខ្មែរ', 'assets/icon/khmer.png', '#B5C7DE', '2020-08-07 08:50:58', '2020-08-07 08:50:58'),
(5, 'ជីវ៉ៈវិទ្យា', 'assets/icon/biology.png', '#EFD78C', NULL, NULL),
(6, 'រូបវិទ្យា', 'assets/icon/phy.png', '#EFA694', NULL, NULL),
(7, 'គណិតវិទ្យា', 'assets/icon/math.png', '#BDE3DE', '2020-08-31 08:07:14', '2020-08-31 08:07:14'),
(8, 'សីលធម៌', 'assets/icon/sel.png', '#94CFD6', '2020-08-31 09:08:09', '2020-08-31 09:08:09'),
(9, 'ផែនដីវិទ្យា', 'assets/icon/geo.png', '#C6E3C6', '2020-09-01 03:47:32', '2020-09-01 03:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `api_youtube`
--

CREATE TABLE `api_youtube` (
  `id` int(11) NOT NULL,
  `type_class` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `url` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_youtube`
--

INSERT INTO `api_youtube` (`id`, `type_class`, `subject_id`, `title`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'ជីវៈវិទ្យា ថ្នាក់ទី័៧', 'https://www.youtube.com/watch?v=ohR0Qm0OKUQ&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA', '2020-08-31 01:06:23', '2020-08-31 01:06:23'),
(2, 1, 4, 'ភាសាខ្មែរ ថ្នាក់ទី៧', 'https://www.youtube.com/watch?v=e6bybHpuswM&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=2', '2020-08-31 01:06:23', '2020-08-31 01:06:23'),
(3, 1, 6, 'មេរៀនទី៤ រេសុីស្តង់អគ្គិសនី (រូបវិទ្យាថ្នាក់ទី៧)', 'https://www.youtube.com/watch?v=Pqw-CqlqcEg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=4', '2020-08-31 01:06:23', '2020-08-31 01:06:23'),
(4, 1, 7, 'គណិតវិទ្យា ថ្នាក់ទី៧', 'https://www.youtube.com/watch?v=fJk0t0bIRtI&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=3', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(5, 1, 5, 'មេរៀនទី២ ផ្នែកផ្សេងៗនៃប្រដាប់រំលាយអាហារ', 'https://www.youtube.com/watch?v=u4aDFlNxmJA&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=5', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(6, 1, 4, 'អំណាន រឿងមិត្តសានិត', 'https://www.youtube.com/watch?v=NUEDhR9ld9c&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=6', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(7, 1, 6, 'មេរៀនទី៤ រេសុីស្តង់អគ្គិសនី', 'https://www.youtube.com/watch?v=olGx6Eco500&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=7', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(8, 1, 7, 'មេរៀនទី១ សមីការដឺក្រទី១មានមួយអញ្ញាត', 'https://www.youtube.com/watch?v=H3vdNgd8V60&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=8', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(9, 1, 6, 'មេរៀនទី៤ រេសុីស្តង់អគ្គិសនី', 'https://www.youtube.com/watch?v=TtcgxSiQtLc&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=9', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(10, 1, 4, 'មេរៀនទី៩ សេចក្តីសង្ឃឹម', 'https://www.youtube.com/watch?v=A1Y2QQjLGqU&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=10', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(11, 1, 4, 'វេយ្យាករណ៍ អំពីល្បះទោល (តចប់)', 'https://www.youtube.com/watch?v=frnx2IGkiyE&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=11', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(12, 1, 7, 'កំណែលំហាត់', 'https://www.youtube.com/watch?v=Xvq6OaFu8mg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=12', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(13, 1, 4, 'វេយ្យាករណ៍ អំពីល្បះទោល', 'https://www.youtube.com/watch?v=nu4GQpuRU_0&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=13', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(14, 1, 3, 'កំណែកិច្ចការផ្ទះ', 'https://www.youtube.com/watch?v=LQN8Y8mNJCs&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=14', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(15, 1, 7, 'មេរៀនទី១១ ផលធៀបនិងសមាមាត្', 'https://www.youtube.com/watch?v=Wm-8hJlOlzQ&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=15', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(16, 1, 7, 'កំណែប្រតិបត្តិ គណិតវិទ្យាថ្នាក់ទី៧ មេរៀនវិសមភាព', 'https://www.youtube.com/watch?v=D3kcdBsACqQ&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=16', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(17, 1, 4, 'វេយ្យាករណ៍ ភាសាខ្មែរថ្នាក់ទី៧', 'https://www.youtube.com/watch?v=khYRxOPxVIQ&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=17', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(18, 1, 1, 'មេរៀនទី២ ប្រទេសឥណ្ឌាបុរាណ', 'https://www.youtube.com/watch?v=hUa-MHmmOLk&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=18', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(19, 1, 5, 'មេរៀនទី២ ផ្នែកផ្សេងៗនៃប្រដាប់រំលាយអាហារ (ត)', 'https://www.youtube.com/watch?v=fDRvADPHrQg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=19', '2020-08-31 01:13:58', '2020-08-31 01:13:58'),
(20, 1, 3, 'កំណែលំហាត់កិច្ចការផ្ទះ', 'https://www.youtube.com/watch?v=AZ7loGsVB2s&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=20', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(21, 1, 6, 'មេរៀនទី៥ ប្រភពចរន្តអគ្គិសនី', 'https://www.youtube.com/watch?v=-EzvjOfBmpY&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=21', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(22, 1, 4, 'អំណាន ប្រវត្តិរបាំក្ងោក', 'https://www.youtube.com/watch?v=VBYJOLBzfgg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=22', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(23, 1, 7, 'មេរៀនទី១៥ រូបធរណីមាត្រមានវិមាត្រពីរ', 'https://www.youtube.com/watch?v=cvYF_KdXa0M&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=23', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(24, 1, 3, 'កំណែកិច្ចការផ្ទះទី១០', 'https://www.youtube.com/watch?v=WQJDmsOB1zo&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=24', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(25, 1, 7, 'មេរៀនទី១៥ រូបធរណីមាត្រមានវិមាត្រពីរ', 'https://www.youtube.com/watch?v=8Z6XYmU-q7I&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=25', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(26, 1, 7, 'មេរៀនទី១៥ រូបធរណីមាត្រមានវិមាត្រពីរ (ត)', 'https://www.youtube.com/watch?v=IMI2Ularp7k&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=26', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(27, 1, 3, 'កំណែកិច្ចការផ្ទះ', 'https://www.youtube.com/watch?v=H7u4SQkf6Eo&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=28', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(28, 1, 1, 'មេរៀនទី២ ប្រទេសឥណ្ឌាបុរាណ (តចប់)', 'https://www.youtube.com/watch?v=Lcf29f4pMqI&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=29', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(29, 1, 5, 'កំណែកិច្ចការផ្ទះ (ទំព័រ213)', 'https://www.youtube.com/watch?v=pbO25xEhXaA&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=30', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(30, 1, 4, 'សំណេររៀបរាប់លំនាំនៃការលេងល្បែងប្រជាប្រិយ', 'https://www.youtube.com/watch?v=bH0OFmKOqqA&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=31', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(31, 1, 6, 'មេរៀនទី៦ សៀគ្វីអគ្គិសនី', 'https://www.youtube.com/watch?v=HIuAxnm1u68&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=32', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(32, 1, 4, 'មេរៀនទី១០ បំណងប្រាថ្នាដើម្បីជោគជ័យ', 'https://www.youtube.com/watch?v=zC494HUhLxs&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=33', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(33, 1, 7, 'មេរៀនទី១១ ផលធៀបនិងសមាមាត្រ (ត)', 'https://www.youtube.com/watch?v=dSRxQ-0g1lg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=34', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(34, 1, 3, 'ជំពូកទី៣ មេរៀនទី១ ខ្យល់', 'https://www.youtube.com/watch?v=IdxJU1eTOe4&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=35', '2020-08-31 01:20:01', '2020-08-31 01:20:01'),
(35, 1, 7, 'មេរៀនទី១១ ផលធៀបនិងសមាមាត្រ (ត)', 'https://www.youtube.com/watch?v=_HGl4jR3_Ic&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=36', '2020-08-31 01:20:02', '2020-08-31 01:20:02'),
(36, 1, 5, 'មេរៀនទី៣ ការរំលាយអាហារ (ត)', 'https://www.youtube.com/watch?v=3PMrTzC9NUk&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=37', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(37, 1, 4, 'អំណាន ប្រវត្តិទាមទារឯករាជ្យជាតិខ្មែរ', 'https://www.youtube.com/watch?v=oNiWZk_fxu8&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=38', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(38, 1, 6, 'សំណួរ និងលំហាត់ (ជំពូកទី៣ អគ្គិសនី)', 'https://www.youtube.com/watch?v=tW8rqohRO5A&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=39', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(39, 1, 7, 'មេរៀនទី១១ ផលធៀបនិងសមាមាត្រ (ត)', 'https://www.youtube.com/watch?v=uQVtpOTtOH4&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=40', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(40, 1, 4, 'អំណាន រឿងត្រីចំពុះដាវ', 'https://www.youtube.com/watch?v=MaOZFtY70Ck&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=41', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(41, 1, 3, 'មេរៀនទី២ ធាតុកង្វក់ខ្យល់', 'https://www.youtube.com/watch?v=TYH_RVpBdQg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=42', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(42, 1, 7, 'កំណែលំហាត់សមាមាត្', 'https://www.youtube.com/watch?v=wQeXiXSYdzo&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=43', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(43, 1, 5, 'មេរៀនទី៣ ការរំលាយអាហារ (ត)', 'https://www.youtube.com/watch?v=f54YJSFZF-U&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=44', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(44, 1, 4, 'អំណាន គោលបំណង', 'https://www.youtube.com/watch?v=aLJ3EILL1ZQ&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=45', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(45, 1, 6, 'ជំពូកទី៤ មេរៀនទី១ សម្ពាធរបស់អង្គធាតុរឹង', 'https://www.youtube.com/watch?v=q5kOS2EMovM&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=46', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(46, 1, 1, 'មេរៀនទី៣ រដ្ឋជ្វា (ត)', 'https://www.youtube.com/watch?v=JOy-HaWAo8U&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=47', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(47, 1, 3, 'កំណែលំហាត់', 'https://www.youtube.com/watch?v=ok5pDrVhfyE&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=48', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(48, 1, 1, 'មេរៀនទី៣ រដ្ឋជ្វា (តចប់)', 'https://www.youtube.com/watch?v=x7Qju1zsmKE&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=49', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(49, 1, 4, 'សំណេរឿងនិទានដែលមានកាលអាកាសច្រើន', 'https://www.youtube.com/watch?v=sulK64pDljs&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=50', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(50, 1, 6, 'មេរៀនទី៤ សម្ពាធបរិយាកាស', 'https://www.youtube.com/watch?v=4fKRiThR9dk&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=51', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(51, 1, 1, 'រំលឹកមេរៀន', 'https://www.youtube.com/watch?v=m3XTB_uGDRA&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=52', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(52, 1, 5, 'មេរៀនទី៤ ជម្ងឺនិងអនាម័យប្រដាប់រំលាយអាហារ', 'https://www.youtube.com/watch?v=o6XyIqgxeqw&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=53', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(53, 1, 7, 'កំណែលំហាត់ត្រៀមប្រលងឆមាសលើកទី២ (ត)', 'https://www.youtube.com/watch?v=69Vq-YqntUQ&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=54', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(54, 1, 3, 'កំណែលំហាត់ទី៧', 'https://www.youtube.com/watch?v=qAmjvp-BOhI&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=55', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(55, 1, 7, 'កំណែលំហាត់ត្រៀមប្រលងឆមាសលើកទី២', 'https://www.youtube.com/watch?v=EB6ThF-41yI&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=56', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(56, 1, 4, 'វេយ្យាករណ៍ អំពីថ្នាក់ពាក្យ (ត)', 'https://www.youtube.com/watch?v=lCxrWyAk_bE&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=57', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(57, 1, 6, 'មេរៀនទី៣ រង្វាស់សម្ពាធក្នុងអង្គធាតុរាវ', 'https://www.youtube.com/watch?v=cmhWB3hyG3Q&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=58', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(58, 1, 4, 'វេយ្យាករណ៍ អំពីថ្នាក់ពាក្យ (ត)', 'https://www.youtube.com/watch?v=n7d7tawSd_k&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=59', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(59, 1, 1, 'មេរៀនទី៤ រដ្ឋមន (តចប់)', 'https://www.youtube.com/watch?v=mlaq_S0mEjA&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=60', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(60, 1, 5, 'មេរៀនទី២ ការរំលាយអាហារ (តចប់)', 'https://www.youtube.com/watch?v=jh2LtnFkgo8&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=61', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(61, 1, 3, 'មេរៀនទី១៦ បរិមាត្រនិងផ្ទៃក្រលាពហុកោណ (ត)', 'https://www.youtube.com/watch?v=-3Kg9Kr6eHM&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=62', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(62, 1, 3, 'កំណែលំហាត់ទី៥', 'https://www.youtube.com/watch?v=Sl5i8GnfJ0M&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=63', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(63, 1, 7, 'មេរៀនទី១៦ បរិមាត្រនិងផ្ទៃក្រលាពហុកោណ', 'https://www.youtube.com/watch?v=YY3Bl3hIp8c&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=64', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(64, 1, 4, 'វេយ្យាករណ៍ អំពីថ្នាក់ពាក្យ', 'https://www.youtube.com/watch?v=pn0beJ4wrno&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=65', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(65, 1, 6, 'មេរៀនទី២ ការបញ្ជូនសម្ពាធក្នុងសន្ទនីយ', 'https://www.youtube.com/watch?v=OJ8CKPGQ5zo&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=66', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(66, 1, 4, 'សំណេរតែងសេចក្តី', 'https://www.youtube.com/watch?v=4MUEEQjfuYg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=67', '2020-08-31 01:32:10', '2020-08-31 01:32:10'),
(67, 1, 4, 'វេយ្យាករណ៍ អំពីថ្នាក់ពាក្យ (ត)', 'https://www.youtube.com/watch?v=sxbNpS_dSXg&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=68', '2020-08-31 01:32:11', '2020-08-31 01:32:11'),
(68, 1, 1, 'រំលឹកមេរៀនចាស់', 'https://www.youtube.com/watch?v=rO9vncvt7y8&list=PLoYVhXU9mJXCfGyws4edPZE6oKaQPCYCA&index=69', '2020-08-31 01:32:11', '2020-08-31 01:32:11'),
(69, 2, 6, 'មេរៀន រូបវិទ្យាទី 8', 'https://www.youtube.com/watch?v=2asuwIaUcL8&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(70, 2, 7, 'មេរៀន គណិតវិទ្យាទី8', 'https://www.youtube.com/watch?v=C-CJ-SXGXNM&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=2', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(71, 2, 7, 'មេរៀន គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=UULBnJfFmj8&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=3', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(72, 2, 6, 'មេរៀនរូបវិទ្យា ថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=pTCS47_xQyA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=4', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(73, 2, 7, 'គណិតវិទ្យា ថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=m_eiuC1mPeE&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=5', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(74, 2, 4, 'ភាសាខ្មែរ ថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=up__uizVOHw&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=6', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(75, 2, 6, 'រូបវិទ្យា ថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=IpMI3Is8O28&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=7', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(76, 2, 5, 'មេរៀនទី៤​ ប្រព័ន្ធដំណឹកនាំ', 'https://www.youtube.com/watch?v=52QvA6KgzAY&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=8', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(77, 2, 7, 'ការដាក់កន្សោមជាផលគុណកត្តា', 'https://www.youtube.com/watch?v=s0DrcdmiZfM&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=9', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(78, 2, 4, 'អំណាន ការជក់បារីនាំឲ្យខូចសុខភាព', 'https://www.youtube.com/watch?v=0oO1lXEnJVI&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=10', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(79, 2, 7, 'លំហាត់ធរណីមាត្រ (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=f8Zyu3nzxgc&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=11', '2020-08-31 01:49:26', '2020-08-31 01:49:26'),
(80, 2, 4, 'អំណាន ការប្រគល់ការងារឲ្យទទួលខុសត្រូវ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=YI0wVmND07w&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=12', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(81, 2, 6, 'ដោះស្រាយលំហាត់ (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=pw_2d_T3mxE&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=13', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(82, 2, 4, 'បំនិន បម្រើបម្រាស់ភាសាក្នុងអត្តបទល្ខោនបាសាក់ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=Eoe8t7w6kfY&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=14', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(83, 2, 7, 'មេរៀនទី៦ កន្សោមសនិទាន (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=m1xfJ95cfWA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=15', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(84, 2, 4, 'រឿងថាដូនិងភ្លើងឆេះស្រូវ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=4yZxCon1gWk&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=16', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(85, 2, 6, 'មេរៀនទី២ បណ្តាញអគ្គិសនីក្នុងគេហដ្ឋាន (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=kFsTtaa4yoA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=17', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(86, 2, 4, 'មេរៀនទី៨ ការជឿជាក់ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=yfAVj5nMTeI&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=18', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(87, 2, 3, 'កំណែកិច្ចការផ្ទះ (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=0DFb7jyoNYA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=19', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(88, 2, 7, 'មេរៀនទី៦ កន្សោមសនិទាន (ត) គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=QGNvNfyu82I&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=20', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(89, 2, 4, 'អំណាន រឿងតេជោយ៉ត (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=BWwUbrg3Gyk&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=21', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(90, 2, 7, 'មេរៀនទី៦ កន្សោមសនិទាន (ត) គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=AX0VaUVy9_E&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=22', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(91, 2, 1, 'មេរៀនទី១ រដ្ឋចម្ប៉ាពីសតវត្សទី២-១៨ (ប្រវត្តិវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=vYoF6wuJ8wA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=23', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(92, 2, 3, 'កំណែលំហាត់កិច្ចការផ្ទះ (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=wKaPqRAlrFA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=24', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(93, 2, 5, 'មេរៀនទី៤ ប្រព័ន្ធដំណឹកនាំ (ត) ជីវៈវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=gNBnxrtjlhk&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=25', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(94, 2, 4, 'កំណែកិច្ចការផ្ទះ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=uz-we-69klw&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=26', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(95, 2, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=9Iq2i86ySCw&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=27', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(96, 2, 4, 'វេយ្យាករណ៍ ជំនួយកិរិយាឬកិរិយាសព្ទជំនួយ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=hnWXUYgIKbQ&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=28', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(97, 2, 7, 'មេរៀនទី៦ កន្សោមសនិទាន (ត) គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=-vSoD848kJs&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=29', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(98, 2, 7, 'មេរៀនទី៦ កន្សោមសនិទាន (ត) គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=dyYKq5eMxZo&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=30', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(99, 2, 3, 'កំណែកិច្ចការផ្ទះទី១០ (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=6Y4EhfQWUdo&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=31', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(100, 2, 5, 'មេរៀនទី៤ ប្រព័ន្ធដំណឹកនាំ (តចប់) ជីវៈវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=cxYctiV-jCk&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=32', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(101, 2, 4, 'អំណាន ពាក្យស្លោកនិងពាក្យបណ្តៅ (ភាសាខ្មែរថ្នាក់ទី៧)', 'https://www.youtube.com/watch?v=I50maTa6_yw&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=33', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(102, 2, 4, 'វេយ្យាករណ៍ ជំនួយកិរិយាឬកិរិយាសព្ទជំនួយ ភាសាខ្មែរថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=MRcYHQaCaIA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=34', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(103, 2, 7, 'មេរៀនទី៦ កន្សោមសនិទាន (តចប់) គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=XRyJ6PLpulg&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=35', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(104, 2, 3, 'កំណែកិច្ចការផ្ទះ (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=yRfP45FTa9E&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=36', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(105, 2, 7, 'មេរៀនទី៧ សមីការដឺក្រទី១មានមួយអញ្ញាត (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=GP2njO4dfhc&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=37', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(106, 2, 5, 'ជំពូកទី៥ ការថែរក្សាសុខភាព មេរៀនទី១ អាហារ (ជីវៈវិទញយាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=LU9RpoTUbJ0&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=38', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(107, 2, 1, 'មេរៀនទី១ រដ្ឋចម្ប៉ាពីសតវត្សទី២-១៨ (ត) ប្រវត្តិវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=XVsRPWyFrwo&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=39', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(108, 2, 6, 'កំណែលំហាត់អគ្គិសនី (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=T2MK6O-9juU&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=40', '2020-08-31 01:49:27', '2020-08-31 01:49:27'),
(109, 2, 4, 'អំណាន ការជឿជាក់លើខ្លួនឯង (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=li3CPAa_a4U&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=41', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(110, 2, 7, 'មេរៀនទី៩ ចម្ងាយរវាងពីរចំណុច (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=l46F9DvOaq0&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=42', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(111, 2, 7, 'កំណែលំហាត់ដោះស្រាយសមីការ (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=RAzjxUvCWSw&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=44', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(112, 2, 4, 'កំណែសំណួរកិច្ចការផ្ទះ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=gCoYace9v2I&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=47', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(113, 2, 3, 'ជំពូកទី២ មេរៀនទី១ ល្បាយ (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=PiANgFKWANc&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=48', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(114, 2, 7, 'ចំណោទសមីការ (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=7kvvVVwbAh8&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=49', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(115, 2, 5, 'មេរៀនទី១ អាហារ (តចប់) ជីវៈវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=ZiwxGIH4CkY&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=50', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(116, 2, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=m9PoLLpI1UE&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=51', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(117, 2, 4, 'កំណែលំហាត់ (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=hv_lh3Fc2zQ&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=52', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(118, 2, 4, 'សំណេរតែងសេចក្តី (ត) ភាសាខ្មែរថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=jz01WH95mso&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=53', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(119, 2, 7, 'មេរៀនទី៨ វិសមីការដឺក្រេទី១មានមួយអញ្ញាត (តចប់) គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=W8uRl_sFYuI&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=54', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(120, 2, 3, 'ជំពូកទី៣ មេរៀនទី១ ទឹក (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=EQu48nBvXbg&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=55', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(121, 2, 5, 'មេរៀនទី២ របបអាហារនិងថាមពល (ជីវៈវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=yD8muw-5y0E&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=56', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(122, 2, 6, 'កំណែសំណួរនិងលំហាត់ (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=Hag3JmJqgx8&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=57', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(123, 2, 4, 'សំណេរតែងសេចក្តី (ត) ភាសាខ្មែរថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=t_XlaBImnd4&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=58', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(124, 2, 1, 'មេរៀនទី២ រដ្ឋដាយវៀតសតវត្សរ៍ទី១១-១៣ (ត) ប្រវត្តវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=z88Zy9m0Rqw&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=59', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(125, 2, 7, 'កំណែលំហាត់ (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=5oSGvS4eIyY&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=60', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(126, 2, 3, 'កំណែលំហាត់ (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=m7Li-w32VVQ&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=61', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(127, 6, 4, 'អំណាន ការសុំសន្តោសប្រណី (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=7l2uvosTrKI&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=62', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(128, 1, 7, 'មេរៀនទី២០ ប្រូបាប (គណិតវិទ្យាថ្នាក់ទី៧)', 'https://www.youtube.com/watch?v=6COW586706U&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=63', '2020-08-31 02:07:25', '2020-08-31 02:07:25'),
(129, 2, 4, 'សំណេរតែងសេចក្តី (ត) ភាសាខ្មែរថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=zAWbX1gLY6U&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=64', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(130, 2, 1, 'មេរៀនទី២ រដ្ឋដាយវៀតសតវត្សរ៍ទី១១-១៣ (តចប់) ប្រវត្តវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=gY8vpz5QVtw&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=65', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(131, 2, 4, 'ភាសាខ្មែរថ្នាក់ទី៨ វេយ្យករណ៍ នាមនិងប្រភេទនាម', 'https://www.youtube.com/watch?v=IGZjTG06_-4&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=66', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(132, 2, 4, 'ភាសារខ្មែរថ្នាក់ទី៨ មេរៀនទី៩ ឧត្តមភាពបុគ្គល (ត)', 'https://www.youtube.com/watch?v=cBzj_EoEmE4&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=67', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(133, 2, 6, 'កំណែលំហាត់ត្រៀមប្រលងឆមាស (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=7mSjpxgKPnY&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=68', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(134, 2, 1, 'មេរៀនទី៣ រដ្ឋអាយុធ្យា (តចប់) ប្រវត្តវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=XJBUiY9PNVg&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=69', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(135, 2, 5, 'ជំពូកទី៦ មេរៀនទី១ គ្រឿងញៀន (ជីវៈវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=biQSePjUfP8&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=70', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(136, 2, 7, 'មេរៀនទី១០ ស្ថិតិ (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=JaSssV5dJVc&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=71', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(137, 2, 7, 'មេរៀនទី៩ ប្លង់កូអរដោនេនិងក្រាប (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=MUJ5CCq8AZ0&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=72', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(138, 2, 4, 'ភាសារខ្មែរថ្នាក់ទី៨ មេរៀនទី៩ ឧត្តមភាពបុគ្គល', 'https://www.youtube.com/watch?v=Epo22pFWLog&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=73', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(139, 2, 4, 'អំណាន ភាពថ្លៃថ្នូរនៃបុគ្គល (ត) ភាសាខ្មែរថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=0e6iPWleFis&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=74', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(140, 2, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=N2YCyo5q6HA&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=75', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(141, 2, 1, 'មេរៀនទី៣ រដ្ឋអាយុធ្យា (ត) ប្រវត្តវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=-Bn74d5ARYU&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=76', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(142, 2, 5, 'មេរៀនទី៣ អាហារមានសុវត្ថិភាព (ជីវៈវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=ZG6TasYGEuk&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=77', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(143, 2, 3, 'កំណែលំហាត់ទី៥ (គីមីវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=9nezAmEYFLo&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=78', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(144, 2, 7, 'មេរៀនទី១៦ បន្ទាត់និងអង្កត់ពិសេសជួបគ្នាក្នុងត្រីកោណ (តចប់) គណិតវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=-rj3BLKM0bs&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=79', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(145, 2, 4, 'អំណាន ភាពថ្លៃថ្នូរនៃបុគ្គល (ភាសាខ្មែរថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=woE7amAyZeQ&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=80', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(146, 2, 4, 'ភាសាខ្មែរថ្នាក់ទី៨ វេយ្យករណ៍ នាមនិងប្រភេទនាម (តចប់)', 'https://www.youtube.com/watch?v=0ChNxfQ2GCU&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=81', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(147, 2, 6, 'មេរៀនទី១ ការបង្កើតសូរ (តចប់) រូបវិទ្យាថ្នាក់ទី៨', 'https://www.youtube.com/watch?v=F1TKOaOmA1I&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=82', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(148, 2, 1, 'មេរៀនទី៤ រដ្ឋឡានសាង (ប្រវត្តវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=88PtRa-RP8Q&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=83', '2020-08-31 02:07:26', '2020-08-31 02:07:26'),
(149, 6, 8, 'សិទ្ធជនជាតិផ្សេងៗនៅកម្ពុជា (សីលធម៌ថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=Pydkl7ZMovg&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=43', '2020-08-31 02:09:46', '2020-08-31 02:09:46'),
(150, 3, 7, 'មេរៀនទី៩ ចម្ងាយរវាងពីរចំណុច (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=l46F9DvOaq0&list=PLoYVhXU9mJXDHolKRwK_rmsUPJyklHO_r&index=45', '2020-08-31 02:09:46', '2020-08-31 02:09:46'),
(151, 3, 5, 'ជីវៈវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=KORQkXuXPvM&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v', '2020-08-31 02:31:07', '2020-08-31 02:31:07'),
(152, 3, 7, 'ប្រូបាប (គណិតវិទ្យាថ្នាក់ទី ៩)', 'https://www.youtube.com/watch?v=Q6oDzdWB2EI&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=2', '2020-08-31 02:31:07', '2020-08-31 02:31:07'),
(153, 3, 4, 'ភាសាខ្មែរថ្នាក់ទី ៩', 'https://www.youtube.com/watch?v=cfm5uD4XnHI&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=3', '2020-08-31 02:31:07', '2020-08-31 02:31:07'),
(154, 3, 6, 'រូបវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=hWYLNV3QwBU&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=4', '2020-08-31 02:31:07', '2020-08-31 02:31:07'),
(155, 3, 5, 'មេរៀនទី១ ភ្នាក់ងារបង្ករោគ (ជីវៈវិទ្យា ថ្នាក់ទី 9)', 'https://www.youtube.com/watch?v=7dxwPjsHves&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=5', '2020-08-31 02:31:07', '2020-08-31 02:31:07'),
(156, 3, 7, 'ប្រូបាប (គណិតវិទ្យាទី៩)', 'https://www.youtube.com/watch?v=dOkE0gAd9-o&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=6', '2020-08-31 02:31:07', '2020-08-31 02:31:07'),
(157, 3, 4, 'ពាក្យផ្សំ (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=nl_UEnbGY9I&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=7', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(158, 3, 6, 'មេរៀនទី៥ ត្រង់ស្វូរម៉ាទ័រ ឬត្រង់ស្វូរ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=VcbIqpy_PLQ&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=8', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(159, 3, 3, 'មេរៀនទី២ អាសុីត (គីមីវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=3ab0X3yo33o&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=9', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(160, 3, 7, 'មេរៀន ប្រូបាប(ត) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=7CoBMem5uuM&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=10', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(161, 3, 7, 'មេរៀនទី១៥ ទ្រឹស្តីបទតាលែស (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=Ctl7Jhax5vc&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=11', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(162, 3, 4, 'អំណាន ឧត្តមគតិបុគ្គលសំខាន់ (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=nPut3N4THqI&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=12', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(163, 3, 7, 'មេរៀនទី៨ ប្រូបាប (ត) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=vBYpYeqzPpg&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=13', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(164, 3, 3, 'មេរៀនទី២ អាសុីត (គីមីវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=9GN9I7phCk0&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=14', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(165, 3, 7, 'កំណែលំហាត់ធរណីមាត្រ (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=dSMY9-iKaOc&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=15', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(166, 3, 5, 'មេរៀនទី១ ភ្នាក់ងារបង្ករោគ (តចប់) ជីវៈថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=hGXsn2rkxtw&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=16', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(167, 3, 7, 'មេរៀនទី៨ ប្រូបាប (ត) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=Ib5s1giPQag&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=17', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(168, 3, 4, 'វេយ្យាករណ៍ អំពីល្បះទោល (ត) ភាសាខ្មែរថ្នាក់ទី៧', 'https://www.youtube.com/watch?v=76OtnZ-CuXU&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=18', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(169, 3, 6, 'កំណែលំហាត់ត្រង់ស្វូ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=YoyLbxA3Fm8&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=19', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(170, 3, 4, 'សំណេរតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=7H19dFuG0MM&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=20', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(171, 3, 7, 'មេរៀនទី១៥ ទ្រឹស្តីបទតាលែស (តចប់) គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=mJ8vH5HdObA&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=21', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(172, 3, 4, 'អំណាន ឧត្តមគតិបុគ្គលសំខាន់ (តចប់)​ ភាសាខ្មែរថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=YT7u6ZdaRhk&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=22', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(173, 3, 1, 'មេរៀនទី១ សង្រ្គាមលោកលើកទី១ (តចប់) ប្រវត្តិវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=r9DKUT0GNms&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=23', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(174, 3, 3, 'អាសុីត (តចប់) គីមីវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=eT4hcSxxP7Q&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=24', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(175, 3, 5, 'មេរៀនទី២ ជម្ងឺឆ្លង (ត) ជីវៈវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=umsoIoSYLRs&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=25', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(176, 3, 7, 'ប្រូបាប (ត) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=HeQGIpYXT_I&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=26', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(177, 3, 7, 'មេរៀនទី៨ ប្រូបាប (តចប់) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=rCQYx8QGOi8&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=27', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(178, 3, 6, 'មេរៀនទី១ ដំណាលនៃពន្លឺ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=IACYUHO7fcs&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=28', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(179, 3, 4, 'តែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=lI8zjv97PRA&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=29', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(180, 3, 3, 'មេរៀនទី៣ បាស (គីមីវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=bGqjqe5OotQ&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=30', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(181, 3, 7, 'កំណែលំហាត់ធរណីមាត្រ (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=lqWsEd1L_rQ&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=31', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(182, 3, 4, 'អំណាន អាលីយូស្សា (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=13QW71pikoY&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=32', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(183, 3, 6, 'មេរៀនទី១ ដំណាលត្រង់នៃពន្លឺ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=40cytUDomlk&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=33', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(184, 3, 4, 'ការស្តាប់ ការមិនលះបង់សេចក្តីព្យាយាម (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=9-7cLrqbDXc&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=34', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(185, 3, 7, 'មេរៀនទី៣ បាស (ត) គីមីវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=mSVfJ48QZL0&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=35', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(186, 3, 1, 'មេរៀនទី៣ សង្គា្រមលោកលើកទី២ (១៩៣៩-១៩៤៥) ប្រវត្តវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=49coCZhvcmA&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=36', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(187, 3, 5, 'មេរៀនទី២ ជម្ងឺឆ្លង (ត) ជីវៈវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=lcQjXUJnssk&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=37', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(188, 3, 7, 'មេរៀនទី៩ ចម្ងាយរវាងពីរចំណុច (តចប់) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=6kXxl28hIcg&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=38', '2020-08-31 02:31:08', '2020-08-31 02:31:08'),
(189, 3, 4, 'មេរៀនទី៩ ជោគជ័យនៃជីវិត (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=_aiUypP2yUo&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=39', '2020-08-31 02:31:09', '2020-08-31 02:31:09'),
(190, 3, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=qoRGjbRtFtA&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=40', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(191, 3, 4, 'បំនិន កំណាព្យបទភជង្គលីលា (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=SKJTt-AMkh4&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=41', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(192, 3, 7, 'មេរៀនទី១៦ ត្រីកោណដូចគ្នា (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=zzZjFGzt-Qw&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=42', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(193, 3, 5, 'មេរៀនទី២ ជម្ងឺឆ្លង (តចប់) ជីវៈវិទ្យាថ្នាកទី៩', 'https://www.youtube.com/watch?v=dDEWkG0aXPc&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=43', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(194, 3, 4, 'អំណាន វិជ្ជាជាទ្រព្យ (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=UlkmMZeXB3I&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=44', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(195, 3, 7, 'មេរៀនទី១៦ ត្រីកោណដូចគ្នា (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=dHchmmjfrCc&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=45', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(196, 3, 6, 'មេរៀនទី២ ចំណាំងផ្លាតនៃពន្លឺ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=Bl7JG-X75NI&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=46', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(197, 3, 4, 'វេយ្យាករណ៍ អំពីល្បះទោល (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=hNxXP2oKTz0&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=47', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(198, 3, 3, 'មេរៀនទី៤ អំបិល (គីមីវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=pi6JwZVxBoY&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=48', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(199, 3, 7, 'មេរៀនទី១០ សមីការនៃបន្ទាត់ (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=X39tXcU2g5w&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=49', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(200, 3, 5, 'មេរៀនទី៣ ជម្ងឺមិនឆ្លង ( ជីវៈវិទ្យាថ្នាកទី៩ )', 'https://www.youtube.com/watch?v=KLQ66dJoDBQ&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=50', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(201, 3, 1, 'មេរៀនទី៤ អង្គការសហប្រជាជាតិ (ប្រវត្តវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=M46-88zGMXE&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=51', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(202, 3, 4, 'វេយ្យាករណ៍ អំពីល្បះផ្សំ (ត) ភាសាខ្មែរថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=RsMrSkDlgZ8&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=52', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(203, 3, 1, 'មេរៀនទី៤ អង្គការសហប្រជាជាតិ (ត) ប្រវត្តវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=F_JxCEcb70A&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=53', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(204, 3, 7, 'គណិតវិទ្យាថ្នាក់ទី៩ មេរៀនទី១៦ ត្រីកោណដូចគ្នា (ត)', 'https://www.youtube.com/watch?v=jTGzW0FC14Y&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=54', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(205, 3, 6, 'កំណែសំនួរនិងលំហាត់ (រូបវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=M5FG7j2Vv3I&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=55', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(206, 3, 5, 'មេរៀនទី៣ ជម្ងឺមិនឆ្លង ( ជីវៈវិទ្យាថ្នាកទី៩ )', 'https://www.youtube.com/watch?v=fznLJ8g7QcE&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=56', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(207, 3, 5, 'ជំពូកទី៥ មេរៀនទី១ អំពើរបស់មនុស្សទៅលើបរិស្ថាន (តចប់) ជីវៈវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=S-dKDH9CL90&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=57', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(208, 3, 1, 'ជំពូក៣ មេរៀនទី១ ប្រទេសឥណ្ឌូនេសុី (ប្រវត្តវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=dvyoIOGduHw&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=58', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(209, 3, 3, 'កំណែលំហាត់ត្រៀមប្រលងឆមាស (គីមីវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=lbZvztloOq4&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=59', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(210, 3, 4, 'ភាសាខ្មែរថ្នាក់ទី៩ ធាតុសំខាន់របស់ប្រលោមលោកទំនើប', 'https://www.youtube.com/watch?v=Hk5K1TBpKq4&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=60', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(211, 3, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=n71uqBhg2yQ&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=61', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(212, 3, 7, 'គណិតវិទ្យាថ្នាក់ទី៩ មេរៀនទី១៦ ត្រីកោណដូចគ្នា (ត)', 'https://www.youtube.com/watch?v=JqUa8cyfBAQ&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=62', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(213, 3, 4, 'ភាសាខ្មែរថ្នាក់ទី៩ ប្រលោមលោកទំនើប', 'https://www.youtube.com/watch?v=JAuCcdqsWVA&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=63', '2020-08-31 02:49:17', '2020-08-31 02:49:17'),
(214, 3, 3, 'កំណែលំហាត់ (គីមីវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=kS1hBzmn_Ec&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=64', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(215, 3, 7, 'គណិតវិទ្យាថ្នាក់ទី៩ មេរៀនទី១៦ ត្រីកោណដូចគ្នា (ត)', 'https://www.youtube.com/watch?v=5eHwleR8fbc&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=65', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(216, 3, 1, 'មេរៀនទី៥ សមាគមន៍ប្រជាជាតិអាស៊ីអាគ្នេយ៍ ( តចប់) ប្រវត្តវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=GVVokL7vhNA&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=66', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(217, 3, 3, 'មេរៀនទី៤ អំបិល (តចប់) គីមីវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=PA71rwAFuFU&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=67', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(218, 3, 6, 'មេរៀនទី៤ ឡង់ទី (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=QDB6ls42ffs&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=68', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(219, 3, 4, 'មេរៀនទី១០ ពលរដ្ឋល្អ (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=GnF6pBwuyw4&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=69', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(220, 3, 7, 'មេរៀនទី១៦ បន្ទាត់និងអង្កត់ពិសេសជួបគ្នាក្នុងត្រីកោណ (គណិតវិទ្យាថ្នាក់ទី៨)', 'https://www.youtube.com/watch?v=EcPM1nVqvHg&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=70', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(221, 3, 7, 'មេរៀនទី១០ សមីការនៃបន្ទាត់ (ត) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=aORnL_4ZXLg&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=71', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(222, 3, 4, 'អំណាន កាព្យផ្តោផ្តង (ភាសាខ្មែរថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=EXl0pL6Imhc&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=72', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(223, 3, 7, 'មេរៀនទី១០ សមីការនៃបន្ទាត់ (ត) គណិតវិទ្យាថ្នាក់ទី៩', 'https://www.youtube.com/watch?v=UyU0IylzKUk&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=73', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(224, 3, 5, 'កំណែសំណររំលឹកមេរៀន (ជីវៈវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=ltJxnxlEFbs&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=74', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(225, 3, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=uXzpDt9AseA&list=PLoYVhXU9mJXCJK699Ccklp9M7nEcgK03v&index=75', '2020-08-31 02:49:18', '2020-08-31 02:49:18'),
(226, 4, 7, 'គណិតវិទ្យាថ្នាក់ទី 10', 'https://www.youtube.com/watch?v=U93ajWFuSz0&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(227, 4, 7, 'គណិតវិទ្យា ថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=EEvNtGyP7W8&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=2', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(228, 4, 4, 'ភាសាខ្មែរថ្នាក់ទី ១០', 'https://www.youtube.com/watch?v=KNMwdRPGoPk&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=3', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(229, 4, 3, 'មេរៀនទី២ អុីដ្រូកាបួឆ្អែតអាល់កាន', 'https://www.youtube.com/watch?v=q7-w9JQJpnE&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=4', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(230, 4, 6, 'មេរៀនទី៣ កម្តៅ (រូបវិទ្យា ថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=MIk62BmhqUA&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=5', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(231, 4, 3, 'អុីដ្រូកាបួឆ្អែតអាល់កាន (ត) គីមីវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=nHcm79VMLLA&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=6', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(232, 4, 6, 'រំលឹកមេរៀន កម្តៅ (រូបវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=G0rzOsjFE64&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=7', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(233, 4, 1, 'មេរៀនទី១ មជ្ឈិមបូពា៌ (ប្រវត្តវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=x74xDqurCqc&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=8', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(234, 4, 7, 'ដោះស្រាយលំហាត់ប្រព័ន្ធវិសមីការ (គណិតវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=JMe6UN2iJ8M&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=9', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(235, 4, 4, 'អំណាន បំណងប្រាថ្នារបស់ព្រះបាទព្រះវេស្សន្តរ (ត) ភាសាខ្មែរថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=Qwr70gCqd94&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=10', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(236, 4, 6, 'មេរៀនទី៣ កម្តៅ (ត) រូបវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=j_Hi8XGJYbw&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=11', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(237, 4, 6, 'កំណែកិច្ចការផ្ទះ (រូបវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=N4IHDi83W7c&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=12', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(238, 4, 7, 'ដោះស្រាយលំហាត់ប្រព័ន្ធវិសមីការ (គណិតវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=kSHpd3_YmSI&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=13', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(239, 4, 4, 'សិក្សារឿង សុវណ្ណសាម (ភាសាខ្មែរថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=wySGaSaxl5w&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=14', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(240, 4, 7, 'អនុគមន៍ដឺក្រេទី២និងក្រាប (គណិតវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=_yC9pfSygjo&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=15', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(241, 4, 4, 'សំណេរ តែងសេចក្តីសំយោគ (ភាសាខ្មែរថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=fWHU9WfEh6k&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=16', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(242, 4, 6, 'កម្តៅ (ត) រូបវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=BIH8a-oj0FE&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=17', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(243, 4, 1, 'មេរៀនទី១ មជ្ឈឹមបូពា៌ (ប្រវត្តិវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=LVXpxMnIUQc&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=18', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(244, 4, 6, 'កំណែលំហាត់កិច្ចការផ្ទះ (រូបវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=MgtLoL6I7vE&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=19', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(245, 4, 5, 'មេរៀនទី១ ប្រព័ន្ធគ្រោងឆ្អឹង (ជីវៈវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=Cjse5s9Q5BI&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=20', '2020-08-31 03:07:31', '2020-08-31 03:07:31'),
(246, 4, 3, 'អុីដ្រូកាបួមិនទាន់ឆ្អែត (ត) គីមីវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=oVqpA-5h1os&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=21', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(247, 4, 4, 'សិក្សារឿង សុវណ្ណសាម (ត) ភាសាខ្មែរថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=8jbLYO-1XeU&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=22', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(248, 4, 7, 'អនុគមន៍ដឺក្រេទី២និងក្រាប (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=PTSANhrD17c&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=23', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(249, 4, 4, 'អំណាន មាគា៌ជីវិតរបស់មាលា (ភាសាខ្មែរថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=b3-Ztm3t3No&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=24', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(250, 4, 6, 'កំណែតេស្តខ្លី (រូបវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=tEv4mprt7bg&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=25', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(251, 4, 4, 'អំណាន មាគា៌ជីវិតរបស់មាលា (តចប់) ភាសាខ្មែរថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=IlwJGvdMe84&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=26', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(252, 4, 7, 'ផលធៀបត្រីកោណមាត្រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=NaQfqPLuTQ4&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=27', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(253, 4, 1, 'កំណែកិច្ចការផ្ទះ (ប្រវត្តវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=M1DxMpu_u6Y&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=28', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(254, 4, 5, 'មេរៀនទី២ ប្រព័ន្ធសាច់ដុំ (ជីវៈវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=hQOiU8n5iGg&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=29', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(255, 4, 3, 'មេរៀនទី៣ អុីដ្រូកាបួមិនទាន់ឆ្អែត (ត) គីមីវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=rcqI2YjMvx0&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=30', '2020-08-31 18:57:45', '2020-08-31 18:57:45');
INSERT INTO `api_youtube` (`id`, `type_class`, `subject_id`, `title`, `url`, `created_at`, `updated_at`) VALUES
(256, 4, 7, 'ផលធៀបត្រីកោណមាត្រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=e810DhB2nRk&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=31', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(257, 4, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=DCSeuIto0Rc&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=32', '2020-08-31 18:57:45', '2020-08-31 18:57:45'),
(258, 3, 7, 'មេរៀនទី៩ ចម្ងាយរវាងពីរចំណុច (គណិតវិទ្យាថ្នាក់ទី៩)', 'https://www.youtube.com/watch?v=l46F9DvOaq0&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=33', '2020-08-31 18:57:46', '2020-08-31 19:02:31'),
(259, 6, 8, 'សិទ្ធជនជាតិផ្សេងៗនៅកម្ពុជា (សីលធម៌ថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=Pydkl7ZMovg&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=34', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(260, 4, 4, 'អំណាន ជីវិតខ្មែរក្នុងនរកអវចី (ភាសាខ្មែរថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=aJFiAcZRGzs&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=35', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(261, 4, 4, 'អំណាន ជីវិតខ្មែរក្នុងនរកអវចី (តចប់) ភាសាខ្មែរថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=-ZHt8k_I5NM&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=36', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(262, 4, 7, 'ផលធៀបត្រីកោណមាត្រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=kdiORAEFK74&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=37', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(263, 4, 5, 'ជំពូកទី៤ មេរៀនទី២ ប្រព័ន្ធសាច់ដុំ (តចប់) ជីវៈវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=UG5FIXpWEeo&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=38', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(264, 4, 7, 'ផលធៀបត្រីកោណមាត្រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=hlD3B-kwfFU&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=39', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(265, 4, 3, 'ដំណោះស្រាយលំហាត់ (គីមីវិទ្យាថ្នាក់១០)', 'https://www.youtube.com/watch?v=luBicaP0KYI&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=40', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(266, 4, 6, 'មេរៀនទី១ អេលិចត្រូស្តាទិច (ត) រូបវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=OsKix9GmKtE&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=41', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(267, 4, 4, 'សំណេរតែងសេចក្តីប្រៀបធៀប (ភាសាខ្មែរថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=74PW1PINWjw&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=42', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(268, 4, 4, 'សំណេរតែងសេចក្តីបែបសុភាសិត (ភាសាខ្មែរថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=3MeFEDDh3GM&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=43', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(269, 4, 7, 'ផលធៀបត្រីកោណមាត្រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=K0Z2sXjy8Dk&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=44', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(270, 4, 5, 'កំណែលំហាត់ (ជីវៈវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=KouQN0bufLY&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=45', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(271, 4, 7, 'កំណែលំហាត់ ផលធៀបត្រីកោណមាត្រ (គណិតវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=9hZpptvtrqE&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=46', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(272, 4, 3, 'មេរៀនទី៤ អុីដ្រូកាបួប្រហើរបង់សែន (គីមីវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=9amYKQYg5dM&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=47', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(273, 4, 1, 'មេរៀនទី២ ប្រទេសភូមា (តចប់) ប្រវត្តវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=ZcPZ7cFlrdk&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=48', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(274, 4, 4, 'អំណាន ពេជ្រនឹងត្រូវច្នៃ (តចប់) ភាសាខ្មែរថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=1g1U429M3RM&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=49', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(275, 4, 1, 'មេរៀនទី៣ ប្រទេសចិនក្នុងរាជវង្សសុិននិងហាន (ប្រវត្តវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=rUCK9yqSyXU&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=50', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(276, 4, 3, 'កំណែសំណួរនិងលំហាត់ (គីមីវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=9cAtHi6jWSg&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=51', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(277, 4, 7, 'ជំពូកទី៩ មេរៀនទី១ វិចទ័រនិងប្រមាណវិធីលើវិចទ័រ (គណិតវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=FJFJ50jY3Y8&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=52', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(278, 4, 1, 'ប្រវត្តវិទ្យាថ្នាក់ទី១០ រំលឹកមេរៀនចាស់', 'https://www.youtube.com/watch?v=89h3m1UAR9I&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=53', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(279, 4, 5, 'ជំពូកទី៥ មេរៀនទី១ ជី (ត) ជីវៈវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=VQb_HusVKNo&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=54', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(280, 4, 7, 'កំណែលំហាត់ (គណិតវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=Up0HzUaGYu4&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=55', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(281, 4, 6, 'មេរៀនទី២ ចរន្តជាប់និងម៉ាញេទិច (ត) រូបវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=X2TwDThY0AA&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=56', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(282, 4, 7, 'ជំពូកទី៩ មេរៀនទី១ វិចទ័រនិងប្រមាណវិធីលើវិចទ័រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=d233AjW5ufA&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=57', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(283, 4, 3, 'កំណែលំហាត់ (គីមីវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=1adRblwk8N0&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=58', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(284, 4, 1, 'ប្រវត្តវិទ្យាថ្នាក់ទី១០ មេរៀនទី៥ ចក្រភពម៉ុងហ្គោល', 'https://www.youtube.com/watch?v=gDQh4Jj_VlQ&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=59', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(285, 4, 5, 'ជំពូកទី៥ មេរៀនទី១ ជី (ជីវៈវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=NAaOBpJCxAM&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=60', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(286, 4, 7, 'ជំពូកទី៩ មេរៀនទី១ វិចទ័រនិងប្រមាណវិធីលើវិចទ័រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=7hCvwm6qwqE&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=61', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(287, 4, 4, 'អំណាន ពិធីរៀបការរបស់ជនជាតិឥណ្ឌាបុរាណ (តចប់) ភាសាខ្មែរថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=lFbeZ-UjtZ8&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=62', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(288, 4, 4, 'អំណាន ពិធីរៀបការរបស់ជនជាតិឥណ្ឌាបុរាណ (ភាសាខ្មែរថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=5j63a_jB0n0&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=63', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(289, 4, 6, 'មេរៀនទី២ ចរន្តជាប់និងម៉ាញេទិច (ត) រូបវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=9V1q7aT5TBM&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=64', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(290, 4, 3, 'កំណែលំហាត់ (គីមីវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=gTM2jaW8lnQ&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=65', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(291, 4, 7, 'ជំពូកទី៩ មេរៀនទី១ វិចទ័រនិងប្រមាណវិធីលើវិចទ័រ (ត) គណិតវិទ្យាថ្នាក់ទី១០', 'https://www.youtube.com/watch?v=Oa-lNlubdyA&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=66', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(292, 4, 7, 'កំណែលំហាត់ត្រៀមប្រលងឆមាស (គណិតវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=aTjc5JgsBVo&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=67', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(293, 4, 3, 'កំណែលំហាត់ត្រៀមប្រលងឆមាស (គីមីវិទ្យាថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=CrDtBpScnhA&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=68', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(294, 4, 1, 'មេរៀនទី២ បម្រែបម្រួលសង្គម', 'https://www.youtube.com/watch?v=jSowKDCg5fA&list=PLoYVhXU9mJXCptARNpx21sjBlG0GtLBU0&index=69', '2020-08-31 18:57:46', '2020-08-31 18:57:46'),
(295, 5, 7, 'គណិតវិទ្យា ថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=G91kWRzZiGc&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx', '2020-08-31 19:43:52', '2020-08-31 19:43:52'),
(296, 5, 4, 'ភាសាខ្មែរថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=5j3MqJROhP0&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=2', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(297, 5, 3, 'រំលឹកគីមីសរីរាង្គ (គីមីវិទ្យា ថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=myUVoAeY2hw&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=3', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(298, 5, 7, 'កែលំហាត់ (គណិតវិទ្យា ថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=nYmwHkPrnCI&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=4', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(299, 5, 6, 'មេរៀនទី៣ កម្តៅ (រូបវិទ្យា ថ្នាក់ទី១០)', 'https://www.youtube.com/watch?v=MIk62BmhqUA&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=5', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(300, 5, 6, 'មេរៀនទី១ ចលនាខួប (រូបវិទ្យា ថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=LtsBpt0OlAM&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=6', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(301, 5, 6, 'មេរៀនទី១ ចលនាខួប (ត) រូបវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=PHPjlMBAvwY&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=7', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(302, 5, 1, 'មេរៀនទី៥ ប្រទេសកូរ៉េ (ប្រវត្តវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=-X3a67TFp_0&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=8', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(303, 5, 3, 'មេរៀនទី១ អាល់កុល និងអេទែ (គីមីវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=M3jzCNEkkZ4&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=9', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(304, 5, 7, 'ដោះស្រាយលំហាត់លីមីត (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=KL43erVR3_I&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=10', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(305, 5, 4, 'អំណាន កាពិតក្នុងរបបកម្ពុជាប្រជាធិបតេយ្យ (ត) ភាសាខ្មែរថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=GhyFPkCg7-k&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=11', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(306, 5, 6, 'ចលនាខួប (រូបវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=HY9_6X46NZE&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=12', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(307, 5, 7, 'កែលំហាត់ (គណិតវិទ្យា ថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=dnc7iWiwELI&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=13', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(308, 5, 3, 'ការហៅឈ្មោះរបស់អាល់កានជាស្ទើលាត (គីមីវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=9CuFG1OVWHA&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=14', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(309, 5, 5, 'លំហាត់(ច្បាប់តំណពូជ)', 'https://www.youtube.com/watch?v=owkEiqX2KhU&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=15', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(310, 5, 4, 'អំណាន កាពិតក្នុងរបបកម្ពុជាប្រជាធិបតេយ្យ (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=J40SBsIS7G8&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=16', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(311, 5, 4, 'សិក្សារឿង រឿងព្រះវេសន្តរ (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=HCzl8Fhnt1A&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=17', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(312, 5, 7, 'ដេរីរេ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=lAtjeqIqAgA&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=18', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(313, 5, 4, 'អំណាន លទ្ធិផ្សេងៗក្នុងសាសនាព្រាហ្មណ៍ (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=gB8xsPG57Yk&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=19', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(314, 5, 6, 'មេរៀនទី១ ចលនាខួប (ត) រូបវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=tH6jFFDa4Sg&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=20', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(315, 5, 1, 'មេរៀនទី៥ ប្រទេសកូរ៉េ (ប្រវត្តិវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=C07F47PHPGo&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=21', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(316, 5, 5, 'មេរៀនទី២ ក្រូម៉ូសូម (ជីវៈវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=xwkuVVgs2zs&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=22', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(317, 5, 7, 'ដេរីរេ (ត) គណិតវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=kap7iPcwg_k&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=23', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(318, 5, 3, 'ថ្នាក់ទាំងបីនៃអាល់កុល (គីមីវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=8jb5JzjH6B8&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=24', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(319, 5, 6, 'មេរៀនទី១ ចលនាខួប (ត) រូបវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=sb6n2yA3xL8&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=25', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(320, 5, 7, 'កំណែលំហាត់ដេរីវេ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=A51YTShVb0c&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=26', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(321, 5, 4, 'សិក្សារឿងព្រះវេស្សន្តរ (ត) ភាសាខ្មែរថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=JHP9S6zNCD0&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=27', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(322, 5, 6, 'មេរៀនទី១ ចលនាខួប (តចប់) រូបវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=0fMzFnG0EEE&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=28', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(323, 5, 4, 'សំណេរតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=PbXYPOMjgcA&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=29', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(324, 5, 4, 'សំណរតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=5oPS97xSyKY&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=30', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(325, 5, 7, 'កំណែលំហាត់ដេរីវេ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=Fdnqn15xv1Q&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=31', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(326, 5, 1, 'មេរៀនទី៥ ប្រទេសកូរ៉េ (តចប់) ប្រវត្តិវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=ior4FajZ94U&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=32', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(327, 5, 5, 'មេរៀនទី២ ក្រូម៉ូសូម (បន្ត) ជីវៈវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=aR60HliDamI&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=33', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(328, 5, 3, 'មេរៀនទី១ អាល់កុលនិងអេទែ (ត) គីមីវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=1dPXWbpFE9Y&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=34', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(329, 5, 7, 'អនុវត្តន៍នៃដេរីវេ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=jTl2b-SB67U&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=35', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(330, 5, 4, 'សំណេរតែងសេចក្តីប្រៀបធៀប (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=rZYcOtrdnBY&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=36', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(331, 5, 6, 'ជំពូកទី៣ មេរៀនទី២ រលកឬចលនារលក (រូបវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=-emYNHdVMM8&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=37', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(332, 5, 7, 'ដោះស្រាយអនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=mY8BZU4g0g0&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=38', '2020-08-31 19:43:53', '2020-08-31 19:43:53'),
(333, 5, 4, 'សំណេរតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=u9Sv6ZCO7HQ&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=39', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(334, 5, 5, 'ជំពូកទី៣ មេរៀនទី២ ក្រូម៉ូសូម (បន្ត) ជីវៈវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=voIkSnhK66w&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=40', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(335, 5, 3, 'មេរៀនទី១ អាល់កុលនិងអេទែ (ត) គីមីវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=JFtTybj6cKQ&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=41', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(336, 5, 7, 'អ័ក្សឆ្លុះ (អនុគមន៍ដេរីវេ ថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=2ERcnOXmESo&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=42', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(337, 5, 4, 'អក្សរសិល្ប៍ខ្មែរ (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=0kPGxI6sf0M&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=43', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(338, 5, 7, 'អនុវត្តន៍នៃដេរីវេ (ត) គណិតវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=nTJJUPJPf4s&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=44', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(339, 5, 4, 'អក្សរសិល្ប៍ខ្មែរ (ត) ភាសាខ្មែរថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=8EhhWRi0lGo&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=45', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(340, 5, 5, 'មេរៀនទី៣ ក្រូម៉ូសូម (បន្តរ) ជីវៈវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=vQdaoMUkaWg&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=46', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(341, 5, 3, 'មេរៀនទី១ អាល់កុលនិងអេទែ (តចប់) គីមីវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=Y0-1v6qQAbg&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=47', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(342, 5, 7, 'កំណែលំហាត់អនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=3r0CYeAEHSQ&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=48', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(343, 5, 1, 'មេរៀនទី៦​ ប្រទេសនូវែលសេឡង់ (ត) ប្រវត្តវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=7oWJ9eeIMdk&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=49', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(344, 5, 7, 'កំណែលំហាត់អនុគមន៍ (ត) គណិតវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=xN4PNWwzFOU&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=50', '2020-08-31 19:43:54', '2020-08-31 19:43:54'),
(345, 5, 4, 'អំណាន សិក្សារឿងគូលីកំណែន (តចប់) ភាសាខ្មែរថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=dsm9kd59iik&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=51', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(346, 5, 1, 'មេរៀនទី៧ ប្រទេសអូស្ត្រាលី (ប្រវត្តវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=RuxObwHohik&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=52', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(347, 5, 7, 'ដោះស្រាយលំហាត់អនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=tAN75lminmE&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=53', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(348, 5, 3, 'កំណែលំហាត់ (គីមីវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=_CVbMUxnKyE&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=54', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(349, 5, 3, 'មេរៀនទី៣ អាសុីតកាបុកសុីលិច (ត) គីមីវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=1WVo4f2YCxE&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=55', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(350, 5, 1, 'ប្រវត្តវិទ្យាថ្នាក់ទី១១ មេរៀនទី៨ សង្គ្រាមលោកលើកទី១ (ត)', 'https://www.youtube.com/watch?v=3xp1yb90kBI&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=56', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(351, 5, 7, 'ដោះស្រាយអនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=BlT6xT_26Aw&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=57', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(352, 5, 6, 'មេរៀនទី២ រលក (លំហាត់អនុវត្ត) រូបវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=wfWpHu_Z_Z0&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=58', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(353, 5, 7, 'ដោះស្រាយអនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=jNU3p0R3WYg&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=59', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(354, 5, 3, 'មេរៀនទី៣ អាសុីតកាបុកសុីលិច (ត) គីមីវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=3y0OM-H8HYU&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=60', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(355, 5, 1, 'ប្រវត្តវិទ្យាថ្នាក់ទី១១ មេរៀនទី៨ សង្គ្រាមលោកលើកទី១', 'https://www.youtube.com/watch?v=gT5AnMSsSIk&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=61', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(356, 5, 5, 'កំណែលំហាត់ (ជីវៈវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=qKlhiP_mWv4&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=62', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(357, 5, 4, 'អំណាន អាពាហ៍ពិពាហ៍ខុងជឺ (តចប់) ភាសាខ្មែរថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=j1EgqXXgY0k&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=63', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(358, 5, 7, 'ដោះស្រាយអនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=cDAMKDL925M&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=64', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(359, 5, 4, 'អំណាន អាពាហ៍ពិពាហ៍ខុងជឺ (ភាសាខ្មែរថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=02NOx_lsSTU&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=65', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(360, 5, 6, 'មេរៀនទី២ រលក (លំហាត់អនុវត្ត) រូបវិទ្យាថ្នាក់ទី១១', 'https://www.youtube.com/watch?v=wbSp8NdLD1k&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=66', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(361, 5, 7, 'កំណែវិញ្ញាសាទី៧ (ត) គណិតវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=PNPSNn1QB3s&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=67', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(362, 5, 3, 'មេរៀនទី៣ អាសុីតកាបុកសុីលិច (គីមីវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=JANotS8zMHs&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=68', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(363, 5, 7, 'អនុគមន៍កើននិងអនុគមន៍ចុះ (គណិតវិទ្យាថ្នាក់ទិ១១)', 'https://www.youtube.com/watch?v=K6i3Ggq-e4Q&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=69', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(364, 5, 7, 'កំណែលំហាត់ត្រៀមប្រលងឆមាស (គណិតវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=XhNPL8kyRlw&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=70', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(365, 5, 1, 'មេរៀនទី៩ ការបាត់តុល្យភាពក្រោយសង្គ្រាមលោកលើកទី១ (ប្រវត្តវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=36hJZUDJsDQ&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=71', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(366, 5, 5, 'រំលឹកមេរៀនត្រៀមប្រលងឆមាស (ជីវៈវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=UrhucG8_bWI&list=PLoYVhXU9mJXA2WpF3F5bW4vJhUUA-3ppx&index=72', '2020-08-31 19:54:10', '2020-08-31 19:54:10'),
(367, 6, 4, 'មេរៀន ភាសាខ្មែរទី១២', 'https://www.youtube.com/watch?v=hlHmXlzL5vg&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(368, 6, 4, 'មេរៀនភាសាខ្មែរ ទី១២', 'https://www.youtube.com/watch?v=_FF9ZvE9FsQ&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=2', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(369, 6, 4, 'ភាសាខ្មែរ ថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=RAUbZXAAJ-w&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=3', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(370, 6, 7, 'គណិតវិទ្យា ថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=6mUX4Gfroqg&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=4', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(371, 6, 3, 'មេរៀនទី១ ធម្មជាតិនៃលំនឹង', 'https://www.youtube.com/watch?v=yyXhgZ91yq8&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=5', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(372, 6, 7, 'វិញ្ញាសារទី៤ គណិតវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=DDhEV0pyjto&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=6', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(373, 6, 4, 'សិក្សាប្រធានតែងសេចក្តី', 'https://www.youtube.com/watch?v=c4RUjuWLtRQ&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=7', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(374, 6, 6, 'រំលឹក មេរៀនម៉ាសុីន (រូបវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=IAQkeldJvEY&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=8', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(375, 6, 3, 'មេរៀនទី១ ធម្មជាតិនៃលំនឹងគីមី (ត) គីមីវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=cCCE35YCOag&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=9', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(376, 6, 6, 'ម៉ាសុីនបន្ទុះ៤វគ្គ (រូបវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=wSrv0G8JEW4&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=10', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(377, 6, 7, 'វិញ្ញាសារទី៤ រកសមីការស្តង់ដារប៉ារ៉ាបូល (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=ptk_p0LxSwk&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=11', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(378, 6, 4, 'សំណេរតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=df0u4noq26s&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=12', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(379, 6, 7, 'ប្រូបាប (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=9WoH24M3TiU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=13', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(380, 6, 7, 'ដោះស្រាយលំហាត់អនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=UXFkjs8o2QM&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=14', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(381, 6, 7, 'កំណែវិញ្ញាទី៥ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=_SGKz0kyqOA&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=15', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(382, 6, 5, 'មេរៀនទី២ ការសំដែងចេញនៃសែន (ជីវៈវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=wBxB14f1bkQ&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=16', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(383, 6, 6, 'កំណែលំហាត់ ភ្លុចម៉ាញេទិច (រូបវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=I-ALyOUzVqg&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=17', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(384, 6, 4, 'មេរៀនទី៦ សាលាចារឹកនិងរបាំ (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=QgQQXJGIWec&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=18', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(385, 6, 4, 'អក្សរសាស្រ្តខ្មែរ រំលឹកមេរៀន (ភាសាខ្មែរថ្នាក់ទី១២ )', 'https://www.youtube.com/watch?v=5SqbneMEW58&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=19', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(386, 6, 6, 'មេរៀនទី២ អាំងឌុចស្យុងអេលិចត្រូម៉ាញេទិច (រូបវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=uajslyI6UQc&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=20', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(387, 6, 1, 'មេរៀនទី១ សហរដ្ឋអាមេរិក (ប្រវត្តិវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=Co-uVH1Pjzk&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=21', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(388, 6, 7, 'កំណែវិញ្ញាសារទី៥ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=s-AYl9nEBjU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=22', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(389, 6, 4, 'កំណែសំណួរស្វ័យសិក្សា (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=O6ValwF4-2A&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=23', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(390, 6, 6, 'លំហាត់ អាំងឌុចស្យុងអេឡិចត្រូម៉ាញេទិច (រូបវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=7ZWnHebihNg&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=24', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(391, 6, 7, 'វិញ្ញាសារទី៦ ដោះស្រាយសមីការឌីផេរ៉ង់ស្យែល (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=TBp8JrlEAfs&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=25', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(392, 6, 4, 'កំណែកិច្ចការផ្ទះ (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=rA6ECJiU4Bo&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=26', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(393, 6, 4, 'អំណាន ប្រពៃណីខ្មែរនាសម័យអាណានិគមនិយម (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=8RTKkHDaZMk&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=27', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(394, 6, 6, 'លំហាត់ អាំងឌុចស្យុងអេឡិចត្រូម៉ាញេទិច (ត) រូបវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=ux_xuXuD0jM&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=28', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(395, 6, 3, 'មេរៀនទី៣ លំនឹងនៃអាសុីតបាសនិងអំបិល (គីមីវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=fzn9_vpfbgU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=29', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(396, 6, 7, 'កំណែវិញ្ញាសាទី៦ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=YLzn_cTccvs&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=30', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(397, 6, 7, 'វិញ្ញាសារទី៦ (ត) គណិតវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=biSrJBzR1F0&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=31', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(398, 6, 4, 'សំណេរតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=Q8XZPe1qCRs&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=32', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(399, 6, 6, 'លំហាត់ អាំងឌុចស្យុងអេឡិចត្រូម៉ាញេទិច (ត) រូបវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=lnSlAsB5irs&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=33', '2020-08-31 20:21:01', '2020-08-31 20:21:01'),
(400, 6, 3, 'កំណែលំហាត់ (គីមីវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=G9H0evWkc7s&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=35', '2020-08-31 20:21:02', '2020-08-31 20:21:02'),
(401, 6, 5, 'សំណួរត្រៀមប្រលង មេរៀនការសំដែងចេញនៃសែន (ជីវៈវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=xtvPOjVcG94&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=36', '2020-08-31 20:21:02', '2020-08-31 20:21:02'),
(402, 6, 7, 'ដំណោះស្រាយលំហាត់ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=njX6iw6_kCg&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=37', '2020-08-31 20:21:02', '2020-08-31 20:21:02'),
(403, 6, 8, 'លទ្ធិនារីនិងសិទ្ធិកុមារ (សីលធម៌ថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=Lb5dNN5oNhU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=38', '2020-08-31 20:21:02', '2020-08-31 20:21:02'),
(404, 6, 4, 'សំណេរតែងសេចក្តី (ត) ភាសាខ្មែរថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=XiHyW3er2d0&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=39', '2020-08-31 20:21:02', '2020-08-31 20:21:02'),
(405, 6, 4, 'មេរៀនទី៨ កំណាព្យ (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=qP8m3-f-aoE&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=40', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(406, 6, 3, 'មេរៀនទី១ អេស្ទែ ខ្លាញ់និងប្រេង (គីមីវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=QayNnP5zqaI&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=41', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(407, 6, 5, 'កំណែលំហាត់ (ការសំដែងចេញនៃសែន) ជីវៈវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=pGdj_PEe6eo&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=43', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(408, 6, 7, 'ដោះស្រាយសមីការឌីផេរ៉ង់ស្យែល (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=D0v0bSk7DDM&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=44', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(409, 6, 8, 'សិទ្ធិកុមារ (សីលធម៌ថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=LPpnYGTf0U0&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=45', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(410, 6, 2, 'មេរៀនទី១ ប្រព័ន្ធសេដ្ឋកិច្ច-រដ្ឋបាលនិងនយោបាយសហរដ្ឋអាមេរិក (ភូមិវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=qXNlhVV42jw&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=46', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(411, 6, 1, 'មេរៀនទី១ សហរដ្ឋអាមេរិក (តចប់) ប្រវត្តិវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=LsNwyVyMoAc&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=47', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(412, 6, 6, 'កំណែលំហាត់ (រូបវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=G4TYiDQSwWI&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=48', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(413, 6, 4, 'សិក្សាតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=tJJI2RDZ5BA&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=49', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(414, 6, 2, 'មេរៀនទី១ ប្រព័ន្ធសេដ្ឋកិច្ច-រដ្ឋបាលនិងនយោបាយសហរដ្ឋអាមេរិក (ត) ភូមិវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=08SsWiUWubk&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=50', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(415, 6, 1, 'មេរៀនទី២ ចក្រភពអង់គ្លេស (ប្រវត្តវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=ym2kvlVCWSI&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=51', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(416, 6, 7, 'សមីការឌីផេរ៉ង់ស្យែល (តចប់) គណិតវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=9gAmj3JOons&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=52', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(417, 6, 8, 'មេរៀនទី៩ រដ្ឋាភិបាល (តចប់) សីលធម៌ថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=HR5OchSq8WU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=53', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(418, 6, 1, 'មេរៀនទី២ ចក្រភពអង់គ្លេស (ត) ប្រវត្តវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=lC0PmPR1UCw&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=54', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(419, 6, 2, 'ជំពូកទី៣ សេដ្ឋកិច្ចកម្ពុជា (ភូមិវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=yD3Of8wjH6o&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=55', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(420, 6, 3, 'គីមីវិទ្យាថ្នាក់ទី១២ ស្រលាយអាលីផាទិចអាសូត (ត)', 'https://www.youtube.com/watch?v=4Rh3ZGgLtPA&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=56', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(421, 6, 5, 'ជំពូកទី៥ មេរៀនទី១ បណ្តូរឧស្ម័នរបស់សត្វ (ជីវៈវិទ្យាថ្នាក់ទី១១)', 'https://www.youtube.com/watch?v=ZrrlznudB5c&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=57', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(422, 6, 4, 'សិក្សាតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=P2Z7jyqJOB8&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=59', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(423, 6, 6, 'កំណែលំហាត់ (អូតូអាំងឌុចស្យុង) រូបវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=0eDNVz7lyE8&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=60', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(424, 6, 4, 'សិក្សាតែងសេចក្តី (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=u8FMC4Y3rt4&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=61', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(425, 6, 7, 'ដោះស្រាយលំហាត់អនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=OZL4YAYSsGU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=62', '2020-08-31 20:46:23', '2020-08-31 20:46:23'),
(426, 6, 5, 'មេរៀនទី៣ បច្ចេកវិទ្យាជីវៈ (ត) ជីវៈវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=VmbChQIy9uU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=63', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(427, 6, 8, 'មេរៀនទី៩ រដ្ឋាភិបាល (ត) សីលធម៌ថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=2lHpnMd3K_g&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=64', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(428, 6, 7, 'ដោះស្រាយលំហាត់អនុគមន៍ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=-baYaLXqz0I&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=65', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(429, 6, 1, 'មេរៀនទី២ ចក្រភពអង់គ្លេស (ត) ប្រវត្តវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=nkU4gLNhPvI&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=66', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(430, 6, 3, 'មេរៀនទី១ អេស្ទែ ខ្លាញ់និងប្រេង (តចប់) គីមីវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=P_LpPpl_0Xs&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=67', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(431, 6, 2, 'មេរៀនទី២ សហរដ្ឋអាមេរិកគ្រប់គ្រងលំហ (ត) ភូមិវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=YAho742-s8Q&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=68', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(432, 6, 4, 'អំណាន រឿងរាមាយណៈ (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=mCC3jThGZQo&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=70', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(433, 6, 6, 'កំណែលំហាត់ (អូតូអាំងឌុចស្យុង) រូបវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=SHC_j5SyCGw&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=71', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(434, 6, 4, 'មេរៀនទី៩ ទំនាក់ទំនងរវាងអក្សរសិល្ប៍ខ្មែរនិងបរទេស (ភាសាខ្មែរថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=oXIa0vPh60Q&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=72', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(435, 6, 5, 'មេរៀនទី៣ បច្ចេកវិទ្យាជីវៈ (ត) ជីវៈវិទ្យាថ្នាក់ទី១២', 'https://www.youtube.com/watch?v=G4_wOB86EjM&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=73', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(436, 6, 8, 'មេរៀនទី៩ រដ្ឋាភិបាល (សីលធម៌ថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=_fosS8XYxBw&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=74', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(437, 6, 7, 'កំណែវិញ្ញាសាទី៧ (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=EPRdY8o7Y3k&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=75', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(438, 6, 5, 'ជំពូកទី៦ មេរៀនទី១ ទ្រឹស្តីរបស់លោកដាវីន (ជីវៈវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=kxy_RVT4OLY&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=76', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(439, 6, 7, 'កំណែវិញ្ញាសារត្រៀមប្រលងឆមាស (គណិតវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=b1SzjulNUyo&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=77', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(440, 6, 3, 'គីមីវិទ្យាថ្នាក់ទី១២ ស្រលាយអាលីផាទិចអាសូត (ត)', 'https://www.youtube.com/watch?v=I5Rh2JNXdFU&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=78', '2020-08-31 20:46:24', '2020-08-31 20:46:24'),
(441, 6, 9, 'មេរៀនទី៣ ថាមពលផ្សេងៗ (ផែនដីវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=2Fa-ns344tw&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=34', '2020-08-31 20:51:49', '2020-08-31 20:51:49'),
(442, 6, 9, 'មេរៀនទី៤ កំណើនកម្តៅលើពិភពលោក (ផែនដីវិទ្យាថ្នាក់ទី១២)', 'https://www.youtube.com/watch?v=KXxxZe2DEXs&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=42', '2020-08-31 20:51:50', '2020-08-31 20:51:50'),
(443, 6, 9, 'ផែនដីថ្នាក់ទី១២ មេរៀនទី៥ ការបំផ្លាញស្រទាប់អូសូន (ត)', 'https://www.youtube.com/watch?v=sM7ETE_K-Bg&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=58', '2020-08-31 20:51:50', '2020-08-31 20:51:50'),
(444, 6, 9, 'ផែនដីថ្នាក់ទី១២ មេរៀនទី៥ ការបំផ្លាញស្រទាប់អូសូន', 'https://www.youtube.com/watch?v=8ZxnHj3h_Kw&list=PLoYVhXU9mJXCB33R4ljDlPo5puNic4FcL&index=69', '2020-08-31 20:51:50', '2020-08-31 20:51:50'),
(445, 1, 4, 'ភាសាខ្មែរថ្នាក់ទី៧ មេរៀនទី១ សេចក្តីស្រលាញ់', 'https://www.youtube.com/watch?v=5ZeJUazKQn0&list=PLoYVhXU9mJXA3BEqxG_IWNiuHupHnU9nX', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(446, 1, 7, 'គណិតវិទ្យាថ្នាក់ទី៧ មេរៀនទី១ ចំនួនគត់', 'https://www.youtube.com/watch?v=sYxMjhplfwU&list=PLoYVhXU9mJXB4V7kjalIHIXEQp6XYKeN9', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(447, 4, 4, 'ភាសាខ្មែរថ្នាក់ទី១០ រំលឹកមេរៀនអក្សរសិល្ប៍ខ្មែរ', 'https://www.youtube.com/watch?v=Qx4Lb9PALWQ&list=PLoYVhXU9mJXD0YxesYDFrWo164xyzQ5S8', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(448, 5, 4, 'ភាសាខ្មែរថ្នាក់ទី១១ វិធីសាស្រ្តតែងសេចក្តី', 'https://www.youtube.com/watch?v=Ek4iVJrMc3A&list=PLoYVhXU9mJXAbS_iq9wxDWhwAp66mYGMu', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(449, 6, 7, 'គណិតវិទ្យាថ្នាក់ទី១២ មេរៀនទី១ ចំនួនកំុផ្លិច', 'https://www.youtube.com/watch?v=r4VCKSaKn2Q&list=PLoYVhXU9mJXCGOyfVL3J6naPccT_-Xzye', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(450, 5, 6, 'រូបវិទ្យាថ្នាក់ទី១១ មេរៀនទី១ បន្ទុកអគ្គិសនីនិងដែនអគ្គិសនី', 'https://www.youtube.com/watch?v=N6QUedo7VkI&list=PLoYVhXU9mJXDLjeSkDdvyWXJFljYPvSK1', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(451, 2, 7, 'គណិតវិទ្យាថ្នាក់ទី៨ រំលឹកមេរៀនចំនួនគត់រុឺឡាទីប', 'https://www.youtube.com/watch?v=j5_x-1-djzA&list=PLoYVhXU9mJXC6Ya5w8dd3dybqi1VMHeH8', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(452, 4, 6, 'រូបវិទ្យាថ្នាក់ទី១០ វិធីសាស្រ្ត រង្វាស់និងសុវត្ថិភាពពិសោធន៍', 'https://www.youtube.com/watch?v=IbgANgaaMs8&list=PLoYVhXU9mJXB3r_gSDxCYfODe-NDcwRms', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(453, 3, 7, 'គណិតវិទ្យាថ្នាក់ទី៩ រំលឹកមេរៀនស្វ័យគុណ', 'https://www.youtube.com/watch?v=YbIy1jqrUwk&list=PLoYVhXU9mJXD9Sj3bJ_LpvdBkbql7fTVQ', '2020-08-31 21:03:32', '2020-08-31 21:03:32'),
(456, 6, 3, 'គណិតវិទ្យាថ្នាក់ទី១១ ផលបូកតួនៃស្វីតផ្សេងៗ(ត)', 'https://www.youtube.com/watch?v=6SXT8ldpbH0', '2021-01-12 19:13:19', '2021-01-12 19:13:19'),
(457, 2, 1, 'គណិតវិទ្យាថ្នាក់ទី១១ ផលបូកតួនៃស្វីតផ្សេងៗ(ត)', 'https://www.youtube.com/watch?v=6SXT8ldpbH0', '2021-01-12 22:18:03', '2021-01-12 22:18:03');

-- --------------------------------------------------------

--
-- Table structure for table `api_zoom`
--

CREATE TABLE `api_zoom` (
  `id` int(11) NOT NULL,
  `title_zoom` varchar(200) NOT NULL,
  `meet_id` varchar(200) NOT NULL,
  `meet_pw` varchar(200) NOT NULL,
  `link_meet` varchar(200) NOT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_zoom`
--

INSERT INTO `api_zoom` (`id`, `title_zoom`, `meet_id`, `meet_pw`, `link_meet`, `status`, `created_at`, `updated_at`) VALUES
(2, 'ភាសាខ្មែរថ្នាក់ទី១២ សរសេរតាមអាន', '82639202857', '0j9MZw', '', 0, '2020-12-01 10:11:18', '2020-12-01 10:11:18'),
(3, 'ប្រវត្តិទី១២ ', '87169623150', 'xXjw6U', '', 0, '2020-12-01 10:24:59', '2020-12-01 10:24:59'),
(4, 'Grade Math 12', '81431596318', '4eRKt8', '', 0, '2020-12-02 08:16:57', '2020-12-02 08:16:57'),
(5, 'Physical 07', '85569247823', '21aweq', '', 0, '2020-12-03 07:41:42', '2020-12-03 07:41:42'),
(6, 'គណិតវិទ្យាថ្នាក់ទី 12', '855895840', 'q234ie', '', 0, '2020-12-03 09:46:28', '2020-12-03 09:46:28'),
(7, 'គីមីវិទ្យាថ្នាក់ទី 9', '855963485', '4eq3q2', '', 0, '2020-12-03 09:47:12', '2020-12-03 09:47:12'),
(8, 'ភាសាខ្មែរថ្នាក់ទី11 សរសេរតាមអាន', '8785045890', 'qe2123', '', 0, '2020-12-04 04:06:17', '2020-12-04 04:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `date` date NOT NULL,
  `deleted` int(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `class_id`, `status`, `date`, `deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 2, '2019-12-23', 0, NULL, NULL, '2019-12-23 02:34:01', '2019-12-23 04:05:24'),
(2, 2, 4, 2, '2019-12-23', 0, NULL, NULL, '2019-12-23 02:34:01', '2019-12-23 04:02:01'),
(3, 1, 1, 1, '2019-12-23', 0, NULL, NULL, '2019-12-23 03:45:04', '2019-12-23 04:02:32'),
(4, 2, 1, 1, '2019-12-23', 0, NULL, NULL, '2019-12-23 03:45:04', '2019-12-23 04:02:32'),
(5, 1, 4, 2, '2019-12-24', 0, 1, NULL, '2019-12-24 02:18:57', '2019-12-24 02:18:57'),
(6, 2, 4, 1, '2019-12-24', 0, 1, NULL, '2019-12-24 02:18:57', '2019-12-24 02:18:57'),
(7, 1, 6, 0, '2019-12-25', 0, 6, 6, '2019-12-25 01:43:33', '2019-12-25 01:43:52'),
(8, 2, 6, 0, '2019-12-25', 0, 6, 6, '2019-12-25 01:43:33', '2019-12-25 01:43:53'),
(9, 1, 4, 0, '2019-12-25', 0, 1, NULL, '2019-12-25 02:37:48', '2019-12-25 02:37:48'),
(10, 2, 4, 2, '2019-12-25', 0, 1, NULL, '2019-12-25 02:37:48', '2019-12-25 02:37:48'),
(11, 1, 6, 1, '2020-02-06', 0, 16, NULL, '2020-02-05 21:53:50', '2020-02-05 21:53:50'),
(12, 2, 6, 1, '2020-02-06', 0, 16, NULL, '2020-02-05 21:53:50', '2020-02-05 21:53:50'),
(13, 1, 1, 1, '2020-02-13', 0, 10, 10, '2020-02-12 18:41:11', '2020-02-12 18:41:34'),
(14, 2, 1, 1, '2020-02-13', 0, 10, 10, '2020-02-12 18:41:11', '2020-02-12 18:41:34'),
(15, 5, 7, 2, '2020-02-18', 0, 18, 18, '2020-02-17 19:09:11', '2020-02-17 19:09:35'),
(16, 6, 7, 2, '2020-02-18', 0, 18, 18, '2020-02-17 19:09:11', '2020-02-17 19:09:36'),
(17, 1, 6, 0, '2020-02-19', 0, 18, 18, '2020-02-18 18:54:35', '2020-02-18 18:56:48'),
(18, 2, 6, 2, '2020-02-19', 0, 18, 18, '2020-02-18 18:54:35', '2020-02-18 18:55:56'),
(19, 531, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:11'),
(20, 510, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:11'),
(21, 522, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:11'),
(22, 501, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(23, 518, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(24, 514, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(25, 508, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(26, 515, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(27, 525, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(28, 513, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(29, 528, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(30, 502, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(31, 517, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:25', '2020-05-13 01:24:12'),
(32, 519, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(33, 503, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(34, 521, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(35, 504, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(36, 526, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(37, 506, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(38, 511, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(39, 516, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(40, 523, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(41, 505, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(42, 500, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(43, 524, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:12'),
(44, 520, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:13'),
(45, 512, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:13'),
(46, 507, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:13'),
(47, 527, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:13'),
(48, 529, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:13'),
(49, 509, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:13'),
(50, 530, 15, 1, '2020-05-13', 0, 17, 17, '2020-05-13 01:23:26', '2020-05-13 01:24:13'),
(51, 859, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:14', '2020-05-18 02:50:06'),
(52, 833, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:14', '2020-05-18 02:50:06'),
(53, 844, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:14', '2020-05-18 02:50:06'),
(54, 849, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:06'),
(55, 851, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(56, 836, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(57, 841, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(58, 837, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(59, 846, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(60, 838, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(61, 843, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(62, 850, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(63, 834, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(64, 840, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(65, 845, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(66, 835, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(67, 848, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(68, 842, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(69, 847, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(70, 852, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(71, 853, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(72, 854, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(73, 855, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:07'),
(74, 856, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:08'),
(75, 857, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:15', '2020-05-18 02:50:08'),
(76, 858, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:16', '2020-05-18 02:50:08'),
(77, 839, 1, 1, '2020-05-18', 0, 17, 17, '2020-05-18 01:09:16', '2020-05-18 02:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE `campus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `campus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`id`, `name`, `name_en`, `created_at`, `updated_at`, `deleted`, `campus_id`) VALUES
(1, 'រំចេក ៤', 'Romchek 4', '2019-12-12 20:26:48', '2019-12-24 02:59:07', 0, 0),
(2, 'អូចារ', 'Ochar', '2019-12-24 19:36:20', '2019-12-24 19:36:20', 0, 0),
(3, 'បន្ទាយមានជ័យ', 'Banteay Meanchey', '2019-12-24 19:36:56', '2019-12-24 19:36:56', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `study_time` varchar(255) DEFAULT NULL,
  `deleted` int(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `academic_year_id`, `classroom_id`, `curriculum_id`, `campus_id`, `grade_id`, `study_time`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 13, '7:00 Am - 12:00 Pm', 0, '2020-05-11 19:07:00', '2020-05-21 20:10:12'),
(2, 1, 1, 1, 1, 14, '7:00 Am - 12:00 Pm', 0, '2020-05-11 19:07:18', '2020-05-11 19:07:18'),
(3, 1, 1, 1, 1, 18, '7:00 Am - 12:00 Pm', 0, '2020-05-11 19:07:48', '2020-05-11 19:07:48'),
(4, 1, 1, 1, 1, 19, '7:00 Am - 12:00 Pm', 0, '2020-05-11 19:34:09', '2020-05-11 19:34:09'),
(5, 1, 1, 1, 1, 11, '7:00 Am - 12:00 Pm', 0, '2020-05-11 19:43:45', '2020-05-11 19:43:45'),
(6, 1, 1, 1, 1, 12, '7:00 Am - 12:00 Pm', 0, '2020-05-11 19:44:02', '2020-05-11 19:44:02'),
(7, 1, 1, 1, 1, 17, '7:00 Am - 12:00 Pm', 0, '2020-05-11 19:44:35', '2020-05-11 19:44:35'),
(8, 1, 1, 1, 1, 9, '7:00 Am - 12:00 Pm', 0, '2020-05-11 20:04:58', '2020-05-11 20:04:58'),
(9, 1, 1, 1, 1, 10, '7:00 Am - 12:00 Pm', 0, '2020-05-11 20:05:15', '2020-05-11 20:05:15'),
(10, 1, 1, 1, 1, 16, '7:00 Am - 12:00 Pm', 0, '2020-05-11 20:05:34', '2020-05-11 20:05:34'),
(11, 1, 1, 1, 1, 7, '7:00 Am - 12:00 Pm', 0, '2020-05-11 20:45:00', '2020-05-11 20:45:00'),
(12, 1, 1, 1, 1, 8, '7:00 Am - 12:00 Pm', 0, '2020-05-11 20:45:19', '2020-05-11 20:45:19'),
(13, 1, 1, 1, 1, 15, '7:00 Am - 12:00 Pm', 0, '2020-05-11 20:45:52', '2020-05-11 20:45:52'),
(14, 1, 1, 1, 1, 4, '7:00 Am - 12:00 Pm', 0, '2020-05-11 21:26:27', '2020-05-12 19:12:49'),
(15, 1, 1, 1, 1, 5, '7:00 Am - 12:00 Pm', 0, '2020-05-11 21:26:43', '2020-05-11 21:26:43'),
(16, 1, 1, 1, 1, 6, '7:00 Am - 12:00 Pm', 0, '2020-05-11 21:27:01', '2020-05-11 21:27:01'),
(17, 1, 1, 1, 1, 1, '7:00 Am - 12:00 Pm', 0, '2020-05-12 00:34:36', '2020-05-12 00:34:36'),
(18, 1, 1, 1, 1, 2, '7:00 Am - 12:00 Pm', 0, '2020-05-12 00:34:46', '2020-05-12 00:34:46'),
(19, 1, 1, 1, 1, 3, '7:00 Am - 12:00 Pm', 0, '2020-05-12 00:34:57', '2020-05-12 00:34:57'),
(20, 1, 2, 2, 1, 1, 'TIme 7', 0, '2020-05-27 18:46:51', '2020-05-27 18:47:40'),
(21, 4, 2, 3, 1, 2, '7-8', 0, '2021-01-10 20:36:51', '2021-01-10 20:36:51'),
(22, 3, 2, 2, 1, 24, '88', 0, '2021-03-16 00:53:14', '2021-03-16 00:53:14'),
(23, 1, 1, 2, 1, 24, '7-12', 0, '2021-04-22 02:09:07', '2021-04-22 02:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`id`, `name`, `deleted`, `created_at`, `updated_at`, `campus_id`) VALUES
(1, 'Online Class', 0, '2020-04-14 20:11:39', '2020-05-12 18:43:27', 1),
(2, '108', 0, '2020-04-14 20:11:45', '2020-04-14 20:11:45', 1),
(3, '204', 0, '2020-04-14 20:11:50', '2020-04-14 20:11:50', 1),
(4, '205', 0, '2020-04-21 19:00:56', '2020-04-21 19:00:56', 1),
(5, '207', 0, '2020-04-21 19:01:02', '2020-04-21 19:01:02', 1),
(6, '209', 0, '2020-04-21 19:01:10', '2020-04-21 19:01:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`id`, `name`, `deleted`) VALUES
(1, 'កម្មវិធីជាតិ', 0),
(2, 'American Curriculum', 0),
(3, 'Foreign Language Academy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `discount_pay`
--

CREATE TABLE `discount_pay` (
  `id` int(11) NOT NULL,
  `discount_name` varchar(250) NOT NULL,
  `percent_dis` float NOT NULL,
  `from_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discount_pay`
--

INSERT INTO `discount_pay` (`id`, `discount_name`, `percent_dis`, `from_date`, `exp_date`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Promotion covid 19', 20, '2020-11-08', '2020-11-29', 'Covid', 0, '2020-11-10 09:34:21', '2020-11-10 09:34:21'),
(2, 'Both Elite', 20, '2020-10-28', '2020-11-24', 'Both Elite', 0, '2020-11-10 10:29:18', '2020-11-10 10:29:18'),
(3, 'Covid 19  promotion', 30, '2020-11-02', '2020-11-30', '30% of covid 19 promotion', 0, '2020-11-10 10:33:57', '2020-11-10 10:33:57'),
(4, 'DIS Both', 50, '2020-09-09', '2020-11-13', '30% of covid 19 promotion', 0, '2020-11-10 10:43:24', '2020-11-10 10:43:24'),
(5, 'Promotion 2022  New Discount', 20, '2020-09-16', '2020-11-13', 'Promotion 2022', 0, '2020-11-12 08:24:00', '2020-11-12 08:24:00'),
(6, 'Promotion Online Class Covid 19', 30, '2020-09-25', '2020-11-28', 'Promotion Online Class Covid 19', 0, '2020-11-12 09:40:50', '2020-11-12 09:40:50'),
(7, 'ក្រសួង', 20, '2020-11-09', '2020-11-25', NULL, 1, '2020-11-19 08:58:19', '2020-11-19 08:58:19'),
(8, 'Promotion for DIS Both', 50, '2020-12-28', '2020-12-31', 'Promotion 50% for Both DIS', 0, '2020-12-28 01:49:45', '2020-12-28 01:49:45'),
(9, 'Promotion Discount  By CEO', 70, '2021-02-08', '2021-02-19', 'By CEO', 0, '2021-02-17 02:44:12', '2021-02-17 02:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cur_id` int(11) NOT NULL,
  `deleted` int(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `name`, `cur_id`, `deleted`, `created_at`, `updated_at`, `campus_id`) VALUES
(1, '7ក', 1, 0, '2020-04-14 20:09:15', '2020-05-11 19:02:27', 1),
(2, '7ខ', 1, 0, '2020-04-14 20:09:22', '2020-05-11 19:02:34', 1),
(3, '7គ', 1, 0, '2020-04-14 20:09:34', '2020-05-11 19:02:41', 1),
(4, '8ក', 1, 0, '2020-04-14 20:09:41', '2020-05-11 19:02:48', 1),
(5, '8ខ', 1, 0, '2020-04-14 20:09:53', '2020-05-11 19:02:59', 1),
(6, '8​ គ', 1, 0, '2020-04-14 20:10:00', '2020-05-11 19:03:09', 1),
(7, '9 ក', 1, 0, '2020-04-21 18:58:36', '2020-05-11 19:03:35', 1),
(8, '9​ ខ', 1, 0, '2020-04-21 18:58:44', '2020-05-11 19:03:46', 1),
(9, '10 ក', 1, 0, '2020-04-21 18:58:54', '2020-05-11 19:03:57', 1),
(10, '10 ខ', 1, 0, '2020-04-21 18:59:02', '2020-05-11 19:04:04', 1),
(11, '11 ក', 1, 0, '2020-04-21 18:59:10', '2020-05-11 19:04:32', 1),
(12, '11 ខ', 1, 0, '2020-04-21 18:59:16', '2020-05-11 19:04:40', 1),
(13, '12 ក', 1, 0, '2020-04-21 18:59:23', '2020-05-11 19:04:49', 1),
(14, '12 ខ', 1, 0, '2020-04-21 18:59:30', '2020-05-11 19:04:58', 1),
(15, '9 គ', 1, 0, '2020-05-11 19:05:17', '2020-05-11 19:05:17', 1),
(16, '10 គ', 1, 0, '2020-05-11 19:05:27', '2020-05-11 19:05:27', 1),
(17, '11 គ', 1, 0, '2020-05-11 19:05:47', '2020-05-11 19:05:47', 1),
(18, '12 គ', 1, 0, '2020-05-11 19:05:56', '2020-05-11 19:05:56', 1),
(19, '12 ឃ', 1, 0, '2020-05-11 19:33:43', '2020-05-11 19:33:43', 1),
(20, '១ ក', 1, 0, NULL, NULL, 0),
(21, '២ ក', 1, 0, NULL, NULL, 0),
(22, '៣ ក', 1, 0, '2020-06-08 17:00:00', NULL, 0),
(23, 'LV 4', 3, 0, '2021-01-11 00:50:25', '2021-01-11 00:50:25', 1),
(24, '3 A', 2, 0, '2021-01-12 02:07:40', '2021-01-12 02:07:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_number` int(150) NOT NULL,
  `invoice_text` text DEFAULT NULL,
  `cam_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `invoice_number`, `invoice_text`, `cam_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1000, NULL, 1, 0, '2021-02-07 19:12:08', '2021-02-07 19:12:08'),
(2, 1001, NULL, 1, 0, '2021-02-11 03:02:21', '2021-02-11 03:02:21'),
(3, 1002, NULL, 1, 0, '2021-02-14 20:11:08', '2021-02-14 20:11:08'),
(4, 1003, NULL, 1, 0, '2021-02-16 19:06:25', '2021-02-16 19:06:25'),
(5, 1004, NULL, 1, 0, '2021-02-16 19:51:04', '2021-02-16 19:51:04'),
(6, 1005, NULL, 1, 0, '2021-02-16 19:51:47', '2021-02-16 19:51:47'),
(7, 1006, NULL, 1, 0, '2021-02-16 19:58:15', '2021-02-16 19:58:15'),
(8, 1007, NULL, 1, 0, '2021-02-16 20:06:03', '2021-02-16 20:06:03'),
(9, 1008, NULL, 1, 0, '2021-02-18 01:10:59', '2021-02-18 01:10:59'),
(10, 1009, NULL, 1, 0, '2021-02-18 01:12:23', '2021-02-18 01:12:23'),
(11, 1010, NULL, 1, 0, '2021-02-19 01:19:40', '2021-02-19 01:19:40'),
(12, 1011, NULL, 1, 0, '2021-02-21 20:55:11', '2021-02-21 20:55:11'),
(13, 1012, NULL, 1, 0, '2021-02-22 00:46:54', '2021-02-22 00:46:54'),
(14, 1013, NULL, 1, 0, '2021-02-25 09:51:08', '2021-02-25 09:51:08'),
(15, 1014, NULL, 1, 0, '2021-02-26 03:06:21', '2021-02-26 03:06:21'),
(16, 1015, NULL, 1, 0, '2021-02-26 04:42:16', '2021-02-26 04:42:16'),
(17, 1016, NULL, 1, 0, '2021-03-01 04:35:58', '2021-03-01 04:35:58'),
(18, 1017, NULL, 1, 0, '2021-03-01 10:35:32', '2021-03-01 10:35:32'),
(19, 1018, NULL, 1, 0, '2021-03-15 08:21:39', '2021-03-15 08:21:39'),
(20, 1018, NULL, 1, 0, '2021-03-15 08:24:52', '2021-03-15 08:24:52'),
(21, 1019, NULL, 1, 0, '2021-03-15 08:26:23', '2021-03-15 08:26:23'),
(22, 1020, NULL, 1, 0, '2021-03-15 08:28:18', '2021-03-15 08:28:18'),
(23, 1021, NULL, 1, 0, '2022-04-19 02:09:41', '2022-04-19 02:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `logged_user`
--

CREATE TABLE `logged_user` (
  `id` int(11) NOT NULL,
  `activity` varchar(250) NOT NULL,
  `ip_address` varchar(120) NOT NULL,
  `user_agent` varchar(120) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `url` varchar(150) NOT NULL,
  `date_time` datetime NOT NULL,
  `camp_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logged_user`
--

INSERT INTO `logged_user` (`id`, `activity`, `ip_address`, `user_agent`, `user_id`, `username`, `url`, `date_time`, `camp_id`, `created_at`, `updated_at`) VALUES
(1, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-15 11:44:20', 1, '2021-03-15 04:44:20', '2021-03-15 04:44:20'),
(2, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-15 11:44:27', 1, '2021-03-15 04:44:27', '2021-03-15 04:44:27'),
(3, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-03-15 12:03:51', 1, '2021-03-15 05:03:51', '2021-03-15 05:03:51'),
(4, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-03-15 02:41:17', 1, '2021-03-14 19:41:17', '2021-03-15 07:41:17'),
(5, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-15 02:41:27', 1, '2021-03-14 19:41:27', '2021-03-15 07:41:27'),
(6, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-15 03:21:16', 1, '2021-03-14 20:21:16', '2021-03-15 08:21:16'),
(7, 'Save Payment Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/save_payment', '2021-03-15 03:21:39', 1, '2021-03-14 20:21:39', '2021-03-15 08:21:39'),
(8, 'Save Payment Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/save_payment', '2021-03-15 03:24:52', 1, '2021-03-14 20:24:52', '2021-03-15 08:24:52'),
(9, 'Save Payment Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/save_payment', '2021-03-15 03:26:23', 1, '2021-03-14 20:26:23', '2021-03-15 08:26:23'),
(10, 'Save Payment Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/save_payment', '2021-03-15 03:28:18', 1, '2021-03-14 20:28:18', '2021-03-15 08:28:18'),
(11, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-16 08:28:11', 1, '2021-03-16 01:28:11', '2021-03-16 01:28:11'),
(12, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-16 08:41:46', 1, '2021-03-16 01:41:46', '2021-03-16 01:41:46'),
(13, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-16 08:42:05', 1, '2021-03-16 01:42:05', '2021-03-16 01:42:05'),
(14, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-16 10:15:37', 1, '2021-03-16 03:15:37', '2021-03-16 03:15:37'),
(15, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-16 02:51:20', 1, '2021-03-15 19:51:20', '2021-03-16 07:51:20'),
(16, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 15, 'fla_staff', 'http://localhost:8000/login', '2021-03-16 03:16:36', 1, '2021-03-15 20:16:36', '2021-03-16 08:16:36'),
(17, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-16 03:19:03', 1, '2021-03-15 20:19:03', '2021-03-16 08:19:03'),
(18, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.86 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-16 03:50:54', 1, '2021-03-15 20:50:54', '2021-03-16 08:50:54'),
(19, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-17 08:34:14', 1, '2021-03-17 01:34:14', '2021-03-17 01:34:14'),
(20, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-17 08:46:35', 1, '2021-03-17 01:46:35', '2021-03-17 01:46:35'),
(21, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-17 08:52:37', 1, '2021-03-17 01:52:37', '2021-03-17 01:52:37'),
(22, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-17 08:54:50', 1, '2021-03-17 01:54:50', '2021-03-17 01:54:50'),
(23, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-17 09:21:45', 1, '2021-03-17 02:21:45', '2021-03-17 02:21:45'),
(24, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-17 02:42:25', 1, '2021-03-16 19:42:25', '2021-03-17 07:42:25'),
(25, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-18 08:32:55', 1, '2021-03-18 01:32:55', '2021-03-18 01:32:55'),
(26, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-18 08:33:05', 1, '2021-03-18 01:33:05', '2021-03-18 01:33:05'),
(27, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-18 11:57:34', 1, '2021-03-18 04:57:34', '2021-03-18 04:57:34'),
(28, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-18 11:57:53', 1, '2021-03-18 04:57:53', '2021-03-18 04:57:53'),
(29, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-18 02:17:24', 1, '2021-03-17 19:17:24', '2021-03-18 07:17:24'),
(30, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-18 03:49:42', 1, '2021-03-17 20:49:42', '2021-03-18 08:49:42'),
(31, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-18 03:50:15', 1, '2021-03-17 20:50:15', '2021-03-18 08:50:15'),
(32, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-19 08:18:57', 1, '2021-03-19 01:18:57', '2021-03-19 01:18:57'),
(33, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-19 02:13:46', 1, '2021-03-18 19:13:46', '2021-03-19 07:13:46'),
(34, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-19 05:28:56', 1, '2021-03-18 22:28:56', '2021-03-19 10:28:56'),
(35, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-19 05:30:28', 1, '2021-03-18 22:30:28', '2021-03-19 10:30:28'),
(36, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-22 08:24:34', 1, '2021-03-22 01:24:34', '2021-03-22 01:24:34'),
(37, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-22 08:25:00', 1, '2021-03-22 01:25:00', '2021-03-22 01:25:00'),
(38, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-22 03:44:32', 1, '2021-03-21 20:44:32', '2021-03-22 08:44:32'),
(39, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-23 08:20:58', 1, '2021-03-23 01:20:58', '2021-03-23 01:20:58'),
(40, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-23 01:58:04', 1, '2021-03-22 18:58:04', '2021-03-23 06:58:04'),
(41, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-24 08:28:32', 1, '2021-03-24 01:28:32', '2021-03-24 01:28:32'),
(42, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-24 11:16:14', 1, '2021-03-24 04:16:14', '2021-03-24 04:16:14'),
(43, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-24 02:49:46', 1, '2021-03-23 19:49:46', '2021-03-24 07:49:46'),
(44, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-25 08:26:36', 1, '2021-03-25 01:26:36', '2021-03-25 01:26:36'),
(45, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-25 04:26:48', 1, '2021-03-24 21:26:48', '2021-03-25 09:26:48'),
(46, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-26 08:12:23', 1, '2021-03-26 01:12:23', '2021-03-26 01:12:23'),
(47, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 08:12:26', 1, '2021-03-29 01:12:26', '2021-03-29 01:12:27'),
(48, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-29 08:19:19', 1, '2021-03-29 01:19:19', '2021-03-29 01:19:19'),
(49, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 08:20:52', 1, '2021-03-29 01:20:52', '2021-03-29 01:20:52'),
(50, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-29 08:26:15', 1, '2021-03-29 01:26:15', '2021-03-29 01:26:15'),
(51, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 09:03:37', 1, '2021-03-29 02:03:37', '2021-03-29 02:03:37'),
(52, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-29 09:04:22', 1, '2021-03-29 02:04:22', '2021-03-29 02:04:22'),
(53, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 09:38:43', 1, '2021-03-29 02:38:43', '2021-03-29 02:38:43'),
(54, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-29 09:38:56', 1, '2021-03-29 02:38:56', '2021-03-29 02:38:56'),
(55, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 09:41:09', 1, '2021-03-29 02:41:09', '2021-03-29 02:41:09'),
(56, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-29 09:43:42', 1, '2021-03-29 02:43:42', '2021-03-29 02:43:42'),
(57, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 09:45:01', 1, '2021-03-29 02:45:01', '2021-03-29 02:45:01'),
(58, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 09:45:33', 1, '2021-03-29 02:45:33', '2021-03-29 02:45:33'),
(59, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-29 10:01:06', 1, '2021-03-29 03:01:06', '2021-03-29 03:01:06'),
(60, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-03-29 10:01:18', 1, '2021-03-29 03:01:18', '2021-03-29 03:01:18'),
(61, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-29 10:01:35', 1, '2021-03-29 03:01:35', '2021-03-29 03:01:35'),
(62, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 08:11:46', 1, '2021-03-30 01:11:46', '2021-03-30 01:11:46'),
(63, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-30 09:50:55', 1, '2021-03-30 02:50:55', '2021-03-30 02:50:55'),
(64, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 09:51:34', 1, '2021-03-30 02:51:34', '2021-03-30 02:51:34'),
(65, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-30 09:54:47', 1, '2021-03-30 02:54:47', '2021-03-30 02:54:47'),
(66, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 09:55:56', 1, '2021-03-30 02:55:56', '2021-03-30 02:55:56'),
(67, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-03-30 10:05:25', 1, '2021-03-30 03:05:25', '2021-03-30 03:05:25'),
(68, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 10:31:14', 1, '2021-03-30 03:31:14', '2021-03-30 03:31:14'),
(69, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-03-30 10:36:59', 1, '2021-03-30 03:36:59', '2021-03-30 03:36:59'),
(70, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 10:40:41', 1, '2021-03-30 03:40:41', '2021-03-30 03:40:41'),
(71, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-03-30 10:48:47', 1, '2021-03-30 03:48:47', '2021-03-30 03:48:47'),
(72, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 10:54:55', 1, '2021-03-30 03:54:55', '2021-03-30 03:54:55'),
(73, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-03-30 11:00:41', 1, '2021-03-30 04:00:41', '2021-03-30 04:00:41'),
(74, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 11:19:06', 1, '2021-03-30 04:19:06', '2021-03-30 04:19:06'),
(75, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 15, 'fla_staff', 'http://localhost:8000/login', '2021-03-30 11:35:18', 1, '2021-03-30 04:35:18', '2021-03-30 04:35:18'),
(76, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 11:35:48', 1, '2021-03-30 04:35:48', '2021-03-30 04:35:48'),
(77, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 02:02:28', 1, '2021-03-29 19:02:28', '2021-03-30 07:02:28'),
(78, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-30 03:04:13', 1, '2021-03-29 20:04:13', '2021-03-30 08:04:13'),
(79, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-31 08:14:51', 1, '2021-03-31 01:14:51', '2021-03-31 01:14:51'),
(80, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-31 02:00:57', 1, '2021-03-30 19:00:57', '2021-03-31 07:00:57'),
(81, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-31 03:24:45', 1, '2021-03-30 20:24:45', '2021-03-31 08:24:45'),
(82, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-03-31 06:03:06', 1, '2021-03-30 23:03:06', '2021-03-31 11:03:06'),
(83, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-01 08:12:54', 1, '2021-04-01 01:12:54', '2021-04-01 01:12:54'),
(84, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-01 01:59:24', 1, '2021-03-31 18:59:24', '2021-04-01 06:59:24'),
(85, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-02 08:56:09', 1, '2021-04-02 01:56:09', '2021-04-02 01:56:09'),
(86, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.105 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-02 05:08:41', 1, '2021-04-01 22:08:41', '2021-04-02 10:08:41'),
(87, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-05 08:23:19', 1, '2021-04-05 01:23:19', '2021-04-05 01:23:19'),
(88, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-04-05 08:42:47', 1, '2021-04-05 01:42:47', '2021-04-05 01:42:47'),
(89, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-05 08:43:10', 1, '2021-04-05 01:43:10', '2021-04-05 01:43:10'),
(90, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-05 12:04:46', 1, '2021-04-05 05:04:46', '2021-04-05 05:04:46'),
(91, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-05 05:08:37', 1, '2021-04-04 22:08:37', '2021-04-05 10:08:37'),
(92, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-06 10:21:14', 1, '2021-04-06 03:21:14', '2021-04-06 03:21:14'),
(93, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-07 08:45:13', 1, '2021-04-07 01:45:13', '2021-04-07 01:45:13'),
(94, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-07 03:37:42', 1, '2021-04-06 20:37:42', '2021-04-07 08:37:42'),
(95, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-08 08:54:50', 1, '2021-04-08 01:54:50', '2021-04-08 01:54:50'),
(96, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-08 05:36:09', 1, '2021-04-07 22:36:09', '2021-04-08 10:36:09'),
(97, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-09 08:22:28', 1, '2021-04-09 01:22:28', '2021-04-09 01:22:28'),
(98, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-12 08:15:43', 1, '2021-04-12 01:15:43', '2021-04-12 01:15:43'),
(99, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-04-12 12:00:25', 1, '2021-04-12 05:00:25', '2021-04-12 05:00:25'),
(100, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-12 02:24:17', 1, '2021-04-11 19:24:17', '2021-04-12 07:24:17'),
(101, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-19 08:15:30', 1, '2021-04-19 01:15:30', '2021-04-19 01:15:30'),
(102, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-20 08:12:57', 1, '2021-04-20 01:12:57', '2021-04-20 01:12:57'),
(103, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-21 08:24:11', 1, '2021-04-21 01:24:11', '2021-04-21 01:24:11'),
(104, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-21 02:58:32', 1, '2021-04-20 19:58:32', '2021-04-21 07:58:32'),
(105, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 08:27:05', 1, '2021-04-22 01:27:05', '2021-04-22 01:27:05'),
(106, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 02:56:15', 1, '2021-04-21 19:56:15', '2021-04-22 07:56:15'),
(107, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 03:15:45', 1, '2021-04-21 20:15:45', '2021-04-22 08:15:45'),
(108, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 03:41:11', 1, '2021-04-21 20:41:11', '2021-04-22 08:41:11'),
(109, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-04-22 03:42:29', 1, '2021-04-21 20:42:29', '2021-04-22 08:42:29'),
(110, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 03:50:23', 1, '2021-04-21 20:50:23', '2021-04-22 08:50:23'),
(111, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-04-22 03:55:32', 1, '2021-04-21 20:55:32', '2021-04-22 08:55:32'),
(112, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 04:00:14', 1, '2021-04-21 21:00:14', '2021-04-22 09:00:14'),
(113, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 15, 'fla_staff', 'http://localhost:8000/login', '2021-04-22 04:02:36', 1, '2021-04-21 21:02:36', '2021-04-22 09:02:36'),
(114, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-04-22 04:03:05', 1, '2021-04-21 21:03:05', '2021-04-22 09:03:05'),
(115, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 04:03:14', 1, '2021-04-21 21:03:14', '2021-04-22 09:03:14'),
(116, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-04-22 04:08:05', 1, '2021-04-21 21:08:05', '2021-04-22 09:08:05'),
(117, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 04:27:14', 1, '2021-04-21 21:27:14', '2021-04-22 09:27:14'),
(118, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-04-22 04:31:56', 1, '2021-04-21 21:31:56', '2021-04-22 09:31:56'),
(119, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 04:40:09', 1, '2021-04-21 21:40:09', '2021-04-22 09:40:09'),
(120, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-04-22 04:40:26', 1, '2021-04-21 21:40:26', '2021-04-22 09:40:26'),
(121, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 04:47:24', 1, '2021-04-21 21:47:24', '2021-04-22 09:47:24'),
(122, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-04-22 05:35:17', 1, '2021-04-21 22:35:17', '2021-04-22 10:35:17'),
(123, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-22 05:50:34', 1, '2021-04-21 22:50:34', '2021-04-22 10:50:34'),
(124, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-23 08:34:24', 1, '2021-04-23 01:34:24', '2021-04-23 01:34:24'),
(125, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-23 02:57:07', 1, '2021-04-22 19:57:07', '2021-04-23 07:57:07'),
(126, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-04-23 05:11:36', 1, '2021-04-22 22:11:36', '2021-04-23 10:11:36'),
(127, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-04-23 05:25:30', 1, '2021-04-22 22:25:30', '2021-04-23 10:25:30'),
(128, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-23 05:25:55', 1, '2021-04-22 22:25:55', '2021-04-23 10:25:55'),
(129, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-27 08:19:11', 1, '2021-04-27 01:19:11', '2021-04-27 01:19:11'),
(130, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-04-27 08:32:16', 1, '2021-04-27 01:32:16', '2021-04-27 01:32:16'),
(131, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-27 08:32:49', 1, '2021-04-27 01:32:49', '2021-04-27 01:32:49'),
(132, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-04-27 11:33:11', 1, '2021-04-27 04:33:11', '2021-04-27 04:33:11'),
(133, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-27 11:34:10', 1, '2021-04-27 04:34:10', '2021-04-27 04:34:10'),
(134, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-27 02:08:20', 1, '2021-04-26 19:08:20', '2021-04-27 07:08:20'),
(135, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-27 03:10:58', 1, '2021-04-26 20:10:58', '2021-04-27 08:10:58'),
(136, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-28 08:24:03', 1, '2021-04-28 01:24:03', '2021-04-28 01:24:03'),
(137, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-28 11:01:10', 1, '2021-04-28 04:01:10', '2021-04-28 04:01:10'),
(138, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-28 01:55:20', 1, '2021-04-27 18:55:20', '2021-04-28 06:55:20'),
(139, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-04-29 08:19:44', 1, '2021-04-29 01:19:44', '2021-04-29 01:19:44'),
(140, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-05-21 10:03:44', 1, '2021-05-21 03:03:44', '2021-05-21 03:03:44'),
(141, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-05-21 10:04:31', 1, '2021-05-21 03:04:31', '2021-05-21 03:04:31'),
(142, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-05-21 10:04:56', 1, '2021-05-21 03:04:56', '2021-05-21 03:04:56'),
(143, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 15, 'fla_staff', 'http://localhost:8000/login', '2021-05-21 10:05:09', 1, '2021-05-21 03:05:09', '2021-05-21 03:05:09'),
(144, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 27, 'ac_admin', 'http://localhost:8000/login', '2021-05-21 10:05:28', 1, '2021-05-21 03:05:28', '2021-05-21 03:05:28'),
(145, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-05-21 10:07:53', 1, '2021-05-21 03:07:53', '2021-05-21 03:07:53'),
(146, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-08-30 09:58:50', 1, '2021-08-30 02:58:50', '2021-08-30 02:58:50'),
(147, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-08-30 09:59:44', 1, '2021-08-30 02:59:44', '2021-08-30 02:59:44'),
(148, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-08-30 10:08:10', 1, '2021-08-30 03:08:10', '2021-08-30 03:08:10'),
(149, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 30, 'ac_staff', 'http://localhost:8000/login', '2021-08-30 10:12:11', 1, '2021-08-30 03:12:11', '2021-08-30 03:12:11'),
(150, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 15, 'fla_staff', 'http://localhost:8000/login', '2021-08-30 11:13:38', 1, '2021-08-30 04:13:38', '2021-08-30 04:13:38'),
(151, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-08-30 11:14:37', 1, '2021-08-30 04:14:37', '2021-08-30 04:14:37'),
(152, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-08-30 02:16:07', 1, '2021-08-29 19:16:07', '2021-08-30 07:16:07'),
(153, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-11-01 04:11:50', 1, '2021-10-31 21:11:50', '2021-11-01 09:11:50'),
(154, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-11-01 04:15:50', 1, '2021-10-31 21:15:50', '2021-11-01 09:15:50'),
(155, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-11-01 04:18:36', 1, '2021-10-31 21:18:36', '2021-11-01 09:18:36'),
(156, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1, 'sela', 'http://localhost:8000/login', '2021-11-01 04:20:06', 1, '2021-10-31 21:20:06', '2021-11-01 09:20:06'),
(157, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2021-11-02 04:42:45', 1, '2021-11-01 21:42:45', '2021-11-02 09:42:45'),
(158, 'Login Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/login', '2022-04-19 09:08:26', 1, '2022-04-19 02:08:26', '2022-04-19 02:08:26'),
(159, 'Payment Successfully', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 28, 'DIS-Rele', 'http://localhost:8000/payment', '2022-04-19 09:09:40', 1, '2022-04-19 02:09:40', '2022-04-19 02:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name_kh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`id`, `name`, `name_kh`) VALUES
(1, 'January', 'មករា'),
(2, 'February', 'កុម្ភៈ'),
(3, 'March', 'មីនា (ឆមាសទី១)'),
(4, 'April', 'មេសា'),
(5, 'May', 'ឧសភា'),
(6, 'June', 'មិថុនា'),
(7, 'July', 'កក្កដា (ឆមាសទី២)'),
(8, 'August ', 'សីហា'),
(9, 'September', 'កញ្ញា'),
(10, 'October', 'តុលា'),
(11, 'November', 'វិច្ឆិកា'),
(12, 'December', 'ធ្នូ'),
(13, 'Annual', 'ប្រចាំឆ្នាំ');

-- --------------------------------------------------------

--
-- Table structure for table `month_fla`
--

CREATE TABLE `month_fla` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `month_fla`
--

INSERT INTO `month_fla` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December'),
(13, 'Term 1'),
(14, 'Term 2'),
(15, 'Term 3'),
(16, 'Term 4'),
(17, 'Semester 1'),
(18, 'Semester 2'),
(19, 'Final');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `kh_name` varchar(255) NOT NULL,
  `en_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `nat` varchar(255) NOT NULL,
  `alive` varchar(1) NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `pob_v` varchar(255) DEFAULT NULL,
  `pob_c` varchar(255) DEFAULT NULL,
  `pob_d` varchar(255) DEFAULT NULL,
  `pob_p` varchar(255) DEFAULT NULL,
  `relation` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `student_id`, `kh_name`, `en_name`, `dob`, `nat`, `alive`, `job`, `phone`, `email`, `facebook`, `pob_v`, `pob_c`, `pob_d`, `pob_p`, `relation`, `created_at`, `updated_at`) VALUES
(1, '0001', 'សាន មៅ', 'san mov', '2019-12-12', 'ខ្មែរ', '1', 'House wife', '012365458', 'sanmov@gmail.com', 'SanMov', 'សូភី​ ២', 'រតន', 'បាត់ដំបង', 'បាត់ដំបង', 'mother', '2019-12-11 20:14:07', '2019-12-11 20:14:07'),
(2, '0001', 'សាន មាស', 'san meas', '2019-12-20', 'ខ្មែរ', '1', 'Hunter', '0123654558647', 'san@gmail.com', 'Huntersan', 'សូភី​១', 'រតន', 'បាត់ដំបង', 'បាត់ដំបង', 'father', '2019-12-11 20:14:07', '2019-12-11 20:14:07'),
(3, '0002', 'សាន មៅ', 'san mov', '2019-12-18', 'ខ្មែរ', '1', 'house wife', '012365236', 'sanmov@gmail.com', 'SanMov', 'សូភី​ ២', 'រតន', 'បាត់ដំបង', 'បាត់ដំបង', 'mother', '2019-12-15 21:11:31', '2019-12-15 21:11:31'),
(4, '0002', 'សាន មាស', 'san meas', '2019-12-12', 'ខ្មែរ', '1', 'Hunter', '0123654558647', 'san@gmail.com', 'Huntersan', 'សូភី​១', 'រតន', 'បាត់ដំបង', 'បាត់ដំបង', 'father', '2019-12-15 21:11:31', '2019-12-15 21:11:31'),
(5, '0003', 'BattamBang', 'BattamBang', '2020-02-11', 'ខ្មែរ', '1', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'mother', '2020-02-10 18:49:51', '2020-02-10 18:49:51'),
(6, '0003', 'BattamBang', 'BattamBang', '2020-02-11', 'ខ្មែរ', '1', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'father', '2020-02-10 18:49:51', '2020-02-10 18:49:51'),
(7, '0004', 'BattamBang', 'BattamBang', '2020-02-11', 'ខ្មែរ', '1', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'mother', '2020-02-11 01:41:46', '2020-02-11 01:41:46'),
(8, '0004', 'BattamBang', 'BattamBang', '2020-02-03', 'ខ្មែរ', '1', 'IT', 'BattamBang', NULL, NULL, 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'father', '2020-02-11 01:41:46', '2020-02-11 01:41:46'),
(9, '0005', 'BattamBang', 'BattamBang', '2020-02-11', 'ខ្មែរ', '1', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'mother', '2020-02-11 01:43:07', '2020-02-11 01:43:07'),
(10, '0005', 'BattamBang', 'BattamBang', '2020-02-18', 'ខ្មែរ', '1', 'IT', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'father', '2020-02-11 01:43:07', '2020-02-11 01:43:07'),
(11, '0006', 'BattamBang', 'BattamBang', '2020-02-09', 'ខ្មែរ', '1', 'BattamBang', 'BattamBang', NULL, 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'mother', '2020-02-11 01:46:07', '2020-02-11 01:46:07'),
(12, '0006', 'BattamBang', 'BattamBang', '2020-02-11', 'ខ្មែរ', '1', 'IT', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'BattamBang', 'father', '2020-02-11 01:46:07', '2020-02-11 01:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `student_id` int(100) NOT NULL,
  `camp_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `invoice_des` text DEFAULT NULL,
  `deposit` float DEFAULT NULL,
  `year_academic` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `student_id`, `camp_id`, `payment_date`, `due_date`, `payment_method`, `invoice_des`, `deposit`, `year_academic`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-02-08', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion,DIS-AC Tuition  School Grade::11::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion,DIS-AC Tuition  School Grade::10::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion,DIS-AC & CC  Tuition School Grade::4::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion', 500, 3, 2, '2021-02-07 19:12:08', '2021-02-08 21:39:18'),
(2, 1, 1, '2021-02-11', NULL, 1, 'DIS-AC Tuition School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-16-2022-02-16),50%   DIS Both,DIS-AC Tuition School Grade::12::School Year2021-2022::Paid for Per Year (2021-02-16-2022-02-16),50%   DIS Both', NULL, 3, 2, '2021-02-11 03:02:21', '2021-02-10 22:10:12'),
(3, 1, 1, '2021-02-15', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Year (2021-02-10-2022-02-10),50%   DIS Both', NULL, 3, 0, '2021-02-14 20:11:08', '2021-02-14 20:11:08'),
(4, 1, 1, '2021-02-17', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Semester (2021-02-16-2021-08-16),50%   DIS Both,DIS-AC Tuition  School Grade::12::School Year2021-2022::Paid for Per Semester (2021-02-16-2021-08-16),50%   DIS Both,DIS-AC Tuition  School Grade::2::School Year2021-2022::Paid for Per Semester (2021-02-16-2021-08-16),50%   DIS Both', NULL, 3, 0, '2021-02-16 19:06:25', '2021-02-16 19:06:25'),
(5, 2, 1, '2021-02-17', NULL, 1, 'DIS-AC Tuition School Grade::8::School Year2021-2022::Paid for Per Year (2021-02-03-2022-02-03),70%   Promotion Discount  By CEO,DIS-CC Tuition Free Primary School Grade::1::School Year2021-2022::Paid for Per Year (2021-02-03-2022-02-03),70%   Promotion Discount  By CEO', NULL, 3, 0, '2021-02-16 19:51:03', '2021-02-16 19:51:03'),
(6, 2, 1, '2021-02-17', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::3::School Year2021-2022::Paid for Per Term  (2021-02-15-2021-05-15),70%   Promotion Discount  By CEO,DIS-AC & CC Tuition  School Grade::10::School Year2021-2022::Paid for Per Term  (2021-02-15-2021-05-15),70%   Promotion Discount  By CEO', NULL, 3, 0, '2021-02-16 19:51:47', '2021-02-16 19:51:47'),
(7, 3, 1, '2021-02-17', NULL, 1, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Term  (2021-02-17-2021-05-17),70%   Promotion Discount  By CEO,DIS-AC Tuition  School Grade::3::School Year2021-2022::Paid for Per Term  (2021-02-17-2021-05-17),70%   Promotion Discount  By CEO,DIS-AC Tuition  School Grade::3::School Year2021-2022::Paid for Per Term  (2021-02-17-2021-05-17),70%   Promotion Discount  By CEO', NULL, 3, 0, '2021-02-16 19:58:15', '2021-02-16 19:58:15'),
(8, 4, 1, '2021-02-17', NULL, 1, 'DIS-AC & CC Tuition  School Grade::11::School Year2021-2022::Paid for Per Term  (2021-02-22-2021-05-22),70%   Promotion Discount  By CEO,DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Term  (2021-02-22-2021-05-22),70%   Promotion Discount  By CEO,DIS-AC & CC Tuition  School Grade::10::School Year2021-2022::Paid for Per Term  (2021-02-22-2021-05-22),70%   Promotion Discount  By CEO,DIS-AC Tuition School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-22-2022-02-22),70%   Promotion Discount  By CEO', NULL, 3, 0, '2021-02-16 20:06:03', '2021-02-16 20:06:03'),
(9, 5, 1, '2021-02-18', NULL, 1, 'DIS-CC Tuition Free Secondary School Grade::8::School Year2021-2022::Paid for Per Semester (2021-03-03-2021-09-03),20%   Promotion 2022  New Discount,DIS-AC & CC  Tuition School Grade::11::School Year2021-2022::Paid for Per Semester (2021-03-03-2021-09-03),20%   Promotion 2022  New Discount,DIS-CC Tuition Free Secondary School Grade::9::School Year2021-2022::Paid for Per Semester (2021-03-03-2021-09-03),20%   Promotion 2022  New Discount', NULL, 3, 0, '2021-02-18 01:10:59', '2021-02-18 01:10:59'),
(10, 5, 1, '2021-02-18', NULL, 1, 'DIS-AC & CC Tuition  School Grade::10::School Year2021-2022::Paid for Per Term  (2021-02-06-2021-05-06),70%   Promotion Discount  By CEO,DIS-CC Tuition Free Primary School Grade::2::School Year2021-2022::Paid for Per Term  (2021-02-06-2021-05-06),70%   Promotion Discount  By CEO', NULL, 3, 0, '2021-02-18 01:12:23', '2021-02-18 01:12:23'),
(11, 6, 1, '2021-02-19', NULL, 1, 'DIS-AC Tuition School Grade::3::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),50%   Promotion for DIS Both,DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),50%   Promotion for DIS Both', NULL, 3, 0, '2021-02-19 01:19:40', '2021-02-19 01:19:40'),
(12, 6, 1, '2021-02-22', NULL, 1, 'DIS-AC Tuition School Grade::3::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),50%   Promotion for DIS Both,DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),50%   Promotion for DIS Both', NULL, 3, 1, '2021-02-21 20:55:11', '2021-02-21 20:55:11'),
(13, 7, 1, '2021-02-22', NULL, 1, 'DIS-AC Tuition School Grade::8::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount,DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount', NULL, 3, 0, '2021-02-22 00:46:54', '2021-02-22 00:46:54'),
(14, 5, 1, '2021-02-25', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount,DIS-AC Tuition School Grade::7::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount', NULL, 3, 0, '2021-02-25 09:51:08', '2021-02-25 09:51:08'),
(15, 8, 1, '2021-02-26', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Semester (2021-02-03-2021-08-03),20%   Promotion 2022  New Discount,DIS-CC Tuition Free Primary School Grade::3::School Year2021-2022::Paid for Per Semester (2021-02-03-2021-08-03),20%   Promotion 2022  New Discount', NULL, 3, 0, '2021-02-26 03:06:21', '2021-02-26 03:06:21'),
(16, 9, 1, '2021-02-26', NULL, 1, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Semester (2021-02-03-2021-08-03),20%   Promotion 2022  New Discount', NULL, 3, 0, '2021-02-26 04:42:16', '2021-02-26 04:42:16'),
(17, 10, 1, '2021-03-01', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Semester (2021-03-16-2021-09-16),50%   Promotion for DIS Both', NULL, 3, 0, '2021-03-01 04:35:58', '2021-03-01 04:35:58'),
(18, 12, 1, '2021-03-01', NULL, 1, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO,DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO,DIS-CC Tuition Free Primary School Grade::6::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO,DIS-CC Tuition Free High School Grade::11::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO', NULL, 3, 2, '2021-03-01 10:35:32', '2021-03-15 01:57:58'),
(19, 1, 0, '2021-03-15', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::3::School Year 2021-2022::Paid for Per Year (2021-03-23-2022-03-23),20%   Promotion 2022  New Discount', NULL, 3, 1, '2021-03-15 08:21:39', '2021-03-15 08:21:39'),
(20, 1, 0, '2021-03-15', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::5::School Year 2021-2022::Paid for Per Semester (2021-03-23-2021-09-23),20%   Promotion 2022  New Discount', NULL, 3, 1, '2021-03-15 08:24:52', '2021-03-15 08:24:52'),
(21, 1, 0, '2021-03-15', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::5::School Year 2021-2022::Paid for Per Semester (2021-03-08-2021-09-08),20%   Both Elite', NULL, 3, 1, '2021-03-15 08:26:23', '2021-03-15 08:26:23'),
(22, 1, 0, '2021-03-15', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::4::School Year 2021-2022::Paid for Per Year (2021-03-10-2022-03-10),50%   DIS Both', NULL, 3, 1, '2021-03-15 08:28:18', '2021-03-15 08:28:18'),
(23, 1, 1, '2022-04-19', NULL, 1, 'DIS-CC Tuition Free Primary School Grade::3::School Year 2021-2022::Paid for Per Year (2022-03-28-2023-03-28),20%   Promotion covid 19', 200, 3, 0, '2022-04-19 02:09:41', '2022-04-19 02:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_payment` int(11) NOT NULL,
  `id_inovice_type` int(11) NOT NULL,
  `id_pro_service` int(11) NOT NULL,
  `id_payterm` int(11) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `user_id_pay` int(11) NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `ori_price` float NOT NULL,
  `disccount` int(11) NOT NULL,
  `total_amount` float DEFAULT NULL,
  `total_payment` float GENERATED ALWAYS AS (ifnull(`total_amount` - `total_amount` * `disccount` / 100,0)) STORED,
  `lose_piad` float GENERATED ALWAYS AS (ifnull(`total_amount`,0) - ifnull(`total_payment`,0)) STORED,
  `Volidty_of_payment` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `school_year` varchar(11) NOT NULL,
  `remark` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_detail`
--

INSERT INTO `payment_detail` (`id`, `id_invoice`, `id_payment`, `id_inovice_type`, `id_pro_service`, `id_payterm`, `campus_id`, `user_id_pay`, `description`, `qty`, `ori_price`, `disccount`, `total_amount`, `Volidty_of_payment`, `expired_date`, `school_year`, `remark`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 29, 6, 1, 28, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion', 1, 275, 30, 275, '2021-02-08', '2021-08-08', '3', NULL, 2, '2021-02-08 02:12:08', '2021-02-09 09:39:18'),
(2, 1, 1, 1, 83, 6, 1, 28, 'DIS-AC Tuition  School Grade::11::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion', 1, 415, 30, 415, '2021-02-08', '2021-08-08', '3', NULL, 2, '2021-02-08 02:12:08', '2021-02-09 09:39:18'),
(3, 1, 1, 1, 82, 6, 1, 28, 'DIS-AC Tuition  School Grade::10::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion', 1, 415, 30, 415, '2021-02-08', '2021-08-08', '3', NULL, 2, '2021-02-08 02:12:08', '2021-02-09 09:39:18'),
(4, 1, 1, 1, 124, 6, 1, 28, 'DIS-AC & CC  Tuition School Grade::4::School Year2021-2022::Paid for Per Semester (2021-02-08-2021-08-08),30%   Covid 19  promotion', 1, 360, 30, 360, '2021-02-08', '2021-08-08', '3', NULL, 2, '2021-02-08 02:12:08', '2021-02-09 09:39:18'),
(5, 2, 2, 1, 88, 12, 1, 28, 'DIS-AC Tuition School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-16-2022-02-16),50%   DIS Both', 1, 785, 50, 785, '2021-02-16', '2022-02-16', '3', NULL, 2, '2021-02-11 10:02:21', '2021-02-11 10:10:12'),
(6, 2, 2, 1, 96, 12, 1, 28, 'DIS-AC Tuition School Grade::12::School Year2021-2022::Paid for Per Year (2021-02-16-2022-02-16),50%   DIS Both', 1, 785, 50, 785, '2021-02-16', '2022-02-16', '3', NULL, 2, '2021-02-11 10:02:21', '2021-02-11 10:10:12'),
(7, 3, 3, 1, 41, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Year (2021-02-10-2022-02-10),50%   DIS Both', 1, 520, 50, 520, '2021-02-10', '2022-02-10', '3', NULL, 0, '2021-02-15 03:11:08', '2021-02-15 03:11:08'),
(8, 4, 4, 1, 29, 6, 1, 28, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Semester (2021-02-16-2021-08-16),50%   DIS Both', 1, 275, 50, 275, '2021-02-16', '2021-08-16', '3', NULL, 0, '2021-02-17 02:06:25', '2021-02-17 02:06:25'),
(9, 4, 4, 1, 84, 6, 1, 28, 'DIS-AC Tuition  School Grade::12::School Year2021-2022::Paid for Per Semester (2021-02-16-2021-08-16),50%   DIS Both', 1, 415, 50, 415, '2021-02-16', '2021-08-16', '3', NULL, 0, '2021-02-17 02:06:25', '2021-02-17 02:06:25'),
(10, 4, 4, 1, 74, 6, 1, 28, 'DIS-AC Tuition  School Grade::2::School Year2021-2022::Paid for Per Semester (2021-02-16-2021-08-16),50%   DIS Both', 1, 415, 50, 415, '2021-02-16', '2021-08-16', '3', NULL, 0, '2021-02-17 02:06:25', '2021-02-17 02:06:25'),
(11, 5, 5, 1, 92, 12, 1, 28, 'DIS-AC Tuition School Grade::8::School Year2021-2022::Paid for Per Year (2021-02-03-2022-02-03),70%   Promotion Discount  By CEO', 1, 785, 70, 785, '2021-02-03', '2022-02-03', '3', NULL, 0, '2021-02-17 02:51:04', '2021-02-17 02:51:04'),
(12, 5, 5, 1, 37, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::1::School Year2021-2022::Paid for Per Year (2021-02-03-2022-02-03),70%   Promotion Discount  By CEO', 1, 520, 70, 520, '2021-02-03', '2022-02-03', '3', NULL, 0, '2021-02-17 02:51:04', '2021-02-17 02:51:04'),
(13, 6, 6, 1, 15, 3, 1, 28, 'DIS-CC Tuition Free Primary School Grade::3::School Year2021-2022::Paid for Per Term  (2021-02-15-2021-05-15),70%   Promotion Discount  By CEO', 1, 145, 70, 145, '2021-02-15', '2021-05-15', '3', NULL, 0, '2021-02-17 02:51:47', '2021-02-17 02:51:47'),
(14, 6, 6, 1, 118, 3, 1, 28, 'DIS-AC & CC Tuition  School Grade::10::School Year2021-2022::Paid for Per Term  (2021-02-15-2021-05-15),70%   Promotion Discount  By CEO', 1, 185, 70, 185, '2021-02-15', '2021-05-15', '3', NULL, 0, '2021-02-17 02:51:47', '2021-02-17 02:51:47'),
(15, 7, 7, 1, 24, 3, 1, 28, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Term  (2021-02-17-2021-05-17),70%   Promotion Discount  By CEO', 1, 215, 70, 215, '2021-02-17', '2021-05-17', '3', NULL, 0, '2021-02-17 02:58:15', '2021-02-17 02:58:15'),
(16, 7, 7, 1, 63, 3, 1, 28, 'DIS-AC Tuition  School Grade::3::School Year2021-2022::Paid for Per Term  (2021-02-17-2021-05-17),70%   Promotion Discount  By CEO', 1, 215, 70, 215, '2021-02-17', '2021-05-17', '3', NULL, 0, '2021-02-17 02:58:15', '2021-02-17 02:58:15'),
(17, 7, 7, 1, 63, 3, 1, 28, 'DIS-AC Tuition  School Grade::3::School Year2021-2022::Paid for Per Term  (2021-02-17-2021-05-17),70%   Promotion Discount  By CEO', 1, 215, 70, 215, '2021-02-17', '2021-05-17', '3', NULL, 0, '2021-02-17 02:58:15', '2021-02-17 02:58:15'),
(18, 8, 8, 1, 119, 3, 1, 28, 'DIS-AC & CC Tuition  School Grade::11::School Year2021-2022::Paid for Per Term  (2021-02-22-2021-05-22),70%   Promotion Discount  By CEO', 1, 185, 70, 185, '2021-02-22', '2021-05-22', '3', NULL, 0, '2021-02-17 03:06:03', '2021-02-17 03:06:03'),
(19, 8, 8, 1, 24, 3, 1, 28, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Term  (2021-02-22-2021-05-22),70%   Promotion Discount  By CEO', 1, 215, 70, 215, '2021-02-22', '2021-05-22', '3', NULL, 0, '2021-02-17 03:06:03', '2021-02-17 03:06:03'),
(20, 8, 8, 1, 118, 3, 1, 28, 'DIS-AC & CC Tuition  School Grade::10::School Year2021-2022::Paid for Per Term  (2021-02-22-2021-05-22),70%   Promotion Discount  By CEO', 1, 185, 70, 185, '2021-02-22', '2021-05-22', '3', NULL, 0, '2021-02-17 03:06:03', '2021-02-17 03:06:03'),
(21, 8, 8, 1, 88, 12, 1, 28, 'DIS-AC Tuition School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-22-2022-02-22),70%   Promotion Discount  By CEO', 1, 785, 70, 785, '2021-02-22', '2022-02-22', '3', NULL, 0, '2021-02-17 03:06:03', '2021-02-17 03:06:03'),
(22, 9, 9, 1, 32, 6, 1, 28, 'DIS-CC Tuition Free Secondary School Grade::8::School Year2021-2022::Paid for Per Semester (2021-03-03-2021-09-03),20%   Promotion 2022  New Discount', 1, 380, 20, 380, '2021-03-03', '2021-09-03', '3', NULL, 0, '2021-02-18 08:10:59', '2021-02-18 08:10:59'),
(23, 9, 9, 1, 131, 6, 1, 28, 'DIS-AC & CC  Tuition School Grade::11::School Year2021-2022::Paid for Per Semester (2021-03-03-2021-09-03),20%   Promotion 2022  New Discount', 1, 360, 20, 360, '2021-03-03', '2021-09-03', '3', NULL, 0, '2021-02-18 08:10:59', '2021-02-18 08:10:59'),
(24, 9, 9, 1, 33, 6, 1, 28, 'DIS-CC Tuition Free Secondary School Grade::9::School Year2021-2022::Paid for Per Semester (2021-03-03-2021-09-03),20%   Promotion 2022  New Discount', 1, 380, 20, 380, '2021-03-03', '2021-09-03', '3', NULL, 0, '2021-02-18 08:10:59', '2021-02-18 08:10:59'),
(25, 10, 10, 1, 118, 3, 1, 28, 'DIS-AC & CC Tuition  School Grade::10::School Year2021-2022::Paid for Per Term  (2021-02-06-2021-05-06),70%   Promotion Discount  By CEO', 1, 185, 70, 185, '2021-02-06', '2021-05-06', '3', NULL, 0, '2021-02-18 08:12:23', '2021-02-18 08:12:23'),
(26, 10, 10, 1, 14, 3, 1, 28, 'DIS-CC Tuition Free Primary School Grade::2::School Year2021-2022::Paid for Per Term  (2021-02-06-2021-05-06),70%   Promotion Discount  By CEO', 1, 145, 70, 145, '2021-02-06', '2021-05-06', '3', NULL, 0, '2021-02-18 08:12:23', '2021-02-18 08:12:23'),
(27, 11, 11, 1, 87, 12, 1, 28, 'DIS-AC Tuition School Grade::3::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),50%   Promotion for DIS Both', 1, 785, 50, 785, '2021-02-09', '2022-02-09', '3', NULL, 0, '2021-02-19 08:19:40', '2021-02-19 08:19:40'),
(28, 11, 11, 1, 48, 12, 1, 28, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),50%   Promotion for DIS Both', 1, 785, 50, 785, '2021-02-09', '2022-02-09', '3', NULL, 0, '2021-02-19 08:19:40', '2021-02-19 08:19:40'),
(29, 13, 13, 1, 92, 12, 1, 28, 'DIS-AC Tuition School Grade::8::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount', 1, 785, 20, 785, '2021-02-09', '2022-02-09', '3', NULL, 0, '2021-02-22 07:46:54', '2021-02-22 07:46:54'),
(30, 13, 13, 1, 40, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount', 1, 520, 20, 520, '2021-02-09', '2022-02-09', '3', NULL, 0, '2021-02-22 07:46:54', '2021-02-22 07:46:54'),
(31, 14, 14, 1, 40, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount', 1, 520, 20, 520, '2021-02-09', '2022-02-09', '3', NULL, 0, '2021-02-25 09:51:09', '2021-02-25 09:51:09'),
(32, 14, 14, 1, 91, 12, 1, 28, 'DIS-AC Tuition School Grade::7::School Year2021-2022::Paid for Per Year (2021-02-09-2022-02-09),20%   Promotion 2022  New Discount', 1, 785, 20, 785, '2021-02-09', '2022-02-09', '3', NULL, 0, '2021-02-25 09:51:09', '2021-02-25 09:51:09'),
(33, 15, 15, 1, 29, 6, 1, 28, 'DIS-CC Tuition Free Primary School Grade::5::School Year2021-2022::Paid for Per Semester (2021-02-03-2021-08-03),20%   Promotion 2022  New Discount', 1, 275, 20, 275, '2021-02-03', '2021-08-03', '3', NULL, 0, '2021-02-26 03:06:21', '2021-02-26 03:06:21'),
(34, 15, 15, 1, 27, 6, 1, 28, 'DIS-CC Tuition Free Primary School Grade::3::School Year2021-2022::Paid for Per Semester (2021-02-03-2021-08-03),20%   Promotion 2022  New Discount', 1, 275, 20, 275, '2021-02-03', '2021-08-03', '3', NULL, 0, '2021-02-26 03:06:21', '2021-02-26 03:06:21'),
(35, 16, 16, 1, 36, 6, 1, 28, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Semester (2021-02-03-2021-08-03),20%   Promotion 2022  New Discount', 1, 415, 20, 415, '2021-02-03', '2021-08-03', '3', NULL, 0, '2021-02-26 04:42:16', '2021-02-26 04:42:16'),
(36, 17, 17, 1, 28, 6, 1, 28, 'DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Semester (2021-03-16-2021-09-16),50%   Promotion for DIS Both', 1, 275, 50, 275, '2021-03-16', '2021-09-16', '3', NULL, 0, '2021-03-01 04:35:58', '2021-03-01 04:35:58'),
(37, 18, 18, 1, 48, 12, 1, 28, 'DIS-CC Tuition Free High School Grade::12::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO', 1, 785, 70, 785, '2021-03-01', '2022-03-01', '3', NULL, 2, '2021-03-01 10:35:32', '2021-03-15 01:57:58'),
(38, 18, 18, 1, 40, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::4::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO', 1, 520, 70, 520, '2021-03-01', '2022-03-01', '3', NULL, 2, '2021-03-01 10:35:32', '2021-03-15 01:57:58'),
(39, 18, 18, 1, 42, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::6::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO', 1, 520, 70, 520, '2021-03-01', '2022-03-01', '3', NULL, 2, '2021-03-01 10:35:32', '2021-03-15 01:57:58'),
(40, 18, 18, 1, 47, 12, 1, 28, 'DIS-CC Tuition Free High School Grade::11::School Year2021-2022::Paid for Per Year (2021-03-01-2022-03-01),70%   Promotion Discount  By CEO', 1, 785, 70, 785, '2021-03-01', '2022-03-01', '3', NULL, 2, '2021-03-01 10:35:32', '2021-03-15 01:57:58'),
(41, 19, 19, 1, 39, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::3::School Year 2021-2022::Paid for Per Year (2021-03-23-2022-03-23),20%   Promotion 2022  New Discount', 1, 520, 20, 520, '2021-03-23', '2022-03-23', '3', NULL, 1, '2021-03-15 08:21:39', '2021-03-15 08:21:39'),
(42, 19, 20, 1, 29, 6, 1, 28, 'DIS-CC Tuition Free Primary School Grade::5::School Year 2021-2022::Paid for Per Semester (2021-03-23-2021-09-23),20%   Promotion 2022  New Discount', 1, 275, 20, 275, '2021-03-23', '2021-09-23', '3', NULL, 1, '2021-03-15 08:24:52', '2021-03-15 08:24:52'),
(43, 21, 21, 1, 29, 6, 1, 28, 'DIS-CC Tuition Free Primary School Grade::5::School Year 2021-2022::Paid for Per Semester (2021-03-08-2021-09-08),20%   Both Elite', 1, 275, 20, 275, '2021-03-08', '2021-09-08', '3', NULL, 1, '2021-03-15 08:26:23', '2021-03-15 08:26:23'),
(44, 22, 22, 1, 40, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::4::School Year 2021-2022::Paid for Per Year (2021-03-10-2022-03-10),50%   DIS Both', 1, 520, 50, 520, '2021-03-10', '2022-03-10', '3', NULL, 1, '2021-03-15 08:28:19', '2021-03-15 08:28:19'),
(45, 23, 23, 1, 39, 12, 1, 28, 'DIS-CC Tuition Free Primary School Grade::3::School Year 2021-2022::Paid for Per Year (2022-03-28-2023-03-28),20%   Promotion covid 19', 1, 520, 20, 520, '2022-03-28', '2023-03-28', '3', NULL, 0, '2022-04-19 02:09:41', '2022-04-19 02:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `payment_method` varchar(150) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 0, '2020-12-22 08:07:39', '2020-12-22 08:07:39'),
(2, 'Bank', 0, '2020-12-22 08:07:39', '2020-12-22 08:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `pay_type`
--

CREATE TABLE `pay_type` (
  `id` int(11) NOT NULL,
  `pay_type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pay_type`
--

INSERT INTO `pay_type` (`id`, `pay_type`, `status`, `created_at`, `updated_at`) VALUES
(1, '1 Y', 0, '2020-10-12 04:18:24', '2020-10-12 04:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `placement`
--

CREATE TABLE `placement` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `status` int(2) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `placement`
--

INSERT INTO `placement` (`id`, `student_id`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'LV 7\r\nCurriculum Arraican ', 0, '2020-03-01 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `primary_score`
--

CREATE TABLE `primary_score` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `reading` double DEFAULT NULL,
  `written` double DEFAULT NULL,
  `essay` double DEFAULT NULL,
  `calligraphy` double DEFAULT NULL,
  `draw` double DEFAULT NULL,
  `grammer` double DEFAULT NULL,
  `math` double DEFAULT NULL,
  `moral` double DEFAULT NULL,
  `science` double DEFAULT NULL,
  `total` float GENERATED ALWAYS AS (ifnull(`reading`,0) + ifnull(`written`,0) + ifnull(`essay`,0) + ifnull(`calligraphy`,0) + ifnull(`draw`,0) + ifnull(`grammer`,0) + ifnull(`math`,0) + ifnull(`moral`,0) + ifnull(`science`,0)) STORED,
  `avg` float GENERATED ALWAYS AS ((ifnull(`reading`,0) + ifnull(`written`,0) + ifnull(`essay`,0) + ifnull(`calligraphy`,0) + ifnull(`draw`,0) + ifnull(`grammer`,0) + ifnull(`math`,0) + ifnull(`moral`,0) + ifnull(`science`,0)) / `numsub`) STORED,
  `numsub` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `primary_score`
--

INSERT INTO `primary_score` (`id`, `student_id`, `class_id`, `month_id`, `reading`, `written`, `essay`, `calligraphy`, `draw`, `grammer`, `math`, `moral`, `science`, `numsub`, `created_at`, `updated_at`) VALUES
(1, 482, 10, 1, 10, 5, 8, 4, 7, NULL, 6, 8, 9, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(2, 447, 10, 1, 7, 5, 9, 5, 10, NULL, 7, 8, 6, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(3, 135, 10, 1, 2, 5, 8, 10, 7, NULL, 10, 5, 8, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(4, 485, 10, 1, 5, 7, 6, 10, 9, NULL, 4, 5, 6, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(5, 486, 10, 1, 10, 10, 10, 9, 8, NULL, 10, 9, 10, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(6, 487, 10, 1, 5, 8, 4, 6, 3, NULL, 2, 5, 8, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(7, 439, 10, 1, 4, 7, 5, 2, 3, NULL, 8, 5, 4, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(8, 330, 10, 1, 8, 5, 4, 9, 4, NULL, 7, 10, 5, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(9, 357, 10, 1, 5, 2, 3, 1, 7, NULL, 4, 5, 1, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(10, 491, 10, 1, 9, 10, 2, 5, 7, NULL, 8, 0, 1, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07'),
(11, 424, 10, 1, 7, 5, 8, 6, 3, NULL, 7, 10, 10, 8, '2020-06-26 08:46:07', '2020-06-26 08:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_service`
--

CREATE TABLE `product_service` (
  `id` int(11) NOT NULL,
  `pro_service` varchar(100) NOT NULL,
  `price_service` float NOT NULL,
  `id_service_type` int(11) NOT NULL,
  `id_pay` int(11) NOT NULL,
  `id_academic` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `camp_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_service`
--

INSERT INTO `product_service` (`id`, `pro_service`, `price_service`, `id_service_type`, `id_pay`, `id_academic`, `status`, `camp_id`, `created_at`, `updated_at`) VALUES
(1, 'DIS-CC Tuition Fee Primary School Grade::1', 65, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(2, 'DIS-CC Tuition Free Primary School Grade::2', 65, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(3, 'DIS-CC Tuition Free Primary School Grade::3', 65, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(4, 'DIS-CC Tuition Free Primary School Grade::4', 65, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(5, 'DIS-CC Tuition Free Primary School Grade::5', 65, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(6, 'DIS-CC Tuition Free Primary School Grade::6', 65, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(7, 'DIS-CC Tuition Free Secondary School Grade::7', 80, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(8, 'DIS-CC Tuition Free Secondary School Grade::8', 80, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(9, 'DIS-CC Tuition Free Secondary School Grade::9', 80, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(10, 'DIS-CC Tuition Free High School Grade::10', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(11, 'DIS-CC Tuition Free High School Grade::11', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(12, 'DIS-CC Tuition Free High School Grade::12', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(13, 'DIS-CC Tuition Free Primary School Grade::1', 145, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(14, 'DIS-CC Tuition Free Primary School Grade::2', 145, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(15, 'DIS-CC Tuition Free Primary School Grade::3', 145, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(16, 'DIS-CC Tuition Free Primary School Grade::4', 145, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(17, 'DIS-CC Tuition Free Primary School Grade::5', 145, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(18, 'DIS-CC Tuition Free Primary School Grade::6', 145, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(19, 'DIS-CC Tuition Free Secondary School Grade::7', 195, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(20, 'DIS-CC Tuition Free Secondary School Grade::8', 195, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(21, 'DIS-CC Tuition Free Secondary School Grade::9', 195, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(22, 'DIS-CC Tuition Free High School Grade::10', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(23, 'DIS-CC Tuition Free High School Grade::11', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(24, 'DIS-CC Tuition Free High School Grade::12', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(25, 'DIS-CC Tuition Free Primary School Grade::1', 275, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(26, 'DIS-CC Tuition Free Primary School Grade::2', 275, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(27, 'DIS-CC Tuition Free Primary School Grade::3', 275, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(28, 'DIS-CC Tuition Free Primary School Grade::4', 275, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(29, 'DIS-CC Tuition Free Primary School Grade::5', 275, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(30, 'DIS-CC Tuition Free Primary School Grade::6', 275, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(31, 'DIS-CC Tuition Free Secondary School Grade::7', 380, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(32, 'DIS-CC Tuition Free Secondary School Grade::8', 380, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(33, 'DIS-CC Tuition Free Secondary School Grade::9', 380, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(34, 'DIS-CC Tuition Free High School Grade::10', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(35, 'DIS-CC Tuition Free High School Grade::11', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(36, 'DIS-CC Tuition Free High School Grade::12', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(37, 'DIS-CC Tuition Free Primary School Grade::1', 520, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(38, 'DIS-CC Tuition Free Primary School Grade::2', 520, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(39, 'DIS-CC Tuition Free Primary School Grade::3', 520, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(40, 'DIS-CC Tuition Free Primary School Grade::4', 520, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(41, 'DIS-CC Tuition Free Primary School Grade::5', 520, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(42, 'DIS-CC Tuition Free Primary School Grade::6', 520, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(43, 'DIS-CC Tuition Free Secondary School Grade::7', 715, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(44, 'DIS-CC Tuition Free Secondary School Grade::8', 715, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(45, 'DIS-CC Tuition Free Secondary School Grade::9', 715, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(46, 'DIS-CC Tuition Free High School Grade::10', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(47, 'DIS-CC Tuition Free High School Grade::11', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(48, 'DIS-CC Tuition Free High School Grade::12', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:14', '2021-02-08 02:03:14'),
(49, 'DIS-AC  Tuition  School Grade::1', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(50, 'DIS-AC  Tuition  School Grade::2', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(51, 'DIS-AC  Tuition  School Grade::3', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(52, 'DIS-AC  Tuition  School Grade::4', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(53, 'DIS-AC  Tuition  School Grade::5', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(54, 'DIS-AC  Tuition  School Grade::6', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(55, 'DIS-AC  Tuition  School Grade::7', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(56, 'DIS-AC  Tuition  School Grade::8', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(57, 'DIS-AC  Tuition  School Grade::9', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(58, 'DIS-AC  Tuition  School Grade::10', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(59, 'DIS-AC  Tuition  School Grade::11', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(60, 'DIS-AC  Tuition  School Grade::12', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(61, 'DIS-AC Tuition  School Grade::1', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(62, 'DIS-AC Tuition  School Grade::2', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(63, 'DIS-AC Tuition  School Grade::3', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(64, 'DIS-AC Tuition  School Grade::4', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(65, 'DIS-AC Tuition  School Grade::5', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(66, 'DIS-AC Tuition  School Grade::6', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(67, 'DIS-AC Tuition  School Grade::7', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(68, 'DIS-AC Tuition  School Grade::8', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(69, 'DIS-AC Tuition  School Grade::9', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(70, 'DIS-AC Tuition  School Grade::10', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(71, 'DIS-AC Tuition  School Grade::11', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(72, 'DIS-AC Tuition  School Grade::12', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(73, 'DIS-AC Tuition  School Grade::1', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(74, 'DIS-AC Tuition  School Grade::2', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(75, 'DIS-AC Tuition  School Grade::3', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(76, 'DIS-AC Tuition  School Grade::4', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(77, 'DIS-AC Tuition  School Grade::5', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(78, 'DIS-AC Tuition  School Grade::6', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(79, 'DIS-AC Tuition  School Grade::7', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(80, 'DIS-AC Tuition  School Grade::8', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(81, 'DIS-AC Tuition  School Grade::9', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(82, 'DIS-AC Tuition  School Grade::10', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(83, 'DIS-AC Tuition  School Grade::11', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(84, 'DIS-AC Tuition  School Grade::12', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(85, 'DIS-AC Tuition School Grade::1', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(86, 'DIS-AC Tuition School Grade::2', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(87, 'DIS-AC Tuition School Grade::3', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(88, 'DIS-AC Tuition School Grade::4', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(89, 'DIS-AC Tuition School Grade::5', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(90, 'DIS-AC Tuition School Grade::6', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(91, 'DIS-AC Tuition School Grade::7', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(92, 'DIS-AC Tuition School Grade::8', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(93, 'DIS-AC Tuition School Grade::9', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(94, 'DIS-AC Tuition School Grade::10', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(95, 'DIS-AC Tuition School Grade::11', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(96, 'DIS-AC Tuition School Grade::12', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(97, 'DIS-AC & CC  Tuition School Grade::1', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(98, 'DIS-AC & CC  Tuition School Grade::2', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(99, 'DIS-AC & CC  Tuition School Grade::3', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(100, 'DIS-AC & CC  Tuition School Grade::4', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(101, 'DIS-AC & CC  Tuition School Grade::5', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(102, 'DIS-AC & CC  Tuition School Grade::6', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(103, 'DIS-AC & CC  Tuition School Grade::7', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(104, 'DIS-AC & CC  Tuition School Grade::8', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(105, 'DIS-AC & CC  Tuition School Grade::9', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(106, 'DIS-AC & CC  Tuition School Grade::10', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(107, 'DIS-AC & CC  Tuition School Grade::11', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(108, 'DIS-AC & CC  Tuition School Grade::12', 75, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(109, 'DIS-AC & CC Tuition  School Grade::1', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(110, 'DIS-AC & CC Tuition  School Grade::2', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(111, 'DIS-AC & CC Tuition  School Grade::3', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(112, 'DIS-AC & CC Tuition  School Grade::4', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(113, 'DIS-AC & CC Tuition  School Grade::5', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(114, 'DIS-AC & CC Tuition  School Grade::6', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(115, 'DIS-AC & CC Tuition  School Grade::7', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(116, 'DIS-AC & CC Tuition  School Grade::8', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(117, 'DIS-AC & CC Tuition  School Grade::9', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(118, 'DIS-AC & CC Tuition  School Grade::10', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(119, 'DIS-AC & CC Tuition  School Grade::11', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(120, 'DIS-AC & CC Tuition  School Grade::12', 185, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(121, 'DIS-AC & CC  Tuition School Grade::1', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(122, 'DIS-AC & CC  Tuition School Grade::2', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(123, 'DIS-AC & CC  Tuition School Grade::3', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(124, 'DIS-AC & CC  Tuition School Grade::4', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(125, 'DIS-AC & CC  Tuition School Grade::5', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(126, 'DIS-AC & CC  Tuition School Grade::6', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(127, 'DIS-AC & CC  Tuition School Grade::7', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(128, 'DIS-AC & CC  Tuition School Grade::8', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(129, 'DIS-AC & CC  Tuition School Grade::9', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(130, 'DIS-AC & CC  Tuition School Grade::10', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(131, 'DIS-AC & CC  Tuition School Grade::11', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(132, 'DIS-AC & CC  Tuition School Grade::12', 360, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(133, 'DIS-AC & CC Tuition  School Grade::1', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(134, 'DIS-AC & CC Tuition  School Grade::2', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(135, 'DIS-AC & CC Tuition  School Grade::3', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(136, 'DIS-AC & CC Tuition  School Grade::4', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(137, 'DIS-AC & CC Tuition  School Grade::5', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(138, 'DIS-AC & CC Tuition  School Grade::6', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(139, 'DIS-AC & CC Tuition  School Grade::7', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(140, 'DIS-AC & CC Tuition  School Grade::8', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(141, 'DIS-AC & CC Tuition  School Grade::9', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(142, 'DIS-AC & CC Tuition  School Grade::10', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(143, 'DIS-AC & CC Tuition  School Grade::11', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(144, 'DIS-AC & CC Tuition  School Grade::12', 680, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(145, 'DIS-AC Tuition Preparatory', 85, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(146, 'DIS-AC Tuition Preparatory', 215, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(147, 'DIS-AC Tuition Preparatory', 415, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(148, 'DIS-AC Tuition Preparatory', 785, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(149, 'DIS-AC & CC Tuition Preparatory', 65, 1, 1, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(150, 'DIS-AC & CC Tuition Preparatory', 155, 1, 3, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(151, 'DIS-AC & CC Tuition Preparatory', 300, 1, 6, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59'),
(152, 'DIS-AC & C Tuition Preparatory', 560, 1, 12, 3, 0, 1, '2021-02-08 02:03:59', '2021-02-08 02:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `quarter`
--

CREATE TABLE `quarter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quarter`
--

INSERT INTO `quarter` (`id`, `name`, `deleted`) VALUES
(1, 'Quarter 1', 0),
(2, 'Quarter 2', 0),
(3, 'Quarter 3', 0),
(4, 'Quarter 4', 0),
(5, 'Semester 1', 0),
(6, 'Semester 2', 0),
(7, 'Final', 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'SuperMan'),
(2, 'Admin'),
(3, 'Staff'),
(4, 'Teacher'),
(5, 'Relation');

-- --------------------------------------------------------

--
-- Table structure for table `score_ac`
--

CREATE TABLE `score_ac` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `quarter` int(1) NOT NULL,
  `s` float DEFAULT NULL,
  `ss` float DEFAULT NULL,
  `pc` float DEFAULT NULL,
  `eng` float DEFAULT NULL,
  `la` float DEFAULT NULL,
  `d_a` float DEFAULT NULL,
  `m` float DEFAULT NULL,
  `me` float DEFAULT NULL,
  `r_c` float DEFAULT NULL,
  `pe` float DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total` float GENERATED ALWAYS AS (ifnull(`s`,0) + ifnull(`ss`,0) + ifnull(`pc`,0) + ifnull(`eng`,0) + ifnull(`la`,0) + ifnull(`d_a`,0) + ifnull(`m`,0) + ifnull(`me`,0) + ifnull(`r_c`,0) + ifnull(`pe`,0)) STORED,
  `test_null` float GENERATED ALWAYS AS (`s` + `ss` + `pc` + `eng` + `la` + `d_a` + `m` + `me` + `r_c` + `pe`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `score_ac`
--

INSERT INTO `score_ac` (`id`, `student_id`, `class_id`, `quarter`, `s`, `ss`, `pc`, `eng`, `la`, `d_a`, `m`, `me`, `r_c`, `pe`, `created_by`, `updated_by`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 595, 20, 1, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(2, 737, 20, 1, 60, 70, 85, 60, 65, 63, 52, 45, 78, 96, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-20 18:44:35'),
(3, 867, 20, 1, 55, 65, 64, 63, 62, 50, 50, 71, 73, 73, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-20 18:44:35'),
(4, 591, 20, 1, 75, 45, 71, 60, 63, 62, 50, 59, 89, 63, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-20 18:44:35'),
(5, 437, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(6, 392, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(7, 371, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(8, 828, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(9, 411, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(10, 572, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(11, 541, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(12, 350, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:58', '2021-01-19 19:05:58'),
(13, 510, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:59', '2021-01-19 19:05:59'),
(14, 454, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:59', '2021-01-19 19:05:59'),
(15, 403, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:59', '2021-01-19 19:05:59'),
(16, 330, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:59', '2021-01-19 19:05:59'),
(17, 337, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:59', '2021-01-19 19:05:59'),
(18, 672, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:05:59', '2021-01-19 19:05:59'),
(19, 595, 20, 2, 70, 60, 75, 80, 80, 75, 60, 73, 62, 62, 0, 0, 0, '2021-01-19 19:06:27', '2021-01-19 20:20:31'),
(20, 737, 20, 2, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 0, 0, 0, '2021-01-19 19:06:27', '2021-01-19 19:06:27'),
(21, 867, 20, 2, 74, 75, 60, 52, 63, 63, 50, 48, 78, 85, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-20 18:46:35'),
(22, 591, 20, 2, 88, 93, 94, 55, 60, 40, 58, 57, 54, 53, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-20 18:46:35'),
(23, 437, 20, 2, 55, 55, 60, 51, 63, 73, 72, 51, 54, 58, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-20 18:46:35'),
(24, 392, 20, 2, 50, 60, 65, 63, 40, 58, 58, 63, 52, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-21 18:46:42'),
(25, 371, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(26, 828, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(27, 411, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(28, 572, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(29, 541, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(30, 350, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(31, 510, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(32, 454, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(33, 403, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(34, 330, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(35, 337, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(36, 672, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:06:28', '2021-01-19 19:06:28'),
(37, 595, 20, 3, 50, 50, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:07', '2021-01-19 19:25:40'),
(38, 737, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:07', '2021-01-19 19:07:07'),
(39, 867, 20, 3, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 0, 0, 0, '2021-01-19 19:07:07', '2021-01-19 19:10:45'),
(40, 591, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:07', '2021-01-19 19:07:07'),
(41, 437, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:07', '2021-01-19 19:07:07'),
(42, 392, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:07', '2021-01-19 19:07:07'),
(43, 371, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:07', '2021-01-19 19:07:07'),
(44, 828, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(45, 411, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(46, 572, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(47, 541, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(48, 350, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(49, 510, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(50, 454, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(51, 403, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(52, 330, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(53, 337, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(54, 672, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:08', '2021-01-19 19:07:08'),
(55, 595, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(56, 737, 20, 4, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 0, 0, 0, '2021-01-19 19:07:15', '2021-03-15 00:58:15'),
(57, 867, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(58, 591, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(59, 437, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(60, 392, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(61, 371, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(62, 828, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(63, 411, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(64, 572, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(65, 541, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(66, 350, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(67, 510, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(68, 454, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(69, 403, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:15', '2021-01-19 19:07:15'),
(70, 330, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:16', '2021-01-19 19:07:16'),
(71, 337, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:16', '2021-01-19 19:07:16'),
(72, 672, 20, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-01-19 19:07:16', '2021-01-19 19:07:16'),
(73, 867, 23, 1, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(74, 591, 23, 1, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(75, 392, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(76, 357, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(77, 541, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(78, 350, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(79, 371, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(80, 510, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:32:29', '2021-04-22 02:32:29'),
(81, 867, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:17', '2021-04-22 02:35:17'),
(82, 591, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:17', '2021-04-22 02:35:17'),
(83, 392, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:18', '2021-04-22 02:35:18'),
(84, 357, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:18', '2021-04-22 02:35:18'),
(85, 541, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:18', '2021-04-22 02:35:18'),
(86, 350, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:18', '2021-04-22 02:35:18'),
(87, 371, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:18', '2021-04-22 02:35:18'),
(88, 510, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-04-22 02:35:18', '2021-04-22 02:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `score_cc`
--

CREATE TABLE `score_cc` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `avg_m` float NOT NULL,
  `eng` float DEFAULT NULL,
  `b` float DEFAULT NULL,
  `c` float DEFAULT NULL,
  `e` float DEFAULT NULL,
  `g` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `k` float DEFAULT NULL,
  `m` float DEFAULT NULL,
  `p` float DEFAULT NULL,
  `ph` float DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` int(11) DEFAULT 0,
  `avg` float GENERATED ALWAYS AS ((ifnull(`eng`,0) + ifnull(`b`,0) + ifnull(`c`,0) + ifnull(`e`,0) + ifnull(`g`,0) + ifnull(`h`,0) + ifnull(`k`,0) + ifnull(`m`,0) + ifnull(`p`,0) + ifnull(`ph`,0)) / `avg_m`) STORED,
  `total` float GENERATED ALWAYS AS (ifnull(`eng`,0) + ifnull(`b`,0) + ifnull(`c`,0) + ifnull(`e`,0) + ifnull(`g`,0) + ifnull(`h`,0) + ifnull(`k`,0) + ifnull(`m`,0) + ifnull(`p`,0) + ifnull(`ph`,0)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `score_cc`
--

INSERT INTO `score_cc` (`id`, `student_id`, `month_id`, `class_id`, `avg_m`, `eng`, `b`, `c`, `e`, `g`, `h`, `k`, `m`, `p`, `ph`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 1, 1, 1, 12, 30, 70, 25, 56, 30, 30, 30, 30, 30, 30, NULL, NULL, '2019-12-15 21:22:47', '2019-12-16 02:16:06', 0),
(2, 2, 1, 1, 12, 30, 20, 10, 30, 30, 30, 30, 30, 30, 30, NULL, NULL, '2019-12-15 21:22:47', '2019-12-17 20:10:57', 0),
(3, 1, 12, 1, 12, 15, 35, 31, 23, 54, 34, 65, 45, 43, 23, NULL, NULL, '2019-12-16 02:15:59', '2019-12-16 02:15:59', 0),
(4, 2, 12, 1, 12, 43, 23, 43, 45, 45, 65, 76, 34, 23, 15, NULL, NULL, '2019-12-16 02:15:59', '2019-12-16 02:15:59', 0),
(5, 1, 2, 1, 12, 30, 40, 50, 60, 20, 40, 30, 40, 45, 32, NULL, NULL, '2019-12-16 02:16:41', '2019-12-16 02:16:41', 0),
(6, 2, 2, 1, 12, 30, 36, 32, 25, 24, 21, 22, 27, 34, 45, NULL, NULL, '2019-12-16 02:16:41', '2019-12-16 02:16:41', 0),
(7, 1, 3, 1, 12, 45, 32, 53, 25, 12, 25, 36, 45, 85, 46, NULL, NULL, '2019-12-16 04:35:25', '2019-12-16 04:35:25', 0),
(8, 2, 3, 1, 12, 43, 25, 36, 66, 52, 45, 54, 37, 48, 50, NULL, NULL, '2019-12-16 04:35:25', '2019-12-16 04:35:25', 0),
(9, 1, 4, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:45:31', '2019-12-16 21:24:16', 0),
(10, 2, 4, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:45:31', '2019-12-16 21:24:16', 0),
(11, 1, 5, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:45:50', '2019-12-16 21:24:09', 0),
(12, 2, 5, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:45:50', '2019-12-16 21:24:09', 0),
(13, 1, 6, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:46:24', '2019-12-16 21:24:21', 0),
(14, 2, 6, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:46:25', '2019-12-16 21:24:21', 0),
(15, 1, 7, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:46:44', '2019-12-16 21:24:27', 0),
(16, 2, 7, 1, 12, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, '2019-12-16 20:46:44', '2019-12-16 21:24:27', 0),
(17, 1, 1, 5, 12, 40, 40, 40, 40, 40, 40, 30, 40, 40, 40, NULL, NULL, '2020-02-25 01:09:05', '2020-02-25 01:09:05', 0),
(18, 2, 1, 5, 12, 55, 55, 50, 55, 30, 30, 40, 52, 23, 40, NULL, NULL, '2020-02-25 01:09:06', '2020-02-25 01:09:21', 0),
(19, 3, 1, 5, 12, 55, 55, 57, 44, 44, 11, 66, 22, 11, 66, NULL, NULL, '2020-02-25 01:09:06', '2020-02-25 01:09:06', 0),
(20, 4, 1, 5, 12, 30, 30, 30, 30, 74, 47, 77, 42, 25, 77, NULL, NULL, '2020-02-25 01:09:06', '2020-02-25 01:09:06', 0),
(21, 1, 2, 5, 12, 66, 48, 45, 99, 63, 65, 40, 20, 45, 56, NULL, NULL, '2020-02-25 01:10:23', '2020-02-25 01:10:23', 0),
(22, 2, 2, 5, 12, 555, 55, 55, 55, 44, 66, 55, 55, 55, 33, NULL, NULL, '2020-02-25 01:10:23', '2020-02-25 01:10:23', 0),
(23, 3, 2, 5, 12, 11, 22, 85, 22, 74, 58, 55, 78, 95, 55, NULL, NULL, '2020-02-25 01:10:23', '2020-02-25 01:10:23', 0),
(24, 4, 2, 5, 12, 77, 88, 99, 88, 77, 66, 44, 77, 55, 55, NULL, NULL, '2020-02-25 01:10:23', '2020-02-25 01:10:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `score_cc_online`
--

CREATE TABLE `score_cc_online` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `avg_m` float DEFAULT NULL,
  `month_id` int(11) NOT NULL,
  `math` double DEFAULT NULL,
  `khmer` double DEFAULT NULL,
  `physical` double DEFAULT NULL,
  `chemistry` double DEFAULT NULL,
  `biology` double DEFAULT NULL,
  `history` double DEFAULT NULL,
  `phum` float DEFAULT NULL,
  `polroth` float DEFAULT NULL,
  `teasekdey` float DEFAULT NULL,
  `writting` float DEFAULT NULL,
  `sport` float DEFAULT NULL,
  `polakam` float DEFAULT NULL,
  `phandey` float DEFAULT NULL,
  `kehak` float DEFAULT NULL,
  `english` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avg_test` double GENERATED ALWAYS AS (if(`grade` = 9 or `grade` = 12,if(`month_id` = 3 or `month_id` = 7,ifnull(`math`,0) + ifnull(`khmer`,0) + ifnull(`physical`,0) + ifnull(`chemistry`,0) + ifnull(`biology`,0) + ifnull(`history`,0) + ifnull(`polroth`,0) + ifnull(`sport`,0) + ifnull(`polakam`,0) + ifnull(`phandey`,0) + ifnull(`kehak`,0) + ifnull(`english`,0) + ifnull(`phum`,0) - 25 / `avg_m`,ifnull(`math`,0) + ifnull(`khmer`,0) + ifnull(`physical`,0) + ifnull(`chemistry`,0) + ifnull(`biology`,0) + ifnull(`history`,0) + ifnull(`polroth`,0) + ifnull(`sport`,0) + ifnull(`polakam`,0) + ifnull(`phandey`,0) + ifnull(`kehak`,0) + ifnull(`english`,0) + ifnull(`phum`,0)) / `avg_m`,ifnull(`math`,0) + ifnull(`khmer`,0) + ifnull(`physical`,0) + ifnull(`chemistry`,0) + ifnull(`biology`,0) + ifnull(`history`,0) + ifnull(`polroth`,0) + ifnull(`sport`,0) + ifnull(`polakam`,0) + ifnull(`phandey`,0) + ifnull(`kehak`,0) + ifnull(`english`,0) + ifnull(`phum`,0) / `avg_m`)) STORED,
  `total` double GENERATED ALWAYS AS (if(`grade` = 9 or `grade` = 12,if(`month_id` = 3 or `month_id` = 7,ifnull(`math`,0) + ifnull(`khmer`,0) + ifnull(`physical`,0) + ifnull(`chemistry`,0) + ifnull(`biology`,0) + ifnull(`history`,0) + ifnull(`polroth`,0) + ifnull(`sport`,0) + ifnull(`polakam`,0) + ifnull(`phandey`,0) + ifnull(`kehak`,0) + ifnull(`english`,0) + ifnull(`phum`,0) - 25,ifnull(`math`,0) + ifnull(`khmer`,0) + ifnull(`physical`,0) + ifnull(`chemistry`,0) + ifnull(`biology`,0) + ifnull(`history`,0) + ifnull(`polroth`,0) + ifnull(`sport`,0) + ifnull(`polakam`,0) + ifnull(`phandey`,0) + ifnull(`kehak`,0) + ifnull(`english`,0) + ifnull(`phum`,0)),ifnull(`math`,0) + ifnull(`khmer`,0) + ifnull(`physical`,0) + ifnull(`chemistry`,0) + ifnull(`biology`,0) + ifnull(`history`,0) + ifnull(`polroth`,0) + ifnull(`sport`,0) + ifnull(`polakam`,0) + ifnull(`phandey`,0) + ifnull(`kehak`,0) + ifnull(`english`,0) + ifnull(`phum`,0))) STORED,
  `avg` float GENERATED ALWAYS AS (`total` / `avg_m`) STORED,
  `score_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `score_cc_online`
--

INSERT INTO `score_cc_online` (`id`, `student_id`, `grade`, `class_id`, `avg_m`, `month_id`, `math`, `khmer`, `physical`, `chemistry`, `biology`, `history`, `phum`, `polroth`, `teasekdey`, `writting`, `sport`, `polakam`, `phandey`, `kehak`, `english`, `created_at`, `updated_at`, `score_type`) VALUES
(1, 404, 7, 17, 10, 1, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 2),
(2, 392, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 403, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 385, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 400, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 377, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 398, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(8, 394, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, 389, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(10, 388, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 383, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(12, 386, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 374, 7, 17, 10, 1, 70, 70, 70, 70, 70, 70, 70, 70, 70, 80, 70, 70, 70, 70, 70, NULL, NULL, 2),
(14, 384, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(15, 387, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(16, 399, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(17, 381, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(18, 402, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(19, 390, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(20, 376, 7, 17, 10, 1, 75, 75, 75, 75, 75, 75, 75, 80, 70, 80, 75, 75, 75, 75, 75, NULL, NULL, 2),
(21, 375, 7, 17, 10, 1, 74, 71, 70, 75, 75, 70, 74, 70, 70, 70, 70, 70, 70, 58, 70, NULL, NULL, 1),
(22, 380, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(23, 396, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(24, 378, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(25, 393, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(26, 382, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(27, 391, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(28, 379, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(29, 401, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(30, 397, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(31, 595, 7, 17, 10, 1, 60, 60, 60, 60, 60, 60, 60, 60, 70, 70, 60, 60, 60, 60, 60, NULL, NULL, 1),
(32, 737, 7, 17, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(33, 404, 7, 17, 10, 2, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 1),
(34, 392, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(35, 403, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(36, 385, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(37, 400, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(38, 377, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(39, 398, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(40, 394, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(41, 389, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(42, 388, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(43, 383, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(44, 386, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(45, 374, 7, 17, 10, 2, 70, 70, 70, 70, 70, 58, 80, 58, 70, 70, 70, 70, 70, 70, 70, NULL, NULL, 2),
(46, 384, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(47, 387, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(48, 399, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(49, 381, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(50, 402, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(51, 390, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(52, 376, 7, 17, 10, 2, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, NULL, NULL, 2),
(53, 375, 7, 17, 10, 2, 74, 74, 74, 75, 74, 70, 70, 60, 80, 60, 74, 70, 74, 74, 70, NULL, NULL, 1),
(54, 380, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(55, 396, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(56, 378, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(57, 393, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(58, 382, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(59, 391, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(60, 379, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(61, 401, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(62, 397, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(63, 595, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(64, 737, 7, 17, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(65, 404, 7, 17, 10, 12, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 1),
(66, 392, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(67, 403, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(68, 385, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(69, 400, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(70, 377, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(71, 398, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(72, 394, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(73, 389, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(74, 388, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(75, 383, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(76, 386, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(77, 374, 7, 17, 10, 12, 45, 85, 70, 70, 70, 85, 85, 70, 70, 70, 70, 71, 70, 70, 70, NULL, NULL, 2),
(78, 384, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(79, 387, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(80, 399, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(81, 381, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(82, 402, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(83, 390, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(84, 376, 7, 17, 10, 12, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, NULL, NULL, 2),
(85, 375, 7, 17, 10, 12, 74, 76, 70, 70, 70, 70, 80, 70, 70, 70, 70, 70, 70, 70, 70, NULL, NULL, 1),
(86, 380, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(87, 396, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(88, 378, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(89, 393, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(90, 382, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(91, 391, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(92, 379, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(93, 401, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(94, 397, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(95, 595, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(96, 737, 7, 17, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(97, 404, 7, 17, 10, 3, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 1),
(98, 392, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(99, 403, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(100, 385, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(101, 400, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(102, 377, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(103, 398, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(104, 394, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(105, 389, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(106, 388, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(107, 383, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(108, 386, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(109, 374, 7, 17, 10, 3, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, NULL, NULL, 2),
(110, 384, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(111, 387, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(112, 399, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(113, 381, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(114, 402, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(115, 390, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(116, 376, 7, 17, 10, 3, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, NULL, NULL, 2),
(117, 375, 7, 17, 10, 3, 90, 75, 71, 71, 70, 75, 80, 80, 70, 70, 78, 75, 76, 78, 79, NULL, NULL, 1),
(118, 380, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(119, 396, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(120, 378, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(121, 393, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(122, 382, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(123, 391, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(124, 379, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(125, 401, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(126, 397, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(127, 595, 7, 17, 10, 3, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 2),
(128, 737, 7, 17, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(129, 499, 8, 14, 12, 3, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 1),
(130, 485, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(131, 497, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(132, 487, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(133, 468, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(134, 472, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(135, 471, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(136, 475, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(137, 479, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(138, 483, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(139, 488, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(140, 476, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(141, 486, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(142, 492, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(143, 467, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(144, 493, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(145, 494, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(146, 469, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(147, 477, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(148, 470, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(149, 484, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(150, 482, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(151, 498, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(152, 490, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(153, 489, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(154, 496, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(155, 491, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(156, 473, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(157, 474, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(158, 481, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(159, 480, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(160, 478, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(161, 495, 8, 14, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(162, 499, 8, 14, 12, 1, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 1),
(163, 485, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(164, 497, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(165, 487, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(166, 468, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(167, 472, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(168, 471, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(169, 475, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(170, 479, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(171, 483, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(172, 488, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(173, 476, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(174, 486, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(175, 492, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(176, 467, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(177, 493, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(178, 494, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(179, 469, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(180, 477, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(181, 470, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(182, 484, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(183, 482, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(184, 498, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(185, 490, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(186, 489, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(187, 496, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(188, 491, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(189, 473, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(190, 474, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(191, 481, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(192, 480, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(193, 478, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(194, 495, 8, 14, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(195, 499, 8, 14, 12, 2, 50, 50, 50, 50, 50, 50, 50, 70, 40, 70, 50, 50, 50, 50, 50, NULL, NULL, 1),
(196, 485, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(197, 497, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(198, 487, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(199, 468, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(200, 472, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(201, 471, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(202, 475, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(203, 479, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(204, 483, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(205, 488, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(206, 476, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(207, 486, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(208, 492, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(209, 467, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(210, 493, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(211, 494, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(212, 469, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(213, 477, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(214, 470, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(215, 484, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(216, 482, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(217, 498, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(218, 490, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(219, 489, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(220, 496, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(221, 491, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(222, 473, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(223, 474, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(224, 481, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(225, 480, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(226, 478, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(227, 495, 8, 14, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(228, 499, 8, 14, 12, 12, 50, 57, 50, 50, 56, 55, 55, 50, 45, 50, 55, 55, 53, 57, 55, NULL, NULL, 1),
(229, 485, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(230, 497, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(231, 487, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(232, 468, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(233, 472, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(234, 471, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(235, 475, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(236, 479, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(237, 483, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(238, 488, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(239, 476, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(240, 486, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(241, 492, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(242, 467, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(243, 493, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(244, 494, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(245, 469, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(246, 477, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(247, 470, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(248, 484, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(249, 482, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(250, 498, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(251, 490, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(252, 489, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(253, 496, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(254, 491, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(255, 473, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(256, 474, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(257, 481, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(258, 480, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(259, 478, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(260, 495, 8, 14, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(261, 593, 9, 11, 13, 1, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 1),
(262, 574, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(263, 586, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(264, 592, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(265, 583, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(266, 584, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(267, 582, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(268, 588, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(269, 580, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(270, 590, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(271, 567, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(272, 568, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(273, 591, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(274, 570, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(275, 576, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(276, 571, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(277, 569, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(278, 589, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(279, 566, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(280, 575, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(281, 581, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(282, 577, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(283, 578, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(284, 572, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(285, 573, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(286, 587, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(287, 579, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(288, 585, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(289, 594, 9, 11, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(290, 593, 9, 11, 13, 2, 50, 52, 50, 50, 50, 50, 50, 50, 53, 53, 50, 50, 50, 50, 50, NULL, NULL, 1),
(291, 574, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(292, 586, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(293, 592, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(294, 583, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(295, 584, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(296, 582, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(297, 588, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(298, 580, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(299, 590, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(300, 567, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(301, 568, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(302, 591, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(303, 570, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(304, 576, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(305, 571, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(306, 569, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(307, 589, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(308, 566, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(309, 575, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(310, 581, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(311, 577, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(312, 578, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(313, 572, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(314, 573, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(315, 587, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(316, 579, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(317, 585, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(318, 594, 9, 11, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(319, 593, 9, 11, 13, 3, 56, 51, 59, 60, 63, 50, 57, 52, 55, 53, 50, 50, 63, 50, 63, NULL, NULL, 1),
(320, 574, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(321, 586, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(322, 592, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(323, 583, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(324, 584, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(325, 582, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(326, 588, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(327, 580, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(328, 590, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(329, 567, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(330, 568, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(331, 591, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(332, 570, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(333, 576, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(334, 571, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(335, 569, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(336, 589, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(337, 566, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(338, 575, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(339, 581, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(340, 577, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(341, 578, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(342, 572, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(343, 573, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(344, 587, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(345, 579, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(346, 585, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(347, 594, 9, 11, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(348, 593, 9, 11, 13, 12, 55, 55, 55, 55, 55, 60, 55, 60, 50, 55, 53, 50, 55, 55, 55, NULL, NULL, 1),
(349, 574, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(350, 586, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(351, 592, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(352, 583, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(353, 584, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(354, 582, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(355, 588, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(356, 580, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(357, 590, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(358, 567, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(359, 568, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(360, 591, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(361, 570, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(362, 576, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(363, 571, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(364, 569, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(365, 589, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(366, 566, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(367, 575, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(368, 581, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(369, 577, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(370, 578, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(371, 572, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(372, 573, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(373, 587, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(374, 579, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(375, 585, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(376, 594, 9, 11, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(377, 651, 10, 8, 13, 1, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(378, 652, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(379, 653, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(380, 654, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(381, 655, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(382, 656, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(383, 657, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(384, 658, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(385, 659, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(386, 660, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(387, 661, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(388, 662, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(389, 682, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(390, 663, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(391, 664, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `score_cc_online` (`id`, `student_id`, `grade`, `class_id`, `avg_m`, `month_id`, `math`, `khmer`, `physical`, `chemistry`, `biology`, `history`, `phum`, `polroth`, `teasekdey`, `writting`, `sport`, `polakam`, `phandey`, `kehak`, `english`, `created_at`, `updated_at`, `score_type`) VALUES
(392, 665, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(393, 666, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(394, 667, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(395, 668, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(396, 669, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(397, 670, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(398, 671, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(399, 672, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(400, 673, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(401, 674, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(402, 675, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(403, 676, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(404, 683, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(405, 677, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(406, 678, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(407, 681, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(408, 680, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(409, 679, 10, 8, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(410, 651, 10, 8, 13, 2, 55, 60, 55, 60, 60, 57, 55, 60, NULL, NULL, 65, 65, 70, 55, 80, NULL, NULL, 1),
(411, 652, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(412, 653, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(413, 654, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(414, 655, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(415, 656, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(416, 657, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(417, 658, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(418, 659, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(419, 660, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(420, 661, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(421, 662, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(422, 682, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(423, 663, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(424, 664, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(425, 665, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(426, 666, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(427, 667, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(428, 668, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(429, 669, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(430, 670, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(431, 671, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(432, 672, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(433, 673, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(434, 674, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(435, 675, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(436, 676, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(437, 683, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(438, 677, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(439, 678, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(440, 681, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(441, 680, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(442, 679, 10, 8, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(443, 651, 10, 8, 13, 3, 55, 55, 55, 55, 55, 55, 55, 55, NULL, NULL, 55, 55, 55, 55, 55, NULL, NULL, 1),
(444, 652, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(445, 653, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(446, 654, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(447, 655, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(448, 656, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(449, 657, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(450, 658, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(451, 659, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(452, 660, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(453, 661, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(454, 662, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(455, 682, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(456, 663, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(457, 664, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(458, 665, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(459, 666, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(460, 667, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(461, 668, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(462, 669, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(463, 670, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(464, 671, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(465, 672, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(466, 673, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(467, 674, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(468, 675, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(469, 676, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(470, 683, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(471, 677, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(472, 678, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(473, 681, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(474, 680, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(475, 679, 10, 8, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(476, 651, 10, 8, 13, 12, 55, 55, 55, 55, 55, 55, 55, 55, NULL, NULL, 55, 55, 55, 55, 55, NULL, NULL, 1),
(477, 652, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(478, 653, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(479, 654, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(480, 655, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(481, 656, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(482, 657, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(483, 658, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(484, 659, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(485, 660, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(486, 661, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(487, 662, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(488, 682, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(489, 663, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(490, 664, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(491, 665, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(492, 666, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(493, 667, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(494, 668, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(495, 669, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(496, 670, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(497, 671, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(498, 672, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(499, 673, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(500, 674, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(501, 675, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(502, 676, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(503, 683, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(504, 677, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(505, 678, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(506, 681, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(507, 680, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(508, 679, 10, 8, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(509, 775, 11, 5, 14, 1, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 50, 50, 50, 50, 50, NULL, NULL, 1),
(510, 763, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(511, 766, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(512, 770, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(513, 759, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(514, 755, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(515, 754, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(516, 771, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(517, 768, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(518, 760, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(519, 761, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(520, 767, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(521, 762, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(522, 769, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(523, 749, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(524, 758, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(525, 748, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(526, 764, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(527, 756, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(528, 765, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(529, 752, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(530, 751, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(531, 757, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(532, 753, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(533, 750, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(534, 772, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(535, 773, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(536, 774, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(537, 747, 11, 5, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(538, 775, 11, 5, 13, 2, 50, 23, 55, 48, 46, 21, 55, 23, NULL, NULL, 58, NULL, 42, 58, 42, NULL, NULL, 1),
(539, 763, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(540, 766, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(541, 770, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(542, 759, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(543, 755, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(544, 754, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(545, 771, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(546, 768, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(547, 760, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(548, 761, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(549, 767, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(550, 762, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(551, 769, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(552, 749, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(553, 758, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(554, 748, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(555, 764, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(556, 756, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(557, 765, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(558, 752, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(559, 751, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(560, 757, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(561, 753, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(562, 750, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(563, 772, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(564, 773, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(565, 774, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(566, 747, 11, 5, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(567, 775, 11, 5, 13, 3, 40, 40, 40, 40, 40, 40, 40, 40, NULL, NULL, 40, 40, 4, 40, 40, NULL, NULL, 1),
(568, 763, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(569, 766, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(570, 770, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(571, 759, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(572, 755, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(573, 754, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(574, 771, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(575, 768, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(576, 760, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(577, 761, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(578, 767, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(579, 762, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(580, 769, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(581, 749, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(582, 758, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(583, 748, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(584, 764, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(585, 756, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(586, 765, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(587, 752, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(588, 751, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(589, 757, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(590, 753, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(591, 750, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(592, 772, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(593, 773, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(594, 774, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(595, 747, 11, 5, 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(596, 775, 11, 5, 13, 12, 55, 50, 52, 60, 58, 55, 50, 50, NULL, NULL, 50, 50, 58, 58, 59, NULL, NULL, 1),
(597, 763, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(598, 766, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(599, 770, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(600, 759, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(601, 755, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(602, 754, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(603, 771, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(604, 768, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(605, 760, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(606, 761, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(607, 767, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(608, 762, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(609, 769, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(610, 749, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(611, 758, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(612, 748, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(613, 764, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(614, 756, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(615, 765, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(616, 752, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(617, 751, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(618, 757, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(619, 753, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(620, 750, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(621, 772, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(622, 773, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(623, 774, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(624, 747, 11, 5, 13, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(625, 859, 12, 1, 12, 1, 55, 50, 50, 50, 50, 55, 60, 55, NULL, NULL, 50, 50, 50, 50, 50, NULL, NULL, 2),
(626, 833, 12, 1, 12, 1, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(627, 844, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(628, 849, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(629, 851, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(630, 836, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(631, 841, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(632, 837, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(633, 846, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(634, 838, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(635, 843, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(636, 850, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(637, 834, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(638, 840, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(639, 845, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(640, 835, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(641, 848, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(642, 842, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(643, 847, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(644, 852, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(645, 854, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(646, 855, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(647, 856, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(648, 857, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(649, 858, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(650, 839, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(651, 622, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(652, 828, 12, 1, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(653, 859, 12, 1, 12, 2, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 2),
(654, 833, 12, 1, 12, 2, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(655, 844, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(656, 849, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(657, 851, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(658, 836, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(659, 841, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(660, 837, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(661, 846, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(662, 838, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(663, 843, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(664, 850, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(665, 834, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(666, 840, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(667, 845, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(668, 835, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(669, 848, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(670, 842, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(671, 847, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(672, 852, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(673, 854, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(674, 855, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(675, 856, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(676, 857, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(677, 858, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(678, 839, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(679, 622, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(680, 828, 12, 1, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(681, 859, 12, 1, 12, 3, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 2),
(682, 833, 12, 1, 12, 3, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(683, 844, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(684, 849, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(685, 851, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(686, 836, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(687, 841, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(688, 837, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(689, 846, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(690, 838, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(691, 843, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(692, 850, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(693, 834, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(694, 840, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(695, 845, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(696, 835, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(697, 848, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(698, 842, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(699, 847, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(700, 852, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(701, 854, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(702, 855, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(703, 856, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(704, 857, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(705, 858, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(706, 839, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(707, 622, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(708, 828, 12, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(709, 859, 12, 1, 12, 12, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 2),
(710, 833, 12, 1, 12, 12, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(711, 844, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(712, 849, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(713, 851, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(714, 836, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(715, 841, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(716, 837, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(717, 846, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(718, 838, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(719, 843, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(720, 850, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(721, 834, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(722, 840, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(723, 845, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(724, 835, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(725, 848, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(726, 842, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(727, 847, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(728, 852, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(729, 854, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(730, 855, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(731, 856, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(732, 857, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(733, 858, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(734, 839, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(735, 622, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(736, 828, 12, 1, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(737, 859, 12, 1, 12, 4, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(738, 833, 12, 1, 12, 4, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 50, 50, 50, 50, 50, NULL, NULL, 1),
(739, 844, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(740, 849, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(741, 851, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(742, 836, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(743, 841, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(744, 837, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(745, 846, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(746, 838, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(747, 843, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(748, 850, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(749, 834, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(750, 840, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(751, 845, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(752, 835, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(753, 848, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(754, 842, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(755, 847, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(756, 852, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(757, 854, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(758, 855, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(759, 856, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(760, 857, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(761, 858, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(762, 839, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(763, 622, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(764, 828, 12, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(765, 859, 12, 1, 12, 5, 55, 50, 55, 55, 55, 50, 50, 50, NULL, NULL, 55, 55, 55, 55, 55, NULL, NULL, 1),
(766, 833, 12, 1, 12, 5, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 50, 50, 50, 50, 50, NULL, NULL, 1),
(767, 844, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(768, 849, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(769, 851, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(770, 836, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(771, 841, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(772, 837, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(773, 846, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(774, 838, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(775, 843, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(776, 850, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(777, 834, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(778, 840, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(779, 845, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `score_cc_online` (`id`, `student_id`, `grade`, `class_id`, `avg_m`, `month_id`, `math`, `khmer`, `physical`, `chemistry`, `biology`, `history`, `phum`, `polroth`, `teasekdey`, `writting`, `sport`, `polakam`, `phandey`, `kehak`, `english`, `created_at`, `updated_at`, `score_type`) VALUES
(780, 835, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(781, 848, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(782, 842, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(783, 847, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(784, 852, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(785, 854, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(786, 855, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(787, 856, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(788, 857, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(789, 858, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(790, 839, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(791, 622, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(792, 828, 12, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(793, 859, 12, 1, 12, 6, 60, 60, 60, 60, 60, 50, 50, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(794, 833, 12, 1, 12, 6, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 50, 50, 50, 50, 50, NULL, NULL, 1),
(795, 844, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(796, 849, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(797, 851, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(798, 836, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(799, 841, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(800, 837, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(801, 846, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(802, 838, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(803, 843, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(804, 850, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(805, 834, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(806, 840, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(807, 845, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(808, 835, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(809, 848, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(810, 842, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(811, 847, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(812, 852, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(813, 854, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(814, 855, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(815, 856, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(816, 857, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(817, 858, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(818, 839, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(819, 622, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(820, 828, 12, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(821, 859, 12, 1, 12, 7, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(822, 833, 12, 1, 12, 7, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 50, 50, 50, 50, 50, NULL, NULL, 1),
(823, 844, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(824, 849, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(825, 851, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(826, 836, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(827, 841, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(828, 837, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(829, 846, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(830, 838, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(831, 843, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(832, 850, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(833, 834, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(834, 840, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(835, 845, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(836, 835, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(837, 848, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(838, 842, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(839, 847, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(840, 852, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(841, 854, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(842, 855, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(843, 856, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(844, 857, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(845, 858, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(846, 839, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(847, 622, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(848, 828, 12, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(849, 595, 9, 11, 13, 4, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 1),
(850, 593, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(851, 574, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(852, 586, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(853, 592, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(854, 583, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(855, 584, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(856, 582, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(857, 588, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(858, 580, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(859, 590, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(860, 567, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(861, 568, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(862, 591, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(863, 570, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(864, 576, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(865, 571, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(866, 569, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(867, 589, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(868, 566, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(869, 575, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(870, 581, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(871, 577, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(872, 578, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(873, 572, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(874, 573, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(875, 587, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(876, 579, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(877, 585, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(878, 594, 9, 11, 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(879, 595, 9, 11, 12, 5, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 1),
(880, 593, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(881, 574, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(882, 586, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(883, 592, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(884, 583, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(885, 584, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(886, 582, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(887, 588, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(888, 580, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(889, 590, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(890, 567, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(891, 568, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(892, 591, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(893, 570, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(894, 576, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(895, 571, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(896, 569, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(897, 589, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(898, 566, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(899, 575, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(900, 581, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(901, 577, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(902, 578, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(903, 572, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(904, 573, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(905, 587, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(906, 579, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(907, 585, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(908, 594, 9, 11, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(909, 595, 9, 11, 12, 6, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 1),
(910, 593, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(911, 574, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(912, 586, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(913, 592, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(914, 583, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(915, 584, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(916, 582, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(917, 588, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(918, 580, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(919, 590, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(920, 567, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(921, 568, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(922, 591, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(923, 570, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(924, 576, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(925, 571, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(926, 569, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(927, 589, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(928, 566, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(929, 575, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(930, 581, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(931, 577, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(932, 578, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(933, 572, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(934, 573, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(935, 587, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(936, 579, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(937, 585, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(938, 594, 9, 11, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(939, 595, 9, 11, 12, 7, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 1),
(940, 593, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(941, 574, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(942, 586, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(943, 592, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(944, 583, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(945, 584, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(946, 582, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(947, 588, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(948, 580, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(949, 590, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(950, 567, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(951, 568, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(952, 591, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(953, 570, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(954, 576, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(955, 571, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(956, 569, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(957, 589, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(958, 566, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(959, 575, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(960, 581, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(961, 577, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(962, 578, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(963, 572, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(964, 573, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(965, 587, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(966, 579, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(967, 585, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(968, 594, 9, 11, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(969, 859, 12, 1, 12, 8, 50, 65, 50, 50, 50, 60, 50, 60, NULL, NULL, 50, 50, 50, 50, 50, NULL, NULL, 1),
(970, 833, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(971, 844, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(972, 849, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(973, 851, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(974, 836, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(975, 841, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(976, 837, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(977, 846, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(978, 838, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(979, 843, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(980, 850, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(981, 834, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(982, 840, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(983, 845, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(984, 835, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(985, 848, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(986, 842, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(987, 847, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(988, 852, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(989, 854, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(990, 855, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(991, 856, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(992, 857, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(993, 858, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(994, 839, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(995, 622, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(996, 828, 12, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(997, 859, 12, 1, 12, 9, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(998, 833, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(999, 844, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1000, 849, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1001, 851, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1002, 836, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1003, 841, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1004, 837, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1005, 846, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1006, 838, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1007, 843, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1008, 850, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1009, 834, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1010, 840, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1011, 845, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1012, 835, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1013, 848, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1014, 842, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1015, 847, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1016, 852, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1017, 854, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1018, 855, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1019, 856, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1020, 857, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1021, 858, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1022, 839, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1023, 622, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1024, 828, 12, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1025, 859, 12, 1, 12, 10, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(1026, 833, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1027, 844, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1028, 849, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1029, 851, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1030, 836, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1031, 841, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1032, 837, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1033, 846, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1034, 838, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1035, 843, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1036, 850, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1037, 834, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1038, 840, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1039, 845, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1040, 835, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1041, 848, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1042, 842, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1043, 847, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1044, 852, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1045, 854, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1046, 855, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1047, 856, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1048, 857, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1049, 858, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1050, 839, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1051, 622, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1052, 828, 12, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1053, 859, 12, 1, 12, 11, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 60, 60, 60, 60, 60, NULL, NULL, 1),
(1054, 833, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1055, 844, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1056, 849, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1057, 851, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1058, 836, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1059, 841, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1060, 837, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1061, 846, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1062, 838, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1063, 843, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1064, 850, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1065, 834, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1066, 840, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1067, 845, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1068, 835, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1069, 848, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1070, 842, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1071, 847, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1072, 852, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1073, 854, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1074, 855, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1075, 856, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1076, 857, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1077, 858, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1078, 839, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1079, 622, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1080, 828, 12, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1081, 404, 7, 17, 10, 5, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, NULL, NULL, 2),
(1082, 392, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1083, 403, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1084, 385, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1085, 400, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1086, 377, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1087, 398, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1088, 394, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1089, 389, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1090, 388, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1091, 383, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1092, 386, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1093, 374, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1094, 384, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1095, 387, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1096, 399, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1097, 381, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1098, 402, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1099, 390, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1100, 376, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1101, 375, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1102, 380, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1103, 396, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1104, 378, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1105, 393, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1106, 382, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1107, 391, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1108, 379, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1109, 401, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1110, 397, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1111, 595, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1112, 737, 7, 17, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1113, 404, 7, 17, 10, 4, 50, 49, 48, 47, 46, 52, 51, 53, 55, 54, 41, 41, 45, 44, 43, NULL, NULL, 2),
(1114, 392, 7, 17, 10, 4, 50, 49, 48, 47, 46, 52, 51, 53, 55, 54, 41, 41, 45, 44, 43, NULL, NULL, 1),
(1115, 403, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1116, 385, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1117, 400, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1118, 377, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1119, 398, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1120, 394, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1121, 389, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1122, 388, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1123, 383, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1124, 386, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1125, 374, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1126, 384, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1127, 387, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1128, 399, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1129, 381, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1130, 402, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1131, 390, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1132, 376, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1133, 375, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1134, 380, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1135, 396, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1136, 378, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1137, 393, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1138, 382, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1139, 391, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1140, 379, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1141, 401, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1142, 397, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1143, 595, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1144, 737, 7, 17, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1145, 404, 7, 17, 10, 6, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, NULL, NULL, 1),
(1146, 392, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1147, 403, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1148, 385, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1149, 400, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1150, 377, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1151, 398, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1152, 394, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1153, 389, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1154, 388, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1155, 383, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1156, 386, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1157, 374, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1158, 384, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1159, 387, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1160, 399, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1161, 381, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1162, 402, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1163, 390, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1164, 376, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1165, 375, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1166, 380, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `score_cc_online` (`id`, `student_id`, `grade`, `class_id`, `avg_m`, `month_id`, `math`, `khmer`, `physical`, `chemistry`, `biology`, `history`, `phum`, `polroth`, `teasekdey`, `writting`, `sport`, `polakam`, `phandey`, `kehak`, `english`, `created_at`, `updated_at`, `score_type`) VALUES
(1167, 396, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1168, 378, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1169, 393, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1170, 382, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1171, 391, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1172, 379, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1173, 401, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1174, 397, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1175, 595, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1176, 737, 7, 17, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `score_fla`
--

CREATE TABLE `score_fla` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `r` float DEFAULT NULL,
  `s` float DEFAULT NULL,
  `l` float DEFAULT NULL,
  `w` float DEFAULT NULL,
  `g` float DEFAULT NULL,
  `v` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `cp` float DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total` float GENERATED ALWAYS AS (ifnull(`r`,0) + ifnull(`s`,0) + ifnull(`l`,0) + ifnull(`w`,0) + ifnull(`g`,0) + ifnull(`v`,0) + ifnull(`h`,0) + ifnull(`cp`,0)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `score_fla`
--

INSERT INTO `score_fla` (`id`, `student_id`, `class_id`, `month_id`, `r`, `s`, `l`, `w`, `g`, `v`, `h`, `cp`, `created_by`, `updated_by`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 10, 9, 9, 10, 10, 9, 9, 9, NULL, NULL, 0, '2019-12-17 21:23:05', '2019-12-17 21:34:00'),
(2, 2, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-12-17 21:23:05', '2019-12-18 03:22:16'),
(3, 1, 3, 2, 9, 10, 9, 8, 7, 6, 8, 9, NULL, NULL, 0, '2019-12-17 21:34:25', '2019-12-17 21:34:25'),
(4, 2, 3, 2, 10, 9, 8, 8, 9, 9, 10, 9, NULL, NULL, 0, '2019-12-17 21:34:25', '2019-12-17 21:34:25'),
(5, 1, 3, 12, 9, 9, 9, 9, 9, 9, 9, 9, NULL, NULL, 0, '2019-12-17 21:34:45', '2019-12-17 21:34:45'),
(6, 2, 3, 12, 8, 9, 8, 7, 8, 9, 8, 7, NULL, NULL, 0, '2019-12-17 21:34:45', '2019-12-18 03:11:22'),
(7, 595, 21, 1, 23, 33, 33, 33, 33, 33, 33, 33, NULL, NULL, 0, '2021-01-10 20:37:43', '2021-01-10 20:37:43'),
(8, 737, 21, 1, 33, 33, 33, 33, 33, 33, 33, 33, NULL, NULL, 0, '2021-01-10 20:37:43', '2021-01-10 20:37:43'),
(9, 867, 21, 1, 11, 22, 33, 22, 23, 23, 23, 33, NULL, NULL, 0, '2021-01-10 20:37:43', '2021-01-10 20:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `score_online`
--

CREATE TABLE `score_online` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `exam` double DEFAULT NULL,
  `homework` double DEFAULT NULL,
  `attendance` double DEFAULT NULL,
  `quiz` double DEFAULT NULL,
  `total` double GENERATED ALWAYS AS (ifnull(`exam` * 50 / 100,0) + ifnull(`homework` * 20 / 100,0) + ifnull(`attendance` * 10 / 100,0) + ifnull(`quiz` * 20 / 100,0)) STORED,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `score_online`
--

INSERT INTO `score_online` (`id`, `student_id`, `class_id`, `month_id`, `subject_id`, `exam`, `homework`, `attendance`, `quiz`, `created_at`, `updated_at`) VALUES
(1, 859, 1, 1, 1, NULL, 10, 10, 10, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(2, 833, 1, 1, 1, 80, 10, 15, 15, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(3, 844, 1, 1, 1, 80, 10, 10, 10, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(4, 849, 1, 1, 1, 70, 30, 20, 20, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(5, 851, 1, 1, 1, 50, 15, 15, 20, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(6, 836, 1, 1, 1, 65, 20, 15, 17, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(7, 841, 1, 1, 1, 68, 15, 15, 15, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(8, 837, 1, 1, 1, 63, 25, 20, 20, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(9, 846, 1, 1, 1, 74, 14, 15, 18, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(10, 838, 1, 1, 1, 88, 22, 14, 14, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(11, 843, 1, 1, 1, 61, 20, 20, 20, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(12, 850, 1, 1, 1, 57, 20, 20, 20, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(13, 834, 1, 1, 1, 86, 20, 20, 20, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(14, 840, 1, 1, 1, 65, 30, 30, 30, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(15, 845, 1, 1, 1, 65, 24, 24, 24, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(16, 835, 1, 1, 1, 68, 25, 25, 24, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(17, 848, 1, 1, 1, 74, 15, 17, 18, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(18, 842, 1, 1, 1, 75, 18, 12, 14, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(19, 847, 1, 1, 1, 80, 12, 20, 30, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(20, 852, 1, 1, 1, 47, 12, 32, 12, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(21, 853, 1, 1, 1, 49, 21, 21, 22, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(22, 854, 1, 1, 1, 70, 22, 22, 22, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(23, 855, 1, 1, 1, 80, 21, 21, 21, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(24, 856, 1, 1, 1, 70, 24, 24, 24, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(25, 857, 1, 1, 1, 75, 21, 21, 21, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(26, 858, 1, 1, 1, 46, 21, 23, 33, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(27, 839, 1, 1, 1, 74, 21, 21, 21, '2020-05-15 02:06:08', '2020-05-15 02:06:08'),
(28, 859, 1, 1, 2, 50, 50, 50, 50, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(29, 833, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(30, 844, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(31, 849, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(32, 851, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(33, 836, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(34, 841, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(35, 837, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(36, 846, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(37, 838, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(38, 843, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(39, 850, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(40, 834, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(41, 840, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(42, 845, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(43, 835, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(44, 848, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(45, 842, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(46, 847, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(47, 852, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(48, 853, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(49, 854, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(50, 855, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(51, 856, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(52, 857, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(53, 858, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51'),
(54, 839, 1, 1, 2, NULL, NULL, NULL, NULL, '2020-05-15 03:22:51', '2020-05-15 03:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `id` int(11) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`id`, `service_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tuition Fee', 0, '2020-11-05 09:40:02', '2020-11-05 09:40:02'),
(2, 'Uniform & Shoes', 0, '2020-11-05 09:40:24', '2020-11-05 09:40:24'),
(3, 'FLA Fee', 0, '2020-11-05 09:57:43', '2020-11-05 09:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `student_id` varchar(250) DEFAULT NULL,
  `student_id_ac` varchar(150) DEFAULT NULL,
  `student_id_fla` varchar(150) DEFAULT NULL,
  `kh_name` varchar(250) DEFAULT NULL,
  `en_name` varchar(250) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone_student` varchar(100) DEFAULT NULL,
  `national` varchar(150) DEFAULT NULL,
  `village_pob` varchar(250) DEFAULT NULL,
  `commue_pob` varchar(250) DEFAULT NULL,
  `district_pob` varchar(250) DEFAULT NULL,
  `province_pob` varchar(250) DEFAULT NULL,
  `village_current` varchar(250) DEFAULT NULL,
  `commue_current` varchar(250) DEFAULT NULL,
  `district_current` varchar(250) DEFAULT NULL,
  `province_current` varchar(250) DEFAULT NULL,
  `old_grade` varchar(100) DEFAULT NULL,
  `old_school` varchar(100) DEFAULT NULL,
  `old_en_grade` varchar(100) DEFAULT NULL,
  `farther_name` varchar(250) DEFAULT NULL,
  `mother_name` varchar(250) DEFAULT NULL,
  `farther_job` varchar(100) DEFAULT NULL,
  `mother_job` varchar(100) DEFAULT NULL,
  `national_far` varchar(100) DEFAULT NULL,
  `national_mother` varchar(100) DEFAULT NULL,
  `phone_farther` varchar(100) DEFAULT NULL,
  `address_farther` varchar(400) DEFAULT NULL,
  `address_mother` varchar(400) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` int(2) DEFAULT 0,
  `campus_id` int(3) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `type_student` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(1, '000612', '1', '1', 'ខុម ណាឃីង', 'KHOM NAKHING', 'M', '2012-12-16', '099755505', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(2, '000754', NULL, NULL, 'គង់ ឈិនហ៊ុយ', 'KONG CHHINHUY', 'ប', '2013-12-18', '016237666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(3, '000749', NULL, NULL, 'គឹម ហាក់សេង', 'KIM  HAKSENG', 'ប', '2013-03-03', '092693538', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(4, '000805', NULL, NULL, 'គុយ ស៊ូហ្សា', 'KUY SOUZA', 'ស', '2012-06-23', '092691557', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(5, '000804', NULL, NULL, 'ជាវ ជុតិបុណ្ណា', 'CHEAV CHUTEBONNA', 'ស', '2013-07-03', '092861860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(6, '000774', NULL, NULL, 'ជូ  ម៉ាយ៉ាវីន', 'CHOU  MAYAVIN', 'ស', '2013-05-09', '081588868', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(7, '000822', NULL, NULL, 'ណារ៉ូ រិទ្ធីស័ក្ក', 'NARO  RITHISAK', NULL, '2013-06-23', '093335198', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(8, '000821', NULL, NULL, 'ទឹម ម៉ូនីតាជូលី', 'TEM  MONYJULY', 'ស', '2013-03-08', '0968315900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(9, '000756', NULL, NULL, 'ម៉េត ចន្ទសារពេជ្រ', 'METH CHANSARAPICH', 'ស', '2013-12-24', '012383823', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(10, '000842', NULL, NULL, 'មឿន វណ្ណាដាអេម៉ា', 'MOEUN VANNADA EVA', 'ស', '2013-05-06', '098209004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(11, '000814', NULL, NULL, 'រ៉ូត ស៊ីវម៉ី', 'ROT  SIVMEY', 'ស', '2014-01-17', '092281033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(12, '000751', NULL, NULL, 'លី ភាតរៈ', 'LY  PHEATRAK', 'ប', '2012-11-14', '077303329', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(13, '000799', NULL, NULL, 'លី អានស៊ីង', 'LY  ANSING', 'ប', '2014-01-25', '011444485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(14, '000820', NULL, NULL, 'លីម គីមហ្ចូ', 'LIM  KIMFOU', 'ប', '2013-10-09', '089299209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(15, '000833', NULL, NULL, 'វង្សយ៉ារ៉ា ណាត់ថាឆា', 'VONGJARA NATTACHA', 'ស', '2013-03-28', '061413456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(16, '000796', NULL, NULL, 'វ៉ាន់ លីលី', 'VANN LYLY', 'ស', '2013-11-08', '069376667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:08', '2020-05-12 00:45:08', 0, 1, 1, 1),
(17, '000750', NULL, NULL, 'វឿន វុធារីតា', 'VOEUN VUTHEARINA', 'ស', '2013-04-01', '099228522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(18, '000825', NULL, NULL, 'សឺត ម៉ានីណា', 'SEUTH MANINA', 'ស', '2013-08-11', '017360444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(19, '000794', NULL, NULL, 'សុវណ្ណ ភេទើ', 'SOVANN PETER', 'ប', '2013-06-06', '012386884', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(20, '000837', NULL, NULL, 'សុខ ផាត់នាគុណ', 'SOK PHATNEAKUN', 'ស', '2013-06-07', '061994461', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(21, '000753', NULL, NULL, 'អ៊ុំ ហេងឃុនស៊ូ', 'OUM HENGKHUNSOU', 'ប', '2014-11-10', '012259971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(22, '000801', NULL, NULL, 'គង់ សុងហុង', 'KONG SONGHONG', 'ប', '2013-10-13', '061555556', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(23, '000806', NULL, NULL, 'គឹម វេជ្ជបញ្ញា', 'KIM  VECHPANHA', 'ប', '2013-11-25', '012468787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(24, '000758', NULL, NULL, 'ណែត ម៉េងលី', 'NET  MENGLY', 'ប', '2013-05-28', '092564480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(25, '000829', NULL, NULL, 'ណែត រតនៈ', 'NET  RATTANAK', 'ប', '2013-12-21', '017744579', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(26, '000811', NULL, NULL, 'តាំង គីមជូ', 'TAING KIMCHOU', 'ស', '2013-11-05', '089224442', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(27, '000808', NULL, NULL, 'ទី ថាវរិន្ទ', 'TY  THAVRIN', 'ប', '2013-03-24', '068500085', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(28, '000761', NULL, NULL, 'ធី ហ្គិចហេង', 'THY  GECHHENG', 'ស', '2013-09-13', '012366722', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(29, '000757', NULL, NULL, 'ប៊ុន មុនីរ័ត្ន', 'BUN  MONIROTH', 'ស', '2014-04-01', '078766966', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(30, '000843', NULL, NULL, 'ផេង ម៉េងហេង', 'PHENG MENGHENG', 'ប', '2013-08-21', '0967944331', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(31, '000899', NULL, NULL, 'ពិសិដ្ឋ ជេស៊ីកា', 'PISITH JESSICA', 'ស', '2010-10-10', '098625555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(32, '000803', NULL, NULL, 'ម៉េង ស៊ីវអ៊ីង', 'MENG  SIV ING', 'ស', '2013-11-24', '012388854', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(33, '000795', NULL, NULL, 'យ៉ាំ គុយឆាង', 'YAIM  KUYCHHANG', 'ប', '2013-10-23', '012592526', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(34, '000793', NULL, NULL, 'លី ហុកធៀន', 'LY   HOKTHIEN', 'ប', '2013-09-22', '067888819', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(35, '000830', NULL, NULL, 'លឹម ឈុនលាង', 'LIM  CHHUNLEANG', 'ស', '2013-12-01', '012691313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(36, '000762', NULL, NULL, 'សុខ អេនជេលី', 'SOK  ENJELY', 'ស', '2013-07-02', '012541742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(37, '000798', NULL, NULL, 'សុខ នេត្រាជេហ្សីកា', 'SOK NETRAJESSICA', 'ស', '2013-12-07', '086555587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(38, '000792', NULL, NULL, 'សំអុន ឧត្ដមបញ្ញាសក្តិ', 'SAM ONN OUDOMPANHASAK', 'ប', '2013-06-08', '093854911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(39, '000877', NULL, NULL, 'សួង សុខវឌ្ឍនៈ', 'SUONG SOKVATHANAK', 'ប', '2013-12-22', '092222356', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(40, '000759', NULL, NULL, 'ហោន ធម្មជាតិ', 'HORN THOMCHEAT', 'ប', '2013-04-26', '011787009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(41, '000900', NULL, NULL, 'ឡោះ សុហ្វាមុនី', 'LORS SOFAMONY', 'ប', '2012-02-14', '069292975', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(42, '000832', NULL, NULL, 'ឡី ចាន់ធឿន', 'LEY  CHANTHOEUN', 'ស', '2012-11-17', '092426979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(43, '000773', NULL, NULL, 'ចំរើន ជាឈិន', 'CHAMROEUN CHEACHHIN', 'ប', '2013-12-31', '011396667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(44, '000780', NULL, NULL, 'ជា ច័ន្ទលាភ', 'CHEA CHANLEAP', 'ស', '2013-01-11', '016366447', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(45, '000688', NULL, NULL, 'ជា សុវណ្ណឆាយ', 'CHEA SOVANCHHAY', 'ប', '2013-01-18', '017447443', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(46, '000841', NULL, NULL, 'ជិន សុភ័ក្ត្រ', 'CHIN SOPHEAK', 'ប', '2012-10-01', '0អង្គការ Roof', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(47, '000777', NULL, NULL, 'ជីវ លាវហ្វូ', 'CHIV LEAVFOU', 'ប', '2013-09-15', '012656614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(48, '000810', NULL, NULL, 'ថង បញ្ញាវន្ត', 'THORNG PANHAVORN', 'ប', '2013-08-09', '012522490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(49, '000684', NULL, NULL, 'ធី កណ្ណិកា', 'THY KANIKA', 'ស', '2009-08-10', '010717147', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(50, '000827', NULL, NULL, 'នួន ថាណែល', 'NUON THANEL', 'ប', '2013-11-08', '086344699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(51, '000609', NULL, NULL, 'ពៅ ស្រីពេជ្រ', 'PEOU SREYPICH', 'ស', '2012-03-29', '012303821', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(52, '000836', NULL, NULL, 'រិទ្ធ រ័ត្នវិមាន', 'RITH ROTHVIMEAN', 'ស', '2013-03-18', '077705324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(53, '000779', NULL, NULL, 'រី សុខឧត្ដម', 'RY SOK OUDOM', 'ប', '2013-09-01', '092144741', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(54, '000620', NULL, NULL, 'លី ហ៊ុនស៊ូ', 'LY HUNSOU', 'ប', '2011-06-02', '067888819', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(55, '000857', NULL, NULL, 'វ័ន សុភ័ក្ត្រវិសាល', 'VORN SOPHEAKVISAL', 'ប', '2013-02-15', '017279027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(56, '000828', NULL, NULL, 'សយ វត្តី', 'SAY VATTEY', 'ស', '2013-04-18', '086344699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(57, '000838', NULL, NULL, 'សេង គិមហេង', 'SENG KIMHENG', 'ប', '2013-12-16', '092638298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(58, '000778', NULL, NULL, 'ហុក ជីនហ្វូ', 'HOK CHINFOU', 'ប', '2013-07-07', '012457126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(59, '000831', NULL, NULL, 'ហែម សិរីបុត្ត', 'HEM SEREYBOTH', 'ប', '2013-12-16', '086696923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(60, '000875', NULL, NULL, 'ហេង សុចិត្រា', 'HENG SOCHETTRA', 'ប', '2013-10-08', '070796962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(61, '000775', NULL, NULL, 'អ៊ីម វណ្ណនី', 'IM  VANNY', 'ស', '2013-12-26', '077725855', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(62, '000876', NULL, NULL, 'អោ មិញហ៊ួរ', 'OR  MINHHOUR', 'ប', '2014-01-28', '077810107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(63, '000776', NULL, NULL, 'អ៊ុំ មរកត', 'OUM MOROKORT', 'ស', '2013-10-20', '092274101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(64, '000689', NULL, NULL, 'ខែម កិត្តិគុណ', 'KHEM KETTEKUN', 'ស', '2012-04-08', '092717148', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(65, '000454', NULL, NULL, 'ខូវ សៀងទី', 'KHOV SIENGTY', 'ប', '2010-12-05', '092333321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(66, '000721', NULL, NULL, 'គង់  ឈឺនហូវ', 'KONG CHHENHOV', 'ប', '2009-04-27', '016237666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(67, '000608', NULL, NULL, 'ចាន់ សុណា', 'CHANN SONA', 'ស', '2012-09-01', '012303821', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(68, '000752', NULL, NULL, 'ចាន់ សុគន្ធនីកា', 'CHANN SOKUNNIKA', 'ស', '2013-09-16', '012360767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(69, '000685', NULL, NULL, 'ចាង ស៊ីងឡុង', 'JANG XINGLONG', 'ប', '2013-01-09', '017232997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(70, '000651', NULL, NULL, 'ជាង រ័ត្នបញ្ញាភា', 'CHEANG RATPANHAPHEA', 'ស', '2012-10-31', '012778405', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(71, '000700', NULL, NULL, 'ជាតិ ច័ន្ទសុធិម៉ា', 'CHEAT CHANSOTHIMA', 'ស', '2012-12-07', '092699069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(72, '000710', NULL, NULL, 'ឈួន ម៉ីឈីន', 'CHHUON MEYCHHIN', 'ស', '2012-11-07', '017445046', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(73, '000627', NULL, NULL, 'ណាល់ មុន្នីនាថ', 'NAL  MONYNEAT', 'ស', '2012-01-07', '012931516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(74, '000741', NULL, NULL, 'ថន ថានីន', 'THORN THANIN', 'ស', '2012-05-20', '098454534', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(75, '000592', NULL, NULL, 'ទឹម ចនសុន', 'TIM  JOHNSON', 'ប', '2011-07-27', '077375775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(76, '000618', NULL, NULL, 'ភ័ណ ដេវីន', 'PHORN DEVIN', 'ប', '2012-06-09', '017527952', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(77, '000661', NULL, NULL, 'ម៉ន ពេជដា', 'MORN PICHDA', 'ស', '2012-06-08', '089960979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(78, '000879', NULL, NULL, 'ម៉ារ៉ា ថេរយ៉ុង', 'MARA THEYONG', 'ប', '2012-05-13', '069323297', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(79, '000703', NULL, NULL, 'រេត សុវណ្ណរាជ', 'RETH SOVANNAREACH', 'ប', '2013-01-03', '061555057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(80, '000716', NULL, NULL, 'រ៉ូន ដារ៉ា', 'RON  DARA', 'ប', '2012-11-16', '092741298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(81, '000864', NULL, NULL, 'លីម ហ៊ងអ៊ីម', 'LIM HORNG IM', 'ស', '2012-09-08', '015222594', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(82, '000617', NULL, NULL, 'វង្ស នីកាជីងលីញ', 'VONG NIKAJINGLING', 'ស', '2012-07-08', '017424545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(83, '000690', NULL, NULL, 'វណ្ណ សុខជាតា', 'VANN SOKCHEATA', 'ស', '2012-03-14', '092610616', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(84, '000878', NULL, NULL, 'សុវណ្ណ សុជាតា', 'SOVANN SOCHEATA', 'ស', '2012-10-14', '098848758', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(85, '000854', NULL, NULL, 'សន  សុខអារុណា', 'SORN SOK ARUNA', 'ប', '2011-11-02', '012430065', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(86, '000654', NULL, NULL, 'ហ៊ សៀវម៉ីលីង', 'HOR SIEVMEYLING', 'ស', '2012-11-28', '095513373', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(87, '000726', NULL, NULL, 'ហុង មួយអេង', 'HONG MUOY ENG', 'ស', '2012-08-04', '011222348', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(88, '000649', NULL, NULL, 'ហួន គុជរក្សា', 'HUON KUCHREAKSA', 'ប', '2012-07-09', '011702387', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(89, '000704', NULL, NULL, 'ហុក ខេវិន', 'HOK KHEVIN', 'ប', '2012-03-02', '016773997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(90, '000888', NULL, NULL, 'ហេង គឹមហ៊ុន', 'HENG KIMHUN', 'ស', '2012-11-27', '012329132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(91, '000852', NULL, NULL, 'ឡៃ រតនៈ', 'LAI RATTANAK', 'ប', '2010-04-10', '010435390', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(92, '000630', NULL, NULL, 'អ៊ុន លីមយ៉ុង', 'UN  LIMYONG', 'ប', '2012-07-27', '092212210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(93, '000670', NULL, NULL, 'អៀ ហាក់ឃេអ៊ីន', 'EA HAKKEY IN', 'ស', '2012-12-30', '017505505', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(94, '000679', NULL, NULL, 'ឯក ប្រុសិន្ទ្រ', 'EK  PROSENTRA', 'ប', '2012-10-06', '010817199', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(95, '000671', NULL, NULL, 'ក្លឹង ដូនីហ្វុង', 'KLOENG DONIFONG', 'ប', '2012-05-17', '012205556', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(96, '000672', NULL, NULL, 'ខួន ថាក់គូ', 'KHUON THAKKOU', 'ប', '2012-02-06', '089443899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(97, '000787', NULL, NULL, 'ឃឹម លីលាងឆឹង', 'KHIM LYLEANGCHHOENG', 'ប', '2012-06-19', '0976677799', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(98, '000848', NULL, NULL, 'ងួន ជីងណាន', 'NGUON JINGNAN', 'ស', '2012-05-04', '092888777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(99, '000694', NULL, NULL, 'ជឹង សុចិន្តា', 'CHUNG SOCHENDA', 'ស', '2011-12-19', '010377977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(100, '000772', NULL, NULL, 'ជុំ ចាន់តារាវត្តី', 'CHUM CHANDARAVATEY', 'ស', '2012-10-01', '078682525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(101, '000859', NULL, NULL, 'ឈុំ ពុទ្ធិថាដាវ', 'CHHUM PUTHETHADAV', 'ស', '2012-06-24', '077775854', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(102, '000628', NULL, NULL, 'តង មុន្នីវណ្ណ', 'TANG MONIVANN', 'ប', '2012-07-19', '070949798', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(103, '000635', NULL, NULL, 'តាំង វិនម៉េង', 'TAING VINMENG', 'ប', '2012-07-03', '015999363', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(104, '000636', NULL, NULL, 'តូយ ងួន', 'TOY  NGUON', 'ប', '2012-01-13', '092480477', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(105, '000632', NULL, NULL, 'ថៃនី ប៊ីលីរាជ', 'THAINY BILLIREACH', 'ប', '2012-05-17', '017267367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(106, '000673', NULL, NULL, 'ទន់ សូរីណែត', 'TUN  SORINET', 'ស', '2012-12-06', '098454568', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(107, '000644', NULL, NULL, 'ទិត ហ្គិចលី', 'TITH GECHLY', 'ស', '2012-01-16', '093262626', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(108, '000824', NULL, NULL, 'ធឹម បេនយ៉ាមីន', 'THEM BENYAMIN', 'ប', '2012-01-10', '012303821', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(109, '000669', NULL, NULL, 'នង ម៉េងហ៊ួរ', 'NORNG MENGHOUR', 'ប', '2012-04-15', '099942862', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(110, '000722', NULL, NULL, 'បារាំង សុវណ្ណមុនិន្ទ', 'BARAING SOVANMONIN', 'ប', '2012-04-21', '089980990', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(111, '000723', NULL, NULL, 'បារាំង សុភទេវិន្ទ', 'BARAING SOPHEAKTEVIN', 'ប', '2013-09-26', '089980990', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(112, '000505', NULL, NULL, 'ម៉ិល សុផាណារាជ', 'MEL SOPHANAREACH', 'ប', '2011-04-14', '012360594', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(113, '000683', NULL, NULL, 'ម៉ៅ គីមហួរ', 'MAO  KIMHOUR', 'ប', '2012-02-23', '092929115', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(114, '000692', NULL, NULL, 'លីម ជោលី', 'LIM  JOLY', 'ស', '2013-03-15', '092787809', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(115, '000646', NULL, NULL, 'លឹម ជេនីខា', 'LIM  JENNICA', 'ស', '2012-05-28', '078265026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(116, '000648', NULL, NULL, 'វ៉ាន់នឿន មេធាវីរ៍', 'VANNOEUN METHEAVY', 'ស', '2012-10-25', '012360320', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(117, '000674', NULL, NULL, 'ស ស្រីលក្ខិណា', 'SOR SREYLEAKHENA', 'ស', '2011-07-14', '089437443', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(118, '000665', NULL, NULL, 'សត្យា បញ្ញាឫទ្ធិ', 'SATYA PANHARITH', 'ប', '2012-09-29', '012345616', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(119, '000625', NULL, NULL, 'ស៊ី មិនគុយអ៊ីង', 'SY  MINKUY ING', 'ស', '2012-12-12', '077656507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(120, '000675', NULL, NULL, 'សិដ្ឋធី ដាលីន', 'SITHY DALIN', 'ស', '2012-10-10', '012408787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(121, '000596', NULL, NULL, 'សុគន្ធ សូលីកា', 'SOKUN SOLIKA', 'ស', '2012-04-20', '069628792', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(122, '000883', NULL, NULL, 'សត្យា វីរៈពង្ស', 'SATHYA VIRAKPONG', 'ប', '2012-05-29', '092964596', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(123, '000616', NULL, NULL, 'ហេង សេងឈុន', 'HENG SENGCHHUN', 'ប', '2012-09-07', '012373303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(124, '000781', NULL, NULL, 'ឡាយ ស៊ីវប៉ី', 'LAY  SIVPEY', 'ស', '2012-09-13', '092583817', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(125, '000711', NULL, NULL, 'អ៊ឹង ម៉េងគឹម', 'UNG MENGKIM', 'ស', '2012-10-27', '077696678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(126, '000656', NULL, NULL, 'អាន សក្តិ៍ឧត្តម', 'AN  SAK OUDOM', 'ប', '2012-10-05', '017292367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(127, '000727', NULL, NULL, 'អឿង ហេងសុភ័ក្ត្រា', 'OEUNG HENGSOPHEAKTRA', 'ប', '2011-11-30', '011822763', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(128, '000702', NULL, NULL, 'ខុន មុន្នីដួងច័ន្ទ', 'KHON MONIDUONGCHAN', 'ស', '2012-11-22', '0888839883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(129, '000740', NULL, NULL, 'ខោ បញ្ញាភា', 'KHOR PANHAPHEA', 'ស', '2012-05-02', '092688864', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(130, '000511', NULL, NULL, 'គា ខ្លូរីតា', 'KEA  KHLORITA', 'ស', '2012-04-09', '0977044000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(131, '000826', NULL, NULL, 'ឆាយ យ៉ាមីន', 'CHHAY YAMIN', 'ប', '2012-04-30', '012303821', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(132, '000680', NULL, NULL, 'ឆៃ ឡែនអេរិក្ស', 'CHHAY LEN ERIK', 'ប', '2012-05-31', '017545555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(133, '000634', NULL, NULL, 'ជា សុខលី', 'CHEA  SOKLY', 'ស', '2012-12-14', '093445050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(134, '000611', NULL, NULL, 'ជួង ច័ន្ទកែវម៉ូលីកា', 'CHUONG CHANKEOMOLYKA', 'ស', '2013-02-06', '077952384', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(135, '000699', NULL, NULL, 'ញ៉ សុវណ្ណឧត្តមវិជ្ជា', 'NHOR SOVAN OUDOMVICHEA', 'ប', '2012-08-19', '070665097', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(136, '000605', NULL, NULL, 'តុល តាំងគីម', 'TOL  TAINGKIM', 'ប', '2012-09-30', '012823747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(137, '000663', NULL, NULL, 'ត្រា តុងហៀង', 'TRA  TONGHIENG', 'ប', '2012-07-19', '092351359', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(138, '000744', NULL, NULL, 'ថៃ ធីសុផាវី', 'THAI  THYSOPHAVY', 'ស', '2012-07-27', '016375144', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(139, '000655', NULL, NULL, 'ធួក ឆាន់ជី', 'THOUK CHHANCHI', 'ស', '2012-03-21', '086942445', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(140, '000706', NULL, NULL, 'នី ដាណាក់', 'NY  DANAK', 'ប', '2010-05-02', '092426979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(141, '000707', NULL, NULL, 'នី ដាណៃ', 'NY  DANAY', 'ប', '2010-05-02', '092426979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(142, '000856', NULL, NULL, 'នី ចន្ទ្រា', 'NY  CHANTREA', 'ស', '2010-09-18', '0968106061', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(143, '000696', NULL, NULL, 'ប៉ិច ពង្សសមណៈ', 'PECH PONGSAMANAK', 'ប', '2012-10-09', '012716988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(144, '000886', NULL, NULL, 'ប៊ុនធឿន សុខបញ្ញា', 'BUNTHOEUN SOKPANHA', 'ប', '2012-09-03', '015600840', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(145, '000631', NULL, NULL, 'ម៉ិញ អេរិកសុថាវរៈ', 'MENH ERICSOTHAVOREAK', 'ប', '2012-12-22', '077925009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(146, '000512', NULL, NULL, 'មឿន វណ្ណាដារ៉ាម៉ុស', 'MOEUN DANNADARAMOS', 'ប', '2012-03-03', '017944651', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(147, '000712', NULL, NULL, 'លី ជីងជីង', 'LY  JINGJING', 'ប', '2013-03-20', '012454523', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(148, '000668', NULL, NULL, 'វណ្ណាត វិធូ', 'VANNAT VITHOU', 'ស', '2012-11-03', '078836969', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(149, '000863', NULL, NULL, 'វង្ស សិរីណៃវិភូ', 'VONG SEREYNAIVIPHOU', 'ប', '2013-08-15', '012597144', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(150, '000645', NULL, NULL, 'សុភា ភូរិស្សារ៉ា', 'SOPHEA PHOURISSARA', 'ស', '2012-08-19', '089987876', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(151, '000687', NULL, NULL, 'សោម អជិតា', 'SORM ACHITA', 'ស', '2013-01-06', '069882272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(152, '000698', NULL, NULL, 'ហេង ស៊ានហុង', 'HENG SEANHONG', 'ប', '2012-07-11', '012437554', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(153, '000638', NULL, NULL, 'ឡុង កាន់', 'LONG  KANN', 'ប', '2011-04-12', '0885531149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(154, '000897', NULL, NULL, 'អ៊ិត ជីងអ៊ី', 'ITH  CHING I', 'ស', '2012-09-13', '0888503329', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(155, '000652', NULL, NULL, 'អ៊ា ឆាយឡេង', 'EAR CHHAYLENG', 'ប', '2012-07-02', '092807777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(156, '000729', NULL, NULL, 'អ៊ឹម សុភាវត្តី', 'IM  SOPHEAVATEY', 'ស', '2012-11-10', '093509576', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(157, '000657', NULL, NULL, 'អ៊ុច ខេតសាណា', 'OUCH  KATESANA', 'ស', '2010-05-26', '012609650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(158, '000658', NULL, NULL, 'អ៊ុច សារីយ៉ាវណ្ណ', 'OUCH  SARYJAVAN', 'ប', '2012-11-05', '012609650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(159, '000813', NULL, NULL, 'កុល មុន្នីពិសិដ្ឋ', 'KOL  MONYPISITH', 'ប', '2013-01-24', '012895289', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(160, '000486', NULL, NULL, 'ខន បញ្ញារិទ្ធ', 'KHORN PANHARITH', 'ប', '2010-01-02', '017883993', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(161, '000516', NULL, NULL, 'ចៅ ម៉ាន់លឿង', 'CHAO MANNLOEUNG', 'ប', '2011-10-14', '012714048', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(162, '000513', NULL, NULL, 'ចៅ ម៉ាន់ឡី', 'CHAO MANNLEY', 'ប', '2011-10-14', '012714048', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(163, '000771', NULL, NULL, 'ជុំ វណ្ណរ៉េត', 'CHUM VANNRETH', 'ប', '2011-06-13', '078682525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(164, '000676', NULL, NULL, 'ឈុន លាងហាក់', 'CHHUN LEANGHAK', 'ប', '2011-04-01', '086585921', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(165, '000509', NULL, NULL, 'តែ សុផាលីប៉', 'TE  SOPHALIPOR', 'ស', '2011-05-25', '012669428', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(166, '000538', NULL, NULL, 'ម៉ន អមរា', 'MORN AMARA', 'ស', '2010-09-25', '098585718', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(167, '000515', NULL, NULL, 'ម៉ែន គីសួគ៌', 'MEN  KISOUR', 'ស', '2011-03-05', '069665016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(168, '000521', NULL, NULL, 'មាឃ គឹមសាន់ណារ៉ា', 'MEAK KIMSANNARA', 'ប', '2011-04-26', '092200630', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(169, '000601', NULL, NULL, 'មាស ស្រីម៉ុច', 'MEAS SREYMOCH', 'ស', '2011-08-05', '012931789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(170, '000518', NULL, NULL, 'យ៉ាន់ យ៉ុងស៊ិង', 'YANN YONGSING', 'ប', '2011-07-04', '012876559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(171, '000522', NULL, NULL, 'យិប ផេង', 'TIP  PHENG', 'ប', '2012-03-01', '012684050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(172, '000790', NULL, NULL, 'រ៉ូ សុភាលាងសេង', 'RO  SOPHEALEANGSENG', 'ប', '2011-10-10', '077589998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(173, '000563', NULL, NULL, 'រ៉ែម ច័ន្ទវិទ្យា', 'REM CHANNVITHYEA', 'ប', '2011-11-28', '017717117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(174, '000642', NULL, NULL, 'រ័ត្ន សីមារាជ', 'RATH SEYMAREACH', 'ប', '2011-11-30', '012665624', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(175, '000701', NULL, NULL, 'វ៉ែន ហេងហុង', 'VEN  HENGHONG', 'ប', '2010-06-24', '017447443', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(176, '000466', NULL, NULL, 'សយ ករុណា', 'SOY  KARONA', 'ប', '2010-01-10', '099999338', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(177, '000643', NULL, NULL, 'ស៊ុន លីហៃ', 'SUN  LIHAY', 'ប', '2011-12-04', '012386060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(178, '000593', NULL, NULL, 'ស៊ុន សុណាឋៈ', 'SUN  SONATHAK', 'ប', '2011-04-13', '092916976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1);
INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(179, '000588', NULL, NULL, 'សួន ណាក់លីសារពេជ្ជ', 'SUON NAKLYSARAPICH', 'ស', '2011-12-08', '012270565', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(180, '000709', NULL, NULL, 'សៀង សៀកលី', 'SIENG SIEKLY', 'ស', '2011-04-14', '012366306', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(181, '000866', NULL, NULL, 'សៅ សុខជាតិ', 'SAO SOKCHEAT', 'ស', '2011-08-04', '012943069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(182, '000728', NULL, NULL, 'ហួត សុវត្តី', 'HUOT SOVATEY', 'ស', '2010-04-06', '092699069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(183, '000622', NULL, NULL, 'អ៊ុង សុខសាន្ត', 'UNG  SOKSAN', 'ប', '2011-04-23', '017527952', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(184, '000517', NULL, NULL, 'អឿន ជីងអាន', 'OEURN JING AN', 'ប', '2011-08-22', '085999967', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(185, '000591', NULL, NULL, 'កេស សុផាន់និត', 'KES  SOPHANNITH', 'ប', '2011-03-29', '015620750', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(186, '000840', NULL, NULL, 'ខែត្រ វណ្ណនីសា', 'KHET VANNISA', 'ស', '2010-06-28', '016225592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(187, '000624', NULL, NULL, 'ង៉ោ លីហួត', 'NGOR LIHUOT', 'ប', '2011-05-05', '012960536', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(188, '000566', NULL, NULL, 'ចាង គីមលិ', 'CHANG KIMLIK', 'ស', '2010-11-05', '012626266', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(189, '000539', NULL, NULL, 'ឆុន ឆាយច័ន្ទវិមាន', 'CHHON CHHAYCHANVIMEAN', 'ស', '2011-09-21', '012693941', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(190, '000715', NULL, NULL, 'ឈាន គឹមហាក់', 'CHHEAN KLMHAK', 'ប', '2011-07-25', '085858581', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(191, '000508', NULL, NULL, 'ញិក ពេជសុខប្រពៃ', 'NHEK PICHSOKPROPEY', 'ប', '2011-08-26', '012771114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(192, '000574', NULL, NULL, 'នី រ៉សាត', 'NY  RORSAT', 'ប', '2011-10-08', '060464660', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(193, '000871', NULL, NULL, 'ប្រាង្គ វឌ្ឍនៈ', 'PRANG VATHANAK', 'ប', '2011-10-03', '078555225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(194, '000586', NULL, NULL, 'ពឹង គឹមឆែ', 'POENG KIMCHHE', 'ប', '2011-06-22', '012579616', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(195, '000681', NULL, NULL, 'ពេជ្រ សិទ្ធិគុណ', 'PICH  SITHIKUN', 'ប', '2011-04-02', '093383838', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(196, '000807', NULL, NULL, 'ភិ សុផលសុខជិញ', 'PHIK SOPHALSOKCHINH', 'ស', '2011-06-04', '012938489', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(197, '000602', NULL, NULL, 'ម៉ី សិរីចេស្តា', 'MEY  SEREYCHESDA', 'ប', '2011-04-18', '077872013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(198, '000537', NULL, NULL, 'ម៉ែន បូរ៉ាវត្តី', 'MEN BORAVATEY', 'ស', '2011-05-15', '095800600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(199, '000890', NULL, NULL, 'រើន កុសល្យ', 'ROEUN KOSAL', 'ប', '2011-03-04', '012652487', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(200, '000540', NULL, NULL, 'លី មួយគីម', 'LY  MUOYKIM', 'ស', '2010-12-13', '0886555915', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(201, '000519', NULL, NULL, 'វ៉ាន់ដូ វចនា', 'VANDO VACHNA', 'ស', '2012-01-23', '012403976', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(202, '000510', NULL, NULL, 'សម្បត្តិ ដូណាជូលៀ', 'SAMBATH DONAJULIA', 'ស', '2011-11-18', '012352265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(203, '000561', NULL, NULL, 'ស៊ាន ស៊ីវអេង', 'SEAN SIV ENG', 'ស', '2011-11-14', '077530077', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(204, '000587', NULL, NULL, 'សួន ច័ន្ទមុន្នី', 'SUON CHANMONY', 'ប', '2012-06-04', '098777148', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(205, '000705', NULL, NULL, 'សោភ័ណ សត្យា', 'SOPHORN SATHYA', 'ប', '2011-08-21', '092426979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(206, '000789', NULL, NULL, 'ហាំង យូអ៊ីង', 'HAING YOU ING', 'ស', '2012-05-05', '012746588', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(207, '000835', NULL, NULL, 'ហ៊ីង ម៉ីអ៊ី', 'HING  MEY I', 'ស', '2011-08-14', '092699956', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(208, '000506', NULL, NULL, 'ហេង ស៊ីវម៉ី', 'HENG SIVMEY', 'ស', '2010-12-29', '066252525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(209, '000865', NULL, NULL, 'ហុង ឆាយស៊ីង', 'HONG CHHAYSING', 'ប', '2011-07-24', '012974474', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(210, '000491', NULL, NULL, 'ចាប កក្កដា', 'CHAP  KAKADA', 'ប', '2010-07-09', '092909055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(211, '000470', NULL, NULL, 'ឈឿន សាអ៊ុន', 'CHHOEUN SA UN', 'ស', '2010-08-28', '061444754', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(212, '000894', NULL, NULL, 'ជុង សុម៉ាវត្តី', 'CHUNG SOMAVATEY', 'ស', '2010-04-08', '012717006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(213, '000770', NULL, NULL, 'ឌៀប ម៉េងគួង', 'DIEP  MENGKUONG', 'ប', '2009-10-27', '012957057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(214, '000097', NULL, NULL, 'នង សុផានិត', 'NORNG SOPHANITH', 'ប', '2010-04-19', '012667598', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(215, '000074', NULL, NULL, 'ភ័ក្រ ពេជ្រមង្គល', 'PHEAK PICHMONGKOL', 'ប', '2010-12-02', '017923909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(216, '000448', NULL, NULL, 'មុយ ម៉ារ៉ារក្សា', 'MUY MARAREAKSA', 'ប', '2010-07-10', '092662667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(217, '000739', NULL, NULL, 'មុំ ទីទី', 'MOM  TYTY', 'ប', '2011-11-09', '012969535', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(218, '000882', NULL, NULL, 'យ៉ាំ ជីងអ៊ី', 'YAIM JING I', 'ស', '2010-02-01', '012642929', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(219, '000453', NULL, NULL, 'រ៉ា លីម៉េង', 'RA  LYMENG', 'ប', '2010-05-19', '095835559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(220, '000092', NULL, NULL, 'រ៉ូត សុគន្ធអារីយ៉ា', 'ROT SOKUN ARIYA', 'ស', '2010-11-17', '012431049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(221, '000462', NULL, NULL, 'លឿម សារវ័ន្តនីនត្រា', 'LOEUM SARAVONNINTRA', 'ស', '2011-04-14', '0888555519', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(222, '000087', NULL, NULL, 'សឺត ម៉ានីនិត', 'SEUTH NAMINITH', 'ប', '2010-12-26', '092704403', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(223, '000423', NULL, NULL, 'សុខ ម៉េងផាត់', 'SOK  MENGPHATH', 'ប', '2010-09-24', '012541742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(224, '000851', NULL, NULL, 'សេង គីមស៊ា', 'SENG  KIMSEA', 'ស', '2010-11-28', '092377171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(225, '000898', NULL, NULL, 'ស្រ៊ុន សៀកម៉េង', 'SRUN SEAKMENG', 'ប', '2010-07-09', '0969017208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(226, '000782', NULL, NULL, 'ហុក ពេជ្រធីតាកែវ', 'HOK PICHTHIDAKEO', 'ស', '2010-05-21', '012457126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(227, '000660', NULL, NULL, 'ហេង សូលីកា', 'HENG SOLIKA', 'ស', '2010-08-27', '089756503', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(228, '000389', NULL, NULL, 'អ៊ីង តុងផៃ', 'ING  TONGPHAY', 'ប', '2009-12-15', '012599618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(229, '000604', NULL, NULL, 'អ៊ឹង ម៉េងគួង', 'UNG  KONGMENG', 'ប', '2010-12-12', '077696678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(230, '000072', NULL, NULL, 'អ៊ុល វង្សរង្សី', 'UL  VONGRAINGSEY', 'ស', '2011-08-05', '092210555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(231, '000069', NULL, NULL, 'អោម លីតា', 'ORM  LITA', 'ស', '2009-01-08', '017873806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(232, '000860', NULL, NULL, 'កែវ សិរីសុវិនា', 'KEO  SEREYSOVINEA', 'ស', '2010-08-17', '012501119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(233, '000434', NULL, NULL, 'គង់ ឆាយហួរ', 'KONG CHHAYHOUR', 'ប', '2010-11-05', '089313331', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(234, '000526', NULL, NULL, 'ឃុន ម៉ូលីកា', 'KHUN MOLIKA', 'ស', '2011-05-12', '017832060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(235, '000855', NULL, NULL, 'ង៉ូ មុន្នីនិច', 'NGO  MONINICH', 'ស', '2012-02-24', '012677288', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(236, '000490', NULL, NULL, 'ឆេង ចាន់ធារ៉ាក់', 'CHHENG CHANTHEARAK', 'ប', '2010-02-23', '017560386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(237, '000477', NULL, NULL, 'ជាង ម៉ីអ៊ី', 'CHEANG MEY I', 'ស', '2009-11-13', '092788667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(238, '000858', NULL, NULL, 'ជីវ័ន អេលីបញ្ញា', 'CHIVON  ETIPANHA', 'ប', '2009-05-10', '017279027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(239, '000607', NULL, NULL, 'ឌី ស្រីនិច', 'DY   SREYNICH', 'ស', '2010-05-25', '012303821', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(240, '000445', NULL, NULL, 'ឌុំ ម៉ូលីសាណា', 'DUM  MOLISANA', 'ស', '2010-07-19', '077375775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(241, '000088', NULL, NULL, 'តាន់ ហាក់ម៉េង', 'TANN HAKMENG', 'ប', '2010-07-10', '092200677', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(242, '000463', NULL, NULL, 'តាន់ ម៉ីនាង', 'TANN MEYNEANG', 'ស', '2011-07-08', '017287755', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(243, '000797', NULL, NULL, 'ម៉ុច ម៉ានី', 'MOCH MANY', 'ប', '2010-10-01', '093416565', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(244, '000494', NULL, NULL, 'រ៉ែម ច័ន្ទបញ្ញាវុឌ្ឍ', 'REM CHANPAMHAVUTH', 'ប', '2010-11-29', '017365615', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(245, '000425', NULL, NULL, 'រិទ្ធ ច័ន្ទម៉ីលិញ', 'RITH CHANMEYLINH', 'ស', '2011-02-16', '012530695', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(246, '000481', NULL, NULL, 'រេត មករា', 'RET  MAKARA', 'ប', '2009-01-13', '077551757', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(247, '000743', NULL, NULL, 'លី សុម៉ានីកា', 'LY  SOMANIKA', 'ស', '2011-05-31', '011444485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(248, '000459', NULL, NULL, 'លឿម វរៈ', 'LOEUM VORAK', 'ប', '2008-08-14', '0967916946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(249, '000091', NULL, NULL, 'ស៊ិន សេងឆាយ', 'SIN  SENGCHHAY', 'ប', '2010-01-02', '012674641', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(250, '000089', NULL, NULL, 'ស៊ុយ វិលៀម', 'SUY  VILIEM', 'ប', '2010-02-23', '012600905', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(251, '000818', NULL, NULL, 'សែម ជីងស៊ីង', 'SEM  CHINGSING', 'ប', '2009-08-24', '092777727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(252, '000869', NULL, NULL, 'ហាប់ វណ្ណលីហៀង', 'HAP  VANLIHEANG', 'ប', '2010-07-25', '077332022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(253, '000783', NULL, NULL, 'ឡុង ឈៀងម៉ី', 'LONG CHHIENGMEY', 'ស', '2010-12-14', '012872486', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(254, '000475', NULL, NULL, 'អាន ច័ន្ទសុពណ្ណា', 'AN  CHANSOPONNA', 'ស', '2010-12-13', '077297296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(255, '000347', NULL, NULL, 'កែវ វីយ៉ាលីង', 'KEO  VIYALING', 'ស', '2009-05-20', '012369636', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(256, '000788', NULL, NULL, 'ឃីម លីលាងឆាយ', 'KHIM  LYLEANGCHHAY', 'ប', '2010-01-10', '0977202777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(257, '000366', NULL, NULL, 'ជា នរបញ្ញា', 'CHEA  NOREAKPANHA', 'ប', '2010-01-10', '012444353', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(258, '000386', NULL, NULL, 'ណាត់ ថៈណាន់វង្សយ៉ារ៉ា', 'NATHANAN VONGYARA', 'ប', '2009-08-23', '061413456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(259, '000343', NULL, NULL, 'តាន់ លីម៉ីញ', 'TANN  LYMINH', 'ប', '2009-11-13', '095909999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(260, '000064', NULL, NULL, 'តារា សុវណ្ណការិកា', 'DARA  SOVANNKARIKA', 'ស', '2009-10-17', '077855644', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(261, '000476', NULL, NULL, 'ទន់ វីរៈ', 'TON  VIREAK', 'ប', '2007-09-21', '098454568', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(262, '000364', NULL, NULL, 'ទី សុមេធា', 'TY  SOMETHEA', 'ប', '2009-12-21', '011488298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(263, '000892', NULL, NULL, 'ធិន ឡុងយី', 'THIN  LONGYI', 'ប', '2008-01-14', '017304561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(264, '000530', NULL, NULL, 'នាង ស៊ីណា', 'NEANG  SINA', 'ស', '2009-12-29', '086447707', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(265, '000650', NULL, NULL, 'នី ប៉ាន់ជោឌិន', 'NY  PANNCHODIN', 'ប', '2009-07-13', '012696981', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(266, '000885', NULL, NULL, 'ប៊ុនធឿន សុខច័ន្ទរស្មី', 'BUNTHOEUN SOKCHANREASMEY', 'ស', '2009-08-10', '015600840', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(267, '000060', NULL, NULL, 'ផល ទីតូ', 'PHAL  TITO', 'ប', '2006-08-06', '017873806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(268, '000083', NULL, NULL, 'ភូង ពេជ្រចូលី', 'PHUONG PICHJOLY', 'ស', '2010-01-26', '077999216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(269, '000404', NULL, NULL, 'យឹម សុខមករា', 'YIM SOKMAKARA', 'ប', '2007-01-01', '017873806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(270, '000623', NULL, NULL, 'រតនា រតនៈ', 'RATTANA RATTANAK', 'ប', '2009-07-09', '061687878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(271, '000528', NULL, NULL, 'លី វណ្ណសុធារោ', 'LY  VANNSOTHEARO', 'ប', '2009-11-28', '012644467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(272, '000357', NULL, NULL, 'លី បុស្បា', 'LY  BOSSBA', 'ស', '2008-11-26', '012501408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(273, '000584', NULL, NULL, 'លឹម លីឌី', 'LIM  LIDY', 'ប', '2009-11-25', '0969734997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(274, '000410', NULL, NULL, 'លឹម ឈុនហ៊ាង', 'LIM  CHHUNHEANG', 'ស', '2009-12-18', '012691313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(275, '000881', NULL, NULL, 'វ៉ាន់ លីសា', 'VANN  LISA', 'ស', '2010-08-23', '095252610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(276, '000075', NULL, NULL, 'សម្បត្តិ ច័ន្ទលីដា', 'SAMBATH CHANLYDA', 'ស', '2008-11-30', '012352265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(277, '000541', NULL, NULL, 'ស៊ីនឿន សុវណ្ណរស្មី', 'SINOEUN SOVANREASMEY', 'ស', '2010-07-06', '012641490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(278, '000768', NULL, NULL, 'សាវឿន រីនណេត', 'SAVOEUN RINNET', 'ស', '2009-02-23', '095202244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(279, '000598', NULL, NULL, 'សេង  ពីយ៉ាកាម៉ុន', 'SENG PIYAKAMONN', 'ប', '2009-10-10', '092638298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(280, '000791', NULL, NULL, 'ហាំង យូអ៊ី', 'HAING  YOU I', 'ស', '2009-12-22', '012746588', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(281, '000427', NULL, NULL, 'ហេង សុខលាភ', 'HENG  SOKLEAP', 'ប', '2010-01-01', '017881727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(282, '000887', NULL, NULL, 'ហេង គឹមហួន', 'HENG  KIMHUON', 'ស', '2009-07-22', '012329132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(283, '000768', NULL, NULL, 'អ៊ុំ ហេងចំរើន', 'OUM  HENGCHAMROEUN', 'ប', '2010-02-27', '012259971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(284, '000344', NULL, NULL, 'គង់  ស៊ូអ៊ីន', 'KONG  SOU IN', 'ស', '2009-08-28', '0975500018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(285, '000471', NULL, NULL, 'គុយ សុដាណា', 'KUY SODANA', 'ស', '2010-05-07', '092691857', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(286, '000880', NULL, NULL, 'ង៉ែត សុផារីដា', 'NGET SOPHARIDA', 'ស', '2010-05-04', '092232349', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(287, '000346', NULL, NULL, 'ឆោម សុវណ្ណា', 'CHHORM SOVANNA', 'ស', '2009-12-07', '085848508', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(288, '000529', NULL, NULL, 'ជា លីសេង', 'CHEA  LYSENG', 'ប', '2010-03-23', '012732290', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(289, '000431', NULL, NULL, 'ជាង ស៊ូលី', 'CHEANG SOULY', 'ស', '2010-07-04', '012280673', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(290, '000849', NULL, NULL, 'ជា ជីងសាន', 'CHEA CHINGSAN', 'ប', '2009-08-21', '012452727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(291, '000082', NULL, NULL, 'តែ សុផាលីយ៉ា', 'TE SOPHALIYA', 'ស', '2009-02-03', '012897797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(292, '000062', NULL, NULL, 'ប្រម ឃុនណាក់', 'PRORM KHONAK', 'ប', '2009-03-12', '089547102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(293, '000769', NULL, NULL, 'ពូល វណ្ណពិសិទ្ធ', 'POL VANPISETH', 'ប', '2009-09-28', '092388208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(294, '000686', NULL, NULL, 'ម៉ូ រិទ្ធិរាជ', 'MO RITHIREACH', 'ប', '2009-05-13', '012797934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(295, '000384', NULL, NULL, 'មាស ហ្វូមី', 'MEAS FOUMY', 'ប', '2008-08-04', '096608134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(296, '000428', NULL, NULL, 'យឹម ហ្គិចអ៊ីម', 'YIM GECH IM', 'ស', '2009-03-14', '092231366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(297, '000737', NULL, NULL, 'យស ម៉ានីន', 'YOS MANIN', 'ស', '2009-09-21', '012947129', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(298, '000845', NULL, NULL, 'រៀន សំបូរសម្បត្តិ', 'RIEN SAMBOSAMBATH', 'ប', '2010-06-19', '017438382', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(299, '000063', NULL, NULL, 'រី ស្រីល័ក្ខ', 'RY SREYLEAK', 'ស', '2005-11-21', '017873806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(300, '000717', NULL, NULL, 'រេត សុផានិត', 'RETH SOPHANITH', 'ប', '2010-09-03', '0886222262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(301, '000742', NULL, NULL, 'លី រ៉ាឌី', 'LY RADY', 'ប', '2009-10-17', '0972791361', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(302, '000393', NULL, NULL, 'លឹម ឈីវស៊ាម', 'LIM CHHIVSEAM', 'ស', '2010-02-11', '012301597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(303, '000390', NULL, NULL, 'សុគុណ វិមាន', 'SOKUN VIMEAN', 'ប', '2010-02-26', '012205933', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(304, '000299', NULL, NULL, 'សេង គឹមស័ង', 'SENG  KIMSANG', 'ប', '2008-09-07', '012297979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(305, '000550', NULL, NULL, 'ស្រ៊ាង ឈិនហ្វី', 'SREANG CHHINFY', 'ប', '2009-04-14', '092667771', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(306, '000465', NULL, NULL, 'ហ៊ី លុច', 'HY  LUCH', 'ប', '2009-10-03', '012642418', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(307, '000834', NULL, NULL, 'ហ៊ីង មុយហ៊ាង', 'HING  MUYHEANG', 'ស', '2010-02-17', '092699956', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(308, '000076', NULL, NULL, 'ហ៊ុន ម៉ាលីសអេឡែន', 'HUNMALISS ELEN', 'ស', '2010-06-03', '012762067', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(309, '000493', NULL, NULL, 'ឡុង ប៉េងសី', 'LONG  PENGSEY', 'ប', '2010-04-29', '012374853', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(310, '000352', NULL, NULL, 'ឡ គឹមប៉', 'LOR  KIMPOR', 'ប', '2009-12-18', '0972220047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(311, '000362', NULL, NULL, 'អ៊ុន លឹមតុង', 'UN  LIMTONG', 'ប', '2009-08-25', '012697698', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(312, '000409', NULL, NULL, 'ឯក ស៊ាវហន់', 'EK  SEAVHORN', 'ស', '2009-08-12', '092666007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(313, '000301', NULL, NULL, 'ចៅ ជីម៉ាន់', 'CHAO  CHIMANN', 'ប', '2008-11-28', '012942489', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(314, '000812', NULL, NULL, 'ចៅ គង់ឈី', 'CHAO  KONGCHHY', 'ប', '2009-04-04', '086771785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(315, '000846', NULL, NULL, 'ឆៃ ម៉ាទីន', 'CHHAI  MATIN', 'ប', '2008-10-09', '017545555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(316, '000320', NULL, NULL, 'ញិក ពេជសុខបវរ', 'NHEK PICHSOKBORVOR', 'ស', '2009-02-22', '012771114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(317, '000763', NULL, NULL, 'ឌី លីហ៊ាង', 'DY   LIHEANG', 'ស', '2009-01-19', '010905352', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(318, '000290', NULL, NULL, 'តាន់ ហាក់មុន្នី', 'TANN HAKMONY', 'ប', '2009-01-14', '092200677', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(319, '000766', NULL, NULL, 'តាំង ប៊ុនស៊ីវមិញ', 'TAING BUNSIVMINH', 'ស', '2009-07-28', '092335533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(320, '000373', NULL, NULL, 'ទូច ខាយស៊ីង', 'TOUCH KHAYSING', 'ប', '2009-02-20', '089855887', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(321, '000478', NULL, NULL, 'ភន យ៉ាណារតន៍', 'PHORN YANAROTH', 'ស', '2008-09-25', '077311169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(322, '000889', NULL, NULL, 'ភូ សុវណ្ណលីប៉ាវ', 'PHOU SOVANLIPAV', 'ប', '2008-01-11', '012999981', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(323, '000291', NULL, NULL, 'ម៉ែន បូរ៉ាមុនីនាថ', 'MEN  BORAMONINEATH', 'ស', '2008-12-09', '089853533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(324, '000738', NULL, NULL, 'មុំ នីកូ', 'MOM  NIKO', 'ស', '2008-08-24', '012969535', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(325, '000893', NULL, NULL, 'ម៉ន កែវវិរៈ', 'MORN KEOVIRAK', 'ប', '2006-04-03', '012791671', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(326, '000172', NULL, NULL, 'យៀង នីន', 'YIENG  NIN', 'ស', '2007-12-16', '017873806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(327, '000293', NULL, NULL, 'រ៉ូត អាលីហ្សា', 'ROT  ALIZA', 'ស', '2008-11-06', '092281033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(328, '000891', NULL, NULL, 'លី បញ្ញា', 'LY  PANHA', 'ប', '2006-04-01', '012414152', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(329, '000708', NULL, NULL, 'វ៉ន ស្រីនិច', 'VORN SREYNICH', 'ស', '2006-07-29', '092462979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(330, '000042', NULL, NULL, 'សល់ ស៊ុនហ៊ាង', 'SAL  SUNHEANG', 'ប', '2008-02-21', '0979897679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(331, '000719', NULL, NULL, 'សុំ សុម៉ាវតី', 'SOM  SOMAVATEY', 'ស', '2009-10-07', '0978773305', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(332, '000059', NULL, NULL, 'សៀន ជីងជីង', 'SIEN  CHINGCHING', 'ស', '2008-02-13', '012565156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(333, '000850', NULL, NULL, 'សេង ស៊ីវភីង', 'SENG  SIVPHING', 'ស', '2008-10-17', '092377171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(334, '000621', NULL, NULL, 'ហ៊ាង ម៉េងយុន', 'HEANG  MENGYUN', 'ប', '2009-02-15', '017440403', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(335, '000786', NULL, NULL, 'ហ៊ូ វឌ្ឍនៈវិភូ', 'HOU  VATHANAKVIPHOU', 'ប', '2008-08-12', '017936963', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(336, '000354', NULL, NULL, 'ហុង ស៊ីដេរ៉ាក់', 'HONG  SIDERAK', 'ប', '2008-07-28', '012476728', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(337, '000044', NULL, NULL, 'ហេង ឈុន្នី', 'HENG  CHHUNNY', 'ស', '2008-06-08', '012373303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(338, '000473', NULL, NULL, 'ឡាយ ប៉េងស្រេង', 'LAY  PENGSRENG', 'ប', '2007-11-09', '092955550', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(339, '000333', NULL, NULL, 'អ៊ា ស៊ីវអ៊ីង', 'EA  SIV ING', 'ស', '2008-10-30', '092807777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(340, '000640', NULL, NULL, 'អាត អ៊ីជូ', 'ATH  ICHOU', 'ស', '2008-10-28', '012192936', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(341, '000765', NULL, NULL, 'អៀក គីមជូ', 'IEK  KIMCHOU', 'ស', '2008-03-03', '012753641', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(342, '000861', NULL, NULL, 'អ៊ុក ចន្ទវឌ្ឍន', 'OUK  CHANVATHANAK', 'ប', '2009-01-19', '092666191', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(343, '000844', NULL, NULL, 'កឺ ហ្វីលីប', 'KEU  FILIP', 'ប', '2008-11-24', '012782393', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(344, '000819', NULL, NULL, 'កៅ ម៉ីលីង', 'KAO  MEYLING', 'ស', '2008-11-01', '0966339999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(345, '000633', NULL, NULL, 'ឆោម ខេមរា', 'CHHORM KHEMARA', 'ប', '2008-11-14', '0967878653', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(346, '000441', NULL, NULL, 'ជាង សុវណ្ណម៉ូលីកា', 'CHEANG SOVANMOLIKA', 'ស', '2009-03-23', '089987765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(347, '000725', NULL, NULL, 'ជាវ ហ៊ាងចាយ', 'CHEAV HEANGCHAY', 'ប', '2006-08-17', '012836239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(348, '000469', NULL, NULL, 'ញ៉ុក ខនបញ្ញា', 'NHOK  KHORNPANHA', 'ប', '2007-12-20', '017838884', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(349, '000847', NULL, NULL, 'ទួន សុវណ្ណបញ្ញា', 'TUON SOVANPANHA', 'ស', '2009-02-18', '017438382', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(350, '000026', NULL, NULL, 'ទៀ ជៃឈៀន', 'TEA  CHEYCHHIEN', 'ប', '2008-05-04', '012962999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(351, '000577', NULL, NULL, 'នឿម មាសថារី', 'NOEUM MEASTHARY', 'ស', '2007-11-13', '070526450', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(352, '000817', NULL, NULL, 'ម៉ឹង ស៊ឺអ៊ី', 'MOENG  SEU I', 'ប', '2009-12-15', '095999961', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(353, '000730', NULL, NULL, 'ម៉េង គីមឡាង', 'MENG  KIMLANG', 'ស', '2008-02-11', '0883333970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(354, '000449', NULL, NULL, 'មុយ ម៉ារ៉ាពិទូ', 'MUY  MARAPITOU', 'ប', '2007-10-28', '092662667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(355, '000556', NULL, NULL, 'យិន ម៉ូនីតា', 'YIN  MONITA', 'ស', '2008-05-14', '092843323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(356, '000289', NULL, NULL, 'យិប ណាលីហ្សា', 'YIP  NALIZA', 'ស', '2008-10-02', '092598987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1);
INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(357, '000023', NULL, NULL, 'យីវ យ៉ុងថៃ', 'YIV  YONGTHAI', 'ប', '2009-03-15', '012892799', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(358, '000336', NULL, NULL, 'រិទ្ធថា ចាន់លាង', 'RITHA  CHANLEANG', 'ប', '2009-06-08', '092999917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(359, '000334', NULL, NULL, 'វីរៈ រក្សា', 'VIREAK  REAKSA', 'ស', '2008-05-21', '0884268127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(360, '000320', NULL, NULL, 'វុទ្ធី សុថាលីហ្សា', 'VUTHY  SOTHALIZA', 'ស', '2008-10-02', '093616169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(361, '000731', NULL, NULL, 'ស៊ុន លីហៀង', 'SUN  LIHIENG', 'ស', '2009-03-22', '0883333970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(362, '000619', NULL, NULL, 'សុខ មុនីរក្សា', 'SOK  MONIREAKSA', 'ស', '2008-10-14', '012626271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(363, '000693', NULL, NULL, 'សុគន្ធកញ្ញា   សុផានិត', 'SOKUNKANHA SOPHANITH', 'ស', '2008-07-10', '092199900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(364, '000714', NULL, NULL, 'សុវណ្ណ ម៉ាណែត', 'SOVANN MANET', 'ប', '2008-12-09', '016464699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(365, '000764', NULL, NULL, 'សេរី សុខអ៊ីម', 'SEREY  SOK IM', 'ស', '2009-06-20', '099330303', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(366, '000324', NULL, NULL, 'ស្រ៊ុន ស៊ាវអ៊ីង', 'SRUN  SEAV ING', 'ស', '2008-07-28', '012286186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(367, '000884', NULL, NULL, 'សត្យា វិរៈបុត្រ', 'SATHIYA VIRAKBOTH', 'ប', '2009-07-04', '092964596', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(368, '00043', NULL, NULL, 'ហ៊ុនម៉ាលីស  បញ្ញាបុត្រ', 'HUNMALISS PANHABOTH', 'ប', '2009-01-01', '012762067', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(369, '000467', NULL, NULL, 'ឡៃ រតនា', 'LAI  RATTANA', 'ប', '2005-04-24', '010435390', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(370, '000784', NULL, NULL, 'ឡុង ឈៀងហួ', 'LONG CHHIENGHOUR', 'ប', '2009-07-29', '012872486', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(371, '000027', NULL, NULL, 'ឡូវ ជីងស៊ីង', 'LOV  CHINGSING', 'ស', '2008-05-29', '012822597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(372, '000895', NULL, NULL, 'អ៊ុំ សុខជូលី', 'OUM SOKCHOULY', 'ស', '2009-05-24', '012242415', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(373, '000896', NULL, NULL, 'អ៊ុំ សុខហេងលាភ', 'OUM SOKHENGLEAP', 'ប', '2008-02-03', '012242415', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(374, '000534', NULL, NULL, 'ឃាង លីជីង', 'Kheang Lyching', 'ស', '2007-05-02', '078922265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(375, '001435', NULL, NULL, 'ចាន់ លីតា', 'Chann Lita', 'ស', '2007-09-21', '0312938888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(376, '001434', NULL, NULL, 'ចាន់ លីដា', 'Chann Lida', 'ស', '2007-09-21', '0312938888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(377, '000247', NULL, NULL, 'ជា ម៉េងអៀង', 'Chea  Meng Eeag', 'ប', '2006-09-28', '012649323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(378, '001456', NULL, NULL, 'ឈីន វណ្ណបញ្ញានាថ', 'Chhoeun Vanpanhaneath', 'ស', '2007-09-04', '017226306', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(379, '001520', NULL, NULL, 'ឈុន ហេង', 'Chhun Heng', 'ស', '2007-10-10', '070493637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(380, '001439', NULL, NULL, 'ឌី វរនោឧត្តម', 'Dy Voraknorodom', 'ប', '2008-06-25', '012965405', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(381, '001430', NULL, NULL, 'ទឹម ណៃហួយ', 'Tim  Naihouy', 'ស', '2007-03-30', '077690575', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(382, '001478', NULL, NULL, 'ប៉ុក ជិញយាន', 'Pok Chenhyen', 'ប', '2008-04-06', '061666668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(383, '000500', NULL, NULL, 'ប៉ោ ហារីណូ', 'Por Harino', 'ប', '2008-12-26', '012845355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(384, '000571', NULL, NULL, 'ម៉ាង និតយ៉ា', 'Mang Netya', 'ស', '2006-10-16', '012660453', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(385, '000171', NULL, NULL, 'យៀង ណៃ', 'Yeang Nai', 'ប', '2005-01-29', '089853533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(386, '000503', NULL, NULL, 'វណ្ណៈ សុវណ្ណឈីត', 'Vannak Sovanchhit', 'ប', '2007-01-02', '093669225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(387, '000603', NULL, NULL, 'វ៉ាត ស្រីទូច', 'Srey Touh', 'ស', '2006-08-25', '081999901', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(388, '000399', NULL, NULL, 'វេង ពិសីបូរណ៌មី', 'Veng Piseyboramey', 'ស', '2007-09-26', '077886161', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 2),
(389, '000398', NULL, NULL, 'វេង ពិសីម៉ូនីកា', 'Veng Piseymonika', 'ស', '2008-08-29', '069553068', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(390, '001433', NULL, NULL, 'ស គីមហួង', 'Sor Kimhuong', 'ស', '2008-06-05', '012332433', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(391, '001495', NULL, NULL, 'ស៊ីវ ស៊ីង', 'Siv Soeng', 'ប', '2008-12-04', '077979192', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(392, '000020', NULL, NULL, 'សាន វីរៈបុត្រ', 'San Vireakbut', 'ប', '2007-10-07', '092899999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(393, '001465', NULL, NULL, 'សារ៉ុម ច័ន្ទពេជ្រមណី', 'Sarom  Chanpichmoney', 'ប', '2007-01-08', '012952142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(394, '000359', NULL, NULL, 'សុន កែវរស្មីពេជ្រ', 'Sun Keavreaksmeypich', 'ស', '2008-12-02', '0889998992', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(395, '000533', NULL, NULL, 'សៀន ម៉េងហុង', 'Sean Meaghong', 'ប', '2007-03-29', '012759310', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(396, '001452', NULL, NULL, 'ហ៊ី ពុទ្ធារិទ្ធ', 'Hy Puthearith', 'ប', '2007-09-19', '012766289', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(397, '001527', NULL, NULL, 'ហាស់ សុវណ្ណលីដា', 'Has Sovannlida', 'ស', '2008-04-20', '012962159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(398, '000248', NULL, NULL, 'ហួត ម៉ីលី', 'Hout Meily', 'ស', '2007-11-18', '012938186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(399, '000626', NULL, NULL, 'ហេង ស៊ូធីង', 'Heng Southing', 'ស', '2007-05-15', '089827282', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(400, '000228', NULL, NULL, 'ឡាយ ស៊ីវជីន', 'Lay Sivchin', 'ស', '2008-10-13', '012333621', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(401, '001526', NULL, NULL, 'ឡាំ ម៉ាឡាវី', 'Laim Malavy', 'ស', '2006-11-22', '077265151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(402, '001432', NULL, NULL, 'អ៊ាប  អ៊ាមហុង', 'Eab Eamhong', 'ប', '2007-04-11', '012990192', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(403, '000038', NULL, NULL, 'អ៊ឹង ណៃហៀក', 'Oeng Naiheak', 'ស', '2008-04-14', '012332373', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(404, '001574', NULL, NULL, 'បូរី បញ្ញាឬទ្ធិ', 'Borey Pognaroeth', 'ប', '2007-04-09', '092246702', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(405, '001489', NULL, NULL, 'ខែត្រ វណ្ណស័ក្តិ', 'Khet Vansak', 'ប', '2008-01-22', '016225592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(406, '001450', NULL, NULL, 'គង់ ជូលី', 'Kang Julie', 'ស', '2007-06-12', '078990962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(407, '001455', NULL, NULL, 'ចាន់ កាន់វិនាថ', 'Chankan Vineath', 'ស', '2007-08-06', '016824141', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(408, '000535', NULL, NULL, 'ជា ស៊ីងឆាយ', 'Chea Singchay', 'ប', '2006-07-27', '011882183', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(409, '000442', NULL, NULL, 'ញ៉ែម លីតា', 'Nhem Lyta', 'ស', '2007-05-25', '012912123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(410, '000785', NULL, NULL, 'ដា វិសេត', 'Da visad ', 'ប', '2001-02-11', '0967916946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(411, '000057', NULL, NULL, 'ឌិប ស៊ីវនីន', 'Deb Sivnin', 'ស', '2008-01-26', '012843467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(412, '000217', NULL, NULL, 'តែ ប៉ីប៉ី', 'Te Peypey', 'ស', '2006-12-31', '012642434', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(413, '000314', NULL, NULL, 'ថន ពុធសុភា', 'Thon Putsuphea', 'ស', '2008-02-27', '012417105', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(414, '001451', NULL, NULL, 'ទូច ណារុង', 'Toch NaRong', 'ប', '2007-05-18', '012529955', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(415, '000303', NULL, NULL, 'ប៉ូ រចនាពេជ្រ', 'Po Rachna Pich', 'ស', '2008-01-22', '077833228', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(416, '001466', NULL, NULL, 'ប៉ូច សុជាតា', 'Poch Socheta', 'ស', '2008-03-02', '089791776', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(417, '000532', NULL, NULL, 'ភើយ សុភី', 'Pheug Sophy', 'ប', '2007-02-15', '0887666652', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(418, '001436', NULL, NULL, 'រ័ត្ន វឌ្ឍនាវង្ស', 'Rort Vatanavon', 'ប', '2006-01-01', '092833660', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(419, '001454', NULL, NULL, 'លីវ លីមហុង', 'Liv Limhong', 'ប', '2007-01-19', '077954495', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(420, '001468', NULL, NULL, 'លឹម ពេញឡុង', 'Lem Penglong', 'ប', '2007-01-24', '012431665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(421, '001431', NULL, NULL, 'លឹម ហ្គិចអេង', 'Lim Gecheng', 'ស', '2008-01-11', '078682626', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(422, '000567', NULL, NULL, 'សន សុវណ្ណធីតា', 'Sorn Sovannthida', 'ស', '2009-01-10', '070776016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(423, '000255', NULL, NULL, 'ស៊ីវ៉ុន រតនៈភួង', 'Sivon Rattanak phoung', 'ស', '2008-05-25', '089999585', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(424, '000331', NULL, NULL, 'សូ គីមហៀង', 'So Kimhieng', 'ស', '2007-05-13', '098363333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(425, '001480', NULL, NULL, 'សឿន ពេជ្ររីដា', 'Soeurn Pichryda', 'ស', '2007-10-16', '012578829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(426, '001437', NULL, NULL, 'សេរី សុខឃីម', 'Serey Sokkhim', 'ស', '2007-05-29', '085550550', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(427, '001479', NULL, NULL, 'សែម ជីងហ៊្វូ', 'Sem Chifou', 'ប', '2007-10-01', '092777727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(428, '000367', NULL, NULL, 'សោម សុវណ្ណយុទ្ធណា', 'Som Sovanyouthna', 'ប', '2005-07-11', '012833183', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(429, '000229', NULL, NULL, 'ហែម សុខរតនៈ', 'Hem Sokrathanak', 'ប', '2008-01-04', '077218333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(430, '000351', NULL, NULL, 'ឡ គីមហ៊ាង', 'Lor Kimheang', 'ស', '2007-07-07', '099929939', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(431, '001492', NULL, NULL, 'ឡាម កែវពេជ្រមេត្តា', 'Lam Keopichmeta', 'ស', '2006-01-03', '017395550', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(432, '001472', NULL, NULL, 'ឡេង ប៉ឈាង', 'Leng Porchheang', 'ប', '2007-05-02', '012405720', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(433, '001530', NULL, NULL, 'ឡុង មុនី្នសាវាណា', 'Long Monysaveana', 'ស', '2007-04-06', '078314575', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(434, '001551', NULL, NULL, 'ហុង សុវណ្ណរាជ្យ', 'Hong SovannaReach', 'ប', '2008-03-30', '012974474', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(435, '001572', NULL, NULL, 'តាន់ សុខហួរ', 'Tan SokHour', 'ប', '2008-02-26', '017674826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(436, '001470', NULL, NULL, 'ខូវ ប៉េងហុក', 'Khov Penghok', 'ប', '2007-09-19', '092722744', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(437, '000045', NULL, NULL, 'ឃន ណារ៉ុង ពីយ៉ានុត', 'Khon Narongpiyanuth', 'ស', '2008-12-12', '012807063', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(438, '001513', NULL, NULL, 'ងួន ម៉ីលីង', 'Ngoun MeyLing', 'ស', '2008-09-02', '012752294', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(439, '000450', NULL, NULL, 'ចាន់ កុលបុត្រ', 'Chan Kolboth', 'ប', '2008-10-23', '092222367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(440, '001523', NULL, NULL, 'ចាំង ជីទិច', 'Chang ChiTech', 'ប', '2007-12-09', '012856808', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(441, '000565', NULL, NULL, 'ចៅ ហ្វិកជី', 'Chao Foakchy', 'ប', '2005-06-01', '012448459', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(442, '001490', NULL, NULL, 'ឆង លីជីង', 'Chhong LyChing', 'ស', '2008-03-14', '012644552', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(443, '001469', NULL, NULL, 'ទៀ គុយឆាយ', 'Tea  Koychhy mey', 'ប', '2007-12-28', '099269999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(444, '000724', NULL, NULL, 'ទៀវ ចាន់បរមី', 'Ttev ChanBomey', 'ស', '2006-11-06', '093721593', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(445, '001457', NULL, NULL, 'ធី សិទ្ធាចារ្យ', 'Thy Setheacharx', 'ស', '2007-11-17', '012215902', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(446, '000276', NULL, NULL, 'ផល សុចាន់', 'Phol Suchan', 'ប', '2003-01-29', '0Sunbean', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(447, '000682', NULL, NULL, 'ពេជ្រ រដ្ឋាបញ្ញាសិទ្ធ', 'Pich Ratha Pannasith', 'ប', '2008-01-21', '010868699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:09', '2020-05-12 00:45:09', 0, 1, 1, 1),
(448, '001377', NULL, NULL, 'ភូ កុលបុត្រ', 'Phou Kolbot', 'ប', '2005-10-03', '077717104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(449, '001512', NULL, NULL, 'យិន ភីង', 'Yin Ping', 'ស', '2008-02-13', '077337549', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(450, '000479', NULL, NULL, 'រ៉េត សុខជា', 'Reth Sochea', 'ស', '2005-05-06', '061200189', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(451, '000279', NULL, NULL, 'លី សច្ចៈ', 'Ly Sachak', 'ប', '2007-01-25', '012501408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(452, '000321', NULL, NULL, 'លី សុផាន់នីត', 'Ly Sophanith', 'ស', '2005-11-17', '012237778', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(453, '001491', NULL, NULL, 'ស ជីងមាន', 'Sor Chingmen', 'ស', '2008-01-19', '089444555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(454, '000035', NULL, NULL, 'ស៊ុយ​ ហ្សាផកា', 'Suy ZapHaka', 'ស', '2007-08-19', '012600905', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(455, '001519', NULL, NULL, 'សារ៉េត ចាន់ថា', 'Sa Rathchuntha', 'ប', '2006-12-16', '012999034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(456, '000458', NULL, NULL, 'សុខា ច័ន្ទដានី', 'Sokha Chandany', 'ស', '2008-03-02', '095986996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(457, '001438', NULL, NULL, 'ស័ព្ទ វណ្ណឌីន', 'Sap VanDin', 'ប', '2008-05-16', '012215865', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(458, '000695', NULL, NULL, 'ហង្ស ជូលីន', 'Hang Choulin', 'ស', '2006-03-11', '078899996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(459, '001471', NULL, NULL, 'ឡាយ ជាលិញ', 'Lay CheaLing', 'ស', '2008-06-29', '012452045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(460, '001494', NULL, NULL, 'ឡេង ជីងយាន', 'Leng Chingyean', 'ស', '2007-09-11', '012295707', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(461, '001488', NULL, NULL, 'ឡោ សុខលាភ', 'LOr SoKleap', 'ស', '2007-08-16', '012644552', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(462, '000277', NULL, NULL, 'អោម ទីទី', 'Aoum TyTy', 'ប', '2006-11-08', '0Sunbean', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(463, '001556', NULL, NULL, 'សូ សុគន្ធសីហា', 'So SokunSeiha', 'ប', '2007-08-31', '0976246472', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(464, '001562', NULL, NULL, 'ជា​​​​​​​​​​​​​​​​​ ​​សុបញ្ញា', 'Chea Sopanha', 'ប', '2006-11-12', '015557432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(465, '001571', NULL, NULL, 'ឈាន លីហេង', 'Chhean Lyheng', 'ប', '2007-10-27', '017773767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(466, '001577', NULL, NULL, 'ហាប់ វណ្ណលីហូវ', 'Hap Vannlihov', 'ប', '2007-12-10', '086653377', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(467, '001293', NULL, NULL, 'កាំង វួចហ័ង', 'Kaing Vuoching', 'ស', '2007-01-30', '012333457', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(468, '000341', NULL, NULL, 'ខេ្នន សុភា', 'Khnen Sophea', 'ប', '2003-11-10', '0Tassel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(469, '001322', NULL, NULL, 'ងួន ស៊ីវប៉ី', 'Nguon Sirpey', 'ស', '2006-03-26', '012967227', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(470, '001331', NULL, NULL, 'ចន ធីហ៊ង', 'Chorn Thyhourng', 'ស', '2007-09-19', '077992269', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(471, '000452', NULL, NULL, 'ចាន់ ដារ៉ា', 'Chan Dara', 'ប', '2006-10-23', '012360767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(472, '000396', NULL, NULL, 'ចៅ យ៉ិកឡាង', 'Chao Yeoklang', 'ស', '2007-08-27', '092885525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(473, '001417', NULL, NULL, 'ជា ជឿន', 'Chea Choeun', 'ស', '2002-10-07', '0Sunbean', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(474, '001418', NULL, NULL, 'ជា ឌី', 'Chea Dy', 'ស', '2004-05-29', '0Sunbean', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(475, '000455', NULL, NULL, 'ជាង គឹមចាង', 'Chaeang Kimchang', 'ប', '2007-07-05', '012852751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(476, '000557', NULL, NULL, 'ឈន គិមហួង', 'Chorn Kimhoung', 'ស', '2006-05-25', '092700900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(477, '001330', NULL, NULL, 'ឈីន សុខាវត្តី', 'Chhin Sokhavatey', 'ស', '2007-06-08', '0978599990', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(478, '001482', NULL, NULL, 'ណាល់ សិរីវឌ្ឍនី', 'Nal Sireyvathny', 'ស', '2007-02-25', '092227746', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(479, '000464', NULL, NULL, 'ថេង ថារ័ត្ន', 'Theng Tharoth', 'ស', '2006-09-25', '012853994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(480, '001481', NULL, NULL, 'ទិន ធិនសុខាវតី', 'Tin Thinsokhavatey', 'ស', '2006-09-24', '012390735', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(481, '001426', NULL, NULL, 'ទ្រី ប៉េងឡុង', 'Try Penglong', 'ប', '2005-10-05', '092204080', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(482, '001347', NULL, NULL, 'ធៀង សុភាវី', 'Theang Sopheavy', 'ស', '2007-09-11', '012345717', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(483, '000481', NULL, NULL, 'នាង ផានិត', 'Neang Phanith', 'ប', '2004-10-04', '086447780', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(484, '001334', NULL, NULL, 'នុយ ប៊ុនហ៊', 'Noy bunhou', 'ប', '2006-05-05', '012645064', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(485, '000181', NULL, NULL, 'ប៉ែន​ រីហាន់ណា', 'Bean Ryhanna', 'ស', '2007-05-20', '010684186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(486, '001284', NULL, NULL, 'ភ័ណ ដេវីដ', 'Phorn Devid', 'ប', '2006-12-29', '081861773', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(487, '000251', NULL, NULL, 'ម៉ឹង អៀមសេង', 'Moueng Eanseng', 'ប', '2004-01-06', '012428232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(488, '000542', NULL, NULL, 'ម៉ុង ផេងហ៊ន', 'Mong Phenghoun', 'ប', '2006-11-30', '012928542', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(489, '001362', NULL, NULL, 'ម៉ុច ណាមិញ', 'Much Naminh', 'ប', '2006-11-10', '077987746', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(490, '001357', NULL, NULL, 'ម៉ូ ឧត្តមពន្លឺ', 'Mo Odampunlea', 'ប', '2006-11-05', '0979025701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(491, '001413', NULL, NULL, 'ម៉េង រដ្ឋទិការ', 'Meng Rothtika', 'ស', '2006-04-20', '077903353', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(492, '001289', NULL, NULL, 'មឿន សុវណ្ណដា', 'Moeu SovanDa', 'ស', '2006-10-08', '093755525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(493, '001310', NULL, NULL, 'យ៉ូវ ម៉ីហ្វាង', 'Yov  MeyFang', 'ស', '2007-06-04', '012483493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(494, '001318', NULL, NULL, 'ស៊ុំ សប្តាហ៍', 'Sum Sabada', 'ស', '2006-07-14', '087277155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(495, '001517', NULL, NULL, 'សឿន ស្រីកា', 'Seurn Sreyka', 'ស', '2006-01-23', '012708501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(496, '001394', NULL, NULL, 'ហុក សីឡាពេជ្រ', 'Hok Seylapich', 'ប', '2006-10-21', '016773977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(497, '000186', NULL, NULL, 'ហុង គឹមហួង', 'Houg Kimhoung', 'ស', '2006-12-26', '092222348', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(498, '001355', NULL, NULL, 'អ៊ិន សារីរិនថាក់យ៉ាណាត់', 'In saryrinthakyanat', 'ស', '2007-09-05', '089555532', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(499, '001366', NULL, NULL, 'អ៊ុង សុវីរៈ', 'Oung Sokvireak', 'ប', '2005-11-19', '086667627', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(500, '001346', NULL, NULL, 'កៅ លាងហាក់', 'Kao Leanghak', 'ប', '2006-07-08', '012572703', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(501, '000165', NULL, NULL, 'ងួន ម៉ីជីង', 'Nguon Meyjing', 'ស', '2007-01-23', '012383919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(502, '000543', NULL, NULL, 'ឆុន ឆាយច័ន្ទវិបុល', 'Chhon Chhaychanvibol', 'ប', '2006-07-24', '012763285', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(503, '001282', NULL, NULL, 'ឆោម ឆាយហេង', 'Chhorm Chhayheng', 'ស', '2007-01-28', '012290380', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(504, '001305', NULL, NULL, 'ឈុន វួចលីម', 'Chhun Vouchlim', 'ស', '2007-02-21', '092281090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(505, '001344', NULL, NULL, 'ឌី រាជស្ស', 'Dy Reachsak', 'ប', '2006-12-30', '012965405', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(506, '001311', NULL, NULL, 'ប៊ុនណា ស៊ីថាពេជ្រ', 'Bunna Sithapich', 'ស', '2007-01-11', '092935274', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(507, '001458', NULL, NULL, 'បេន វិជ្ជា', 'Ben Vichea ', 'ប', '2006-05-12', '012983738', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(508, '000267', NULL, NULL, 'ផល លក្ខិណា', 'Phal Leakna', 'ស', '2002-05-05', '092426979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(509, '001544', NULL, NULL, 'ផូផន ម៉ាយ៉ារី', 'Pho Phon Mayary', 'ស', '2005-07-12', '070233688', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(510, '000028', NULL, NULL, 'ម៉ែន សូដាលីសា', 'Man Sodalysa', 'ស', '2007-04-28', '098989025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(511, '001314', NULL, NULL, 'យស ទីទី', 'Yous TyTy', 'ប', '2006-10-07', '017244967', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(512, '001453', NULL, NULL, 'យ៉ាំ សៀន', 'Yam Sean', 'ប', '2006-08-20', '077774177', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(513, '000447', NULL, NULL, 'យឹម លីម៉េង', 'Yim Limeng', 'ប', '2006-10-18', '092231366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(514, '000263', NULL, NULL, 'រ៉ី សុវ៉ាន់', 'Ry Sovann', 'ស', '2002-01-05', '017873806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(515, '000329', NULL, NULL, 'រិទ្ធថា ជាលិញ', 'Ritha CheaLing', 'ស', '2006-11-24', '092888843', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(516, '001316', NULL, NULL, 'លី ម៉េងហាប់', 'Ly Menghap', 'ប', '2006-12-31', '012508182', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(517, '000568', NULL, NULL, 'វៀង គីមម៉េង', 'Vieng Kimmeng', 'ប', '2007-11-25', '070776016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(518, '000183', NULL, NULL, 'វ័ន ជីវ៉ា', 'ChIva Vorn', 'ប', '2006-04-30', '092426779', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(519, '000594', NULL, NULL, 'សរ ស៊ូឈិង', 'Sor Souchhing', 'ស', '2007-01-26', '012677216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(520, '001442', NULL, NULL, 'ស៊ីផា រតនភ័ណ្ឌ', 'Sipha Rattanakphorn', 'ប', '2005-11-11', '093514118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(521, '001286', NULL, NULL, 'សុខ មុនីរត្ន័', 'Sok Monyroth', 'ស', '2007-03-18', '012626271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(522, '000142', NULL, NULL, 'សុគុណ ស្រីពេជ្រ', 'Sokun Sreypich', 'ស', '2006-07-19', '012729108', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(523, '001336', NULL, NULL, 'សុង វណ្ណៈ', 'Song Vannak', 'ប', '2006-02-09', '092565784', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(524, '001421', NULL, NULL, 'ស្រី សុផាត', 'Srey Sophat', 'ប', '2005-08-06', '0714449898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(525, '000391', NULL, NULL, 'ហាក់ ស្រីនូ', 'Hak  Sreynov', 'ស', '2006-02-07', '0884840000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(526, '001308', NULL, NULL, 'ហុក វឌ្ឍនៈទេពី', 'Hok Vatanaktepy', 'ស', '2009-01-02', '092229430', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(527, '001496', NULL, NULL, 'ហួរ ម៉េងលីមីង', 'Hour Mengliminh', 'ប', '2005-01-05', '0883322263', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(528, '000502', NULL, NULL, 'ហៀង សុធារ៉ាត់', 'Heang Sothearath', 'ប', '2005-08-27', '098961111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(529, '001543', NULL, NULL, 'ម៉ៃ រតនា', 'Mai Rattana', 'ស', '2006-10-27', '012416942', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(530, '001560', NULL, NULL, 'សុគុណ ឆាយសាយលី', 'Sokun Chhaysayly', 'ប', '2005-08-24', '017411106', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(531, '001561', NULL, NULL, 'គិញ ខេវិន', 'Kinh Keven', 'ប', '2006-09-09', '0976661213', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(532, '000130', NULL, NULL, 'ក្លឹង ម៉ូល្លីកា', 'Kleng Molika', 'ស', '2005-11-26', '092222116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(533, '000576', NULL, NULL, 'ខុន មុនីរិទ្ធី', 'Khon Monirithy', 'ប', '2005-09-15', '0888839883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(534, '000294', NULL, NULL, 'គៀង ជួយស៊ីវ', 'Keang Chouysiz', 'ប', '2006-09-16', '012930262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(535, '001335', NULL, NULL, 'ឃាង ម៉ាសៀវអ៊ីន', 'Kheang Nasivin', 'ស', '2006-11-25', '0979184346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1);
INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(536, '001323', NULL, NULL, 'ចាន់ថា​ ម្លិះរ័ត្ន', 'Chantha Malisroth', 'ស', '2006-01-29', '0Brightstart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(537, '001368', NULL, NULL, 'ឈួង ម៉ីហ្វុង', 'Chhuong Meyfong', 'ស', '2006-09-21', '092925175', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(538, '000151', NULL, NULL, 'ញ៉ា ម៉ៅសុជាតា', 'Nha Maosocheata', 'ស', '2006-11-20', '012412212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(539, '001332', NULL, NULL, 'ញ៉ែម ស្រីហ៊ន', 'Nhem Sreyhorn', 'ស', '2006-09-27', '017809497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(540, '000597', NULL, NULL, 'ឌៀប ប៉លី', 'Deab Poly', 'ស', '2006-08-13', '017395858', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(541, '000025', NULL, NULL, 'ឌំ ប៊ុណ្ណរ៉ុង', 'Doum Bunrong', 'ប', '2007-03-30', '077375775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(542, '001292', NULL, NULL, 'ថុក សុបុណ្ណារី', 'Thok Sobenary', 'ស', '2006-09-21', '012515514', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(543, '001441', NULL, NULL, 'ធារ៉ា សុម៉ាលីន', 'Theara Somalin', 'ស', '2006-05-16', '070550880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(544, '001358', NULL, NULL, 'ធួ សុវណ្ណមុន្នី', 'Thour Sovanmony', 'ប', '2006-03-18', '012579773', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(545, '000495', NULL, NULL, 'ប៊ន់ ម៉ីលិញ', 'Bon Meylinh', 'ស', '2006-09-09', '012284346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(546, '0001307', NULL, NULL, 'ពឹង វេងឈៀន', 'Poeng Vengchheany', 'ប', '2006-12-10', '095562565', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(547, '001313', NULL, NULL, 'ពៅ​ ប្រុសនុន', 'Pov Brosnun', 'ប', '2007-03-20', '0976603609', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(548, '001333', NULL, NULL, 'ម៉ៅ សុជាតា', 'Mou Socheata', 'ស', '2004-08-11', '092505573', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(549, '000368', NULL, NULL, 'យុំា ម៉ីជូ', 'Yaim Meychou', 'ស', '2007-05-17', '012248158', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(550, '001287', NULL, NULL, 'លី ឈុនហួន ', 'Ly Chhunhoun', 'ប', '2006-08-28', '077832281', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(551, '000405', NULL, NULL, 'សឺន មុន្នីលាភហេង', 'Seun Moneleapheng', 'ប', '2007-02-18', '012280673', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(552, '001361', NULL, NULL, 'សានី លីវឆឹង', 'Sany Lychhoeng', 'ប', '2006-03-01', '012377701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(553, '001329', NULL, NULL, 'សុខ លីស៊ាង', 'Sok Lyseang', 'ប', '2007-01-06', '012993365', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(554, '001295', NULL, NULL, 'ហាក់ ម៉េងតាត់', 'Hak Mengtat', 'ប', '2006-03-30', '012387009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(555, '000501', NULL, NULL, 'ហៀង សុធារិទ្ធ', 'Heang Sothearith', 'ប', '2006-09-06', '017335333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(556, '001294', NULL, NULL, 'ហៃ វ៉ាយុ', 'Hai Vayu', 'ប', '2006-07-01', '017727225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(557, '000356', NULL, NULL, 'អ៊ឹង គីមហេង', 'Oeng Kimheng', 'ប', '2006-12-27', '092777168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(558, '001349', NULL, NULL, 'អ៊ុង​ ស្រីណាន់', 'Ung Soreynann', 'ស', '2005-08-02', '086667627', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(559, '001459', NULL, NULL, 'អ៊ួត ដាលីញ៉ែល', 'Uol Dalinhe', 'ស', '2004-01-09', '010569882', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(560, '000184', NULL, NULL, 'អាត ចាន់លាភ', 'Ath Chanleap', 'ស', '2004-02-01', '092426979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(561, '001532', NULL, NULL, 'ឌួង សីហៈបណ្ឌិត', 'Doung Seyhakbondeth', 'ប', '2006-09-22', '078846668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(562, '001565', NULL, NULL, 'ចៅ ម៉ីឡាន់', 'Chao Meylann', 'ស', '2004-04-08', '012800682', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(563, '001579', NULL, NULL, 'អ៊ឹង ស៊ីវលី', 'Ung Sivly', 'ស', '2006-03-13', '012645679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(564, '001276', NULL, NULL, 'ខូវ សៀងហេង', 'Khov Seangheng', 'ប', '2004-10-07', '012926199', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(565, '001137', NULL, NULL, 'ឃុន លីវធាន', 'Khun Livthean', 'ប', '2005-12-06', '077832060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(566, '001154', NULL, NULL, 'ចាង គីមលី', 'Chhang Kimly', 'ស', '2005-10-24', '012626266', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(567, '001227', NULL, NULL, 'ចាន់ ថិឈីវហួន', 'Chan Thechhivhvon', 'ស', '2006-12-27', '016340401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(568, '001172', NULL, NULL, 'ជា ស័ក្កមុនី', 'Chea Sakmony', 'ប', '2006-02-04', '012530507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(569, '001207', NULL, NULL, 'ជីវ សុភា', 'Cher Sophea', 'ស', '2005-12-20', '092335432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(570, '001444', NULL, NULL, 'ជុំ វណ្ណរិទ្ធ', 'Chum Vanrith', 'ប', '2005-08-27', '078682525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(571, '001476', NULL, NULL, 'ឈុន ច័ន្ទតារា', 'Chhun Chandara', 'ប', '2005-08-11', '0968989678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(572, '000057', NULL, NULL, 'ទៀ យូមីង', 'Tea Youming', 'ប', '2004-08-12', '016668168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(573, '001352', NULL, NULL, 'បូរ៉ា លីហ្សា', 'Bora Lisa', 'ស', '2005-08-18', '095444165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(574, '001185', NULL, NULL, 'ម៉ាង លីហ័រ', 'Mang Linuor', 'ប', '2005-03-06', '012585552', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(575, '001414', NULL, NULL, 'ម៉ុង គីមស៊ា', 'Mong Kimsea', 'ប', '2005-03-21', '012243878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(576, '001419', NULL, NULL, 'ម៉ៅ ធានដារ៉ា', 'Mao Theandara', 'ប', '2006-01-10', '078613297', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(577, '001514', NULL, NULL, 'មៃ សុណា', 'Maiy Sona', 'ស', '2004-03-31', '012416942', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(578, '001112', NULL, NULL, 'រតនា អះអ៊ីណាយ', 'Ratana Asinike', 'ប', '2005-12-11', '012216126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(579, '001369', NULL, NULL, 'រ៉ូន រីណា', 'Roun Rina', 'ស', '2005-07-14', '012745599', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(580, '000380', NULL, NULL, 'រួន ស្រីនូ', 'Roun Sreynou', 'ស', '2004-06-06', '017481295', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(581, '000283', NULL, NULL, 'លី គឹមជីង', 'Ly Kimching', 'ស', '2006-02-01', '012566117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(582, '000379', NULL, NULL, 'ស មិញស៊ឺ', 'Sor Minhsea', 'ប', '2005-12-24', '012999953', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(583, '001515', NULL, NULL, 'សន ម៉ូសេ', 'Sors Mose', 'ប', '2004-11-09', '098230077', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(584, '000071', NULL, NULL, 'សាន សិរីទេពី', 'San Sereitepy', 'ស', '2005-06-01', '092899999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(585, '001477', NULL, NULL, 'សុខ ចរិយា', 'Sok Chakriya', 'ស', '2005-04-29', '077340990', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(586, '001111', NULL, NULL, 'សុគន្ធ សៀកឡាយ', 'Sokorn Sichlay', 'ប', '2005-10-20', '012960782', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(587, '001246', NULL, NULL, 'សុវណ្ណ ដានេ', 'Sovan Dane', 'ស', '2007-05-19', '012553137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(588, '001116', NULL, NULL, 'សំអាត ស៊ីដេត', 'Samart Sidet', 'ប', '2005-09-27', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(589, '001167', NULL, NULL, 'ហេង សំណាង', 'Heng Samnang', 'ស', '2005-06-16', '012565113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(590, '000102', NULL, NULL, 'ហៃ អៀងឡាយ', 'Hai Ai Eongloy', 'ប', '2004-07-02', '089655595', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(591, '000016', NULL, NULL, 'អ៊ឹង ណៃហួយ', 'Oeng Naihouy', 'ស', '2006-03-22', '012332373', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(592, '001547', NULL, NULL, 'ប៊ុនធឿន សុខជីវ័ន', 'Bunthoun Sokchivorn', 'ប', '2005-12-25', '012943069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(593, '001563', NULL, NULL, 'ទេព ចន្ទ័មុនី', 'Tep Chanmony', 'ប', '2005-09-15', '092165162', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(594, '001189', NULL, NULL, 'ខៃ ឆទិត្យ', 'Khay Chhortith', 'ប', '2005-03-08', '092920257', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(595, '000001', '3A233', 'FLA22', 'គី រ៉ាស៊ី', 'Ky Rasy', 'ប', '2005-10-07', '098929025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2021-03-15 20:57:14', 0, 1, 1, 1),
(596, '001399', NULL, NULL, 'គី លីជីញ', 'Ky Lychinh', 'ស', '2005-11-07', '0973572020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(597, '001398', NULL, NULL, 'ចំរើន កន្និដ្ឋា', 'Chamreoun Konitha', 'ស', '2006-07-24', '0966665687', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(598, '000197', NULL, NULL, 'ជា ម៉ីនាង', 'Chea Meyneang', 'ស', '2005-09-03', '012875577', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(599, '001200', NULL, NULL, 'ធី សេដ្ឋាសារវ័ត្រ', 'Thy Sethasarakvath', 'ប', '2006-01-02', '012215902', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(600, '000496', NULL, NULL, 'ប៊ន់ ធានឈិញ', 'Bun Theanchhinh', 'ប', '2005-03-08', '012284346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(601, '001460', NULL, NULL, 'បើម ផានីត', 'Beoam Phanit', 'ស', '2003-07-09', '078456556', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(602, '001278', NULL, NULL, 'ប្រាក់ សិរីមាន', 'Prak Sereymean', 'ស', '2005-12-24', '012968478', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(603, '001252', NULL, NULL, 'ភី សុភារ៉ា', 'Phy Sopheara', 'ស', '2007-03-07', '012670956', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(604, '000252', NULL, NULL, 'ម៉ឹង ឈុន', 'Meung Chhun', 'ប', '2005-04-25', '012428232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(605, '000048', NULL, NULL, 'មាស ចរិយា', 'Meas Chakriya', 'ស', '2005-08-18', '012782272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(606, '001224', NULL, NULL, 'មាស ភីរុណ', 'Meas Phearun', 'ប', '2005-12-07', '012931759', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(607, '001153', NULL, NULL, 'យួង ជឺលាង', 'Yuong Cheuleang', 'ប', '2005-04-01', '012438414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(608, '001474', NULL, NULL, 'លី បាឡាត', 'Ly Balat', 'ប', '2004-11-04', '0965908877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(609, '001050', NULL, NULL, 'លី កាំងម៉េង', 'Ly Kangmeng', 'ប', '2006-01-02', '095442747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(610, '000438', NULL, NULL, 'លី ស៊ាវអ៊ី', 'Ly Sive', 'ស', '2004-11-18', '0972353731', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(611, '001170', NULL, NULL, 'វ៉ាន់នឿន ធីណា', 'Vannoeun Thina', 'ប', '2005-09-04', '012536860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(612, '001187', NULL, NULL, 'សាន សុវត្តី', 'San Sovattey', 'ស', '2006-09-20', '012220093', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(613, '001443', NULL, NULL, 'សារឿន រីនណេ', 'Saroeun Ritne', 'ស', '2006-12-16', '095202244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(614, '001497', NULL, NULL, 'សាលឿត ម៉ូលីកា', 'Saloeurt Molica', 'ស', '2006-12-21', '012238118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(615, '001175', NULL, NULL, 'សឿង ដាណេ', 'Soeung Dana', 'ស', '2007-01-10', '012530506', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(616, '001277', NULL, NULL, 'សេង ចរិយា', 'Song Chakriya', 'ស', '2005-11-20', '085848585', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(617, '000484', NULL, NULL, 'ហ៊ុយ គឹមស៊្រុន', 'Huy Kimsrun', 'ប', '2006-10-28', '061971197', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(618, '001288', NULL, NULL, 'ហូ ដានិកា', 'Ho Danika', 'ស', '2006-01-19', '095916492', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(619, '001213', NULL, NULL, 'អ៊ាន ធីម៉ានីតា', 'Ean Thymanita', 'ស', '2005-12-12', '070967264', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(620, '001568', NULL, NULL, 'កឹម ឈុនគា      ', 'Kim Chhankea', 'ប', '2005-08-16', '012757664', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(621, '001580', NULL, NULL, 'ហ៊ុន សេងហេង', 'Hun Sengheng', 'ប', '2005-11-11', '011666494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(622, '2000', '2000', '2000', 'លី ស្រីនាង', 'Ly Sreyneang', 'ស', '2005-05-19', '092760723', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2021-03-15 20:55:29', 0, 1, 1, 1),
(623, '001348', NULL, NULL, 'កង វិច្ឆិរ៉ា', 'Kang Vichhora ', 'ស', '2005-02-13', '012867468', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(624, '001475', NULL, NULL, 'ខៀវ សុងសូរាជបុត្រ', 'Khiev Songsoreachboth', 'ប', '2005-12-01', '012599979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(625, '000282', NULL, NULL, 'គា ជូលី', 'Kea Jolie', 'ស', '2005-09-18', '0767997994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(626, '001266', NULL, NULL, 'គូ សៀវលី', 'Kou Sivly', 'ស', '2005-08-29', '012371706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(627, '001155', NULL, NULL, 'ង៉ោ ច័ន្ទលាង', 'Ngor Chanleang', 'ប', '2005-09-20', '012977410', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(628, '000164', NULL, NULL, 'ងួន គីមឈុន', 'Nguon Kimchun', 'ប', '2005-07-13', '092888777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(629, '000122', NULL, NULL, 'ចាន់ សំណាង', 'Chan Samnang', 'ស', '2004-12-21', '012891422', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(630, '000397', NULL, NULL, 'ចៅ ឆយឹង', 'Chao Chhoryeong', 'ស', '2005-06-17', '092925544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(631, '001345', NULL, NULL, 'ជិន វិសាល', 'Chin Visal', 'ប', '2006-04-11', '0887802903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(632, '000136', NULL, NULL, 'តាន់ ស៊ូគៀង', 'Tann Soukeang', 'ស', '2006-02-27', '099999922', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(633, '001169', NULL, NULL, 'ថន ម៉ានីហ្សា', 'Thorn Manyza', 'ស', '2007-05-10', '012671928', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(634, '001225', NULL, NULL, 'ថេត បញ្ញា', 'Thet Panha', 'ប', '2005-12-09', '012931759', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(635, '001324', NULL, NULL, 'ធី រ៉ូហ្សា', 'Thy Rosa', 'ស', '2004-10-13', '0Brightstart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(636, '001154', NULL, NULL, 'ធឿន ឈិញវណ្ណ', 'Thoeum Chhinhvann', 'ប', '2005-08-01', '012934337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(637, '001197', NULL, NULL, 'ធៀង ភាត់សុភត្រា', 'Theang Portsopheaktra', 'ប', '2006-02-25', '012345717', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(638, '001291', NULL, NULL, 'នូ សិរីវឌ្ឍន៍', 'Nou Sereyvath', 'ប', '2005-06-11', '092592488', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(639, '00358', NULL, NULL, 'ប្រម​​ រដ្ឋនី', 'Brom Rathany', 'ស', '2004-06-29', '0963516538', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(640, '001309', NULL, NULL, 'ម៉ឹង ស៊ឺម៉េង', 'Moeng Seumeng', 'ប', '2005-12-17', '095999961', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(641, '001255', NULL, NULL, 'លឹម លីហេង', 'Lim Lyheng', 'ប', '2005-08-01', '092707171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(642, '001473', NULL, NULL, 'លឹម សិទ្ធនី', 'Lim Sydney', 'ប', '2004-03-01', '078365026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(643, '001247', NULL, NULL, 'សុវណ្ណ វរនីត', 'Savan Vornith', 'ស', '2006-02-22', '012553137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(644, '001110', NULL, NULL, 'ហង់ វិជ្ជោតា', 'Hang Vichota', 'ស', '2005-08-09', '089999090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(645, '001166', NULL, NULL, 'ហួរ ហ្វាវិនឡុង', 'Hour Favenlong', 'ប', '2006-02-25', '017699399', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(646, '001165', NULL, NULL, 'ហេង​ សុវណ្ណបញ្ញា', 'Heng Sovanpanha', 'ស', '2006-01-27', '077777200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(647, '001244', NULL, NULL, 'ឡេង ប៉ជឺ', 'Leng Porcheu', 'ប', '2005-04-28', '017405720', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(648, '001306', NULL, NULL, 'អ៊ាប អ៊ាមហេង', 'Eab Imheng', 'ប', '2004-12-15', '012990132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(649, '001422', NULL, NULL, 'អ៊ិន សារីរិនសាវ៉ាត់យុត្ត', 'In Sarysovathyuth', 'ប', '2006-01-21', '089800580', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(650, '001328', NULL, NULL, 'អាត សុខលាភ', 'Art Sokleap', 'ស', '2005-06-26', '017993442', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(651, '001094', NULL, NULL, 'គុន ច័ន្ទម៉ូលីកា', 'Kun Chanmolika', 'ស', '2004-10-25', '012454046', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(652, '000317', NULL, NULL, 'ចៅ មុយលី', 'Chao Muyly', 'ស', '2003-07-05', '017589977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(653, '000305', NULL, NULL, 'ចៅ យូអ៊ី', 'Chao Youey', 'ស', '2005-05-08', '012942489', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(654, '001142', NULL, NULL, 'ជា ចន្រ្ទា', 'Chea Chantrea', 'ស', '2004-09-08', '078561646', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(655, '001463', NULL, NULL, 'ឈៀត ឡៃហ្វុង', 'Chheat Laifong', 'ប', '2005-03-03', '092785357', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(656, '001001', NULL, NULL, 'ញ៉ែម ប៊ុនហ៊ួ', 'Nhem BonHour', 'ប', '2004-04-08', '092409123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(657, '001267', NULL, NULL, 'តាន់ លីណា', 'Tann Lyna', 'ស', '2004-08-01', '012609563', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(658, '001462', NULL, NULL, 'តិច អ៊ីស៊ាន', 'Tech Ysean', 'ស', '2004-07-18', '098818128', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(659, '001119', NULL, NULL, 'ធួក ច័ន្ទបូរមី', 'Thouk Chanboramey', 'ស', '2005-03-14', '017331641', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(660, '001503', NULL, NULL, 'នី ម៉ូលីកា', 'Ni Molika', 'ស', '2005-10-18', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(661, '001408', NULL, NULL, 'ប៊ុន វិទ្យា', 'Bun Vichea', 'ប', '2003-07-04', '077685169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(662, '001078', NULL, NULL, 'ពឹង បញ្ញា', 'Poeng Phanha', 'ប', '2004-03-05', '092918386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(663, '001524', NULL, NULL, 'យាត ស្រីយ៉ា', 'Yeat sryya', 'ស', '2004-11-10', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(664, '001022', NULL, NULL, 'យឿន​ គីមហេង', 'Yoeun Kimheng', 'ប', '2004-02-13', '012253313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(665, '000960', NULL, NULL, 'រួន លាបហេង', 'Roun Leapheng', 'ប', '2004-11-15', '0976784718', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(666, '001092', NULL, NULL, 'លាង ហោស៊ីញ', 'Leang Horsing', 'ប', '2004-07-04', '012617004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(667, '001297', NULL, NULL, 'លី ឈុនឡុង', 'Ly Chhunlong', 'ប', '2003-10-10', '077832281', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(668, '001037', NULL, NULL, 'លឹម ស៊ីវលីង', 'Lim Sivling', 'ស', '2004-06-11', '012328787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(669, '001504', NULL, NULL, 'លួង សូលីដា', 'Loung Solida', 'ស', '2004-06-05', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(670, '001461', NULL, NULL, 'វិត  រ៉ូហ្សា', 'Vit Roza', 'ស', '2005-06-22', '078564141', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(671, '001006', NULL, NULL, 'វិបុល វិច្ឆិកា', 'Vibol Vicheka', 'ស', '2004-11-17', '012724699', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(672, '000045', NULL, NULL, 'សារុន នរិន្ទ', 'Sarun Norin', 'ប', '2005-06-05', '086525216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(673, '000998', NULL, NULL, 'សុខា មុនីរដ្ឋា', 'Sokha Monyratha', 'ស', '2004-12-01', '095986996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(674, '001071', NULL, NULL, 'សួន សូរស្មី', 'Sourn Soraksmey', 'ស', '2005-03-04', '099509999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(675, '001043', NULL, NULL, 'ហម មុនីពូទីន', 'Horm Munypotin', 'ប', '2004-07-19', '0882044464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(676, '001042', NULL, NULL, 'ហម សុភារីតា', 'Hourm Sopherita', 'ស', '2004-07-19', '0882044464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(677, '001011', NULL, NULL, 'ហេង ស៊ូជិង', 'Heng Sojing', 'ស', '2004-08-13', '089827282', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(678, '000967', NULL, NULL, 'ឡាយ​​ អ៊ីងសុង', 'Lay Ingsong', 'ប', '2004-07-23', '077444466', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(679, '001237', NULL, NULL, 'អ៊ួត ដាលីហ្សា', 'Uot dalisha', 'ប', '2005-02-26', '012534807', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(680, '001498', NULL, NULL, 'អាំង ហេងឡុង', 'Ang Henglong', 'ប', '2004-10-24', '012308596', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(681, '001507', NULL, NULL, 'អំ ស្រីរ័ត្ន', 'Orm Sreyrot', 'ស', '2004-06-12', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(682, '001567', NULL, NULL, 'យ៉ាំង ខារីន', 'Yaing Khain', 'ប', '2004-12-16', '087788000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(683, '001567', NULL, NULL, 'ហ៊ាន តាំងហ៊ុន', 'Hea Tanghun', 'ប', '2004-03-15', '089731010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(684, '001484', NULL, NULL, 'គីង ឃែរី', 'King Kerry', 'ស', '2005-02-01', '099574444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(685, '001171', NULL, NULL, 'គឹម លីណា', 'Kim Lyna', 'ស', '2005-04-20', '017777731', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(686, '001499', NULL, NULL, 'ឃូ ម៉េងឃាង', 'Khou Mengkheang', 'ប', '2005-03-27', '012220987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(687, '001097', NULL, NULL, 'ឃឿន លាភហេង', 'Khaeurn Leapheng', 'ប', '2004-10-10', '012901801', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(688, '001021', NULL, NULL, 'ឆៃ ច័ន្ទតារាពេជ្រ', 'Chhaiy Chandarapech', 'ស', '2004-10-01', '011376737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(689, '000375', NULL, NULL, 'ជុង សុវិនជីង', 'Chung Sovinjing', 'ស', '2005-07-25', '012717006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(690, '001506', NULL, NULL, 'ជឿន ប្រុសពៅ', 'Choun Brospov', 'ប', '2002-02-15', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(691, '000061', NULL, NULL, 'តាន់ ហាក់ឃីង', 'Tann Hakking', 'ប', '2004-08-13', '092200677', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(692, '001073', NULL, NULL, 'តាំង លីម៉ី', 'Tang Lymey', 'ស', '2005-02-24', '077447777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(693, '001036', NULL, NULL, 'តែ សេងហ៊រ', 'Te Senghor', 'ស', '2004-04-15', '012357374', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(694, '000971', NULL, NULL, 'ធី ចន្ទរក្សា', 'Thy Chanreaksa', 'ស', '2004-07-28', '092410013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(695, '000970', NULL, NULL, 'ប៊ី គីមហេង', 'Be kimheng', 'ប', '2004-11-04', '0977640863', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(696, '001516', NULL, NULL, 'ម៉ុន គីមឃៀង', 'Mon kimkheang', 'ស', '2005-01-02', '098550578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(697, '000196', NULL, NULL, 'យិន សៀវម៉ី', 'Yen Sivmey', 'ស', '2004-12-22', '012579960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(698, '001256', NULL, NULL, 'រ៉ាអ៊ូល នរជេដ្ឋ', 'Raoul Norakched', 'ប', '2004-09-10', '012899144', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(699, '001059', NULL, NULL, 'លីវ ឆីងអ៊ីង', 'Liv Chhinging', 'ស', '2005-03-31', '095999918', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(700, '001409', NULL, NULL, 'លឹម គន្ធា', 'Lim Kunthea', 'ស', '2004-03-13', '012761998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(701, '000137', NULL, NULL, 'លឹម មួយចេង', 'Lim Mouycheng ', 'ស', '2005-06-19', '012530535', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(702, '001039', NULL, NULL, 'វ៉ូ ពិសិដ្ឋ', 'Vo Piseth', 'ប', '2005-03-26', '093313183', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(703, '000254', NULL, NULL, 'ស៊ីវ៉ុន សិទ្ធការ្យ', 'Sivon Sithkar', 'ប', '2005-08-03', '015421168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(704, '000210', NULL, NULL, 'ស៊ុន សុវណ្ណច័ន្ទរ៉ាយុទ្ធ', 'Sun Sovanchanrayuth', 'ប', '2005-02-23', '078712424', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(705, '000983', NULL, NULL, 'សុក សុជាត្តា', 'Sok Socheata', 'ស', '2004-10-08', '012285871', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(706, '001500', NULL, NULL, 'សុវត្តិ ពេញបូរមី', 'Sovath Pengborakmey', 'ស', '2005-02-23', '089982241', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(707, '000985', NULL, NULL, 'សឿន ម៉ាន់ឈីវ', 'Soeurn Mannchhiv', 'ប', '2005-02-11', '012578829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(708, '001121', NULL, NULL, 'សំ សៀវយាន', 'Sam Sievyean', 'ស', '2003-01-26', '069369379', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(709, '001337', NULL, NULL, 'សំបូរ សិរីបុត្រ', 'Sambo Sereybot', 'ប', '2004-02-24', '012618333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(710, '001118', NULL, NULL, 'ហុយ ហៃឆេង', 'Huy Haichheng', 'ស', '2004-12-31', '061971197', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(711, '000954', NULL, NULL, 'ហាក់ សុម៉ាលីតា', 'Hak Somalita', 'ស', '2004-08-16', '012388865', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(712, '000964', NULL, NULL, 'ហេង ហាក់ឡី', 'Heng Haklyey', 'ប', '2004-08-15', '012986167', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(713, '001023', NULL, NULL, 'ហោ លីណែត', 'Hor Lyneth', 'ស', '2004-09-07', '012870408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(714, '000045', NULL, NULL, 'អ៊ឹង លីចេង', 'Oeng Lycheng', 'ស', '2004-03-14', '081646898', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1);
INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(715, '000991', NULL, NULL, 'អេង ធឹងទីទី', 'Eng Thoung Tyty', 'ប', '2004-05-04', '012355557', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(716, '000275', NULL, NULL, 'គង់ ទេពពិរ៉ូ', 'Kong Tepiro', 'ប', '2004-08-26', '085500018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(717, '001863', NULL, NULL, 'គុណ រ៉ាស៊ី', 'Kun Rasy', 'ស', '2001-09-04', '0964568189', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(718, '001545', NULL, NULL, 'ចាំង ជីហេង', 'Chaing Chiheng', 'ប', '2003-03-14', '012233688', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(719, '001445', NULL, NULL, 'ចំរើន ហ្វ័រហូវ', 'Chamreourn Forhov', 'ប', '2004-12-11', '015575552', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(720, '001242', NULL, NULL, 'ច័ន្ទ តារាមកត់', 'Chan Daramorkat', 'ស', '2004-12-02', '012636345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(721, '001511', NULL, NULL, 'ជន ណារី', 'Chorn Nariy', 'ស', '2004-08-08', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(722, '001000', NULL, NULL, 'ជាង ចុងចុង', 'Cheang Chongchong', 'ប', '2005-08-18', '089987765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(723, '001521', NULL, NULL, 'តាំង ម៉េងលី', 'Tang Mengly', 'ប', '2004-10-15', '095649209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(724, '001032', NULL, NULL, 'ថេង សុធារិទ្ធ', 'Theng Therith', 'ប', '2004-05-26', '012423890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(725, '001508', NULL, NULL, 'ទិព្វ វណ្ណា', 'Tip Vanna', 'ប', '2004-11-09', '038300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(726, '000110', NULL, NULL, 'ធា ហុកហេង', 'Thea Hokheng', 'ប', '2002-05-06', '012363132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(727, '001117', NULL, NULL, 'ប៉ុង ហ្សាលី', 'Pong Zaly', 'ស', '2005-05-22', '070535360', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(728, '001505', NULL, NULL, 'បៀន ចិន្ដា', 'Bien Chanda', 'ប', '2002-09-24', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(729, '001290', NULL, NULL, 'ម៉េង កញ្ចនា', 'Meng Kanhchna', 'ស', '2004-09-21', '085566600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(730, '001140', NULL, NULL, 'ម៉ៅ សុគន្ធមករា', 'Mao Sokunmakara', 'ស', '2004-01-28', '0766262626', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(731, '000371', NULL, NULL, 'យ៉ុន ឈុនលាង', 'Yun Chhunleang', 'ប', '2003-04-15', '089527120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(732, '001483', NULL, NULL, 'រិទ្ធ វរៈលក្ស្មី', 'Rith Voreakleaksmey', 'ស', '2005-01-11', '0963842235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(733, '001525', NULL, NULL, 'រិន លីនដា', 'Ren Linda', 'ស', '2001-05-23', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(734, '001016', NULL, NULL, 'រិន ស្រីណែត', 'Rin Sreyneth', 'ស', '2004-05-24', '012751816', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(735, '000856', NULL, NULL, 'រឿន វិសាល', 'Reoun Visal', 'ប', '2003-03-15', '012833147', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(736, '001002', NULL, NULL, 'វង្ស សិរីណៃហេង', 'Vong Sereinayheng', 'ប', '2006-02-07', '012597144', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(737, '000002', '3A823', 'FLA32', 'ស៊ឹម ពិសិដ្ឋ', 'Sim Piseth', 'ប', '2004-07-06', '095777276', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2021-03-15 20:56:27', 0, 1, 1, 1),
(738, '001047', NULL, NULL, 'សាយ ម៉ាណាវ', 'Say Manav', 'ស', '2004-04-07', '069525211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(739, '001141', NULL, NULL, 'សាំង ចាន់ម៉ានីត', 'Suing Chanmanith', 'ស', '2004-03-16', '092883166', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(740, '000355', NULL, NULL, 'ហុង សុនីតា', 'Hong Sonita', 'ស', '2004-09-08', '092193597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(741, '001537', NULL, NULL, 'សាន់ ម៉ីលាន', 'Sann Meylern', 'ស', '2004-07-16', '092916767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(742, '001542', NULL, NULL, 'សម សង្វាត', 'Sam Sangvat', 'ប', '2001-08-03', '012501514', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(743, '001548', NULL, NULL, 'ងួន តារារ៉ូសឡុងប៊ិច', 'Ngourn Dararosilongbech', 'ស', '2004-03-09', '012797461', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(744, '001559', NULL, NULL, 'រ៉ា ខេម៉ា', 'Ra Kaema', 'ស', '2005-05-01', '093282882', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(745, '001566', NULL, NULL, 'សេង សុផល', 'Seng Sophal', 'ប', '2005-02-13', '012916818', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(746, '001570', NULL, NULL, 'ឌឿន ណារី', 'Doeurn Nary', 'ស', '2003-07-03', '0887174614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(747, '001582', NULL, NULL, 'ម៉េង សៀកផេង', 'Meng Siekpeheng', 'ប', '2003-08-31', '092444417', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(748, '001188', NULL, NULL, 'ចាន់ ជីងស៊ាង', 'Chan Chingseang', 'ស', '2003-09-29', '012292971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(749, '001125', NULL, NULL, 'ចាន់ ម៉េងហេង', 'Chan Mengheng', 'ប', '2003-03-21', '012751413', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(750, '001464', NULL, NULL, 'ជួន លាងហាក់', 'Chuon Leanghak', 'ប', '2003-03-26', '092398948', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(751, '001420', NULL, NULL, 'ជួប អ៊ីវហេង', 'Choub Evheng', 'ប', '2002-08-26', '078273080', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(752, '001415', NULL, NULL, 'តាន់ ថងវណ្ណវីរៈយុទ្ធ', 'Tan Thorngvianvireakyuth', 'ប', '2003-05-16', '016777832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(753, '001446', NULL, NULL, 'ថោង វរយៈ', 'Thaong Voryeak', 'ប', '2003-04-21', '0965878812', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(754, '000848', NULL, NULL, 'ទូច សុខវណ្ណិត្តា', 'Touch Sokvanetta', 'ស', '2003-04-26', '089855887', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(755, '000827', NULL, NULL, 'ធឿន រដ្ឋា', 'Thoeurn Ratha', 'ប', '2003-08-12', '0972088181', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(756, '001279', NULL, NULL, 'ផុន សៀវឡាង', 'Phon Sievlang', 'ស', '2003-10-29', '092290567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(757, '001423', NULL, NULL, 'ពា ស្រីលក្ខណ៍', 'Pea Sreyleak', 'ស', '2003-09-12', '069585802', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(758, '001144', NULL, NULL, 'ភើយ រចនា', 'Pheuy Rachana', 'ស', '2003-07-04', '0889999407', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(759, '000821', NULL, NULL, 'ម៉ុង ទីហួ', 'Mong Tihour', 'ប', '2001-01-06', '012928542', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(760, '000910', NULL, NULL, 'ម៉េង គីមឡុង', 'Meng Kimlong', 'ប', '2004-11-05', '012704533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(761, '000969', NULL, NULL, 'មុយ​ វិសុទ្ធារី', 'Muy Visotheary', 'ស', '2003-06-14', '077777346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(762, '001081', NULL, NULL, 'មឿន  ពិសី', 'Moeun Pisey', 'ស', '2003-10-30', '093755525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(763, '000138', NULL, NULL, 'យីវ ម៉ីអ៊ី', 'Yiv Meye', 'ស', '2004-09-06', '012962307', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(764, '001230', NULL, NULL, 'វ៉ុង ស៊ីវហេង', 'Vong Sievheng', 'ស', '2005-01-01', '017259292', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(765, '001317', NULL, NULL, 'វិចិត្រ វិរៈគន្ធី', 'Vichet Vireakkunthy', 'ប', '2003-10-30', '092276806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(766, '000340', NULL, NULL, 'វែង សំណុក', 'Veng Somnuk', 'ស', '2003-05-13', '017615447', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(767, '001033', NULL, NULL, 'ស៊ឹម ថានីន', 'Sim Thanin', 'ប', '2003-09-20', '012699706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(768, '000855', NULL, NULL, 'សុខ មនី្នរចនា', 'Sok Monyrachana', 'ស', '2002-04-08', '012994746', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(769, '001123', NULL, NULL, 'សុខលី សុវណ្ណារ៉ា', 'Sokly Sovvanara', 'ប', '2003-10-29', '078376758', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(770, '000820', NULL, NULL, 'សុវណ្ណ ស្រីម៉ុច', 'Sovann Sreymuch', 'ស', '2003-03-21', '012984174', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(771, '000852', NULL, NULL, 'សំ​ លីហ្សា', 'Sam Lisa', 'ស', '2003-10-13', '095873791', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(772, '001534', NULL, NULL, 'ជុំ ច័ន្ទប្រណី', 'Chum Chanbroney', 'ប', '2004-12-22', '011992916', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(773, '001558', NULL, NULL, 'វង្ស ចេននី', 'Vong Chenny', 'ស', '2002-07-07', '092406921', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(774, '001576', NULL, NULL, 'រក្សា បូនិតា', 'Reak Saborita', 'ស', '2002-08-16', '093818817', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(775, '001582', NULL, NULL, 'ញ៉ ដានេ', 'Nhor Dane', 'ស', '2003-02-28', '012226864', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(776, '001375', NULL, NULL, 'ក្រាក់ ស្រីនីត', 'Krak Sreyrath', 'ស', '2003-12-21', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(777, '001518', NULL, NULL, 'គុណ យ៉ា', 'Kun Ya', 'ស', '2002-09-25', '0Bright Start', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(778, '000189', NULL, NULL, 'ជា​​ ឧភាលាភ', 'Chea Ouphealeap', 'ស', '2004-01-25', '012977299', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(779, '001179', NULL, NULL, 'ឌុច គឹមនី', 'Duch Kimny', 'ស', '2004-07-05', '012478409', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(780, '001353', NULL, NULL, 'ណាន សៅរ៍ឌី', 'Nan Saody', 'ប', '2001-01-17', '077533022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(781, '000066', NULL, NULL, 'តាន់ សូអ៊ីម', 'Tann Souim', 'ស', '2003-09-27', '099999922', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(782, '000947', NULL, NULL, 'តេង ឡងឌី', 'Teng Longdy', 'ប', '2003-05-19', '069488889', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(783, '000989', NULL, NULL, 'ទង សួគី', 'Toung Suky', 'ស', '2003-04-27', '012724055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(784, '000952', NULL, NULL, 'នូ សុភវិភូ', 'Nou Sopheakviphou', 'ប', '2004-02-12', '098523434', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(785, '001260', NULL, NULL, 'ព្រឿង សុវណ្ណប្រាថ្នា', 'Proiung Sovanprethrea', 'ប', '2003-11-22', '012965272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(786, '001509', NULL, NULL, 'ភី លីភីង', 'Phi Liphing', 'ស', '2005-01-03', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(787, '001447', NULL, NULL, 'មេត សីហា', 'Mith Seyha', 'ប', '2003-08-28', '012269123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(788, '001304', NULL, NULL, 'យ៉ាវ សម្ផស្ស', 'Yav Samphors', 'ស', '2003-05-01', '016783010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(789, '000067', NULL, NULL, 'យិន​ បុប្ផា', 'Yin Bopha', 'ស', '2003-05-08', '087818178', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(790, '001510', NULL, NULL, 'ស៊ន ឆវីត', 'Sorn Chhorvit', 'ស', '2003-12-17', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(791, '001339', NULL, NULL, 'សុង ស៊ីម៉ា', 'Sung Syma', 'ស', '2003-11-29', '092565784', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(792, '001003', NULL, NULL, 'សុវណ្ណ កណិការ', 'Sovann Kaknekav', 'ស', '2003-04-05', '012680607', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(793, '000892', NULL, NULL, 'សឿយ និស្ស័យ', 'Soeuy Nisav', 'ប', '2003-07-22', '092238373', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(794, '000803', NULL, NULL, 'សៀន លីហេង', 'Sean Lyheng', 'ប', '2003-03-23', '012565156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(795, '001065', NULL, NULL, 'សំណាង កែវមុន្នីនាថ', 'Samnang Keomonyneath', 'ស', '2003-11-04', '012998456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(796, '000141', NULL, NULL, 'ហុង មួយហ៊ាង', 'Hong Muyheang', 'ស', '2003-12-06', '098984498', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(797, '001058', NULL, NULL, 'ឡៃ លី', 'Lai Ly', 'ស', '2003-01-15', '0713042999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(798, '001410', NULL, NULL, 'អ៊ុក ចាន់រដ្ឋា', 'Uk Chearatha', 'ស', '2003-11-11', '078727247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(799, '000840', NULL, NULL, 'អ៊ុន ច័ន្ទសោភា', 'Un Chansophea', 'ស', '2004-02-27', '0717788885', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(800, '001402', NULL, NULL, 'ឈឹម លីវឈិញ', 'Chhim Livchhenh', 'ប', '2004-11-29', '092676666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(801, '000861', NULL, NULL, 'កែវ ប៉ារិកា', 'Keo Parika', 'ស', '2003-01-12', '017281878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(802, '000112', NULL, NULL, 'ងួន រតនៈវិស្សុត', 'Ngdun Rattanakvissot', 'ប', '2004-01-28', '012914691', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(803, '001354', NULL, NULL, 'ចាន់ ចិន្តា', 'Chan Chenda', 'ប', '2003-08-04', '0976905833', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(804, '001528', NULL, NULL, 'ចំរុង សុធារ៉ា', 'Chamrong Sotheara', 'ប', '2003-09-26', '0886272162', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(805, '001015', NULL, NULL, 'ឆុន សុដ្ឋាវត្តី', 'Chhon Sothavatey', 'ស', '2003-12-30', '015992981', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(806, '000266', NULL, NULL, 'ឈើន ពេជវីរីយា', 'Chhoeun Pichviriya', 'ស', '2003-11-15', '012913776', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(807, '000296', NULL, NULL, 'ញ៉ែម  ប៊ុនហួន', 'Nhem Bunhourn', 'ប', '2004-04-03', '017809497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(808, '000199', NULL, NULL, 'ដែង សុគន្ធធីតា', 'Deng Sokunthyda', 'ស', '2002-10-05', '093546254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(809, '001367', NULL, NULL, 'ថៃ ហួយហ្សៀង', 'Thai Houys', 'ស', '2004-02-12', '015583910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(810, '001383', NULL, NULL, 'ប៉ែន រក្សា', 'Pen Reaksa', 'ប', '2003-04-20', '090955350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(811, '000807', NULL, NULL, 'ម៉ារ៉ា ស្ទីណា', 'Mara Stina', 'ស', '2003-03-22', '016222346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(812, '001381', NULL, NULL, 'មុត ផាន់ម៉ៃ', 'Mout Phanmai', 'ស', '2002-09-05', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(813, '000185', NULL, NULL, 'យៀង ថន', 'Yeang Thorn', 'ស', '2002-01-01', '0Sunbean', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(814, '000806', NULL, NULL, 'រតនៈ រ៉េហ្វាន់', 'Ratanak Rayfund', 'ប', '2004-07-04', '012881939', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(815, '001108', NULL, NULL, 'វណ្ណៈ សុគន្ធារី', 'Vannak Sokuntheary', 'ស', '2003-03-12', '012669225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(816, '000063', NULL, NULL, 'សុន​ សុខសំណាង', 'Sun Soksomnang', 'ប', '2004-01-20', '0889998992', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(817, '001485', NULL, NULL, 'សេង សុខលី', 'Seng Sokly', 'ស', '2003-04-15', '016332262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(818, '000822', NULL, NULL, 'សែ សុងម៉ាលីសា', 'Se Songmalisa', 'ស', '2004-02-10', '012220110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(819, '000823', NULL, NULL, 'សោម ស័ក្កនិតា', 'Som Saknita', 'ស', '2005-11-06', '0977562345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(820, '001384', NULL, NULL, 'ហ៊ឹក សុខលីចេ', 'Heok Soklyche', 'ប', '2003-02-28', '0Light house', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(821, '000841', NULL, NULL, 'ហែម សេរីវុឌ្ឍ', 'Hem Sereyvuth', 'ប', '2003-11-02', '077218333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(822, '001424', NULL, NULL, 'អ៊ឹង ប៉េងសេង', 'Ung Pengseng', 'ប', '2004-03-17', '012275654', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(823, '001296', NULL, NULL, 'អ៊ួត ដារីយ៉ា', 'Uot Daliya', 'ស', '2004-01-09', '017904562', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(824, '000824', NULL, NULL, 'អឿប វិនយៀន', 'Oerb Vinyvan', 'ប', '2004-09-22', '012910350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(825, '001535', NULL, NULL, 'គុណ រ៉ានុត', 'Kun Ranut', 'ប', '2003-04-29', '092616666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(826, '001529', NULL, NULL, 'ណន រិទ្ធិស័ក្ត', 'Norn Rithysak', 'ប', '2004-03-01', '095888008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(827, '001569', NULL, NULL, 'កឹម ភៀនឌី', 'Kim Pheindy', 'ស', '2002-11-12', '012757664', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(828, '000052', NULL, NULL, 'កាំង ឡេងហួត', 'Kang Leanghouth', 'ប', '2002-12-08', '012333457', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(829, '001079', NULL, NULL, 'ឆេង ឆៃហេង', 'Chhen Chnaiheng', 'ប', '2002-10-01', '015380088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(830, '001268', NULL, NULL, 'ឌុច គឹមង៉ាន', 'Duch Kimnhan', 'ស', '2002-02-21', '0Brightstart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(831, '000221', NULL, NULL, 'ឌួង គឹមហុង', 'Doung Kimhoung', 'ស', '2002-10-04', '086230250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(832, '000620', NULL, NULL, 'តែ សេងហុក', 'Te Senghok', 'ប', '2002-11-20', '087357374', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(833, '000752', NULL, NULL, 'ថុល ធួន', 'Thol Thourn', 'ប', '2000-03-07', '0969538894', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(834, '00783', NULL, NULL, 'នុត យុវនាថ', 'Nuth Youveneat', 'ប', '2001-12-19', '012530270', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(835, '001177', NULL, NULL, 'ប៉ិច សុផា', 'Pech Sopha', 'ស', '2000-06-06', '0Brightstart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(836, '000601', NULL, NULL, 'ផែ សិរីនាថ', 'Phe Sireyneath', 'ស', '2002-03-22', '012668882', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(837, '001340', NULL, NULL, 'យាង ម៉ូនីកា', 'Yeang Monyka', 'ស', '2003-04-19', '0883877771', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(838, '000781', NULL, NULL, 'ស បញ្ញា', 'Sar Panha', 'ប', '2002-09-14', '016904900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:10', '2020-05-12 00:45:10', 0, 1, 1, 1),
(839, '000068', NULL, NULL, 'សាន ឆេងរតន៍', 'San Chhengroth', 'ប', '2003-05-22', '012852514', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(840, '001211', NULL, NULL, 'សុខា បញ្ញាពេជ្រ', 'Sokha Panhapich', 'ស', '2002-06-01', '069264690', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(841, '000699', NULL, NULL, 'ស្រ៊ុន កុកផេង', 'Srun Kikpheng', 'ប', '2001-11-13', '017666266', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(842, '001501', NULL, NULL, 'ហ៊ន លាងហួរ', 'Horn Leanghour', 'ប', '2004-01-01', '012428912', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(843, '001300', NULL, NULL, 'ហុង គឹមហួច', 'Hong Kimhuoch', 'ស', '2002-03-16', '089378448', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(844, '000147', NULL, NULL, 'ហេង ថៃសាន', 'Heng Thaisan', 'ប', '2002-01-21', '012854600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(845, '000966', NULL, NULL, 'ហេង ហាក់​ឡេង', 'Heng Hakleng', 'ប', '2002-05-22', '012986167', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(846, '000198', NULL, NULL, 'ឡាយ ស៊ីវអ៊ី', 'Lay Sivy', 'ស', '2004-03-12', '012333621', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(847, '001533', NULL, NULL, 'ឈឺន ណាត់សូលីកា', 'Chhoeun Natsolika', 'ស', '2001-10-21', '012425817', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(848, '001538', NULL, NULL, 'សាន់ សុភា', 'Sann Sophea', 'ស', '2001-09-30', '092916767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(849, '001539', NULL, NULL, 'គួច​​​​​ គីមហាក់', 'Kourch Kimhak', 'ប', '2001-05-20', '077838243', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(850, '001540', NULL, NULL, 'សុង គីមហេង', 'Song Kimheng', 'ប', '2001-05-29', '0976296168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(851, '001541', NULL, NULL, 'សូវ យ៉ុងខាង', 'Sov Yongkhang', 'ប', '2001-11-24', '012782264', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(852, '001546', NULL, NULL, 'យិន សេរីរត្ថា', 'Yin Sereirotha', 'ស', '2001-06-07', '077217717', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(853, '001557', NULL, NULL, 'លេង វណ្ណៈ', 'Leng Vannak', 'ប', '2001-11-06', '012402081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(854, '001564', NULL, NULL, 'ឌួង រ៉ាឌុន', 'Doung Radon', 'ប', '2000-10-29', '017714074', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(855, '001146', NULL, NULL, 'កុល មុនីបុត្រ', 'Kol Monybot', 'ប', '2003-06-25', '092535401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(856, '000612', NULL, NULL, 'គៀង ជួយស៊', 'Keang Chouysor', 'ប', '2002-09-05', '012930262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(857, '000222', NULL, NULL, 'ឃូ ស៊ុនមុយអ៊ី', 'Khou Sunmouye', 'ស', '2002-09-17', '011661391', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(858, '001250', NULL, NULL, 'ឆន រស្មី', 'Chhorn Reaksmey', 'ស', '2002-10-31', '092288647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(859, '000993', NULL, NULL, 'ឆៃ សៀងហួត', 'Chhai Sienghuot', 'ប', '1999-01-05', '060424162', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(860, '000797', NULL, NULL, 'ឆោម​ ឆាយហួរ', 'Chhorm Chhayhour', 'ប', '2002-10-27', '012290380', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(861, '000800', NULL, NULL, 'ជា សុគន្ធកក្កដា', 'Chea Sokunkada', 'ស', '2002-07-30', '012898306', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(862, '001262', NULL, NULL, 'ឈូក អេណារ៉ូហ្សា', 'Chhouk Anarosha', 'ស', '2002-04-29', '092277247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(863, '001275', NULL, NULL, 'តាំង សុម៉ាវតី', 'Taing Somavortey', 'ស', '2002-09-01', '012836566', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(864, '000606', NULL, NULL, 'នង សុវណ្ណារ៉ា', 'Norng Sovannara', 'ប', '2002-08-29', '017460006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(865, '000831', NULL, NULL, 'ប៉ិច ឆវ័ន្ត', 'Pech Chhorvorn', 'ប', '2002-05-30', '067448877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(866, '000240', NULL, NULL, 'ប៉ុញ ឧត្តមវឌ្ឍនៈ', 'Ponh Oudamwathanak', 'ប', '2002-08-09', '070464687', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(867, '000005', NULL, NULL, 'ប៉ូច សុវណ្ណារតន៍', 'Poch Sovannaroth', 'ស', '2002-12-08', '098791776', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(868, '000608', NULL, NULL, 'ប៉ោ ហារីហ្សា', 'Por Hariza', 'ស', '2002-12-18', '077771180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(869, '001205', NULL, NULL, 'យ៉ន ពៅពិសី', 'Yorn Ovpisey', 'ស', '2001-09-22', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(870, '000686', NULL, NULL, 'យុំា ចីហា', 'Yam Cheyha', 'ស', '2003-06-03', '092922222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(871, '001522', NULL, NULL, 'វី ឌីឋានន្ត', 'Vy Dythanan', 'ប', '2002-10-30', '012223797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(872, '000618', NULL, NULL, 'សួន នភាល័យ', 'Svon Nophealey', 'ស', '2003-03-01', '095893899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(873, '000615', NULL, NULL, 'សេង ពិសី', 'Seng Pisey', 'ស', '2002-11-22', '012297979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(874, '001283', NULL, NULL, 'ហ៊ាង ម៉េងជូ', 'Heang Mengchou', 'ស', '2002-11-05', '017440403', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(875, '000616', NULL, NULL, 'ហូ កែវស្រីពៅ', 'Ho Kevsreypov', 'ស', '2003-01-19', '012892530', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(876, '000670', NULL, NULL, 'ហេង ម៉េងស្រេង', 'Heng Mengsreng', 'ប', '2002-12-13', '078366966', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(877, '000144', NULL, NULL, 'ឡី ឡាយអាន', 'Ley Layan', 'ប', '2002-11-12', '012575848', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(878, '000605', NULL, NULL, 'ឡុង ម៉ូណាលីហ្សា', 'Long Monaliza', 'ស', '2002-03-06', '081815151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(879, '000729', NULL, NULL, 'អេង ដាលីន', 'Eng Dalin', 'ស', '2002-06-30', '092999995', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(880, '001550', NULL, NULL, 'តាំង ស៊ាកហ៊ុយ', 'Tang Seakhuy', 'ស', '2001-01-05', '012319377', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(881, '001549', NULL, NULL, 'ម៉ី ស្រីល័ក្ខ', 'Mey Sreyleak', 'ស', '2000-10-05', '089445859', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(882, '001554', NULL, NULL, 'ហុង សិរីវឌ្ឍនៈ', 'Hong Sereyvathanak', 'ប', '2001-02-11', '089800618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(883, '000769', NULL, NULL, 'ចាន់ សម្ផស្ស', 'Chan Somphars', 'ស', '2002-03-13', '017702066', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(884, '001298', NULL, NULL, 'ឆោម សត្យា', 'Chhom Shattya', 'ប', '2002-02-28', '093974724', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(885, '001364', NULL, NULL, 'ឈិន ណាន', 'Chhin Nan', 'ស', '1998-07-02', '0Brightstart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(886, '001204', NULL, NULL, 'ឈួន វណ្ណា', 'Chhoun VannaA', 'ស', '2001-09-10', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(887, '001407', NULL, NULL, 'ញ៉ិប សំណាង', 'Nhep Samnang', 'ប', '2001-04-15', '0963647009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(888, '000621', NULL, NULL, 'តេ សេងឡុង', 'Te Senglong', 'ប', '2003-09-02', '012544555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(889, '000928', NULL, NULL, 'ប៊ុង ស៊ីវម៉ិញ', 'Bong Sievminh', 'ស', '2002-02-25', '012830590', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(890, '001386', NULL, NULL, 'ប្រាក់ សុវណ្ណបុផល', 'Prak Sovanbophal', 'ស', '2002-06-21', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(891, '001179', NULL, NULL, 'ផាន អែនជី', 'Phan Enchy', 'ស', '2003-06-05', '0968638438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(892, '001395', NULL, NULL, 'ពេជ្រ លីហួរ', 'Pich Lyhour', 'ប', '2003-08-14', '092717148', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(893, '001202', NULL, NULL, 'ពៅ សុភា', 'Pov Sophea', 'ស', '2002-02-08', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1);
INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(894, '000182', NULL, NULL, 'ម៉ឹង តុលា', 'Moeung Tola', 'ប', '2002-10-09', '0Sunbean', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(895, '001416', NULL, NULL, 'មឿន ស៊ីងថៃ', 'Moeun Singthay', 'ប', '2002-11-22', '093977589', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(896, '001026', NULL, NULL, 'រ៉ាយ ហុកឡេង', 'Ray Hokleng', 'ប', '2000-11-25', '012510679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(897, '000765', NULL, NULL, 'លឹម គីមហ៊ង', 'Loem Kimhourng', 'ស', '2001-08-17', '012437121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(898, '000931', NULL, NULL, 'វ៉ាន់ សុខលាង', 'Vann Sokleang', 'ប', '2002-09-15', '012213469', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(899, '001486', NULL, NULL, 'វ័ន្ត ថម', 'Vorn Tom', 'ប', '2004-09-19', '0962928830', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(900, '001449', NULL, NULL, 'សិទ្ធ វីសេដ្ឋ', 'Sith Viseth', 'ប', '2002-07-29', '092835583', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(901, '000611', NULL, NULL, 'សុខា ច័ន្ទសុវណ្ណ', 'Sokha Chansovann', 'ស', '2003-02-08', '089987765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(902, '000612', NULL, NULL, 'សុភ័ក្ត្រ មេត្តា', 'Soppheak Meta', 'ស', '2001-12-03', '092959581', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(903, '000619', NULL, NULL, 'សេង ហ៊ួរ', 'Seng Hour', 'ប', '2002-04-20', '095389899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(904, '001080', NULL, NULL, 'ហ៊ុយ គឹមស្រេង', 'Hoy Kimsreng', 'ប', '2001-12-14', '0979990979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(905, '000955', NULL, NULL, 'ហ្វីន សើគីរីន', 'Fin Saukyrin', 'ប', '2001-09-10', '092334911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(906, '001150', NULL, NULL, 'លី សុគន្ធធាវី', 'Ly Sokuntheavy', 'ស', '2002-08-06', '015637033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(907, '001425', NULL, NULL, 'កឹម សុក្របំណង', 'KIM SOKBAMNANG', 'ប', '2002-03-29', '012497312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(908, '000802', NULL, NULL, 'គង់ លាភភា', 'KONG LEAPHEA', 'ស', '2003-01-21', '012357834', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(909, '001321', NULL, NULL, 'ជា លាភហេង', 'CHEA LEAPHENG', 'ប', '2002-02-08', '092870207', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(910, '000610', NULL, NULL, 'ជាង ប៉ីប៉ី', 'CHEANG PEYPEY', 'ស', '2003-03-15', '089987765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(911, '001502', NULL, NULL, 'ទិត្យ គឹមហៀង', 'TITH KIMHEANG', 'ប', '2003-01-01', '012787056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(912, '001234', NULL, NULL, 'នី ស្រីនាថ', 'NY SREYNEATH', 'ស', '2002-04-10', '012377701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(913, '001113', NULL, NULL, 'ប៉ាល់ ម៉េងចេម', 'PAL MENGJAME', 'ប', '2000-09-15', '089870372', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(914, '001101', NULL, NULL, 'ប៊ន់ ធានស៊ីញ', 'BUN THEANSINA', 'ប', '2003-01-18', '0313623333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(915, '001385', NULL, NULL, 'ប៊ុន សេងណៃ', 'BUN SENGNA', 'ប', '2002-03-10', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(916, '000751', NULL, NULL, 'ម៉េង ពុទ្ធិការ', 'MENG PUTHIKA', 'ស', '2002-01-24', '092913434', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(917, '000968', NULL, NULL, 'មុយ វិទូ', 'MUY VITOU', 'ប', '2001-10-05', '077777346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(918, '001041', NULL, NULL, 'យ៉ាន មិញហ៊ឺ', 'YANN MINGHER', 'ប', '2000-10-08', '012214713', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(919, '000604', NULL, NULL, 'លាវ ប៊ុនហេង', 'LEAV BUNHENG', 'ប', '2002-06-13', '012638008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(920, '001428', NULL, NULL, 'លី ស៊ីវលីន', 'LY SIVLIN', 'ស', '2002-03-13', '087709094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(921, '000949', NULL, NULL, 'សត់ ស៊ាវជា', 'SORT SEAVCHEA', 'ប', '2003-02-10', '092503438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(922, '001299', NULL, NULL, 'សូ អាលីហ្សា', 'SO ALIZA', 'ស', '2001-05-16', '012406627', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(923, '001128', NULL, NULL, 'សេត អ៊ីហ្សា', 'SET IZA', 'ស', '2002-08-02', '017784314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(924, '000915', NULL, NULL, 'ហាក់ បញ្ញា', 'HAK PANHA', 'ប', '1999-02-09', '085292927', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(925, '000145', NULL, NULL, 'ហួរ ​​​រីសា', 'HOUR MARIZA', 'ស', '2002-08-22', '017959950', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(926, '001536', NULL, NULL, 'អុន លីដា', 'ON LEDA', 'ស', '2002-05-13', '086371552', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(927, '001552', NULL, NULL, 'កែវ សេរីវឌ្ឍនា', 'KEO SERE YVATHNA', 'ប', '2002-04-19', '092999283', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(928, '001206', NULL, NULL, 'ឈិន ស្រីឡី', 'CHHIN SREYLEY', 'ស', '2000-06-20', '0Lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(929, '3A-0971', NULL, NULL, 'ជូ ម៉ាយ៉ាវីន', 'Chou Mayavin', 'F', '2013-05-09', '0081 58 88 68', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(930, '3A-0972', NULL, NULL, 'អ៊ីម វណ្ណនី', 'Im Vanny', 'F', '2013-12-26', '0099 29 47 45', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(931, '3A-0974', NULL, NULL, 'ហុក​ ជីងហ្វូ', 'Hok Jinfu', 'M', '2013-07-07', '0012 45 71 126', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(932, '3A-0978', NULL, NULL, 'គឹម វេជ្ជបញ្ញា', 'Koem Vicheck Panha', 'M', '2013-11-25', '0012 46 87 87', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(933, '3A-0979', NULL, NULL, 'លី ហុកធៀន', 'Ly Hok Thean', 'M', '2013-09-22', '0017 35 18 18', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(934, '3A-0981', NULL, NULL, 'ហោន ធម្មជាតិ', 'Horn Tomachet', 'M', '2013-04-26', '0097 74 57 571', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(935, '3A-0986', NULL, NULL, 'សួង សុខវឌ្ឍនៈ', 'Suong Sokvatanak', 'M', '2013-12-22', '0095 83 85 85', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(936, '3A-0989', NULL, NULL, 'តាំង គីមជូ', 'Tang Kimchou', 'F', '2013-11-05', '0092 30 20 70', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(937, '3A-0990', NULL, NULL, 'ម៉េត ចន្ទសារពេជ្រ', 'Meth Chansarpich', 'F', '2013-12-24', '0012 38 38 23', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(938, '3A-0991', NULL, NULL, 'វង្សយ៉ារ៉ា ណាត់ថាឆា', 'Wong Yara Nathachha', 'F', '2013-03-28', '0061 41 34 56', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(939, '3A-0962', NULL, NULL, 'លី សុម៉ានីកា', 'Ly Somanika', 'F', '2011-05-31', '0092 87 54 27', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(940, '3A-0993', NULL, NULL, 'ណេត ម៉េងលី', 'Net Mengly', 'M', '2013-05-28', '0017 700 584', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(941, '3A-0997', NULL, NULL, 'ថង បញ្ញាវន្ត', 'Thong Panhawandh', 'M', '2013-08-09', '0012 83 75 85', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(942, '3A-0998', NULL, NULL, 'វង្ស ម៉ីលីង', 'Vong Meyling', 'F', '2013-03-13', '0 012 86 41 51', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(943, '3A-1151', NULL, NULL, 'នូ អ៊ីនរតនា', 'Nuo Enratana', 'M', '2013-11-03', '0081 85 55 81', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(944, '3A-0725', NULL, NULL, 'តុល តាំងគីម', 'Tal Tang kim', 'M', '2012-09-30', '0012 82 37 47', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(945, '3A-1001', NULL, NULL, 'តាំង ប៊ុនស៊ីវមិញ', 'Tang Bunsivminh', 'F', '2009-07-28', '0092 97 30 40', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(946, '3A-1003', NULL, NULL, 'ឡាយ​ ស៊ីវប៉ី', 'Lay Seavpey', 'F', '2012-09-13', '0098 38 63 10', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(947, '3A-1006', NULL, NULL, 'សែ ពុទ្ធិវឌ្ឍនៈ', 'Se Puthivathanak', 'M', '2011-08-15', '0092 21 70 86', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(948, '3A-1007', NULL, NULL, 'ឡុង កាន់', 'Long Kan', 'M', '2011-04-12', '0088 55 31 49', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(949, '3A-1011', NULL, NULL, 'ជាតិ ច័ន្ទសុធិម៉ា', 'Cheat Chankokthima', 'F', '2012-12-07', '0081 6666 75', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(950, '3A-1019', NULL, NULL, 'គុយ ស៊ូហ្សា', 'Kuy Zusa', 'M', '2012-06-23', '0012 86 00 86', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(951, '3A-1020', NULL, NULL, 'ចំរើន ជាឈិន', 'Chomreun Jingling', 'F', '2013-12-31', '0085 53 99 77', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(952, '3A-1021', NULL, NULL, 'ឆាយ៉ា ម៉ារីអូ', 'Chhaya Mario', 'M', '2014-02-05', '0096 666 37 88', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(953, '3A-1022', NULL, NULL, 'កាន ចាន់សាតយ៉ាវីរៈ', 'Kan Chansatya Vireak', 'M', '2013-09-25', '0012 93 84 21', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(954, '3A-1025', NULL, NULL, 'ម៉ុច ម៉ានី', 'Much Many', 'M', '2010-07-10', '0061 45 65 66', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(955, '3A-1026', NULL, NULL, 'ផេង ម៉េងហេង', 'Pheng Meng Heng', 'M', '2013-08-21', '0060 66 71 71', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(956, '3A-1029', NULL, NULL, 'ហេង គុណផាសក្កា', 'Heng Kunphasaka', 'F', '2011-04-06', '0060 28 28 88', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(957, '3A-1162', NULL, NULL, 'សត្យា វីរៈពង្ស', 'Sathya Vireakpong', 'M', '2012-05-29', '0092 96 45 96', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(958, '3A-1154', NULL, NULL, 'អោ មិញហ៊ួរ', 'Or Minh Huor', 'M', '2014-01-28', '0081 71 17 71', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(959, '3A-1167', NULL, NULL, 'អ៊ូច សុធា​ វលក្ខណ៏', 'Ouch Sotheavoleak ', 'F', '2012-08-30', '0096 210 5910', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(960, '3A-1169', NULL, NULL, 'រ៉ើន កុសល', 'Reoun Kusol', 'M', '2011-03-04', '0012 652 487', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(961, '3A-0973', NULL, NULL, 'សុខ​ អេនជេលី', 'Sok Angelly', 'F', '2013-07-02', '0017 73 75 85', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(962, '3A-1031', NULL, NULL, 'នី ចន្រ្ទា', 'Ny Chantrea', 'F', '2010-09-18', '0 088 929 5762', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(963, '3A-1000', NULL, NULL, 'ពឹង វេងហុង', 'Peng Venghong', 'M', '2012-10-27', '0095 56 61 65', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(964, '3A-0977', NULL, NULL, 'លី អានស៊ីង', 'Ly Anshing', 'M', '2014-01-25', '0087 36 78 78', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(965, '3A-0985', NULL, NULL, 'ម៉េង ស៊ីវអ៊ីង', 'Meng Siv​ Ing', 'F', '2013-11-24', '0012 92 90 07', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(966, '3A-0987', NULL, NULL, 'លីម គីមហ្វូ', 'Lim Kimfu', 'M', '2013-10-09', '0089 29 90 09', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(967, '3A-1004', NULL, NULL, 'ផា ដាវី', 'Pha Davy', 'F', '2012-12-10', '0068 82 82 44', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(968, '3A-1005', NULL, NULL, 'រ៉ូ សុភាលាងសេង', 'Ro Sophealeangseng', 'M', '2011-10-10', '0012 44 33 31', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(969, '3A-0995', NULL, NULL, 'ភែន សុនីហ្សា', 'Phen Suniza', 'F', '2013-03-19', '0012 42 80 98', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(970, '3A-0998', NULL, NULL, 'លឹម ឈុនលាង', 'Lim Chhun Leang', 'F', '2013-12-01', '0012 69 13 13', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(971, '3A-1008', NULL, NULL, 'ឃីម លីលាងឆឹង', 'Khim Ly Leangchhoeng', 'M', '2012-06-19', '0097 66 777 95', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(972, '3A-1010', NULL, NULL, 'ហ្គស្មាន់ សេងហ្គីលីយ៉ាណា', 'Gasmanseng Gilyana', 'F', '2012-09-18', '0088 97 22223', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(973, '3A-1014', NULL, NULL, 'អឹង ដារិន', 'Oeng Darren', 'M', '2013-06-16', '0010 95 20 09', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(974, '3A-1018', NULL, NULL, 'លី ផេង', 'Ly Pheng', 'M', '2013-03-14', '0085 28 68 86', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(975, '3A-1000', NULL, NULL, 'ជីវ័ន អេលីបញ្ញា', 'Chivion Aly Panha', 'M', '2009-05-10', '0017 279 027', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(976, '3A-1001', NULL, NULL, 'ង៉ូ មុន្នីនិច', 'Ngo Mony Nich', 'F', '2012-02-24', '0092 92222 4', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(977, '3A-1002', NULL, NULL, 'ឡេង សារីណា', 'Leng Saryna', 'F', '2013-04-21', '0010 696 433', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(978, '3A-1023', NULL, NULL, 'តេង ស៊ាវហ្គិច', 'Teng Sivgech', 'F', '2013-06-10', '0012 29 92 44', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(979, '3A-1016', NULL, NULL, 'ទឹម ម៉ូនីតាជូលី', 'Tem MonitaJulia', 'F', '2013-03-08', '0096 600 03 52', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(980, '3A-1017', NULL, NULL, 'ទឹម ចនសុន', 'Tem Johnson', 'M', '2011-07-27', '0096 600 03 52', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(981, '3A-1152', NULL, NULL, 'រ៉ា ឈូអឺរ', 'Ra Chho Er', 'F', '2012-12-12', '0069 90 30 03', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(982, '3A-1026', NULL, NULL, 'ធី ហ្គិចហេង', 'Thy GuechHeng', 'F', '2013-09-13', '0012 366 722', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(983, '3A-0764', NULL, NULL, 'ឡុង ចុងយៀន', 'Long Chong Yean', 'M', '2012-11-17', '0067 5 7777 9', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(984, '3A-0867', NULL, NULL, 'វង្ស សុវណ្ណស័ក្កិ', 'Vong Sovansak', 'M', '2012-11-01', '0012 72 99 50', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(985, '3A-0791', NULL, NULL, 'ចាន់ ជីងហ្វូ', 'Chan ChingFu', 'M', '2012-12-30', '0012 29 29 71', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(986, '3A-1062', NULL, NULL, 'ម៉ី សិរីចេស្ដា', 'Mey Sereichesda', 'M', '2011-04-18', '0077 87 20 13', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(987, '3A-1034', NULL, NULL, 'ឈាង បុញ្ញវន្តី', 'Cheang Bonhvontey', 'F', '2013-06-24', '0012 64 19 79', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(988, '3A-1027', NULL, NULL, 'សំអុន ឧត្តមបញ្ញាសក្ដិ', 'Samonn Odompanhasak', 'M', '2013-06-08', '0012 47 74 80', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(989, '3A-0771', NULL, NULL, 'លឹម ជេនីខា', 'Lem Jennyca', 'F', '2012-05-28', '0078 26 50 26', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(990, '3A-1065', NULL, NULL, 'សុខ ផាត់នាគុណ', 'Sok Phatanankun', 'F', '2013-06-07', '0 087 339 944', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(991, '3A-1038', NULL, NULL, 'ស៊ីយ៉ាល ឯមម៉ូល្លី', 'Siyal Eammoly', 'F', '2011-09-27', '0077 27 02 00', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(992, '3A-1039', NULL, NULL, 'តាល់ សុភាជូលី', 'Tal SopheaJuly', 'F', '2013-06-28', '0078 56 56 69', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(993, '3A-0759', NULL, NULL, 'បូរ សុខាទេវី', 'Bo Sokha Tevy', 'F', '2012-04-05', '0077 27 25 26', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(994, '3A-1040', NULL, NULL, 'ឆាយ វីរៈបុត្រ', 'Chhay Vireak both', 'M', '2013-03-21', '0012 33 21 63', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(995, '3A-1041', NULL, NULL, 'ហ្វីលីប ស៊ីណឺរាស', 'Phillip Cil Nierras Jr', 'M', '2012-08-15', '0069 37 60 54', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(996, '3A-1042', NULL, NULL, 'ទី ថាវរិន្ទ', 'Ty Thawrin', 'M', '2013-03-24', '0011 48 88 298', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(997, '3A-1043', NULL, NULL, 'ឌៀប ម៉េងគួង', ' Diep Meng Koung', 'M', '2009-10-27', '0017 39 58 58', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(998, '3A-0922', NULL, NULL, 'អឿង ហេងសុភ័ក្រ្ដា', 'Eourng Heng Sopheaktra', 'M', '2011-11-30', '0016 73 78 79', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(999, '3A-1045', NULL, NULL, 'សេង គីមស៊ា', 'Seng Kimsear', 'F', '2010-11-28', '0093 37 7171', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1000, '3A-1167', NULL, NULL, 'សេក រ៉ូហ្សា', 'Sek Rosa', 'F', '2013-07-24', '0096 210 5910', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1001, '3A-0729', NULL, NULL, 'ជាង រត្ន័បញ្ញាភា', 'Cheang Rath panhaphea', 'F', '2010-10-31', '0 092 999 272', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1002, '3A-0849', NULL, NULL, 'ឆុន ឆាយច័ន្ទវិមាន', 'Chhon Chhay Chan Vimean', 'F', '2011-07-21', '0096 7777 031', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1003, '3A-0827', NULL, NULL, 'ហួត ថានករុណា', 'Hourt Than Karuna', 'M', '2010-11-28', '0017 28 34 16', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1004, '3A-0945', NULL, NULL, 'សិទ្ធី ដាលីន', 'Sethy Dalin', 'F', '2012-10-10', '0 077 838 320', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1005, '3A-0745', NULL, NULL, 'ទូច សុគន្ធនីកា', 'Touch Sokun Nika', 'F', '2013-01-23', '0098 52 85 39', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1006, '3A-0778', NULL, NULL, 'យិប ផេង', 'Yib Pheng', 'M', '2012-03-01', '0012 68 40 50', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1007, '3A-0748', NULL, NULL, 'ថៃនី ប៊ីលីរាជ', 'Thainy Belly Reach', 'M', '2012-05-17', '0017 26 73 67', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1008, '3A-0703', NULL, NULL, 'ខួន ថាក់គូ', 'Khourn Thaku', 'M', '2012-06-02', '0069 36 04 05', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1009, '3A-0744', NULL, NULL, 'ឡុង ប៉េងសី', 'Long Pengsey', 'M', '2010-04-29', '0012 27 17 74', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1010, '3A-0802', NULL, NULL, 'ម៉ឹង ស៊ឺអ៊ី', 'Moeng Seu Y', 'M', '2009-10-15', '0095 9999 61', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1011, '3A-0792', NULL, NULL, 'ឯក ប្រុសិន្រ្ទ', 'Ek Prosentra', 'M', '2012-06-10', '0010 81 71 99', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1012, '3A-0903', NULL, NULL, 'ថន សុម៉ាវត្តី', 'Thorn  Somavattey', 'F', '2009-10-07', '0088 43 44 005', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1013, '3A-0835', NULL, NULL, 'ម៉ៅ គីមហួរ', 'Mao Kimhour', 'M', '2012-02-23', '0092 92 91 15', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1014, '3A-0740', NULL, NULL, 'លីម ឡេងយៀន', 'Lim Lengyien', 'F', '2012-10-05', '0012 38 98 28', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1015, '3A-0774', NULL, NULL, 'តូយ ងួន', 'Toy Ngoun', 'M', '2012-08-15', '0012 94 07 71', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1016, '3A-0765', NULL, NULL, 'លឹម ជោលី', 'Lim Jolly', 'F', '2013-03-15', '0092 78 78 09', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1017, '3A-0741', NULL, NULL, 'ណាល់ មុន្នីនាថ', 'Nal Monyneath', 'F', '2012-07-01', '0012 93 15 16', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:11', '2020-05-12 00:45:11', 0, 1, 1, 1),
(1018, '3A-0789', NULL, NULL, 'ឈួន ម៉ីឈីន', 'Chhun Meychhin', 'F', '2012-11-07', '0 070 82 32 65', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1019, '3A-0734', NULL, NULL, 'តេង ហេងលាភ', 'Teng Hengleap', 'M', '2012-06-13', '0012 290 299', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1020, '3A-1050', NULL, NULL, 'ង៉ោ លីហួត', 'Ngor Lyhout', 'M', '2011-05-05', '0012 977 410', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1021, '3A-0752', NULL, NULL, 'វង្ស នីកាជីងលីញ', 'Vong Nika Jinglinh', 'F', '2012-08-07', '0017 424 545', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1022, '3A-0868', NULL, NULL, 'អាន សក្ដិ៍ឧត្តម', 'An Sahk Oudam', 'M', '2012-10-05', '0077 297 296', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1023, '3A-1165', NULL, NULL, 'នី ប៉ាន់ជោដិន', 'Ny Panjoden', 'M', '2009-07-13', '0012 520 728', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1024, '3A-0782', NULL, NULL, 'សត្យា បញ្ញាឬទ្ធិ', 'Sathya Panharith', 'M', '2012-09-29', '0012 28 62 68', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1025, '3A-0817', NULL, NULL, 'ស៊ុយ វិលៀម', 'Suy Viliem', 'M', '2010-02-23', '0012 60 09 05', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1026, '3A-0966', NULL, NULL, 'ចំរើន សោគន្ធិកា', 'Chamroeun Sorkunthnika', 'F', '2011-01-07', '0012 69 43 51', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1027, '3A-0862', NULL, NULL, 'ឆៃ ឡែនអេរិច', 'Chhai Len Eric', 'M', '2012-05-31', '0096 6666 620', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1028, '3A-0780', NULL, NULL, 'ហ៊ សៀងម៉ីលីង', 'Hor Seav Mey ling', 'F', '2012-11-28', '0098 69 65 60', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1029, '3A-0863', NULL, NULL, 'ខែម កិត្តគុណ', 'Khem Kitikun', 'F', '2012-08-04', '0017 45 45 65', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1030, '3A-0709', NULL, NULL, 'ផន យ៉ាណាពេជ្រ', 'Phon Yanapich', 'M', '2012-07-12', '0077 311 169', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1031, '3A-1160', NULL, NULL, 'សត្យា​ វិរៈបុត្រ', 'Sathya Vireakbot', 'M', '2009-07-04', '0092 96 45 96', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1032, '3A-0796', NULL, NULL, 'សួន ច័ន្ទមន្នី', 'Soun Chanmony', 'M', '2012-06-04', '0096 75 18 133', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1033, '3A-1051', NULL, NULL, 'ឈុំ ពុទ្ធិថាដាវ', 'Chhun Puthethadav', 'F', '2012-06-24', '0077 77 55 84', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1034, '3A-0824', NULL, NULL, 'ស៊ីន យុអ៊ី', 'Sin Yu E', 'M', '2012-09-08', '0012 26 09 57', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1035, '3A-0738', NULL, NULL, 'អ៊ិន លីមយ៉ុង', 'Un LimYong', 'M', '2012-07-27', '0092 212 210', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1036, '3A-0814', NULL, NULL, 'ញ៉ សុវណ្ណឧត្តមវិជ្ជា', 'Nhor Sovanodamvichea', 'M', '2012-08-19', '0087 74 24 15', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1037, '3A-0816', NULL, NULL, 'អៀ ហាក់ឃេអ៊ីន', 'Ea Hak Key In', 'F', '2012-12-30', '0092 76 79 76', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1038, '3A-0786', NULL, NULL, 'អ៊ា ឆាយឡេង', 'Ear Chhay leng', 'M', '2012-02-07', '0092 37 77 75', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1039, '3A-0736', NULL, NULL, 'យី វឌ្ឍនៈ', 'Yi Vadhanak', 'M', '2010-01-21', '0092 939 033', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1040, '3A-0871', NULL, NULL, 'វិបុល រតនា', 'Vibol Ratana', 'M', '2010-01-21', '0012 72 46 99', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1041, '3A-0815', NULL, NULL, 'ស ស្រីលក្ខិណា', 'Sor Srey Leakna', 'F', '2011-07-14', '0089 437 443', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1042, '3A-0800', NULL, NULL, 'រិទិ សេរីបញ្ញា', 'Rith Serey Panha', 'M', '2011-12-29', '0012 444 193 ', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1043, '3A-0769', NULL, NULL, 'រ័ត្ន សីមារាជ', 'Roth Seimareach', 'M', '2011-11-30', '0012 665 624', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1044, '3A-0879', NULL, NULL, 'តាង សៀវអ៊ីង', 'Tang Seav Ing', 'F', '2013-04-18', '0012 237 077', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1045, '3A-1118', NULL, NULL, 'ឃុន ម៉ូលីកា', 'Khun Molica', 'F', '2011-05-12', '0077 832 060', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1046, '3A-0923', NULL, NULL, 'ហួត សុវត្តី', 'Hout Sovatey', 'F', '2010-04-06', '0092 69 90 69', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1047, '3A-0905', NULL, NULL, 'គី លីជីញ', 'Ky Ly Chinh', 'F', '2005-11-07', '0097 35 72 020 ', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1048, '3A-0783', NULL, NULL, 'ធួក ឆាន់ជី', 'Thuok Chhanji', 'F', '2012-03-21', '0015 45 31 76', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1049, '3A-0742', NULL, NULL, 'ឈុត សុម៉ាវត្តី', 'Chhon Somavatey', 'F', '2010-11-11', '0088 91 39 658', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1050, '3A-0958', NULL, NULL, 'កែវ សិរីសុវីនា', 'Keo Serisovinea', 'F', '2010-08-17', '0012 50 11 19', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1051, '3A-0737', NULL, NULL, 'នាង ស៊ីណា', 'Neang Sina', 'F', '2009-12-29', '0086 44 77 80', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1052, '3A-0776', NULL, NULL, 'ទន់ វីរៈ', 'Tun Vireak', 'M', '2007-09-21', '0098 45 45 68', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1053, '3A-1052', NULL, NULL, 'ដា វិសេត', 'Da Viseth', 'M', '2001-02-11', '0087 42 10 93', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1054, '3A-1053', NULL, NULL, 'លឿម វរៈ', 'Loeum Voreak', 'M', '2007-08-14', '0096 79 169 46', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1055, '3A-1054', NULL, NULL, 'ពូល វណ្ណពិសិដ្ឋ', 'Poul Vanpiseth', 'M', '2009-09-28', '0017 225 250', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1056, '3A-1055', NULL, NULL, 'អ៊ុក ចាន់វឌ្ឍនៈ', 'Uk Chan Vattanak', 'M', '2009-01-19', '0092 666 191', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1057, '3A-1056', NULL, NULL, 'សេង សាវីនណា', 'Seng Savinna', 'F', '2008-09-02', '0088 97 22223', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1058, '3A-1057', NULL, NULL, 'ថៃ ជីងជីង', 'Thia Ching Ching', 'F', '2012-11-28', '0012 661 234', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1059, '3A-1058', NULL, NULL, 'គង់ ស្រីពេជ្រ', 'Kong Sreypich', 'F', '2013-02-06', '0092 26 76 16', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1060, '3A-1059', NULL, NULL, 'ហេង សេងឈុន', 'Heng Seng Chhon', 'M', '2012-09-07', '0012 965 396', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1061, '3A-1061', NULL, NULL, 'សារ៉េត ចាន់ថា', 'Sarat Cantha', 'M', '2006-12-16', '0012 999 334', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1062, '3A-1064', NULL, NULL, 'តាន់ ម៉ីនាង', 'Tan Meyneang', 'F', '2011-07-08', '0017 93 77 55', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1063, '3A-1067', NULL, NULL, 'ហេង ឌេវីត', 'Heng David', 'M', '2010-02-04', '0092 99 15 56', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1064, '3A-1003', NULL, NULL, 'ស៊ិន ប៊ុនហេង', 'Sin Bunheng', 'M', '2009-01-06', '0012 78 23 82', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1065, '3A-1006', NULL, NULL, 'ស៊ិន ប៊ុនឡេង', 'Sin Bunleng', 'M', '2010-08-06', '0012 78 23 82', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1066, '3A-1031', NULL, NULL, 'ហុក ពេជ្រធីកាកែវ', 'Hok Pichtida Keo', 'F', '2010-05-21', '0012 45 71 126', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1067, '3A-0864', NULL, NULL, 'ហេង ម៉ីហ្វាង', 'Heng MeiFang', 'F', '2010-05-21', '0017 430 000', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1);
INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(1068, '3A-1032', NULL, NULL, 'យ៉ាំម គុយឆាង', 'Yam Kuy Chhang', 'M', '2013-10-23', '0087 3333 81', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1069, '3A-1035', NULL, NULL, 'រិន្ទ សញ្ញាតា', 'Ren Sancheata', 'F', '2010-05-21', '0016 26 69 12', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1070, '3A-1037', NULL, NULL, 'ជាវ ជុតិបុណ្ណា', 'Cheav Choutibonna', 'F', '2013-07-03', '0012 36 5551', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1071, '3A-0957', NULL, NULL, 'ឡា លីទ័រ', 'La Litor', 'M', '2012-08-07', '0086 43 27 72', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1072, '3A-0826', NULL, NULL, 'ចាង ស៊ីងឡុង', 'Chang Sing Long', 'M', '2013-01-09', '0012 31 60 16', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1073, '3A-0799', NULL, NULL, 'ហួន គុជរក្សា', 'Houn Kuch Reaksa', 'M', '2012-07-09', '0011 70 23 87', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1074, '3A-0861', NULL, NULL, 'លី ហ៊ុនស៊ូ', 'Ly Hunsu', 'M', '2011-06-02', '0097 881 88 18', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1075, '3A-0790', NULL, NULL, 'ហួត ធីរ៉ា', 'Hout Thyra', 'M', '2012-02-07', '0089 271 112', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1076, '3A-0906', NULL, NULL, 'សៀង សៀកលី', 'Sieng Seakly', 'F', '2011-04-14', '0092 999 970', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1077, '3A-1048', NULL, NULL, 'ក្លឹង ដូនីហ្វុង', 'Khloeng Dony Fong', 'M', '2012-05-17', '0092 222 116', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1078, '3A-0902', NULL, NULL, 'រ៉ូន ដារ៉ា', 'Ron Dara', 'M', '2012-11-16', '0092 74 12 98', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1079, '3A-0779', NULL, NULL, 'ទន់ សូរីណែត', 'Tun Sorineth', 'F', '2012-12-06', '0096 94 93 427', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1080, '3A-0726', NULL, NULL, 'អ៊ឹង ម៉េងគឹម', 'Oem Mengkim', 'F', '2012-10-27', '0078 30 23 23', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1081, '3A-1047', NULL, NULL, 'សោម អជិតា', 'Soam Achita', 'F', '2013-01-06', '0069 882 272', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1082, '3A-1049', NULL, NULL, 'សុខ​​ នេត្រាជេហ្សីកា', 'Soknetra Jessica', 'F', '2013-07-12', '0086 5555 87', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1083, '3A-0914', NULL, NULL, 'ជុំ ចំរ៉ុង', 'Chum Chomrong', 'M', '2010-02-28', '0096 68 41 979', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1084, '3A-1126', NULL, NULL, 'អង រិទ្ធិបញ្ញារាជ្យ', 'Ang Rithphanhareach', 'M', '2013-06-17', '0096 4444 067', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1085, '3A-0934', NULL, NULL, 'មុំ ទីទី', 'Mom TyTy', 'M', '2011-11-09', '0012 969 535', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1086, '3A-1060', NULL, NULL, 'រី សុខឧត្តម', 'Rysok Oudom', 'M', '2013-09-01', '0012 144 741', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1087, '3A-0522', NULL, NULL, 'គង់ ជូលិញ', 'Kong Julinh', 'F', '2010-03-31', '0078 99 09 62', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1088, '3A-0586', NULL, NULL, 'ម៉ែន បូរ៉ាវត្តី', 'Men Boravattey', 'F', '2011-05-15', '0095 800 600', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1089, '3A-1068', NULL, NULL, 'ម្លិះ មាសធីតា', 'Mlis  Meas Thida', 'F', '2012-01-11', '0012 45 13 94', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1090, '3A-0577', NULL, NULL, 'នី ឈុនណាម', 'Ny Chhunnam', 'M', '2011-12-11', '0092 14 15 51', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1091, '3A-0838', NULL, NULL, 'ស៊ុន លីហៃ', 'Sun Lyhay', 'M', '2011-12-04', '0012 386 060', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1092, '3A-1069', NULL, NULL, 'ឡុង ឈៀងម៉ី', 'Long Chheang Mey', 'F', '2010-12-14', '0012 54 39 11', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1093, '3A-0528', NULL, NULL, 'ញឹក ពេជសុខប្រពៃ', 'Nhek Pichsokbrorpey', 'F', '2011-08-26', '0012 77 11 14', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1094, '3A-0504', NULL, NULL, 'រ៉ែម ច័ន្ទវិទ្យា', 'Rem Chan Vichea', 'M', '2011-11-28', '0017 71 71 147', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1095, '3A-0574', NULL, NULL, 'លី មួយគីម', ' Ly Muykim', 'F', '2010-12-13', '0089 377 693', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1096, '3A-0681', NULL, NULL, 'លី ប៊ុនលាភ', 'Ly Bunleap', 'M', '2012-02-28', '0012 437 446', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1097, '3A-0858', NULL, NULL, 'អ៊ុច សារីយ៉ាវណ្ណ', 'Ouch Sary Javan', 'M', '2012-11-05', '0012 60 96 50', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1098, '3A-0531', NULL, NULL, 'ម៉ែន គីសួគ៌', ' Men Kysour', 'F', '2011-03-05', '0098 65 56 97', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1099, '3A-0839', NULL, NULL, 'តាត់ បូរ៉ានីន', 'Tat Boranin', 'F', '2010-06-23', '0012 75 93 38', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1100, '3A-0733', NULL, NULL, 'គង់វង្ស មុន្នីវណ្ណ', 'KongVong Monyvann', 'M', '2012-07-19', '0092 200 001', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1101, '3A-0727', NULL, NULL, 'អ៊ឹង ម៉េងគួង', 'Oeng Mengkoung', 'M', '2010-12-12', '0078 30 23 23', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1102, '3A-0571', NULL, NULL, 'ហុង ឆាយស៊ីង', 'Hong Chhay Sing', 'M', '2011-07-24', '0012 49 76 36', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1103, '3A-0710', NULL, NULL, 'គង់​ យ៉ារីណា', 'Kong Yarina', 'F', '2009-12-11', '0086 26 76 16', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1104, '3A-1070', NULL, NULL, 'ឆាយ គីមអ៊ី', 'Chhay Kim Y', 'F', '2012-02-02', '0017 37 47 57', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1105, '3A-0542', NULL, NULL, 'ម៉ៅ ប៊ុនម៉េង', 'Mao Bunmeng', 'M', '2009-04-06', '0092 25 02 35', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1106, '3A-0788', NULL, NULL, 'អ៊ឹង ដាវីតា', 'Oeng Davita', 'F', '2010-05-21', '0010 47 17 77', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1107, '3A-0697', NULL, NULL, 'ហាន គីមលាភ', 'Han Kimleap', 'F', '2010-09-13', '0012 95 04 16', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1108, '3A-0689', NULL, NULL, 'ឃីម លីលាងឆាយ', 'Khimly Leang Chhay', 'M', '2010-01-10', '0097 66 777 99', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1109, '3A-0584', NULL, NULL, 'ស៊ីនឿន សុវណ្ណរស្មី', 'Sinoeurn SovannReaksmey', 'F', '2010-07-06', '0012 64 14 90', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1110, '3A-0527', NULL, NULL, 'តែ សុផាលីប៉', 'Te Sophalipor', 'F', '2011-05-25', '0012 66 94 28', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1111, '3A-0953', NULL, NULL, 'ពឹង វេងគីម', 'Poeng Veng Kim', 'M', '2009-04-07', '0011 87 96 06', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1112, '3A-0567', NULL, NULL, 'ចាន់ ម៉េងហ៊ួរ', 'Chan Menghour', 'M', '2007-11-15', '0093 87 91 22', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1113, '3A-0828', NULL, NULL, 'ម៉ូ រិទ្ធិរាជ', 'Mo Rithyreach', 'M', '2009-05-13', '0012 28 51 17', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1114, '3A-0578', NULL, NULL, 'ពេជ្រ សិទ្ធិគុណ', 'Pich Sethikun', 'M', '2011-02-04', '0 017 711 700', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1115, '41', NULL, NULL, 'មាស ហ្វូមី', 'Meas Fumi', 'M', '2008-08-04', '0092 88 008', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1116, '3A-0929', NULL, NULL, 'ស៊ុន លីហៀង', 'Sun Lyheang', 'F', '2009-03-22', '0088 3333 970', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1117, '3A-0546', NULL, NULL, 'ធី សូលីន', 'Thy Solin', 'F', '2009-04-02', '0012 59 25 28', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1118, '3A-0704', NULL, NULL, 'កាន ចាន់រ៉ាយុទ្ទ', 'Kan Chanrayuth', 'M', '2008-02-12', '0092 29 09 92', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1119, '3A-0583', NULL, NULL, 'ឌី វរនោឧត្តម', 'Dy Voreaknorodam', 'M', '2008-06-25', '0012 96 54 05', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1120, '3A-0928', NULL, NULL, 'ម៉េង គីមឡាង', 'Meng Kimlang', 'F', '2008-02-11', '0088 3333 970', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1121, '3A-0662', NULL, NULL, 'លាង កិត្តិគុណ', 'Leang Kitikun', 'M', '2011-09-05', '0012 89 86 18', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1122, '3A-0899', NULL, NULL, 'ជា ស៊ីងឆាយ', 'Chea Sing Chhay', 'M', '2006-07-27', '0011 50 00 18', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1123, '3A-0686', NULL, NULL, 'ស៊ុន សុណាឋៈ', 'Sun Sonathak', 'M', '2010-04-13', '0092 91 69 76', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1124, '3A-0823', NULL, NULL, 'ជាពេជ្រ ដារ៉ានីន', 'Chea Pich Daranin', 'F', '2009-09-27', '0077 8888 22', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1125, '3A-0918', NULL, NULL, 'ជាវ ហ៊ាងចាយ', 'Cheav Heang Chay', 'M', '2006-08-17', '0092 98 98 93', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1126, '3A-0641', NULL, NULL, 'ប៉ោ គីមលី', 'Por Kimli', 'M', '2007-12-19', '0092 69 36 99', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1127, '3A-0850', NULL, NULL, 'សុគន្ទ កញ្ញាសុផានីត', 'Sokun Kanha Sophanith', 'F', '2008-07-10', '0092 19 99 00', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1128, '3A-0592', NULL, NULL, 'យិន ម៉ូនីតា', 'Yin Monita', 'F', '2008-05-14', '0092 84 33 23', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1129, '3A-0960', NULL, NULL, 'ស៊ីន យូប៊ីន', 'Shin Yoo Bin', 'F', '2010-03-16', '0060 57 09 24', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1130, '3A-0659', NULL, NULL, 'នឿន មាសថារី', 'Neoum Meas Thary', 'F', '2007-11-13', '0070 526 450', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1131, '3A-0580', NULL, NULL, 'ទី ជីងហាវ', 'Ty Chinghav', 'M', '2008-03-01', '0078 61 30 61', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1132, '3A-0590', NULL, NULL, 'វីរៈ រក្សា', 'Vireak Reaksa', 'F', '2009-04-21', '0088 42 68 127', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1133, '3A-1071', NULL, NULL, 'សារ៉ុម ច័ន្ទពេជ្រមណី', 'Sarom Chanpichmoney', 'M', '2007-01-08', '0012 95 21 42', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1135, '3A-1073', NULL, NULL, 'ញ៉ែម សុវណ្ណវេជ្ជរា', 'Nhem Sovanvichra', 'M', '2009-01-06', '0069 56 58 60', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1136, '3A-1074', NULL, NULL, 'ឃុន សុផានិត', 'Khon Sophaneth', 'M', '2009-10-14', '0098 86 55 00', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1137, '3A-1075', NULL, NULL, 'សៀន ជីងជីង', 'Sean Jing Jing', 'F', '2008-02-13', '0012 25 65 165', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1138, '3A-1077', NULL, NULL, 'ស៊្រុន ស៊ាវអ៊ីង', 'Srun Seav Ing', 'F', '2009-01-28', '0099 555 655', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1139, '3A-1078', NULL, NULL, 'ឆៃ ម៉ាទីន', 'Chhai Matin', 'M', '2008-10-09', '0017 54 5555', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1140, '3A-1079', NULL, NULL, 'ថុន ពុធសុភា', 'Thon Putsophea', 'F', '2008-02-27', '0077 618 718', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1141, '3A-0969', NULL, NULL, 'ប៉ុក ជិញយាន', 'Pok Ching Yean', 'M', '2008-04-06', '0 096 6666 767', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1142, '3A-1080', NULL, NULL, 'ខ្លឹង ស៊ីវហ្គិច', 'Khloeng Siv Guech', 'F', '2007-08-16', '0017 69 69 66', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1143, '3A-1128', NULL, NULL, 'ជិន សូនីតាណាលីស', 'Chin Sonitanalis', 'F', '2006-07-18', '0061 89 89 89', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1144, '3A-1153', NULL, NULL, 'យ៉ាំង ខារីន', 'Yaing Kharin', 'M', '2003-12-16', '0087 78 8000', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1145, '3A-0394', NULL, NULL, 'ជាង ស៊ូលី', 'Cheang Suly ', 'F', '2010-07-04', '0012 28 06 73', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1146, '3A-0393', NULL, NULL, 'សុខ ម៉េងផាត់', 'Sok Mengphat', 'M', '2010-09-24', '0012 54 17 42', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1147, '3A-0375', NULL, NULL, 'ហេង សុខលាភ', 'Heng Sokleap', 'M', '2010-01-01', '0017 88 17 27', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1148, '3A-1081', NULL, NULL, 'ភិ សុផលសុខជិង', 'Phi Sophal Sok Ching', 'F', '2011-06-04', '0012 93 84 89', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1149, '3A-0292', NULL, NULL, 'កែវ វីយ៉ាលីង', 'Keo Yyyaling', 'F', '2009-02-05', '0012 36 96 36', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1150, '3A-0008', NULL, NULL, 'ហុង ស៊ីដេរ៉ាក់', 'Hong Syderak', 'M', '2008-07-28', '0092 193 597', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1151, '3A-0713', NULL, NULL, 'រិទ្ធថា ចាន់លាង', 'Ritha Chanleang', 'M', '2008-06-16', '0092 8888 43', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1152, '3A-0758', NULL, NULL, 'បូរ សុខាដេវិន', 'Bo Sokhadevin', 'F', '2006-11-28', '0012 51 86 15', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1153, '3A-0396', NULL, NULL, 'ចាង គីមលិ', 'Chang Kimlee', 'F', '2010-11-05', '0093 26 6667', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1154, '3A-0363', NULL, NULL, 'ស៊ី មិនគុយ', 'Sy Min Kuy', 'M', '2010-08-09', '0016 656 507', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1155, '3A-0428', NULL, NULL, 'រ៉ា លីម៉េង', 'Ra Lymeng', 'M', '2010-05-19', '0097 94 67 944', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1156, '3A-0308', NULL, NULL, 'ឆាយា អ៊ីលីសា', 'Chhaya Elisa', 'F', '2010-06-14', '0096 666 37 88', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1157, '3A-0391', NULL, NULL, 'លឹមឡេង យ៉ុង', 'Limleng Yong ', 'M', '2011-01-11', '0012 898 828', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1158, '3A-0034', NULL, NULL, 'សុន កែវរស្មីពេជ្រ', 'Son Keoreaksmey Pich', 'F', '2007-12-02', '0093 998 993', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1159, '3A-0042', NULL, NULL, 'ពេជ្រ រដ្ឋាបញ្ញាសិទ្ធិ', 'Pich Ratha Panhasith', 'M', '2008-01-21', '0 017 711 700', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1160, '3A-0469', NULL, NULL, 'អាន​ ច័ន្ទសុពណ្ណា', 'Anchan Soporna', 'F', '2010-12-13', '0017 29 23 67', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1161, '3A-1164', NULL, NULL, 'ភូ សុវណ្ណលីប៉ាវ', 'Phou Sovann Lypao', 'M', '2008-01-11', '0012 9999 81', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1162, '3A-0447', NULL, NULL, 'លី កាំងម៉េង', 'Ly Kang Meng', 'M', '2006-01-02', '0095 44 27 47', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1163, '3A-0520', NULL, NULL, 'វណ្ណៈ សុវណ្ណឈីត', 'Vannak Sovan Chhit', 'M', '2007-01-02', '0093 66 92 25 ', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1164, '3A-0030', NULL, NULL, 'ប៉ូ រចនាពេជ្រ', 'Po Rachana Pich', 'F', '2008-01-22', '0077 83 02 88', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1165, '3A-0068', NULL, NULL, 'ងួន គីមឈុន', 'Ngoun  Kimchhun', 'M', '2005-07-13', '0092 51 96 96', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1166, '3A-0415', NULL, NULL, 'ឡ គឹមប៉', 'Lor Kimpor', 'M', '2009-12-18', '0097 222 00 47', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1167, '3A-0794', NULL, NULL, 'ចាន់ ជីងឈីវ', 'Chan Ching Chhiv', 'M', '2006-09-07', '0012 44 05 58', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1168, '3A-0523', NULL, NULL, 'គង់ ជូលី', 'Kong Julie', 'F', '2007-06-12', '0078 99 09 62', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1169, '3A-0031', NULL, NULL, 'សម្បត្តិ ច័ន្ទលីដា', 'Sambath Chan Lida', 'F', '2008-11-30', '0012 352 265', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1170, '3A-0936', NULL, NULL, 'មុំ នីកូ', 'Mom Nico', 'F', '2008-08-24', '0012 969 535', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1171, '3A-0470', NULL, NULL, 'ហុង សូលីដា', 'Hong Solida', 'F', '2008-11-09', '0095 562 492', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1172, '3A-0006', NULL, NULL, 'ហេង ណាហ្គា', 'Heng Naga', 'M', '2008-02-02', '0012 78 3333', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1173, '3A-0526', NULL, NULL, 'ឈាង បុញ្ញបុត្រ', 'Chheang Bonhborth', 'M', '2010-12-29', '0012 64 19 79', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1174, '3A-0044', NULL, NULL, 'សេង គឹមស័ង', 'Seng Kimsorng', 'M', '2008-09-07', '0011 900 641', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1175, '3A-0399', NULL, NULL, 'ជាង សុវណ្ណម៉ូលីកា', 'Cheang Soven Molika', 'F', '2008-03-23', '0012 64 14 90', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1176, '3A-0756', NULL, NULL, 'សុខ មុនីរក្សា', 'Sok Mony Reaksa', 'F', '2008-10-14', '0089 81 68 68', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1177, '3A-0334', NULL, NULL, 'ឯក ស៊ាវហន់', 'Ek Sivhorn ', 'F', '2009-08-12', '0092 666 007', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1178, '3A-0416', NULL, NULL, 'ទី សុមេធា', 'Ty Sumetea', 'M', '2009-12-21', '0086 50 00 63', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1179, '3A-0036', NULL, NULL, 'អ៊ុន លឹមតុង', 'Un Limtong', 'M', '2009-08-25', '0092 212 210', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1180, '3A-0593', NULL, NULL, 'សុង ឡាយហ្វុង', 'Song LayFong', 'M', '2009-02-07', '0012 86 47 27', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1181, '3A-0471', NULL, NULL, 'សេដ្ឋា ធីរ៉ាវត្តី', 'Setha Thyra Vatey', 'F', '2010-11-03', '0012 801 820', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1182, '3A-1125', NULL, NULL, 'គង់ ស៊ូអ៊ីន', 'Kong SooIn', 'F', '2009-08-28', '0088 59 56 967', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1183, '3A-0724', NULL, NULL, 'ទូច ខាយស៊ីង', 'Toch Kaysing', 'M', '2009-02-20', '0089 85 58 87', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1184, '3A-1083', NULL, NULL, 'ហ៊ូ វឌ្ឍនៈវិភូ', 'Hou  Vathanakvihou', 'M', '2008-08-12', '0017 93 69 36', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1185, '3A-1084', NULL, NULL, 'ទៀ គុយឆាយ', 'Tea Kuychhay', 'M', '2007-12-28', '0099 26 9999', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1186, '3A-1087', NULL, NULL, 'ជាង គឹមចាង', 'Cheang Kim Chang', 'M', '2007-07-05', '0 070 700 202', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1187, '3A-0598', NULL, NULL, 'ហេង ម៉ូលីណា', 'Heng Molina', 'F', '2009-01-16', '0077 98 33 34', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1188, '3A-0422', NULL, NULL, 'ហ៊ី លុច', 'Hy Loch', 'M', '2009-10-03', '0012 64 24 18', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1189, '3A-0927', NULL, NULL, 'អ៊ិន សារីរិនសាវ៉ាត់យុត្ត', 'Insayrin Savathyuth', 'M', '2006-01-21', '0069 777 523', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1190, '3A-0843', NULL, NULL, 'ឃន ណរ៉ុងពីយ៉ានុត', 'Khon Narong Piyanuth', 'F', '2008-12-12', '0 012 53 00 66', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1191, '3A-0829', NULL, NULL, 'ម៉ូ ឧត្តមពន្លឺ', 'Mo Odampunleu', 'M', '2006-05-11', '0 012 79 79 34', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1192, '3A-0418', NULL, NULL, 'មុយ ម៉ារារក្សា', 'Muy Marareksa', 'M', '2010-07-10', '0092 43 72 72', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1193, '3A-0921', NULL, NULL, 'អ៊ុក ចាន់រដ្ឋា', 'Ouk Chanratha', 'F', '2003-11-11', '0 085 59 50 55', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1194, '3A-0600', NULL, NULL, 'អ៊ុក ច័ន្ទលីដា', 'Ouck Chanlida', 'F', '2008-10-20', '0077 98 33 34', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1195, '3A-0290', NULL, NULL, 'ភួង ពេជ្រចូលី', 'Phuong Pich Jolie', 'F', '2010-01-26', '0077 999 216', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1196, '3A-0505', NULL, NULL, 'រ៉េម ចានបញ្ញាវុឌ្ឍ', 'Rem Chan Panhavuth', 'M', '2010-11-29', '0017 717 117', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1197, '3A-0403', NULL, NULL, 'រិទ្ធ ច័ន្ទម៉ីលីញ', 'Rith Chan Meylinh', 'F', '2010-02-16', '0012 53 06 95', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1198, '3A-0925', NULL, NULL, 'ម៉េង រដ្ឋទិកា', 'Meng Rath Tika', 'F', '2006-04-20', '0086 935 143', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1199, '3A-0602', NULL, NULL, 'សិន សេងឆាយ', 'Sin Seng Chhay', 'M', '2010-02-01', '0012 43 78 37', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1200, '3A-0511', NULL, NULL, 'តាល់ សុភារីជែល', 'Tal Sophearigel', 'M', '2011-04-26', '0 012 45 33 61', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:12', '2020-05-12 00:45:12', 0, 1, 1, 1),
(1201, '3A-0367', NULL, NULL, 'ទៀ សុមេត្តា', 'Tiev Someta', 'F', '2010-06-18', '0012 8000 63', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1202, '3A-1088', NULL, NULL, 'ណាត់ថៈណាន់ វង្សយ៉ារ៉ា', 'NathananWongyara', 'M', '2009-08-23', '0077 871 906', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1203, '3A-1089', NULL, NULL, 'ស៊ីវ ស៊ីង', 'Siv Sing', 'M', '2008-12-04', '0077 97 91 92', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1204, '3A-1144', NULL, NULL, 'លី វ៉ាន់ សុធារ៉ូ', 'Ly Vansothiro', 'M', '2010-05-21', '0012 644 497', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1205, '3A-0328', NULL, NULL, 'សឺន មុន្នីលាភហេង', 'Seun Mony Leapheng', 'M', '2007-02-18', '0 012 582 372 ', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1206, '3A-0417', NULL, NULL, 'ប៉ែន រីហាន់ណា', 'Ben Rihana', 'F', '2007-05-20', '0010 68 41 86', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1207, '3A-0449', NULL, NULL, 'ស៊ុយ ហ្សាផកា', 'Suy Saphaka', 'F', '2007-08-09', '0 012 600 905', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1208, '3A-0552', NULL, NULL, 'ភើយ សុភី', 'Pheuy Sophy', 'M', '2007-02-15', '0088 9999 407', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1209, '3A-0959', NULL, NULL, 'ពឹង វេងឈៀង', 'Poeng Vengchheang', 'M', '2006-12-10', '0061 56 52 89', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1210, '3A-0371', NULL, NULL, 'ម៉ៅ សុជាតា', 'Mao Socheata', 'F', '2004-08-11', '0092 505 573', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1211, '3A-0335', NULL, NULL, 'ទៀ កាឆីន', 'Tea Kachhin', 'M', '2007-06-18', '0095 500 889', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1212, '3A-1094', NULL, NULL, 'រ័ត្ន អាន្នាម៉ូរី', 'Roath Annamory', 'F', '2008-08-08', '0092 85 7777', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1213, '3A-1132', NULL, NULL, 'បេន អ៊ាបណាំហុង', 'Ben Eap NamHong', 'M', '2005-01-16', '0017 65 96 06', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1214, '3A-0296', NULL, NULL, 'ឡាយ ជាលិញ', 'Lay Chealinh', 'F', '2008-06-29', '0012 45 20 45', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1215, '3A-0676', NULL, NULL, 'អ៊ិន សារីរិនថាក់យ៉ាណាត់', 'In Saryrinthak Yanatt', 'F', '2007-09-05', '0069 777 523', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1216, '3A-0065', NULL, NULL, 'យិប ណាលីហ្សា', 'Yib Nalyza', 'F', '2009-01-04', '0092 59 89 87', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1217, '3A-0760', NULL, NULL, 'បូរ សុខាដេវ៉ា', 'Bo Sokhadeva', 'F', '2006-11-28', '0012 51 86 15', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1218, '3A-0064', NULL, NULL, 'វុទ្ធី សុថាលីហ្សា', 'Vuthy Sothaliza', 'F', '2008-10-02', '0061 61 61 69', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1219, '3A-0605', NULL, NULL, 'ហាំង យូអ៊ី', 'Haing You E', 'F', '2009-12-22', '0012 746 588', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1220, '3A-1095', NULL, NULL, 'ប៉ូច សុជាតា', 'Poch Socheata', 'F', '2008-03-02', '0093 79 17 77', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1221, '3A-0730', NULL, NULL, 'អ៊ុច ខេតសាណា', 'Ouch Kate Sana', 'F', '2010-05-26', '0012 609 650', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1222, '3A-1096', NULL, NULL, 'ឡុង ឈៀងហួរ', 'Long Chheanghour', 'M', '2008-07-29', '0012 54 39 11', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1223, '3A-0056', NULL, NULL, 'ម៉ែន បូរ៉ាមុនីនាថ', 'Men Boramoneeneat', 'F', '2008-12-09', '0095 800 600', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1224, '3A-0062', NULL, NULL, 'តាន់ លីម៉ីញ', 'Tann Lyming', 'M', '2009-11-13', '0076 85 555 38', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1225, '3A-0058', NULL, NULL, 'សល់ ស៊ុនហ៊ាង', 'Sal Son Heang', 'M', '2007-02-12', '0012 965 396', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1226, '3A-0877', NULL, NULL, 'សេង អេននីតា', 'Seng Ahnita', 'F', '2008-03-20', '0061 91 2222', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1227, '3A-1097', NULL, NULL, 'ជា​ នរបញ្ញា', 'Chea Noreakpanha', 'M', '2010-01-10', '0012 95 01 98', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1228, '3A-0754', NULL, NULL, NULL, 'Phil Arthur Nierras', 'M', '2009-10-27', '0096 26 23 006', 'ហ្វីលីពីន', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1229, '3A-0804', NULL, NULL, 'យ៉ូវ ម៉ីហ្វាង', 'You MeyFang', 'F', '2007-06-04', '0012 88 22 45', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1230, '3A-0830', NULL, NULL, 'ប្រាក់ សិរីមាន', 'Prak Serey Mean', 'F', '2005-12-24', '0012 96 84 78', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1231, '3A-0875', NULL, NULL, 'ជុត ចាន់ឧត្តម', 'Chut Chanoudom', 'M', '2004-07-28', '0097 97 777 57', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1232, '3A-1135', NULL, NULL, 'ហាប់ វណ្ណលីហូវ', 'Hab Vanlyhov', 'M', '2006-12-10', '0086 65 33 77', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1233, '3A-1136', NULL, NULL, 'ប្រាង្គ សីហៈ', 'Prang Seyhak', 'M', '2008-10-10', '0012 82 69 87', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1234, '3A-0310', NULL, NULL, 'ចៅ ឆយឹង', 'Chao Chhor Yeong', 'F', '2005-06-17', '0092 92 55 44', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1235, '3A-1099', NULL, NULL, 'អេង ធឹងទីទី', 'Eng Thoeung TyTy', 'M', '2004-05-04', '0012 355 557', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1236, '3A-1100', NULL, NULL, 'ឡាយ ឡាលីន', 'Lay Lalin', 'F', '2008-09-10', '0081 99 88 65', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1237, '3A-0053', NULL, NULL, 'ហេង ឈុន្នី', 'Heng Chhunny', 'F', '2008-06-08', '0012 965 396', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1238, '3A-0917', NULL, NULL, 'គង់ ឈិនហូវ', 'Kong Chhin Hav', 'M', '2009-04-27', '0016 23 76 66', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1239, '3A-0423', NULL, NULL, 'វង្ស សិរីណៃហេង', 'Vong Serinaiheng', 'M', '2006-02-07', '0012 597 144', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1240, '3A-0419', NULL, NULL, 'ជាង ចុងចុង', 'Cheang Chong Chong', 'M', '2005-08-18', '0089 98 77 65', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1241, '3A-0564', NULL, NULL, 'ឃាង លីជីង', 'Kheang Lyjing', 'F', '2007-05-02', '0078 92 22 65', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1);
INSERT INTO `student` (`id`, `student_id`, `student_id_ac`, `student_id_fla`, `kh_name`, `en_name`, `sex`, `dob`, `phone_student`, `national`, `village_pob`, `commue_pob`, `district_pob`, `province_pob`, `village_current`, `commue_current`, `district_current`, `province_current`, `old_grade`, `old_school`, `old_en_grade`, `farther_name`, `mother_name`, `farther_job`, `mother_job`, `national_far`, `national_mother`, `phone_farther`, `address_farther`, `address_mother`, `created_at`, `updated_at`, `deleted`, `campus_id`, `status`, `type_student`) VALUES
(1242, '3A-0755', NULL, NULL, 'សុខ មុនី្នរត្ន័', 'Sok Monirath', 'F', '2007-03-18', '0012 62 62 71', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1243, '3A-0073', NULL, NULL, 'ឡាំ ម៉ាឡាវី', 'Lam Malavy', 'F', '2006-11-22', '0095 45 07 07', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1244, '3A-0079', NULL, NULL, 'ម៉ឹង អៀមសេង', 'Moueng Eimseng', 'M', '2004-06-01', '0010 62 22 26', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1245, '3A-0082', NULL, NULL, 'សាន វីរៈបុត្រ', 'San Vireak both', 'M', '2007-10-07', '0092 89 9999', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1246, '3A-0746', NULL, NULL, 'លី ឈុនហួន', 'Ly Chhun Houn', 'M', '2006-08-28', '0077 83 22 81', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1247, '3A-0051', NULL, NULL, 'អ៊ា ស៊ីវអ៊ីង', 'Ear Seav Ing', 'F', '2008-10-30', '0092 80 7777', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1248, '3A-0350', NULL, NULL, 'ថេង សុធារិទ្ធ', 'Theng Sothearith', 'M', '2004-05-26', '0012 42 38 90', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1249, '3A-0735', NULL, NULL, 'សុគុណ ឆាយសាយលី', 'Sokun Chhay Sayly', 'M', '2005-08-24', '0015 718 885', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1250, '3A-1137', NULL, NULL, 'គុន ច័ន្ទម៉ូលីកា', 'Kun Chan Molica', 'F', '2004-10-25', '0012 45 40 46', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1251, '3A-0563', NULL, NULL, 'កាំង វួចហ័ង', 'Kaing Vouch Horng', 'F', '2007-01-30', '0017 82 37 77', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1252, '3A-0091', NULL, NULL, 'សុគុណ ស្រីពេជ្រ', 'Sokun Sreypech', 'F', '2006-07-19', '0012 87 33 86', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1253, '3A-0315', NULL, NULL, 'ហាក់ ស្រីនូ', 'Hak SreyNou', 'F', '2006-02-07', '0017 46 46 31', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1254, '3A-0101', NULL, NULL, 'ស៊ីវ៉ន រតនៈភួង', 'Sivon Rattanak Phuong', 'F', '2008-05-24', '0089 999 585', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1255, '3A-0098', NULL, NULL, 'ភន យ៉ាណារតន៍', 'Phon Yanaroth', 'F', '2008-09-25', '0078 999 797', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1256, '3A-0097', NULL, NULL, 'ឡូវ ជីងស៊ីង', 'Lov Jing Sing', 'F', '2008-05-29', '0012 352 567', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1257, '3A-0614', NULL, NULL, 'ឆុន ឆាយច័ន្ទវិបុល', 'Chhon Chhay Chan Vibol', 'M', '2006-07-24', '0012 76 32 85', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1258, '3A-0773', NULL, NULL, 'អាត អ៊ីជូ', 'Art Eju', 'F', '2008-10-28', '0017 993 442', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1259, '3A-0420', NULL, NULL, 'មួយ ម៉ារ៉ាពិទូ', 'Muy Mara Pitou', 'M', '2001-10-27', '0092 662 667', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1260, '3A-1158', NULL, NULL, 'សេង សុផល', 'Seng Sophal ', 'M', '2005-02-13', '0097 83 83 933', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1261, '3A-0853', NULL, NULL, 'ឈុន ហុកឆេង', 'Chhun Hokchheng', 'M', '2005-09-17', '0012 56 52 41', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1262, '3A-1105', NULL, NULL, 'រឿម វីរៈ', 'Roeum Vireak', 'M', '2008-03-20', '0099 586 106', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1263, '3A-1107', NULL, NULL, 'គីង ឃែរី', 'King Kerry ', 'F', '2005-02-01', '0061​ 507 777', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1264, '3A-0739', NULL, NULL, 'ថុក សុបុណ្ណារី', 'Thok Sobonnary', 'F', '2006-09-21', '0017 216 016', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1265, '3A-0092', NULL, NULL, 'ហម មុនីពូទីន', 'Horm Muny Putin', 'M', '2004-07-19', '0012 62 59 38', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1266, '3A-0093', NULL, NULL, 'ហម សុភារីតា', 'Horm Sopherita', 'F', '2004-07-19', '0012 62 59 38', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1267, '3A-0625', NULL, NULL, 'ចាន់ ជីងស៊ាង', 'Chan Ching seang', 'F', '2003-09-29', '0093 31 56 57', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1268, '3A-0109', NULL, NULL, 'ស មិញស៊ឺ', 'Sor Minh Seu', 'M', '2005-12-24', '0012 53 00 32', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1269, '3A-0884', NULL, NULL, 'ញ៉ែម ស្រីហ៊ន', 'Nhem Sreyhoun', 'F', '2006-09-27', '0095 33 03 35', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1270, '3A-1112', NULL, NULL, 'សិដ្ឋ សុភាទេវី', 'Seth Sopheatevi', 'F', '2004-05-07', '0077 848 086 ', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1271, '3A-1145', NULL, NULL, 'ច័ន្ទ តារាមកត់', 'Chan DaraMorokot', 'F', '2004-02-12', '0092 968 040', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1272, '3A-0747', NULL, NULL, 'លី ឈុនឡុង', 'Ly Chhun Long', 'M', '2003-10-10', '0012 284 511', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1273, '3A-0139', NULL, NULL, 'លឹម មួយចេង', 'Lim Mouy Cheng', 'F', '2005-06-19', '0012 69 97 99', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1274, '3A-0507', NULL, NULL, 'ប៊ន់ មីលិញ', 'Bun Meylinh', 'F', '2006-09-19', '0012 26 95 96', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1275, '3A-0699', NULL, NULL, 'ឌៀប ប៉លី', 'Diep Poly', 'F', '2006-08-13', '0017 39 58 58', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1276, '3A-0753', NULL, NULL, NULL, 'Angela Nierras', 'F', '2006-09-07', '0096 26 23 006', 'ហ្វីលីពីន', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1277, '3A-0332', NULL, NULL, NULL, 'Nguyen Melle', 'F', '2000-12-28', '0012 71 81 97', 'វៀតណាម', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1278, '3A-0147', NULL, NULL, 'សាន សិរីទេពី', 'San Sereytepy', 'F', '2005-06-01', '0092 899 999', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1279, '3A-0121', NULL, NULL, 'ម៉ែន សូដាលីសា', 'Men Sodaliza', 'F', '2007-04-28', '0012 336 228', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1280, '3A-0129', NULL, NULL, 'ស៊ុន សុវណ្ណច័ន្ទរ៉ាយុទ្ធ', 'Sun Sovan Chanrayuth', 'M', '2005-02-25', '0078 71 24 24', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1281, '3A-0106', NULL, NULL, 'វ៉ាតវិរៈ សេដ្ឋមុនីន្ទ', 'Vatvirak Sedhamonint', 'F', '2007-12-27', '0016 94 80 80', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1282, '3A-1113', NULL, NULL, 'ឈៀត ឡៃហ្វុង', 'Cheat Laifong', 'M', '2005-03-03', '0092 78 53 57', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1283, '3A-1140', NULL, NULL, 'ជុង សុវិនជីង', 'Chang Sovinching', 'F', '2005-07-25', '0015 873 456', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1284, '3A-1149', NULL, NULL, 'ក្លឹង ម៉ូលី្លកា', 'Kloeng Molika', 'F', '2005-11-26', '0092 222 116', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1285, '3A-1155', NULL, NULL, 'រ៉ូ ពិសី', 'Ro Pisey', 'F', '2005-02-14', '0012 82 33 21', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1286, '3A-1142', NULL, NULL, 'គង់ ទេពពិរ៉ូ', 'Kong Tepiroo', 'M', '2004-08-26', '0088 59 56 967', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1287, '3A-1148', NULL, NULL, 'សុវណ្ណ វរនីត', 'Sovan Vornith', 'F', '2006-02-22', '0012 55 31 37', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1288, '3A-1150', NULL, NULL, 'ដែង សុគន្ធធីតា', 'Deng Sokunthida', 'F', '2002-10-05', '0093 54 62 54', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1289, '3A-1177 ', NULL, NULL, 'យ៉ូ​ សិប', 'Yo Sep', 'M', '2010-05-21', '0012 64 36 72', 'កូរ៉េ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1290, '3A-0208', NULL, NULL, 'ហេង លីហ្សា', 'Heng Lyza', 'M', '2004-02-22', '0099 99 53 99', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-12 00:45:13', '2020-05-12 00:45:13', 0, 1, 1, 1),
(1295, '001440', NULL, NULL, 'អិន បញ្ញា', 'An Panha', 'M', '2017-07-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1),
(1296, '005755', NULL, NULL, 'សុវណ្ណថាន ដាវីដ', 'Davith Sovanthanak', 'M', '2020-11-04', '012589642', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 00:48:24', '2020-11-04 00:48:24', 0, 1, 1, 1),
(1297, '005686', NULL, NULL, 'សម្បត្តិ ម៉ាលីវា', 'Sambath Malizaiva', 'M', '2020-11-02', '0124785698', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 00:49:08', '2020-11-04 00:49:08', 0, 1, 1, 1),
(1298, '0005887', NULL, NULL, 'ពុធ សីហាក់', 'Seyhak Puthpoun', 'M', '2020-11-26', '0978854102', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 00:49:56', '2020-11-04 00:49:56', 0, 1, 1, 1),
(1299, '0228931', NULL, NULL, 'សៀង ណាំ', 'Sieng Nam', 'M', '2020-11-04', '01247856', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 00:50:19', '2020-11-04 00:50:19', 0, 1, 1, 1),
(1300, '008/887', NULL, NULL, 'សុីម ដានីត', 'Sim Danet', 'M', '2020-11-04', '012589966', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 00:50:59', '2020-11-04 00:50:59', 0, 1, 1, 1),
(1301, '025899', NULL, NULL, 'ថល រាវីដាវីដ', 'Thol Ravydavid', 'M', '2020-11-04', '012589896', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 00:51:31', '2020-11-04 00:51:31', 0, 1, 1, 1),
(1302, '0008578', NULL, NULL, 'ឈុន មេឃាលា', 'Chhorn Mekhala', 'M', '2020-09-01', '096778899', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 01:28:00', '2020-11-04 01:28:00', 0, 1, 1, 1),
(1303, '0008978', NULL, NULL, 'ណាន វិរនូរាន', 'Neourn Vireaknoran', 'M', '2020-11-04', '012589658', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 01:36:37', '2020-11-04 01:36:37', 0, 1, 1, 1),
(1304, '022882', NULL, NULL, 'ណាន វិរនូរីន', 'Neourn Vireaknorin', 'M', '2020-11-04', '01258965', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 01:37:12', '2020-11-04 01:37:12', 0, 1, 1, 1),
(1305, '0089789', NULL, NULL, 'ណាន រក្សា', 'Nan Reaksa', 'M', '2020-11-04', '012896587', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 02:16:52', '2020-11-04 02:16:52', 0, 1, 1, 1),
(1306, '0005878', NULL, NULL, 'រិន សុខហៃ', 'Ren Sok Hay', 'M', '2020-10-06', '063999888', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 02:39:29', '2020-11-04 02:39:29', 0, 1, 1, 1),
(1307, '0005789', NULL, NULL, 'បង តុងធាន', 'Bong Tong Thean', 'M', '2020-11-04', '012478569', 'ខ្មែរ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ខ្មែរ', 'ខ្មែរ', NULL, NULL, NULL, '2020-11-04 02:45:27', '2020-11-04 02:45:27', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_class`
--

CREATE TABLE `student_class` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_class`
--

INSERT INTO `student_class` (`id`, `student_id`, `class_id`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 859, 1, 0, NULL, NULL),
(2, 833, 1, 0, NULL, NULL),
(3, 844, 1, 0, NULL, NULL),
(4, 849, 1, 0, NULL, NULL),
(5, 851, 1, 0, NULL, NULL),
(6, 836, 1, 0, NULL, NULL),
(7, 841, 1, 0, NULL, NULL),
(8, 837, 1, 0, NULL, NULL),
(9, 846, 1, 0, NULL, NULL),
(10, 838, 1, 0, NULL, NULL),
(11, 843, 1, 0, NULL, NULL),
(12, 850, 1, 0, NULL, NULL),
(13, 834, 1, 0, NULL, NULL),
(14, 840, 1, 0, NULL, NULL),
(15, 845, 1, 0, NULL, NULL),
(16, 835, 1, 0, NULL, NULL),
(17, 848, 1, 0, NULL, NULL),
(18, 842, 1, 0, NULL, NULL),
(19, 847, 1, 0, NULL, NULL),
(20, 852, 1, 0, NULL, NULL),
(22, 854, 1, 0, NULL, NULL),
(23, 855, 1, 0, NULL, NULL),
(24, 856, 1, 0, NULL, NULL),
(25, 857, 1, 0, NULL, NULL),
(26, 858, 1, 0, NULL, NULL),
(27, 839, 1, 0, NULL, NULL),
(28, 887, 2, 0, NULL, NULL),
(29, 872, 2, 0, NULL, NULL),
(30, 882, 2, 0, NULL, NULL),
(31, 862, 2, 0, NULL, NULL),
(32, 871, 2, 0, NULL, NULL),
(33, 883, 2, 0, NULL, NULL),
(34, 869, 2, 0, NULL, NULL),
(35, 873, 2, 0, NULL, NULL),
(36, 861, 2, 0, NULL, NULL),
(37, 878, 2, 0, NULL, NULL),
(38, 880, 2, 0, NULL, NULL),
(39, 877, 2, 0, NULL, NULL),
(40, 881, 2, 0, NULL, NULL),
(41, 875, 2, 0, NULL, NULL),
(42, 884, 2, 0, NULL, NULL),
(43, 865, 2, 0, NULL, NULL),
(44, 866, 2, 0, NULL, NULL),
(45, 870, 2, 0, NULL, NULL),
(46, 864, 2, 0, NULL, NULL),
(47, 860, 2, 0, NULL, NULL),
(48, 874, 2, 0, NULL, NULL),
(49, 863, 2, 0, NULL, NULL),
(50, 867, 2, 0, NULL, NULL),
(51, 868, 2, 0, NULL, NULL),
(52, 879, 2, 0, NULL, NULL),
(53, 876, 2, 0, NULL, NULL),
(54, 886, 2, 0, NULL, NULL),
(55, 885, 2, 0, NULL, NULL),
(56, 911, 3, 0, NULL, NULL),
(57, 899, 3, 0, NULL, NULL),
(58, 906, 3, 0, NULL, NULL),
(59, 907, 3, 0, NULL, NULL),
(60, 908, 3, 0, NULL, NULL),
(61, 893, 3, 0, NULL, NULL),
(62, 902, 3, 0, NULL, NULL),
(63, 888, 3, 0, NULL, NULL),
(64, 894, 3, 0, NULL, NULL),
(65, 903, 3, 0, NULL, NULL),
(66, 910, 3, 0, NULL, NULL),
(67, 901, 3, 0, NULL, NULL),
(68, 909, 3, 0, NULL, NULL),
(69, 896, 3, 0, NULL, NULL),
(70, 898, 3, 0, NULL, NULL),
(71, 891, 3, 0, NULL, NULL),
(72, 889, 3, 0, NULL, NULL),
(73, 890, 3, 0, NULL, NULL),
(74, 895, 3, 0, NULL, NULL),
(75, 897, 3, 0, NULL, NULL),
(76, 892, 3, 0, NULL, NULL),
(77, 900, 3, 0, NULL, NULL),
(78, 905, 3, 0, NULL, NULL),
(79, 904, 3, 0, NULL, NULL),
(80, 933, 4, 0, NULL, NULL),
(81, 930, 4, 0, NULL, NULL),
(82, 924, 4, 0, NULL, NULL),
(83, 915, 4, 0, NULL, NULL),
(84, 921, 4, 0, NULL, NULL),
(85, 913, 4, 0, NULL, NULL),
(86, 929, 4, 0, NULL, NULL),
(87, 926, 4, 0, NULL, NULL),
(88, 922, 4, 0, NULL, NULL),
(89, 923, 4, 0, NULL, NULL),
(90, 919, 4, 0, NULL, NULL),
(91, 918, 4, 0, NULL, NULL),
(92, 928, 4, 0, NULL, NULL),
(93, 917, 4, 0, NULL, NULL),
(94, 927, 4, 0, NULL, NULL),
(95, 914, 4, 0, NULL, NULL),
(96, 920, 4, 0, NULL, NULL),
(97, 912, 4, 0, NULL, NULL),
(98, 925, 4, 0, NULL, NULL),
(99, 916, 4, 0, NULL, NULL),
(100, 931, 4, 0, NULL, NULL),
(101, 932, 4, 0, NULL, NULL),
(127, 775, 5, 0, NULL, NULL),
(128, 763, 5, 0, NULL, NULL),
(129, 766, 5, 0, NULL, NULL),
(130, 770, 5, 0, NULL, NULL),
(131, 759, 5, 0, NULL, NULL),
(132, 755, 5, 0, NULL, NULL),
(133, 754, 5, 0, NULL, NULL),
(134, 771, 5, 0, NULL, NULL),
(135, 768, 5, 0, NULL, NULL),
(136, 760, 5, 0, NULL, NULL),
(137, 761, 5, 0, NULL, NULL),
(138, 767, 5, 0, NULL, NULL),
(139, 762, 5, 0, NULL, NULL),
(140, 769, 5, 0, NULL, NULL),
(141, 749, 5, 0, NULL, NULL),
(142, 758, 5, 0, NULL, NULL),
(143, 748, 5, 0, NULL, NULL),
(144, 764, 5, 0, NULL, NULL),
(145, 756, 5, 0, NULL, NULL),
(146, 765, 5, 0, NULL, NULL),
(147, 752, 5, 0, NULL, NULL),
(148, 751, 5, 0, NULL, NULL),
(149, 757, 5, 0, NULL, NULL),
(150, 753, 5, 0, NULL, NULL),
(151, 750, 5, 0, NULL, NULL),
(152, 772, 5, 0, NULL, NULL),
(153, 773, 5, 0, NULL, NULL),
(154, 774, 5, 0, NULL, NULL),
(155, 747, 5, 0, NULL, NULL),
(156, 800, 6, 0, NULL, NULL),
(157, 781, 6, 0, NULL, NULL),
(158, 789, 6, 0, NULL, NULL),
(159, 796, 6, 0, NULL, NULL),
(160, 778, 6, 0, NULL, NULL),
(161, 794, 6, 0, NULL, NULL),
(162, 799, 6, 0, NULL, NULL),
(163, 793, 6, 0, NULL, NULL),
(164, 782, 6, 0, NULL, NULL),
(165, 784, 6, 0, NULL, NULL),
(166, 783, 6, 0, NULL, NULL),
(167, 792, 6, 0, NULL, NULL),
(168, 797, 6, 0, NULL, NULL),
(169, 795, 6, 0, NULL, NULL),
(170, 654, 6, 0, NULL, NULL),
(171, 779, 6, 0, NULL, NULL),
(172, 785, 6, 0, NULL, NULL),
(173, 788, 6, 0, NULL, NULL),
(174, 791, 6, 0, NULL, NULL),
(175, 780, 6, 0, NULL, NULL),
(176, 776, 6, 0, NULL, NULL),
(177, 798, 6, 0, NULL, NULL),
(178, 787, 6, 0, NULL, NULL),
(179, 786, 6, 0, NULL, NULL),
(180, 790, 6, 0, NULL, NULL),
(181, 777, 6, 0, NULL, NULL),
(182, 827, 7, 0, NULL, NULL),
(183, 816, 7, 0, NULL, NULL),
(184, 802, 7, 0, NULL, NULL),
(185, 813, 7, 0, NULL, NULL),
(186, 808, 7, 0, NULL, NULL),
(187, 806, 7, 0, NULL, NULL),
(188, 807, 7, 0, NULL, NULL),
(189, 814, 7, 0, NULL, NULL),
(190, 811, 7, 0, NULL, NULL),
(191, 818, 7, 0, NULL, NULL),
(192, 819, 7, 0, NULL, NULL),
(193, 824, 7, 0, NULL, NULL),
(194, 821, 7, 0, NULL, NULL),
(195, 801, 7, 0, NULL, NULL),
(196, 805, 7, 0, NULL, NULL),
(197, 815, 7, 0, NULL, NULL),
(198, 823, 7, 0, NULL, NULL),
(199, 803, 7, 0, NULL, NULL),
(200, 809, 7, 0, NULL, NULL),
(201, 812, 7, 0, NULL, NULL),
(202, 810, 7, 0, NULL, NULL),
(203, 820, 7, 0, NULL, NULL),
(204, 822, 7, 0, NULL, NULL),
(205, 817, 7, 0, NULL, NULL),
(206, 804, 7, 0, NULL, NULL),
(207, 826, 7, 0, NULL, NULL),
(208, 825, 7, 0, NULL, NULL),
(209, 683, 8, 0, NULL, NULL),
(210, 672, 8, 0, NULL, NULL),
(211, 653, 8, 0, NULL, NULL),
(212, 652, 8, 0, NULL, NULL),
(213, 665, 8, 0, NULL, NULL),
(214, 678, 8, 0, NULL, NULL),
(215, 673, 8, 0, NULL, NULL),
(216, 656, 8, 0, NULL, NULL),
(217, 671, 8, 0, NULL, NULL),
(218, 677, 8, 0, NULL, NULL),
(219, 664, 8, 0, NULL, NULL),
(220, 668, 8, 0, NULL, NULL),
(221, 676, 8, 0, NULL, NULL),
(222, 675, 8, 0, NULL, NULL),
(223, 674, 8, 0, NULL, NULL),
(224, 662, 8, 0, NULL, NULL),
(225, 666, 8, 0, NULL, NULL),
(226, 651, 8, 0, NULL, NULL),
(227, 659, 8, 0, NULL, NULL),
(228, 654, 8, 0, NULL, NULL),
(229, 679, 8, 0, NULL, NULL),
(230, 657, 8, 0, NULL, NULL),
(231, 667, 8, 0, NULL, NULL),
(232, 661, 8, 0, NULL, NULL),
(233, 670, 8, 0, NULL, NULL),
(234, 658, 8, 0, NULL, NULL),
(235, 655, 8, 0, NULL, NULL),
(236, 680, 8, 0, NULL, NULL),
(237, 660, 8, 0, NULL, NULL),
(238, 669, 8, 0, NULL, NULL),
(239, 681, 8, 0, NULL, NULL),
(240, 663, 8, 0, NULL, NULL),
(241, 682, 8, 0, NULL, NULL),
(242, 715, 9, 0, NULL, NULL),
(243, 714, 9, 0, NULL, NULL),
(244, 691, 9, 0, NULL, NULL),
(245, 701, 9, 0, NULL, NULL),
(246, 697, 9, 0, NULL, NULL),
(247, 704, 9, 0, NULL, NULL),
(248, 703, 9, 0, NULL, NULL),
(249, 689, 9, 0, NULL, NULL),
(250, 711, 9, 0, NULL, NULL),
(251, 695, 9, 0, NULL, NULL),
(252, 694, 9, 0, NULL, NULL),
(253, 705, 9, 0, NULL, NULL),
(254, 707, 9, 0, NULL, NULL),
(255, 688, 9, 0, NULL, NULL),
(256, 713, 9, 0, NULL, NULL),
(257, 693, 9, 0, NULL, NULL),
(258, 702, 9, 0, NULL, NULL),
(259, 699, 9, 0, NULL, NULL),
(260, 692, 9, 0, NULL, NULL),
(261, 687, 9, 0, NULL, NULL),
(262, 710, 9, 0, NULL, NULL),
(263, 708, 9, 0, NULL, NULL),
(264, 685, 9, 0, NULL, NULL),
(265, 698, 9, 0, NULL, NULL),
(266, 709, 9, 0, NULL, NULL),
(267, 700, 9, 0, NULL, NULL),
(268, 684, 9, 0, NULL, NULL),
(269, 686, 9, 0, NULL, NULL),
(270, 706, 9, 0, NULL, NULL),
(271, 690, 9, 0, NULL, NULL),
(272, 696, 9, 0, NULL, NULL),
(273, 712, 9, 0, NULL, NULL),
(274, 748, 10, 0, NULL, NULL),
(275, 739, 10, 0, NULL, NULL),
(276, 728, 10, 0, NULL, NULL),
(277, 718, 10, 0, NULL, NULL),
(278, 742, 10, 0, NULL, NULL),
(279, 733, 10, 0, NULL, NULL),
(280, 737, 10, 0, NULL, NULL),
(281, 724, 10, 0, NULL, NULL),
(282, 738, 10, 0, NULL, NULL),
(283, 736, 10, 0, NULL, NULL),
(284, 726, 10, 0, NULL, NULL),
(285, 740, 10, 0, NULL, NULL),
(286, 729, 10, 0, NULL, NULL),
(287, 732, 10, 0, NULL, NULL),
(288, 741, 10, 0, NULL, NULL),
(289, 722, 10, 0, NULL, NULL),
(290, 731, 10, 0, NULL, NULL),
(291, 721, 10, 0, NULL, NULL),
(292, 734, 10, 0, NULL, NULL),
(293, 730, 10, 0, NULL, NULL),
(294, 723, 10, 0, NULL, NULL),
(295, 725, 10, 0, NULL, NULL),
(296, 735, 10, 0, NULL, NULL),
(297, 743, 10, 0, NULL, NULL),
(298, 744, 10, 0, NULL, NULL),
(299, 720, 10, 0, NULL, NULL),
(300, 745, 10, 0, NULL, NULL),
(301, 746, 10, 0, NULL, NULL),
(302, 747, 10, 0, NULL, NULL),
(303, 719, 10, 0, NULL, NULL),
(304, 727, 10, 0, NULL, NULL),
(305, 595, 11, 0, NULL, NULL),
(306, 593, 11, 0, NULL, NULL),
(307, 574, 11, 0, NULL, NULL),
(308, 586, 11, 0, NULL, NULL),
(309, 592, 11, 0, NULL, NULL),
(310, 583, 11, 0, NULL, NULL),
(311, 584, 11, 0, NULL, NULL),
(312, 582, 11, 0, NULL, NULL),
(313, 588, 11, 0, NULL, NULL),
(314, 580, 11, 0, NULL, NULL),
(315, 590, 11, 0, NULL, NULL),
(316, 567, 11, 0, NULL, NULL),
(317, 568, 11, 0, NULL, NULL),
(318, 591, 11, 0, NULL, NULL),
(319, 570, 11, 0, NULL, NULL),
(320, 576, 11, 0, NULL, NULL),
(321, 571, 11, 0, NULL, NULL),
(322, 569, 11, 0, NULL, NULL),
(323, 589, 11, 0, NULL, NULL),
(324, 566, 11, 0, NULL, NULL),
(325, 575, 11, 0, NULL, NULL),
(326, 581, 11, 0, NULL, NULL),
(327, 577, 11, 0, NULL, NULL),
(328, 578, 11, 0, NULL, NULL),
(329, 572, 11, 0, NULL, NULL),
(330, 573, 11, 0, NULL, NULL),
(331, 587, 11, 0, NULL, NULL),
(332, 579, 11, 0, NULL, NULL),
(333, 585, 11, 0, NULL, NULL),
(334, 594, 11, 0, NULL, NULL),
(335, 622, 12, 0, NULL, NULL),
(336, 595, 12, 0, NULL, NULL),
(337, 605, 12, 0, NULL, NULL),
(338, 598, 12, 0, NULL, NULL),
(339, 604, 12, 0, NULL, NULL),
(340, 610, 12, 0, NULL, NULL),
(341, 617, 12, 0, NULL, NULL),
(342, 600, 12, 0, NULL, NULL),
(343, 609, 12, 0, NULL, NULL),
(344, 607, 12, 0, NULL, NULL),
(345, 611, 12, 0, NULL, NULL),
(346, 615, 12, 0, NULL, NULL),
(347, 612, 12, 0, NULL, NULL),
(348, 594, 12, 0, NULL, NULL),
(349, 599, 12, 0, NULL, NULL),
(350, 619, 12, 0, NULL, NULL),
(351, 606, 12, 0, NULL, NULL),
(352, 603, 12, 0, NULL, NULL),
(353, 616, 12, 0, NULL, NULL),
(354, 602, 12, 0, NULL, NULL),
(355, 618, 12, 0, NULL, NULL),
(356, 597, 12, 0, NULL, NULL),
(357, 596, 12, 0, NULL, NULL),
(358, 613, 12, 0, NULL, NULL),
(359, 601, 12, 0, NULL, NULL),
(360, 608, 12, 0, NULL, NULL),
(361, 614, 12, 0, NULL, NULL),
(362, 620, 12, 0, NULL, NULL),
(363, 621, 12, 0, NULL, NULL),
(364, 650, 13, 0, NULL, NULL),
(365, 629, 13, 0, NULL, NULL),
(366, 632, 13, 0, NULL, NULL),
(367, 628, 13, 0, NULL, NULL),
(368, 625, 13, 0, NULL, NULL),
(369, 630, 13, 0, NULL, NULL),
(370, 644, 13, 0, NULL, NULL),
(371, 636, 13, 0, NULL, NULL),
(372, 627, 13, 0, NULL, NULL),
(373, 646, 13, 0, NULL, NULL),
(374, 645, 13, 0, NULL, NULL),
(375, 633, 13, 0, NULL, NULL),
(376, 637, 13, 0, NULL, NULL),
(377, 634, 13, 0, NULL, NULL),
(378, 647, 13, 0, NULL, NULL),
(379, 643, 13, 0, NULL, NULL),
(380, 641, 13, 0, NULL, NULL),
(381, 626, 13, 0, NULL, NULL),
(382, 638, 13, 0, NULL, NULL),
(383, 648, 13, 0, NULL, NULL),
(384, 640, 13, 0, NULL, NULL),
(385, 635, 13, 0, NULL, NULL),
(386, 631, 13, 0, NULL, NULL),
(387, 623, 13, 0, NULL, NULL),
(388, 649, 13, 0, NULL, NULL),
(389, 642, 13, 0, NULL, NULL),
(390, 624, 13, 0, NULL, NULL),
(391, 639, 13, 0, NULL, NULL),
(392, 499, 14, 0, NULL, NULL),
(393, 485, 14, 0, NULL, NULL),
(394, 497, 14, 0, NULL, NULL),
(395, 487, 14, 0, NULL, NULL),
(396, 468, 14, 0, NULL, NULL),
(397, 472, 14, 0, NULL, NULL),
(398, 471, 14, 0, NULL, NULL),
(399, 475, 14, 0, NULL, NULL),
(400, 479, 14, 0, NULL, NULL),
(401, 483, 14, 0, NULL, NULL),
(402, 488, 14, 0, NULL, NULL),
(403, 476, 14, 0, NULL, NULL),
(404, 486, 14, 0, NULL, NULL),
(405, 492, 14, 0, NULL, NULL),
(406, 467, 14, 0, NULL, NULL),
(407, 493, 14, 0, NULL, NULL),
(408, 494, 14, 0, NULL, NULL),
(409, 469, 14, 0, NULL, NULL),
(410, 477, 14, 0, NULL, NULL),
(411, 470, 14, 0, NULL, NULL),
(412, 484, 14, 0, NULL, NULL),
(413, 482, 14, 0, NULL, NULL),
(414, 498, 14, 0, NULL, NULL),
(415, 490, 14, 0, NULL, NULL),
(416, 489, 14, 0, NULL, NULL),
(417, 496, 14, 0, NULL, NULL),
(418, 491, 14, 0, NULL, NULL),
(419, 473, 14, 0, NULL, NULL),
(420, 474, 14, 0, NULL, NULL),
(421, 481, 14, 0, NULL, NULL),
(422, 480, 14, 0, NULL, NULL),
(423, 478, 14, 0, NULL, NULL),
(424, 495, 14, 0, NULL, NULL),
(425, 531, 15, 0, NULL, NULL),
(426, 510, 15, 0, NULL, NULL),
(427, 522, 15, 0, NULL, NULL),
(428, 501, 15, 0, NULL, NULL),
(429, 518, 15, 0, NULL, NULL),
(430, 514, 15, 0, NULL, NULL),
(431, 508, 15, 0, NULL, NULL),
(432, 515, 15, 0, NULL, NULL),
(433, 525, 15, 0, NULL, NULL),
(434, 513, 15, 0, NULL, NULL),
(435, 528, 15, 0, NULL, NULL),
(436, 502, 15, 0, NULL, NULL),
(437, 517, 15, 0, NULL, NULL),
(438, 519, 15, 0, NULL, NULL),
(439, 503, 15, 0, NULL, NULL),
(440, 521, 15, 0, NULL, NULL),
(441, 504, 15, 0, NULL, NULL),
(442, 526, 15, 0, NULL, NULL),
(443, 506, 15, 0, NULL, NULL),
(444, 511, 15, 0, NULL, NULL),
(445, 516, 15, 0, NULL, NULL),
(446, 523, 15, 0, NULL, NULL),
(447, 505, 15, 0, NULL, NULL),
(448, 500, 15, 0, NULL, NULL),
(449, 524, 15, 0, NULL, NULL),
(450, 520, 15, 0, NULL, NULL),
(451, 512, 15, 0, NULL, NULL),
(452, 507, 15, 0, NULL, NULL),
(453, 527, 15, 0, NULL, NULL),
(454, 529, 15, 0, NULL, NULL),
(455, 509, 15, 0, NULL, NULL),
(456, 530, 15, 0, NULL, NULL),
(457, 563, 16, 0, NULL, NULL),
(458, 541, 16, 0, NULL, NULL),
(459, 532, 16, 0, NULL, NULL),
(460, 546, 16, 0, NULL, NULL),
(461, 538, 16, 0, NULL, NULL),
(462, 560, 16, 0, NULL, NULL),
(463, 534, 16, 0, NULL, NULL),
(464, 557, 16, 0, NULL, NULL),
(465, 549, 16, 0, NULL, NULL),
(466, 551, 16, 0, NULL, NULL),
(467, 545, 16, 0, NULL, NULL),
(468, 555, 16, 0, NULL, NULL),
(469, 533, 16, 0, NULL, NULL),
(470, 540, 16, 0, NULL, NULL),
(471, 550, 16, 0, NULL, NULL),
(472, 542, 16, 0, NULL, NULL),
(473, 556, 16, 0, NULL, NULL),
(474, 554, 16, 0, NULL, NULL),
(475, 547, 16, 0, NULL, NULL),
(476, 536, 16, 0, NULL, NULL),
(477, 553, 16, 0, NULL, NULL),
(478, 539, 16, 0, NULL, NULL),
(479, 548, 16, 0, NULL, NULL),
(480, 535, 16, 0, NULL, NULL),
(481, 558, 16, 0, NULL, NULL),
(482, 544, 16, 0, NULL, NULL),
(483, 552, 16, 0, NULL, NULL),
(484, 537, 16, 0, NULL, NULL),
(485, 543, 16, 0, NULL, NULL),
(486, 559, 16, 0, NULL, NULL),
(487, 561, 16, 0, NULL, NULL),
(488, 562, 16, 0, NULL, NULL),
(489, 404, 17, 0, NULL, NULL),
(490, 392, 17, 0, NULL, NULL),
(491, 403, 17, 0, NULL, NULL),
(492, 385, 17, 0, NULL, NULL),
(493, 400, 17, 0, NULL, NULL),
(494, 377, 17, 0, NULL, NULL),
(495, 398, 17, 0, NULL, NULL),
(496, 394, 17, 0, NULL, NULL),
(497, 389, 17, 0, NULL, NULL),
(498, 388, 17, 0, NULL, NULL),
(499, 383, 17, 0, NULL, NULL),
(500, 386, 17, 0, NULL, NULL),
(501, 374, 17, 0, NULL, NULL),
(502, 384, 17, 0, NULL, NULL),
(503, 387, 17, 0, NULL, NULL),
(504, 399, 17, 0, NULL, NULL),
(505, 381, 17, 0, NULL, NULL),
(506, 402, 17, 0, NULL, NULL),
(507, 390, 17, 0, NULL, NULL),
(508, 376, 17, 0, NULL, NULL),
(509, 375, 17, 0, NULL, NULL),
(510, 380, 17, 0, NULL, NULL),
(511, 396, 17, 0, NULL, NULL),
(512, 378, 17, 0, NULL, NULL),
(513, 393, 17, 0, NULL, NULL),
(514, 382, 17, 0, NULL, NULL),
(515, 391, 17, 0, NULL, NULL),
(516, 379, 17, 0, NULL, NULL),
(517, 401, 17, 0, NULL, NULL),
(518, 397, 17, 0, NULL, NULL),
(519, 435, 18, 0, NULL, NULL),
(520, 411, 18, 0, NULL, NULL),
(521, 412, 18, 0, NULL, NULL),
(522, 429, 18, 0, NULL, NULL),
(523, 423, 18, 0, NULL, NULL),
(524, 415, 18, 0, NULL, NULL),
(525, 413, 18, 0, NULL, NULL),
(526, 424, 18, 0, NULL, NULL),
(527, 430, 18, 0, NULL, NULL),
(528, 428, 18, 0, NULL, NULL),
(529, 409, 18, 0, NULL, NULL),
(530, 417, 18, 0, NULL, NULL),
(531, 408, 18, 0, NULL, NULL),
(532, 422, 18, 0, NULL, NULL),
(533, 410, 18, 0, NULL, NULL),
(534, 421, 18, 0, NULL, NULL),
(535, 418, 18, 0, NULL, NULL),
(536, 426, 18, 0, NULL, NULL),
(537, 406, 18, 0, NULL, NULL),
(538, 414, 18, 0, NULL, NULL),
(539, 419, 18, 0, NULL, NULL),
(540, 407, 18, 0, NULL, NULL),
(541, 416, 18, 0, NULL, NULL),
(542, 420, 18, 0, NULL, NULL),
(543, 432, 18, 0, NULL, NULL),
(544, 427, 18, 0, NULL, NULL),
(545, 425, 18, 0, NULL, NULL),
(546, 405, 18, 0, NULL, NULL),
(547, 431, 18, 0, NULL, NULL),
(548, 433, 18, 0, NULL, NULL),
(549, 434, 18, 0, NULL, NULL),
(550, 454, 19, 0, NULL, NULL),
(551, 437, 19, 0, NULL, NULL),
(552, 446, 19, 0, NULL, NULL),
(553, 451, 19, 0, NULL, NULL),
(554, 452, 19, 0, NULL, NULL),
(555, 439, 19, 0, NULL, NULL),
(556, 456, 19, 0, NULL, NULL),
(557, 450, 19, 0, NULL, NULL),
(558, 441, 19, 0, NULL, NULL),
(559, 447, 19, 0, NULL, NULL),
(560, 458, 19, 0, NULL, NULL),
(561, 444, 19, 0, NULL, NULL),
(562, 448, 19, 0, NULL, NULL),
(563, 457, 19, 0, NULL, NULL),
(564, 445, 19, 0, NULL, NULL),
(565, 443, 19, 0, NULL, NULL),
(566, 436, 19, 0, NULL, NULL),
(567, 459, 19, 0, NULL, NULL),
(568, 461, 19, 0, NULL, NULL),
(569, 442, 19, 0, NULL, NULL),
(570, 453, 19, 0, NULL, NULL),
(571, 460, 19, 0, NULL, NULL),
(572, 449, 19, 0, NULL, NULL),
(573, 438, 19, 0, NULL, NULL),
(574, 455, 19, 0, NULL, NULL),
(575, 440, 19, 0, NULL, NULL),
(576, 466, 19, 0, NULL, NULL),
(577, 462, 19, 0, NULL, NULL),
(578, 463, 19, 0, NULL, NULL),
(579, 464, 19, 0, NULL, NULL),
(580, 465, 19, 0, NULL, NULL),
(581, 1295, 19, 0, NULL, NULL),
(582, 595, 20, 0, NULL, NULL),
(583, 737, 20, 0, NULL, NULL),
(584, 867, 20, 0, NULL, NULL),
(585, 591, 20, 0, NULL, NULL),
(588, 622, 1, 0, NULL, NULL),
(589, 828, 1, 0, NULL, NULL),
(590, 437, 20, 0, NULL, NULL),
(591, 392, 20, 0, NULL, NULL),
(592, 595, 21, 0, NULL, NULL),
(593, 737, 21, 0, NULL, NULL),
(594, 867, 21, 0, NULL, NULL),
(595, 371, 20, 0, NULL, NULL),
(596, 828, 20, 0, NULL, NULL),
(597, 411, 20, 0, NULL, NULL),
(598, 572, 20, 0, NULL, NULL),
(599, 541, 20, 0, NULL, NULL),
(600, 350, 20, 0, NULL, NULL),
(601, 510, 20, 0, NULL, NULL),
(602, 454, 20, 0, NULL, NULL),
(603, 403, 20, 0, NULL, NULL),
(604, 330, 20, 0, NULL, NULL),
(605, 337, 20, 0, NULL, NULL),
(606, 672, 20, 0, NULL, NULL),
(612, 595, 17, 0, NULL, NULL),
(613, 737, 17, 0, NULL, NULL),
(615, 867, 23, 0, NULL, NULL),
(616, 591, 23, 0, NULL, NULL),
(617, 392, 23, 0, NULL, NULL),
(618, 357, 23, 0, NULL, NULL),
(619, 541, 23, 0, NULL, NULL),
(620, 350, 23, 0, NULL, NULL),
(621, 371, 23, 0, NULL, NULL),
(622, 510, 23, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'តែងសេចក្តី', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(2, 'សរសេរតាមអាន', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(3, 'ភាសារខ្មែរ', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(4, 'សីលធម៏-ពលរដ្ឋវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(5, 'ប្រវិត្តវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(6, 'ភូមិវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(7, 'គណិតវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(8, 'រូបវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(9, 'គីមី', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(10, 'ជីវវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(11, 'ផែនដីវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(12, 'ភាសាអង់គ្លេស', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(13, 'គេហវិទ្យា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(14, 'អប់រំកាយ-កីឡា', '2020-04-28 17:00:00', '2020-04-28 17:00:00'),
(15, 'ពលកម្ម', '2020-04-28 17:00:00', '2020-04-28 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import`
--

CREATE TABLE `tbl_import` (
  `id` int(11) NOT NULL,
  `nameenglish` varchar(250) DEFAULT NULL,
  `namekhmer` varchar(250) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `N` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_import`
--

INSERT INTO `tbl_import` (`id`, `nameenglish`, `namekhmer`, `sex`, `dob`, `N`, `telephone`, `created_at`, `updated_at`) VALUES
(1, 'Sok Angelly', 'សុខ​ អេនជេលី', 'F', '2013-07-02', '3A-0973', '017 73 75 85', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(2, 'Ny Chantrea', 'នី ចន្រ្ទា', 'F', '2010-09-18', '3A-1031', ' 088 929 5762', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(3, 'Peng Venghong', 'ពឹង វេងហុង', 'M', '2012-10-27', '3A-1000', '095 56 61 65', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(4, 'Ly Anshing', 'លី អានស៊ីង', 'M', '2014-01-25', '3A-0977', '087 36 78 78', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(5, 'Meng Siv​ Ing', 'ម៉េង ស៊ីវអ៊ីង', 'F', '2013-11-24', '3A-0985', '012 92 90 07', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(6, 'Pha Davy', 'ផា ដាវី', 'F', '2012-12-10', '3A-1004', '068 82 82 44', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(7, 'Ro Sophealeangseng', 'រ៉ូ សុភាលាងសេង', 'M', '2011-10-10', '3A-1005', '012 44 33 31', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(8, 'Phen Suniza', 'ភែន សុនីហ្សា', 'F', '2013-03-19', '3A-0995', '012 42 80 98', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(9, 'Lim Chhun Leang', 'លឹម ឈុនលាង', 'F', '2013-12-01', '3A-0998', '012 69 13 13', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(10, 'Khim Ly Leangchhoeng', 'ឃីម លីលាងឆឹង', 'M', '2012-06-19', '3A-1008', '097 66 777 95', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(11, 'Gasmanseng Gilyana', 'ហ្គស្មាន់ សេងហ្គីលីយ៉ាណា', 'F', '2012-09-18', '3A-1010', '088 97 22223', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(12, 'Kong Chhinhuy', 'គង់ ឈិនហ៊ុយ', 'M', '2013-12-18', '3A-1012', '017 55 91 68', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(13, 'Oeng Darren', 'អឹង ដារិន', 'M', '2013-06-16', '3A-1014', '010 95 20 09', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(14, 'Ly Pheng', 'លី ផេង', 'M', '2013-03-14', '3A-1018', '085 28 68 86', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(15, 'Chivion Aly Panha', 'ជីវ័ន អេលីបញ្ញា', 'M', '2009-05-10', '3A-1000', '017 279 027', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(16, 'Ngo Mony Nich', 'ង៉ូ មុន្នីនិច', 'F', '2012-02-24', '3A-1001', '092 92222 4', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(17, 'Leng Saryna', 'ឡេង សារីណា', 'F', '2013-04-21', '3A-1002', '010 696 433', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(18, 'Teng Sivgech', 'តេង ស៊ាវហ្គិច', 'F', '2013-06-10', '3A-1023', '012 29 92 44', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(19, 'Tem MonitaJulia', 'ទឹម ម៉ូនីតាជូលី', 'F', '2013-03-08', '3A-1016', '096 600 03 52', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(20, 'Tem Johnson', 'ទឹម ចនសុន', 'M', '2011-07-27', '3A-1017', '096 600 03 52', '2020-04-17 00:49:49', '2020-04-17 00:49:49'),
(21, 'Ra Chho Er', 'រ៉ា ឈូអឺរ', 'F', '2012-12-12', '3A-1152', '069 90 30 03', '2020-04-17 00:49:49', '2020-04-17 00:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `kh_name` varchar(255) NOT NULL,
  `en_name` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `dob` date NOT NULL,
  `nat` varchar(255) NOT NULL,
  `pro` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `deleted` varchar(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `kh_name`, `en_name`, `sex`, `dob`, `nat`, `pro`, `phone`, `email`, `facebook`, `deleted`, `created_at`, `updated_at`, `campus_id`) VALUES
(1, 'កែវ និស', 'Keo Mis', 'M', '2019-12-11', 'ខ្មែរ', 'គិណិត គីំមី ជីវះ ខ្មែរ', '012365452', 'keonis@gmail.com', 'KeoSna', '0', NULL, '2019-12-24 02:30:02', 1),
(2, 'ឡន ថាវ៉ន', 'Lorn Thavorn', 'M', '2019-12-13', 'ខ្មែរ', 'Math/Physics', '012365689', 'vorn@gmail.com', 'Vorn', '0', '2019-12-12 03:08:21', '2019-12-24 02:30:04', 1),
(3, 'សាលី', 'sali', 'M', '2019-12-11', 'ខ្មែរ', 'Chemistry', '013656985', 'sali@gmail.com', 'salis', '0', '2019-12-12 03:11:43', '2019-12-12 19:48:00', 1),
(4, 'សៀង រើន', 'Sieng Roeun', 'M', '2020-02-11', 'ខ្មែរ', 'Math', '0969872209', 'roeungrk@yahoo.com', 'Roeun', '0', '2020-02-10 20:25:45', '2020-02-10 20:25:45', 1),
(5, 'សុខ ខា', 'Sok Kha', 'M', '2020-02-11', 'ខ្មែរ', 'Khmer', '0969872209', 'roeungrk@yahoo.com', 'AA', '0', '2020-02-10 20:27:08', '2020-02-10 20:27:08', 1),
(6, 'សាសា', 'Sasa', 'M', '2020-02-11', 'ខ្មែរ', 'AA', '0969872209', 'roeungrk@yahoo.com', 'Sa', '0', '2020-02-10 20:28:34', '2020-02-10 20:28:34', 1),
(7, 'សុខ', 'Sok', 'M', '2020-02-17', 'ខ្មែរ', 'Match', '0965150829', 'sok@gmail.com', 'SOk', '0', '2020-02-16 22:00:19', '2020-02-16 22:00:19', 2),
(8, 'សារា', 'SaRa', 'M', '2020-02-18', 'ខ្មែរ', 'Khmer', '0969872209', 'admin@gmaill.com', 'SARA', '0', '2020-02-17 19:11:39', '2020-02-19 19:55:42', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_class`
--

CREATE TABLE `teacher_class` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teacher_class`
--

INSERT INTO `teacher_class` (`id`, `teacher_id`, `class_id`, `deleted`, `created_at`, `updated_at`) VALUES
(5, 2, 3, 0, '2019-12-17 04:48:01', '2019-12-17 04:48:01'),
(6, 3, 6, 0, '2019-12-25 01:18:25', '2019-12-25 01:18:25'),
(11, 4, 6, 0, '2020-02-12 18:39:48', '2020-02-12 18:39:48'),
(14, 7, 7, 0, '2020-02-16 22:00:34', '2020-02-16 22:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `camp_id` int(11) DEFAULT NULL,
  `cur_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `camp_id`, `cur_id`, `teacher_id`, `deleted`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sela', '$2y$10$9EcucwVZrmbgux4k9xbp9OHUIUkbQG/zsZ8rBAsGPWIZ4AL1XvxDC', 1, 1, 1, NULL, 0, NULL, '2019-12-24 03:10:14', '2019-12-24 03:10:14'),
(10, 'disac', '$2y$10$w4qkw38C2DdnaQ0r9cjq4ugy9kSasua.ZIYOCobPgd.0v0niwoSW2', 2, 1, 1, NULL, 0, NULL, '2019-12-25 02:18:12', '2019-12-25 02:18:12'),
(11, 'disac_staff', '$2y$10$F/lUlf/GlfKrRWVLqbyfceyNJAdoUUOoHqTbMyJbtPKXhYB8.Aoc6', 3, 1, 2, NULL, 0, NULL, '2019-12-25 02:18:36', '2019-12-25 02:18:36'),
(12, 'discc', '$2y$10$4BTzijgAYRqSbZKY3Lw/6e.gKLzJxrA1dMBG5wUc.Alpr2KxyfpN6', 2, 1, 1, NULL, 0, NULL, '2019-12-25 02:19:09', '2019-12-25 02:19:09'),
(13, 'discc_staff', '$2y$10$h.Ubw6BR6RZErF0JnSH2WelfAcDJ2XkIhBjyeAfEVD.X3uwGIHCsO', 3, 1, 1, NULL, 0, NULL, '2019-12-25 02:19:24', '2020-02-10 03:21:36'),
(14, 'fla', '$2y$10$u7y7Lyv/OCdJv2kAf2J4z.a55SKB4oB9hWRNSkr7uyI2iNrbe.gJ.', 2, 1, 3, NULL, 0, NULL, '2019-12-25 02:20:00', '2019-12-25 02:20:00'),
(15, 'fla_staff', '$2y$10$iS4BHZoBDHfJ7SHMhPot4umwhkHan2b/u2AZYvz/zw3CeUpIrQC1y', 3, 1, 3, NULL, 0, NULL, '2019-12-25 02:20:16', '2019-12-25 02:20:16'),
(16, 'ac_sali', '$2y$10$Z0gawmzjPRU/LHJE82Jb0e4/ihv6jVDV7BEM5zCcoOo2XP1gd2jt2', 4, 1, 2, 2, 0, NULL, '2019-12-25 02:49:59', '2019-12-25 02:49:59'),
(17, 'admin', '$2y$10$Skv24S1IPiX/Tt5OAsnioutlJL1LyrFl60uLfShzR9njJD8HGvKI2', 1, 1, 1, NULL, 0, NULL, '2020-02-11 01:38:04', '2020-02-11 01:38:04'),
(18, 'theavy', '$2y$10$qNCBQUQXbXsRDrmptybDieP15mrb/6Gb58vRds.ahLW03vyabuYKK', 2, 1, 1, NULL, 0, NULL, '2020-02-11 01:44:29', '2020-02-11 01:44:29'),
(19, 'sara', '$2y$10$t1RHu45SfuQp0FttBUTsd.G13sEUOZMahS43hn.X1l6PVm7QURaqC', 1, 2, 2, 8, 0, NULL, '2020-02-19 20:05:58', '2020-02-19 20:05:58'),
(26, 'fla_admin', '$2y$10$wfP7hMDMglJzCUwzNa7nSOKjqvPHcAX/LOE3a5VInGGPVhSGHdmCi', 2, 1, 3, NULL, 0, NULL, '2020-09-24 19:11:44', '2020-09-24 19:11:44'),
(27, 'ac_admin', '$2y$10$RJHPYK3lpkKFJQJVbXqYY.1170nDle6M8OiGhNMZxEvyNjIr1NYvu', 2, 1, 2, NULL, 0, NULL, '2020-09-24 19:12:04', '2020-09-24 19:12:04'),
(28, 'DIS-Rele', '$2y$10$ati5ng6rsW3AaDNWVvxGMuILyyQXd91k28qYCzasaG3VGRkUEzXXi', 5, 1, 1, NULL, 0, NULL, '2020-10-21 21:53:35', '2020-10-21 21:53:35'),
(29, 'pay', '$2y$10$Y7fAj88zXZqXoTBlMt.fjeDlru1/iUeywQItak2wIH..Z4/MHX8tm', 5, 2, 1, NULL, 0, NULL, '2021-02-18 01:28:52', '2021-02-18 01:28:52'),
(30, 'ac_staff', '$2y$10$pmVGfKAMC9MaFQu2hMseQuwJqz6T25sW3Qmkyh3v5CXtCC7vYO5Yu', 3, 1, 2, NULL, 0, NULL, '2021-02-25 03:22:51', '2021-02-25 03:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`id`, `student_id`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 'eat shit', '2019-12-12', '2019-12-11 21:58:40', '2019-12-11 21:58:40'),
(2, 5, 'Eat Shit', '2020-02-21', '2020-02-20 19:07:57', '2020-02-20 19:07:57'),
(3, 5, 'NHam bay', '2020-02-24', '2020-02-23 19:25:55', '2020-02-23 19:25:55');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_class`
-- (See below for the actual view)
--
CREATE TABLE `v_class` (
`id` int(11)
,`academic_year` varchar(255)
,`classroom` varchar(255)
,`curriculum` varchar(255)
,`cur_id` int(11)
,`campus_id` int(11)
,`campus` varchar(255)
,`study_time` varchar(255)
,`grade` varchar(255)
,`deleted` int(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cur_percent`
-- (See below for the actual view)
--
CREATE TABLE `v_cur_percent` (
`student_id` int(11)
,`ccur` int(11)
,`class_id` int(11)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_search_class`
-- (See below for the actual view)
--
CREATE TABLE `v_search_class` (
`id` int(11)
,`full` text
,`cur_id` int(11)
,`campus_id` int(11)
,`deleted` int(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_search_class_en`
-- (See below for the actual view)
--
CREATE TABLE `v_search_class_en` (
`id` int(11)
,`full` text
,`cur_id` int(11)
,`campus_id` int(11)
,`deleted` int(1)
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_student_class`
-- (See below for the actual view)
--
CREATE TABLE `v_student_class` (
`student_id` varchar(250)
,`student_id_ac` varchar(150)
,`student_id_fla` varchar(150)
,`st_id` int(11)
,`id` int(11)
,`kh_name` varchar(250)
,`en_name` varchar(250)
,`sex` varchar(50)
,`dob` date
,`class_id` int(11)
,`deleted` int(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teacher_class`
-- (See below for the actual view)
--
CREATE TABLE `v_teacher_class` (
`id` int(11)
,`kh_name` varchar(255)
,`en_name` varchar(255)
,`sex` varchar(1)
,`nat` varchar(255)
,`pro` varchar(255)
,`phone` varchar(255)
,`facebook` varchar(255)
,`class_id` int(11)
,`deleted` int(1)
);

-- --------------------------------------------------------

--
-- Structure for view `v_class`
--
DROP TABLE IF EXISTS `v_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_class`  AS SELECT `class`.`id` AS `id`, `academic_year`.`name` AS `academic_year`, `classroom`.`name` AS `classroom`, `curriculum`.`name` AS `curriculum`, `curriculum`.`id` AS `cur_id`, `campus`.`id` AS `campus_id`, `campus`.`name` AS `campus`, `class`.`study_time` AS `study_time`, `grade`.`name` AS `grade`, `class`.`deleted` AS `deleted` FROM (((((`class` join `academic_year` on(`class`.`academic_year_id` = `academic_year`.`id`)) join `classroom` on(`class`.`classroom_id` = `classroom`.`id`)) join `campus` on(`class`.`campus_id` = `campus`.`id`)) join `curriculum` on(`class`.`curriculum_id` = `curriculum`.`id`)) join `grade` on(`class`.`grade_id` = `grade`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_cur_percent`
--
DROP TABLE IF EXISTS `v_cur_percent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cur_percent`  AS SELECT `student_class`.`student_id` AS `student_id`, `class`.`curriculum_id` AS `ccur`, `student_class`.`class_id` AS `class_id`, `student_class`.`created_at` AS `created_at` FROM (`student_class` join `class` on(`student_class`.`class_id` = `class`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_search_class`
--
DROP TABLE IF EXISTS `v_search_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_search_class`  AS SELECT `class`.`id` AS `id`, concat('ID : ',`class`.`id`,' បន្ទប់ :',`classroom`.`name`,' ថ្នាក់ទី : ',`grade`.`name`,' ឆ្នាំសិក្សា : ',`academic_year`.`name`) AS `full`, `curriculum`.`id` AS `cur_id`, `class`.`campus_id` AS `campus_id`, `class`.`deleted` AS `deleted` FROM ((((`class` join `classroom` on(`class`.`classroom_id` = `classroom`.`id`)) join `academic_year` on(`class`.`academic_year_id` = `academic_year`.`id`)) join `grade` on(`class`.`grade_id` = `grade`.`id`)) join `curriculum` on(`class`.`curriculum_id` = `curriculum`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_search_class_en`
--
DROP TABLE IF EXISTS `v_search_class_en`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_search_class_en`  AS SELECT `class`.`id` AS `id`, concat('ID : ',`class`.`id`,' | Room :',`classroom`.`name`,' | Grade : ',`grade`.`name`,' | Year : ',`academic_year`.`name`) AS `full`, `class`.`curriculum_id` AS `cur_id`, `class`.`campus_id` AS `campus_id`, `class`.`deleted` AS `deleted`, `academic_year`.`name` AS `name` FROM ((((`class` join `classroom` on(`class`.`classroom_id` = `classroom`.`id`)) join `academic_year` on(`class`.`academic_year_id` = `academic_year`.`id`)) join `grade` on(`class`.`grade_id` = `grade`.`id`)) join `curriculum` on(`class`.`curriculum_id` = `curriculum`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_student_class`
--
DROP TABLE IF EXISTS `v_student_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_student_class`  AS SELECT `student`.`student_id` AS `student_id`, `student`.`student_id_ac` AS `student_id_ac`, `student`.`student_id_fla` AS `student_id_fla`, `student_class`.`id` AS `st_id`, `student`.`id` AS `id`, `student`.`kh_name` AS `kh_name`, `student`.`en_name` AS `en_name`, `student`.`sex` AS `sex`, `student`.`dob` AS `dob`, `student_class`.`class_id` AS `class_id`, `student_class`.`deleted` AS `deleted` FROM (`student_class` join `student` on(`student_class`.`student_id` = `student`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_teacher_class`
--
DROP TABLE IF EXISTS `v_teacher_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teacher_class`  AS SELECT `teacher_class`.`id` AS `id`, `teacher`.`kh_name` AS `kh_name`, `teacher`.`en_name` AS `en_name`, `teacher`.`sex` AS `sex`, `teacher`.`nat` AS `nat`, `teacher`.`pro` AS `pro`, `teacher`.`phone` AS `phone`, `teacher`.`facebook` AS `facebook`, `teacher_class`.`class_id` AS `class_id`, `teacher_class`.`deleted` AS `deleted` FROM (`teacher_class` join `teacher` on(`teacher_class`.`teacher_id` = `teacher`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_year`
--
ALTER TABLE `academic_year`
  ADD PRIMARY KEY (`id`,`name`,`start`,`end`);

--
-- Indexes for table `api_banner`
--
ALTER TABLE `api_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_class`
--
ALTER TABLE `api_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_feedback`
--
ALTER TABLE `api_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_holiday`
--
ALTER TABLE `api_holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_promotion`
--
ALTER TABLE `api_promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_province`
--
ALTER TABLE `api_province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_subject`
--
ALTER TABLE `api_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_youtube`
--
ALTER TABLE `api_youtube`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_zoom`
--
ALTER TABLE `api_zoom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_pay`
--
ALTER TABLE `discount_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logged_user`
--
ALTER TABLE `logged_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `month_fla`
--
ALTER TABLE `month_fla`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_type`
--
ALTER TABLE `pay_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `placement`
--
ALTER TABLE `placement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `primary_score`
--
ALTER TABLE `primary_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_service`
--
ALTER TABLE `product_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quarter`
--
ALTER TABLE `quarter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_ac`
--
ALTER TABLE `score_ac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_cc`
--
ALTER TABLE `score_cc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_cc_online`
--
ALTER TABLE `score_cc_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_fla`
--
ALTER TABLE `score_fla`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score_online`
--
ALTER TABLE `score_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_import`
--
ALTER TABLE `tbl_import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `teacher_class`
--
ALTER TABLE `teacher_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_year`
--
ALTER TABLE `academic_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `api_banner`
--
ALTER TABLE `api_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_class`
--
ALTER TABLE `api_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `api_feedback`
--
ALTER TABLE `api_feedback`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `api_holiday`
--
ALTER TABLE `api_holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `api_promotion`
--
ALTER TABLE `api_promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `api_province`
--
ALTER TABLE `api_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `api_subject`
--
ALTER TABLE `api_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `api_youtube`
--
ALTER TABLE `api_youtube`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=458;

--
-- AUTO_INCREMENT for table `api_zoom`
--
ALTER TABLE `api_zoom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `campus`
--
ALTER TABLE `campus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `classroom`
--
ALTER TABLE `classroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount_pay`
--
ALTER TABLE `discount_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `logged_user`
--
ALTER TABLE `logged_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `month_fla`
--
ALTER TABLE `month_fla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pay_type`
--
ALTER TABLE `pay_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `placement`
--
ALTER TABLE `placement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `primary_score`
--
ALTER TABLE `primary_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_service`
--
ALTER TABLE `product_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `quarter`
--
ALTER TABLE `quarter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `score_ac`
--
ALTER TABLE `score_ac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `score_cc`
--
ALTER TABLE `score_cc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `score_cc_online`
--
ALTER TABLE `score_cc_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1177;

--
-- AUTO_INCREMENT for table `score_fla`
--
ALTER TABLE `score_fla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `score_online`
--
ALTER TABLE `score_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1308;

--
-- AUTO_INCREMENT for table `student_class`
--
ALTER TABLE `student_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=623;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_import`
--
ALTER TABLE `tbl_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `teacher_class`
--
ALTER TABLE `teacher_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
