-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 25 أكتوبر 2022 الساعة 15:43
-- إصدار الخادم: 5.7.39-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `repuffsite`
--

-- --------------------------------------------------------

--
-- بنية الجدول `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `from_type`, `from_id`, `current_balance`, `amount`, `method`, `ref`, `created_at`, `updated_at`) VALUES
(1, 'deliveryman', 2, 940.00, 940.00, 'كاش', '1', '2022-08-08 06:44:54', '2022-08-08 06:44:54'),
(2, 'deliveryman', 2, 2670.00, 2600.00, 'cash', '132233', '2022-09-27 05:16:27', '2022-09-27 05:16:27');

-- --------------------------------------------------------

--
-- بنية الجدول `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`) VALUES
(1, 'ahmed', 'emam', '01096816074', 'ahmedelziaty94@gmail.com', NULL, '$2y$10$mkdaynhszm4f/ci7xrZqZ.g58idFFawklsDj7aD8DXQaR.0oRFiaS', 'vqvTFSIBtq97Os9ekqQeOMZET3itwaYMGngDHlhWAB7lWq6iyctSHGt8RFOu', '2022-05-22 16:18:09', '2022-05-26 18:10:35', 1, NULL),
(2, 'joo', 'fahd', '+201223157398', 'repuffapp@gmail.com', '2022-06-20-62b0b5e70a4fb.png', '$2y$10$RBXwfyrxmINtogY7Pu6sAePwWV/E4M6rU2F/ZA3xWtSsea7JEcnVe', 'tbxMAlFtcpLBABhIpvnIueANV0k1kWORXKjOknoFcjOqhlxBTfG0fDdWjUJy', '2022-06-21 03:01:11', '2022-06-21 03:01:11', 2, NULL),
(4, 'ahmed', 'emam', '01096816074', 'poos@pos.com', NULL, '$2y$10$9LnbrAJkwFZLcrwVHh/sBO3siIApcrrJlwokONksS8GtovpGMKTfe', 'ZGHi5J8DZ8xTrIkD8O2EYpdjngPs8XnL3ekU6QEsvH0a2KP3ER5ur2dT80kU', '2022-05-22 16:18:09', '2022-05-26 18:10:35', 1, NULL),
(5, 'George', 'Wadia', '01223157398', 'georgewadia3@gmail.com', '2022-09-29-63358edbaa2f5.png', '$2y$10$33vvAeK51vTVbf1YTJgSiOjyqNrw05XOHUQ/A.oNIru8J1QhOslSO', NULL, '2022-09-29 21:26:03', '2022-09-29 21:26:03', 2, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(2, 'ِAdmin', '[\"account\",\"addon\",\"attribute\",\"banner\",\"campaign\",\"category\",\"coupon\",\"custom_role\",\"customerList\",\"deliveryman\",\"provide_dm_earning\",\"employee\",\"food\",\"notification\",\"order\",\"restaurant\",\"report\",\"settings\",\"withdraw_list\",\"zone\"]', 1, '2022-06-21 02:59:08', '2022-09-29 20:35:22'),
(3, 'Sales', '[\"food\",\"restaurant\"]', 1, '2022-09-29 20:25:56', '2022-09-29 20:26:15'),
(4, 'Fleet Manager', '[\"account\",\"customerList\",\"deliveryman\",\"order\",\"zone\"]', 1, '2022-09-29 20:34:41', '2022-09-29 20:34:59');

-- --------------------------------------------------------

--
-- بنية الجدول `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `digital_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `manual_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `total_commission_earning`, `digital_received`, `manual_received`, `created_at`, `updated_at`, `delivery_charge`) VALUES
(1, 1, 0.00, 0.00, 3540.00, '2022-08-07 17:55:44', '2022-09-28 02:41:59', 160.00);

-- --------------------------------------------------------

--
-- بنية الجدول `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_attributes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `sub_attributes`, `created_at`, `updated_at`) VALUES
(10, 'abdelrhman Hassan', '[\"wewew\",\"weweqw\",\"qwqweqweqwe\",\"wqeqwqweqwe\",\"qwweqwqwqweqwe\"]', '2022-06-30 07:05:29', '2022-06-30 07:05:29'),
(13, 'Color', '[\"Blue\",\"Gunmetal\",\"Black\",\"Rainbow\"]', '2022-08-09 07:06:29', '2022-08-09 07:06:29'),
(14, 'Size', '[\"30ml\",\"60ml\"]', '2022-10-09 23:38:04', '2022-10-09 23:38:04'),
(15, 'NI', '[\"3Ni\",\"6Ni\",\"9Ni\",\"12Ni\",\"18Ni\"]', '2022-10-18 18:16:11', '2022-10-18 18:16:11'),
(16, 'Age', '[\"20yrs\",\"30yrs\",\"40yrs\"]', '2022-10-23 07:32:04', '2022-10-23 07:32:04'),
(17, 'Colorssss', '[\"Black\",\"Silver\",\"Gold\"]', '2022-10-23 07:39:22', '2022-10-23 07:39:22');

-- --------------------------------------------------------

--
-- بنية الجدول `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`) VALUES
(1, 'RE', 'restaurant_wise', '2022-06-26-62b807cc2cf3d.png', 1, '1', '2022-06-26 16:16:28', '2022-06-26 16:16:28', 1),
(2, 'test', 'restaurant_wise', '2022-07-13-62ce0d2cdae03.png', 1, '1', '2022-06-26 16:16:31', '2022-07-13 09:09:16', 1),
(3, 'rr', 'restaurant_wise', '2022-07-13-62ce0d50252a1.png', 1, '1', '2022-07-13 09:09:52', '2022-07-13 09:09:52', 1),
(4, 'ww', 'restaurant_wise', '2022-07-13-62ce0db6d1376.png', 1, '4', '2022-07-13 09:11:34', '2022-07-13 09:11:34', 1),
(5, 'tt', 'restaurant_wise', '2022-07-13-62ce0dd621b3c.png', 1, '5', '2022-07-13 09:12:06', '2022-07-13 09:12:06', 1),
(6, 'test', 'restaurant_wise', '2022-09-24-632eedb4cf0e0.png', 1, '6', '2022-09-24 20:44:52', '2022-09-24 20:44:52', 4),
(7, 'Vape On', 'restaurant_wise', '2022-09-29-63357d58e7ea1.png', 1, '8', '2022-09-29 20:11:20', '2022-09-29 20:11:20', 4),
(8, 'Joxs', 'restaurant_wise', '2022-09-29-63357dfad5d89.png', 1, '8', '2022-09-29 20:14:02', '2022-09-29 20:20:46', 4),
(9, 'www.facebook.com', 'item_wise', '2022-09-29-6335839890777.png', 1, '43', '2022-09-29 20:38:00', '2022-09-29 20:38:00', 4);

-- --------------------------------------------------------

--
-- بنية الجدول `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `img` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `brands`
--

INSERT INTO `brands` (`id`, `name`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Tianna22', '2022-07-31-62e6a8a7a6f05.png', '2022-08-01 01:06:17', '2022-08-01 01:07:03'),
(2, 'brand2', '2022-08-01-62e70ef783a6d.png', '2022-08-01 08:23:35', '2022-08-01 08:23:35'),
(4, 'edfefe', 'image-name', '2022-08-01 00:02:57', '2022-08-08 01:49:02'),
(5, 'amira', 'def.png', '2022-08-08 00:20:16', '2022-08-08 00:20:16'),
(7, 'amiraa', 'def.png', '2022-08-08 00:43:10', '2022-08-08 00:43:10'),
(8, 'ahmed', 'def.png', '2022-08-08 00:47:11', '2022-08-08 00:47:11'),
(9, 'Geek Vape', '2022-08-08-62f187192959c.png', '2022-08-09 06:58:49', '2022-08-09 06:58:49'),
(10, 'SMOK', '2022-08-13-62f6cfd92f356.png', '2022-08-13 07:10:33', '2022-08-13 07:10:33'),
(11, 'Prof Coil', '2022-09-29-63356289c3af1.png', '2022-09-29 18:16:57', '2022-09-29 18:16:57'),
(12, 'ACID E-Liquid', '2022-10-02-6339767ac257d.png', '2022-10-02 20:31:06', '2022-10-02 20:31:06'),
(13, 'Test Jox', '2022-10-05-633d414451923.png', '2022-10-05 17:33:08', '2022-10-05 17:33:08');

-- --------------------------------------------------------

--
-- بنية الجدول `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-05-11 03:56:38', '2021-09-09 22:27:34'),
(2, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2021-05-11 03:57:02', '2021-09-09 22:28:18'),
(4, 'mail_config', NULL, NULL, '2021-05-11 04:14:06'),
(5, 'fcm_project_id', '220263327376', NULL, NULL),
(6, 'push_notification_key', 'AAAAM0i3ppA:APA91bEhdVq2YWrbuisleHYUFsBdR8msdg1bgOaME3C2i4GkVxoiJsvazYGjfYcpUQc73CwoWUbrbHy_DqRn4-19_QW-lyOyvoGQmPC3BghNJAQgCIvzaXQuQk3vzz1V33Bi49Vidixh', NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"\\u062a\\u0645 \\u062a\\u0623\\u0643\\u064a\\u062f \\u0637\\u0644\\u0628\\u0643 \\u0645\\u0646 \\u0642\\u0628\\u0644 \\u0641\\u0631\\u064a\\u0642 \\u0631\\u064a\\u0628\\u0641\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"\\u0631\\u064a\\u0628\\u0641 \\u0628\\u062a\\u0642\\u0648\\u0644\\u0643 \\u0637\\u0644\\u0628\\u0643 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062a\\u062c\\u0647\\u064a\\u0632\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\"}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(15, 'terms_and_conditions', NULL, NULL, '2021-06-29 06:44:49'),
(16, 'business_name', 'repuff', NULL, NULL),
(17, 'currency', 'EGP', NULL, NULL),
(18, 'logo', '2022-09-15-6323803e7a618.png', NULL, NULL),
(19, 'phone', '0123456789', NULL, NULL),
(20, 'email_address', 'admin@admin.com', NULL, NULL),
(21, 'address', 'CAIRO', NULL, NULL),
(22, 'footer_text', 'Footer Text', NULL, NULL),
(23, 'customer_verification', '0', NULL, NULL),
(24, 'map_api_key', 'AIzaSyCSA_B0I6U1tla28q8zLebLmGxTqUNz4wY', NULL, NULL),
(25, 'privacy_policy', NULL, NULL, '2021-06-28 09:46:55'),
(26, 'about_us', NULL, NULL, '2021-06-29 06:43:25'),
(27, 'minimum_shipping_charge', '20', NULL, NULL),
(28, 'per_km_shipping_charge', '3', NULL, NULL),
(29, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 08:52:20', '2021-09-09 22:28:30'),
(30, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', '2021-07-04 08:53:04', '2021-09-09 22:28:25'),
(31, 'digital_payment', '{\"status\":\"1\"}', '2021-07-04 08:53:10', '2021-10-16 03:11:55'),
(32, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2021-07-04 08:53:18', '2021-09-09 22:28:36'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 09:14:07', '2021-10-16 03:12:17'),
(34, 'senang_pay', '{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 09:14:13', '2021-09-09 22:28:04'),
(35, 'order_handover_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(37, 'timezone', 'Africa/Cairo', NULL, NULL),
(38, 'order_delivery_verification', '0', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '0', NULL, NULL),
(44, 'country', 'AF', NULL, NULL),
(45, 'app_url', 'up_comming', NULL, NULL),
(46, 'default_location', '{\"lat\":\"0\",\"lng\":\"0\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:30', '2021-10-16 03:10:30'),
(48, 'nexmo_sms', '{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:22', '2021-10-16 03:10:22'),
(49, '2factor_sms', '{\"status\":\"0\",\"api_key\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:36', '2021-10-16 03:10:36'),
(50, 'msg91_sms', '{\"status\":\"0\",\"template_id\":null,\"authkey\":null}', '2021-10-16 03:09:59', '2021-10-16 03:09:59'),
(51, 'admin_order_notification', '1', NULL, NULL),
(52, 'free_delivery_over', NULL, NULL, NULL),
(53, 'maintenance_mode', '0', '2021-09-09 21:33:55', '2022-06-26 22:40:56'),
(54, 'app_minimum_version_android', NULL, NULL, NULL),
(55, 'app_minimum_version_ios', NULL, NULL, NULL),
(56, 'app_url_android', NULL, NULL, NULL),
(57, 'app_url_ios', NULL, NULL, NULL),
(58, 'dm_maximum_orders', '20', NULL, NULL),
(59, 'flutterwave', '{\"status\":\"1\",\"public_key\":null,\"secret_key\":null,\"hash\":null}', '2021-09-23 06:51:28', '2021-10-16 03:12:01'),
(60, 'order_confirmation_model', 'restaurant', NULL, NULL),
(61, 'mercadopago', '{\"status\":null,\"public_key\":null,\"access_token\":null}', NULL, '2021-10-16 03:12:09'),
(62, 'popular_food', '1', NULL, NULL),
(63, 'popular_restaurant', '0', NULL, NULL),
(64, 'new_restaurant', '1', NULL, NULL),
(65, 'landing_page_text', '{\"header_title_1\":\"REPUFF\",\"header_title_2\":\"Why you stay .. when you can order from REPUFF\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"REPUFF is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"REPUFF\",\"testimonial_title\":\"Trusted by Customer\",\"footer_article\":\"REPUFF\"}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(66, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/repuffapp.com\"}', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(67, 'speciality', '[]', '2021-10-31 15:21:57', '2022-06-26 22:37:53'),
(68, 'testimonial', '[{\"img\":\"2021-10-28-617aa5a9e4b4a.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9b13c57b.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9db9752d.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"2021-10-28-617aa9faa8c78.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]', '2021-10-31 15:21:57', '2021-10-31 15:21:57'),
(69, 'most_reviewed_foods', '1', NULL, NULL),
(70, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', NULL, '2021-11-12 21:02:39'),
(71, 'timeformat', '12', NULL, NULL),
(72, 'canceled_by_restaurant', '0', NULL, NULL),
(73, 'canceled_by_deliveryman', '1', NULL, NULL),
(74, 'show_dm_earning', '0', NULL, NULL),
(75, 'toggle_veg_non_veg', '0', NULL, NULL),
(76, 'toggle_dm_registration', '0', NULL, NULL),
(77, 'toggle_restaurant_registration', '0', NULL, NULL),
(78, 'recaptcha', '{\"status\":\"1\",\"site_key\":\"6Le9AocgAAAAAFKcy6Kf5c9NUAta_9rNw-zfCou7\",\"secret_key\":\"6Le9AocgAAAAACWkeWrwcovWQJ4vGrcL8z29hlvt\"}', '2022-06-21 02:29:16', '2022-06-21 02:29:16'),
(79, 'language', '[\"en\",\"ar\"]', NULL, NULL),
(80, 'schedule_order_slot_duration', '30', NULL, NULL),
(81, 'digit_after_decimal_point', '2', NULL, NULL),
(82, 'icon', '2022-09-15-6323803e7aed0.png', NULL, NULL),
(83, 'map_api_key_server', 'AIzaSyCSA_B0I6U1tla28q8zLebLmGxTqUNz4wY', NULL, NULL),
(84, 'landing_page_images', '{\"top_content_image\":\"2022-06-26-62b86108602d1.png\",\"about_us_image\":\"2022-06-26-62b8610860a51.png\"}', NULL, NULL),
(85, 'order_refunded_message', '{\"status\":0,\"message\":null}', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `image`, `description`, `status`, `admin_id`, `created_at`, `updated_at`, `start_date`, `end_date`, `start_time`, `end_time`) VALUES
(1, 'RE', '2022-06-26-62b85523aa33e.png', NULL, 1, NULL, '2022-06-26 21:46:27', '2022-06-26 21:46:27', '2022-06-30', '2022-07-09', NULL, NULL),
(2, 'free Delivery', '2022-09-29-63359ecd1f0e8.png', 'Free Delivery Campaign', 1, NULL, '2022-09-29 22:34:05', '2022-09-29 23:49:55', '2022-09-29', '2022-11-01', '15:34:00', '22:33:00');

-- --------------------------------------------------------

--
-- بنية الجدول `campaign_restaurant`
--

CREATE TABLE `campaign_restaurant` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `campaign_restaurant`
--

INSERT INTO `campaign_restaurant` (`campaign_id`, `restaurant_id`) VALUES
(1, 3),
(1, 1),
(1, 8),
(2, 8);

-- --------------------------------------------------------

--
-- بنية الجدول `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `discount` double DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `carts`
--

INSERT INTO `carts` (`id`, `quantity`, `price`, `discount`, `discount_type`, `tax`, `tax_type`, `restaurant_id`, `user_id`, `food_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, NULL, NULL, NULL, NULL, 1, 1, 27, '2022-08-21 20:45:41', '2022-08-21 20:45:41'),
(3, 1, 1, NULL, NULL, NULL, NULL, 1, 1, 27, '2022-08-21 20:49:56', '2022-08-21 20:49:56'),
(4, 1, 1, NULL, NULL, NULL, NULL, 1, 53, 27, '2022-08-30 03:36:44', '2022-08-30 03:36:44'),
(5, 1, 1, NULL, NULL, NULL, NULL, 1, 53, 27, '2022-08-31 04:46:10', '2022-08-31 04:46:10'),
(6, 1, 1, NULL, NULL, NULL, NULL, 1, 53, 27, '2022-08-31 04:50:58', '2022-08-31 04:50:58'),
(7, 1, 1, NULL, NULL, NULL, NULL, 1, 53, 27, '2022-08-31 04:52:32', '2022-08-31 04:52:32'),
(8, 1, 1, NULL, NULL, NULL, NULL, 1, 53, 27, '2022-08-31 04:53:48', '2022-08-31 04:53:48'),
(9, 1, 1, NULL, NULL, NULL, NULL, 1, 55, 27, '2022-09-20 01:05:24', '2022-09-20 01:05:24'),
(10, 1, 1, NULL, NULL, NULL, NULL, 1, 55, 27, '2022-09-20 01:41:55', '2022-09-20 01:41:55'),
(11, 1, 1, NULL, NULL, NULL, NULL, 3, 55, 27, '2022-09-20 01:42:06', '2022-09-20 01:42:06');

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`) VALUES
(2, 'Hardware', '2022-07-13-62ce0a2d2f01d.png', 0, 0, 1, '2022-06-21 04:44:52', '2022-07-13 08:56:29', 0),
(3, 'E-Juice', '2022-07-13-62ce095844526.png', 0, 0, 1, '2022-06-21 05:08:15', '2022-07-13 08:52:56', 0),
(4, 'DL', 'def.png', 3, 1, 1, '2022-06-21 05:08:45', '2022-06-21 05:08:45', 0),
(5, 'MTL', 'def.png', 3, 1, 1, '2022-06-21 05:09:02', '2022-06-21 05:09:02', 0),
(7, 'Salt', 'def.png', 3, 1, 1, '2022-06-21 05:49:17', '2022-06-28 03:37:42', 0),
(9, '% Offers', '2022-07-13-62ce0923a8a73.png', 0, 0, 1, '2022-07-13 08:52:03', '2022-07-13 08:52:03', 0),
(10, 'Coils', '2022-07-13-62ce09a32e3bb.png', 0, 0, 1, '2022-07-13 08:54:11', '2022-07-13 08:54:11', 0),
(11, 'Accessories', '2022-07-13-62ce09dbc5742.png', 0, 0, 1, '2022-07-13 08:55:07', '2022-07-13 08:55:07', 0),
(13, 'Tanks & RDAS', '2022-08-09-62f18829e98ea.png', 0, 0, 1, '2022-08-09 07:03:21', '2022-08-09 07:03:21', 0),
(14, 'Ready Coil', 'def.png', 10, 1, 1, '2022-10-02 18:33:39', '2022-10-02 18:33:39', 0),
(16, 'MTL Coil', 'def.png', 10, 1, 1, '2022-10-02 18:34:15', '2022-10-02 18:34:15', 0),
(17, 'DL Coil', 'def.png', 10, 1, 1, '2022-10-02 18:34:25', '2022-10-02 18:34:25', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `coupon_type`, `limit`, `status`, `created_at`, `updated_at`, `data`, `total_uses`) VALUES
(1, 'Free Delivery', '1st Puff', '2022-06-23', '2022-12-01', 0.00, 0.00, 0.00, '', 'free_delivery', NULL, 1, '2022-06-22 12:58:42', '2022-10-10 18:11:32', '\"\"', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 1.00, NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', 1.00, NULL, NULL),
(3, 'Euro', 'EUR', '€', 1.00, NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', 1.00, NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', 1.00, NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', 1.00, NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', 1.00, NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', 1.00, NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', 1.00, NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', 1.00, NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', 1.00, NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1.00, NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', 1.00, NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', 1.00, NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', 1.00, NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', 1.00, NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', 1.00, NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', 1.00, NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', 1.00, NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', 1.00, NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', 1.00, NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', 1.00, NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', 1.00, NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', 1.00, NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', 1.00, NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', 1.00, NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', 1.00, NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', 1.00, NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', 1.00, NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', 1.00, NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', 1.00, NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', 1.00, NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', 1.00, NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', 1.00, NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'ج.م', 1.00, NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', 1.00, NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', 1.00, NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', 1.00, NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', 1.00, NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', 1.00, NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', 1.00, NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', 1.00, NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', 1.00, NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', 1.00, NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', 1.00, NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', 1.00, NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', 1.00, NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', 1.00, NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', 1.00, NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', 1.00, NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', 1.00, NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', 1.00, NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', 1.00, NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', 1.00, NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', 1.00, NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', 1.00, NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', 1.00, NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', 1.00, NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', 1.00, NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', 1.00, NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', 1.00, NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', 1.00, NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', 1.00, NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', 1.00, NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', 1.00, NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', 1.00, NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', 1.00, NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', 1.00, NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', 1.00, NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', 1.00, NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', 1.00, NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', 1.00, NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', 1.00, NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', 1.00, NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', 1.00, NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', 1.00, NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', 1.00, NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', 1.00, NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', 1.00, NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', 1.00, NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', 1.00, NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', 1.00, NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', 1.00, NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', 1.00, NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', 1.00, NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', 1.00, NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', 1.00, NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', 1.00, NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', 1.00, NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', 1.00, NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', 1.00, NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', 1.00, NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', 1.00, NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', 1.00, NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', 1.00, NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', 1.00, NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', 1.00, NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', 1.00, NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', 1.00, NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', 1.00, NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', 1.00, NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', 1.00, NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', 1.00, NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', 1.00, NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', 1.00, NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', 1.00, NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', 1.00, NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', 1.00, NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', 1.00, NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', 1.00, NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', 1.00, NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', 1.00, NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', 1.00, NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', 1.00, NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', 1.00, NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', 1.00, NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', 1.00, NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', 1.00, NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', 1.00, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`, `zone_id`) VALUES
(1, 'home', '+201022839797', 'مدينة بركة السبع، مركز بركة السبع،، J3HH+PW3, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6160621, Egypt', '30.629774143906463', '31.079589687287807', 8, 'Hesham Azab', '2022-07-03 12:06:40', '2022-07-03 12:06:40', 1),
(2, 'home', '+201096816011', 'القلج، الخانكة،، 59H2+PHG, Al Qalg, Al Khankah, Al Qalyubia Governorate 6345323, Egypt', '30.179054129234057', '31.352096758782867', 10, 'مهم سالم', '2022-07-04 06:28:05', '2022-07-04 06:28:05', 1),
(3, 'home', '+201223157398', '97 El-Horeya, Shagret Mariem, El Matareya, Cairo Governorate 4532220, Egypt', '30.12584974528175', '31.298549138009548', 6, 'George Xeplod', '2022-07-13 11:57:26', '2022-07-13 11:57:26', 1),
(4, 'home', '+201004479160', 'Cairo Festival City, Nasr City, Egypt', '30.03286406207867', '31.41001235693693', 2, 'Hesham Azab', '2022-07-15 16:12:48', '2022-07-15 16:12:48', 1),
(5, 'home', '+201060907080', 'Nasr City, Egypt', '30.051084999846726', '31.36559899896383', 44, 'Ahmedemo Malke', '2022-08-01 08:51:03', '2022-08-01 08:51:03', 1),
(8, 'office', '+201151875214', 'HGG3+GCH, Belbeis - Zagazig Rd, Al Hakma, Zagazig 2, Ash Sharqia Governorate 7131155, Egypt', '30.57631580130942', '31.503675766289238', 42, 'Ahmed Monem', '2022-08-01 11:02:43', '2022-08-01 11:02:43', 1),
(9, 'Home', '+201151875214', 'MQJC+74 Faqous, Egypt', '30.6787485', '31.7734665', 42, 'Ahmed Monem', '2022-08-01 12:24:31', '2022-08-01 12:24:31', 1),
(10, 'home', '+201022222222', '10th of Ramadan City, Egypt', '30.29266538402099', '31.742343418300152', 43, 'hemoo alii', '2022-08-03 03:09:23', '2022-08-03 03:09:23', 1),
(11, 'home', '+201022222222', '10th of Ramadan City, Egypt', '30.29266538402099', '31.742343418300152', 43, 'hemoo alii', '2022-08-03 03:09:23', '2022-08-03 03:09:23', 1),
(12, 'office', '+201022222222', '10th of Ramadan City 1, Egypt', '30.285390619371004', '31.730945035815243', 43, 'hemoo alii', '2022-08-03 03:10:01', '2022-08-03 03:10:01', 1),
(13, 'others', '+201223157398', 'El-Gomhoreya, Shagret Mariem, El Matareya, Cairo Governorate 4532201, Egypt', '30.1240932679378', '31.300678811967376', 6, 'Joka jox', '2022-08-04 07:05:17', '2022-08-04 07:05:17', 1),
(14, 'office', '+201020202020', 'Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt', '30.179055868228104', '31.352112181484696', 52, 'Ahmed Lob', '2022-08-08 07:22:56', '2022-08-08 07:22:56', 1),
(15, 'home', '+201088787878', '10th of Ramadan City, Egypt', '30.29266538402099', '31.742343418300152', 51, 'fasdff asdf', '2022-08-09 00:41:30', '2022-08-09 00:41:30', 1),
(16, 'home', '+201088787878', 'Giza, El Omraniya, Egypt', '30.01305580358613', '31.208852715790268', 51, 'fasdff asdf', '2022-08-09 22:07:12', '2022-08-09 22:07:12', 1),
(17, 'home', '+201223157368', 'Cairo, Egypt', '30.044419567021205', '31.235711686313152', 30, 'George Wadia', '2022-09-15 19:35:48', '2022-09-15 19:35:48', 1),
(21, 'home', '+201050505050', 'القلج، الخانكة،، 59H2+PHG, Al Qalg, Al Khankah, Al Qalyubia Governorate 6345323, Egypt', '30.179052390239985', '31.352092064917088', 54, 'Ahmed Moler', '2022-09-18 10:03:34', '2022-09-18 10:03:34', 1),
(27, 'home', '+201020405060', 'Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt', '30.179034130800368', '31.352163814008232', 56, 'Ahmed Emko', '2022-09-26 20:30:42', '2022-09-26 20:30:42', 1),
(28, 'office', '+201020405060', 'Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt', '30.179034130800368', '31.352160461246967', 56, 'Ahmed Emko', '2022-09-26 20:30:54', '2022-09-26 20:30:54', 1),
(29, 'others', '+201020405060', 'Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt', '30.179041086777747', '31.35214637964964', 56, 'Ahmed Emko', '2022-09-26 20:31:07', '2022-09-26 20:31:07', 1),
(30, 'others', '+201223157368', 'Sheraton Al Matar, El Nozha, Egypt', '30.101299728709613', '31.41133066266775', 30, 'George Wadia', '2022-09-27 02:34:21', '2022-09-27 02:34:21', 1),
(32, 'office', '+201223157368', 'Al Kawetch ( Al Matareyya, 47HW+P5C، العزب، قسم المطرية، محافظة القاهرة‬ 6228014, Egypt', '30.129274742733347', '31.29572879523039', 30, 'George Wadia', '2022-09-27 02:35:49', '2022-09-27 02:35:49', 1),
(33, 'home', '+201033563559', 'Cairo, Egypt', '30.044419567021205', '31.235711686313152', 5, 'fahdgad fahd gad', '2022-09-27 02:56:06', '2022-09-27 02:56:06', 1),
(34, 'office', '+201223157368', 'Al Kawetch ( Al Matareyya ), العزب، المطرية، محافظة القاهرة‬،، 47HW+H7X, Arab Al Hoson, El Matareya, Cairo Governorate 6228014, Egypt', '30.129217906898138', '31.295696943998333', 30, 'George Wadia', '2022-09-27 03:46:45', '2022-09-27 03:46:45', 1),
(35, 'home', '+201223157368', '72 El-Nozha, Almazah, Heliopolis, Cairo Governorate 4461114, Egypt', '30.088811532276733', '31.341051422059536', 30, 'George Wadia', '2022-09-29 18:46:11', '2022-09-29 18:46:11', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `delivery_histories`
--

INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, '2022-08-07 10:14:48', '31.3521076', '30.1790566', '59H2+PHG, مركز الخانكة, EG', '2022-08-07 17:14:48', '2022-08-07 17:14:48'),
(2, NULL, 2, '2022-08-07 10:14:57', '31.352115', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:14:57', '2022-08-07 17:14:57'),
(3, NULL, 2, '2022-08-07 10:15:08', '31.3521196', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:15:08', '2022-08-07 17:15:08'),
(4, NULL, 2, '2022-08-07 10:15:19', '31.3521142', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:15:19', '2022-08-07 17:15:19'),
(5, NULL, 2, '2022-08-07 10:15:28', '31.3521145', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:15:28', '2022-08-07 17:15:28'),
(6, NULL, 2, '2022-08-07 10:15:37', '31.3521225', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:15:37', '2022-08-07 17:15:37'),
(7, NULL, 2, '2022-08-07 10:15:48', '31.3521123', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:15:48', '2022-08-07 17:15:48'),
(8, NULL, 2, '2022-08-07 10:15:57', '31.3521132', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:15:57', '2022-08-07 17:15:57'),
(9, NULL, 2, '2022-08-07 10:16:12', '31.3521128', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:16:12', '2022-08-07 17:16:12'),
(10, NULL, 2, '2022-08-07 10:16:22', '31.3521152', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:16:22', '2022-08-07 17:16:22'),
(11, NULL, 2, '2022-08-07 10:16:31', '31.3521152', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:16:31', '2022-08-07 17:16:31'),
(12, NULL, 2, '2022-08-07 10:16:41', '31.3521144', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:16:41', '2022-08-07 17:16:41'),
(13, NULL, 2, '2022-08-07 10:16:51', '31.3521136', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:16:51', '2022-08-07 17:16:51'),
(14, NULL, 2, '2022-08-07 10:17:01', '31.352113', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:17:01', '2022-08-07 17:17:01'),
(15, NULL, 2, '2022-08-07 10:17:11', '31.3521094', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:17:11', '2022-08-07 17:17:11'),
(16, NULL, 2, '2022-08-07 10:17:21', '31.352114', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:17:21', '2022-08-07 17:17:21'),
(17, NULL, 2, '2022-08-07 10:17:31', '31.3521197', '30.1790546', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:17:31', '2022-08-07 17:17:31'),
(18, NULL, 2, '2022-08-07 10:17:52', '31.3521191', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:17:52', '2022-08-07 17:17:52'),
(19, NULL, 2, '2022-08-07 10:18:01', '31.3521191', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:18:01', '2022-08-07 17:18:01'),
(20, NULL, 2, '2022-08-07 10:18:11', '31.3521133', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:18:11', '2022-08-07 17:18:11'),
(21, NULL, 2, '2022-08-07 10:18:21', '31.35212', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:18:21', '2022-08-07 17:18:21'),
(22, NULL, 2, '2022-08-07 10:18:31', '31.3521182', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:18:31', '2022-08-07 17:18:31'),
(23, NULL, 2, '2022-08-07 10:18:41', '31.3521187', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:18:41', '2022-08-07 17:18:41'),
(24, NULL, 2, '2022-08-07 10:18:51', '31.3521139', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:18:51', '2022-08-07 17:18:51'),
(25, NULL, 2, '2022-08-07 10:19:01', '31.3521054', '30.1790616', '59H2+PHG, مركز الخانكة, EG', '2022-08-07 17:19:01', '2022-08-07 17:19:01'),
(26, NULL, 2, '2022-08-07 10:19:11', '31.3521193', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:19:11', '2022-08-07 17:19:11'),
(27, NULL, 2, '2022-08-07 10:19:21', '31.3521174', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:19:21', '2022-08-07 17:19:21'),
(28, NULL, 2, '2022-08-07 10:19:31', '31.3521198', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:19:31', '2022-08-07 17:19:31'),
(29, NULL, 2, '2022-08-07 10:19:41', '31.3521188', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:19:41', '2022-08-07 17:19:41'),
(30, NULL, 2, '2022-08-07 10:19:50', '31.3521133', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:19:50', '2022-08-07 17:19:50'),
(31, NULL, 2, '2022-08-07 10:20:00', '31.3521131', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:20:00', '2022-08-07 17:20:00'),
(32, NULL, 2, '2022-08-07 10:20:11', '31.3521179', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:20:11', '2022-08-07 17:20:11'),
(33, NULL, 2, '2022-08-07 10:20:21', '31.3521166', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:20:21', '2022-08-07 17:20:21'),
(34, NULL, 2, '2022-08-07 10:20:31', '31.3521115', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:20:31', '2022-08-07 17:20:31'),
(35, NULL, 2, '2022-08-07 10:20:41', '31.3521148', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:20:41', '2022-08-07 17:20:41'),
(36, NULL, 2, '2022-08-07 10:20:50', '31.3521185', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:20:50', '2022-08-07 17:20:50'),
(37, NULL, 2, '2022-08-07 10:21:00', '31.3521134', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:21:00', '2022-08-07 17:21:00'),
(38, NULL, 2, '2022-08-07 10:21:10', '31.3521139', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:21:10', '2022-08-07 17:21:10'),
(39, NULL, 2, '2022-08-07 10:21:23', '31.3521107', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:21:23', '2022-08-07 17:21:23'),
(40, NULL, 2, '2022-08-07 10:21:31', '31.3521107', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:21:31', '2022-08-07 17:21:31'),
(41, NULL, 2, '2022-08-07 10:21:43', '31.3521138', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:21:43', '2022-08-07 17:21:43'),
(42, NULL, 2, '2022-08-07 10:21:51', '31.3521138', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:21:51', '2022-08-07 17:21:51'),
(43, NULL, 2, '2022-08-07 10:22:00', '31.3521438', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:22:00', '2022-08-07 17:22:00'),
(44, NULL, 2, '2022-08-07 10:22:10', '31.3521393', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:22:10', '2022-08-07 17:22:10'),
(45, NULL, 2, '2022-08-07 10:22:20', '31.3521237', '30.1790604', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:22:20', '2022-08-07 17:22:20'),
(46, NULL, 2, '2022-08-07 10:22:31', '31.3522104', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:22:31', '2022-08-07 17:22:31'),
(47, NULL, 2, '2022-08-07 10:22:40', '31.3521245', '30.1790594', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:22:40', '2022-08-07 17:22:40'),
(48, NULL, 2, '2022-08-07 10:22:50', '31.3521467', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:22:50', '2022-08-07 17:22:50'),
(49, NULL, 2, '2022-08-07 10:23:00', '31.3521143', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:23:00', '2022-08-07 17:23:00'),
(50, NULL, 2, '2022-08-07 10:23:10', '31.3521157', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:23:10', '2022-08-07 17:23:10'),
(51, NULL, 2, '2022-08-07 10:23:20', '31.3521124', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:23:20', '2022-08-07 17:23:20'),
(52, NULL, 2, '2022-08-07 10:23:30', '31.3521197', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:23:30', '2022-08-07 17:23:30'),
(53, NULL, 2, '2022-08-07 10:23:40', '31.352118', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:23:40', '2022-08-07 17:23:40'),
(54, NULL, 2, '2022-08-07 10:23:51', '31.3521122', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:23:51', '2022-08-07 17:23:51'),
(55, NULL, 2, '2022-08-07 10:24:00', '31.3521351', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:24:00', '2022-08-07 17:24:00'),
(56, NULL, 2, '2022-08-07 10:24:11', '31.3521142', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:24:11', '2022-08-07 17:24:11'),
(57, NULL, 2, '2022-08-07 10:24:20', '31.3521117', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:24:20', '2022-08-07 17:24:20'),
(58, NULL, 2, '2022-08-07 10:24:30', '31.352116', '30.1790619', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:24:30', '2022-08-07 17:24:30'),
(59, NULL, 2, '2022-08-07 10:24:40', '31.352128', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:24:40', '2022-08-07 17:24:40'),
(60, NULL, 2, '2022-08-07 10:24:50', '31.3521288', '30.1790455', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:24:50', '2022-08-07 17:24:50'),
(61, NULL, 2, '2022-08-07 10:25:01', '31.3521448', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:25:01', '2022-08-07 17:25:01'),
(62, NULL, 2, '2022-08-07 10:25:11', '31.3521411', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:25:11', '2022-08-07 17:25:11'),
(63, NULL, 2, '2022-08-07 10:25:21', '31.3521166', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:25:21', '2022-08-07 17:25:21'),
(64, NULL, 2, '2022-08-07 10:25:30', '31.352116', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:25:30', '2022-08-07 17:25:30'),
(65, NULL, 2, '2022-08-07 10:25:41', '31.3521418', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:25:41', '2022-08-07 17:25:41'),
(66, NULL, 2, '2022-08-07 10:25:50', '31.3521273', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:25:50', '2022-08-07 17:25:50'),
(67, NULL, 2, '2022-08-07 10:26:00', '31.3521118', '30.1790612', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:26:00', '2022-08-07 17:26:00'),
(68, NULL, 2, '2022-08-07 10:26:10', '31.3521255', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:26:10', '2022-08-07 17:26:10'),
(69, NULL, 2, '2022-08-07 10:26:20', '31.3521138', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:26:20', '2022-08-07 17:26:20'),
(70, NULL, 2, '2022-08-07 10:26:30', '31.3521108', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:26:30', '2022-08-07 17:26:30'),
(71, NULL, 2, '2022-08-07 10:26:40', '31.3521313', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:26:40', '2022-08-07 17:26:40'),
(72, NULL, 2, '2022-08-07 10:26:50', '31.3521196', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:26:50', '2022-08-07 17:26:50'),
(73, NULL, 2, '2022-08-07 10:27:01', '31.35211', '30.179062', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:27:01', '2022-08-07 17:27:01'),
(74, NULL, 2, '2022-08-07 10:27:10', '31.3521108', '30.1790624', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:27:10', '2022-08-07 17:27:10'),
(75, NULL, 2, '2022-08-07 10:27:21', '31.3521197', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:27:21', '2022-08-07 17:27:21'),
(76, NULL, 2, '2022-08-07 10:27:30', '31.3521132', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:27:30', '2022-08-07 17:27:30'),
(77, NULL, 2, '2022-08-07 10:27:41', '31.3521177', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:27:41', '2022-08-07 17:27:41'),
(78, NULL, 2, '2022-08-07 10:27:50', '31.3521221', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:27:50', '2022-08-07 17:27:50'),
(79, NULL, 2, '2022-08-07 10:28:00', '31.3521221', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:28:00', '2022-08-07 17:28:00'),
(80, NULL, 2, '2022-08-07 10:28:10', '31.3521143', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:28:10', '2022-08-07 17:28:10'),
(81, NULL, 2, '2022-08-07 10:28:21', '31.3521131', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:28:21', '2022-08-07 17:28:21'),
(82, NULL, 2, '2022-08-07 10:28:52', '31.3521129', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:28:52', '2022-08-07 17:28:52'),
(83, NULL, 2, '2022-08-07 10:29:03', '31.3521099', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:29:03', '2022-08-07 17:29:03'),
(84, NULL, 2, '2022-08-07 10:29:29', '31.3521128', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:29:29', '2022-08-07 17:29:29'),
(85, NULL, 2, '2022-08-07 10:29:51', '31.3521135', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:29:51', '2022-08-07 17:29:51'),
(86, NULL, 2, '2022-08-07 10:29:59', '31.3521135', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:29:59', '2022-08-07 17:29:59'),
(87, NULL, 2, '2022-08-07 10:30:11', '31.3521217', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:30:11', '2022-08-07 17:30:11'),
(88, NULL, 2, '2022-08-07 10:30:19', '31.3521217', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:30:19', '2022-08-07 17:30:19'),
(89, NULL, 2, '2022-08-07 10:30:29', '31.3521126', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:30:29', '2022-08-07 17:30:29'),
(90, NULL, 2, '2022-08-07 10:30:39', '31.3521131', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:30:39', '2022-08-07 17:30:39'),
(91, NULL, 2, '2022-08-07 10:30:49', '31.3521196', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:30:49', '2022-08-07 17:30:49'),
(92, NULL, 2, '2022-08-07 10:31:01', '31.3521118', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:31:01', '2022-08-07 17:31:01'),
(93, NULL, 2, '2022-08-07 10:31:09', '31.3521116', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:31:09', '2022-08-07 17:31:09'),
(94, NULL, 2, '2022-08-07 10:31:20', '31.3521179', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:31:20', '2022-08-07 17:31:20'),
(95, NULL, 2, '2022-08-07 10:31:29', '31.3521119', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:31:29', '2022-08-07 17:31:29'),
(96, NULL, 2, '2022-08-07 10:31:39', '31.3521115', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:31:39', '2022-08-07 17:31:39'),
(97, NULL, 2, '2022-08-07 10:31:51', '31.3521123', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:31:51', '2022-08-07 17:31:51'),
(98, NULL, 2, '2022-08-07 10:32:00', '31.3521123', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:32:00', '2022-08-07 17:32:00'),
(99, NULL, 2, '2022-08-07 10:32:09', '31.3521121', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:32:09', '2022-08-07 17:32:09'),
(100, NULL, 2, '2022-08-07 10:32:19', '31.3521121', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:32:19', '2022-08-07 17:32:19'),
(101, NULL, 2, '2022-08-07 10:32:29', '31.3521118', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:32:29', '2022-08-07 17:32:29'),
(102, NULL, 2, '2022-08-07 10:32:39', '31.3521117', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:32:39', '2022-08-07 17:32:39'),
(103, NULL, 2, '2022-08-07 10:32:49', '31.3521184', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:32:49', '2022-08-07 17:32:49'),
(104, NULL, 2, '2022-08-07 10:32:59', '31.3521125', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:32:59', '2022-08-07 17:32:59'),
(105, NULL, 2, '2022-08-07 10:33:09', '31.3521123', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:33:09', '2022-08-07 17:33:09'),
(106, NULL, 2, '2022-08-07 10:33:19', '31.3521113', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:33:19', '2022-08-07 17:33:19'),
(107, NULL, 2, '2022-08-07 10:33:29', '31.3521128', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:33:29', '2022-08-07 17:33:29'),
(108, NULL, 2, '2022-08-07 10:33:40', '31.3521194', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:33:40', '2022-08-07 17:33:40'),
(109, NULL, 2, '2022-08-07 10:33:49', '31.352112', '30.1790614', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:33:49', '2022-08-07 17:33:49'),
(110, NULL, 2, '2022-08-07 10:33:59', '31.352113', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:33:59', '2022-08-07 17:33:59'),
(111, NULL, 2, '2022-08-07 10:34:10', '31.3521124', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:34:10', '2022-08-07 17:34:10'),
(112, NULL, 2, '2022-08-07 10:34:20', '31.3521088', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:34:20', '2022-08-07 17:34:20'),
(113, NULL, 2, '2022-08-07 10:34:30', '31.3521129', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:34:30', '2022-08-07 17:34:30'),
(114, NULL, 2, '2022-08-07 10:34:39', '31.3521125', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:34:39', '2022-08-07 17:34:39'),
(115, NULL, 2, '2022-08-07 10:34:50', '31.3521193', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:34:50', '2022-08-07 17:34:50'),
(116, NULL, 2, '2022-08-07 10:34:59', '31.3521284', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:34:59', '2022-08-07 17:34:59'),
(117, NULL, 2, '2022-08-07 10:35:09', '31.3521196', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:35:09', '2022-08-07 17:35:09'),
(118, NULL, 2, '2022-08-07 10:35:20', '31.3521097', '30.1790604', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:35:20', '2022-08-07 17:35:20'),
(119, NULL, 2, '2022-08-07 10:35:29', '31.3521111', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:35:29', '2022-08-07 17:35:29'),
(120, NULL, 2, '2022-08-07 10:35:39', '31.3521118', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:35:39', '2022-08-07 17:35:39'),
(121, NULL, 2, '2022-08-07 10:55:58', '31.352123', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:55:58', '2022-08-07 17:55:58'),
(122, NULL, 2, '2022-08-07 10:56:08', '31.3521134', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:56:08', '2022-08-07 17:56:08'),
(123, NULL, 2, '2022-08-07 10:56:18', '31.3521146', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:56:18', '2022-08-07 17:56:18'),
(124, NULL, 2, '2022-08-07 10:56:28', '31.3521172', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:56:28', '2022-08-07 17:56:28'),
(125, NULL, 2, '2022-08-07 10:56:36', '31.3521172', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:56:36', '2022-08-07 17:56:36'),
(126, NULL, 2, '2022-08-07 10:56:47', '31.3521155', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:56:47', '2022-08-07 17:56:47'),
(127, NULL, 2, '2022-08-07 10:56:57', '31.3521242', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:56:57', '2022-08-07 17:56:57'),
(128, NULL, 2, '2022-08-07 10:57:07', '31.3521209', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:57:07', '2022-08-07 17:57:07'),
(129, NULL, 2, '2022-08-07 10:57:17', '31.3521252', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:57:17', '2022-08-07 17:57:17'),
(130, NULL, 2, '2022-08-07 10:57:27', '31.3521246', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:57:27', '2022-08-07 17:57:27'),
(131, NULL, 2, '2022-08-07 10:57:37', '31.3521196', '30.1790594', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:57:37', '2022-08-07 17:57:37'),
(132, NULL, 2, '2022-08-07 10:57:47', '31.3521193', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:57:47', '2022-08-07 17:57:47'),
(133, NULL, 2, '2022-08-07 10:57:57', '31.3521114', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:57:57', '2022-08-07 17:57:57'),
(134, NULL, 2, '2022-08-07 10:58:07', '31.3521259', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:58:07', '2022-08-07 17:58:07'),
(135, NULL, 2, '2022-08-07 10:58:17', '31.3521254', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:58:17', '2022-08-07 17:58:17'),
(136, NULL, 2, '2022-08-07 10:58:27', '31.3521139', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:58:27', '2022-08-07 17:58:27'),
(137, NULL, 2, '2022-08-07 10:58:37', '31.3521163', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:58:37', '2022-08-07 17:58:37'),
(138, NULL, 2, '2022-08-07 10:58:46', '31.3521228', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:58:46', '2022-08-07 17:58:46'),
(139, NULL, 2, '2022-08-07 10:58:57', '31.3521237', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:58:57', '2022-08-07 17:58:57'),
(140, NULL, 2, '2022-08-07 10:59:07', '31.3521284', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:59:07', '2022-08-07 17:59:07'),
(141, NULL, 2, '2022-08-07 10:59:17', '31.3521261', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:59:17', '2022-08-07 17:59:17'),
(142, NULL, 2, '2022-08-07 10:59:27', '31.3521208', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:59:27', '2022-08-07 17:59:27'),
(143, NULL, 2, '2022-08-07 10:59:37', '31.352127', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:59:37', '2022-08-07 17:59:37'),
(144, NULL, 2, '2022-08-07 10:59:47', '31.3521135', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:59:47', '2022-08-07 17:59:47'),
(145, NULL, 2, '2022-08-07 10:59:57', '31.3521128', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 17:59:57', '2022-08-07 17:59:57'),
(146, NULL, 2, '2022-08-07 11:00:07', '31.3521749', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:00:07', '2022-08-07 18:00:07'),
(147, NULL, 2, '2022-08-07 11:00:17', '31.3521232', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:00:17', '2022-08-07 18:00:17'),
(148, NULL, 2, '2022-08-07 11:00:26', '31.352123', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:00:26', '2022-08-07 18:00:26'),
(149, NULL, 2, '2022-08-07 11:00:37', '31.3521244', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:00:37', '2022-08-07 18:00:37'),
(150, NULL, 2, '2022-08-07 11:00:47', '31.3521396', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:00:47', '2022-08-07 18:00:47'),
(151, NULL, 2, '2022-08-07 11:00:57', '31.3521129', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:00:57', '2022-08-07 18:00:57'),
(152, NULL, 2, '2022-08-07 11:01:07', '31.3521222', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:01:07', '2022-08-07 18:01:07'),
(153, NULL, 2, '2022-08-07 11:01:17', '31.3521248', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:01:17', '2022-08-07 18:01:17'),
(154, NULL, 2, '2022-08-07 11:01:27', '31.3521245', '30.1790542', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:01:27', '2022-08-07 18:01:27'),
(155, NULL, 2, '2022-08-07 11:01:36', '31.3521226', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:01:36', '2022-08-07 18:01:36'),
(156, NULL, 2, '2022-08-07 11:01:47', '31.352119', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:01:47', '2022-08-07 18:01:47'),
(157, NULL, 2, '2022-08-07 11:01:57', '31.3521197', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:01:57', '2022-08-07 18:01:57'),
(158, NULL, 2, '2022-08-07 11:02:07', '31.3521254', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:02:07', '2022-08-07 18:02:07'),
(159, NULL, 2, '2022-08-07 11:02:17', '31.352122', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:02:17', '2022-08-07 18:02:17'),
(160, NULL, 2, '2022-08-07 11:02:27', '31.3521108', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:02:27', '2022-08-07 18:02:27'),
(161, NULL, 2, '2022-08-07 11:02:37', '31.3521204', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:02:37', '2022-08-07 18:02:37'),
(162, NULL, 2, '2022-08-07 11:02:47', '31.352113', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:02:47', '2022-08-07 18:02:47'),
(163, NULL, 2, '2022-08-07 11:02:57', '31.3521252', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:02:57', '2022-08-07 18:02:57'),
(164, NULL, 2, '2022-08-07 11:03:07', '31.3521231', '30.1790541', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:03:07', '2022-08-07 18:03:07'),
(165, NULL, 2, '2022-08-07 11:03:17', '31.3521175', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:03:17', '2022-08-07 18:03:17'),
(166, NULL, 2, '2022-08-07 11:03:27', '31.3521205', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:03:27', '2022-08-07 18:03:27'),
(167, NULL, 2, '2022-08-07 11:03:37', '31.3521116', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:03:37', '2022-08-07 18:03:37'),
(168, NULL, 2, '2022-08-07 11:03:47', '31.3521204', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:03:47', '2022-08-07 18:03:47'),
(169, NULL, 2, '2022-08-07 11:03:57', '31.3521214', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:03:57', '2022-08-07 18:03:57'),
(170, NULL, 2, '2022-08-07 11:04:07', '31.3521209', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:04:07', '2022-08-07 18:04:07'),
(171, NULL, 2, '2022-08-07 11:04:17', '31.3521221', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:04:17', '2022-08-07 18:04:17'),
(172, NULL, 2, '2022-08-07 11:04:27', '31.3521132', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:04:27', '2022-08-07 18:04:27'),
(173, NULL, 2, '2022-08-07 11:04:37', '31.3521216', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:04:37', '2022-08-07 18:04:37'),
(174, NULL, 2, '2022-08-07 11:04:47', '31.3521222', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:04:47', '2022-08-07 18:04:47'),
(175, NULL, 2, '2022-08-07 11:04:57', '31.3521196', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:04:57', '2022-08-07 18:04:57'),
(176, NULL, 2, '2022-08-07 11:05:07', '31.3521198', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:05:07', '2022-08-07 18:05:07'),
(177, NULL, 2, '2022-08-07 11:05:17', '31.3521192', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:05:17', '2022-08-07 18:05:17'),
(178, NULL, 2, '2022-08-07 11:05:27', '31.3521148', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:05:27', '2022-08-07 18:05:27'),
(179, NULL, 2, '2022-08-07 11:05:36', '31.352118', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:05:36', '2022-08-07 18:05:36'),
(180, NULL, 2, '2022-08-07 11:05:47', '31.3521192', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:05:47', '2022-08-07 18:05:47'),
(181, NULL, 2, '2022-08-07 11:05:57', '31.3521252', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:05:57', '2022-08-07 18:05:57'),
(182, NULL, 2, '2022-08-07 11:06:07', '31.3521221', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:06:07', '2022-08-07 18:06:07'),
(183, NULL, 2, '2022-08-07 11:06:17', '31.352118', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:06:17', '2022-08-07 18:06:17'),
(184, NULL, 2, '2022-08-07 11:06:27', '31.3521232', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:06:27', '2022-08-07 18:06:27'),
(185, NULL, 2, '2022-08-07 11:06:36', '31.3521133', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:06:36', '2022-08-07 18:06:36'),
(186, NULL, 2, '2022-08-07 11:06:47', '31.3521117', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:06:47', '2022-08-07 18:06:47'),
(187, NULL, 2, '2022-08-07 11:06:56', '31.3521112', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:06:56', '2022-08-07 18:06:56'),
(188, NULL, 2, '2022-08-07 11:07:06', '31.3521082', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:07:06', '2022-08-07 18:07:06'),
(189, NULL, 2, '2022-08-07 11:07:16', '31.352111', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:07:16', '2022-08-07 18:07:16'),
(190, NULL, 2, '2022-08-07 11:07:27', '31.3521171', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:07:27', '2022-08-07 18:07:27'),
(191, NULL, 2, '2022-08-07 11:07:37', '31.352124', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:07:37', '2022-08-07 18:07:37'),
(192, NULL, 2, '2022-08-07 11:07:47', '31.3521203', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:07:47', '2022-08-07 18:07:47'),
(193, NULL, 2, '2022-08-07 11:07:57', '31.3521213', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:07:57', '2022-08-07 18:07:57'),
(194, NULL, 2, '2022-08-07 11:08:06', '31.3521202', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:08:06', '2022-08-07 18:08:06'),
(195, NULL, 2, '2022-08-07 11:08:17', '31.352122', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:08:17', '2022-08-07 18:08:17'),
(196, NULL, 2, '2022-08-07 11:08:26', '31.3521203', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:08:26', '2022-08-07 18:08:26'),
(197, NULL, 2, '2022-08-07 11:08:37', '31.3521239', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:08:37', '2022-08-07 18:08:37'),
(198, NULL, 2, '2022-08-07 11:08:47', '31.3521189', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:08:47', '2022-08-07 18:08:47'),
(199, NULL, 2, '2022-08-07 11:08:57', '31.3521184', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:08:57', '2022-08-07 18:08:57'),
(200, NULL, 2, '2022-08-07 11:09:07', '31.352119', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:09:07', '2022-08-07 18:09:07'),
(201, NULL, 2, '2022-08-07 11:09:17', '31.3521112', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:09:17', '2022-08-07 18:09:17'),
(202, NULL, 2, '2022-08-07 11:09:27', '31.3521135', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:09:27', '2022-08-07 18:09:27'),
(203, NULL, 2, '2022-08-07 11:09:37', '31.352121', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:09:37', '2022-08-07 18:09:37'),
(204, NULL, 2, '2022-08-07 11:09:47', '31.3521182', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:09:47', '2022-08-07 18:09:47'),
(205, NULL, 2, '2022-08-07 11:09:57', '31.3521123', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:09:57', '2022-08-07 18:09:57'),
(206, NULL, 2, '2022-08-07 11:10:07', '31.3521175', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:10:07', '2022-08-07 18:10:07'),
(207, NULL, 2, '2022-08-07 11:10:17', '31.3521201', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:10:17', '2022-08-07 18:10:17'),
(208, NULL, 2, '2022-08-07 11:10:27', '31.3521203', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:10:27', '2022-08-07 18:10:27'),
(209, NULL, 2, '2022-08-07 11:10:37', '31.352119', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:10:37', '2022-08-07 18:10:37'),
(210, NULL, 2, '2022-08-07 11:10:47', '31.3521169', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:10:47', '2022-08-07 18:10:47'),
(211, NULL, 2, '2022-08-07 11:10:57', '31.3521196', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:10:57', '2022-08-07 18:10:57'),
(212, NULL, 2, '2022-08-07 11:11:07', '31.3521204', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:11:07', '2022-08-07 18:11:07'),
(213, NULL, 2, '2022-08-07 11:11:17', '31.3521121', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:11:17', '2022-08-07 18:11:17'),
(214, NULL, 2, '2022-08-07 11:11:27', '31.3521706', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:11:27', '2022-08-07 18:11:27'),
(215, NULL, 2, '2022-08-07 11:11:37', '31.3521498', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:11:37', '2022-08-07 18:11:37'),
(216, NULL, 2, '2022-08-07 11:11:47', '31.3521252', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:11:47', '2022-08-07 18:11:47'),
(217, NULL, 2, '2022-08-07 11:11:57', '31.3521128', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:11:57', '2022-08-07 18:11:57'),
(218, NULL, 2, '2022-08-07 11:12:07', '31.3521255', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:12:07', '2022-08-07 18:12:07'),
(219, NULL, 2, '2022-08-07 11:12:17', '31.352122', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:12:17', '2022-08-07 18:12:17'),
(220, NULL, 2, '2022-08-07 11:12:27', '31.3521213', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:12:27', '2022-08-07 18:12:27'),
(221, NULL, 2, '2022-08-07 11:12:37', '31.3521237', '30.1790541', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:12:37', '2022-08-07 18:12:37'),
(222, NULL, 2, '2022-08-07 11:12:47', '31.3521125', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:12:47', '2022-08-07 18:12:47'),
(223, NULL, 2, '2022-08-07 11:12:57', '31.3521225', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:12:57', '2022-08-07 18:12:57'),
(224, NULL, 2, '2022-08-07 11:13:07', '31.3521137', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:13:07', '2022-08-07 18:13:07'),
(225, NULL, 2, '2022-08-07 11:13:17', '31.3521233', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:13:17', '2022-08-07 18:13:17'),
(226, NULL, 2, '2022-08-07 11:13:27', '31.352123', '30.1790546', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:13:27', '2022-08-07 18:13:27'),
(227, NULL, 2, '2022-08-07 11:13:37', '31.3521237', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:13:37', '2022-08-07 18:13:37'),
(228, NULL, 2, '2022-08-07 11:13:47', '31.3521238', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:13:47', '2022-08-07 18:13:47'),
(229, NULL, 2, '2022-08-07 11:13:57', '31.3521134', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:13:57', '2022-08-07 18:13:57'),
(230, NULL, 2, '2022-08-07 11:14:07', '31.3521126', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:14:07', '2022-08-07 18:14:07'),
(231, NULL, 2, '2022-08-07 11:14:17', '31.3521153', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:14:17', '2022-08-07 18:14:17'),
(232, NULL, 2, '2022-08-07 11:14:27', '31.352121', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:14:27', '2022-08-07 18:14:27'),
(233, NULL, 2, '2022-08-07 11:14:37', '31.3521185', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:14:37', '2022-08-07 18:14:37'),
(234, NULL, 2, '2022-08-07 11:14:47', '31.3521253', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:14:47', '2022-08-07 18:14:47'),
(235, NULL, 2, '2022-08-07 11:14:57', '31.3521232', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:14:57', '2022-08-07 18:14:57'),
(236, NULL, 2, '2022-08-07 11:15:07', '31.3521236', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:15:07', '2022-08-07 18:15:07'),
(237, NULL, 2, '2022-08-07 11:15:17', '31.3521108', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:15:17', '2022-08-07 18:15:17'),
(238, NULL, 2, '2022-08-07 11:15:27', '31.3521245', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:15:27', '2022-08-07 18:15:27'),
(239, NULL, 2, '2022-08-07 11:15:37', '31.3521214', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:15:37', '2022-08-07 18:15:37'),
(240, NULL, 2, '2022-08-07 11:15:47', '31.3521219', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:15:47', '2022-08-07 18:15:47'),
(241, NULL, 2, '2022-08-07 11:15:57', '31.3521119', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:15:57', '2022-08-07 18:15:57'),
(242, NULL, 2, '2022-08-07 11:16:07', '31.3521278', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:16:07', '2022-08-07 18:16:07'),
(243, NULL, 2, '2022-08-07 11:16:16', '31.3521253', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:16:16', '2022-08-07 18:16:16'),
(244, NULL, 2, '2022-08-07 11:16:26', '31.352129', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:16:26', '2022-08-07 18:16:26'),
(245, NULL, 2, '2022-08-07 11:16:37', '31.3521255', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:16:37', '2022-08-07 18:16:37'),
(246, NULL, 2, '2022-08-07 11:16:47', '31.3521279', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:16:47', '2022-08-07 18:16:47'),
(247, NULL, 2, '2022-08-07 11:16:57', '31.352124', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:16:57', '2022-08-07 18:16:57'),
(248, NULL, 2, '2022-08-07 11:17:08', '31.3521209', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:17:08', '2022-08-07 18:17:08'),
(249, NULL, 2, '2022-08-07 11:17:18', '31.3521134', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:17:18', '2022-08-07 18:17:18'),
(250, NULL, 2, '2022-08-07 11:17:27', '31.3521126', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:17:27', '2022-08-07 18:17:27'),
(251, NULL, 2, '2022-08-07 11:17:36', '31.3521217', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:17:36', '2022-08-07 18:17:36'),
(252, NULL, 2, '2022-08-07 11:17:46', '31.3521258', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:17:46', '2022-08-07 18:17:46'),
(253, NULL, 2, '2022-08-07 11:17:56', '31.3521168', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:17:56', '2022-08-07 18:17:56'),
(254, NULL, 2, '2022-08-07 11:18:06', '31.3521188', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:18:06', '2022-08-07 18:18:06'),
(255, NULL, 2, '2022-08-07 11:18:16', '31.3521149', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:18:16', '2022-08-07 18:18:16'),
(256, NULL, 2, '2022-08-07 11:18:26', '31.3521148', '30.1790465', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:18:26', '2022-08-07 18:18:26'),
(257, NULL, 2, '2022-08-07 11:18:37', '31.3521048', '30.179052', '59H2+PHG, مركز الخانكة, EG', '2022-08-07 18:18:37', '2022-08-07 18:18:37'),
(258, NULL, 2, '2022-08-07 11:18:46', '31.3521088', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:18:46', '2022-08-07 18:18:46'),
(259, NULL, 2, '2022-08-07 11:18:56', '31.3521139', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:18:56', '2022-08-07 18:18:56'),
(260, NULL, 2, '2022-08-07 11:19:07', '31.352108', '30.1790604', '59H2+PHG, مركز الخانكة, EG', '2022-08-07 18:19:07', '2022-08-07 18:19:07'),
(261, NULL, 2, '2022-08-07 11:19:16', '31.3521151', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:19:16', '2022-08-07 18:19:16'),
(262, NULL, 2, '2022-08-07 11:19:26', '31.3521177', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:19:26', '2022-08-07 18:19:26'),
(263, NULL, 2, '2022-08-07 11:19:36', '31.3521051', '30.1790551', '59H2+PHG, مركز الخانكة, EG', '2022-08-07 18:19:36', '2022-08-07 18:19:36'),
(264, NULL, 2, '2022-08-07 11:19:46', '31.3521228', '30.1790638', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:19:46', '2022-08-07 18:19:46'),
(265, NULL, 2, '2022-08-07 11:19:56', '31.3521135', '30.1790606', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:19:56', '2022-08-07 18:19:56'),
(266, NULL, 2, '2022-08-07 11:20:06', '31.3521114', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:20:06', '2022-08-07 18:20:06'),
(267, NULL, 2, '2022-08-07 11:20:17', '31.3521257', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:20:17', '2022-08-07 18:20:17'),
(268, NULL, 2, '2022-08-07 11:20:26', '31.3521455', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:20:26', '2022-08-07 18:20:26'),
(269, NULL, 2, '2022-08-07 11:20:36', '31.3521185', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:20:36', '2022-08-07 18:20:36'),
(270, NULL, 2, '2022-08-07 11:20:46', '31.352109', '30.1790609', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:20:46', '2022-08-07 18:20:46'),
(271, NULL, 2, '2022-08-07 11:20:57', '31.3521557', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:20:57', '2022-08-07 18:20:57'),
(272, NULL, 2, '2022-08-07 11:21:06', '31.3521201', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:21:06', '2022-08-07 18:21:06'),
(273, NULL, 2, '2022-08-07 11:21:16', '31.3521099', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:21:16', '2022-08-07 18:21:16'),
(274, NULL, 2, '2022-08-07 11:21:26', '31.3521107', '30.1790611', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:21:26', '2022-08-07 18:21:26'),
(275, NULL, 2, '2022-08-07 11:21:36', '31.3521862', '30.1790546', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:21:36', '2022-08-07 18:21:36'),
(276, NULL, 2, '2022-08-07 11:21:46', '31.3521271', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:21:46', '2022-08-07 18:21:46'),
(277, NULL, 2, '2022-08-07 11:21:56', '31.3521146', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:21:56', '2022-08-07 18:21:56'),
(278, NULL, 2, '2022-08-07 11:22:06', '31.3521125', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:22:06', '2022-08-07 18:22:06'),
(279, NULL, 2, '2022-08-07 11:22:16', '31.3521123', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:22:16', '2022-08-07 18:22:16'),
(280, NULL, 2, '2022-08-07 11:22:26', '31.3521185', '30.1790612', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:22:26', '2022-08-07 18:22:26'),
(281, NULL, 2, '2022-08-07 11:22:36', '31.3521143', '30.1790629', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:22:36', '2022-08-07 18:22:36'),
(282, NULL, 2, '2022-08-07 11:22:46', '31.3521123', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:22:46', '2022-08-07 18:22:46'),
(283, NULL, 2, '2022-08-07 11:22:56', '31.3521123', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:22:56', '2022-08-07 18:22:56'),
(284, NULL, 2, '2022-08-07 11:23:06', '31.3521095', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:23:06', '2022-08-07 18:23:06'),
(285, NULL, 2, '2022-08-07 11:23:17', '31.3521145', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:23:17', '2022-08-07 18:23:17'),
(286, NULL, 2, '2022-08-07 11:23:26', '31.35211', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:23:26', '2022-08-07 18:23:26'),
(287, NULL, 2, '2022-08-07 11:23:36', '31.3521214', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:23:36', '2022-08-07 18:23:36'),
(288, NULL, 2, '2022-08-07 11:23:47', '31.3521205', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:23:47', '2022-08-07 18:23:47'),
(289, NULL, 2, '2022-08-07 11:23:56', '31.3521121', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:23:56', '2022-08-07 18:23:56'),
(290, NULL, 2, '2022-08-07 11:24:07', '31.3521118', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:24:07', '2022-08-07 18:24:07'),
(291, NULL, 2, '2022-08-07 11:24:18', '31.3521122', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:24:18', '2022-08-07 18:24:18'),
(292, NULL, 2, '2022-08-07 11:24:28', '31.3521136', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:24:28', '2022-08-07 18:24:28'),
(293, NULL, 2, '2022-08-07 11:24:36', '31.3521319', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:24:36', '2022-08-07 18:24:36'),
(294, NULL, 2, '2022-08-07 11:24:46', '31.352174', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:24:46', '2022-08-07 18:24:46'),
(295, NULL, 2, '2022-08-07 11:24:56', '31.3521244', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:24:56', '2022-08-07 18:24:56'),
(296, NULL, 2, '2022-08-07 11:25:06', '31.3521119', '30.1790621', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:25:06', '2022-08-07 18:25:06'),
(297, NULL, 2, '2022-08-07 11:26:02', '31.3521134', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:26:02', '2022-08-07 18:26:02'),
(298, NULL, 2, '2022-08-07 11:26:15', '31.3521107', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:26:15', '2022-08-07 18:26:15'),
(299, NULL, 2, '2022-08-07 11:26:24', '31.3521349', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:26:24', '2022-08-07 18:26:24'),
(300, NULL, 2, '2022-08-07 11:26:35', '31.3521284', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:26:35', '2022-08-07 18:26:35'),
(301, NULL, 2, '2022-08-07 11:26:45', '31.3521293', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:26:45', '2022-08-07 18:26:45'),
(302, NULL, 2, '2022-08-07 11:26:55', '31.3521119', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:26:55', '2022-08-07 18:26:55'),
(303, NULL, 2, '2022-08-07 11:27:05', '31.3521222', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:27:05', '2022-08-07 18:27:05'),
(304, NULL, 2, '2022-08-07 11:27:15', '31.3521257', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:27:15', '2022-08-07 18:27:15'),
(305, NULL, 2, '2022-08-07 11:27:24', '31.3521118', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:27:24', '2022-08-07 18:27:24'),
(306, NULL, 2, '2022-08-07 11:27:34', '31.3521304', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:27:34', '2022-08-07 18:27:34'),
(307, NULL, 2, '2022-08-07 11:27:44', '31.352147', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:27:44', '2022-08-07 18:27:44'),
(308, NULL, 2, '2022-08-07 11:27:54', '31.3521129', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:27:54', '2022-08-07 18:27:54'),
(309, NULL, 2, '2022-08-07 11:28:05', '31.3521099', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:28:05', '2022-08-07 18:28:05'),
(310, NULL, 2, '2022-08-07 11:28:15', '31.3521124', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:28:15', '2022-08-07 18:28:15'),
(311, NULL, 2, '2022-08-07 11:28:24', '31.3521112', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:28:24', '2022-08-07 18:28:24'),
(312, NULL, 2, '2022-08-07 11:28:35', '31.3521126', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:28:35', '2022-08-07 18:28:35'),
(313, NULL, 2, '2022-08-07 11:28:44', '31.3521122', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:28:44', '2022-08-07 18:28:44'),
(314, NULL, 2, '2022-08-07 11:28:54', '31.3521292', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:28:54', '2022-08-07 18:28:54'),
(315, NULL, 2, '2022-08-07 11:29:05', '31.3521128', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:29:05', '2022-08-07 18:29:05'),
(316, NULL, 2, '2022-08-07 11:29:15', '31.3521201', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:29:15', '2022-08-07 18:29:15'),
(317, NULL, 2, '2022-08-07 11:29:25', '31.3521118', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:29:25', '2022-08-07 18:29:25'),
(318, NULL, 2, '2022-08-07 11:29:34', '31.3521419', '30.1790538', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:29:34', '2022-08-07 18:29:34'),
(319, NULL, 2, '2022-08-07 11:29:45', '31.3521307', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:29:45', '2022-08-07 18:29:45'),
(320, NULL, 2, '2022-08-07 11:30:17', '31.3521342', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:30:17', '2022-08-07 18:30:17'),
(321, NULL, 2, '2022-08-07 11:30:28', '31.3521128', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:30:28', '2022-08-07 18:30:28'),
(322, NULL, 2, '2022-08-07 11:30:35', '31.3521122', '30.1790604', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:30:35', '2022-08-07 18:30:35'),
(323, NULL, 2, '2022-08-07 11:30:46', '31.3521205', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:30:46', '2022-08-07 18:30:46'),
(324, NULL, 2, '2022-08-07 11:30:55', '31.352113', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:30:55', '2022-08-07 18:30:55'),
(325, NULL, 2, '2022-08-07 11:31:05', '31.3521302', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:31:05', '2022-08-07 18:31:05'),
(326, NULL, 2, '2022-08-07 11:31:15', '31.352203', '30.1790546', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:31:15', '2022-08-07 18:31:15'),
(327, NULL, 2, '2022-08-07 11:31:25', '31.3521209', '30.1790471', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:31:25', '2022-08-07 18:31:25'),
(328, NULL, 2, '2022-08-07 11:31:35', '31.3521351', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:31:35', '2022-08-07 18:31:35'),
(329, NULL, 2, '2022-08-07 11:31:45', '31.3521102', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:31:45', '2022-08-07 18:31:45'),
(330, NULL, 2, '2022-08-07 11:31:55', '31.3521219', '30.1790545', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:31:55', '2022-08-07 18:31:55'),
(331, NULL, 2, '2022-08-07 11:32:05', '31.3521489', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:32:05', '2022-08-07 18:32:05'),
(332, NULL, 2, '2022-08-07 11:32:15', '31.3521214', '30.1790609', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:32:15', '2022-08-07 18:32:15'),
(333, NULL, 2, '2022-08-07 11:32:25', '31.3521212', '30.1790609', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:32:25', '2022-08-07 18:32:25'),
(334, NULL, 2, '2022-08-07 11:32:35', '31.3521252', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:32:35', '2022-08-07 18:32:35'),
(335, NULL, 2, '2022-08-07 11:32:45', '31.3521195', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:32:45', '2022-08-07 18:32:45'),
(336, NULL, 2, '2022-08-07 11:32:55', '31.3521117', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:32:55', '2022-08-07 18:32:55'),
(337, NULL, 2, '2022-08-07 11:33:05', '31.3521458', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:33:05', '2022-08-07 18:33:05'),
(338, NULL, 2, '2022-08-07 11:33:15', '31.3521284', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:33:15', '2022-08-07 18:33:15'),
(339, NULL, 2, '2022-08-07 11:33:25', '31.3521141', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-07 18:33:25', '2022-08-07 18:33:25'),
(340, NULL, 2, '2022-08-07 15:19:04', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:19:04', '2022-08-07 22:19:04'),
(341, NULL, 2, '2022-08-07 15:19:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:19:13', '2022-08-07 22:19:13'),
(342, NULL, 2, '2022-08-07 15:19:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:19:23', '2022-08-07 22:19:23'),
(343, NULL, 2, '2022-08-07 15:19:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:19:33', '2022-08-07 22:19:33'),
(344, NULL, 2, '2022-08-07 15:19:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:19:43', '2022-08-07 22:19:43'),
(345, NULL, 2, '2022-08-07 15:19:53', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:19:53', '2022-08-07 22:19:53'),
(346, NULL, 2, '2022-08-07 15:20:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:20:03', '2022-08-07 22:20:03'),
(347, NULL, 2, '2022-08-07 15:20:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:20:13', '2022-08-07 22:20:13');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(348, NULL, 2, '2022-08-07 15:20:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:20:23', '2022-08-07 22:20:23'),
(349, NULL, 2, '2022-08-07 15:20:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:20:33', '2022-08-07 22:20:33'),
(350, NULL, 2, '2022-08-07 15:20:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:20:43', '2022-08-07 22:20:43'),
(351, NULL, 2, '2022-08-07 15:20:53', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:20:53', '2022-08-07 22:20:53'),
(352, NULL, 2, '2022-08-07 15:21:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:21:03', '2022-08-07 22:21:03'),
(353, NULL, 2, '2022-08-07 15:21:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:21:13', '2022-08-07 22:21:13'),
(354, NULL, 2, '2022-08-07 15:21:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:21:23', '2022-08-07 22:21:23'),
(355, NULL, 2, '2022-08-07 15:21:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:21:33', '2022-08-07 22:21:33'),
(356, NULL, 2, '2022-08-07 15:21:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:21:43', '2022-08-07 22:21:43'),
(357, NULL, 2, '2022-08-07 15:21:53', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:21:53', '2022-08-07 22:21:53'),
(358, NULL, 2, '2022-08-07 15:22:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:22:03', '2022-08-07 22:22:03'),
(359, NULL, 2, '2022-08-07 15:22:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:22:13', '2022-08-07 22:22:13'),
(360, NULL, 2, '2022-08-07 15:22:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:22:23', '2022-08-07 22:22:23'),
(361, NULL, 2, '2022-08-07 15:22:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:22:33', '2022-08-07 22:22:33'),
(362, NULL, 2, '2022-08-07 15:22:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:22:43', '2022-08-07 22:22:43'),
(363, NULL, 2, '2022-08-07 15:23:06', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:23:06', '2022-08-07 22:23:06'),
(364, NULL, 2, '2022-08-07 15:23:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:23:23', '2022-08-07 22:23:23'),
(365, NULL, 2, '2022-08-07 15:23:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:23:33', '2022-08-07 22:23:33'),
(366, NULL, 2, '2022-08-07 15:23:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:23:43', '2022-08-07 22:23:43'),
(367, NULL, 2, '2022-08-07 15:23:53', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:23:53', '2022-08-07 22:23:53'),
(368, NULL, 2, '2022-08-07 15:24:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:24:03', '2022-08-07 22:24:03'),
(369, NULL, 2, '2022-08-07 15:24:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:24:13', '2022-08-07 22:24:13'),
(370, NULL, 2, '2022-08-07 15:24:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:24:23', '2022-08-07 22:24:23'),
(371, NULL, 2, '2022-08-07 15:24:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:24:33', '2022-08-07 22:24:33'),
(372, NULL, 2, '2022-08-07 15:24:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:24:43', '2022-08-07 22:24:43'),
(373, NULL, 2, '2022-08-07 15:24:53', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:24:53', '2022-08-07 22:24:53'),
(374, NULL, 2, '2022-08-07 15:25:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:25:03', '2022-08-07 22:25:03'),
(375, NULL, 2, '2022-08-07 15:25:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:25:13', '2022-08-07 22:25:13'),
(376, NULL, 2, '2022-08-07 15:25:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:25:23', '2022-08-07 22:25:23'),
(377, NULL, 2, '2022-08-07 15:25:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:25:33', '2022-08-07 22:25:33'),
(378, NULL, 2, '2022-08-07 15:25:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:25:43', '2022-08-07 22:25:43'),
(379, NULL, 2, '2022-08-07 15:25:53', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:25:53', '2022-08-07 22:25:53'),
(380, NULL, 2, '2022-08-07 15:26:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:26:03', '2022-08-07 22:26:03'),
(381, NULL, 2, '2022-08-07 15:26:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:26:13', '2022-08-07 22:26:13'),
(382, NULL, 2, '2022-08-07 15:26:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 22:26:23', '2022-08-07 22:26:23'),
(383, NULL, 2, '2022-08-07 16:13:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:13:40', '2022-08-07 23:13:40'),
(384, NULL, 2, '2022-08-07 16:13:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:13:50', '2022-08-07 23:13:50'),
(385, NULL, 2, '2022-08-07 16:14:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:14:00', '2022-08-07 23:14:00'),
(386, NULL, 2, '2022-08-07 16:14:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:14:10', '2022-08-07 23:14:10'),
(387, NULL, 2, '2022-08-07 16:14:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:14:20', '2022-08-07 23:14:20'),
(388, NULL, 2, '2022-08-07 16:14:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:14:30', '2022-08-07 23:14:30'),
(389, NULL, 2, '2022-08-07 16:14:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:14:40', '2022-08-07 23:14:40'),
(390, NULL, 2, '2022-08-07 16:14:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:14:51', '2022-08-07 23:14:51'),
(391, NULL, 2, '2022-08-07 16:15:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:15:00', '2022-08-07 23:15:00'),
(392, NULL, 2, '2022-08-07 16:15:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:15:10', '2022-08-07 23:15:10'),
(393, NULL, 2, '2022-08-07 16:15:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:15:20', '2022-08-07 23:15:20'),
(394, NULL, 2, '2022-08-07 16:15:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:15:30', '2022-08-07 23:15:30'),
(395, NULL, 2, '2022-08-07 16:15:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:15:40', '2022-08-07 23:15:40'),
(396, NULL, 2, '2022-08-07 16:16:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:16:21', '2022-08-07 23:16:21'),
(397, NULL, 2, '2022-08-07 16:16:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:16:31', '2022-08-07 23:16:31'),
(398, NULL, 2, '2022-08-07 16:16:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:16:50', '2022-08-07 23:16:50'),
(399, NULL, 2, '2022-08-07 16:17:26', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:17:26', '2022-08-07 23:17:26'),
(400, NULL, 2, '2022-08-07 16:17:56', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:17:56', '2022-08-07 23:17:56'),
(401, NULL, 2, '2022-08-07 16:18:06', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:18:06', '2022-08-07 23:18:06'),
(402, NULL, 2, '2022-08-07 16:18:16', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:18:16', '2022-08-07 23:18:16'),
(403, NULL, 2, '2022-08-07 16:18:25', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:18:25', '2022-08-07 23:18:25'),
(404, NULL, 2, '2022-08-07 16:18:35', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:18:35', '2022-08-07 23:18:35'),
(405, NULL, 2, '2022-08-07 16:18:45', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:18:45', '2022-08-07 23:18:45'),
(406, NULL, 2, '2022-08-07 16:18:55', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:18:55', '2022-08-07 23:18:55'),
(407, NULL, 2, '2022-08-07 16:19:05', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:19:05', '2022-08-07 23:19:05'),
(408, NULL, 2, '2022-08-07 16:19:15', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:19:15', '2022-08-07 23:19:15'),
(409, NULL, 2, '2022-08-07 16:19:25', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:19:25', '2022-08-07 23:19:25'),
(410, NULL, 2, '2022-08-07 16:19:35', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:19:35', '2022-08-07 23:19:35'),
(411, NULL, 2, '2022-08-07 16:20:04', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:20:04', '2022-08-07 23:20:04'),
(412, NULL, 2, '2022-08-07 16:20:27', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:20:27', '2022-08-07 23:20:27'),
(413, NULL, 2, '2022-08-07 16:20:37', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:20:37', '2022-08-07 23:20:37'),
(414, NULL, 2, '2022-08-07 16:20:47', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:20:47', '2022-08-07 23:20:47'),
(415, NULL, 2, '2022-08-07 16:21:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:21:10', '2022-08-07 23:21:10'),
(416, NULL, 2, '2022-08-07 16:21:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:21:20', '2022-08-07 23:21:20'),
(417, NULL, 2, '2022-08-07 16:21:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:21:30', '2022-08-07 23:21:30'),
(418, NULL, 2, '2022-08-07 16:21:49', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:21:49', '2022-08-07 23:21:49'),
(419, NULL, 2, '2022-08-07 16:21:59', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:21:59', '2022-08-07 23:21:59'),
(420, NULL, 2, '2022-08-07 16:22:13', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:22:13', '2022-08-07 23:22:13'),
(421, NULL, 2, '2022-08-07 16:22:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:22:23', '2022-08-07 23:22:23'),
(422, NULL, 2, '2022-08-07 16:22:33', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:22:33', '2022-08-07 23:22:33'),
(423, NULL, 2, '2022-08-07 16:22:53', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:22:53', '2022-08-07 23:22:53'),
(424, NULL, 2, '2022-08-07 16:23:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:23:03', '2022-08-07 23:23:03'),
(425, NULL, 2, '2022-08-07 16:23:17', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:23:17', '2022-08-07 23:23:17'),
(426, NULL, 2, '2022-08-07 16:23:27', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:23:27', '2022-08-07 23:23:27'),
(427, NULL, 2, '2022-08-07 16:23:37', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:23:37', '2022-08-07 23:23:37'),
(428, NULL, 2, '2022-08-07 16:23:49', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:23:49', '2022-08-07 23:23:49'),
(429, NULL, 2, '2022-08-07 16:24:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:24:00', '2022-08-07 23:24:00'),
(430, NULL, 2, '2022-08-07 16:24:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:24:22', '2022-08-07 23:24:22'),
(431, NULL, 2, '2022-08-07 16:24:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:24:32', '2022-08-07 23:24:32'),
(432, NULL, 2, '2022-08-07 16:24:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:24:42', '2022-08-07 23:24:42'),
(433, NULL, 2, '2022-08-07 16:24:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:24:52', '2022-08-07 23:24:52'),
(434, NULL, 2, '2022-08-07 16:25:07', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:25:07', '2022-08-07 23:25:07'),
(435, NULL, 2, '2022-08-07 16:25:17', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:25:17', '2022-08-07 23:25:17'),
(436, NULL, 2, '2022-08-07 16:25:27', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:25:27', '2022-08-07 23:25:27'),
(437, NULL, 2, '2022-08-07 16:25:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:25:42', '2022-08-07 23:25:42'),
(438, NULL, 2, '2022-08-07 16:25:54', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:25:54', '2022-08-07 23:25:54'),
(439, NULL, 2, '2022-08-07 16:26:04', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:26:04', '2022-08-07 23:26:04'),
(440, NULL, 2, '2022-08-07 16:26:19', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:26:19', '2022-08-07 23:26:19'),
(441, NULL, 2, '2022-08-07 16:26:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:26:31', '2022-08-07 23:26:31'),
(442, NULL, 2, '2022-08-07 16:26:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:26:40', '2022-08-07 23:26:40'),
(443, NULL, 2, '2022-08-07 16:26:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:26:51', '2022-08-07 23:26:51'),
(444, NULL, 2, '2022-08-07 16:27:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:27:01', '2022-08-07 23:27:01'),
(445, NULL, 2, '2022-08-07 16:27:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:27:11', '2022-08-07 23:27:11'),
(446, NULL, 2, '2022-08-07 16:27:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:27:21', '2022-08-07 23:27:21'),
(447, NULL, 2, '2022-08-07 16:27:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:27:31', '2022-08-07 23:27:31'),
(448, NULL, 2, '2022-08-07 16:27:45', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:27:45', '2022-08-07 23:27:45'),
(449, NULL, 2, '2022-08-07 16:27:57', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:27:57', '2022-08-07 23:27:57'),
(450, NULL, 2, '2022-08-07 16:28:07', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:28:07', '2022-08-07 23:28:07'),
(451, NULL, 2, '2022-08-07 16:28:17', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:28:17', '2022-08-07 23:28:17'),
(452, NULL, 2, '2022-08-07 16:28:27', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:28:27', '2022-08-07 23:28:27'),
(453, NULL, 2, '2022-08-07 16:28:37', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:28:37', '2022-08-07 23:28:37'),
(454, NULL, 2, '2022-08-07 16:28:47', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:28:47', '2022-08-07 23:28:47'),
(455, NULL, 2, '2022-08-07 16:28:57', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:28:57', '2022-08-07 23:28:57'),
(456, NULL, 2, '2022-08-07 16:29:07', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:29:07', '2022-08-07 23:29:07'),
(457, NULL, 2, '2022-08-07 16:29:17', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:29:17', '2022-08-07 23:29:17'),
(458, NULL, 2, '2022-08-07 16:29:27', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:29:27', '2022-08-07 23:29:27'),
(459, NULL, 2, '2022-08-07 16:29:37', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:29:37', '2022-08-07 23:29:37'),
(460, NULL, 2, '2022-08-07 16:29:47', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:29:47', '2022-08-07 23:29:47'),
(461, NULL, 2, '2022-08-07 16:29:57', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:29:57', '2022-08-07 23:29:57'),
(462, NULL, 2, '2022-08-07 16:30:09', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:30:09', '2022-08-07 23:30:09'),
(463, NULL, 2, '2022-08-07 16:30:19', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:30:19', '2022-08-07 23:30:19'),
(464, NULL, 2, '2022-08-07 16:30:29', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:30:29', '2022-08-07 23:30:29'),
(465, NULL, 2, '2022-08-07 16:30:39', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:30:39', '2022-08-07 23:30:39'),
(466, NULL, 2, '2022-08-07 16:30:49', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:30:49', '2022-08-07 23:30:49'),
(467, NULL, 2, '2022-08-07 16:30:59', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:30:59', '2022-08-07 23:30:59'),
(468, NULL, 2, '2022-08-07 16:31:09', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:31:09', '2022-08-07 23:31:09'),
(469, NULL, 2, '2022-08-07 16:31:19', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:31:19', '2022-08-07 23:31:19'),
(470, NULL, 2, '2022-08-07 16:31:29', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:31:29', '2022-08-07 23:31:29'),
(471, NULL, 2, '2022-08-07 16:31:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:31:51', '2022-08-07 23:31:51'),
(472, NULL, 2, '2022-08-07 16:32:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:32:00', '2022-08-07 23:32:00'),
(473, NULL, 2, '2022-08-07 16:32:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:32:10', '2022-08-07 23:32:10'),
(474, NULL, 2, '2022-08-07 16:32:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:32:20', '2022-08-07 23:32:20'),
(475, NULL, 2, '2022-08-07 16:32:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:32:30', '2022-08-07 23:32:30'),
(476, NULL, 2, '2022-08-07 16:32:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:32:40', '2022-08-07 23:32:40'),
(477, NULL, 2, '2022-08-07 16:32:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:32:50', '2022-08-07 23:32:50'),
(478, NULL, 2, '2022-08-07 16:33:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:33:00', '2022-08-07 23:33:00'),
(479, NULL, 2, '2022-08-07 16:33:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:33:10', '2022-08-07 23:33:10'),
(480, NULL, 2, '2022-08-07 16:33:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:33:20', '2022-08-07 23:33:20'),
(481, NULL, 2, '2022-08-07 16:33:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:33:30', '2022-08-07 23:33:30'),
(482, NULL, 2, '2022-08-07 16:33:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:33:40', '2022-08-07 23:33:40'),
(483, NULL, 2, '2022-08-07 16:33:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:33:51', '2022-08-07 23:33:51'),
(484, NULL, 2, '2022-08-07 16:34:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:34:01', '2022-08-07 23:34:01'),
(485, NULL, 2, '2022-08-07 16:34:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:34:11', '2022-08-07 23:34:11'),
(486, NULL, 2, '2022-08-07 16:34:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:34:21', '2022-08-07 23:34:21'),
(487, NULL, 2, '2022-08-07 16:34:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:34:30', '2022-08-07 23:34:30'),
(488, NULL, 2, '2022-08-07 16:34:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:34:41', '2022-08-07 23:34:41'),
(489, NULL, 2, '2022-08-07 16:34:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:34:51', '2022-08-07 23:34:51'),
(490, NULL, 2, '2022-08-07 16:35:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:35:01', '2022-08-07 23:35:01'),
(491, NULL, 2, '2022-08-07 16:35:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:35:11', '2022-08-07 23:35:11'),
(492, NULL, 2, '2022-08-07 16:35:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:35:21', '2022-08-07 23:35:21'),
(493, NULL, 2, '2022-08-07 16:35:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:35:30', '2022-08-07 23:35:30'),
(494, NULL, 2, '2022-08-07 16:35:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:35:41', '2022-08-07 23:35:41'),
(495, NULL, 2, '2022-08-07 16:35:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:35:50', '2022-08-07 23:35:50'),
(496, NULL, 2, '2022-08-07 16:36:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:36:00', '2022-08-07 23:36:00'),
(497, NULL, 2, '2022-08-07 16:36:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:36:10', '2022-08-07 23:36:10'),
(498, NULL, 2, '2022-08-07 16:36:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:36:20', '2022-08-07 23:36:20'),
(499, NULL, 2, '2022-08-07 16:36:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:36:31', '2022-08-07 23:36:31'),
(500, NULL, 2, '2022-08-07 16:36:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:36:40', '2022-08-07 23:36:40'),
(501, NULL, 2, '2022-08-07 16:36:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:36:50', '2022-08-07 23:36:50'),
(502, NULL, 2, '2022-08-07 16:37:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:37:00', '2022-08-07 23:37:00'),
(503, NULL, 2, '2022-08-07 16:37:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:37:10', '2022-08-07 23:37:10'),
(504, NULL, 2, '2022-08-07 16:37:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:37:20', '2022-08-07 23:37:20'),
(505, NULL, 2, '2022-08-07 16:37:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:37:30', '2022-08-07 23:37:30'),
(506, NULL, 2, '2022-08-07 16:37:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:37:41', '2022-08-07 23:37:41'),
(507, NULL, 2, '2022-08-07 16:37:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:37:51', '2022-08-07 23:37:51'),
(508, NULL, 2, '2022-08-07 16:38:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:38:00', '2022-08-07 23:38:00'),
(509, NULL, 2, '2022-08-07 16:38:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:38:10', '2022-08-07 23:38:10'),
(510, NULL, 2, '2022-08-07 16:38:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:38:21', '2022-08-07 23:38:21'),
(511, NULL, 2, '2022-08-07 16:38:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:38:31', '2022-08-07 23:38:31'),
(512, NULL, 2, '2022-08-07 16:38:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:38:40', '2022-08-07 23:38:40'),
(513, NULL, 2, '2022-08-07 16:38:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:38:51', '2022-08-07 23:38:51'),
(514, NULL, 2, '2022-08-07 16:39:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:39:01', '2022-08-07 23:39:01'),
(515, NULL, 2, '2022-08-07 16:39:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:39:11', '2022-08-07 23:39:11'),
(516, NULL, 2, '2022-08-07 16:39:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:39:20', '2022-08-07 23:39:20'),
(517, NULL, 2, '2022-08-07 16:39:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:39:31', '2022-08-07 23:39:31'),
(518, NULL, 2, '2022-08-07 16:39:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:39:40', '2022-08-07 23:39:40'),
(519, NULL, 2, '2022-08-07 16:39:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:39:51', '2022-08-07 23:39:51'),
(520, NULL, 2, '2022-08-07 16:40:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:40:00', '2022-08-07 23:40:00'),
(521, NULL, 2, '2022-08-07 16:40:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:40:10', '2022-08-07 23:40:10'),
(522, NULL, 2, '2022-08-07 16:40:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:40:20', '2022-08-07 23:40:20'),
(523, NULL, 2, '2022-08-07 16:40:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:40:31', '2022-08-07 23:40:31'),
(524, NULL, 2, '2022-08-07 16:40:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:40:40', '2022-08-07 23:40:40'),
(525, NULL, 2, '2022-08-07 16:40:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:40:50', '2022-08-07 23:40:50'),
(526, NULL, 2, '2022-08-07 16:41:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:41:00', '2022-08-07 23:41:00'),
(527, NULL, 2, '2022-08-07 16:41:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:41:10', '2022-08-07 23:41:10'),
(528, NULL, 2, '2022-08-07 16:41:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:41:21', '2022-08-07 23:41:21'),
(529, NULL, 2, '2022-08-07 16:41:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:41:31', '2022-08-07 23:41:31'),
(530, NULL, 2, '2022-08-07 16:41:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:41:40', '2022-08-07 23:41:40'),
(531, NULL, 2, '2022-08-07 16:41:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:41:51', '2022-08-07 23:41:51'),
(532, NULL, 2, '2022-08-07 16:42:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:42:00', '2022-08-07 23:42:00'),
(533, NULL, 2, '2022-08-07 16:42:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:42:10', '2022-08-07 23:42:10'),
(534, NULL, 2, '2022-08-07 16:42:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:42:20', '2022-08-07 23:42:20'),
(535, NULL, 2, '2022-08-07 16:42:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:42:30', '2022-08-07 23:42:30'),
(536, NULL, 2, '2022-08-07 16:42:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:42:40', '2022-08-07 23:42:40'),
(537, NULL, 2, '2022-08-07 16:42:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:42:50', '2022-08-07 23:42:50'),
(538, NULL, 2, '2022-08-07 16:43:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:43:01', '2022-08-07 23:43:01'),
(539, NULL, 2, '2022-08-07 16:43:10', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:43:10', '2022-08-07 23:43:10'),
(540, NULL, 2, '2022-08-07 16:43:20', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:43:20', '2022-08-07 23:43:20'),
(541, NULL, 2, '2022-08-07 16:43:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:43:30', '2022-08-07 23:43:30'),
(542, NULL, 2, '2022-08-07 16:43:40', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:43:40', '2022-08-07 23:43:40'),
(543, NULL, 2, '2022-08-07 16:43:50', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:43:50', '2022-08-07 23:43:50'),
(544, NULL, 2, '2022-08-07 16:44:00', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:44:00', '2022-08-07 23:44:00'),
(545, NULL, 2, '2022-08-07 16:44:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:44:11', '2022-08-07 23:44:11'),
(546, NULL, 2, '2022-08-07 16:44:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:44:21', '2022-08-07 23:44:21'),
(547, NULL, 2, '2022-08-07 16:44:30', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:44:30', '2022-08-07 23:44:30'),
(548, NULL, 2, '2022-08-07 16:44:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:44:42', '2022-08-07 23:44:42'),
(549, NULL, 2, '2022-08-07 16:44:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:44:52', '2022-08-07 23:44:52'),
(550, NULL, 2, '2022-08-07 16:45:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:45:03', '2022-08-07 23:45:03'),
(551, NULL, 2, '2022-08-07 16:45:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:45:12', '2022-08-07 23:45:12'),
(552, NULL, 2, '2022-08-07 16:45:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:45:23', '2022-08-07 23:45:23'),
(553, NULL, 2, '2022-08-07 16:45:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:45:32', '2022-08-07 23:45:32'),
(554, NULL, 2, '2022-08-07 16:45:43', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:45:43', '2022-08-07 23:45:43'),
(555, NULL, 2, '2022-08-07 16:45:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:45:52', '2022-08-07 23:45:52'),
(556, NULL, 2, '2022-08-07 16:46:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:46:02', '2022-08-07 23:46:02'),
(557, NULL, 2, '2022-08-07 16:46:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:46:12', '2022-08-07 23:46:12'),
(558, NULL, 2, '2022-08-07 16:46:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:46:22', '2022-08-07 23:46:22'),
(559, NULL, 2, '2022-08-07 16:46:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:46:32', '2022-08-07 23:46:32'),
(560, NULL, 2, '2022-08-07 16:46:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:46:42', '2022-08-07 23:46:42'),
(561, NULL, 2, '2022-08-07 16:46:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:46:52', '2022-08-07 23:46:52'),
(562, NULL, 2, '2022-08-07 16:47:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:47:02', '2022-08-07 23:47:02'),
(563, NULL, 2, '2022-08-07 16:47:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:47:12', '2022-08-07 23:47:12'),
(564, NULL, 2, '2022-08-07 16:47:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:47:22', '2022-08-07 23:47:22'),
(565, NULL, 2, '2022-08-07 16:47:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:47:32', '2022-08-07 23:47:32'),
(566, NULL, 2, '2022-08-07 16:47:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:47:42', '2022-08-07 23:47:42'),
(567, NULL, 2, '2022-08-07 16:47:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:47:52', '2022-08-07 23:47:52'),
(568, NULL, 2, '2022-08-07 16:48:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:48:02', '2022-08-07 23:48:02'),
(569, NULL, 2, '2022-08-07 16:48:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:48:12', '2022-08-07 23:48:12'),
(570, NULL, 2, '2022-08-07 16:48:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:48:22', '2022-08-07 23:48:22'),
(571, NULL, 2, '2022-08-07 16:48:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:48:32', '2022-08-07 23:48:32'),
(572, NULL, 2, '2022-08-07 16:48:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:48:42', '2022-08-07 23:48:42'),
(573, NULL, 2, '2022-08-07 16:48:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:48:52', '2022-08-07 23:48:52'),
(574, NULL, 2, '2022-08-07 16:49:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:49:02', '2022-08-07 23:49:02'),
(575, NULL, 2, '2022-08-07 16:49:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:49:12', '2022-08-07 23:49:12'),
(576, NULL, 2, '2022-08-07 16:49:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:49:22', '2022-08-07 23:49:22'),
(577, NULL, 2, '2022-08-07 16:49:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:49:32', '2022-08-07 23:49:32'),
(578, NULL, 2, '2022-08-07 16:49:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:49:42', '2022-08-07 23:49:42'),
(579, NULL, 2, '2022-08-07 16:49:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:49:52', '2022-08-07 23:49:52'),
(580, NULL, 2, '2022-08-07 16:50:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:50:02', '2022-08-07 23:50:02'),
(581, NULL, 2, '2022-08-07 16:50:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:50:12', '2022-08-07 23:50:12'),
(582, NULL, 2, '2022-08-07 16:50:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:50:22', '2022-08-07 23:50:22'),
(583, NULL, 2, '2022-08-07 16:50:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:50:32', '2022-08-07 23:50:32'),
(584, NULL, 2, '2022-08-07 16:50:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:50:42', '2022-08-07 23:50:42'),
(585, NULL, 2, '2022-08-07 16:50:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:50:52', '2022-08-07 23:50:52'),
(586, NULL, 2, '2022-08-07 16:51:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:51:02', '2022-08-07 23:51:02'),
(587, NULL, 2, '2022-08-07 16:51:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:51:12', '2022-08-07 23:51:12'),
(588, NULL, 2, '2022-08-07 16:51:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:51:22', '2022-08-07 23:51:22'),
(589, NULL, 2, '2022-08-07 16:51:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:51:32', '2022-08-07 23:51:32'),
(590, NULL, 2, '2022-08-07 16:51:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:51:42', '2022-08-07 23:51:42'),
(591, NULL, 2, '2022-08-07 16:51:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:51:52', '2022-08-07 23:51:52'),
(592, NULL, 2, '2022-08-07 16:52:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:52:02', '2022-08-07 23:52:02'),
(593, NULL, 2, '2022-08-07 16:52:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:52:12', '2022-08-07 23:52:12'),
(594, NULL, 2, '2022-08-07 16:52:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:52:22', '2022-08-07 23:52:22'),
(595, NULL, 2, '2022-08-07 16:52:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:52:32', '2022-08-07 23:52:32'),
(596, NULL, 2, '2022-08-07 16:52:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:52:42', '2022-08-07 23:52:42'),
(597, NULL, 2, '2022-08-07 16:52:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:52:52', '2022-08-07 23:52:52'),
(598, NULL, 2, '2022-08-07 16:53:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:53:02', '2022-08-07 23:53:02'),
(599, NULL, 2, '2022-08-07 16:53:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:53:12', '2022-08-07 23:53:12'),
(600, NULL, 2, '2022-08-07 16:53:23', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:53:23', '2022-08-07 23:53:23'),
(601, NULL, 2, '2022-08-07 16:53:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:53:32', '2022-08-07 23:53:32'),
(602, NULL, 2, '2022-08-07 16:53:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:53:42', '2022-08-07 23:53:42'),
(603, NULL, 2, '2022-08-07 16:53:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:53:52', '2022-08-07 23:53:52'),
(604, NULL, 2, '2022-08-07 16:54:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:54:02', '2022-08-07 23:54:02'),
(605, NULL, 2, '2022-08-07 16:54:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:54:12', '2022-08-07 23:54:12'),
(606, NULL, 2, '2022-08-07 16:54:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:54:22', '2022-08-07 23:54:22'),
(607, NULL, 2, '2022-08-07 16:54:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:54:32', '2022-08-07 23:54:32'),
(608, NULL, 2, '2022-08-07 16:54:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:54:42', '2022-08-07 23:54:42'),
(609, NULL, 2, '2022-08-07 16:54:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:54:52', '2022-08-07 23:54:52'),
(610, NULL, 2, '2022-08-07 16:55:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:55:02', '2022-08-07 23:55:02'),
(611, NULL, 2, '2022-08-07 16:55:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:55:12', '2022-08-07 23:55:12'),
(612, NULL, 2, '2022-08-07 16:55:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:55:22', '2022-08-07 23:55:22'),
(613, NULL, 2, '2022-08-07 16:55:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:55:32', '2022-08-07 23:55:32'),
(614, NULL, 2, '2022-08-07 16:55:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:55:42', '2022-08-07 23:55:42'),
(615, NULL, 2, '2022-08-07 16:55:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:55:52', '2022-08-07 23:55:52'),
(616, NULL, 2, '2022-08-07 16:56:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:56:02', '2022-08-07 23:56:02'),
(617, NULL, 2, '2022-08-07 16:56:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:56:12', '2022-08-07 23:56:12'),
(618, NULL, 2, '2022-08-07 16:56:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:56:22', '2022-08-07 23:56:22'),
(619, NULL, 2, '2022-08-07 16:56:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:56:32', '2022-08-07 23:56:32'),
(620, NULL, 2, '2022-08-07 16:56:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:56:42', '2022-08-07 23:56:42'),
(621, NULL, 2, '2022-08-07 16:56:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:56:52', '2022-08-07 23:56:52'),
(622, NULL, 2, '2022-08-07 16:57:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:57:02', '2022-08-07 23:57:02'),
(623, NULL, 2, '2022-08-07 16:57:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:57:12', '2022-08-07 23:57:12'),
(624, NULL, 2, '2022-08-07 16:57:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:57:22', '2022-08-07 23:57:22'),
(625, NULL, 2, '2022-08-07 16:57:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:57:32', '2022-08-07 23:57:32'),
(626, NULL, 2, '2022-08-07 16:57:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:57:42', '2022-08-07 23:57:42'),
(627, NULL, 2, '2022-08-07 16:57:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:57:52', '2022-08-07 23:57:52'),
(628, NULL, 2, '2022-08-07 16:58:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:58:03', '2022-08-07 23:58:03'),
(629, NULL, 2, '2022-08-07 16:58:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:58:12', '2022-08-07 23:58:12'),
(630, NULL, 2, '2022-08-07 16:58:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:58:22', '2022-08-07 23:58:22'),
(631, NULL, 2, '2022-08-07 16:58:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:58:32', '2022-08-07 23:58:32'),
(632, NULL, 2, '2022-08-07 16:58:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:58:42', '2022-08-07 23:58:42'),
(633, NULL, 2, '2022-08-07 16:58:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:58:52', '2022-08-07 23:58:52'),
(634, NULL, 2, '2022-08-07 16:59:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:59:02', '2022-08-07 23:59:02'),
(635, NULL, 2, '2022-08-07 16:59:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:59:12', '2022-08-07 23:59:12'),
(636, NULL, 2, '2022-08-07 16:59:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:59:22', '2022-08-07 23:59:22'),
(637, NULL, 2, '2022-08-07 16:59:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:59:32', '2022-08-07 23:59:32'),
(638, NULL, 2, '2022-08-07 16:59:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:59:42', '2022-08-07 23:59:42'),
(639, NULL, 2, '2022-08-07 16:59:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-07 23:59:52', '2022-08-07 23:59:52'),
(640, NULL, 2, '2022-08-07 17:00:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:00:02', '2022-08-08 00:00:02'),
(641, NULL, 2, '2022-08-07 17:00:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:00:12', '2022-08-08 00:00:12'),
(642, NULL, 2, '2022-08-07 17:00:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:00:22', '2022-08-08 00:00:22'),
(643, NULL, 2, '2022-08-07 17:00:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:00:32', '2022-08-08 00:00:32'),
(644, NULL, 2, '2022-08-07 17:00:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:00:42', '2022-08-08 00:00:42'),
(645, NULL, 2, '2022-08-07 17:00:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:00:52', '2022-08-08 00:00:52'),
(646, NULL, 2, '2022-08-07 17:01:03', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:01:03', '2022-08-08 00:01:03'),
(647, NULL, 2, '2022-08-07 17:01:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:01:12', '2022-08-08 00:01:12'),
(648, NULL, 2, '2022-08-07 17:01:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:01:22', '2022-08-08 00:01:22'),
(649, NULL, 2, '2022-08-07 17:01:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:01:32', '2022-08-08 00:01:32'),
(650, NULL, 2, '2022-08-07 17:01:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:01:42', '2022-08-08 00:01:42'),
(651, NULL, 2, '2022-08-07 17:01:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:01:52', '2022-08-08 00:01:52'),
(652, NULL, 2, '2022-08-07 17:02:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:02:02', '2022-08-08 00:02:02'),
(653, NULL, 2, '2022-08-07 17:02:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:02:12', '2022-08-08 00:02:12'),
(654, NULL, 2, '2022-08-07 17:02:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:02:22', '2022-08-08 00:02:22'),
(655, NULL, 2, '2022-08-07 17:02:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:02:32', '2022-08-08 00:02:32'),
(656, NULL, 2, '2022-08-07 17:02:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:02:42', '2022-08-08 00:02:42'),
(657, NULL, 2, '2022-08-07 17:02:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:02:52', '2022-08-08 00:02:52'),
(658, NULL, 2, '2022-08-07 17:03:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:03:02', '2022-08-08 00:03:02'),
(659, NULL, 2, '2022-08-07 17:03:12', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:03:12', '2022-08-08 00:03:12'),
(660, NULL, 2, '2022-08-07 17:03:22', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:03:22', '2022-08-08 00:03:22'),
(661, NULL, 2, '2022-08-07 17:03:32', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:03:32', '2022-08-08 00:03:32'),
(662, NULL, 2, '2022-08-07 17:03:42', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:03:42', '2022-08-08 00:03:42'),
(663, NULL, 2, '2022-08-07 17:03:52', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:03:52', '2022-08-08 00:03:52'),
(664, NULL, 2, '2022-08-07 17:04:02', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 00:04:02', '2022-08-08 00:04:02'),
(665, NULL, 2, '2022-08-07 20:00:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:00:41', '2022-08-08 03:00:41'),
(666, NULL, 2, '2022-08-07 20:00:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:00:51', '2022-08-08 03:00:51'),
(667, NULL, 2, '2022-08-07 20:01:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:01:01', '2022-08-08 03:01:01'),
(668, NULL, 2, '2022-08-07 20:01:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:01:11', '2022-08-08 03:01:11'),
(669, NULL, 2, '2022-08-07 20:01:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:01:21', '2022-08-08 03:01:21'),
(670, NULL, 2, '2022-08-07 20:01:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:01:31', '2022-08-08 03:01:31'),
(671, NULL, 2, '2022-08-07 20:01:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:01:41', '2022-08-08 03:01:41'),
(672, NULL, 2, '2022-08-07 20:01:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:01:51', '2022-08-08 03:01:51'),
(673, NULL, 2, '2022-08-07 20:02:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:02:01', '2022-08-08 03:02:01'),
(674, NULL, 2, '2022-08-07 20:02:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:02:11', '2022-08-08 03:02:11'),
(675, NULL, 2, '2022-08-07 20:02:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:02:21', '2022-08-08 03:02:21'),
(676, NULL, 2, '2022-08-07 20:02:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:02:31', '2022-08-08 03:02:31'),
(677, NULL, 2, '2022-08-07 20:02:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:02:41', '2022-08-08 03:02:41'),
(678, NULL, 2, '2022-08-07 20:02:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:02:51', '2022-08-08 03:02:51'),
(679, NULL, 2, '2022-08-07 20:03:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:03:01', '2022-08-08 03:03:01'),
(680, NULL, 2, '2022-08-07 20:03:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:03:11', '2022-08-08 03:03:11'),
(681, NULL, 2, '2022-08-07 20:03:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:03:21', '2022-08-08 03:03:21'),
(682, NULL, 2, '2022-08-07 20:03:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:03:31', '2022-08-08 03:03:31'),
(683, NULL, 2, '2022-08-07 20:03:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:03:41', '2022-08-08 03:03:41'),
(684, NULL, 2, '2022-08-07 20:03:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:03:51', '2022-08-08 03:03:51'),
(685, NULL, 2, '2022-08-07 20:04:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:04:01', '2022-08-08 03:04:01'),
(686, NULL, 2, '2022-08-07 20:04:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:04:11', '2022-08-08 03:04:11'),
(687, NULL, 2, '2022-08-07 20:04:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:04:21', '2022-08-08 03:04:21'),
(688, NULL, 2, '2022-08-07 20:04:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:04:31', '2022-08-08 03:04:31'),
(689, NULL, 2, '2022-08-07 20:04:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:04:41', '2022-08-08 03:04:41'),
(690, NULL, 2, '2022-08-07 20:04:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:04:51', '2022-08-08 03:04:51'),
(691, NULL, 2, '2022-08-07 20:05:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:05:01', '2022-08-08 03:05:01'),
(692, NULL, 2, '2022-08-07 20:05:11', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:05:11', '2022-08-08 03:05:11'),
(693, NULL, 2, '2022-08-07 20:05:21', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:05:21', '2022-08-08 03:05:21');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(694, NULL, 2, '2022-08-07 20:05:31', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:05:31', '2022-08-08 03:05:31'),
(695, NULL, 2, '2022-08-07 20:05:41', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:05:41', '2022-08-08 03:05:41'),
(696, NULL, 2, '2022-08-07 20:05:51', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:05:51', '2022-08-08 03:05:51'),
(697, NULL, 2, '2022-08-07 20:06:01', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:06:01', '2022-08-08 03:06:01'),
(698, NULL, 2, '2022-08-07 20:06:35', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:06:35', '2022-08-08 03:06:35'),
(699, NULL, 2, '2022-08-07 20:06:45', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:06:45', '2022-08-08 03:06:45'),
(700, NULL, 2, '2022-08-07 20:06:55', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:06:55', '2022-08-08 03:06:55'),
(701, NULL, 2, '2022-08-07 20:07:05', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:07:05', '2022-08-08 03:07:05'),
(702, NULL, 2, '2022-08-07 20:07:15', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:07:15', '2022-08-08 03:07:15'),
(703, NULL, 2, '2022-08-07 20:07:25', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:07:25', '2022-08-08 03:07:25'),
(704, NULL, 2, '2022-08-07 20:07:45', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:07:45', '2022-08-08 03:07:45'),
(705, NULL, 2, '2022-08-07 20:07:55', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:07:55', '2022-08-08 03:07:55'),
(706, NULL, 2, '2022-08-07 20:08:05', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:08:05', '2022-08-08 03:08:05'),
(707, NULL, 2, '2022-08-07 20:08:15', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:08:15', '2022-08-08 03:08:15'),
(708, NULL, 2, '2022-08-07 20:08:25', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:08:25', '2022-08-08 03:08:25'),
(709, NULL, 2, '2022-08-07 20:08:35', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:08:35', '2022-08-08 03:08:35'),
(710, NULL, 2, '2022-08-07 20:08:45', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:08:45', '2022-08-08 03:08:45'),
(711, NULL, 2, '2022-08-07 20:08:55', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:08:55', '2022-08-08 03:08:55'),
(712, NULL, 2, '2022-08-07 20:09:05', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:09:05', '2022-08-08 03:09:05'),
(713, NULL, 2, '2022-08-07 20:09:15', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:09:15', '2022-08-08 03:09:15'),
(714, NULL, 2, '2022-08-07 20:09:25', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:09:25', '2022-08-08 03:09:25'),
(715, NULL, 2, '2022-08-07 20:09:35', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:09:35', '2022-08-08 03:09:35'),
(716, NULL, 2, '2022-08-07 20:09:45', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:09:45', '2022-08-08 03:09:45'),
(717, NULL, 2, '2022-08-07 20:09:55', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:09:55', '2022-08-08 03:09:55'),
(718, NULL, 2, '2022-08-07 20:10:05', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:10:05', '2022-08-08 03:10:05'),
(719, NULL, 2, '2022-08-07 20:10:15', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:10:15', '2022-08-08 03:10:15'),
(720, NULL, 2, '2022-08-07 20:10:25', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:10:25', '2022-08-08 03:10:25'),
(721, NULL, 2, '2022-08-07 20:10:35', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:10:35', '2022-08-08 03:10:35'),
(722, NULL, 2, '2022-08-07 20:10:45', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:10:45', '2022-08-08 03:10:45'),
(723, NULL, 2, '2022-08-07 20:10:55', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:10:55', '2022-08-08 03:10:55'),
(724, NULL, 2, '2022-08-07 20:11:06', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:11:06', '2022-08-08 03:11:06'),
(725, NULL, 2, '2022-08-07 20:11:15', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:11:15', '2022-08-08 03:11:15'),
(726, NULL, 2, '2022-08-07 20:11:25', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:11:25', '2022-08-08 03:11:25'),
(727, NULL, 2, '2022-08-07 20:11:35', '-122.083922', '37.4220936', '1650, Santa Clara County, US', '2022-08-08 03:11:35', '2022-08-08 03:11:35'),
(728, NULL, 2, '2022-08-07 23:25:03', '31.3521259', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:25:03', '2022-08-08 06:25:03'),
(729, NULL, 2, '2022-08-07 23:25:15', '31.3521119', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:25:15', '2022-08-08 06:25:15'),
(730, NULL, 2, '2022-08-07 23:25:45', '31.352206', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:25:45', '2022-08-08 06:25:45'),
(731, NULL, 2, '2022-08-07 23:25:55', '31.3522087', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:25:55', '2022-08-08 06:25:55'),
(732, NULL, 2, '2022-08-07 23:26:05', '31.3521555', '30.1790519', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:26:05', '2022-08-08 06:26:05'),
(733, NULL, 2, '2022-08-07 23:26:15', '31.3521345', '30.1790519', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:26:15', '2022-08-08 06:26:15'),
(734, NULL, 2, '2022-08-07 23:26:25', '31.3522064', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:26:25', '2022-08-08 06:26:25'),
(735, NULL, 2, '2022-08-07 23:26:34', '31.3521485', '30.17905', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:26:34', '2022-08-08 06:26:34'),
(736, NULL, 2, '2022-08-07 23:26:45', '31.352137', '30.1790523', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:26:45', '2022-08-08 06:26:45'),
(737, NULL, 2, '2022-08-07 23:26:55', '31.3521511', '30.1790515', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:26:55', '2022-08-08 06:26:55'),
(738, NULL, 2, '2022-08-07 23:27:05', '31.3521933', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:27:05', '2022-08-08 06:27:05'),
(739, NULL, 2, '2022-08-07 23:27:15', '31.3522122', '30.1790482', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:27:15', '2022-08-08 06:27:15'),
(740, NULL, 2, '2022-08-07 23:27:25', '31.3521798', '30.179048', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:27:25', '2022-08-08 06:27:25'),
(741, NULL, 2, '2022-08-07 23:27:35', '31.3521565', '30.1790509', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:27:35', '2022-08-08 06:27:35'),
(742, NULL, 2, '2022-08-07 23:27:45', '31.3521644', '30.1790464', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:27:45', '2022-08-08 06:27:45'),
(743, NULL, 2, '2022-08-07 23:27:58', '31.3521738', '30.179045', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:27:58', '2022-08-08 06:27:58'),
(744, NULL, 2, '2022-08-07 23:28:05', '31.3522121', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:28:05', '2022-08-08 06:28:05'),
(745, NULL, 2, '2022-08-07 23:28:15', '31.35218', '30.1790502', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:28:15', '2022-08-08 06:28:15'),
(746, NULL, 2, '2022-08-07 23:28:25', '31.3521557', '30.1790503', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:28:25', '2022-08-08 06:28:25'),
(747, NULL, 2, '2022-08-07 23:28:35', '31.3522109', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:28:35', '2022-08-08 06:28:35'),
(748, NULL, 2, '2022-08-07 23:28:45', '31.3521769', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:28:45', '2022-08-08 06:28:45'),
(749, NULL, 2, '2022-08-07 23:28:54', '31.3521691', '30.1790487', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:28:54', '2022-08-08 06:28:54'),
(750, NULL, 2, '2022-08-07 23:29:04', '31.3521801', '30.1790506', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:29:04', '2022-08-08 06:29:04'),
(751, NULL, 2, '2022-08-07 23:29:15', '31.3521516', '30.1790496', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:29:15', '2022-08-08 06:29:15'),
(752, NULL, 2, '2022-08-07 23:29:24', '31.3521888', '30.1790446', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:29:24', '2022-08-08 06:29:24'),
(753, NULL, 2, '2022-08-07 23:29:35', '31.3521977', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:29:35', '2022-08-08 06:29:35'),
(754, NULL, 2, '2022-08-07 23:29:44', '31.3521809', '30.1790448', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:29:44', '2022-08-08 06:29:44'),
(755, NULL, 2, '2022-08-07 23:29:55', '31.3521543', '30.1790498', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:29:55', '2022-08-08 06:29:55'),
(756, NULL, 2, '2022-08-07 23:30:22', '31.3521739', '30.1790451', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:30:22', '2022-08-08 06:30:22'),
(757, NULL, 2, '2022-08-07 23:30:31', '31.3521739', '30.1790451', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:30:31', '2022-08-08 06:30:31'),
(758, NULL, 2, '2022-08-07 23:30:41', '31.3521661', '30.1790468', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:30:41', '2022-08-08 06:30:41'),
(759, NULL, 2, '2022-08-07 23:30:51', '31.3522132', '30.1790525', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:30:51', '2022-08-08 06:30:51'),
(760, NULL, 2, '2022-08-07 23:31:21', '31.3521254', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:31:21', '2022-08-08 06:31:21'),
(761, NULL, 2, '2022-08-07 23:31:31', '31.3521111', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:31:31', '2022-08-08 06:31:31'),
(762, NULL, 2, '2022-08-07 23:31:41', '31.3521264', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:31:41', '2022-08-08 06:31:41'),
(763, NULL, 2, '2022-08-07 23:31:51', '31.3521137', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:31:51', '2022-08-08 06:31:51'),
(764, NULL, 2, '2022-08-07 23:32:02', '31.352114', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:32:02', '2022-08-08 06:32:02'),
(765, NULL, 2, '2022-08-07 23:32:11', '31.352109', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:32:11', '2022-08-08 06:32:11'),
(766, NULL, 2, '2022-08-07 23:32:22', '31.3521072', '30.1790589', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:32:22', '2022-08-08 06:32:22'),
(767, NULL, 2, '2022-08-07 23:32:32', '31.3521141', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:32:32', '2022-08-08 06:32:32'),
(768, NULL, 2, '2022-08-07 23:32:42', '31.3521147', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:32:42', '2022-08-08 06:32:42'),
(769, NULL, 2, '2022-08-07 23:32:52', '31.3521093', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:32:52', '2022-08-08 06:32:52'),
(770, NULL, 2, '2022-08-07 23:33:01', '31.3521138', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:33:01', '2022-08-08 06:33:01'),
(771, NULL, 2, '2022-08-07 23:33:11', '31.3521123', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:33:11', '2022-08-08 06:33:11'),
(772, NULL, 2, '2022-08-07 23:33:21', '31.3521133', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:33:21', '2022-08-08 06:33:21'),
(773, NULL, 2, '2022-08-07 23:33:32', '31.3521199', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:33:32', '2022-08-08 06:33:32'),
(774, NULL, 2, '2022-08-07 23:33:42', '31.3521151', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:33:42', '2022-08-08 06:33:42'),
(775, NULL, 2, '2022-08-07 23:33:52', '31.3521183', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:33:52', '2022-08-08 06:33:52'),
(776, NULL, 2, '2022-08-07 23:34:01', '31.3521146', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:34:01', '2022-08-08 06:34:01'),
(777, NULL, 2, '2022-08-07 23:34:11', '31.3521165', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:34:11', '2022-08-08 06:34:11'),
(778, NULL, 2, '2022-08-07 23:34:22', '31.352114', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:34:22', '2022-08-08 06:34:22'),
(779, NULL, 2, '2022-08-07 23:34:31', '31.3521095', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:34:31', '2022-08-08 06:34:31'),
(780, NULL, 2, '2022-08-07 23:34:41', '31.3521868', '30.1790441', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:34:41', '2022-08-08 06:34:41'),
(781, NULL, 2, '2022-08-07 23:34:51', '31.3521214', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:34:51', '2022-08-08 06:34:51'),
(782, NULL, 2, '2022-08-07 23:35:02', '31.3521129', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:35:02', '2022-08-08 06:35:02'),
(783, NULL, 2, '2022-08-07 23:35:12', '31.3521086', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:35:12', '2022-08-08 06:35:12'),
(784, NULL, 2, '2022-08-07 23:35:21', '31.352112', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:35:21', '2022-08-08 06:35:21'),
(785, NULL, 2, '2022-08-07 23:35:31', '31.3521133', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:35:31', '2022-08-08 06:35:31'),
(786, NULL, 2, '2022-08-07 23:35:41', '31.3521134', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:35:41', '2022-08-08 06:35:41'),
(787, NULL, 2, '2022-08-07 23:35:51', '31.3521172', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:35:51', '2022-08-08 06:35:51'),
(788, NULL, 2, '2022-08-07 23:36:01', '31.3521154', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:36:01', '2022-08-08 06:36:01'),
(789, NULL, 2, '2022-08-07 23:36:11', '31.3521133', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:36:11', '2022-08-08 06:36:11'),
(790, NULL, 2, '2022-08-07 23:36:21', '31.3522062', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:36:21', '2022-08-08 06:36:21'),
(791, NULL, 2, '2022-08-07 23:36:32', '31.3522115', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:36:32', '2022-08-08 06:36:32'),
(792, NULL, 2, '2022-08-07 23:36:42', '31.3521128', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:36:42', '2022-08-08 06:36:42'),
(793, NULL, 2, '2022-08-07 23:36:52', '31.3521035', '30.1790557', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:36:52', '2022-08-08 06:36:52'),
(794, NULL, 2, '2022-08-07 23:37:01', '31.3521159', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:37:01', '2022-08-08 06:37:01'),
(795, NULL, 2, '2022-08-07 23:37:11', '31.3521156', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:37:11', '2022-08-08 06:37:11'),
(796, NULL, 2, '2022-08-07 23:37:22', '31.3521014', '30.1790558', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:37:22', '2022-08-08 06:37:22'),
(797, NULL, 2, '2022-08-07 23:37:32', '31.3521085', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:37:32', '2022-08-08 06:37:32'),
(798, NULL, 2, '2022-08-07 23:37:42', '31.3521182', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:37:42', '2022-08-08 06:37:42'),
(799, NULL, 2, '2022-08-07 23:37:52', '31.3521096', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:37:52', '2022-08-08 06:37:52'),
(800, NULL, 2, '2022-08-07 23:38:02', '31.3521141', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:38:02', '2022-08-08 06:38:02'),
(801, NULL, 2, '2022-08-07 23:38:12', '31.3521577', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:38:12', '2022-08-08 06:38:12'),
(802, NULL, 2, '2022-08-07 23:38:22', '31.3521706', '30.1790604', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:38:22', '2022-08-08 06:38:22'),
(803, NULL, 2, '2022-08-07 23:38:32', '31.3521097', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:38:32', '2022-08-08 06:38:32'),
(804, NULL, 2, '2022-08-07 23:38:42', '31.3521508', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:38:42', '2022-08-08 06:38:42'),
(805, NULL, 2, '2022-08-07 23:38:52', '31.3521608', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:38:52', '2022-08-08 06:38:52'),
(806, NULL, 2, '2022-08-07 23:39:02', '31.3521148', '30.1790618', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:39:02', '2022-08-08 06:39:02'),
(807, NULL, 2, '2022-08-07 23:39:13', '31.352112', '30.179061', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:39:13', '2022-08-08 06:39:13'),
(808, NULL, 2, '2022-08-07 23:39:32', '31.3521052', '30.1790578', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:39:32', '2022-08-08 06:39:32'),
(809, NULL, 2, '2022-08-07 23:39:43', '31.3521069', '30.179058', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:39:43', '2022-08-08 06:39:43'),
(810, NULL, 2, '2022-08-07 23:39:52', '31.3521064', '30.179057', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:39:52', '2022-08-08 06:39:52'),
(811, NULL, 2, '2022-08-07 23:40:02', '31.3521734', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:40:02', '2022-08-08 06:40:02'),
(812, NULL, 2, '2022-08-07 23:40:12', '31.3521685', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:40:12', '2022-08-08 06:40:12'),
(813, NULL, 2, '2022-08-07 23:40:22', '31.3521188', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:40:22', '2022-08-08 06:40:22'),
(814, NULL, 2, '2022-08-07 23:40:41', '31.3521534', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:40:41', '2022-08-08 06:40:41'),
(815, NULL, 2, '2022-08-07 23:40:51', '31.3521199', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:40:51', '2022-08-08 06:40:51'),
(816, NULL, 2, '2022-08-07 23:41:00', '31.3521323', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:41:00', '2022-08-08 06:41:00'),
(817, NULL, 2, '2022-08-07 23:41:11', '31.3521125', '30.1790636', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:41:11', '2022-08-08 06:41:11'),
(818, NULL, 2, '2022-08-07 23:41:22', '31.3521524', '30.1790846', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:41:22', '2022-08-08 06:41:22'),
(819, NULL, 2, '2022-08-07 23:41:31', '31.3521972', '30.1790676', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:41:31', '2022-08-08 06:41:31'),
(820, NULL, 2, '2022-08-07 23:41:40', '31.3521917', '30.1790469', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:41:40', '2022-08-08 06:41:40'),
(821, NULL, 2, '2022-08-07 23:41:51', '31.3522034', '30.1790502', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:41:51', '2022-08-08 06:41:51'),
(822, NULL, 2, '2022-08-07 23:42:00', '31.3521259', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:42:00', '2022-08-08 06:42:00'),
(823, NULL, 2, '2022-08-07 23:42:10', '31.3521145', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:42:10', '2022-08-08 06:42:10'),
(824, NULL, 2, '2022-08-07 23:42:20', '31.3521225', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:42:20', '2022-08-08 06:42:20'),
(825, NULL, 2, '2022-08-07 23:42:31', '31.3521136', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:42:31', '2022-08-08 06:42:31'),
(826, NULL, 2, '2022-08-07 23:42:40', '31.3521486', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:42:40', '2022-08-08 06:42:40'),
(827, NULL, 2, '2022-08-07 23:42:50', '31.35212', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:42:50', '2022-08-08 06:42:50'),
(828, NULL, 2, '2022-08-07 23:42:59', '31.3521213', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:42:59', '2022-08-08 06:42:59'),
(829, NULL, 2, '2022-08-07 23:43:09', '31.3521817', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:43:09', '2022-08-08 06:43:09'),
(830, NULL, 2, '2022-08-07 23:43:19', '31.352121', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:43:19', '2022-08-08 06:43:19'),
(831, NULL, 2, '2022-08-07 23:43:29', '31.352121', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:43:29', '2022-08-08 06:43:29'),
(832, NULL, 2, '2022-08-07 23:43:39', '31.3521102', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:43:39', '2022-08-08 06:43:39'),
(833, NULL, 2, '2022-08-07 23:43:49', '31.352114', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:43:49', '2022-08-08 06:43:49'),
(834, NULL, 2, '2022-08-07 23:43:59', '31.3522158', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:43:59', '2022-08-08 06:43:59'),
(835, NULL, 2, '2022-08-07 23:44:09', '31.3521057', '30.1790597', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:44:09', '2022-08-08 06:44:09'),
(836, NULL, 2, '2022-08-07 23:44:19', '31.3521137', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:44:19', '2022-08-08 06:44:19'),
(837, NULL, 2, '2022-08-07 23:44:29', '31.3521136', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:44:29', '2022-08-08 06:44:29'),
(838, NULL, 2, '2022-08-07 23:44:39', '31.3521147', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:44:39', '2022-08-08 06:44:39'),
(839, NULL, 2, '2022-08-07 23:44:49', '31.3521027', '30.1790614', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:44:49', '2022-08-08 06:44:49'),
(840, NULL, 2, '2022-08-07 23:44:59', '31.352107', '30.1790595', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:44:59', '2022-08-08 06:44:59'),
(841, NULL, 2, '2022-08-07 23:45:09', '31.3521077', '30.1790607', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:45:09', '2022-08-08 06:45:09'),
(842, NULL, 2, '2022-08-07 23:45:19', '31.3521049', '30.1790615', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:45:19', '2022-08-08 06:45:19'),
(843, NULL, 2, '2022-08-07 23:45:29', '31.352115', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:45:29', '2022-08-08 06:45:29'),
(844, NULL, 2, '2022-08-07 23:45:44', '31.3521135', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:45:44', '2022-08-08 06:45:44'),
(845, NULL, 2, '2022-08-07 23:45:54', '31.352162', '30.1790751', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:45:54', '2022-08-08 06:45:54'),
(846, NULL, 2, '2022-08-07 23:46:04', '31.3521991', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:46:04', '2022-08-08 06:46:04'),
(847, NULL, 2, '2022-08-07 23:46:14', '31.3521364', '30.1790805', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:46:14', '2022-08-08 06:46:14'),
(848, NULL, 2, '2022-08-07 23:46:24', '31.3521525', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:46:24', '2022-08-08 06:46:24'),
(849, NULL, 2, '2022-08-07 23:46:34', '31.3521086', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:46:34', '2022-08-08 06:46:34'),
(850, NULL, 2, '2022-08-07 23:46:44', '31.3521204', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:46:44', '2022-08-08 06:46:44'),
(851, NULL, 2, '2022-08-07 23:46:54', '31.3521315', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:46:54', '2022-08-08 06:46:54'),
(852, NULL, 2, '2022-08-07 23:47:04', '31.3521145', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:47:04', '2022-08-08 06:47:04'),
(853, NULL, 2, '2022-08-07 23:47:14', '31.3521229', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:47:14', '2022-08-08 06:47:14'),
(854, NULL, 2, '2022-08-07 23:47:24', '31.3521227', '30.1790631', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:47:24', '2022-08-08 06:47:24'),
(855, NULL, 2, '2022-08-07 23:47:34', '31.3521196', '30.1790628', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:47:34', '2022-08-08 06:47:34'),
(856, NULL, 2, '2022-08-07 23:47:44', '31.3521087', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:47:44', '2022-08-08 06:47:44'),
(857, NULL, 2, '2022-08-07 23:47:54', '31.3521235', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:47:54', '2022-08-08 06:47:54'),
(858, NULL, 2, '2022-08-07 23:48:04', '31.3521694', '30.1791001', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:48:04', '2022-08-08 06:48:04'),
(859, NULL, 2, '2022-08-07 23:48:14', '31.3521493', '30.1790746', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:48:14', '2022-08-08 06:48:14'),
(860, NULL, 2, '2022-08-07 23:48:26', '31.3521258', '30.1790618', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:48:26', '2022-08-08 06:48:26'),
(861, NULL, 2, '2022-08-07 23:48:35', '31.3521171', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:48:35', '2022-08-08 06:48:35'),
(862, NULL, 2, '2022-08-07 23:48:46', '31.3521463', '30.1790538', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:48:46', '2022-08-08 06:48:46'),
(863, NULL, 2, '2022-08-07 23:48:56', '31.352124', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:48:56', '2022-08-08 06:48:56'),
(864, NULL, 2, '2022-08-07 23:49:05', '31.3521921', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:49:05', '2022-08-08 06:49:05'),
(865, NULL, 2, '2022-08-07 23:49:15', '31.3521294', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:49:15', '2022-08-08 06:49:15'),
(866, NULL, 2, '2022-08-07 23:49:26', '31.3521355', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:49:26', '2022-08-08 06:49:26'),
(867, NULL, 2, '2022-08-07 23:49:36', '31.3521902', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:49:36', '2022-08-08 06:49:36'),
(868, NULL, 2, '2022-08-07 23:49:47', '31.3521513', '30.1790537', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:49:47', '2022-08-08 06:49:47'),
(869, NULL, 2, '2022-08-07 23:50:05', '31.3521594', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:50:05', '2022-08-08 06:50:05'),
(870, NULL, 2, '2022-08-07 23:50:15', '31.3521776', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:50:15', '2022-08-08 06:50:15'),
(871, NULL, 2, '2022-08-07 23:50:24', '31.3521801', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:50:24', '2022-08-08 06:50:24'),
(872, NULL, 2, '2022-08-07 23:50:35', '31.3522025', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:50:35', '2022-08-08 06:50:35'),
(873, NULL, 2, '2022-08-07 23:50:46', '31.3521273', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:50:46', '2022-08-08 06:50:46'),
(874, NULL, 2, '2022-08-07 23:50:55', '31.3521076', '30.1790599', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:50:55', '2022-08-08 06:50:55'),
(875, NULL, 2, '2022-08-07 23:51:05', '31.3521149', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:51:05', '2022-08-08 06:51:05'),
(876, NULL, 2, '2022-08-07 23:51:15', '31.3521117', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:51:15', '2022-08-08 06:51:15'),
(877, NULL, 2, '2022-08-07 23:51:26', '31.3521157', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:51:26', '2022-08-08 06:51:26'),
(878, NULL, 2, '2022-08-07 23:51:35', '31.3521145', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:51:35', '2022-08-08 06:51:35'),
(879, NULL, 2, '2022-08-07 23:51:45', '31.3521141', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:51:45', '2022-08-08 06:51:45'),
(880, NULL, 2, '2022-08-07 23:51:55', '31.3521103', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:51:55', '2022-08-08 06:51:55'),
(881, NULL, 2, '2022-08-07 23:52:05', '31.3521144', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:52:05', '2022-08-08 06:52:05'),
(882, NULL, 2, '2022-08-07 23:52:15', '31.3521153', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:52:15', '2022-08-08 06:52:15'),
(883, NULL, 2, '2022-08-07 23:52:25', '31.3521088', '30.1790594', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:52:25', '2022-08-08 06:52:25'),
(884, NULL, 2, '2022-08-07 23:52:35', '31.3521075', '30.1790593', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:52:35', '2022-08-08 06:52:35'),
(885, NULL, 2, '2022-08-07 23:52:45', '31.3521077', '30.1790585', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:52:45', '2022-08-08 06:52:45'),
(886, NULL, 2, '2022-08-07 23:52:55', '31.3521114', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:52:55', '2022-08-08 06:52:55'),
(887, NULL, 2, '2022-08-07 23:53:06', '31.3521068', '30.1790582', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:53:06', '2022-08-08 06:53:06'),
(888, NULL, 2, '2022-08-07 23:53:15', '31.3521111', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:53:15', '2022-08-08 06:53:15'),
(889, NULL, 2, '2022-08-07 23:53:25', '31.3521147', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:53:25', '2022-08-08 06:53:25'),
(890, NULL, 2, '2022-08-07 23:53:35', '31.3521141', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:53:35', '2022-08-08 06:53:35'),
(891, NULL, 2, '2022-08-07 23:53:45', '31.3521147', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:53:45', '2022-08-08 06:53:45'),
(892, NULL, 2, '2022-08-07 23:53:55', '31.352111', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:53:55', '2022-08-08 06:53:55'),
(893, NULL, 2, '2022-08-07 23:54:05', '31.3521071', '30.179058', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:54:05', '2022-08-08 06:54:05'),
(894, NULL, 2, '2022-08-07 23:54:15', '31.3521147', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:54:15', '2022-08-08 06:54:15'),
(895, NULL, 2, '2022-08-07 23:54:25', '31.3521541', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:54:25', '2022-08-08 06:54:25'),
(896, NULL, 2, '2022-08-07 23:54:35', '31.3521295', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:54:35', '2022-08-08 06:54:35'),
(897, NULL, 2, '2022-08-07 23:54:45', '31.3521684', '30.1790525', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:54:45', '2022-08-08 06:54:45'),
(898, NULL, 2, '2022-08-07 23:54:55', '31.3521041', '30.1790673', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:54:55', '2022-08-08 06:54:55'),
(899, NULL, 2, '2022-08-07 23:55:05', '31.3521026', '30.179068', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:55:05', '2022-08-08 06:55:05'),
(900, NULL, 2, '2022-08-07 23:55:15', '31.3521105', '30.1790617', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:55:15', '2022-08-08 06:55:15'),
(901, NULL, 2, '2022-08-07 23:55:25', '31.3521481', '30.179052', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:55:25', '2022-08-08 06:55:25'),
(902, NULL, 2, '2022-08-07 23:55:35', '31.3521115', '30.179051', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:55:35', '2022-08-08 06:55:35'),
(903, NULL, 2, '2022-08-07 23:55:45', '31.352119', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:55:45', '2022-08-08 06:55:45'),
(904, NULL, 2, '2022-08-07 23:55:55', '31.3521121', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:55:55', '2022-08-08 06:55:55'),
(905, NULL, 2, '2022-08-07 23:56:05', '31.3521122', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:56:05', '2022-08-08 06:56:05'),
(906, NULL, 2, '2022-08-07 23:56:15', '31.3521088', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:56:15', '2022-08-08 06:56:15'),
(907, NULL, 2, '2022-08-07 23:56:25', '31.3521114', '30.1790615', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:56:25', '2022-08-08 06:56:25'),
(908, NULL, 2, '2022-08-07 23:56:35', '31.3521103', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:56:35', '2022-08-08 06:56:35'),
(909, NULL, 2, '2022-08-07 23:56:45', '31.3521122', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:56:45', '2022-08-08 06:56:45'),
(910, NULL, 2, '2022-08-07 23:56:55', '31.3521117', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:56:55', '2022-08-08 06:56:55'),
(911, NULL, 2, '2022-08-07 23:57:05', '31.3521122', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:57:05', '2022-08-08 06:57:05'),
(912, NULL, 2, '2022-08-07 23:57:15', '31.3521075', '30.1790579', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:57:15', '2022-08-08 06:57:15'),
(913, NULL, 2, '2022-08-07 23:57:25', '31.3521104', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:57:25', '2022-08-08 06:57:25'),
(914, NULL, 2, '2022-08-07 23:57:35', '31.3521119', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:57:35', '2022-08-08 06:57:35'),
(915, NULL, 2, '2022-08-07 23:57:45', '31.3521146', '30.179061', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:57:45', '2022-08-08 06:57:45'),
(916, NULL, 2, '2022-08-07 23:57:55', '31.3521159', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:57:55', '2022-08-08 06:57:55'),
(917, NULL, 2, '2022-08-07 23:58:05', '31.3521149', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:58:05', '2022-08-08 06:58:05'),
(918, NULL, 2, '2022-08-07 23:58:15', '31.3521196', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:58:15', '2022-08-08 06:58:15'),
(919, NULL, 2, '2022-08-07 23:58:25', '31.3521062', '30.1790607', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:58:25', '2022-08-08 06:58:25'),
(920, NULL, 2, '2022-08-07 23:58:35', '31.3521121', '30.1790627', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:58:35', '2022-08-08 06:58:35'),
(921, NULL, 2, '2022-08-07 23:58:45', '31.3521151', '30.1790619', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:58:45', '2022-08-08 06:58:45'),
(922, NULL, 2, '2022-08-07 23:58:55', '31.3521128', '30.1790613', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:58:55', '2022-08-08 06:58:55'),
(923, NULL, 2, '2022-08-07 23:59:05', '31.3521114', '30.1790628', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:59:05', '2022-08-08 06:59:05'),
(924, NULL, 2, '2022-08-07 23:59:15', '31.3521113', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:59:15', '2022-08-08 06:59:15'),
(925, NULL, 2, '2022-08-07 23:59:26', '31.3521067', '30.1790588', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 06:59:26', '2022-08-08 06:59:26'),
(926, NULL, 2, '2022-08-07 23:59:35', '31.352111', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:59:35', '2022-08-08 06:59:35'),
(927, NULL, 2, '2022-08-07 23:59:45', '31.3521229', '30.1790509', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:59:45', '2022-08-08 06:59:45'),
(928, NULL, 2, '2022-08-07 23:59:55', '31.3521121', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 06:59:55', '2022-08-08 06:59:55'),
(929, NULL, 2, '2022-08-08 00:00:05', '31.3521114', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:00:05', '2022-08-08 07:00:05'),
(930, NULL, 2, '2022-08-08 00:00:15', '31.3521129', '30.1790606', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:00:15', '2022-08-08 07:00:15'),
(931, NULL, 2, '2022-08-08 00:00:25', '31.3521104', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:00:25', '2022-08-08 07:00:25'),
(932, NULL, 2, '2022-08-08 00:00:35', '31.352111', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:00:35', '2022-08-08 07:00:35'),
(933, NULL, 2, '2022-08-08 00:00:45', '31.3521091', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:00:45', '2022-08-08 07:00:45'),
(934, NULL, 2, '2022-08-08 00:00:55', '31.3521133', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:00:55', '2022-08-08 07:00:55'),
(935, NULL, 2, '2022-08-08 00:01:05', '31.3521068', '30.1790609', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:01:05', '2022-08-08 07:01:05'),
(936, NULL, 2, '2022-08-08 00:01:15', '31.3521227', '30.1790615', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:01:15', '2022-08-08 07:01:15'),
(937, NULL, 2, '2022-08-08 00:01:25', '31.3521283', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:01:25', '2022-08-08 07:01:25'),
(938, NULL, 2, '2022-08-08 00:01:35', '31.3521124', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:01:35', '2022-08-08 07:01:35'),
(939, NULL, 2, '2022-08-08 00:01:45', '31.3521135', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:01:45', '2022-08-08 07:01:45'),
(940, NULL, 2, '2022-08-08 00:01:55', '31.3521131', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:01:55', '2022-08-08 07:01:55'),
(941, NULL, 2, '2022-08-08 00:02:05', '31.3521152', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:02:05', '2022-08-08 07:02:05'),
(942, NULL, 2, '2022-08-08 00:02:15', '31.3521132', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:02:15', '2022-08-08 07:02:15'),
(943, NULL, 2, '2022-08-08 00:02:25', '31.3521073', '30.1790563', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:02:25', '2022-08-08 07:02:25'),
(944, NULL, 2, '2022-08-08 00:02:35', '31.352114', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:02:35', '2022-08-08 07:02:35'),
(945, NULL, 2, '2022-08-08 00:02:45', '31.3521125', '30.1790613', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:02:45', '2022-08-08 07:02:45'),
(946, NULL, 2, '2022-08-08 00:02:55', '31.3521109', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:02:55', '2022-08-08 07:02:55'),
(947, NULL, 2, '2022-08-08 00:03:05', '31.3521119', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:03:05', '2022-08-08 07:03:05'),
(948, NULL, 2, '2022-08-08 00:03:15', '31.3521127', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:03:15', '2022-08-08 07:03:15'),
(949, NULL, 2, '2022-08-08 00:03:25', '31.3521092', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:03:25', '2022-08-08 07:03:25'),
(950, NULL, 2, '2022-08-08 00:03:35', '31.3521104', '30.1790621', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:03:35', '2022-08-08 07:03:35'),
(951, NULL, 2, '2022-08-08 00:03:45', '31.3521117', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:03:45', '2022-08-08 07:03:45'),
(952, NULL, 2, '2022-08-08 00:03:55', '31.352109', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:03:55', '2022-08-08 07:03:55'),
(953, NULL, 2, '2022-08-08 00:04:05', '31.3521082', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:04:05', '2022-08-08 07:04:05'),
(954, NULL, 2, '2022-08-08 00:04:15', '31.3521093', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:04:15', '2022-08-08 07:04:15'),
(955, NULL, 2, '2022-08-08 00:04:25', '31.3521095', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:04:25', '2022-08-08 07:04:25'),
(956, NULL, 2, '2022-08-08 00:04:36', '31.3521072', '30.1790591', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:04:36', '2022-08-08 07:04:36'),
(957, NULL, 2, '2022-08-08 00:04:45', '31.3521123', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:04:45', '2022-08-08 07:04:45'),
(958, NULL, 2, '2022-08-08 00:04:55', '31.3521166', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:04:55', '2022-08-08 07:04:55'),
(959, NULL, 2, '2022-08-08 00:05:05', '31.3521102', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:05:05', '2022-08-08 07:05:05'),
(960, NULL, 2, '2022-08-08 00:05:15', '31.3521163', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:05:15', '2022-08-08 07:05:15'),
(961, NULL, 2, '2022-08-08 00:05:25', '31.3521148', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:05:25', '2022-08-08 07:05:25'),
(962, NULL, 2, '2022-08-08 00:05:35', '31.3521134', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:05:35', '2022-08-08 07:05:35'),
(963, NULL, 2, '2022-08-08 00:05:45', '31.3521155', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:05:45', '2022-08-08 07:05:45'),
(964, NULL, 2, '2022-08-08 00:05:55', '31.3521155', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:05:55', '2022-08-08 07:05:55'),
(965, NULL, 2, '2022-08-08 00:06:05', '31.3521118', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:06:05', '2022-08-08 07:06:05'),
(966, NULL, 2, '2022-08-08 00:06:15', '31.3521118', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:06:15', '2022-08-08 07:06:15'),
(967, NULL, 2, '2022-08-08 00:06:25', '31.3521121', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:06:25', '2022-08-08 07:06:25'),
(968, NULL, 2, '2022-08-08 00:06:35', '31.3521154', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:06:35', '2022-08-08 07:06:35'),
(969, NULL, 2, '2022-08-08 00:06:45', '31.3521044', '30.1790607', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:06:45', '2022-08-08 07:06:45'),
(970, NULL, 2, '2022-08-08 00:06:55', '31.3521079', '30.1790581', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:06:55', '2022-08-08 07:06:55'),
(971, NULL, 2, '2022-08-08 00:07:05', '31.3521132', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:07:05', '2022-08-08 07:07:05'),
(972, NULL, 2, '2022-08-08 00:07:15', '31.3521077', '30.1790577', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:07:15', '2022-08-08 07:07:15'),
(973, NULL, 2, '2022-08-08 00:07:25', '31.3521101', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:07:25', '2022-08-08 07:07:25'),
(974, NULL, 2, '2022-08-08 00:07:35', '31.3521176', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:07:35', '2022-08-08 07:07:35'),
(975, NULL, 2, '2022-08-08 00:07:46', '31.3521136', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:07:46', '2022-08-08 07:07:46'),
(976, NULL, 2, '2022-08-08 00:07:55', '31.3521129', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:07:55', '2022-08-08 07:07:55'),
(977, NULL, 2, '2022-08-08 00:08:06', '31.3521152', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:08:06', '2022-08-08 07:08:06'),
(978, NULL, 2, '2022-08-08 00:08:15', '31.3521037', '30.1790614', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:08:15', '2022-08-08 07:08:15'),
(979, NULL, 2, '2022-08-08 00:08:25', '31.3521096', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:08:25', '2022-08-08 07:08:25'),
(980, NULL, 2, '2022-08-08 00:08:35', '31.3521235', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:08:35', '2022-08-08 07:08:35'),
(981, NULL, 2, '2022-08-08 00:08:45', '31.3521093', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:08:45', '2022-08-08 07:08:45'),
(982, NULL, 2, '2022-08-08 00:08:55', '31.3521269', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:08:55', '2022-08-08 07:08:55'),
(983, NULL, 2, '2022-08-08 00:09:05', '31.3521129', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:09:05', '2022-08-08 07:09:05'),
(984, NULL, 2, '2022-08-08 00:09:15', '31.3521197', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:09:15', '2022-08-08 07:09:15'),
(985, NULL, 2, '2022-08-08 00:09:25', '31.3521042', '30.1790609', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:09:25', '2022-08-08 07:09:25'),
(986, NULL, 2, '2022-08-08 00:09:35', '31.3521088', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:09:35', '2022-08-08 07:09:35'),
(987, NULL, 2, '2022-08-08 00:09:45', '31.3521208', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:09:45', '2022-08-08 07:09:45'),
(988, NULL, 2, '2022-08-08 00:09:55', '31.3521187', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:09:55', '2022-08-08 07:09:55'),
(989, NULL, 2, '2022-08-08 00:10:06', '31.3521211', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:10:06', '2022-08-08 07:10:06'),
(990, NULL, 2, '2022-08-08 00:10:15', '31.3521138', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:10:15', '2022-08-08 07:10:15'),
(991, NULL, 2, '2022-08-08 00:10:25', '31.3521179', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:10:25', '2022-08-08 07:10:25'),
(992, NULL, 2, '2022-08-08 00:10:35', '31.3521281', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:10:35', '2022-08-08 07:10:35'),
(993, NULL, 2, '2022-08-08 00:10:45', '31.352122', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:10:45', '2022-08-08 07:10:45'),
(994, NULL, 2, '2022-08-08 00:10:55', '31.3521213', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:10:55', '2022-08-08 07:10:55'),
(995, NULL, 2, '2022-08-08 00:11:05', '31.3521237', '30.179061', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:11:05', '2022-08-08 07:11:05'),
(996, NULL, 2, '2022-08-08 00:11:15', '31.3521253', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:11:15', '2022-08-08 07:11:15'),
(997, NULL, 2, '2022-08-08 00:11:25', '31.3521199', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:11:25', '2022-08-08 07:11:25'),
(998, NULL, 2, '2022-08-08 00:11:35', '31.3521228', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:11:35', '2022-08-08 07:11:35'),
(999, NULL, 2, '2022-08-08 00:11:45', '31.3521199', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:11:45', '2022-08-08 07:11:45'),
(1000, NULL, 2, '2022-08-08 00:11:55', '31.3521113', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:11:55', '2022-08-08 07:11:55'),
(1001, NULL, 2, '2022-08-08 00:12:05', '31.3521095', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:12:05', '2022-08-08 07:12:05'),
(1002, NULL, 2, '2022-08-08 00:12:15', '31.352107', '30.1790591', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:12:15', '2022-08-08 07:12:15'),
(1003, NULL, 2, '2022-08-08 00:12:25', '31.3521176', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:12:25', '2022-08-08 07:12:25'),
(1004, NULL, 2, '2022-08-08 00:12:35', '31.352124', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:12:35', '2022-08-08 07:12:35'),
(1005, NULL, 2, '2022-08-08 00:12:45', '31.352186', '30.179054', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:12:45', '2022-08-08 07:12:45'),
(1006, NULL, 2, '2022-08-08 00:12:55', '31.3521176', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:12:55', '2022-08-08 07:12:55'),
(1007, NULL, 2, '2022-08-08 00:13:06', '31.3521079', '30.1790569', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:13:06', '2022-08-08 07:13:06'),
(1008, NULL, 2, '2022-08-08 00:13:15', '31.3521055', '30.1790596', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:13:15', '2022-08-08 07:13:15'),
(1009, NULL, 2, '2022-08-08 00:13:25', '31.3521116', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:13:25', '2022-08-08 07:13:25'),
(1010, NULL, 2, '2022-08-08 00:13:35', '31.3521086', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:13:35', '2022-08-08 07:13:35'),
(1011, NULL, 2, '2022-08-08 00:13:45', '31.3521139', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:13:45', '2022-08-08 07:13:45'),
(1012, NULL, 2, '2022-08-08 00:13:55', '31.3521171', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:13:55', '2022-08-08 07:13:55'),
(1013, NULL, 2, '2022-08-08 00:14:05', '31.3521189', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:14:05', '2022-08-08 07:14:05'),
(1014, NULL, 2, '2022-08-08 00:14:15', '31.3521142', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:14:15', '2022-08-08 07:14:15'),
(1015, NULL, 2, '2022-08-08 00:14:25', '31.3521168', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:14:25', '2022-08-08 07:14:25'),
(1016, NULL, 2, '2022-08-08 00:14:35', '31.3521088', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:14:35', '2022-08-08 07:14:35'),
(1017, NULL, 2, '2022-08-08 00:14:45', '31.3521169', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:14:45', '2022-08-08 07:14:45'),
(1018, NULL, 2, '2022-08-08 00:14:55', '31.3521112', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:14:55', '2022-08-08 07:14:55'),
(1019, NULL, 2, '2022-08-08 00:15:05', '31.3521096', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:15:05', '2022-08-08 07:15:05'),
(1020, NULL, 2, '2022-08-08 00:15:15', '31.3521212', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:15:15', '2022-08-08 07:15:15'),
(1021, NULL, 2, '2022-08-08 00:15:25', '31.3521054', '30.1790593', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:15:25', '2022-08-08 07:15:25'),
(1022, NULL, 2, '2022-08-08 00:15:35', '31.3521138', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:15:35', '2022-08-08 07:15:35'),
(1023, NULL, 2, '2022-08-08 00:15:45', '31.3521084', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:15:45', '2022-08-08 07:15:45'),
(1024, NULL, 2, '2022-08-08 00:15:55', '31.3521135', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:15:55', '2022-08-08 07:15:55'),
(1025, NULL, 2, '2022-08-08 00:16:05', '31.3521024', '30.1790618', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:16:05', '2022-08-08 07:16:05'),
(1026, NULL, 2, '2022-08-08 00:16:15', '31.3521096', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:16:15', '2022-08-08 07:16:15'),
(1027, NULL, 2, '2022-08-08 00:16:25', '31.3521062', '30.1790618', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:16:25', '2022-08-08 07:16:25'),
(1028, NULL, 2, '2022-08-08 00:16:35', '31.3521126', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:16:35', '2022-08-08 07:16:35'),
(1029, NULL, 2, '2022-08-08 00:16:45', '31.3521151', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:16:45', '2022-08-08 07:16:45'),
(1030, NULL, 2, '2022-08-08 00:16:55', '31.352106', '30.1790587', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:16:55', '2022-08-08 07:16:55'),
(1031, NULL, 2, '2022-08-08 00:17:05', '31.3521196', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:17:05', '2022-08-08 07:17:05'),
(1032, NULL, 2, '2022-08-08 00:17:16', '31.3521121', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:17:16', '2022-08-08 07:17:16'),
(1033, NULL, 2, '2022-08-08 00:17:25', '31.3521076', '30.1790577', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:17:25', '2022-08-08 07:17:25'),
(1034, NULL, 2, '2022-08-08 00:17:35', '31.3521112', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:17:35', '2022-08-08 07:17:35'),
(1035, NULL, 2, '2022-08-08 00:17:45', '31.352112', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:17:45', '2022-08-08 07:17:45'),
(1036, NULL, 2, '2022-08-08 00:17:55', '31.3521094', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:17:55', '2022-08-08 07:17:55'),
(1037, NULL, 2, '2022-08-08 00:18:05', '31.3521059', '30.179059', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:18:05', '2022-08-08 07:18:05'),
(1038, NULL, 2, '2022-08-08 00:18:15', '31.352115', '30.1790611', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:18:15', '2022-08-08 07:18:15'),
(1039, NULL, 2, '2022-08-08 00:18:25', '31.3521111', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:18:25', '2022-08-08 07:18:25'),
(1040, NULL, 2, '2022-08-08 00:18:35', '31.3521094', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:18:35', '2022-08-08 07:18:35');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1041, NULL, 2, '2022-08-08 00:18:47', '31.3521127', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:18:47', '2022-08-08 07:18:47'),
(1042, NULL, 2, '2022-08-08 00:18:57', '31.3521114', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:18:57', '2022-08-08 07:18:57'),
(1043, NULL, 2, '2022-08-08 00:19:05', '31.3521144', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:19:05', '2022-08-08 07:19:05'),
(1044, NULL, 2, '2022-08-08 00:19:15', '31.3521134', '30.1790622', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:19:15', '2022-08-08 07:19:15'),
(1045, NULL, 2, '2022-08-08 00:19:25', '31.3521061', '30.1790565', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:19:25', '2022-08-08 07:19:25'),
(1046, NULL, 2, '2022-08-08 00:19:36', '31.3521091', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:19:36', '2022-08-08 07:19:36'),
(1047, NULL, 2, '2022-08-08 00:19:45', '31.352116', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:19:45', '2022-08-08 07:19:45'),
(1048, NULL, 2, '2022-08-08 00:19:56', '31.3521104', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:19:56', '2022-08-08 07:19:56'),
(1049, NULL, 2, '2022-08-08 00:20:05', '31.3521095', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:20:05', '2022-08-08 07:20:05'),
(1050, NULL, 2, '2022-08-08 00:20:15', '31.3521099', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:20:15', '2022-08-08 07:20:15'),
(1051, NULL, 2, '2022-08-08 00:20:25', '31.3521079', '30.1790555', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:20:25', '2022-08-08 07:20:25'),
(1052, NULL, 2, '2022-08-08 00:20:36', '31.3521073', '30.1790585', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:20:36', '2022-08-08 07:20:36'),
(1053, NULL, 2, '2022-08-08 00:20:45', '31.3521151', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:20:45', '2022-08-08 07:20:45'),
(1054, NULL, 2, '2022-08-08 00:20:55', '31.3521111', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:20:55', '2022-08-08 07:20:55'),
(1055, NULL, 2, '2022-08-08 00:21:03', '31.3521113', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:21:03', '2022-08-08 07:21:03'),
(1056, NULL, 2, '2022-08-08 00:21:13', '31.3521113', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:21:13', '2022-08-08 07:21:13'),
(1057, NULL, 2, '2022-08-08 00:21:23', '31.3521124', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:21:23', '2022-08-08 07:21:23'),
(1058, NULL, 2, '2022-08-08 00:21:33', '31.3521118', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:21:33', '2022-08-08 07:21:33'),
(1059, NULL, 2, '2022-08-08 00:21:43', '31.3521141', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:21:43', '2022-08-08 07:21:43'),
(1060, NULL, 2, '2022-08-08 00:21:53', '31.3521174', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:21:53', '2022-08-08 07:21:53'),
(1061, NULL, 2, '2022-08-08 00:22:03', '31.3521191', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:22:03', '2022-08-08 07:22:03'),
(1062, NULL, 2, '2022-08-08 00:22:13', '31.3521234', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:22:13', '2022-08-08 07:22:13'),
(1063, NULL, 2, '2022-08-08 00:22:23', '31.352112', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:22:23', '2022-08-08 07:22:23'),
(1064, NULL, 2, '2022-08-08 00:22:33', '31.3521492', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:22:33', '2022-08-08 07:22:33'),
(1065, NULL, 2, '2022-08-08 00:22:43', '31.3521112', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:22:43', '2022-08-08 07:22:43'),
(1066, NULL, 2, '2022-08-08 00:22:53', '31.3521126', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:22:53', '2022-08-08 07:22:53'),
(1067, NULL, 2, '2022-08-08 00:23:03', '31.3521126', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:23:03', '2022-08-08 07:23:03'),
(1068, NULL, 2, '2022-08-08 00:23:13', '31.3521553', '30.1790509', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:23:13', '2022-08-08 07:23:13'),
(1069, NULL, 2, '2022-08-08 00:23:23', '31.3521987', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:23:23', '2022-08-08 07:23:23'),
(1070, NULL, 2, '2022-08-08 00:23:33', '31.3521853', '30.179045', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:23:33', '2022-08-08 07:23:33'),
(1071, NULL, 2, '2022-08-08 00:23:43', '31.3521811', '30.1790434', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:23:43', '2022-08-08 07:23:43'),
(1072, NULL, 2, '2022-08-08 00:23:53', '31.3521748', '30.1790459', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:23:53', '2022-08-08 07:23:53'),
(1073, NULL, 2, '2022-08-08 00:24:03', '31.3522078', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:24:03', '2022-08-08 07:24:03'),
(1074, NULL, 2, '2022-08-08 00:24:13', '31.3522072', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:24:13', '2022-08-08 07:24:13'),
(1075, NULL, 2, '2022-08-08 00:24:24', '31.3522041', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:24:24', '2022-08-08 07:24:24'),
(1076, NULL, 2, '2022-08-08 00:24:34', '31.3521994', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:24:34', '2022-08-08 07:24:34'),
(1077, NULL, 2, '2022-08-08 00:24:43', '31.3521911', '30.1790462', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:24:43', '2022-08-08 07:24:43'),
(1078, NULL, 2, '2022-08-08 00:24:54', '31.3521862', '30.1790477', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:24:54', '2022-08-08 07:24:54'),
(1079, NULL, 2, '2022-08-08 00:25:03', '31.3522096', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:25:03', '2022-08-08 07:25:03'),
(1080, NULL, 2, '2022-08-08 00:25:15', '31.3521264', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:25:15', '2022-08-08 07:25:15'),
(1081, NULL, 2, '2022-08-08 00:25:25', '31.3521128', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:25:25', '2022-08-08 07:25:25'),
(1082, NULL, 2, '2022-08-08 00:25:35', '31.3521252', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:25:35', '2022-08-08 07:25:35'),
(1083, NULL, 2, '2022-08-08 00:25:45', '31.3522124', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:25:45', '2022-08-08 07:25:45'),
(1084, NULL, 2, '2022-08-08 00:25:55', '31.3521331', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:25:55', '2022-08-08 07:25:55'),
(1085, NULL, 2, '2022-08-08 00:26:05', '31.3521324', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:26:05', '2022-08-08 07:26:05'),
(1086, NULL, 2, '2022-08-08 00:26:15', '31.3522119', '30.1790423', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:26:15', '2022-08-08 07:26:15'),
(1087, NULL, 2, '2022-08-08 00:26:25', '31.3522074', '30.1790425', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:26:25', '2022-08-08 07:26:25'),
(1088, NULL, 2, '2022-08-08 00:26:35', '31.3521516', '30.1790535', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:26:35', '2022-08-08 07:26:35'),
(1089, NULL, 2, '2022-08-08 00:26:45', '31.352108', '30.1790615', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:26:45', '2022-08-08 07:26:45'),
(1090, NULL, 2, '2022-08-08 00:26:54', '31.3521075', '30.1790616', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:26:54', '2022-08-08 07:26:54'),
(1091, NULL, 2, '2022-08-08 00:27:03', '31.3521043', '30.1790617', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:27:03', '2022-08-08 07:27:03'),
(1092, NULL, 2, '2022-08-08 00:27:13', '31.3521019', '30.1790615', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:27:13', '2022-08-08 07:27:13'),
(1093, NULL, 2, '2022-08-08 00:27:23', '31.3521149', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:27:23', '2022-08-08 07:27:23'),
(1094, NULL, 2, '2022-08-08 00:27:33', '31.3521064', '30.1790593', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:27:33', '2022-08-08 07:27:33'),
(1095, NULL, 2, '2022-08-08 00:27:43', '31.3521146', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:27:43', '2022-08-08 07:27:43'),
(1096, NULL, 2, '2022-08-08 00:27:53', '31.3521192', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:27:53', '2022-08-08 07:27:53'),
(1097, NULL, 2, '2022-08-08 00:28:03', '31.3521179', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:28:03', '2022-08-08 07:28:03'),
(1098, NULL, 2, '2022-08-08 00:28:13', '31.3521243', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:28:13', '2022-08-08 07:28:13'),
(1099, NULL, 2, '2022-08-08 00:28:23', '31.3521106', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:28:23', '2022-08-08 07:28:23'),
(1100, NULL, 2, '2022-08-08 00:28:34', '31.3521064', '30.1790581', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:28:34', '2022-08-08 07:28:34'),
(1101, NULL, 2, '2022-08-08 00:28:43', '31.3521208', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:28:43', '2022-08-08 07:28:43'),
(1102, NULL, 2, '2022-08-08 00:28:53', '31.3521104', '30.1790611', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:28:53', '2022-08-08 07:28:53'),
(1103, NULL, 2, '2022-08-08 00:29:03', '31.3521093', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:29:03', '2022-08-08 07:29:03'),
(1104, NULL, 2, '2022-08-08 00:29:13', '31.352111', '30.1790546', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:29:13', '2022-08-08 07:29:13'),
(1105, NULL, 2, '2022-08-08 00:29:23', '31.3521087', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:29:23', '2022-08-08 07:29:23'),
(1106, NULL, 2, '2022-08-08 00:29:33', '31.3521087', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:29:33', '2022-08-08 07:29:33'),
(1107, NULL, 2, '2022-08-08 00:29:43', '31.3521125', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:29:43', '2022-08-08 07:29:43'),
(1108, NULL, 2, '2022-08-08 00:29:53', '31.3521076', '30.1790584', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:29:53', '2022-08-08 07:29:53'),
(1109, NULL, 2, '2022-08-08 00:30:03', '31.3521104', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:30:03', '2022-08-08 07:30:03'),
(1110, NULL, 2, '2022-08-08 00:30:13', '31.3521061', '30.1790592', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:30:13', '2022-08-08 07:30:13'),
(1111, NULL, 2, '2022-08-08 00:30:23', '31.3521129', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:30:23', '2022-08-08 07:30:23'),
(1112, NULL, 2, '2022-08-08 00:30:33', '31.3521147', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:30:33', '2022-08-08 07:30:33'),
(1113, NULL, 2, '2022-08-08 00:30:43', '31.3521176', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:30:43', '2022-08-08 07:30:43'),
(1114, NULL, 2, '2022-08-08 00:30:53', '31.3521816', '30.1790458', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:30:53', '2022-08-08 07:30:53'),
(1115, NULL, 2, '2022-08-08 00:31:04', '31.3521166', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:31:04', '2022-08-08 07:31:04'),
(1116, NULL, 2, '2022-08-08 00:31:15', '31.3521963', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:31:15', '2022-08-08 07:31:15'),
(1117, NULL, 2, '2022-08-08 00:31:25', '31.3521998', '30.1790476', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:31:25', '2022-08-08 07:31:25'),
(1118, NULL, 2, '2022-08-08 00:31:35', '31.352165', '30.17905', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:31:35', '2022-08-08 07:31:35'),
(1119, NULL, 2, '2022-08-08 00:31:43', '31.3521616', '30.1790503', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:31:43', '2022-08-08 07:31:43'),
(1120, NULL, 2, '2022-08-08 00:31:53', '31.3522075', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:31:53', '2022-08-08 07:31:53'),
(1121, NULL, 2, '2022-08-08 00:32:03', '31.3521682', '30.1790473', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:32:03', '2022-08-08 07:32:03'),
(1122, NULL, 2, '2022-08-08 00:32:13', '31.3521426', '30.1790497', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:32:13', '2022-08-08 07:32:13'),
(1123, NULL, 2, '2022-08-08 00:32:24', '31.3521696', '30.1790478', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:32:24', '2022-08-08 07:32:24'),
(1124, NULL, 2, '2022-08-08 00:32:34', '31.3522146', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:32:34', '2022-08-08 07:32:34'),
(1125, NULL, 2, '2022-08-08 00:32:43', '31.3522146', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:32:43', '2022-08-08 07:32:43'),
(1126, NULL, 2, '2022-08-08 00:32:54', '31.3522115', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:32:54', '2022-08-08 07:32:54'),
(1127, NULL, 2, '2022-08-08 00:33:04', '31.3522139', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:33:04', '2022-08-08 07:33:04'),
(1128, NULL, 2, '2022-08-08 00:33:14', '31.3521571', '30.1790492', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:33:14', '2022-08-08 07:33:14'),
(1129, NULL, 2, '2022-08-08 00:33:24', '31.3522117', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:33:24', '2022-08-08 07:33:24'),
(1130, NULL, 2, '2022-08-08 00:33:34', '31.3522139', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:33:34', '2022-08-08 07:33:34'),
(1131, NULL, 2, '2022-08-08 00:33:44', '31.3522168', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:33:44', '2022-08-08 07:33:44'),
(1132, NULL, 2, '2022-08-08 00:33:53', '31.3521723', '30.1790479', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:33:53', '2022-08-08 07:33:53'),
(1133, NULL, 2, '2022-08-08 00:34:03', '31.3522068', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:34:03', '2022-08-08 07:34:03'),
(1134, NULL, 2, '2022-08-08 00:34:14', '31.3521768', '30.1790495', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:34:14', '2022-08-08 07:34:14'),
(1135, NULL, 2, '2022-08-08 00:34:24', '31.352211', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:34:24', '2022-08-08 07:34:24'),
(1136, NULL, 2, '2022-08-08 00:34:34', '31.3522152', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:34:34', '2022-08-08 07:34:34'),
(1137, NULL, 2, '2022-08-08 00:34:44', '31.3521783', '30.1790467', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:34:44', '2022-08-08 07:34:44'),
(1138, NULL, 2, '2022-08-08 00:34:54', '31.352207', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:34:54', '2022-08-08 07:34:54'),
(1139, NULL, 2, '2022-08-08 00:35:03', '31.3521874', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:35:03', '2022-08-08 07:35:03'),
(1140, NULL, 2, '2022-08-08 00:35:13', '31.3521828', '30.1790498', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:35:13', '2022-08-08 07:35:13'),
(1141, NULL, 2, '2022-08-08 00:35:25', '31.3521304', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:35:25', '2022-08-08 07:35:25'),
(1142, NULL, 2, '2022-08-08 00:35:35', '31.3521168', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:35:35', '2022-08-08 07:35:35'),
(1143, NULL, 2, '2022-08-08 00:35:45', '31.3521904', '30.1790448', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:35:45', '2022-08-08 07:35:45'),
(1144, NULL, 2, '2022-08-08 00:35:56', '31.3521235', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:35:56', '2022-08-08 07:35:56'),
(1145, NULL, 2, '2022-08-08 00:36:05', '31.3521186', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:36:05', '2022-08-08 07:36:05'),
(1146, NULL, 2, '2022-08-08 00:36:15', '31.3521135', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:36:15', '2022-08-08 07:36:15'),
(1147, NULL, 2, '2022-08-08 00:36:23', '31.3521134', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:36:23', '2022-08-08 07:36:23'),
(1148, NULL, 2, '2022-08-08 00:36:33', '31.3521149', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:36:33', '2022-08-08 07:36:33'),
(1149, NULL, 2, '2022-08-08 00:36:43', '31.3521346', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:36:43', '2022-08-08 07:36:43'),
(1150, NULL, 2, '2022-08-08 00:36:53', '31.3521152', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:36:53', '2022-08-08 07:36:53'),
(1151, NULL, 2, '2022-08-08 00:37:03', '31.3521141', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:37:03', '2022-08-08 07:37:03'),
(1152, NULL, 2, '2022-08-08 00:37:13', '31.3521076', '30.1790576', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:37:13', '2022-08-08 07:37:13'),
(1153, NULL, 2, '2022-08-08 00:37:23', '31.3521428', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:37:23', '2022-08-08 07:37:23'),
(1154, NULL, 2, '2022-08-08 00:37:35', '31.3521237', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:37:35', '2022-08-08 07:37:35'),
(1155, NULL, 2, '2022-08-08 00:37:45', '31.352121', '30.1790606', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:37:45', '2022-08-08 07:37:45'),
(1156, NULL, 2, '2022-08-08 00:37:55', '31.3521168', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:37:55', '2022-08-08 07:37:55'),
(1157, NULL, 2, '2022-08-08 00:38:05', '31.3521153', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 07:38:05', '2022-08-08 07:38:05'),
(1158, NULL, 2, '2022-08-08 00:38:15', '31.352107', '30.1790608', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 07:38:15', '2022-08-08 07:38:15'),
(1159, NULL, 2, '2022-08-08 10:37:56', '31.3521781', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:37:56', '2022-08-08 17:37:56'),
(1160, NULL, 2, '2022-08-08 10:38:05', '31.352115', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:38:05', '2022-08-08 17:38:05'),
(1161, NULL, 2, '2022-08-08 10:38:15', '31.3521861', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:38:15', '2022-08-08 17:38:15'),
(1162, NULL, 2, '2022-08-08 10:38:38', '31.3522041', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:38:38', '2022-08-08 17:38:38'),
(1163, NULL, 2, '2022-08-08 10:38:47', '31.3521114', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:38:47', '2022-08-08 17:38:47'),
(1164, NULL, 2, '2022-08-08 10:38:57', '31.3521087', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:38:57', '2022-08-08 17:38:57'),
(1165, NULL, 2, '2022-08-08 10:39:07', '31.3521103', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:39:07', '2022-08-08 17:39:07'),
(1166, NULL, 2, '2022-08-08 10:39:17', '31.3521083', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:39:17', '2022-08-08 17:39:17'),
(1167, NULL, 2, '2022-08-08 10:39:28', '31.3521056', '30.1790573', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:39:28', '2022-08-08 17:39:28'),
(1168, NULL, 2, '2022-08-08 10:39:37', '31.3521396', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:39:37', '2022-08-08 17:39:37'),
(1169, NULL, 2, '2022-08-08 10:39:47', '31.3521195', '30.1790623', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:39:47', '2022-08-08 17:39:47'),
(1170, NULL, 2, '2022-08-08 10:39:57', '31.3521094', '30.1790541', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:39:57', '2022-08-08 17:39:57'),
(1171, NULL, 2, '2022-08-08 10:40:08', '31.3521074', '30.1790581', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:40:08', '2022-08-08 17:40:08'),
(1172, NULL, 2, '2022-08-08 10:40:18', '31.3521059', '30.1790603', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:40:18', '2022-08-08 17:40:18'),
(1173, NULL, 2, '2022-08-08 10:40:28', '31.3521181', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:40:28', '2022-08-08 17:40:28'),
(1174, NULL, 3, '2022-08-08 10:50:19', '31.3521087', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:50:19', '2022-08-08 17:50:19'),
(1175, NULL, 3, '2022-08-08 10:50:29', '31.352119', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:50:29', '2022-08-08 17:50:29'),
(1176, NULL, 3, '2022-08-08 10:50:39', '31.3521088', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:50:39', '2022-08-08 17:50:39'),
(1177, NULL, 3, '2022-08-08 10:50:49', '31.3521015', '30.1790611', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:50:49', '2022-08-08 17:50:49'),
(1178, NULL, 3, '2022-08-08 10:50:59', '31.3521101', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:50:59', '2022-08-08 17:50:59'),
(1179, NULL, 3, '2022-08-08 10:51:09', '31.3521099', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:51:09', '2022-08-08 17:51:09'),
(1180, NULL, 3, '2022-08-08 10:51:19', '31.3521127', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:51:19', '2022-08-08 17:51:19'),
(1181, NULL, 3, '2022-08-08 10:51:29', '31.352185', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:51:29', '2022-08-08 17:51:29'),
(1182, NULL, 3, '2022-08-08 10:51:39', '31.3521088', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:51:39', '2022-08-08 17:51:39'),
(1183, NULL, 3, '2022-08-08 10:51:49', '31.3521101', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:51:49', '2022-08-08 17:51:49'),
(1184, NULL, 3, '2022-08-08 10:51:59', '31.3521084', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:51:59', '2022-08-08 17:51:59'),
(1185, NULL, 3, '2022-08-08 10:52:09', '31.3521066', '30.1790566', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:52:09', '2022-08-08 17:52:09'),
(1186, NULL, 3, '2022-08-08 10:52:19', '31.3521071', '30.1790553', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:52:19', '2022-08-08 17:52:19'),
(1187, NULL, 3, '2022-08-08 10:52:29', '31.3521024', '30.1790562', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:52:29', '2022-08-08 17:52:29'),
(1188, NULL, 3, '2022-08-08 10:52:41', '31.3521024', '30.1790562', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:52:41', '2022-08-08 17:52:41'),
(1189, NULL, 3, '2022-08-08 10:52:50', '31.3521129', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:52:50', '2022-08-08 17:52:50'),
(1190, NULL, 3, '2022-08-08 10:53:01', '31.3521105', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:53:01', '2022-08-08 17:53:01'),
(1191, NULL, 3, '2022-08-08 10:53:11', '31.3521112', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:53:11', '2022-08-08 17:53:11'),
(1192, NULL, 3, '2022-08-08 10:53:20', '31.3521135', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:53:20', '2022-08-08 17:53:20'),
(1193, NULL, 3, '2022-08-08 10:53:30', '31.3521139', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:53:30', '2022-08-08 17:53:30'),
(1194, NULL, 3, '2022-08-08 10:53:40', '31.3521123', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:53:40', '2022-08-08 17:53:40'),
(1195, NULL, 3, '2022-08-08 10:53:51', '31.3521063', '30.1790575', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:53:51', '2022-08-08 17:53:51'),
(1196, NULL, 3, '2022-08-08 10:54:00', '31.3521226', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:54:00', '2022-08-08 17:54:00'),
(1197, NULL, 3, '2022-08-08 10:54:10', '31.3521146', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:54:10', '2022-08-08 17:54:10'),
(1198, NULL, 3, '2022-08-08 10:54:20', '31.3521115', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:54:20', '2022-08-08 17:54:20'),
(1199, NULL, 3, '2022-08-08 10:54:31', '31.3521214', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:54:31', '2022-08-08 17:54:31'),
(1200, NULL, 3, '2022-08-08 10:54:41', '31.3521116', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:54:41', '2022-08-08 17:54:41'),
(1201, NULL, 3, '2022-08-08 10:54:51', '31.3521193', '30.1790612', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:54:51', '2022-08-08 17:54:51'),
(1202, NULL, 3, '2022-08-08 10:55:02', '31.3521087', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:55:02', '2022-08-08 17:55:02'),
(1203, NULL, 3, '2022-08-08 10:55:14', '31.3521142', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:55:14', '2022-08-08 17:55:14'),
(1204, NULL, 3, '2022-08-08 10:55:24', '31.3521173', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:55:24', '2022-08-08 17:55:24'),
(1205, NULL, 3, '2022-08-08 10:55:32', '31.3521182', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:55:32', '2022-08-08 17:55:32'),
(1206, NULL, 3, '2022-08-08 10:55:52', '31.3521167', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:55:52', '2022-08-08 17:55:52'),
(1207, NULL, 3, '2022-08-08 10:56:02', '31.35211', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:56:02', '2022-08-08 17:56:02'),
(1208, NULL, 3, '2022-08-08 10:56:14', '31.3521118', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:56:14', '2022-08-08 17:56:14'),
(1209, NULL, 3, '2022-08-08 10:56:24', '31.352108', '30.1790566', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:56:24', '2022-08-08 17:56:24'),
(1210, NULL, 3, '2022-08-08 10:56:34', '31.3521038', '30.1790587', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 17:56:34', '2022-08-08 17:56:34'),
(1211, NULL, 3, '2022-08-08 10:56:44', '31.3521452', '30.1790609', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:56:44', '2022-08-08 17:56:44'),
(1212, NULL, 3, '2022-08-08 10:56:54', '31.3521082', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:56:54', '2022-08-08 17:56:54'),
(1213, NULL, 3, '2022-08-08 10:57:04', '31.3521187', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:57:04', '2022-08-08 17:57:04'),
(1214, NULL, 3, '2022-08-08 10:57:13', '31.3521116', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:57:13', '2022-08-08 17:57:13'),
(1215, NULL, 3, '2022-08-08 10:57:23', '31.3521186', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:57:23', '2022-08-08 17:57:23'),
(1216, NULL, 3, '2022-08-08 10:57:34', '31.3521143', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:57:34', '2022-08-08 17:57:34'),
(1217, NULL, 3, '2022-08-08 10:57:44', '31.35211', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:57:44', '2022-08-08 17:57:44'),
(1218, NULL, 3, '2022-08-08 10:57:54', '31.3521105', '30.1790543', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:57:54', '2022-08-08 17:57:54'),
(1219, NULL, 3, '2022-08-08 10:58:07', '31.3521128', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:58:07', '2022-08-08 17:58:07'),
(1220, NULL, 3, '2022-08-08 10:58:19', '31.3521132', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:58:19', '2022-08-08 17:58:19'),
(1221, NULL, 3, '2022-08-08 10:58:29', '31.35211', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:58:29', '2022-08-08 17:58:29'),
(1222, NULL, 3, '2022-08-08 10:58:39', '31.3521122', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:58:39', '2022-08-08 17:58:39'),
(1223, NULL, 3, '2022-08-08 10:58:49', '31.3521141', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:58:49', '2022-08-08 17:58:49'),
(1224, NULL, 3, '2022-08-08 10:58:59', '31.3521092', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:58:59', '2022-08-08 17:58:59'),
(1225, NULL, 3, '2022-08-08 10:59:09', '31.3521153', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:59:09', '2022-08-08 17:59:09'),
(1226, NULL, 3, '2022-08-08 10:59:19', '31.3521104', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:59:19', '2022-08-08 17:59:19'),
(1227, NULL, 3, '2022-08-08 10:59:29', '31.3521119', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:59:29', '2022-08-08 17:59:29'),
(1228, NULL, 3, '2022-08-08 10:59:40', '31.352112', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:59:40', '2022-08-08 17:59:40'),
(1229, NULL, 3, '2022-08-08 10:59:49', '31.3521123', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:59:49', '2022-08-08 17:59:49'),
(1230, NULL, 3, '2022-08-08 10:59:59', '31.3521133', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 17:59:59', '2022-08-08 17:59:59'),
(1231, NULL, 3, '2022-08-08 11:00:09', '31.3521168', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:00:09', '2022-08-08 18:00:09'),
(1232, NULL, 3, '2022-08-08 11:00:19', '31.3521161', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:00:19', '2022-08-08 18:00:19'),
(1233, NULL, 3, '2022-08-08 11:00:29', '31.3521111', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:00:29', '2022-08-08 18:00:29'),
(1234, NULL, 3, '2022-08-08 11:00:39', '31.3521129', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:00:39', '2022-08-08 18:00:39'),
(1235, NULL, 3, '2022-08-08 11:00:49', '31.3521146', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:00:49', '2022-08-08 18:00:49'),
(1236, NULL, 3, '2022-08-08 11:00:59', '31.3521175', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:00:59', '2022-08-08 18:00:59'),
(1237, NULL, 3, '2022-08-08 11:01:10', '31.3521138', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:01:10', '2022-08-08 18:01:10'),
(1238, NULL, 3, '2022-08-08 11:01:19', '31.3521115', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:01:19', '2022-08-08 18:01:19'),
(1239, NULL, 3, '2022-08-08 11:01:29', '31.3521024', '30.1790598', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:01:29', '2022-08-08 18:01:29'),
(1240, NULL, 3, '2022-08-08 11:01:39', '31.3521125', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:01:39', '2022-08-08 18:01:39'),
(1241, NULL, 3, '2022-08-08 11:01:56', '31.3521155', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:01:56', '2022-08-08 18:01:56'),
(1242, NULL, 3, '2022-08-08 11:02:06', '31.3521111', '30.1790545', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:02:06', '2022-08-08 18:02:06'),
(1243, NULL, 3, '2022-08-08 11:02:16', '31.3521126', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:02:16', '2022-08-08 18:02:16'),
(1244, NULL, 3, '2022-08-08 11:02:26', '31.3521127', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:02:26', '2022-08-08 18:02:26'),
(1245, NULL, 3, '2022-08-08 11:02:36', '31.3521103', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:02:36', '2022-08-08 18:02:36'),
(1246, NULL, 3, '2022-08-08 11:02:46', '31.3521167', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:02:46', '2022-08-08 18:02:46'),
(1247, NULL, 3, '2022-08-08 11:02:55', '31.3521123', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:02:55', '2022-08-08 18:02:55'),
(1248, NULL, 3, '2022-08-08 11:03:06', '31.3521137', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:03:06', '2022-08-08 18:03:06'),
(1249, NULL, 3, '2022-08-08 11:03:16', '31.3521121', '30.179054', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:03:16', '2022-08-08 18:03:16'),
(1250, NULL, 3, '2022-08-08 11:03:26', '31.3521171', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:03:26', '2022-08-08 18:03:26'),
(1251, NULL, 3, '2022-08-08 11:03:36', '31.3521127', '30.1790543', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:03:36', '2022-08-08 18:03:36'),
(1252, NULL, 3, '2022-08-08 11:03:46', '31.3521122', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:03:46', '2022-08-08 18:03:46'),
(1253, NULL, 3, '2022-08-08 11:03:56', '31.3521132', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:03:56', '2022-08-08 18:03:56'),
(1254, NULL, 3, '2022-08-08 11:04:06', '31.3521145', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:04:06', '2022-08-08 18:04:06'),
(1255, NULL, 3, '2022-08-08 11:04:17', '31.3521158', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:04:17', '2022-08-08 18:04:17'),
(1256, NULL, 3, '2022-08-08 11:04:26', '31.3521145', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:04:26', '2022-08-08 18:04:26'),
(1257, NULL, 3, '2022-08-08 11:04:36', '31.3521152', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:04:36', '2022-08-08 18:04:36'),
(1258, NULL, 3, '2022-08-08 11:04:46', '31.3521023', '30.1790595', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:04:46', '2022-08-08 18:04:46'),
(1259, NULL, 3, '2022-08-08 11:04:56', '31.3521136', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:04:56', '2022-08-08 18:04:56'),
(1260, NULL, 3, '2022-08-08 11:05:06', '31.352112', '30.179054', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:05:06', '2022-08-08 18:05:06'),
(1261, NULL, 3, '2022-08-08 11:05:16', '31.3521109', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:05:16', '2022-08-08 18:05:16'),
(1262, NULL, 3, '2022-08-08 11:05:26', '31.3521102', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:05:26', '2022-08-08 18:05:26'),
(1263, NULL, 3, '2022-08-08 11:05:36', '31.3521148', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:05:36', '2022-08-08 18:05:36'),
(1264, NULL, 3, '2022-08-08 11:05:46', '31.3521157', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:05:46', '2022-08-08 18:05:46'),
(1265, NULL, 3, '2022-08-08 11:05:57', '31.3521122', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:05:57', '2022-08-08 18:05:57'),
(1266, NULL, 3, '2022-08-08 11:06:06', '31.3521125', '30.1790541', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:06:06', '2022-08-08 18:06:06'),
(1267, NULL, 3, '2022-08-08 11:06:17', '31.3521138', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:06:17', '2022-08-08 18:06:17'),
(1268, NULL, 3, '2022-08-08 11:06:27', '31.3521169', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:06:27', '2022-08-08 18:06:27'),
(1269, NULL, 3, '2022-08-08 11:06:37', '31.3521096', '30.1790543', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:06:37', '2022-08-08 18:06:37'),
(1270, NULL, 3, '2022-08-08 11:06:47', '31.352117', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:06:47', '2022-08-08 18:06:47'),
(1271, NULL, 3, '2022-08-08 11:06:57', '31.3521194', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:06:57', '2022-08-08 18:06:57'),
(1272, NULL, 3, '2022-08-08 11:07:07', '31.3521126', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:07:07', '2022-08-08 18:07:07'),
(1273, NULL, 3, '2022-08-08 11:07:17', '31.3521104', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:07:17', '2022-08-08 18:07:17'),
(1274, NULL, 3, '2022-08-08 11:07:27', '31.3521119', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:07:27', '2022-08-08 18:07:27'),
(1275, NULL, 3, '2022-08-08 11:07:36', '31.3521178', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:07:36', '2022-08-08 18:07:36'),
(1276, NULL, 3, '2022-08-08 11:07:46', '31.3521465', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:07:46', '2022-08-08 18:07:46'),
(1277, NULL, 3, '2022-08-08 11:07:56', '31.3521759', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:07:56', '2022-08-08 18:07:56'),
(1278, NULL, 3, '2022-08-08 11:08:06', '31.352201', '30.179064', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:08:06', '2022-08-08 18:08:06'),
(1279, NULL, 3, '2022-08-08 11:08:17', '31.3522278', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:08:17', '2022-08-08 18:08:17'),
(1280, NULL, 3, '2022-08-08 11:08:25', '31.3522278', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:08:25', '2022-08-08 18:08:25'),
(1281, NULL, 3, '2022-08-08 11:08:36', '31.352116', '30.1790635', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:08:36', '2022-08-08 18:08:36'),
(1282, NULL, 3, '2022-08-08 11:08:46', '31.3521245', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:08:46', '2022-08-08 18:08:46'),
(1283, NULL, 3, '2022-08-08 11:08:57', '31.352129', '30.1790923', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:08:57', '2022-08-08 18:08:57'),
(1284, NULL, 3, '2022-08-08 11:09:06', '31.3521101', '30.1790632', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:09:06', '2022-08-08 18:09:06'),
(1285, NULL, 3, '2022-08-08 11:09:17', '31.3521297', '30.179093', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:09:17', '2022-08-08 18:09:17'),
(1286, NULL, 3, '2022-08-08 11:09:25', '31.3521312', '30.1790952', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:09:25', '2022-08-08 18:09:25'),
(1287, NULL, 3, '2022-08-08 11:09:35', '31.3521163', '30.1790645', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:09:35', '2022-08-08 18:09:35'),
(1288, NULL, 3, '2022-08-08 11:09:44', '31.3521151', '30.1790628', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:09:44', '2022-08-08 18:09:44'),
(1289, NULL, 3, '2022-08-08 11:09:55', '31.3521102', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:09:55', '2022-08-08 18:09:55'),
(1290, NULL, 3, '2022-08-08 11:10:05', '31.3521399', '30.1791013', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:10:05', '2022-08-08 18:10:05'),
(1291, NULL, 3, '2022-08-08 11:10:15', '31.352118', '30.1790709', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:10:15', '2022-08-08 18:10:15'),
(1292, NULL, 3, '2022-08-08 11:10:25', '31.3521174', '30.1790718', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:10:25', '2022-08-08 18:10:25'),
(1293, NULL, 3, '2022-08-08 11:10:35', '31.3521336', '30.1791012', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:10:35', '2022-08-08 18:10:35'),
(1294, NULL, 3, '2022-08-08 11:10:45', '31.3521457', '30.1791146', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:10:45', '2022-08-08 18:10:45'),
(1295, NULL, 3, '2022-08-08 11:10:55', '31.3521186', '30.1790722', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:10:55', '2022-08-08 18:10:55'),
(1296, NULL, 3, '2022-08-08 11:11:05', '31.3521324', '30.1790959', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:11:05', '2022-08-08 18:11:05'),
(1297, NULL, 3, '2022-08-08 11:11:14', '31.3521156', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:11:14', '2022-08-08 18:11:14'),
(1298, NULL, 3, '2022-08-08 11:11:25', '31.3521155', '30.179063', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:11:25', '2022-08-08 18:11:25'),
(1299, NULL, 3, '2022-08-08 11:11:35', '31.3521155', '30.179063', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:11:35', '2022-08-08 18:11:35'),
(1300, NULL, 3, '2022-08-08 11:11:44', '31.3522029', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:11:44', '2022-08-08 18:11:44'),
(1301, NULL, 3, '2022-08-08 11:11:55', '31.352119', '30.1790626', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:11:55', '2022-08-08 18:11:55'),
(1302, NULL, 3, '2022-08-08 11:12:05', '31.3521372', '30.179107', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:12:05', '2022-08-08 18:12:05'),
(1303, NULL, 3, '2022-08-08 11:12:15', '31.352114', '30.1790674', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:12:15', '2022-08-08 18:12:15'),
(1304, NULL, 3, '2022-08-08 11:12:25', '31.3521478', '30.1790785', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:12:25', '2022-08-08 18:12:25'),
(1305, NULL, 3, '2022-08-08 11:12:35', '31.3521506', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:12:35', '2022-08-08 18:12:35'),
(1306, NULL, 3, '2022-08-08 11:12:45', '31.3521192', '30.1790698', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:12:45', '2022-08-08 18:12:45'),
(1307, NULL, 3, '2022-08-08 11:12:55', '31.3521153', '30.1790638', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:12:55', '2022-08-08 18:12:55'),
(1308, NULL, 3, '2022-08-08 11:13:05', '31.3521623', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:13:05', '2022-08-08 18:13:05'),
(1309, NULL, 3, '2022-08-08 11:13:15', '31.3521635', '30.1791037', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:13:15', '2022-08-08 18:13:15'),
(1310, NULL, 3, '2022-08-08 11:13:24', '31.3521093', '30.1790638', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:13:24', '2022-08-08 18:13:24'),
(1311, NULL, 3, '2022-08-08 11:13:35', '31.3521103', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:13:35', '2022-08-08 18:13:35'),
(1312, NULL, 3, '2022-08-08 11:13:45', '31.3521103', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:13:45', '2022-08-08 18:13:45'),
(1313, NULL, 3, '2022-08-08 11:13:55', '31.3521211', '30.1790621', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:13:55', '2022-08-08 18:13:55'),
(1314, NULL, 3, '2022-08-08 11:14:04', '31.3521318', '30.1790901', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:14:04', '2022-08-08 18:14:04'),
(1315, NULL, 3, '2022-08-08 11:14:15', '31.3521498', '30.1791174', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:14:15', '2022-08-08 18:14:15'),
(1316, NULL, 3, '2022-08-08 11:14:25', '31.3521194', '30.1790623', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:14:25', '2022-08-08 18:14:25'),
(1317, NULL, 3, '2022-08-08 11:14:34', '31.3521564', '30.17913', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:14:34', '2022-08-08 18:14:34'),
(1318, NULL, 3, '2022-08-08 11:14:45', '31.3521161', '30.1790611', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:14:45', '2022-08-08 18:14:45'),
(1319, NULL, 3, '2022-08-08 11:14:56', '31.3521089', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:14:56', '2022-08-08 18:14:56'),
(1320, NULL, 3, '2022-08-08 11:15:06', '31.3521001', '30.1790578', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:15:06', '2022-08-08 18:15:06'),
(1321, NULL, 3, '2022-08-08 11:15:15', '31.3521237', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:15:15', '2022-08-08 18:15:15'),
(1322, NULL, 3, '2022-08-08 11:15:25', '31.3521134', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:15:25', '2022-08-08 18:15:25'),
(1323, NULL, 3, '2022-08-08 11:15:35', '31.3521125', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:15:35', '2022-08-08 18:15:35'),
(1324, NULL, 3, '2022-08-08 11:15:45', '31.3521488', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:15:45', '2022-08-08 18:15:45'),
(1325, NULL, 3, '2022-08-08 11:15:55', '31.352103', '30.1790639', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:15:55', '2022-08-08 18:15:55'),
(1326, NULL, 3, '2022-08-08 11:16:05', '31.3520968', '30.1790541', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:16:05', '2022-08-08 18:16:05'),
(1327, NULL, 3, '2022-08-08 11:16:15', '31.3521927', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:16:15', '2022-08-08 18:16:15'),
(1328, NULL, 3, '2022-08-08 11:16:24', '31.3522308', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:16:24', '2022-08-08 18:16:24'),
(1329, NULL, 3, '2022-08-08 11:16:35', '31.3521659', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:16:35', '2022-08-08 18:16:35'),
(1330, NULL, 3, '2022-08-08 11:16:45', '31.3521121', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:16:45', '2022-08-08 18:16:45'),
(1331, NULL, 3, '2022-08-08 11:16:55', '31.3521127', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:16:55', '2022-08-08 18:16:55'),
(1332, NULL, 3, '2022-08-08 11:17:05', '31.3521139', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:17:05', '2022-08-08 18:17:05'),
(1333, NULL, 3, '2022-08-08 11:17:15', '31.3521118', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:17:15', '2022-08-08 18:17:15'),
(1334, NULL, 3, '2022-08-08 11:17:25', '31.3521119', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:17:25', '2022-08-08 18:17:25'),
(1335, NULL, 3, '2022-08-08 11:17:35', '31.3521148', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:17:35', '2022-08-08 18:17:35'),
(1336, NULL, 3, '2022-08-08 11:17:44', '31.3521125', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:17:44', '2022-08-08 18:17:44'),
(1337, NULL, 3, '2022-08-08 11:17:55', '31.3521123', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:17:55', '2022-08-08 18:17:55'),
(1338, NULL, 3, '2022-08-08 11:18:05', '31.3522091', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:18:05', '2022-08-08 18:18:05'),
(1339, NULL, 3, '2022-08-08 11:18:15', '31.3521136', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:18:15', '2022-08-08 18:18:15'),
(1340, NULL, 3, '2022-08-08 11:18:25', '31.3521183', '30.1790462', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:18:25', '2022-08-08 18:18:25'),
(1341, NULL, 3, '2022-08-08 11:18:35', '31.3521173', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:18:35', '2022-08-08 18:18:35'),
(1342, NULL, 3, '2022-08-08 11:18:44', '31.3521118', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:18:44', '2022-08-08 18:18:44'),
(1343, NULL, 3, '2022-08-08 11:18:55', '31.3521118', '30.1790594', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:18:55', '2022-08-08 18:18:55'),
(1344, NULL, 3, '2022-08-08 11:19:05', '31.3521114', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:19:05', '2022-08-08 18:19:05'),
(1345, NULL, 3, '2022-08-08 11:19:15', '31.3521117', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:19:15', '2022-08-08 18:19:15'),
(1346, NULL, 3, '2022-08-08 11:19:25', '31.3521107', '30.1790535', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:19:25', '2022-08-08 18:19:25'),
(1347, NULL, 3, '2022-08-08 11:19:35', '31.3521381', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:19:35', '2022-08-08 18:19:35'),
(1348, NULL, 3, '2022-08-08 11:19:45', '31.3521086', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:19:45', '2022-08-08 18:19:45'),
(1349, NULL, 3, '2022-08-08 11:19:55', '31.352114', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:19:55', '2022-08-08 18:19:55'),
(1350, NULL, 3, '2022-08-08 11:20:05', '31.3521165', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:20:05', '2022-08-08 18:20:05'),
(1351, NULL, 3, '2022-08-08 11:20:15', '31.3521979', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:20:15', '2022-08-08 18:20:15'),
(1352, NULL, 3, '2022-08-08 11:20:24', '31.3521195', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:20:24', '2022-08-08 18:20:24'),
(1353, NULL, 3, '2022-08-08 11:20:35', '31.352113', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:20:35', '2022-08-08 18:20:35'),
(1354, NULL, 3, '2022-08-08 11:20:45', '31.352207', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:20:45', '2022-08-08 18:20:45'),
(1355, NULL, 3, '2022-08-08 11:20:55', '31.3521221', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:20:55', '2022-08-08 18:20:55'),
(1356, NULL, 3, '2022-08-08 11:21:05', '31.352109', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:21:05', '2022-08-08 18:21:05'),
(1357, NULL, 3, '2022-08-08 11:21:14', '31.3521125', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:21:14', '2022-08-08 18:21:14'),
(1358, NULL, 3, '2022-08-08 11:21:26', '31.3521127', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:21:26', '2022-08-08 18:21:26'),
(1359, NULL, 3, '2022-08-08 11:21:37', '31.3521125', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:21:37', '2022-08-08 18:21:37'),
(1360, NULL, 3, '2022-08-08 11:21:46', '31.3521198', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:21:46', '2022-08-08 18:21:46'),
(1361, NULL, 3, '2022-08-08 11:21:56', '31.352209', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:21:56', '2022-08-08 18:21:56'),
(1362, NULL, 3, '2022-08-08 11:22:06', '31.3521131', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:22:06', '2022-08-08 18:22:06'),
(1363, NULL, 3, '2022-08-08 11:22:16', '31.35211', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:22:16', '2022-08-08 18:22:16'),
(1364, NULL, 3, '2022-08-08 11:22:26', '31.3521145', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:22:26', '2022-08-08 18:22:26'),
(1365, NULL, 3, '2022-08-08 11:22:36', '31.3521114', '30.1790543', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:22:36', '2022-08-08 18:22:36'),
(1366, NULL, 3, '2022-08-08 11:22:46', '31.3521437', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:22:46', '2022-08-08 18:22:46'),
(1367, NULL, 3, '2022-08-08 11:22:57', '31.3521373', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:22:57', '2022-08-08 18:22:57'),
(1368, NULL, 3, '2022-08-08 11:23:06', '31.3521488', '30.1790543', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:23:06', '2022-08-08 18:23:06'),
(1369, NULL, 3, '2022-08-08 11:23:16', '31.3521085', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:23:16', '2022-08-08 18:23:16'),
(1370, NULL, 3, '2022-08-08 11:23:27', '31.3521099', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:23:27', '2022-08-08 18:23:27'),
(1371, NULL, 3, '2022-08-08 11:23:36', '31.3521103', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:23:36', '2022-08-08 18:23:36'),
(1372, NULL, 3, '2022-08-08 11:23:47', '31.3521344', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:23:47', '2022-08-08 18:23:47'),
(1373, NULL, 3, '2022-08-08 11:23:57', '31.3521439', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:23:57', '2022-08-08 18:23:57'),
(1374, NULL, 3, '2022-08-08 11:24:07', '31.3521579', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:24:07', '2022-08-08 18:24:07'),
(1375, NULL, 3, '2022-08-08 11:24:17', '31.3521471', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:24:17', '2022-08-08 18:24:17'),
(1376, NULL, 3, '2022-08-08 11:24:27', '31.3521385', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:24:27', '2022-08-08 18:24:27'),
(1377, NULL, 3, '2022-08-08 11:24:37', '31.352146', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:24:37', '2022-08-08 18:24:37'),
(1378, NULL, 3, '2022-08-08 11:24:46', '31.3521085', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:24:46', '2022-08-08 18:24:46'),
(1379, NULL, 3, '2022-08-08 11:24:57', '31.3521469', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:24:57', '2022-08-08 18:24:57'),
(1380, NULL, 3, '2022-08-08 11:25:07', '31.3521101', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:25:07', '2022-08-08 18:25:07'),
(1381, NULL, 3, '2022-08-08 11:25:17', '31.3521488', '30.1790545', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:25:17', '2022-08-08 18:25:17'),
(1382, NULL, 3, '2022-08-08 11:25:27', '31.3521312', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:25:27', '2022-08-08 18:25:27'),
(1383, NULL, 3, '2022-08-08 11:25:37', '31.3521084', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:25:37', '2022-08-08 18:25:37'),
(1384, NULL, 3, '2022-08-08 11:25:47', '31.3521378', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:25:47', '2022-08-08 18:25:47');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1385, NULL, 3, '2022-08-08 11:25:57', '31.3521091', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:25:57', '2022-08-08 18:25:57'),
(1386, NULL, 3, '2022-08-08 11:26:07', '31.3521126', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:26:07', '2022-08-08 18:26:07'),
(1387, NULL, 3, '2022-08-08 11:26:17', '31.3521125', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:26:17', '2022-08-08 18:26:17'),
(1388, NULL, 3, '2022-08-08 11:26:27', '31.3521448', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:26:27', '2022-08-08 18:26:27'),
(1389, NULL, 3, '2022-08-08 11:26:37', '31.3521104', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:26:37', '2022-08-08 18:26:37'),
(1390, NULL, 3, '2022-08-08 11:26:47', '31.3521126', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:26:47', '2022-08-08 18:26:47'),
(1391, NULL, 3, '2022-08-08 11:26:58', '31.352138', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:26:58', '2022-08-08 18:26:58'),
(1392, NULL, 3, '2022-08-08 11:27:07', '31.3521123', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:27:07', '2022-08-08 18:27:07'),
(1393, NULL, 3, '2022-08-08 11:27:17', '31.3521103', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:27:17', '2022-08-08 18:27:17'),
(1394, NULL, 3, '2022-08-08 11:27:27', '31.3521347', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:27:27', '2022-08-08 18:27:27'),
(1395, NULL, 3, '2022-08-08 11:27:37', '31.3521104', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:27:37', '2022-08-08 18:27:37'),
(1396, NULL, 3, '2022-08-08 11:27:47', '31.3521087', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:27:47', '2022-08-08 18:27:47'),
(1397, NULL, 3, '2022-08-08 11:27:57', '31.3521114', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:27:57', '2022-08-08 18:27:57'),
(1398, NULL, 3, '2022-08-08 11:28:07', '31.3521239', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:28:07', '2022-08-08 18:28:07'),
(1399, NULL, 3, '2022-08-08 11:28:17', '31.3521488', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:28:17', '2022-08-08 18:28:17'),
(1400, NULL, 3, '2022-08-08 11:28:27', '31.3521363', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:28:27', '2022-08-08 18:28:27'),
(1401, NULL, 3, '2022-08-08 11:28:37', '31.3521084', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:28:37', '2022-08-08 18:28:37'),
(1402, NULL, 3, '2022-08-08 11:28:47', '31.3521473', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:28:47', '2022-08-08 18:28:47'),
(1403, NULL, 3, '2022-08-08 11:28:57', '31.352109', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:28:57', '2022-08-08 18:28:57'),
(1404, NULL, 3, '2022-08-08 11:29:07', '31.3521101', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:29:07', '2022-08-08 18:29:07'),
(1405, NULL, 3, '2022-08-08 11:29:17', '31.3521463', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:29:17', '2022-08-08 18:29:17'),
(1406, NULL, 3, '2022-08-08 11:29:27', '31.3521038', '30.1790587', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:29:27', '2022-08-08 18:29:27'),
(1407, NULL, 3, '2022-08-08 11:29:37', '31.3521063', '30.1790585', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:29:37', '2022-08-08 18:29:37'),
(1408, NULL, 3, '2022-08-08 11:29:47', '31.352144', '30.1790548', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:29:47', '2022-08-08 18:29:47'),
(1409, NULL, 3, '2022-08-08 11:29:57', '31.3521456', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:29:57', '2022-08-08 18:29:57'),
(1410, NULL, 3, '2022-08-08 11:30:07', '31.3521109', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:30:07', '2022-08-08 18:30:07'),
(1411, NULL, 3, '2022-08-08 11:30:17', '31.3521337', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:30:17', '2022-08-08 18:30:17'),
(1412, NULL, 3, '2022-08-08 11:30:27', '31.3521343', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:30:27', '2022-08-08 18:30:27'),
(1413, NULL, 3, '2022-08-08 11:30:37', '31.3521116', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:30:37', '2022-08-08 18:30:37'),
(1414, NULL, 3, '2022-08-08 11:30:47', '31.3521582', '30.1790538', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:30:47', '2022-08-08 18:30:47'),
(1415, NULL, 3, '2022-08-08 11:30:57', '31.352108', '30.1790582', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:30:57', '2022-08-08 18:30:57'),
(1416, NULL, 3, '2022-08-08 11:31:07', '31.3521459', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:31:07', '2022-08-08 18:31:07'),
(1417, NULL, 3, '2022-08-08 11:31:17', '31.3521078', '30.179057', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:31:17', '2022-08-08 18:31:17'),
(1418, NULL, 3, '2022-08-08 11:31:27', '31.3521102', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:31:27', '2022-08-08 18:31:27'),
(1419, NULL, 3, '2022-08-08 11:31:37', '31.3521127', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:31:37', '2022-08-08 18:31:37'),
(1420, NULL, 3, '2022-08-08 11:31:47', '31.3521368', '30.1790546', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:31:47', '2022-08-08 18:31:47'),
(1421, NULL, 3, '2022-08-08 11:31:57', '31.3521128', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:31:57', '2022-08-08 18:31:57'),
(1422, NULL, 3, '2022-08-08 11:32:07', '31.3521111', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:32:07', '2022-08-08 18:32:07'),
(1423, NULL, 3, '2022-08-08 11:32:17', '31.3521072', '30.1790572', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:32:17', '2022-08-08 18:32:17'),
(1424, NULL, 3, '2022-08-08 11:32:27', '31.3521278', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:32:27', '2022-08-08 18:32:27'),
(1425, NULL, 3, '2022-08-08 11:32:37', '31.3521277', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:32:37', '2022-08-08 18:32:37'),
(1426, NULL, 3, '2022-08-08 11:32:47', '31.352138', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:32:47', '2022-08-08 18:32:47'),
(1427, NULL, 3, '2022-08-08 11:32:57', '31.3521353', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:32:57', '2022-08-08 18:32:57'),
(1428, NULL, 3, '2022-08-08 11:33:07', '31.3521273', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:33:07', '2022-08-08 18:33:07'),
(1429, NULL, 3, '2022-08-08 11:33:17', '31.3521091', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:33:17', '2022-08-08 18:33:17'),
(1430, NULL, 3, '2022-08-08 11:33:27', '31.3521133', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:33:27', '2022-08-08 18:33:27'),
(1431, NULL, 3, '2022-08-08 11:33:37', '31.3521093', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:33:37', '2022-08-08 18:33:37'),
(1432, NULL, 3, '2022-08-08 11:33:47', '31.3521103', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:33:47', '2022-08-08 18:33:47'),
(1433, NULL, 3, '2022-08-08 11:33:57', '31.3521103', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:33:57', '2022-08-08 18:33:57'),
(1434, NULL, 3, '2022-08-08 11:34:07', '31.3521268', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:34:07', '2022-08-08 18:34:07'),
(1435, NULL, 3, '2022-08-08 11:34:17', '31.3521275', '30.1790542', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:34:17', '2022-08-08 18:34:17'),
(1436, NULL, 3, '2022-08-08 11:34:27', '31.3521115', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:34:27', '2022-08-08 18:34:27'),
(1437, NULL, 3, '2022-08-08 11:34:37', '31.3521436', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:34:37', '2022-08-08 18:34:37'),
(1438, NULL, 3, '2022-08-08 11:34:47', '31.3521457', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:34:47', '2022-08-08 18:34:47'),
(1439, NULL, 3, '2022-08-08 11:34:55', '31.3521093', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:34:55', '2022-08-08 18:34:55'),
(1440, NULL, 3, '2022-08-08 11:35:05', '31.3521099', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:35:05', '2022-08-08 18:35:05'),
(1441, NULL, 3, '2022-08-08 11:35:14', '31.3521094', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:35:14', '2022-08-08 18:35:14'),
(1442, NULL, 3, '2022-08-08 11:35:25', '31.3521077', '30.1790569', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:35:25', '2022-08-08 18:35:25'),
(1443, NULL, 3, '2022-08-08 11:35:35', '31.3521071', '30.1790572', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:35:35', '2022-08-08 18:35:35'),
(1444, NULL, 3, '2022-08-08 11:35:45', '31.3521097', '30.1790546', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:35:45', '2022-08-08 18:35:45'),
(1445, NULL, 3, '2022-08-08 11:35:55', '31.3521108', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:35:55', '2022-08-08 18:35:55'),
(1446, NULL, 3, '2022-08-08 11:36:05', '31.3521109', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:36:05', '2022-08-08 18:36:05'),
(1447, NULL, 3, '2022-08-08 11:36:15', '31.3521077', '30.1790555', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:36:15', '2022-08-08 18:36:15'),
(1448, NULL, 3, '2022-08-08 11:36:25', '31.3521093', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:36:25', '2022-08-08 18:36:25'),
(1449, NULL, 3, '2022-08-08 11:36:35', '31.3521684', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:36:35', '2022-08-08 18:36:35'),
(1450, NULL, 3, '2022-08-08 11:36:45', '31.3521439', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:36:45', '2022-08-08 18:36:45'),
(1451, NULL, 3, '2022-08-08 11:36:55', '31.3521542', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:36:55', '2022-08-08 18:36:55'),
(1452, NULL, 3, '2022-08-08 11:37:05', '31.3521096', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:37:05', '2022-08-08 18:37:05'),
(1453, NULL, 3, '2022-08-08 11:37:15', '31.3521073', '30.1790571', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:37:15', '2022-08-08 18:37:15'),
(1454, NULL, 3, '2022-08-08 11:37:25', '31.3521626', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:37:25', '2022-08-08 18:37:25'),
(1455, NULL, 3, '2022-08-08 11:37:35', '31.352112', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:37:35', '2022-08-08 18:37:35'),
(1456, NULL, 3, '2022-08-08 11:37:45', '31.3521525', '30.1790536', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:37:45', '2022-08-08 18:37:45'),
(1457, NULL, 3, '2022-08-08 11:37:55', '31.3521596', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:37:55', '2022-08-08 18:37:55'),
(1458, NULL, 3, '2022-08-08 11:38:05', '31.3521139', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:38:05', '2022-08-08 18:38:05'),
(1459, NULL, 3, '2022-08-08 11:38:15', '31.352176', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:38:15', '2022-08-08 18:38:15'),
(1460, NULL, 3, '2022-08-08 11:38:25', '31.3521496', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:38:25', '2022-08-08 18:38:25'),
(1461, NULL, 3, '2022-08-08 11:38:35', '31.3521106', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:38:35', '2022-08-08 18:38:35'),
(1462, NULL, 3, '2022-08-08 11:38:45', '31.3521665', '30.1790522', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:38:45', '2022-08-08 18:38:45'),
(1463, NULL, 3, '2022-08-08 11:38:55', '31.3521105', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:38:55', '2022-08-08 18:38:55'),
(1464, NULL, 3, '2022-08-08 11:39:05', '31.352112', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:39:05', '2022-08-08 18:39:05'),
(1465, NULL, 3, '2022-08-08 11:39:15', '31.3521398', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:39:15', '2022-08-08 18:39:15'),
(1466, NULL, 3, '2022-08-08 11:39:25', '31.3521716', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:39:25', '2022-08-08 18:39:25'),
(1467, NULL, 3, '2022-08-08 11:39:35', '31.3521655', '30.1790544', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:39:35', '2022-08-08 18:39:35'),
(1468, NULL, 3, '2022-08-08 11:39:45', '31.3521727', '30.1790528', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:39:45', '2022-08-08 18:39:45'),
(1469, NULL, 3, '2022-08-08 11:39:55', '31.3521643', '30.1790545', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:39:55', '2022-08-08 18:39:55'),
(1470, NULL, 3, '2022-08-08 11:40:07', '31.3521317', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:40:07', '2022-08-08 18:40:07'),
(1471, NULL, 3, '2022-08-08 11:40:16', '31.3521059', '30.1790569', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:40:16', '2022-08-08 18:40:16'),
(1472, NULL, 3, '2022-08-08 11:40:26', '31.3521069', '30.1790573', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:40:26', '2022-08-08 18:40:26'),
(1473, NULL, 3, '2022-08-08 11:40:35', '31.352166', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:40:35', '2022-08-08 18:40:35'),
(1474, NULL, 3, '2022-08-08 11:40:45', '31.3521093', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:40:45', '2022-08-08 18:40:45'),
(1475, NULL, 3, '2022-08-08 11:40:55', '31.3521072', '30.1790564', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:40:55', '2022-08-08 18:40:55'),
(1476, NULL, 3, '2022-08-08 11:41:05', '31.3521519', '30.1790539', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:41:05', '2022-08-08 18:41:05'),
(1477, NULL, 3, '2022-08-08 11:41:15', '31.3521079', '30.1790555', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:41:15', '2022-08-08 18:41:15'),
(1478, NULL, 3, '2022-08-08 11:41:25', '31.3520977', '30.179055', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:41:25', '2022-08-08 18:41:25'),
(1479, NULL, 3, '2022-08-08 11:41:35', '31.3521073', '30.179057', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:41:35', '2022-08-08 18:41:35'),
(1480, NULL, 3, '2022-08-08 11:41:45', '31.3521076', '30.1790555', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:41:45', '2022-08-08 18:41:45'),
(1481, NULL, 3, '2022-08-08 11:41:55', '31.3521722', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:41:55', '2022-08-08 18:41:55'),
(1482, NULL, 3, '2022-08-08 11:42:05', '31.3521063', '30.1790564', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:42:05', '2022-08-08 18:42:05'),
(1483, NULL, 3, '2022-08-08 11:42:15', '31.3521077', '30.1790563', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:42:15', '2022-08-08 18:42:15'),
(1484, NULL, 3, '2022-08-08 11:42:25', '31.3521099', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:42:25', '2022-08-08 18:42:25'),
(1485, NULL, 3, '2022-08-08 11:42:35', '31.3521093', '30.1790552', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:42:35', '2022-08-08 18:42:35'),
(1486, NULL, 3, '2022-08-08 11:42:45', '31.3521074', '30.1790572', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:42:45', '2022-08-08 18:42:45'),
(1487, NULL, 3, '2022-08-08 11:42:55', '31.3521723', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:42:55', '2022-08-08 18:42:55'),
(1488, NULL, 3, '2022-08-08 11:43:05', '31.3521093', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:43:05', '2022-08-08 18:43:05'),
(1489, NULL, 3, '2022-08-08 11:43:15', '31.3521077', '30.1790563', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:43:15', '2022-08-08 18:43:15'),
(1490, NULL, 3, '2022-08-08 11:43:25', '31.3521082', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:43:25', '2022-08-08 18:43:25'),
(1491, NULL, 3, '2022-08-08 11:43:35', '31.3521043', '30.179057', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:43:35', '2022-08-08 18:43:35'),
(1492, NULL, 3, '2022-08-08 11:43:45', '31.3521084', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:43:45', '2022-08-08 18:43:45'),
(1493, NULL, 3, '2022-08-08 11:43:55', '31.3521078', '30.1790563', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:43:55', '2022-08-08 18:43:55'),
(1494, NULL, 3, '2022-08-08 11:44:05', '31.3521063', '30.1790566', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:44:05', '2022-08-08 18:44:05'),
(1495, NULL, 3, '2022-08-08 11:44:15', '31.352108', '30.1790569', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:44:15', '2022-08-08 18:44:15'),
(1496, NULL, 3, '2022-08-08 11:44:25', '31.3522098', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:44:25', '2022-08-08 18:44:25'),
(1497, NULL, 3, '2022-08-08 11:44:35', '31.3521713', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:44:35', '2022-08-08 18:44:35'),
(1498, NULL, 3, '2022-08-08 11:44:45', '31.3521099', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:44:45', '2022-08-08 18:44:45'),
(1499, NULL, 3, '2022-08-08 11:44:54', '31.3521106', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:44:54', '2022-08-08 18:44:54'),
(1500, NULL, 3, '2022-08-08 11:45:05', '31.3521189', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:45:05', '2022-08-08 18:45:05'),
(1501, NULL, 3, '2022-08-08 11:45:15', '31.3521089', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:45:15', '2022-08-08 18:45:15'),
(1502, NULL, 3, '2022-08-08 11:45:25', '31.3521071', '30.1790566', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:45:25', '2022-08-08 18:45:25'),
(1503, NULL, 3, '2022-08-08 11:45:35', '31.3521027', '30.1790598', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:45:35', '2022-08-08 18:45:35'),
(1504, NULL, 3, '2022-08-08 11:45:44', '31.3521045', '30.1790573', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:45:44', '2022-08-08 18:45:44'),
(1505, NULL, 3, '2022-08-08 11:45:55', '31.3521077', '30.1790571', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:45:55', '2022-08-08 18:45:55'),
(1506, NULL, 3, '2022-08-08 11:46:05', '31.3521296', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:46:05', '2022-08-08 18:46:05'),
(1507, NULL, 3, '2022-08-08 11:46:15', '31.352107', '30.1790623', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:46:15', '2022-08-08 18:46:15'),
(1508, NULL, 3, '2022-08-08 11:46:25', '31.352107', '30.1790623', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:46:25', '2022-08-08 18:46:25'),
(1509, NULL, 3, '2022-08-08 11:46:35', '31.3521109', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:46:35', '2022-08-08 18:46:35'),
(1510, NULL, 3, '2022-08-08 11:46:45', '31.3520964', '30.1790552', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:46:45', '2022-08-08 18:46:45'),
(1511, NULL, 3, '2022-08-08 11:46:55', '31.352212', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:46:55', '2022-08-08 18:46:55'),
(1512, NULL, 3, '2022-08-08 11:47:05', '31.3521063', '30.1790555', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:47:05', '2022-08-08 18:47:05'),
(1513, NULL, 3, '2022-08-08 11:47:15', '31.3520912', '30.179054', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:47:15', '2022-08-08 18:47:15'),
(1514, NULL, 3, '2022-08-08 11:47:25', '31.3522086', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:47:25', '2022-08-08 18:47:25'),
(1515, NULL, 3, '2022-08-08 11:47:35', '31.3522111', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:47:35', '2022-08-08 18:47:35'),
(1516, NULL, 3, '2022-08-08 11:47:45', '31.3521508', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:47:45', '2022-08-08 18:47:45'),
(1517, NULL, 3, '2022-08-08 11:47:55', '31.3522124', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:47:55', '2022-08-08 18:47:55'),
(1518, NULL, 3, '2022-08-08 11:48:05', '31.3522114', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:48:05', '2022-08-08 18:48:05'),
(1519, NULL, 3, '2022-08-08 11:48:15', '31.3521047', '30.1790555', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:48:15', '2022-08-08 18:48:15'),
(1520, NULL, 3, '2022-08-08 11:48:25', '31.3522107', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:48:25', '2022-08-08 18:48:25'),
(1521, NULL, 3, '2022-08-08 11:48:35', '31.3521183', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:48:35', '2022-08-08 18:48:35'),
(1522, NULL, 3, '2022-08-08 11:48:45', '31.3520932', '30.1790537', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:48:45', '2022-08-08 18:48:45'),
(1523, NULL, 3, '2022-08-08 11:48:55', '31.3522109', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:48:55', '2022-08-08 18:48:55'),
(1524, NULL, 3, '2022-08-08 11:49:05', '31.3521051', '30.1790561', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:49:05', '2022-08-08 18:49:05'),
(1525, NULL, 3, '2022-08-08 11:49:15', '31.3520901', '30.1790537', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:49:15', '2022-08-08 18:49:15'),
(1526, NULL, 3, '2022-08-08 11:49:25', '31.3522094', '30.1790594', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:49:25', '2022-08-08 18:49:25'),
(1527, NULL, 3, '2022-08-08 11:49:35', '31.3522142', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:49:35', '2022-08-08 18:49:35'),
(1528, NULL, 3, '2022-08-08 11:49:45', '31.3521049', '30.1790548', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:49:45', '2022-08-08 18:49:45'),
(1529, NULL, 3, '2022-08-08 11:49:55', '31.3522108', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:49:55', '2022-08-08 18:49:55'),
(1530, NULL, 3, '2022-08-08 11:50:05', '31.3521041', '30.1790572', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:50:05', '2022-08-08 18:50:05'),
(1531, NULL, 3, '2022-08-08 11:50:15', '31.3520931', '30.1790552', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:50:15', '2022-08-08 18:50:15'),
(1532, NULL, 3, '2022-08-08 11:50:25', '31.3522125', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:50:25', '2022-08-08 18:50:25'),
(1533, NULL, 3, '2022-08-08 11:50:35', '31.3521088', '30.1790542', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:50:35', '2022-08-08 18:50:35'),
(1534, NULL, 3, '2022-08-08 11:50:45', '31.3522092', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:50:45', '2022-08-08 18:50:45'),
(1535, NULL, 3, '2022-08-08 11:50:55', '31.3522123', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:50:55', '2022-08-08 18:50:55'),
(1536, NULL, 3, '2022-08-08 11:51:05', '31.3521048', '30.1790553', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:51:05', '2022-08-08 18:51:05'),
(1537, NULL, 3, '2022-08-08 11:51:15', '31.3520908', '30.1790552', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:51:15', '2022-08-08 18:51:15'),
(1538, NULL, 3, '2022-08-08 11:51:25', '31.3520959', '30.1790548', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:51:25', '2022-08-08 18:51:25'),
(1539, NULL, 3, '2022-08-08 11:51:35', '31.3522121', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:51:35', '2022-08-08 18:51:35'),
(1540, NULL, 3, '2022-08-08 11:51:45', '31.3521103', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:51:45', '2022-08-08 18:51:45'),
(1541, NULL, 3, '2022-08-08 11:51:55', '31.3522128', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:51:55', '2022-08-08 18:51:55'),
(1542, NULL, 3, '2022-08-08 11:52:05', '31.3521074', '30.1790547', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:52:05', '2022-08-08 18:52:05'),
(1543, NULL, 3, '2022-08-08 11:52:15', '31.352218', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:52:15', '2022-08-08 18:52:15'),
(1544, NULL, 3, '2022-08-08 11:52:25', '31.3522214', '30.1790558', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:52:25', '2022-08-08 18:52:25'),
(1545, NULL, 3, '2022-08-08 11:52:35', '31.3522159', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:52:35', '2022-08-08 18:52:35'),
(1546, NULL, 3, '2022-08-08 11:52:45', '31.3522176', '30.1790561', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:52:45', '2022-08-08 18:52:45'),
(1547, NULL, 3, '2022-08-08 11:52:55', '31.3522189', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:52:55', '2022-08-08 18:52:55'),
(1548, NULL, 3, '2022-08-08 11:53:05', '31.352183', '30.1790442', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:53:05', '2022-08-08 18:53:05'),
(1549, NULL, 3, '2022-08-08 11:53:15', '31.3522156', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:53:15', '2022-08-08 18:53:15'),
(1550, NULL, 3, '2022-08-08 11:53:25', '31.3522172', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:53:25', '2022-08-08 18:53:25'),
(1551, NULL, 3, '2022-08-08 11:53:35', '31.3522021', '30.1790429', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:53:35', '2022-08-08 18:53:35'),
(1552, NULL, 3, '2022-08-08 11:53:45', '31.3522183', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:53:45', '2022-08-08 18:53:45'),
(1553, NULL, 3, '2022-08-08 11:53:55', '31.3522052', '30.1790428', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:53:55', '2022-08-08 18:53:55'),
(1554, NULL, 3, '2022-08-08 11:54:05', '31.3521935', '30.1790453', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:54:05', '2022-08-08 18:54:05'),
(1555, NULL, 3, '2022-08-08 11:54:15', '31.3522214', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:54:15', '2022-08-08 18:54:15'),
(1556, NULL, 3, '2022-08-08 11:54:25', '31.3522166', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:54:25', '2022-08-08 18:54:25'),
(1557, NULL, 3, '2022-08-08 11:54:35', '31.3522193', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:54:35', '2022-08-08 18:54:35'),
(1558, NULL, 3, '2022-08-08 11:54:45', '31.352216', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:54:45', '2022-08-08 18:54:45'),
(1559, NULL, 3, '2022-08-08 11:54:55', '31.3522062', '30.179043', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:54:55', '2022-08-08 18:54:55'),
(1560, NULL, 3, '2022-08-08 11:55:05', '31.3521808', '30.1790422', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:55:05', '2022-08-08 18:55:05'),
(1561, NULL, 3, '2022-08-08 11:55:15', '31.3522196', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:55:15', '2022-08-08 18:55:15'),
(1562, NULL, 3, '2022-08-08 11:55:25', '31.3522036', '30.1790428', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:55:25', '2022-08-08 18:55:25'),
(1563, NULL, 3, '2022-08-08 11:55:35', '31.3521267', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:55:35', '2022-08-08 18:55:35'),
(1564, NULL, 3, '2022-08-08 11:55:45', '31.3521357', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:55:45', '2022-08-08 18:55:45'),
(1565, NULL, 3, '2022-08-08 11:55:55', '31.3521089', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:55:55', '2022-08-08 18:55:55'),
(1566, NULL, 3, '2022-08-08 11:56:05', '31.3521261', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:56:05', '2022-08-08 18:56:05'),
(1567, NULL, 3, '2022-08-08 11:56:15', '31.3521991', '30.1790433', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:56:15', '2022-08-08 18:56:15'),
(1568, NULL, 3, '2022-08-08 11:56:25', '31.3522078', '30.179042', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:56:25', '2022-08-08 18:56:25'),
(1569, NULL, 3, '2022-08-08 11:56:36', '31.3522137', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:56:36', '2022-08-08 18:56:36'),
(1570, NULL, 3, '2022-08-08 11:56:46', '31.3521189', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:56:46', '2022-08-08 18:56:46'),
(1571, NULL, 3, '2022-08-08 11:56:56', '31.3522134', '30.1790419', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:56:56', '2022-08-08 18:56:56'),
(1572, NULL, 3, '2022-08-08 11:57:05', '31.3521095', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:57:05', '2022-08-08 18:57:05'),
(1573, NULL, 3, '2022-08-08 11:57:16', '31.352108', '30.179057', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:57:16', '2022-08-08 18:57:16'),
(1574, NULL, 3, '2022-08-08 11:57:25', '31.3521881', '30.1790437', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:57:25', '2022-08-08 18:57:25'),
(1575, NULL, 3, '2022-08-08 11:57:35', '31.3522171', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:57:35', '2022-08-08 18:57:35'),
(1576, NULL, 3, '2022-08-08 11:57:45', '31.3521094', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:57:45', '2022-08-08 18:57:45'),
(1577, NULL, 3, '2022-08-08 11:57:55', '31.3521079', '30.1790575', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:57:55', '2022-08-08 18:57:55'),
(1578, NULL, 3, '2022-08-08 11:58:05', '31.3522185', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:58:05', '2022-08-08 18:58:05'),
(1579, NULL, 3, '2022-08-08 11:58:15', '31.3521371', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 18:58:15', '2022-08-08 18:58:15'),
(1580, NULL, 3, '2022-08-08 11:58:25', '31.352108', '30.1790572', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:58:25', '2022-08-08 18:58:25'),
(1581, NULL, 3, '2022-08-08 11:58:35', '31.3521069', '30.1790582', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 18:58:35', '2022-08-08 18:58:35'),
(1582, NULL, 3, '2022-08-08 12:11:41', '31.3521092', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:11:41', '2022-08-08 19:11:41'),
(1583, NULL, 3, '2022-08-08 12:11:59', '31.3521118', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:11:59', '2022-08-08 19:11:59'),
(1584, NULL, 3, '2022-08-08 12:12:08', '31.3521118', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:12:08', '2022-08-08 19:12:08'),
(1585, NULL, 3, '2022-08-08 12:12:29', '31.3521108', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:12:29', '2022-08-08 19:12:29'),
(1586, NULL, 3, '2022-08-08 12:12:39', '31.3521102', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:12:39', '2022-08-08 19:12:39'),
(1587, NULL, 3, '2022-08-08 12:12:48', '31.3521102', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:12:48', '2022-08-08 19:12:48'),
(1588, NULL, 3, '2022-08-08 12:12:57', '31.3521127', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:12:57', '2022-08-08 19:12:57'),
(1589, NULL, 3, '2022-08-08 12:13:07', '31.3521093', '30.1790594', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:13:07', '2022-08-08 19:13:07'),
(1590, NULL, 3, '2022-08-08 12:13:17', '31.352112', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:13:17', '2022-08-08 19:13:17'),
(1591, NULL, 3, '2022-08-08 12:13:27', '31.3521112', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:13:27', '2022-08-08 19:13:27'),
(1592, NULL, 3, '2022-08-08 12:13:38', '31.3521158', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:13:38', '2022-08-08 19:13:38'),
(1593, NULL, 3, '2022-08-08 12:13:48', '31.352116', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:13:48', '2022-08-08 19:13:48'),
(1594, NULL, 3, '2022-08-08 12:13:57', '31.3521141', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:13:57', '2022-08-08 19:13:57'),
(1595, NULL, 3, '2022-08-08 12:14:07', '31.3521141', '30.1790609', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:14:07', '2022-08-08 19:14:07'),
(1596, NULL, 3, '2022-08-08 12:14:17', '31.3521092', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:14:17', '2022-08-08 19:14:17'),
(1597, NULL, 3, '2022-08-08 12:14:27', '31.3521054', '30.1790606', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:14:27', '2022-08-08 19:14:27'),
(1598, NULL, 3, '2022-08-08 12:14:37', '31.3521144', '30.179061', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:14:37', '2022-08-08 19:14:37'),
(1599, NULL, 3, '2022-08-08 12:14:48', '31.352112', '30.1790612', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:14:48', '2022-08-08 19:14:48'),
(1600, NULL, 3, '2022-08-08 12:14:57', '31.3521106', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:14:57', '2022-08-08 19:14:57'),
(1601, NULL, 3, '2022-08-08 12:15:08', '31.3521134', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:15:08', '2022-08-08 19:15:08'),
(1602, NULL, 3, '2022-08-08 12:15:18', '31.352113', '30.1790611', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:15:18', '2022-08-08 19:15:18'),
(1603, NULL, 3, '2022-08-08 12:15:27', '31.3521135', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:15:27', '2022-08-08 19:15:27'),
(1604, NULL, 3, '2022-08-08 12:15:38', '31.3521069', '30.1790589', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:15:38', '2022-08-08 19:15:38'),
(1605, NULL, 3, '2022-08-08 12:15:47', '31.3521083', '30.1790612', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:15:47', '2022-08-08 19:15:47'),
(1606, NULL, 3, '2022-08-08 12:15:57', '31.3521064', '30.1790607', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:15:57', '2022-08-08 19:15:57'),
(1607, NULL, 3, '2022-08-08 12:16:07', '31.3521129', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:16:07', '2022-08-08 19:16:07'),
(1608, NULL, 3, '2022-08-08 12:16:18', '31.3521058', '30.1790605', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:16:18', '2022-08-08 19:16:18'),
(1609, NULL, 3, '2022-08-08 12:16:27', '31.3521055', '30.1790605', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:16:27', '2022-08-08 19:16:27'),
(1610, NULL, 3, '2022-08-08 12:16:38', '31.3521087', '30.1790614', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:16:38', '2022-08-08 19:16:38'),
(1611, NULL, 3, '2022-08-08 12:16:47', '31.3521105', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:16:47', '2022-08-08 19:16:47'),
(1612, NULL, 3, '2022-08-08 12:16:58', '31.3521177', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:16:58', '2022-08-08 19:16:58'),
(1613, NULL, 3, '2022-08-08 12:17:08', '31.3521099', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:17:08', '2022-08-08 19:17:08'),
(1614, NULL, 3, '2022-08-08 12:17:18', '31.3521068', '30.1790598', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:17:18', '2022-08-08 19:17:18'),
(1615, NULL, 3, '2022-08-08 12:17:28', '31.3521112', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:17:28', '2022-08-08 19:17:28'),
(1616, NULL, 3, '2022-08-08 12:17:38', '31.3521102', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:17:38', '2022-08-08 19:17:38'),
(1617, NULL, 3, '2022-08-08 12:17:48', '31.3521096', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:17:48', '2022-08-08 19:17:48'),
(1618, NULL, 3, '2022-08-08 12:17:58', '31.3521157', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:17:58', '2022-08-08 19:17:58'),
(1619, NULL, 3, '2022-08-08 12:18:08', '31.3521229', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:18:08', '2022-08-08 19:18:08'),
(1620, NULL, 3, '2022-08-08 12:18:18', '31.3521102', '30.179062', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:18:18', '2022-08-08 19:18:18'),
(1621, NULL, 3, '2022-08-08 12:18:28', '31.3521096', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:18:28', '2022-08-08 19:18:28'),
(1622, NULL, 3, '2022-08-08 12:18:38', '31.3521091', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:18:38', '2022-08-08 19:18:38'),
(1623, NULL, 3, '2022-08-08 12:18:48', '31.3521121', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:18:48', '2022-08-08 19:18:48'),
(1624, NULL, 3, '2022-08-08 12:18:58', '31.3521118', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:18:58', '2022-08-08 19:18:58'),
(1625, NULL, 3, '2022-08-08 12:19:07', '31.3521127', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:19:07', '2022-08-08 19:19:07'),
(1626, NULL, 3, '2022-08-08 12:19:17', '31.3521122', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:19:17', '2022-08-08 19:19:17'),
(1627, NULL, 3, '2022-08-08 12:19:28', '31.3521131', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:19:28', '2022-08-08 19:19:28'),
(1628, NULL, 3, '2022-08-08 12:19:37', '31.3521128', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:19:37', '2022-08-08 19:19:37'),
(1629, NULL, 3, '2022-08-08 12:19:47', '31.3521092', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:19:47', '2022-08-08 19:19:47'),
(1630, NULL, 3, '2022-08-08 12:19:57', '31.3521151', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:19:57', '2022-08-08 19:19:57'),
(1631, NULL, 3, '2022-08-08 12:20:07', '31.3521099', '30.1790606', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:20:07', '2022-08-08 19:20:07'),
(1632, NULL, 3, '2022-08-08 12:20:17', '31.3521115', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:20:17', '2022-08-08 19:20:17'),
(1633, NULL, 3, '2022-08-08 12:20:29', '31.3521734', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:20:29', '2022-08-08 19:20:29'),
(1634, NULL, 3, '2022-08-08 12:20:37', '31.3521755', '30.1790557', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:20:37', '2022-08-08 19:20:37'),
(1635, NULL, 3, '2022-08-08 12:20:47', '31.3521104', '30.1790555', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:20:47', '2022-08-08 19:20:47'),
(1636, NULL, 3, '2022-08-08 12:20:57', '31.3521158', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:20:57', '2022-08-08 19:20:57'),
(1637, NULL, 3, '2022-08-08 12:21:08', '31.3521137', '30.1790564', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:21:08', '2022-08-08 19:21:08'),
(1638, NULL, 3, '2022-08-08 12:21:17', '31.3521226', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:21:17', '2022-08-08 19:21:17'),
(1639, NULL, 3, '2022-08-08 12:21:27', '31.3521167', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:21:27', '2022-08-08 19:21:27'),
(1640, NULL, 3, '2022-08-08 12:21:37', '31.352121', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:21:37', '2022-08-08 19:21:37'),
(1641, NULL, 3, '2022-08-08 12:21:47', '31.3521095', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:21:47', '2022-08-08 19:21:47'),
(1642, NULL, 3, '2022-08-08 12:21:57', '31.3521048', '30.1790602', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:21:57', '2022-08-08 19:21:57'),
(1643, NULL, 3, '2022-08-08 12:22:07', '31.3521078', '30.1790609', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:22:07', '2022-08-08 19:22:07'),
(1644, NULL, 3, '2022-08-08 12:22:17', '31.3521135', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:22:17', '2022-08-08 19:22:17'),
(1645, NULL, 3, '2022-08-08 12:22:27', '31.3521159', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:22:27', '2022-08-08 19:22:27'),
(1646, NULL, 3, '2022-08-08 12:22:37', '31.3521117', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:22:37', '2022-08-08 19:22:37'),
(1647, NULL, 3, '2022-08-08 12:22:47', '31.3521136', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:22:47', '2022-08-08 19:22:47'),
(1648, NULL, 3, '2022-08-08 12:22:57', '31.3521083', '30.1790606', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:22:57', '2022-08-08 19:22:57'),
(1649, NULL, 3, '2022-08-08 12:23:07', '31.3521093', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:23:07', '2022-08-08 19:23:07'),
(1650, NULL, 3, '2022-08-08 12:23:17', '31.352113', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:23:17', '2022-08-08 19:23:17'),
(1651, NULL, 3, '2022-08-08 12:23:27', '31.3521304', '30.1790562', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:23:27', '2022-08-08 19:23:27'),
(1652, NULL, 3, '2022-08-08 12:23:37', '31.3521167', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:23:37', '2022-08-08 19:23:37'),
(1653, NULL, 3, '2022-08-08 12:23:47', '31.3521068', '30.1790605', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:23:47', '2022-08-08 19:23:47'),
(1654, NULL, 3, '2022-08-08 12:23:57', '31.3521579', '30.1790535', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:23:57', '2022-08-08 19:23:57'),
(1655, NULL, 3, '2022-08-08 12:24:07', '31.3521206', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:24:07', '2022-08-08 19:24:07'),
(1656, NULL, 3, '2022-08-08 12:24:17', '31.352107', '30.179058', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:24:17', '2022-08-08 19:24:17'),
(1657, NULL, 3, '2022-08-08 12:24:27', '31.3521142', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:24:27', '2022-08-08 19:24:27'),
(1658, NULL, 3, '2022-08-08 12:24:37', '31.3521075', '30.1790582', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:24:37', '2022-08-08 19:24:37'),
(1659, NULL, 3, '2022-08-08 12:24:47', '31.352111', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:24:47', '2022-08-08 19:24:47'),
(1660, NULL, 3, '2022-08-08 12:24:57', '31.3521149', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:24:57', '2022-08-08 19:24:57'),
(1661, NULL, 3, '2022-08-08 12:25:07', '31.3521279', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:25:07', '2022-08-08 19:25:07'),
(1662, NULL, 3, '2022-08-08 12:25:17', '31.3521745', '30.1790459', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:25:17', '2022-08-08 19:25:17'),
(1663, NULL, 3, '2022-08-08 12:25:27', '31.3521438', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:25:27', '2022-08-08 19:25:27'),
(1664, NULL, 3, '2022-08-08 12:25:37', '31.3521351', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:25:37', '2022-08-08 19:25:37'),
(1665, NULL, 3, '2022-08-08 12:25:47', '31.3521247', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:25:47', '2022-08-08 19:25:47'),
(1666, NULL, 3, '2022-08-08 12:25:57', '31.3521102', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:25:57', '2022-08-08 19:25:57'),
(1667, NULL, 3, '2022-08-08 12:26:07', '31.3521099', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:26:07', '2022-08-08 19:26:07'),
(1668, NULL, 3, '2022-08-08 12:26:17', '31.3521127', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:26:17', '2022-08-08 19:26:17'),
(1669, NULL, 3, '2022-08-08 12:26:27', '31.3521256', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:26:27', '2022-08-08 19:26:27'),
(1670, NULL, 3, '2022-08-08 12:26:37', '31.3521089', '30.1790575', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:26:37', '2022-08-08 19:26:37'),
(1671, NULL, 3, '2022-08-08 12:26:47', '31.3521257', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:26:47', '2022-08-08 19:26:47'),
(1672, NULL, 3, '2022-08-08 12:26:57', '31.352125', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:26:57', '2022-08-08 19:26:57'),
(1673, NULL, 3, '2022-08-08 12:27:07', '31.35211', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:27:07', '2022-08-08 19:27:07'),
(1674, NULL, 3, '2022-08-08 12:27:17', '31.352106', '30.1790605', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:27:17', '2022-08-08 19:27:17'),
(1675, NULL, 3, '2022-08-08 12:27:27', '31.3521323', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:27:27', '2022-08-08 19:27:27'),
(1676, NULL, 3, '2022-08-08 12:27:37', '31.3521108', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:27:37', '2022-08-08 19:27:37'),
(1677, NULL, 3, '2022-08-08 12:27:47', '31.3521082', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:27:47', '2022-08-08 19:27:47'),
(1678, NULL, 3, '2022-08-08 12:27:57', '31.3521218', '30.179057', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:27:57', '2022-08-08 19:27:57'),
(1679, NULL, 3, '2022-08-08 12:28:07', '31.3521185', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:28:07', '2022-08-08 19:28:07'),
(1680, NULL, 3, '2022-08-08 12:28:17', '31.3521205', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:28:17', '2022-08-08 19:28:17'),
(1681, NULL, 3, '2022-08-08 12:28:27', '31.3521164', '30.1790609', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:28:27', '2022-08-08 19:28:27'),
(1682, NULL, 3, '2022-08-08 12:28:38', '31.3521111', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:28:38', '2022-08-08 19:28:38'),
(1683, NULL, 3, '2022-08-08 12:28:48', '31.3521101', '30.1790597', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:28:48', '2022-08-08 19:28:48'),
(1684, NULL, 3, '2022-08-08 12:28:57', '31.3521175', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:28:57', '2022-08-08 19:28:57'),
(1685, NULL, 3, '2022-08-08 12:29:07', '31.3521233', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:29:07', '2022-08-08 19:29:07'),
(1686, NULL, 3, '2022-08-08 12:29:17', '31.3521119', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:29:17', '2022-08-08 19:29:17'),
(1687, NULL, 3, '2022-08-08 12:29:27', '31.3521152', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:29:27', '2022-08-08 19:29:27'),
(1688, NULL, 3, '2022-08-08 12:29:37', '31.3521048', '30.179061', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:29:37', '2022-08-08 19:29:37'),
(1689, NULL, 3, '2022-08-08 12:29:47', '31.3522078', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:29:47', '2022-08-08 19:29:47'),
(1690, NULL, 3, '2022-08-08 12:29:57', '31.3521914', '30.1790474', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:29:57', '2022-08-08 19:29:57'),
(1691, NULL, 3, '2022-08-08 12:30:07', '31.3521134', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:30:07', '2022-08-08 19:30:07'),
(1692, NULL, 3, '2022-08-08 12:30:17', '31.3521115', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:30:17', '2022-08-08 19:30:17'),
(1693, NULL, 3, '2022-08-08 12:30:27', '31.3521095', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:30:27', '2022-08-08 19:30:27'),
(1694, NULL, 3, '2022-08-08 12:30:37', '31.3521105', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:30:37', '2022-08-08 19:30:37'),
(1695, NULL, 3, '2022-08-08 12:30:47', '31.3521105', '30.1790583', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:30:47', '2022-08-08 19:30:47'),
(1696, NULL, 3, '2022-08-08 12:30:57', '31.3521028', '30.1790579', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:30:57', '2022-08-08 19:30:57'),
(1697, NULL, 3, '2022-08-08 12:31:07', '31.3521108', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:31:07', '2022-08-08 19:31:07'),
(1698, NULL, 3, '2022-08-08 12:31:17', '31.3521124', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:31:17', '2022-08-08 19:31:17'),
(1699, NULL, 3, '2022-08-08 12:31:27', '31.3521113', '30.1790606', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:31:27', '2022-08-08 19:31:27'),
(1700, NULL, 3, '2022-08-08 12:31:37', '31.3521056', '30.1790612', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:31:37', '2022-08-08 19:31:37'),
(1701, NULL, 3, '2022-08-08 12:31:47', '31.3521126', '30.1790599', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:31:47', '2022-08-08 19:31:47'),
(1702, NULL, 3, '2022-08-08 12:31:57', '31.3521124', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:31:57', '2022-08-08 19:31:57'),
(1703, NULL, 3, '2022-08-08 12:32:07', '31.3521944', '30.1790455', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:32:07', '2022-08-08 19:32:07'),
(1704, NULL, 3, '2022-08-08 12:32:17', '31.3521153', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:32:17', '2022-08-08 19:32:17'),
(1705, NULL, 3, '2022-08-08 12:32:27', '31.3521097', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:32:27', '2022-08-08 19:32:27'),
(1706, NULL, 3, '2022-08-08 12:32:37', '31.3521112', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:32:37', '2022-08-08 19:32:37'),
(1707, NULL, 3, '2022-08-08 12:32:47', '31.3521134', '30.1790631', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:32:47', '2022-08-08 19:32:47'),
(1708, NULL, 3, '2022-08-08 12:32:57', '31.3521132', '30.1790611', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:32:57', '2022-08-08 19:32:57'),
(1709, NULL, 3, '2022-08-08 12:33:07', '31.3521121', '30.179063', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:33:07', '2022-08-08 19:33:07'),
(1710, NULL, 3, '2022-08-08 12:33:17', '31.352111', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:33:17', '2022-08-08 19:33:17'),
(1711, NULL, 3, '2022-08-08 12:33:27', '31.3521119', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:33:27', '2022-08-08 19:33:27'),
(1712, NULL, 3, '2022-08-08 12:33:37', '31.3521143', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:33:37', '2022-08-08 19:33:37'),
(1713, NULL, 3, '2022-08-08 12:33:47', '31.3521741', '30.1790469', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:33:47', '2022-08-08 19:33:47'),
(1714, NULL, 3, '2022-08-08 12:33:57', '31.3522046', '30.1790521', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:33:57', '2022-08-08 19:33:57'),
(1715, NULL, 3, '2022-08-08 12:34:07', '31.3522109', '30.1790461', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:34:07', '2022-08-08 19:34:07'),
(1716, NULL, 3, '2022-08-08 12:34:17', '31.3521179', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:34:17', '2022-08-08 19:34:17'),
(1717, NULL, 3, '2022-08-08 12:34:27', '31.3521121', '30.1790606', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:34:27', '2022-08-08 19:34:27'),
(1718, NULL, 3, '2022-08-08 12:34:37', '31.3521129', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:34:37', '2022-08-08 19:34:37'),
(1719, NULL, 3, '2022-08-08 12:34:47', '31.3521126', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:34:47', '2022-08-08 19:34:47'),
(1720, NULL, 3, '2022-08-08 12:34:57', '31.3521152', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:34:57', '2022-08-08 19:34:57'),
(1721, NULL, 3, '2022-08-08 12:35:07', '31.3521246', '30.1790549', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:35:07', '2022-08-08 19:35:07'),
(1722, NULL, 3, '2022-08-08 12:35:17', '31.3521149', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:35:17', '2022-08-08 19:35:17'),
(1723, NULL, 3, '2022-08-08 12:35:27', '31.352111', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:35:27', '2022-08-08 19:35:27'),
(1724, NULL, 3, '2022-08-08 12:35:37', '31.3521084', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:35:37', '2022-08-08 19:35:37'),
(1725, NULL, 3, '2022-08-08 12:35:47', '31.3521121', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:35:47', '2022-08-08 19:35:47'),
(1726, NULL, 3, '2022-08-08 12:35:57', '31.3521067', '30.1790578', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:35:57', '2022-08-08 19:35:57'),
(1727, NULL, 3, '2022-08-08 12:36:07', '31.3521063', '30.1790589', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:36:07', '2022-08-08 19:36:07'),
(1728, NULL, 3, '2022-08-08 12:36:17', '31.3521134', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:36:17', '2022-08-08 19:36:17'),
(1729, NULL, 3, '2022-08-08 12:36:27', '31.3521116', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:36:27', '2022-08-08 19:36:27');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(1730, NULL, 3, '2022-08-08 12:36:37', '31.3521119', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:36:37', '2022-08-08 19:36:37'),
(1731, NULL, 3, '2022-08-08 12:36:47', '31.3521101', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:36:47', '2022-08-08 19:36:47'),
(1732, NULL, 3, '2022-08-08 12:36:57', '31.3521917', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:36:57', '2022-08-08 19:36:57'),
(1733, NULL, 3, '2022-08-08 12:37:07', '31.3521142', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:37:07', '2022-08-08 19:37:07'),
(1734, NULL, 3, '2022-08-08 12:37:17', '31.3522027', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:37:17', '2022-08-08 19:37:17'),
(1735, NULL, 3, '2022-08-08 12:37:27', '31.3522178', '30.1790491', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:37:27', '2022-08-08 19:37:27'),
(1736, NULL, 3, '2022-08-08 12:37:37', '31.3521134', '30.1790554', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:37:37', '2022-08-08 19:37:37'),
(1737, NULL, 3, '2022-08-08 12:37:47', '31.3521118', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:37:47', '2022-08-08 19:37:47'),
(1738, NULL, 3, '2022-08-08 12:37:57', '31.3521129', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:37:57', '2022-08-08 19:37:57'),
(1739, NULL, 3, '2022-08-08 12:38:07', '31.3521114', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:38:07', '2022-08-08 19:38:07'),
(1740, NULL, 3, '2022-08-08 12:38:17', '31.3521118', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:38:17', '2022-08-08 19:38:17'),
(1741, NULL, 3, '2022-08-08 12:38:27', '31.3521039', '30.1790569', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:38:27', '2022-08-08 19:38:27'),
(1742, NULL, 3, '2022-08-08 12:38:37', '31.3521107', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:38:37', '2022-08-08 19:38:37'),
(1743, NULL, 3, '2022-08-08 12:38:47', '31.3521137', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:38:47', '2022-08-08 19:38:47'),
(1744, NULL, 3, '2022-08-08 12:38:57', '31.3521153', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:38:57', '2022-08-08 19:38:57'),
(1745, NULL, 3, '2022-08-08 12:39:07', '31.3521087', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:39:07', '2022-08-08 19:39:07'),
(1746, NULL, 3, '2022-08-08 12:39:17', '31.352169', '30.1790446', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:39:17', '2022-08-08 19:39:17'),
(1747, NULL, 3, '2022-08-08 12:39:27', '31.352107', '30.1790607', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:39:27', '2022-08-08 19:39:27'),
(1748, NULL, 3, '2022-08-08 12:39:37', '31.3521818', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:39:37', '2022-08-08 19:39:37'),
(1749, NULL, 3, '2022-08-08 12:39:47', '31.3521163', '30.1790584', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:39:47', '2022-08-08 19:39:47'),
(1750, NULL, 3, '2022-08-08 12:39:57', '31.3521122', '30.1790609', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:39:57', '2022-08-08 19:39:57'),
(1751, NULL, 3, '2022-08-08 12:40:07', '31.3521078', '30.1790575', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:40:07', '2022-08-08 19:40:07'),
(1752, NULL, 3, '2022-08-08 12:40:17', '31.3521195', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:40:17', '2022-08-08 19:40:17'),
(1753, NULL, 3, '2022-08-08 12:40:27', '31.3521199', '30.1790556', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:40:27', '2022-08-08 19:40:27'),
(1754, NULL, 3, '2022-08-08 12:40:38', '31.3521411', '30.1790545', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:40:38', '2022-08-08 19:40:38'),
(1755, NULL, 3, '2022-08-08 12:40:47', '31.3521387', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:40:47', '2022-08-08 19:40:47'),
(1756, NULL, 3, '2022-08-08 12:40:57', '31.3521185', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:40:57', '2022-08-08 19:40:57'),
(1757, NULL, 3, '2022-08-08 12:41:07', '31.3521179', '30.1790565', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:41:07', '2022-08-08 19:41:07'),
(1758, NULL, 3, '2022-08-08 12:41:18', '31.3521233', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:41:18', '2022-08-08 19:41:18'),
(1759, NULL, 3, '2022-08-08 12:41:27', '31.3522', '30.1790545', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:41:27', '2022-08-08 19:41:27'),
(1760, NULL, 3, '2022-08-08 12:41:37', '31.3521469', '30.179056', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:41:37', '2022-08-08 19:41:37'),
(1761, NULL, 3, '2022-08-08 12:41:47', '31.3521121', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:41:47', '2022-08-08 19:41:47'),
(1762, NULL, 3, '2022-08-08 12:41:57', '31.352115', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:41:57', '2022-08-08 19:41:57'),
(1763, NULL, 3, '2022-08-08 12:42:07', '31.3521139', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:42:07', '2022-08-08 19:42:07'),
(1764, NULL, 3, '2022-08-08 12:42:17', '31.3521074', '30.1790587', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:42:17', '2022-08-08 19:42:17'),
(1765, NULL, 3, '2022-08-08 12:42:27', '31.3521185', '30.1790579', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:42:27', '2022-08-08 19:42:27'),
(1766, NULL, 3, '2022-08-08 12:42:37', '31.3521069', '30.1790567', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:42:37', '2022-08-08 19:42:37'),
(1767, NULL, 3, '2022-08-08 12:42:47', '31.3521101', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:42:47', '2022-08-08 19:42:47'),
(1768, NULL, 3, '2022-08-08 12:42:57', '31.3521152', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:42:57', '2022-08-08 19:42:57'),
(1769, NULL, 3, '2022-08-08 12:43:07', '31.3521123', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:43:07', '2022-08-08 19:43:07'),
(1770, NULL, 3, '2022-08-08 12:43:17', '31.3521093', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:43:17', '2022-08-08 19:43:17'),
(1771, NULL, 3, '2022-08-08 12:43:27', '31.3521126', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:43:27', '2022-08-08 19:43:27'),
(1772, NULL, 3, '2022-08-08 12:43:37', '31.3521103', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:43:37', '2022-08-08 19:43:37'),
(1773, NULL, 3, '2022-08-08 12:43:47', '31.3521148', '30.1790574', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:43:47', '2022-08-08 19:43:47'),
(1774, NULL, 3, '2022-08-08 12:43:57', '31.3521041', '30.179059', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:43:57', '2022-08-08 19:43:57'),
(1775, NULL, 3, '2022-08-08 12:44:07', '31.3521135', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:44:07', '2022-08-08 19:44:07'),
(1776, NULL, 3, '2022-08-08 12:44:17', '31.3521145', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:44:17', '2022-08-08 19:44:17'),
(1777, NULL, 3, '2022-08-08 12:44:28', '31.3521082', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:44:28', '2022-08-08 19:44:28'),
(1778, NULL, 3, '2022-08-08 12:44:37', '31.3521121', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:44:37', '2022-08-08 19:44:37'),
(1779, NULL, 3, '2022-08-08 12:44:47', '31.3521122', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:44:47', '2022-08-08 19:44:47'),
(1780, NULL, 3, '2022-08-08 12:44:57', '31.3521078', '30.1790585', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:44:57', '2022-08-08 19:44:57'),
(1781, NULL, 3, '2022-08-08 12:45:07', '31.3521084', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:45:07', '2022-08-08 19:45:07'),
(1782, NULL, 3, '2022-08-08 12:45:17', '31.3521122', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:45:17', '2022-08-08 19:45:17'),
(1783, NULL, 3, '2022-08-08 12:45:27', '31.3521137', '30.1790608', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:45:27', '2022-08-08 19:45:27'),
(1784, NULL, 3, '2022-08-08 12:45:37', '31.3521071', '30.1790568', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:45:37', '2022-08-08 19:45:37'),
(1785, NULL, 3, '2022-08-08 12:45:47', '31.3521126', '30.179061', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:45:47', '2022-08-08 19:45:47'),
(1786, NULL, 3, '2022-08-08 12:45:57', '31.3521119', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:45:57', '2022-08-08 19:45:57'),
(1787, NULL, 3, '2022-08-08 12:46:07', '31.3521043', '30.1790527', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:46:07', '2022-08-08 19:46:07'),
(1788, NULL, 3, '2022-08-08 12:46:17', '31.3522148', '30.1790571', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:46:17', '2022-08-08 19:46:17'),
(1789, NULL, 3, '2022-08-08 12:46:27', '31.3521116', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:46:27', '2022-08-08 19:46:27'),
(1790, NULL, 3, '2022-08-08 12:46:37', '31.3521222', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:46:37', '2022-08-08 19:46:37'),
(1791, NULL, 3, '2022-08-08 12:46:47', '31.352106', '30.1790609', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:46:47', '2022-08-08 19:46:47'),
(1792, NULL, 3, '2022-08-08 12:46:57', '31.352162', '30.1790491', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:46:57', '2022-08-08 19:46:57'),
(1793, NULL, 3, '2022-08-08 12:47:07', '31.3521138', '30.17906', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:47:07', '2022-08-08 19:47:07'),
(1794, NULL, 3, '2022-08-08 12:47:17', '31.3521081', '30.1790614', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:47:17', '2022-08-08 19:47:17'),
(1795, NULL, 3, '2022-08-08 12:47:27', '31.3521114', '30.1790635', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:47:27', '2022-08-08 19:47:27'),
(1796, NULL, 3, '2022-08-08 12:47:37', '31.3521091', '30.1790598', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:47:37', '2022-08-08 19:47:37'),
(1797, NULL, 3, '2022-08-08 12:47:47', '31.3521128', '30.1790607', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:47:47', '2022-08-08 19:47:47'),
(1798, NULL, 3, '2022-08-08 12:47:57', '31.35211', '30.1790625', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:47:57', '2022-08-08 19:47:57'),
(1799, NULL, 3, '2022-08-08 12:48:07', '31.3521118', '30.1790611', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:48:07', '2022-08-08 19:48:07'),
(1800, NULL, 3, '2022-08-08 12:48:17', '31.3521142', '30.1790559', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:48:17', '2022-08-08 19:48:17'),
(1801, NULL, 3, '2022-08-08 12:48:27', '31.3521154', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:48:27', '2022-08-08 19:48:27'),
(1802, NULL, 3, '2022-08-08 12:48:37', '31.3521104', '30.1790566', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:48:37', '2022-08-08 19:48:37'),
(1803, NULL, 3, '2022-08-08 12:48:48', '31.3521066', '30.1790591', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:48:48', '2022-08-08 19:48:48'),
(1804, NULL, 3, '2022-08-08 12:48:57', '31.3521148', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:48:57', '2022-08-08 19:48:57'),
(1805, NULL, 3, '2022-08-08 12:49:07', '31.352112', '30.1790602', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:49:07', '2022-08-08 19:49:07'),
(1806, NULL, 3, '2022-08-08 12:49:17', '31.3521135', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:49:17', '2022-08-08 19:49:17'),
(1807, NULL, 3, '2022-08-08 12:49:27', '31.3522009', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:49:27', '2022-08-08 19:49:27'),
(1808, NULL, 3, '2022-08-08 12:49:37', '31.3521138', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:49:37', '2022-08-08 19:49:37'),
(1809, NULL, 3, '2022-08-08 12:49:47', '31.3521168', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:49:47', '2022-08-08 19:49:47'),
(1810, NULL, 3, '2022-08-08 12:49:57', '31.352116', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:49:57', '2022-08-08 19:49:57'),
(1811, NULL, 3, '2022-08-08 12:50:07', '31.3521214', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:50:07', '2022-08-08 19:50:07'),
(1812, NULL, 3, '2022-08-08 12:50:17', '31.3521298', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:50:17', '2022-08-08 19:50:17'),
(1813, NULL, 3, '2022-08-08 12:50:27', '31.3521246', '30.1790616', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:50:27', '2022-08-08 19:50:27'),
(1814, NULL, 3, '2022-08-08 12:50:37', '31.3521106', '30.1790591', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:50:37', '2022-08-08 19:50:37'),
(1815, NULL, 3, '2022-08-08 12:50:47', '31.3521412', '30.1790625', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:50:47', '2022-08-08 19:50:47'),
(1816, NULL, 3, '2022-08-08 12:50:57', '31.3521133', '30.1790604', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:50:57', '2022-08-08 19:50:57'),
(1817, NULL, 3, '2022-08-08 12:51:07', '31.3521146', '30.1790589', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:51:07', '2022-08-08 19:51:07'),
(1818, NULL, 3, '2022-08-08 12:51:17', '31.3521099', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:51:17', '2022-08-08 19:51:17'),
(1819, NULL, 3, '2022-08-08 12:51:27', '31.3521088', '30.179055', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:51:27', '2022-08-08 19:51:27'),
(1820, NULL, 3, '2022-08-08 12:51:37', '31.3521233', '30.1790594', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:51:37', '2022-08-08 19:51:37'),
(1821, NULL, 3, '2022-08-08 12:51:47', '31.3521128', '30.1790547', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:51:47', '2022-08-08 19:51:47'),
(1822, NULL, 3, '2022-08-08 12:51:57', '31.3521107', '30.1790553', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:51:57', '2022-08-08 19:51:57'),
(1823, NULL, 3, '2022-08-08 12:52:07', '31.3521041', '30.1790614', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:52:07', '2022-08-08 19:52:07'),
(1824, NULL, 3, '2022-08-08 12:52:18', '31.3521116', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:52:18', '2022-08-08 19:52:18'),
(1825, NULL, 3, '2022-08-08 12:52:27', '31.3521336', '30.1790569', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:52:27', '2022-08-08 19:52:27'),
(1826, NULL, 3, '2022-08-08 12:52:37', '31.3521133', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:52:37', '2022-08-08 19:52:37'),
(1827, NULL, 3, '2022-08-08 12:52:47', '31.3521103', '30.1790614', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:52:47', '2022-08-08 19:52:47'),
(1828, NULL, 3, '2022-08-08 12:52:57', '31.3521048', '30.1790593', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:52:57', '2022-08-08 19:52:57'),
(1829, NULL, 3, '2022-08-08 12:53:07', '31.3521101', '30.1790595', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:53:07', '2022-08-08 19:53:07'),
(1830, NULL, 3, '2022-08-08 12:53:17', '31.35211', '30.1790596', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:53:17', '2022-08-08 19:53:17'),
(1831, NULL, 3, '2022-08-08 12:53:27', '31.3521077', '30.1790599', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:53:27', '2022-08-08 19:53:27'),
(1832, NULL, 3, '2022-08-08 12:53:37', '31.3521127', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:53:37', '2022-08-08 19:53:37'),
(1833, NULL, 3, '2022-08-08 12:53:47', '31.3521155', '30.1790582', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:53:47', '2022-08-08 19:53:47'),
(1834, NULL, 3, '2022-08-08 12:53:57', '31.3521122', '30.1790585', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:53:57', '2022-08-08 19:53:57'),
(1835, NULL, 3, '2022-08-08 12:54:07', '31.3521113', '30.1790592', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:54:07', '2022-08-08 19:54:07'),
(1836, NULL, 3, '2022-08-08 12:54:17', '31.352103', '30.1790612', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:54:17', '2022-08-08 19:54:17'),
(1837, NULL, 3, '2022-08-08 12:54:27', '31.352117', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:54:27', '2022-08-08 19:54:27'),
(1838, NULL, 3, '2022-08-08 12:54:38', '31.3521092', '30.1790586', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:54:38', '2022-08-08 19:54:38'),
(1839, NULL, 3, '2022-08-08 12:54:47', '31.3521112', '30.179058', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:54:47', '2022-08-08 19:54:47'),
(1840, NULL, 3, '2022-08-08 12:54:57', '31.3521261', '30.1790587', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:54:57', '2022-08-08 19:54:57'),
(1841, NULL, 3, '2022-08-08 12:55:07', '31.352113', '30.1790603', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:55:07', '2022-08-08 19:55:07'),
(1842, NULL, 3, '2022-08-08 12:55:17', '31.3521095', '30.1790578', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:55:17', '2022-08-08 19:55:17'),
(1843, NULL, 3, '2022-08-08 12:55:27', '31.3522022', '30.1790327', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:55:27', '2022-08-08 19:55:27'),
(1844, NULL, 3, '2022-08-08 12:55:37', '31.3522032', '30.1790551', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:55:37', '2022-08-08 19:55:37'),
(1845, NULL, 3, '2022-08-08 12:55:47', '31.3521086', '30.179063', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:55:47', '2022-08-08 19:55:47'),
(1846, NULL, 3, '2022-08-08 12:55:57', '31.3521086', '30.1790605', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:55:57', '2022-08-08 19:55:57'),
(1847, NULL, 3, '2022-08-08 12:56:07', '31.3521567', '30.1790435', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:56:07', '2022-08-08 19:56:07'),
(1848, NULL, 3, '2022-08-08 12:56:17', '31.3521107', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:56:17', '2022-08-08 19:56:17'),
(1849, NULL, 3, '2022-08-08 12:56:27', '31.3521132', '30.1790577', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:56:27', '2022-08-08 19:56:27'),
(1850, NULL, 3, '2022-08-08 12:56:37', '31.3521123', '30.1790576', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:56:37', '2022-08-08 19:56:37'),
(1851, NULL, 3, '2022-08-08 12:56:47', '31.3521226', '30.1790572', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:56:47', '2022-08-08 19:56:47'),
(1852, NULL, 3, '2022-08-08 12:56:57', '31.3521164', '30.1790567', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:56:57', '2022-08-08 19:56:57'),
(1853, NULL, 3, '2022-08-08 12:57:07', '31.3522029', '30.17903', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:57:07', '2022-08-08 19:57:07'),
(1854, NULL, 3, '2022-08-08 12:57:17', '31.3521977', '30.1790283', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:57:17', '2022-08-08 19:57:17'),
(1855, NULL, 3, '2022-08-08 12:57:27', '31.3521124', '30.1790563', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:57:27', '2022-08-08 19:57:27'),
(1856, NULL, 3, '2022-08-08 12:57:37', '31.3521362', '30.179059', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:57:37', '2022-08-08 19:57:37'),
(1857, NULL, 3, '2022-08-08 12:57:47', '31.3521582', '30.1790443', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:57:47', '2022-08-08 19:57:47'),
(1858, NULL, 3, '2022-08-08 12:57:57', '31.3521299', '30.1790496', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:57:57', '2022-08-08 19:57:57'),
(1859, NULL, 3, '2022-08-08 12:58:07', '31.3521067', '30.1790581', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:58:07', '2022-08-08 19:58:07'),
(1860, NULL, 3, '2022-08-08 12:58:17', '31.3521079', '30.1790583', '59H2+PHG, مركز الخانكة, EG', '2022-08-08 19:58:17', '2022-08-08 19:58:17'),
(1861, NULL, 3, '2022-08-08 12:58:27', '31.3521122', '30.1790581', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:58:27', '2022-08-08 19:58:27'),
(1862, NULL, 3, '2022-08-08 12:58:37', '31.3521134', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:58:37', '2022-08-08 19:58:37'),
(1863, NULL, 3, '2022-08-08 12:58:47', '31.3521148', '30.1790601', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:58:47', '2022-08-08 19:58:47'),
(1864, NULL, 3, '2022-08-08 12:58:57', '31.3521119', '30.1790588', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:58:57', '2022-08-08 19:58:57'),
(1865, NULL, 3, '2022-08-08 12:59:07', '31.3521263', '30.1790593', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:59:07', '2022-08-08 19:59:07'),
(1866, NULL, 3, '2022-08-08 12:59:17', '31.3521463', '30.1790471', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:59:17', '2022-08-08 19:59:17'),
(1867, NULL, 3, '2022-08-08 12:59:27', '31.3521751', '30.1790357', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:59:27', '2022-08-08 19:59:27'),
(1868, NULL, 3, '2022-08-08 12:59:37', '31.3521151', '30.1790573', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:59:37', '2022-08-08 19:59:37'),
(1869, NULL, 3, '2022-08-08 12:59:47', '31.3521268', '30.1790568', 'مدرسة عطروس, مركز الخانكة, EG', '2022-08-08 19:59:47', '2022-08-08 19:59:47'),
(1870, NULL, 2, '2022-09-26 16:16:35', '31.3521636', '30.1790359', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:16:35', '2022-09-26 23:16:35'),
(1871, NULL, 2, '2022-09-26 16:16:49', '31.3521773', '30.179031', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:16:49', '2022-09-26 23:16:49'),
(1872, NULL, 2, '2022-09-26 16:16:59', '31.3521627', '30.1790335', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:16:59', '2022-09-26 23:16:59'),
(1873, NULL, 2, '2022-09-26 16:17:09', '31.352159', '30.1790349', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:17:09', '2022-09-26 23:17:09'),
(1874, NULL, 2, '2022-09-26 16:17:19', '31.3521876', '30.1790254', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:17:19', '2022-09-26 23:17:19'),
(1875, NULL, 2, '2022-09-26 16:17:38', '31.3521494', '30.1790367', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:17:38', '2022-09-26 23:17:38'),
(1876, NULL, 2, '2022-09-26 16:17:51', '31.3521523', '30.1790314', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:17:51', '2022-09-26 23:17:51'),
(1877, NULL, 2, '2022-09-26 16:18:01', '31.3521661', '30.1790309', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:18:01', '2022-09-26 23:18:01'),
(1878, NULL, 2, '2022-09-26 16:18:14', '31.352202', '30.1790312', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:18:14', '2022-09-26 23:18:14'),
(1879, NULL, 2, '2022-09-26 16:18:24', '31.3521547', '30.1790321', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:18:24', '2022-09-26 23:18:24'),
(1880, NULL, 2, '2022-09-26 16:18:34', '31.3521578', '30.1790329', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:18:34', '2022-09-26 23:18:34'),
(1881, NULL, 2, '2022-09-26 16:18:45', '31.3521903', '30.1790298', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:18:45', '2022-09-26 23:18:45'),
(1882, NULL, 2, '2022-09-26 16:18:54', '31.352161', '30.1790331', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:18:54', '2022-09-26 23:18:54'),
(1883, NULL, 2, '2022-09-26 16:19:04', '31.3521798', '30.1790275', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:19:04', '2022-09-26 23:19:04'),
(1884, NULL, 2, '2022-09-26 16:19:14', '31.3521576', '30.1790322', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:19:14', '2022-09-26 23:19:14'),
(1885, NULL, 2, '2022-09-26 16:19:24', '31.3521542', '30.1790333', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:19:24', '2022-09-26 23:19:24'),
(1886, NULL, 2, '2022-09-26 16:19:34', '31.3521364', '30.1790499', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:19:34', '2022-09-26 23:19:34'),
(1887, NULL, 2, '2022-09-26 16:19:43', '31.3521964', '30.1790308', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:19:43', '2022-09-26 23:19:43'),
(1888, NULL, 2, '2022-09-26 16:19:54', '31.3521383', '30.1790457', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:19:54', '2022-09-26 23:19:54'),
(1889, NULL, 2, '2022-09-26 16:20:04', '31.3521513', '30.1790347', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:20:04', '2022-09-26 23:20:04'),
(1890, NULL, 2, '2022-09-26 16:20:18', '31.3521486', '30.1790364', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:20:18', '2022-09-26 23:20:18'),
(1891, NULL, 2, '2022-09-26 16:20:28', '31.3521713', '30.1790336', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:20:28', '2022-09-26 23:20:28'),
(1892, NULL, 2, '2022-09-26 16:20:38', '31.3521608', '30.1790328', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:20:38', '2022-09-26 23:20:38'),
(1893, NULL, 2, '2022-09-26 16:20:48', '31.3521393', '30.1790468', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:20:48', '2022-09-26 23:20:48'),
(1894, NULL, 2, '2022-09-26 16:20:58', '31.3521335', '30.1790499', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:20:58', '2022-09-26 23:20:58'),
(1895, NULL, 2, '2022-09-26 16:21:08', '31.352201', '30.179029', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:21:08', '2022-09-26 23:21:08'),
(1896, NULL, 2, '2022-09-26 16:21:18', '31.3521835', '30.179032', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:21:18', '2022-09-26 23:21:18'),
(1897, NULL, 2, '2022-09-26 16:21:28', '31.3521151', '30.1790507', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:21:28', '2022-09-26 23:21:28'),
(1898, NULL, 2, '2022-09-26 16:21:39', '31.3521547', '30.1790294', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:21:39', '2022-09-26 23:21:39'),
(1899, NULL, 2, '2022-09-26 16:21:48', '31.3521592', '30.1790358', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:21:48', '2022-09-26 23:21:48'),
(1900, NULL, 2, '2022-09-26 16:21:59', '31.3521578', '30.1790372', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:21:59', '2022-09-26 23:21:59'),
(1901, NULL, 2, '2022-09-26 16:22:07', '31.3521558', '30.1790397', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:22:07', '2022-09-26 23:22:07'),
(1902, NULL, 2, '2022-09-26 16:22:18', '31.3521627', '30.1790351', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:22:18', '2022-09-26 23:22:18'),
(1903, NULL, 2, '2022-09-26 16:22:28', '31.3521651', '30.1790392', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:22:28', '2022-09-26 23:22:28'),
(1904, NULL, 2, '2022-09-26 16:22:38', '31.3521607', '30.1790384', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:22:38', '2022-09-26 23:22:38'),
(1905, NULL, 2, '2022-09-26 16:22:49', '31.3521534', '30.1790406', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:22:49', '2022-09-26 23:22:49'),
(1906, NULL, 2, '2022-09-26 16:22:57', '31.3521557', '30.1790475', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:22:57', '2022-09-26 23:22:57'),
(1907, NULL, 2, '2022-09-26 16:23:08', '31.3521547', '30.179037', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:23:08', '2022-09-26 23:23:08'),
(1908, NULL, 2, '2022-09-26 16:23:18', '31.3521641', '30.1790295', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:23:18', '2022-09-26 23:23:18'),
(1909, NULL, 2, '2022-09-26 16:23:28', '31.3521599', '30.1790291', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:23:28', '2022-09-26 23:23:28'),
(1910, NULL, 2, '2022-09-26 16:23:39', '31.3521563', '30.1790337', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:23:39', '2022-09-26 23:23:39'),
(1911, NULL, 2, '2022-09-26 16:23:48', '31.3521509', '30.1790356', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:23:48', '2022-09-26 23:23:48'),
(1912, NULL, 2, '2022-09-26 16:23:58', '31.3521674', '30.1790303', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:23:58', '2022-09-26 23:23:58'),
(1913, NULL, 2, '2022-09-26 16:24:08', '31.3521676', '30.1790326', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:24:08', '2022-09-26 23:24:08'),
(1914, NULL, 2, '2022-09-26 16:24:18', '31.3521504', '30.1790356', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:24:18', '2022-09-26 23:24:18'),
(1915, NULL, 2, '2022-09-26 16:24:28', '31.3521901', '30.1790305', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:24:28', '2022-09-26 23:24:28'),
(1916, NULL, 2, '2022-09-26 16:24:38', '31.3521573', '30.1790338', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:24:38', '2022-09-26 23:24:38'),
(1917, NULL, 2, '2022-09-26 16:24:48', '31.3521577', '30.1790318', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:24:48', '2022-09-26 23:24:48'),
(1918, NULL, 2, '2022-09-26 16:24:59', '31.3521622', '30.1790323', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:24:59', '2022-09-26 23:24:59'),
(1919, NULL, 2, '2022-09-26 16:25:09', '31.352189', '30.1790281', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:25:09', '2022-09-26 23:25:09'),
(1920, NULL, 2, '2022-09-26 16:25:18', '31.3521531', '30.179034', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:25:18', '2022-09-26 23:25:18'),
(1921, NULL, 2, '2022-09-26 16:25:27', '31.3521526', '30.1790341', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:25:27', '2022-09-26 23:25:27'),
(1922, NULL, 2, '2022-09-26 16:25:37', '31.3521604', '30.1790294', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:25:37', '2022-09-26 23:25:37'),
(1923, NULL, 2, '2022-09-26 16:25:48', '31.3521551', '30.1790355', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:25:48', '2022-09-26 23:25:48'),
(1924, NULL, 2, '2022-09-26 16:25:57', '31.3521696', '30.1790323', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:25:57', '2022-09-26 23:25:57'),
(1925, NULL, 2, '2022-09-26 16:26:06', '31.3521537', '30.1790349', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:26:06', '2022-09-26 23:26:06'),
(1926, NULL, 2, '2022-09-26 16:26:16', '31.3521533', '30.1790338', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:26:16', '2022-09-26 23:26:16'),
(1927, NULL, 2, '2022-09-26 16:26:27', '31.3522009', '30.1790301', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:26:27', '2022-09-26 23:26:27'),
(1928, NULL, 2, '2022-09-26 16:26:36', '31.352148', '30.1790439', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:26:36', '2022-09-26 23:26:36'),
(1929, NULL, 2, '2022-09-26 16:26:46', '31.3521599', '30.1790355', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:26:46', '2022-09-26 23:26:46'),
(1930, NULL, 2, '2022-09-26 16:26:56', '31.3521994', '30.1790359', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:26:56', '2022-09-26 23:26:56'),
(1931, NULL, 2, '2022-09-26 16:27:07', '31.3521632', '30.1790353', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:27:07', '2022-09-26 23:27:07'),
(1932, NULL, 2, '2022-09-26 16:27:17', '31.3521579', '30.1790367', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:27:17', '2022-09-26 23:27:17'),
(1933, NULL, 2, '2022-09-26 16:27:27', '31.3521535', '30.1790398', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:27:27', '2022-09-26 23:27:27'),
(1934, NULL, 2, '2022-09-26 16:27:37', '31.3521863', '30.1790343', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:27:37', '2022-09-26 23:27:37'),
(1935, NULL, 2, '2022-09-26 16:27:46', '31.3521575', '30.1790299', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:27:46', '2022-09-26 23:27:46'),
(1936, NULL, 2, '2022-09-26 16:27:57', '31.3522275', '30.179027', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:27:57', '2022-09-26 23:27:57'),
(1937, NULL, 2, '2022-09-26 16:28:07', '31.3521917', '30.1790308', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:28:07', '2022-09-26 23:28:07'),
(1938, NULL, 2, '2022-09-26 16:28:17', '31.3521613', '30.1790372', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:28:17', '2022-09-26 23:28:17'),
(1939, NULL, 2, '2022-09-26 16:28:27', '31.352173', '30.1790349', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:28:27', '2022-09-26 23:28:27'),
(1940, NULL, 2, '2022-09-26 16:28:37', '31.3521717', '30.1790357', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:28:37', '2022-09-26 23:28:37'),
(1941, NULL, 2, '2022-09-26 16:28:47', '31.3521453', '30.1790502', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:28:47', '2022-09-26 23:28:47'),
(1942, NULL, 2, '2022-09-26 16:28:57', '31.352157', '30.1790357', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:28:57', '2022-09-26 23:28:57'),
(1943, NULL, 2, '2022-09-26 16:29:06', '31.3521436', '30.1790444', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:29:06', '2022-09-26 23:29:06'),
(1944, NULL, 2, '2022-09-26 16:29:17', '31.3521556', '30.1790343', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:29:17', '2022-09-26 23:29:17'),
(1945, NULL, 2, '2022-09-26 16:29:27', '31.3521551', '30.1790358', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:29:27', '2022-09-26 23:29:27'),
(1946, NULL, 2, '2022-09-26 16:29:37', '31.3521481', '30.1790346', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:29:37', '2022-09-26 23:29:37'),
(1947, NULL, 2, '2022-09-26 16:29:50', '31.3521446', '30.1790407', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:29:50', '2022-09-26 23:29:50'),
(1948, NULL, 2, '2022-09-26 16:30:00', '31.3520052', '30.1789578', '59H2+PHG, مركز الخانكة, EG', '2022-09-26 23:30:00', '2022-09-26 23:30:00'),
(1949, NULL, 2, '2022-09-26 16:30:10', '31.3519717', '30.1789228', '59H2+PHG, مركز الخانكة, EG', '2022-09-26 23:30:10', '2022-09-26 23:30:10'),
(1950, NULL, 2, '2022-09-26 16:30:24', '31.3520869', '30.1789972', '59H2+PHG, مركز الخانكة, EG', '2022-09-26 23:30:24', '2022-09-26 23:30:24'),
(1951, NULL, 2, '2022-09-26 16:30:34', '31.3521438', '30.1790335', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:30:34', '2022-09-26 23:30:34'),
(1952, NULL, 2, '2022-09-26 16:30:44', '31.3518398', '30.1788344', '59H2+9HC, مركز الخانكة, EG', '2022-09-26 23:30:44', '2022-09-26 23:30:44'),
(1953, NULL, 2, '2022-09-26 16:30:57', '31.3520885', '30.1789935', '59H2+PHG, مركز الخانكة, EG', '2022-09-26 23:30:57', '2022-09-26 23:30:57'),
(1954, NULL, 2, '2022-09-26 16:31:14', '31.3521451', '30.1790472', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:31:14', '2022-09-26 23:31:14'),
(1955, NULL, 2, '2022-09-26 16:31:52', '31.3521546', '30.17904', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:31:52', '2022-09-26 23:31:52'),
(1956, NULL, 2, '2022-09-26 16:32:02', '31.3521599', '30.1790398', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:32:02', '2022-09-26 23:32:02'),
(1957, NULL, 2, '2022-09-26 16:32:12', '31.3521551', '30.179038', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:32:12', '2022-09-26 23:32:12'),
(1958, NULL, 2, '2022-09-26 16:32:22', '31.3521596', '30.1790354', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:32:22', '2022-09-26 23:32:22'),
(1959, NULL, 2, '2022-09-26 16:32:32', '31.3521769', '30.1790333', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:32:32', '2022-09-26 23:32:32'),
(1960, NULL, 2, '2022-09-26 16:32:42', '31.3521634', '30.1790327', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:32:42', '2022-09-26 23:32:42'),
(1961, NULL, 2, '2022-09-26 16:32:52', '31.3521637', '30.1790352', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:32:52', '2022-09-26 23:32:52'),
(1962, NULL, 2, '2022-09-26 16:33:02', '31.3521429', '30.179043', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:33:02', '2022-09-26 23:33:02'),
(1963, NULL, 2, '2022-09-26 16:33:12', '31.3521569', '30.1790388', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:33:12', '2022-09-26 23:33:12'),
(1964, NULL, 2, '2022-09-26 16:33:22', '31.352189', '30.1790338', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:33:22', '2022-09-26 23:33:22'),
(1965, NULL, 2, '2022-09-26 16:33:32', '31.3521816', '30.1790311', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:33:32', '2022-09-26 23:33:32'),
(1966, NULL, 2, '2022-09-26 16:33:42', '31.3521449', '30.1790496', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:33:42', '2022-09-26 23:33:42'),
(1967, NULL, 2, '2022-09-26 16:33:52', '31.35216', '30.1790403', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:33:52', '2022-09-26 23:33:52'),
(1968, NULL, 2, '2022-09-26 16:34:02', '31.3521443', '30.1790405', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:34:02', '2022-09-26 23:34:02'),
(1969, NULL, 2, '2022-09-26 16:34:12', '31.3521679', '30.1790371', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:34:12', '2022-09-26 23:34:12'),
(1970, NULL, 2, '2022-09-26 16:34:22', '31.3521664', '30.1790374', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:34:22', '2022-09-26 23:34:22'),
(1971, NULL, 2, '2022-09-26 16:34:32', '31.3521596', '30.1790399', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:34:32', '2022-09-26 23:34:32'),
(1972, NULL, 2, '2022-09-26 16:34:42', '31.3521627', '30.179035', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:34:42', '2022-09-26 23:34:42'),
(1973, NULL, 2, '2022-09-26 16:34:52', '31.3521685', '30.1790326', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:34:52', '2022-09-26 23:34:52'),
(1974, NULL, 2, '2022-09-26 16:35:02', '31.3521589', '30.1790326', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:35:02', '2022-09-26 23:35:02'),
(1975, NULL, 2, '2022-09-26 16:35:33', '31.3521608', '30.1790338', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:35:33', '2022-09-26 23:35:33'),
(1976, NULL, 2, '2022-09-26 16:35:43', '31.3521547', '30.1790355', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:35:43', '2022-09-26 23:35:43'),
(1977, NULL, 2, '2022-09-26 16:35:53', '31.3521587', '30.1790365', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:35:53', '2022-09-26 23:35:53'),
(1978, NULL, 2, '2022-09-26 16:36:05', '31.3521543', '30.1790378', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:36:05', '2022-09-26 23:36:05'),
(1979, NULL, 2, '2022-09-26 16:36:22', '31.3521507', '30.1790368', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:36:22', '2022-09-26 23:36:22'),
(1980, NULL, 2, '2022-09-26 16:36:38', '31.3521638', '30.1790332', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:36:38', '2022-09-26 23:36:38'),
(1981, NULL, 2, '2022-09-26 16:36:49', '31.3521697', '30.179033', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:36:49', '2022-09-26 23:36:49'),
(1982, NULL, 2, '2022-09-26 16:36:57', '31.3521712', '30.1790337', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:36:57', '2022-09-26 23:36:57'),
(1983, NULL, 2, '2022-09-26 16:37:08', '31.3521583', '30.1790344', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:37:08', '2022-09-26 23:37:08'),
(1984, NULL, 2, '2022-09-26 16:37:18', '31.3521569', '30.1790366', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:37:18', '2022-09-26 23:37:18'),
(1985, NULL, 2, '2022-09-26 16:37:28', '31.3521585', '30.1790349', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:37:28', '2022-09-26 23:37:28'),
(1986, NULL, 2, '2022-09-26 16:37:38', '31.3521009', '30.1790563', '59H2+PHG, مركز الخانكة, EG', '2022-09-26 23:37:38', '2022-09-26 23:37:38'),
(1987, NULL, 2, '2022-09-26 16:37:48', '31.3521386', '30.1790445', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:37:48', '2022-09-26 23:37:48'),
(1988, NULL, 2, '2022-09-26 16:37:56', '31.3521478', '30.1790414', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:37:56', '2022-09-26 23:37:56'),
(1989, NULL, 2, '2022-09-26 16:38:06', '31.3521581', '30.1790331', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:38:06', '2022-09-26 23:38:06'),
(1990, NULL, 2, '2022-09-26 16:38:16', '31.3521584', '30.1790378', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:38:16', '2022-09-26 23:38:16'),
(1991, NULL, 2, '2022-09-26 16:38:27', '31.3521324', '30.1790438', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:38:27', '2022-09-26 23:38:27'),
(1992, NULL, 2, '2022-09-26 16:38:36', '31.3521448', '30.1790673', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:38:36', '2022-09-26 23:38:36'),
(1993, NULL, 2, '2022-09-26 16:38:46', '31.3521382', '30.1790479', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:38:46', '2022-09-26 23:38:46'),
(1994, NULL, 2, '2022-09-26 16:38:56', '31.352194', '30.1790874', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:38:56', '2022-09-26 23:38:56'),
(1995, NULL, 2, '2022-09-26 16:39:06', '31.3522048', '30.1790458', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:39:06', '2022-09-26 23:39:06'),
(1996, NULL, 2, '2022-09-26 16:39:16', '31.3522024', '30.1790495', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:39:16', '2022-09-26 23:39:16'),
(1997, NULL, 2, '2022-09-26 16:39:25', '31.3521946', '30.1790373', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:39:25', '2022-09-26 23:39:25'),
(1998, NULL, 2, '2022-09-26 16:39:35', '31.3521746', '30.1790382', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:39:35', '2022-09-26 23:39:35'),
(1999, NULL, 2, '2022-09-26 16:39:45', '31.3521725', '30.179069', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:39:45', '2022-09-26 23:39:45'),
(2000, NULL, 2, '2022-09-26 16:39:55', '31.3521725', '30.179069', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:39:55', '2022-09-26 23:39:55'),
(2001, NULL, 2, '2022-09-26 16:40:05', '31.3521948', '30.1790821', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:40:05', '2022-09-26 23:40:05'),
(2002, NULL, 2, '2022-09-26 16:40:15', '31.3521736', '30.179036', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:40:15', '2022-09-26 23:40:15'),
(2003, NULL, 2, '2022-09-26 16:40:25', '31.3521803', '30.1790311', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:40:25', '2022-09-26 23:40:25'),
(2004, NULL, 2, '2022-09-26 16:40:44', '31.3521955', '30.179084', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:40:44', '2022-09-26 23:40:44'),
(2005, NULL, 2, '2022-09-26 16:40:45', '31.3522004', '30.1790485', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:40:45', '2022-09-26 23:40:45'),
(2006, NULL, 2, '2022-09-26 16:40:58', '31.3521703', '30.1790272', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:40:58', '2022-09-26 23:40:58'),
(2007, NULL, 2, '2022-09-26 16:41:05', '31.3522071', '30.1790532', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:41:05', '2022-09-26 23:41:05'),
(2008, NULL, 2, '2022-09-26 16:41:21', '31.3521946', '30.1790854', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:41:21', '2022-09-26 23:41:21'),
(2009, NULL, 2, '2022-09-26 16:41:25', '31.3521541', '30.1790393', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:41:25', '2022-09-26 23:41:25'),
(2010, NULL, 2, '2022-09-26 16:41:36', '31.3521952', '30.1790275', 'مدرسة عطروس, مركز الخانكة, EG', '2022-09-26 23:41:36', '2022-09-26 23:41:36'),
(2011, NULL, 2, '2022-09-26 19:35:48', '104.560725', '32.3532982', 'Unknown Location Found', '2022-09-27 02:35:48', '2022-09-27 02:35:48'),
(2012, NULL, 2, '2022-09-26 19:35:58', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-27 02:35:58', '2022-09-27 02:35:58'),
(2013, NULL, 2, '2022-09-26 19:36:08', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-27 02:36:08', '2022-09-27 02:36:08'),
(2014, NULL, 2, '2022-09-26 19:36:18', '104.560725', '32.3532991', 'Unknown Location Found', '2022-09-27 02:36:18', '2022-09-27 02:36:18'),
(2015, NULL, 2, '2022-09-26 19:36:28', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-27 02:36:28', '2022-09-27 02:36:28'),
(2016, NULL, 2, '2022-09-26 19:36:38', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-27 02:36:38', '2022-09-27 02:36:38'),
(2017, NULL, 2, '2022-09-26 19:36:49', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-27 02:36:49', '2022-09-27 02:36:49'),
(2018, NULL, 2, '2022-09-26 19:36:58', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-27 02:36:58', '2022-09-27 02:36:58'),
(2019, NULL, 2, '2022-09-26 19:37:09', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-27 02:37:09', '2022-09-27 02:37:09'),
(2020, NULL, 2, '2022-09-26 19:37:18', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 02:37:18', '2022-09-27 02:37:18'),
(2021, NULL, 2, '2022-09-26 19:37:29', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-27 02:37:29', '2022-09-27 02:37:29'),
(2022, NULL, 2, '2022-09-26 19:37:38', '104.560725', '32.3532989', 'Unknown Location Found', '2022-09-27 02:37:38', '2022-09-27 02:37:38'),
(2023, NULL, 2, '2022-09-26 19:37:49', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-27 02:37:49', '2022-09-27 02:37:49'),
(2024, NULL, 2, '2022-09-26 19:37:58', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:37:58', '2022-09-27 02:37:58'),
(2025, NULL, 2, '2022-09-26 19:38:08', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-27 02:38:08', '2022-09-27 02:38:08'),
(2026, NULL, 2, '2022-09-26 19:38:18', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-27 02:38:18', '2022-09-27 02:38:18'),
(2027, NULL, 2, '2022-09-26 19:38:36', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-27 02:38:36', '2022-09-27 02:38:36'),
(2028, NULL, 2, '2022-09-26 19:38:45', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-27 02:38:45', '2022-09-27 02:38:45'),
(2029, NULL, 2, '2022-09-26 19:38:55', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-27 02:38:55', '2022-09-27 02:38:55'),
(2030, NULL, 2, '2022-09-26 19:39:05', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-27 02:39:05', '2022-09-27 02:39:05'),
(2031, NULL, 2, '2022-09-26 19:39:15', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-27 02:39:15', '2022-09-27 02:39:15'),
(2032, NULL, 2, '2022-09-26 19:39:26', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-27 02:39:26', '2022-09-27 02:39:26'),
(2033, NULL, 2, '2022-09-26 19:39:35', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-27 02:39:35', '2022-09-27 02:39:35'),
(2034, NULL, 2, '2022-09-26 19:39:45', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 02:39:45', '2022-09-27 02:39:45'),
(2035, NULL, 2, '2022-09-26 19:39:55', '104.5607252', '32.3532989', 'Unknown Location Found', '2022-09-27 02:39:55', '2022-09-27 02:39:55'),
(2036, NULL, 2, '2022-09-26 19:40:05', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-27 02:40:05', '2022-09-27 02:40:05'),
(2037, NULL, 2, '2022-09-26 19:40:16', '104.5607251', '32.3532987', 'Unknown Location Found', '2022-09-27 02:40:16', '2022-09-27 02:40:16'),
(2038, NULL, 2, '2022-09-26 19:40:25', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-27 02:40:25', '2022-09-27 02:40:25'),
(2039, NULL, 2, '2022-09-26 19:40:35', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-27 02:40:35', '2022-09-27 02:40:35'),
(2040, NULL, 2, '2022-09-26 19:40:45', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-27 02:40:45', '2022-09-27 02:40:45'),
(2041, NULL, 2, '2022-09-26 19:40:56', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-27 02:40:56', '2022-09-27 02:40:56'),
(2042, NULL, 2, '2022-09-26 19:41:05', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-27 02:41:05', '2022-09-27 02:41:05'),
(2043, NULL, 2, '2022-09-26 19:41:15', '104.5607252', '32.3532989', 'Unknown Location Found', '2022-09-27 02:41:15', '2022-09-27 02:41:15'),
(2044, NULL, 2, '2022-09-26 19:41:26', '104.560725', '32.3532984', 'Unknown Location Found', '2022-09-27 02:41:26', '2022-09-27 02:41:26'),
(2045, NULL, 2, '2022-09-26 19:41:35', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-27 02:41:35', '2022-09-27 02:41:35'),
(2046, NULL, 2, '2022-09-26 19:41:45', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-27 02:41:45', '2022-09-27 02:41:45'),
(2047, NULL, 2, '2022-09-26 19:41:55', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-27 02:41:55', '2022-09-27 02:41:55'),
(2048, NULL, 2, '2022-09-26 19:42:05', '104.5607254', '32.3532993', 'Unknown Location Found', '2022-09-27 02:42:05', '2022-09-27 02:42:05'),
(2049, NULL, 2, '2022-09-26 19:42:15', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-27 02:42:15', '2022-09-27 02:42:15'),
(2050, NULL, 2, '2022-09-26 19:42:26', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-27 02:42:26', '2022-09-27 02:42:26'),
(2051, NULL, 2, '2022-09-26 19:42:35', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-27 02:42:35', '2022-09-27 02:42:35'),
(2052, NULL, 2, '2022-09-26 19:42:45', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:42:45', '2022-09-27 02:42:45'),
(2053, NULL, 2, '2022-09-26 19:42:55', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-27 02:42:55', '2022-09-27 02:42:55'),
(2054, NULL, 2, '2022-09-26 19:43:05', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-27 02:43:05', '2022-09-27 02:43:05'),
(2055, NULL, 2, '2022-09-26 19:43:15', '104.5607259', '32.3532992', 'Unknown Location Found', '2022-09-27 02:43:15', '2022-09-27 02:43:15'),
(2056, NULL, 2, '2022-09-26 19:43:25', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-27 02:43:25', '2022-09-27 02:43:25'),
(2057, NULL, 2, '2022-09-26 19:43:35', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 02:43:35', '2022-09-27 02:43:35'),
(2058, NULL, 2, '2022-09-26 19:43:45', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-27 02:43:45', '2022-09-27 02:43:45'),
(2059, NULL, 2, '2022-09-26 19:43:55', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-27 02:43:55', '2022-09-27 02:43:55'),
(2060, NULL, 2, '2022-09-26 19:44:05', '104.560725', '32.353299', 'Unknown Location Found', '2022-09-27 02:44:05', '2022-09-27 02:44:05'),
(2061, NULL, 2, '2022-09-26 19:44:15', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-27 02:44:15', '2022-09-27 02:44:15'),
(2062, NULL, 2, '2022-09-26 19:44:25', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-27 02:44:25', '2022-09-27 02:44:25'),
(2063, NULL, 2, '2022-09-26 19:44:36', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-27 02:44:36', '2022-09-27 02:44:36'),
(2064, NULL, 2, '2022-09-26 19:44:45', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-27 02:44:45', '2022-09-27 02:44:45'),
(2065, NULL, 2, '2022-09-26 19:44:55', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-27 02:44:55', '2022-09-27 02:44:55'),
(2066, NULL, 2, '2022-09-26 19:45:05', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:45:05', '2022-09-27 02:45:05'),
(2067, NULL, 2, '2022-09-26 19:45:16', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-27 02:45:16', '2022-09-27 02:45:16'),
(2068, NULL, 2, '2022-09-26 19:45:25', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-27 02:45:25', '2022-09-27 02:45:25'),
(2069, NULL, 2, '2022-09-26 19:45:35', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-27 02:45:35', '2022-09-27 02:45:35'),
(2070, NULL, 2, '2022-09-26 19:45:46', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-27 02:45:46', '2022-09-27 02:45:46'),
(2071, NULL, 2, '2022-09-26 19:45:55', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-27 02:45:55', '2022-09-27 02:45:55'),
(2072, NULL, 2, '2022-09-26 19:46:06', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-27 02:46:06', '2022-09-27 02:46:06'),
(2073, NULL, 2, '2022-09-26 19:46:16', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:46:16', '2022-09-27 02:46:16'),
(2074, NULL, 2, '2022-09-26 19:46:25', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-27 02:46:25', '2022-09-27 02:46:25'),
(2075, NULL, 2, '2022-09-26 19:46:35', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-27 02:46:35', '2022-09-27 02:46:35'),
(2076, NULL, 2, '2022-09-26 19:46:45', '104.560725', '32.3532991', 'Unknown Location Found', '2022-09-27 02:46:45', '2022-09-27 02:46:45');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(2077, NULL, 2, '2022-09-26 19:46:55', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-27 02:46:55', '2022-09-27 02:46:55'),
(2078, NULL, 2, '2022-09-26 19:47:05', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-27 02:47:05', '2022-09-27 02:47:05'),
(2079, NULL, 2, '2022-09-26 19:47:15', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-27 02:47:15', '2022-09-27 02:47:15'),
(2080, NULL, 2, '2022-09-26 19:47:25', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-27 02:47:25', '2022-09-27 02:47:25'),
(2081, NULL, 2, '2022-09-26 19:47:35', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-27 02:47:35', '2022-09-27 02:47:35'),
(2082, NULL, 2, '2022-09-26 19:47:45', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-27 02:47:45', '2022-09-27 02:47:45'),
(2083, NULL, 2, '2022-09-26 19:47:56', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:47:56', '2022-09-27 02:47:56'),
(2084, NULL, 2, '2022-09-26 19:48:11', '104.5607257', '32.3532982', 'Unknown Location Found', '2022-09-27 02:48:11', '2022-09-27 02:48:11'),
(2085, NULL, 2, '2022-09-26 19:48:21', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-27 02:48:21', '2022-09-27 02:48:21'),
(2086, NULL, 2, '2022-09-26 19:48:31', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-27 02:48:31', '2022-09-27 02:48:31'),
(2087, NULL, 2, '2022-09-26 19:48:42', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-27 02:48:42', '2022-09-27 02:48:42'),
(2088, NULL, 2, '2022-09-26 19:48:51', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:48:51', '2022-09-27 02:48:51'),
(2089, NULL, 2, '2022-09-26 19:49:01', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-27 02:49:01', '2022-09-27 02:49:01'),
(2090, NULL, 2, '2022-09-26 19:49:11', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-27 02:49:11', '2022-09-27 02:49:11'),
(2091, NULL, 2, '2022-09-26 19:49:21', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-27 02:49:21', '2022-09-27 02:49:21'),
(2092, NULL, 2, '2022-09-26 19:49:31', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-27 02:49:31', '2022-09-27 02:49:31'),
(2093, NULL, 2, '2022-09-26 19:49:41', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-27 02:49:41', '2022-09-27 02:49:41'),
(2094, NULL, 2, '2022-09-26 19:49:54', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-27 02:49:54', '2022-09-27 02:49:54'),
(2095, NULL, 2, '2022-09-26 19:50:02', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-27 02:50:02', '2022-09-27 02:50:02'),
(2096, NULL, 2, '2022-09-26 19:50:12', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-27 02:50:12', '2022-09-27 02:50:12'),
(2097, NULL, 2, '2022-09-26 19:50:21', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-27 02:50:21', '2022-09-27 02:50:21'),
(2098, NULL, 2, '2022-09-26 19:50:31', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-27 02:50:31', '2022-09-27 02:50:31'),
(2099, NULL, 2, '2022-09-26 19:50:42', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-27 02:50:42', '2022-09-27 02:50:42'),
(2100, NULL, 2, '2022-09-26 19:50:56', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-27 02:50:56', '2022-09-27 02:50:56'),
(2101, NULL, 2, '2022-09-26 19:51:05', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-27 02:51:05', '2022-09-27 02:51:05'),
(2102, NULL, 2, '2022-09-26 19:51:16', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-27 02:51:16', '2022-09-27 02:51:16'),
(2103, NULL, 2, '2022-09-26 19:51:25', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-27 02:51:25', '2022-09-27 02:51:25'),
(2104, NULL, 2, '2022-09-26 19:51:36', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-27 02:51:36', '2022-09-27 02:51:36'),
(2105, NULL, 2, '2022-09-26 19:51:45', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-27 02:51:45', '2022-09-27 02:51:45'),
(2106, NULL, 2, '2022-09-26 19:51:55', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-27 02:51:55', '2022-09-27 02:51:55'),
(2107, NULL, 2, '2022-09-26 19:52:05', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-27 02:52:05', '2022-09-27 02:52:05'),
(2108, NULL, 2, '2022-09-26 19:52:15', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-27 02:52:15', '2022-09-27 02:52:15'),
(2109, NULL, 2, '2022-09-26 19:52:25', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-27 02:52:25', '2022-09-27 02:52:25'),
(2110, NULL, 2, '2022-09-26 19:52:35', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-27 02:52:35', '2022-09-27 02:52:35'),
(2111, NULL, 2, '2022-09-26 19:52:45', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-27 02:52:45', '2022-09-27 02:52:45'),
(2112, NULL, 2, '2022-09-26 19:52:55', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-27 02:52:55', '2022-09-27 02:52:55'),
(2113, NULL, 2, '2022-09-26 19:53:05', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-27 02:53:05', '2022-09-27 02:53:05'),
(2114, NULL, 2, '2022-09-26 19:53:15', '104.560725', '32.353299', 'Unknown Location Found', '2022-09-27 02:53:15', '2022-09-27 02:53:15'),
(2115, NULL, 2, '2022-09-26 19:53:25', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-27 02:53:25', '2022-09-27 02:53:25'),
(2116, NULL, 2, '2022-09-26 19:53:36', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-27 02:53:36', '2022-09-27 02:53:36'),
(2117, NULL, 2, '2022-09-26 19:53:45', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-27 02:53:45', '2022-09-27 02:53:45'),
(2118, NULL, 2, '2022-09-26 19:53:55', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-27 02:53:55', '2022-09-27 02:53:55'),
(2119, NULL, 2, '2022-09-26 19:54:06', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-27 02:54:06', '2022-09-27 02:54:06'),
(2120, NULL, 2, '2022-09-26 19:54:15', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-27 02:54:15', '2022-09-27 02:54:15'),
(2121, NULL, 2, '2022-09-26 19:54:25', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-27 02:54:25', '2022-09-27 02:54:25'),
(2122, NULL, 2, '2022-09-26 19:54:36', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 02:54:36', '2022-09-27 02:54:36'),
(2123, NULL, 2, '2022-09-26 19:54:45', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-27 02:54:45', '2022-09-27 02:54:45'),
(2124, NULL, 2, '2022-09-26 19:54:56', '104.5607259', '32.3532983', 'Unknown Location Found', '2022-09-27 02:54:56', '2022-09-27 02:54:56'),
(2125, NULL, 2, '2022-09-26 19:55:05', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-27 02:55:05', '2022-09-27 02:55:05'),
(2126, NULL, 2, '2022-09-26 19:55:15', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 02:55:15', '2022-09-27 02:55:15'),
(2127, NULL, 2, '2022-09-26 19:55:26', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-27 02:55:26', '2022-09-27 02:55:26'),
(2128, NULL, 2, '2022-09-26 19:55:35', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-27 02:55:35', '2022-09-27 02:55:35'),
(2129, NULL, 2, '2022-09-26 19:55:45', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-27 02:55:45', '2022-09-27 02:55:45'),
(2130, NULL, 2, '2022-09-26 19:55:56', '104.560726', '32.3532983', 'Unknown Location Found', '2022-09-27 02:55:56', '2022-09-27 02:55:56'),
(2131, NULL, 2, '2022-09-26 19:56:06', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-27 02:56:06', '2022-09-27 02:56:06'),
(2132, NULL, 2, '2022-09-26 19:56:15', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-27 02:56:15', '2022-09-27 02:56:15'),
(2133, NULL, 2, '2022-09-26 19:56:25', '104.560725', '32.3532992', 'Unknown Location Found', '2022-09-27 02:56:25', '2022-09-27 02:56:25'),
(2134, NULL, 2, '2022-09-26 19:56:35', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 02:56:35', '2022-09-27 02:56:35'),
(2135, NULL, 2, '2022-09-26 19:56:45', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-27 02:56:45', '2022-09-27 02:56:45'),
(2136, NULL, 2, '2022-09-26 19:56:55', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:56:55', '2022-09-27 02:56:55'),
(2137, NULL, 2, '2022-09-26 19:57:05', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-27 02:57:05', '2022-09-27 02:57:05'),
(2138, NULL, 2, '2022-09-26 19:57:16', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-27 02:57:16', '2022-09-27 02:57:16'),
(2139, NULL, 2, '2022-09-26 19:57:25', '104.5607259', '32.3532987', 'Unknown Location Found', '2022-09-27 02:57:25', '2022-09-27 02:57:25'),
(2140, NULL, 2, '2022-09-26 19:57:35', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-27 02:57:35', '2022-09-27 02:57:35'),
(2141, NULL, 2, '2022-09-26 19:57:45', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-27 02:57:45', '2022-09-27 02:57:45'),
(2142, NULL, 2, '2022-09-26 19:57:55', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-27 02:57:55', '2022-09-27 02:57:55'),
(2143, NULL, 2, '2022-09-26 19:58:05', '104.5607259', '32.3532983', 'Unknown Location Found', '2022-09-27 02:58:05', '2022-09-27 02:58:05'),
(2144, NULL, 2, '2022-09-26 19:58:15', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-27 02:58:15', '2022-09-27 02:58:15'),
(2145, NULL, 2, '2022-09-26 19:58:25', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-27 02:58:25', '2022-09-27 02:58:25'),
(2146, NULL, 2, '2022-09-26 19:58:35', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-27 02:58:35', '2022-09-27 02:58:35'),
(2147, NULL, 2, '2022-09-26 19:58:46', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 02:58:46', '2022-09-27 02:58:46'),
(2148, NULL, 2, '2022-09-26 19:58:55', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-27 02:58:55', '2022-09-27 02:58:55'),
(2149, NULL, 2, '2022-09-26 19:59:05', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-27 02:59:05', '2022-09-27 02:59:05'),
(2150, NULL, 2, '2022-09-26 19:59:15', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-27 02:59:15', '2022-09-27 02:59:15'),
(2151, NULL, 2, '2022-09-26 19:59:26', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-27 02:59:26', '2022-09-27 02:59:26'),
(2152, NULL, 2, '2022-09-26 19:59:35', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-27 02:59:35', '2022-09-27 02:59:35'),
(2153, NULL, 2, '2022-09-26 19:59:45', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-27 02:59:45', '2022-09-27 02:59:45'),
(2154, NULL, 2, '2022-09-26 19:59:55', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-27 02:59:55', '2022-09-27 02:59:55'),
(2155, NULL, 2, '2022-09-26 20:00:05', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-27 03:00:05', '2022-09-27 03:00:05'),
(2156, NULL, 2, '2022-09-26 20:00:15', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-27 03:00:15', '2022-09-27 03:00:15'),
(2157, NULL, 2, '2022-09-26 20:00:25', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-27 03:00:25', '2022-09-27 03:00:25'),
(2158, NULL, 2, '2022-09-26 20:00:36', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-27 03:00:36', '2022-09-27 03:00:36'),
(2159, NULL, 2, '2022-09-26 20:00:45', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-27 03:00:45', '2022-09-27 03:00:45'),
(2160, NULL, 2, '2022-09-26 20:00:55', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-27 03:00:55', '2022-09-27 03:00:55'),
(2161, NULL, 2, '2022-09-26 20:01:05', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-27 03:01:05', '2022-09-27 03:01:05'),
(2162, NULL, 2, '2022-09-26 20:01:15', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-27 03:01:15', '2022-09-27 03:01:15'),
(2163, NULL, 2, '2022-09-26 20:01:25', '104.5607259', '32.3532983', 'Unknown Location Found', '2022-09-27 03:01:25', '2022-09-27 03:01:25'),
(2164, NULL, 2, '2022-09-26 20:01:35', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-27 03:01:35', '2022-09-27 03:01:35'),
(2165, NULL, 2, '2022-09-26 20:01:45', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-27 03:01:45', '2022-09-27 03:01:45'),
(2166, NULL, 2, '2022-09-26 20:01:55', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-27 03:01:55', '2022-09-27 03:01:55'),
(2167, NULL, 2, '2022-09-26 20:02:06', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-27 03:02:06', '2022-09-27 03:02:06'),
(2168, NULL, 2, '2022-09-26 20:02:15', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-27 03:02:15', '2022-09-27 03:02:15'),
(2169, NULL, 2, '2022-09-26 20:02:25', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-27 03:02:25', '2022-09-27 03:02:25'),
(2170, NULL, 2, '2022-09-26 20:02:35', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-27 03:02:35', '2022-09-27 03:02:35'),
(2171, NULL, 2, '2022-09-26 20:02:45', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-27 03:02:45', '2022-09-27 03:02:45'),
(2172, NULL, 2, '2022-09-26 20:02:55', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-27 03:02:55', '2022-09-27 03:02:55'),
(2173, NULL, 2, '2022-09-26 20:03:06', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-27 03:03:06', '2022-09-27 03:03:06'),
(2174, NULL, 2, '2022-09-26 20:03:15', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-27 03:03:15', '2022-09-27 03:03:15'),
(2175, NULL, 2, '2022-09-26 20:03:25', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-27 03:03:25', '2022-09-27 03:03:25'),
(2176, NULL, 2, '2022-09-26 20:03:35', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-27 03:03:35', '2022-09-27 03:03:35'),
(2177, NULL, 2, '2022-09-26 20:03:45', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 03:03:45', '2022-09-27 03:03:45'),
(2178, NULL, 2, '2022-09-26 20:03:55', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-27 03:03:55', '2022-09-27 03:03:55'),
(2179, NULL, 2, '2022-09-26 20:04:05', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-27 03:04:05', '2022-09-27 03:04:05'),
(2180, NULL, 2, '2022-09-26 20:04:16', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-27 03:04:16', '2022-09-27 03:04:16'),
(2181, NULL, 2, '2022-09-26 20:04:25', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-27 03:04:25', '2022-09-27 03:04:25'),
(2182, NULL, 2, '2022-09-26 20:04:35', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-27 03:04:35', '2022-09-27 03:04:35'),
(2183, NULL, 2, '2022-09-26 20:04:45', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-27 03:04:45', '2022-09-27 03:04:45'),
(2184, NULL, 2, '2022-09-26 20:04:55', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-27 03:04:55', '2022-09-27 03:04:55'),
(2185, NULL, 2, '2022-09-26 20:05:05', '104.5607253', '32.3532993', 'Unknown Location Found', '2022-09-27 03:05:05', '2022-09-27 03:05:05'),
(2186, NULL, 2, '2022-09-26 20:05:15', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-27 03:05:15', '2022-09-27 03:05:15'),
(2187, NULL, 2, '2022-09-26 20:05:25', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-27 03:05:25', '2022-09-27 03:05:25'),
(2188, NULL, 2, '2022-09-26 20:05:35', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-27 03:05:35', '2022-09-27 03:05:35'),
(2189, NULL, 2, '2022-09-26 20:05:45', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-27 03:05:45', '2022-09-27 03:05:45'),
(2190, NULL, 2, '2022-09-26 20:05:56', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-27 03:05:56', '2022-09-27 03:05:56'),
(2191, NULL, 2, '2022-09-26 20:06:05', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-27 03:06:05', '2022-09-27 03:06:05'),
(2192, NULL, 2, '2022-09-26 20:06:15', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-27 03:06:15', '2022-09-27 03:06:15'),
(2193, NULL, 2, '2022-09-26 20:06:25', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-27 03:06:25', '2022-09-27 03:06:25'),
(2194, NULL, 2, '2022-09-26 20:06:35', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-27 03:06:35', '2022-09-27 03:06:35'),
(2195, NULL, 2, '2022-09-26 20:06:45', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-27 03:06:45', '2022-09-27 03:06:45'),
(2196, NULL, 2, '2022-09-26 20:06:55', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-27 03:06:55', '2022-09-27 03:06:55'),
(2197, NULL, 2, '2022-09-26 20:07:05', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-27 03:07:05', '2022-09-27 03:07:05'),
(2198, NULL, 2, '2022-09-26 20:07:16', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-27 03:07:16', '2022-09-27 03:07:16'),
(2199, NULL, 2, '2022-09-26 20:07:25', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-27 03:07:25', '2022-09-27 03:07:25'),
(2200, NULL, 2, '2022-09-26 20:07:35', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-27 03:07:35', '2022-09-27 03:07:35'),
(2201, NULL, 2, '2022-09-26 20:07:45', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-27 03:07:45', '2022-09-27 03:07:45'),
(2202, NULL, 2, '2022-09-26 20:07:55', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-27 03:07:55', '2022-09-27 03:07:55'),
(2203, NULL, 2, '2022-09-26 20:08:06', '104.5607252', '32.3532989', 'Unknown Location Found', '2022-09-27 03:08:06', '2022-09-27 03:08:06'),
(2204, NULL, 2, '2022-09-26 20:08:15', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-27 03:08:15', '2022-09-27 03:08:15'),
(2205, NULL, 2, '2022-09-26 20:08:25', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-27 03:08:25', '2022-09-27 03:08:25'),
(2206, NULL, 2, '2022-09-26 20:08:36', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-27 03:08:36', '2022-09-27 03:08:36'),
(2207, NULL, 2, '2022-09-26 20:08:45', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-27 03:08:45', '2022-09-27 03:08:45'),
(2208, NULL, 2, '2022-09-26 20:08:55', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 03:08:55', '2022-09-27 03:08:55'),
(2209, NULL, 2, '2022-09-26 20:09:05', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-27 03:09:05', '2022-09-27 03:09:05'),
(2210, NULL, 2, '2022-09-26 20:09:15', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-27 03:09:15', '2022-09-27 03:09:15'),
(2211, NULL, 2, '2022-09-26 20:09:26', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-27 03:09:26', '2022-09-27 03:09:26'),
(2212, NULL, 2, '2022-09-26 20:09:36', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-27 03:09:36', '2022-09-27 03:09:36'),
(2213, NULL, 2, '2022-09-26 20:09:45', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-27 03:09:45', '2022-09-27 03:09:45'),
(2214, NULL, 2, '2022-09-26 20:09:55', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-27 03:09:55', '2022-09-27 03:09:55'),
(2215, NULL, 2, '2022-09-26 20:10:05', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-27 03:10:05', '2022-09-27 03:10:05'),
(2216, NULL, 2, '2022-09-26 20:10:16', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-27 03:10:16', '2022-09-27 03:10:16'),
(2217, NULL, 2, '2022-09-26 20:10:25', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-27 03:10:25', '2022-09-27 03:10:25'),
(2218, NULL, 2, '2022-09-26 20:10:35', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-27 03:10:35', '2022-09-27 03:10:35'),
(2219, NULL, 2, '2022-09-26 20:10:45', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-27 03:10:45', '2022-09-27 03:10:45'),
(2220, NULL, 2, '2022-09-26 20:10:55', '104.5607252', '32.3532993', 'Unknown Location Found', '2022-09-27 03:10:55', '2022-09-27 03:10:55'),
(2221, NULL, 2, '2022-09-26 20:11:05', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-27 03:11:05', '2022-09-27 03:11:05'),
(2222, NULL, 2, '2022-09-26 20:11:15', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-27 03:11:15', '2022-09-27 03:11:15'),
(2223, NULL, 2, '2022-09-26 20:11:25', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-27 03:11:25', '2022-09-27 03:11:25'),
(2224, NULL, 2, '2022-09-26 20:11:35', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-27 03:11:35', '2022-09-27 03:11:35'),
(2225, NULL, 2, '2022-09-26 20:11:45', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-27 03:11:45', '2022-09-27 03:11:45'),
(2226, NULL, 2, '2022-09-26 20:11:55', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-27 03:11:55', '2022-09-27 03:11:55'),
(2227, NULL, 2, '2022-09-26 20:12:06', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-27 03:12:06', '2022-09-27 03:12:06'),
(2228, NULL, 2, '2022-09-26 20:12:16', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 03:12:16', '2022-09-27 03:12:16'),
(2229, NULL, 2, '2022-09-26 20:12:25', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-27 03:12:25', '2022-09-27 03:12:25'),
(2230, NULL, 2, '2022-09-26 20:12:35', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-27 03:12:35', '2022-09-27 03:12:35'),
(2231, NULL, 2, '2022-09-26 20:12:45', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-27 03:12:45', '2022-09-27 03:12:45'),
(2232, NULL, 2, '2022-09-26 20:12:55', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-27 03:12:55', '2022-09-27 03:12:55'),
(2233, NULL, 2, '2022-09-26 20:13:06', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-27 03:13:06', '2022-09-27 03:13:06'),
(2234, NULL, 2, '2022-09-26 20:13:16', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-27 03:13:16', '2022-09-27 03:13:16'),
(2235, NULL, 2, '2022-09-26 20:13:25', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-27 03:13:25', '2022-09-27 03:13:25'),
(2236, NULL, 2, '2022-09-26 20:13:35', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-27 03:13:35', '2022-09-27 03:13:35'),
(2237, NULL, 2, '2022-09-26 20:13:45', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-27 03:13:45', '2022-09-27 03:13:45'),
(2238, NULL, 2, '2022-09-26 20:13:56', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-27 03:13:56', '2022-09-27 03:13:56'),
(2239, NULL, 2, '2022-09-26 20:14:05', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-27 03:14:05', '2022-09-27 03:14:05'),
(2240, NULL, 2, '2022-09-26 20:14:15', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-27 03:14:15', '2022-09-27 03:14:15'),
(2241, NULL, 2, '2022-09-26 20:14:25', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-27 03:14:25', '2022-09-27 03:14:25'),
(2242, NULL, 2, '2022-09-26 20:14:35', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-27 03:14:35', '2022-09-27 03:14:35'),
(2243, NULL, 2, '2022-09-26 20:14:46', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-27 03:14:46', '2022-09-27 03:14:46'),
(2244, NULL, 2, '2022-09-26 20:14:55', '104.5607259', '32.3532985', 'Unknown Location Found', '2022-09-27 03:14:55', '2022-09-27 03:14:55'),
(2245, NULL, 2, '2022-09-26 20:15:05', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-27 03:15:05', '2022-09-27 03:15:05'),
(2246, NULL, 2, '2022-09-26 20:15:15', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-27 03:15:15', '2022-09-27 03:15:15'),
(2247, NULL, 2, '2022-09-26 20:15:26', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-27 03:15:26', '2022-09-27 03:15:26'),
(2248, NULL, 2, '2022-09-26 20:15:36', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-27 03:15:36', '2022-09-27 03:15:36'),
(2249, NULL, 2, '2022-09-26 20:15:45', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-27 03:15:45', '2022-09-27 03:15:45'),
(2250, NULL, 2, '2022-09-26 20:15:55', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-27 03:15:55', '2022-09-27 03:15:55'),
(2251, NULL, 2, '2022-09-26 20:16:05', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-27 03:16:05', '2022-09-27 03:16:05'),
(2252, NULL, 2, '2022-09-26 20:16:16', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-27 03:16:16', '2022-09-27 03:16:16'),
(2253, NULL, 2, '2022-09-26 20:16:25', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-27 03:16:25', '2022-09-27 03:16:25'),
(2254, NULL, 2, '2022-09-26 20:16:36', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-27 03:16:36', '2022-09-27 03:16:36'),
(2255, NULL, 2, '2022-09-26 20:16:45', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-27 03:16:45', '2022-09-27 03:16:45'),
(2256, NULL, 2, '2022-09-26 20:16:56', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-27 03:16:56', '2022-09-27 03:16:56'),
(2257, NULL, 2, '2022-09-26 20:17:05', '104.5607256', '32.3532993', 'Unknown Location Found', '2022-09-27 03:17:05', '2022-09-27 03:17:05'),
(2258, NULL, 2, '2022-09-26 20:17:15', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-27 03:17:15', '2022-09-27 03:17:15'),
(2259, NULL, 2, '2022-09-26 20:17:25', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-27 03:17:25', '2022-09-27 03:17:25'),
(2260, NULL, 2, '2022-09-26 20:17:35', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-27 03:17:35', '2022-09-27 03:17:35'),
(2261, NULL, 2, '2022-09-26 20:17:45', '104.5607252', '32.3532989', 'Unknown Location Found', '2022-09-27 03:17:45', '2022-09-27 03:17:45'),
(2262, NULL, 2, '2022-09-26 20:17:55', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-27 03:17:55', '2022-09-27 03:17:55'),
(2263, NULL, 2, '2022-09-26 20:18:05', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-27 03:18:05', '2022-09-27 03:18:05'),
(2264, NULL, 2, '2022-09-26 20:18:16', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-27 03:18:16', '2022-09-27 03:18:16'),
(2265, NULL, 2, '2022-09-26 20:18:25', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-27 03:18:25', '2022-09-27 03:18:25'),
(2266, NULL, 2, '2022-09-26 20:18:35', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-27 03:18:35', '2022-09-27 03:18:35'),
(2267, NULL, 2, '2022-09-26 20:18:45', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-27 03:18:45', '2022-09-27 03:18:45'),
(2268, NULL, 2, '2022-09-26 20:18:55', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-27 03:18:55', '2022-09-27 03:18:55'),
(2269, NULL, 2, '2022-09-26 20:19:05', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-27 03:19:05', '2022-09-27 03:19:05'),
(2270, NULL, 2, '2022-09-26 20:19:16', '104.5607255', '32.3532983', 'Unknown Location Found', '2022-09-27 03:19:16', '2022-09-27 03:19:16'),
(2271, NULL, 2, '2022-09-26 20:19:25', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 03:19:25', '2022-09-27 03:19:25'),
(2272, NULL, 2, '2022-09-26 20:19:35', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-27 03:19:35', '2022-09-27 03:19:35'),
(2273, NULL, 2, '2022-09-26 20:19:45', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-27 03:19:45', '2022-09-27 03:19:45'),
(2274, NULL, 2, '2022-09-26 20:19:55', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-27 03:19:55', '2022-09-27 03:19:55'),
(2275, NULL, 2, '2022-09-26 20:20:05', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-27 03:20:05', '2022-09-27 03:20:05'),
(2276, NULL, 2, '2022-09-26 20:20:15', '104.5607255', '32.3532983', 'Unknown Location Found', '2022-09-27 03:20:15', '2022-09-27 03:20:15'),
(2277, NULL, 2, '2022-09-26 20:20:25', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-27 03:20:25', '2022-09-27 03:20:25'),
(2278, NULL, 2, '2022-09-26 20:20:35', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-27 03:20:35', '2022-09-27 03:20:35'),
(2279, NULL, 2, '2022-09-26 20:20:45', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-27 03:20:45', '2022-09-27 03:20:45'),
(2280, NULL, 2, '2022-09-26 20:20:55', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-27 03:20:55', '2022-09-27 03:20:55'),
(2281, NULL, 2, '2022-09-26 20:21:05', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-27 03:21:05', '2022-09-27 03:21:05'),
(2282, NULL, 2, '2022-09-26 20:21:16', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-27 03:21:16', '2022-09-27 03:21:16'),
(2283, NULL, 2, '2022-09-26 20:21:25', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-27 03:21:25', '2022-09-27 03:21:25'),
(2284, NULL, 2, '2022-09-26 20:21:35', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-27 03:21:35', '2022-09-27 03:21:35'),
(2285, NULL, 2, '2022-09-26 20:21:45', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-27 03:21:45', '2022-09-27 03:21:45'),
(2286, NULL, 2, '2022-09-26 20:21:56', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-27 03:21:56', '2022-09-27 03:21:56'),
(2287, NULL, 2, '2022-09-26 20:22:05', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-27 03:22:05', '2022-09-27 03:22:05'),
(2288, NULL, 2, '2022-09-26 20:22:15', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-27 03:22:15', '2022-09-27 03:22:15'),
(2289, NULL, 2, '2022-09-26 20:22:25', '104.5607251', '32.3532987', 'Unknown Location Found', '2022-09-27 03:22:25', '2022-09-27 03:22:25'),
(2290, NULL, 2, '2022-09-26 20:22:35', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-27 03:22:35', '2022-09-27 03:22:35'),
(2291, NULL, 2, '2022-09-26 20:22:45', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-27 03:22:45', '2022-09-27 03:22:45'),
(2292, NULL, 2, '2022-09-26 20:22:56', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-27 03:22:56', '2022-09-27 03:22:56'),
(2293, NULL, 2, '2022-09-26 20:23:05', '104.5607252', '32.3532989', 'Unknown Location Found', '2022-09-27 03:23:05', '2022-09-27 03:23:05'),
(2294, NULL, 2, '2022-09-26 20:23:15', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-27 03:23:15', '2022-09-27 03:23:15'),
(2295, NULL, 2, '2022-09-26 20:37:14', '31.295714', '30.1292499', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:37:14', '2022-09-27 03:37:14'),
(2296, NULL, 2, '2022-09-26 20:37:24', '31.2957139', '30.1292494', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:37:24', '2022-09-27 03:37:24'),
(2297, NULL, 2, '2022-09-26 20:37:36', '31.2957529', '30.1292539', '47HW+H7X, El Matareya, EG', '2022-09-27 03:37:36', '2022-09-27 03:37:36'),
(2298, NULL, 2, '2022-09-26 20:37:46', '31.2957262', '30.1292135', '47HW+H7X, El Matareya, EG', '2022-09-27 03:37:46', '2022-09-27 03:37:46'),
(2299, NULL, 2, '2022-09-26 20:37:51', '31.2956995', '30.1292293', '47HW+H7X, El Matareya, EG', '2022-09-27 03:37:51', '2022-09-27 03:37:51'),
(2300, NULL, 2, '2022-09-26 20:38:01', '31.2957753', '30.1292069', '47HW+H7X, El Matareya, EG', '2022-09-27 03:38:01', '2022-09-27 03:38:01'),
(2301, NULL, 2, '2022-09-26 20:38:11', '31.2957176', '30.1291983', '47HW+H7X, El Matareya, EG', '2022-09-27 03:38:11', '2022-09-27 03:38:11'),
(2302, NULL, 2, '2022-09-26 20:38:21', '31.2957897', '30.1292359', '47HW+H7X, El Matareya, EG', '2022-09-27 03:38:21', '2022-09-27 03:38:21'),
(2303, NULL, 2, '2022-09-26 20:38:32', '31.2957688', '30.1287834', '47HW+H7X, El Matareya, EG', '2022-09-27 03:38:32', '2022-09-27 03:38:32'),
(2304, NULL, 2, '2022-09-26 20:38:41', '31.2957619', '30.1290468', '47HW+H7X, El Matareya, EG', '2022-09-27 03:38:41', '2022-09-27 03:38:41'),
(2305, NULL, 2, '2022-09-26 20:38:51', '31.2963819', '30.1289509', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:38:51', '2022-09-27 03:38:51'),
(2306, NULL, 2, '2022-09-26 20:39:01', '31.2957307', '30.1291961', '47HW+H7X, El Matareya, EG', '2022-09-27 03:39:01', '2022-09-27 03:39:01'),
(2307, NULL, 2, '2022-09-26 20:39:11', '31.2962424', '30.1290712', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:39:11', '2022-09-27 03:39:11'),
(2308, NULL, 2, '2022-09-26 20:39:21', '31.295748', '30.1292351', '47HW+H7X, El Matareya, EG', '2022-09-27 03:39:21', '2022-09-27 03:39:21'),
(2309, NULL, 2, '2022-09-26 20:39:32', '31.2957095', '30.1292721', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:39:32', '2022-09-27 03:39:32'),
(2310, NULL, 2, '2022-09-26 20:39:42', '31.2963458', '30.1289588', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:39:42', '2022-09-27 03:39:42'),
(2311, NULL, 2, '2022-09-26 20:39:51', '31.2957657', '30.1291891', '47HW+H7X, El Matareya, EG', '2022-09-27 03:39:51', '2022-09-27 03:39:51'),
(2312, NULL, 2, '2022-09-26 20:40:01', '31.295689', '30.1291364', '47HW+H7X, El Matareya, EG', '2022-09-27 03:40:01', '2022-09-27 03:40:01'),
(2313, NULL, 2, '2022-09-26 20:40:11', '31.2958271', '30.129244', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:40:11', '2022-09-27 03:40:11'),
(2314, NULL, 2, '2022-09-26 20:40:21', '31.295724', '30.1292465', '47HW+H7X, El Matareya, EG', '2022-09-27 03:40:21', '2022-09-27 03:40:21'),
(2315, NULL, 2, '2022-09-26 20:40:49', '31.2957258', '30.1292538', '47HW+H7X, El Matareya, EG', '2022-09-27 03:40:49', '2022-09-27 03:40:49'),
(2316, NULL, 2, '2022-09-26 20:40:51', '31.2957258', '30.1292538', '47HW+H7X, El Matareya, EG', '2022-09-27 03:40:51', '2022-09-27 03:40:51'),
(2317, NULL, 2, '2022-09-26 20:41:01', '31.2957375', '30.129264', '47HW+H7X, El Matareya, EG', '2022-09-27 03:41:01', '2022-09-27 03:41:01'),
(2318, NULL, 2, '2022-09-26 20:41:32', '31.2957199', '30.1292662', '47HW+H7X, El Matareya, EG', '2022-09-27 03:41:32', '2022-09-27 03:41:32'),
(2319, NULL, 2, '2022-09-26 20:41:33', '31.2957199', '30.1292662', '47HW+H7X, El Matareya, EG', '2022-09-27 03:41:33', '2022-09-27 03:41:33'),
(2320, NULL, 2, '2022-09-26 20:42:03', '31.2957985', '30.1292187', '47HW+H7X, El Matareya, EG', '2022-09-27 03:42:03', '2022-09-27 03:42:03'),
(2321, NULL, 2, '2022-09-26 20:42:04', '31.2957985', '30.1292187', '47HW+H7X, El Matareya, EG', '2022-09-27 03:42:04', '2022-09-27 03:42:04'),
(2322, NULL, 2, '2022-09-26 20:42:33', '31.2957914', '30.1292663', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:42:33', '2022-09-27 03:42:33'),
(2323, NULL, 2, '2022-09-26 20:42:33', '31.2957914', '30.1292663', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:42:33', '2022-09-27 03:42:33'),
(2324, NULL, 2, '2022-09-26 20:42:45', '31.2957093', '30.129245', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:42:45', '2022-09-27 03:42:45'),
(2325, NULL, 2, '2022-09-26 20:43:57', '31.295714', '30.1292597', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:43:57', '2022-09-27 03:43:57'),
(2326, NULL, 2, '2022-09-26 20:43:58', '31.295714', '30.1292597', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:43:58', '2022-09-27 03:43:58'),
(2327, NULL, 2, '2022-09-26 20:44:08', '31.2957386', '30.1292649', '47HW+H7X, El Matareya, EG', '2022-09-27 03:44:08', '2022-09-27 03:44:08'),
(2328, NULL, 2, '2022-09-26 20:44:19', '31.2962807', '30.1289645', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:44:19', '2022-09-27 03:44:19'),
(2329, NULL, 2, '2022-09-26 20:44:49', '31.2957278', '30.1292705', '47HW+H7X, El Matareya, EG', '2022-09-27 03:44:49', '2022-09-27 03:44:49'),
(2330, NULL, 2, '2022-09-26 20:44:52', '31.2957278', '30.1292705', '47HW+H7X, El Matareya, EG', '2022-09-27 03:44:52', '2022-09-27 03:44:52'),
(2331, NULL, 2, '2022-09-26 20:45:46', '31.2957106', '30.1292674', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:45:46', '2022-09-27 03:45:46'),
(2332, NULL, 2, '2022-09-26 20:45:51', '31.295715', '30.1292705', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:45:51', '2022-09-27 03:45:51'),
(2333, NULL, 2, '2022-09-26 20:46:01', '31.2957229', '30.1292546', '47HW+H7X, El Matareya, EG', '2022-09-27 03:46:01', '2022-09-27 03:46:01'),
(2334, NULL, 2, '2022-09-26 20:46:11', '31.2957194', '30.1292545', '47HW+H7X, El Matareya, EG', '2022-09-27 03:46:11', '2022-09-27 03:46:11'),
(2335, NULL, 2, '2022-09-26 20:46:21', '31.2957232', '30.1292503', '47HW+H7X, El Matareya, EG', '2022-09-27 03:46:21', '2022-09-27 03:46:21'),
(2336, NULL, 2, '2022-09-26 20:46:31', '31.2957164', '30.1292682', '47HW+H7X, El Matareya, EG', '2022-09-27 03:46:31', '2022-09-27 03:46:31'),
(2337, NULL, 2, '2022-09-26 20:46:41', '31.2957147', '30.12927', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:46:41', '2022-09-27 03:46:41'),
(2338, NULL, 2, '2022-09-26 20:46:54', '31.2958516', '30.1291489', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:46:54', '2022-09-27 03:46:54'),
(2339, NULL, 2, '2022-09-26 20:47:05', '31.2957427', '30.1292317', '47HW+H7X, El Matareya, EG', '2022-09-27 03:47:05', '2022-09-27 03:47:05'),
(2340, NULL, 2, '2022-09-26 20:47:14', '31.2956769', '30.1292012', '47HW+H7X, El Matareya, EG', '2022-09-27 03:47:14', '2022-09-27 03:47:14'),
(2341, NULL, 2, '2022-09-26 20:47:24', '31.2957432', '30.1292295', '47HW+H7X, El Matareya, EG', '2022-09-27 03:47:24', '2022-09-27 03:47:24'),
(2342, NULL, 2, '2022-09-26 20:47:31', '31.295614', '30.1290828', '47HW+H7X, El Matareya, EG', '2022-09-27 03:47:31', '2022-09-27 03:47:31'),
(2343, NULL, 2, '2022-09-26 20:47:41', '31.2957143', '30.1292403', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:47:41', '2022-09-27 03:47:41'),
(2344, NULL, 2, '2022-09-26 20:47:51', '31.2957719', '30.1291882', '47HW+H7X, El Matareya, EG', '2022-09-27 03:47:51', '2022-09-27 03:47:51'),
(2345, NULL, 2, '2022-09-26 20:48:02', '31.295782', '30.1292272', '47HW+H7X, El Matareya, EG', '2022-09-27 03:48:02', '2022-09-27 03:48:02'),
(2346, NULL, 2, '2022-09-26 20:49:52', '31.2957741', '30.1292751', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:49:52', '2022-09-27 03:49:52'),
(2347, NULL, 2, '2022-09-26 20:52:07', '31.2960274', '30.1289312', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:52:07', '2022-09-27 03:52:07'),
(2348, NULL, 2, '2022-09-26 20:52:08', '31.2960274', '30.1289312', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:52:08', '2022-09-27 03:52:08'),
(2349, NULL, 2, '2022-09-26 20:52:20', '31.2957725', '30.129164', '47HW+H7X, El Matareya, EG', '2022-09-27 03:52:20', '2022-09-27 03:52:20'),
(2350, NULL, 2, '2022-09-26 20:52:35', '31.2963551', '30.1289455', 'Al Kawetch (Al Matareyya), El Matareya, EG', '2022-09-27 03:52:35', '2022-09-27 03:52:35'),
(2351, NULL, 2, '2022-09-26 20:52:41', '31.2957832', '30.1292096', '47HW+H7X, El Matareya, EG', '2022-09-27 03:52:41', '2022-09-27 03:52:41'),
(2352, NULL, 2, '2022-09-26 20:52:57', '31.2957634', '30.1292254', '47HW+H7X, El Matareya, EG', '2022-09-27 03:52:57', '2022-09-27 03:52:57'),
(2353, NULL, 2, '2022-09-26 20:53:07', '31.2955853', '30.1287946', '47HW+H7X, El Matareya, EG', '2022-09-27 03:53:07', '2022-09-27 03:53:07'),
(2354, NULL, 2, '2022-09-26 20:53:15', '31.295558', '30.1287279', 'صابر كامل للهيدروليك, El Matareya, EG', '2022-09-27 03:53:15', '2022-09-27 03:53:15'),
(2355, NULL, 2, '2022-09-26 20:53:24', '31.2957674', '30.1292625', '47HW+H7X, El Matareya, EG', '2022-09-27 03:53:24', '2022-09-27 03:53:24'),
(2356, NULL, 2, '2022-09-26 20:53:34', '31.2957422', '30.1292755', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:53:34', '2022-09-27 03:53:34'),
(2357, NULL, 2, '2022-09-26 20:53:44', '31.2957878', '30.1291749', '47HW+H7X, El Matareya, EG', '2022-09-27 03:53:44', '2022-09-27 03:53:44'),
(2358, NULL, 2, '2022-09-26 20:53:54', '31.2957152', '30.1292693', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:53:54', '2022-09-27 03:53:54'),
(2359, NULL, 2, '2022-09-26 20:54:04', '31.2957137', '30.1292738', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:54:04', '2022-09-27 03:54:04'),
(2360, NULL, 2, '2022-09-26 20:54:27', '31.2957259', '30.1292674', '47HW+H7X, El Matareya, EG', '2022-09-27 03:54:27', '2022-09-27 03:54:27'),
(2361, NULL, 2, '2022-09-26 20:54:41', '31.2957582', '30.1292594', '47HW+H7X, El Matareya, EG', '2022-09-27 03:54:41', '2022-09-27 03:54:41'),
(2362, NULL, 2, '2022-09-26 20:54:51', '31.2957636', '30.129225', '47HW+H7X, El Matareya, EG', '2022-09-27 03:54:51', '2022-09-27 03:54:51'),
(2363, NULL, 2, '2022-09-26 20:55:01', '31.2956942', '30.1292876', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:55:01', '2022-09-27 03:55:01'),
(2364, NULL, 2, '2022-09-26 20:55:11', '31.2957519', '30.1292467', '47HW+H7X, El Matareya, EG', '2022-09-27 03:55:11', '2022-09-27 03:55:11'),
(2365, NULL, 2, '2022-09-26 20:55:21', '31.295724', '30.1292857', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:55:21', '2022-09-27 03:55:21'),
(2366, NULL, 2, '2022-09-26 20:55:31', '31.2961174', '30.1289756', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:55:31', '2022-09-27 03:55:31'),
(2367, NULL, 2, '2022-09-26 20:55:39', '31.2961822', '30.1289275', '47HW+JCV, قسم المطرية, EG', '2022-09-27 03:55:39', '2022-09-27 03:55:39'),
(2368, NULL, 2, '2022-09-26 20:55:48', '31.2956694', '30.1292868', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:55:48', '2022-09-27 03:55:48'),
(2369, NULL, 2, '2022-09-26 20:55:58', '31.2957291', '30.1292753', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:55:58', '2022-09-27 03:55:58'),
(2370, NULL, 2, '2022-09-26 20:56:24', '31.2957247', '30.1292579', '47HW+H7X, El Matareya, EG', '2022-09-27 03:56:24', '2022-09-27 03:56:24'),
(2371, NULL, 2, '2022-09-26 20:56:28', '31.2957406', '30.1292164', '47HW+H7X, El Matareya, EG', '2022-09-27 03:56:28', '2022-09-27 03:56:28'),
(2372, NULL, 2, '2022-09-26 20:56:37', '31.2957432', '30.1292166', '47HW+H7X, El Matareya, EG', '2022-09-27 03:56:37', '2022-09-27 03:56:37'),
(2373, NULL, 2, '2022-09-26 20:56:48', '31.2956817', '30.1291587', '47HW+H7X, El Matareya, EG', '2022-09-27 03:56:48', '2022-09-27 03:56:48'),
(2374, NULL, 2, '2022-09-26 20:56:58', '31.2958191', '30.1291173', '47HW+H7X, El Matareya, EG', '2022-09-27 03:56:58', '2022-09-27 03:56:58'),
(2375, NULL, 2, '2022-09-26 20:57:08', '31.2957279', '30.1292803', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:57:08', '2022-09-27 03:57:08'),
(2376, NULL, 2, '2022-09-26 20:57:18', '31.2957293', '30.1292775', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:57:18', '2022-09-27 03:57:18'),
(2377, NULL, 2, '2022-09-26 20:57:35', '31.2955336', '30.1292602', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:57:35', '2022-09-27 03:57:35'),
(2378, NULL, 2, '2022-09-26 20:58:00', '31.2957409', '30.1292267', '47HW+H7X, El Matareya, EG', '2022-09-27 03:58:00', '2022-09-27 03:58:00'),
(2379, NULL, 2, '2022-09-26 20:58:10', '31.2957274', '30.1292513', '47HW+H7X, El Matareya, EG', '2022-09-27 03:58:10', '2022-09-27 03:58:10'),
(2380, NULL, 2, '2022-09-26 20:58:20', '31.2957444', '30.1292626', '47HW+H7X, El Matareya, EG', '2022-09-27 03:58:20', '2022-09-27 03:58:20'),
(2381, NULL, 2, '2022-09-26 20:58:30', '31.2957217', '30.1292707', '47HW+H7X, El Matareya, EG', '2022-09-27 03:58:30', '2022-09-27 03:58:30'),
(2382, NULL, 2, '2022-09-26 20:58:39', '31.2957022', '30.1292759', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:58:39', '2022-09-27 03:58:39'),
(2383, NULL, 2, '2022-09-26 20:59:23', '31.2957278', '30.1292839', '47HW+P5C, قسم المطرية, EG', '2022-09-27 03:59:23', '2022-09-27 03:59:23'),
(2384, NULL, 2, '2022-09-26 20:59:27', '31.2957871', '30.1292426', '47HW+H7X, El Matareya, EG', '2022-09-27 03:59:27', '2022-09-27 03:59:27'),
(2385, NULL, 2, '2022-09-26 20:59:37', '31.2957186', '30.1292722', '47HW+H7X, El Matareya, EG', '2022-09-27 03:59:37', '2022-09-27 03:59:37'),
(2386, NULL, 2, '2022-09-26 20:59:48', '31.2957289', '30.1292457', '47HW+H7X, El Matareya, EG', '2022-09-27 03:59:48', '2022-09-27 03:59:48'),
(2387, NULL, 2, '2022-09-26 20:59:57', '31.2957473', '30.1292393', '47HW+H7X, El Matareya, EG', '2022-09-27 03:59:57', '2022-09-27 03:59:57'),
(2388, NULL, 2, '2022-09-26 21:00:07', '31.2957258', '30.1292565', '47HW+H7X, El Matareya, EG', '2022-09-27 04:00:07', '2022-09-27 04:00:07'),
(2389, NULL, 2, '2022-09-26 21:02:49', '31.2957207', '30.1290437', '47HW+H7X, El Matareya, EG', '2022-09-27 04:02:49', '2022-09-27 04:02:49'),
(2390, NULL, 2, '2022-09-26 21:03:00', '31.2957186', '30.129263', '47HW+H7X, El Matareya, EG', '2022-09-27 04:03:00', '2022-09-27 04:03:00'),
(2391, NULL, 2, '2022-09-26 21:03:51', '31.2956968', '30.1292263', '47HW+H7X, El Matareya, EG', '2022-09-27 04:03:51', '2022-09-27 04:03:51'),
(2392, NULL, 2, '2022-09-26 21:03:52', '31.2956968', '30.1292263', '47HW+H7X, El Matareya, EG', '2022-09-27 04:03:52', '2022-09-27 04:03:52'),
(2393, NULL, 2, '2022-09-26 21:04:12', '31.2957375', '30.1292579', '47HW+H7X, El Matareya, EG', '2022-09-27 04:04:12', '2022-09-27 04:04:12'),
(2394, NULL, 2, '2022-09-26 21:04:12', '31.2957375', '30.1292579', '47HW+H7X, El Matareya, EG', '2022-09-27 04:04:12', '2022-09-27 04:04:12'),
(2395, NULL, 2, '2022-09-26 21:04:57', '31.2957414', '30.1292453', '47HW+H7X, El Matareya, EG', '2022-09-27 04:04:57', '2022-09-27 04:04:57'),
(2396, NULL, 2, '2022-09-26 21:04:58', '31.2957414', '30.1292453', '47HW+H7X, El Matareya, EG', '2022-09-27 04:04:58', '2022-09-27 04:04:58'),
(2397, NULL, 2, '2022-09-26 21:05:50', '31.2957397', '30.1292502', '47HW+H7X, El Matareya, EG', '2022-09-27 04:05:50', '2022-09-27 04:05:50'),
(2398, NULL, 2, '2022-09-26 21:05:52', '31.2957397', '30.1292502', '47HW+H7X, El Matareya, EG', '2022-09-27 04:05:52', '2022-09-27 04:05:52'),
(2399, NULL, 2, '2022-09-26 21:06:03', '31.2956687', '30.1292173', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:06:03', '2022-09-27 04:06:03'),
(2400, NULL, 2, '2022-09-26 21:09:25', '31.2957293', '30.1292743', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:09:25', '2022-09-27 04:09:25'),
(2401, NULL, 2, '2022-09-26 21:09:28', '31.2957294', '30.1292525', '47HW+H7X, El Matareya, EG', '2022-09-27 04:09:28', '2022-09-27 04:09:28'),
(2402, NULL, 2, '2022-09-26 21:09:39', '31.2957466', '30.1292524', '47HW+H7X, El Matareya, EG', '2022-09-27 04:09:39', '2022-09-27 04:09:39'),
(2403, NULL, 2, '2022-09-26 21:09:49', '31.2957328', '30.1292307', '47HW+H7X, El Matareya, EG', '2022-09-27 04:09:49', '2022-09-27 04:09:49'),
(2404, NULL, 2, '2022-09-26 21:10:00', '31.2957015', '30.1292558', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:10:00', '2022-09-27 04:10:00'),
(2405, NULL, 2, '2022-09-26 21:10:08', '31.2957232', '30.1292465', '47HW+H7X, El Matareya, EG', '2022-09-27 04:10:08', '2022-09-27 04:10:08'),
(2406, NULL, 2, '2022-09-26 21:10:18', '31.2957462', '30.1292554', '47HW+H7X, El Matareya, EG', '2022-09-27 04:10:18', '2022-09-27 04:10:18'),
(2407, NULL, 2, '2022-09-26 21:10:29', '31.2957413', '30.1292386', '47HW+H7X, El Matareya, EG', '2022-09-27 04:10:29', '2022-09-27 04:10:29'),
(2408, NULL, 2, '2022-09-26 21:10:40', '31.2957227', '30.1292838', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:10:40', '2022-09-27 04:10:40'),
(2409, NULL, 2, '2022-09-26 21:10:49', '31.2956844', '30.1292169', '47HW+H7X, El Matareya, EG', '2022-09-27 04:10:49', '2022-09-27 04:10:49'),
(2410, NULL, 2, '2022-09-26 21:10:59', '31.2958779', '30.1291864', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:10:59', '2022-09-27 04:10:59'),
(2411, NULL, 2, '2022-09-26 21:11:08', '31.2957789', '30.1292144', '47HW+H7X, El Matareya, EG', '2022-09-27 04:11:08', '2022-09-27 04:11:08'),
(2412, NULL, 2, '2022-09-26 21:11:18', '31.2957055', '30.1292246', '47HW+H7X, El Matareya, EG', '2022-09-27 04:11:18', '2022-09-27 04:11:18'),
(2413, NULL, 2, '2022-09-26 21:11:28', '31.2957435', '30.1292325', '47HW+H7X, El Matareya, EG', '2022-09-27 04:11:28', '2022-09-27 04:11:28'),
(2414, NULL, 2, '2022-09-26 21:11:54', '31.2957727', '30.12921', '47HW+H7X, El Matareya, EG', '2022-09-27 04:11:54', '2022-09-27 04:11:54'),
(2415, NULL, 2, '2022-09-26 21:12:00', '31.2957087', '30.1291295', '47HW+H7X, El Matareya, EG', '2022-09-27 04:12:00', '2022-09-27 04:12:00'),
(2416, NULL, 2, '2022-09-26 21:12:28', '31.2957443', '30.1292634', '47HW+H7X, El Matareya, EG', '2022-09-27 04:12:28', '2022-09-27 04:12:28'),
(2417, NULL, 2, '2022-09-26 21:12:28', '31.2957443', '30.1292634', '47HW+H7X, El Matareya, EG', '2022-09-27 04:12:28', '2022-09-27 04:12:28'),
(2418, NULL, 2, '2022-09-26 21:13:30', '31.2942856', '30.1294916', '47HV+WQ3, El Matareya, EG', '2022-09-27 04:13:30', '2022-09-27 04:13:30'),
(2419, NULL, 2, '2022-09-26 21:13:44', '31.2956831', '30.1292849', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:13:44', '2022-09-27 04:13:44'),
(2420, NULL, 2, '2022-09-26 21:13:55', '31.2957517', '30.1292623', '47HW+H7X, El Matareya, EG', '2022-09-27 04:13:55', '2022-09-27 04:13:55'),
(2421, NULL, 2, '2022-09-26 21:14:07', '31.2957534', '30.1292344', '47HW+H7X, El Matareya, EG', '2022-09-27 04:14:07', '2022-09-27 04:14:07'),
(2422, NULL, 2, '2022-09-26 21:14:13', '31.2957506', '30.1292341', '47HW+H7X, El Matareya, EG', '2022-09-27 04:14:13', '2022-09-27 04:14:13'),
(2423, NULL, 2, '2022-09-26 21:14:23', '31.2957363', '30.1291844', '47HW+H7X, El Matareya, EG', '2022-09-27 04:14:23', '2022-09-27 04:14:23'),
(2424, NULL, 2, '2022-09-26 21:14:33', '31.2957418', '30.1292669', '47HW+H7X, El Matareya, EG', '2022-09-27 04:14:33', '2022-09-27 04:14:33'),
(2425, NULL, 2, '2022-09-26 21:14:43', '31.2957437', '30.129239', '47HW+H7X, El Matareya, EG', '2022-09-27 04:14:43', '2022-09-27 04:14:43'),
(2426, NULL, 2, '2022-09-26 21:14:54', '31.2957185', '30.1292619', '47HW+H7X, El Matareya, EG', '2022-09-27 04:14:54', '2022-09-27 04:14:54'),
(2427, NULL, 2, '2022-09-26 21:15:23', '31.2957162', '30.1292681', '47HW+H7X, El Matareya, EG', '2022-09-27 04:15:23', '2022-09-27 04:15:23'),
(2428, NULL, 2, '2022-09-26 21:15:23', '31.2957162', '30.1292681', '47HW+H7X, El Matareya, EG', '2022-09-27 04:15:23', '2022-09-27 04:15:23'),
(2429, NULL, 2, '2022-09-26 21:16:22', '31.2957335', '30.1292704', '47HW+H7X, El Matareya, EG', '2022-09-27 04:16:22', '2022-09-27 04:16:22'),
(2430, NULL, 2, '2022-09-26 21:16:23', '31.2956587', '30.1292227', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:16:23', '2022-09-27 04:16:23'),
(2431, NULL, 2, '2022-09-26 21:18:53', '31.2957223', '30.1292777', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:18:53', '2022-09-27 04:18:53'),
(2432, NULL, 2, '2022-09-26 21:18:53', '31.2957223', '30.1292777', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:18:53', '2022-09-27 04:18:53');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(2433, NULL, 2, '2022-09-26 21:19:03', '31.2961798', '30.1291013', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:19:03', '2022-09-27 04:19:03'),
(2434, NULL, 2, '2022-09-26 21:19:23', '31.2957168', '30.1292606', '47HW+H7X, El Matareya, EG', '2022-09-27 04:19:23', '2022-09-27 04:19:23'),
(2435, NULL, 2, '2022-09-26 21:19:38', '31.2958279', '30.1291617', '47HW+H7X, El Matareya, EG', '2022-09-27 04:19:38', '2022-09-27 04:19:38'),
(2436, NULL, 2, '2022-09-26 21:19:51', '31.2957308', '30.1292707', '47HW+H7X, El Matareya, EG', '2022-09-27 04:19:51', '2022-09-27 04:19:51'),
(2437, NULL, 2, '2022-09-26 21:19:58', '31.2957054', '30.129257', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:19:58', '2022-09-27 04:19:58'),
(2438, NULL, 2, '2022-09-26 21:20:08', '31.2957513', '30.1292426', '47HW+H7X, El Matareya, EG', '2022-09-27 04:20:08', '2022-09-27 04:20:08'),
(2439, NULL, 2, '2022-09-26 21:20:18', '31.2957227', '30.1292633', '47HW+H7X, El Matareya, EG', '2022-09-27 04:20:18', '2022-09-27 04:20:18'),
(2440, NULL, 2, '2022-09-26 21:20:29', '31.2959632', '30.1291793', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:20:29', '2022-09-27 04:20:29'),
(2441, NULL, 2, '2022-09-26 21:20:39', '31.2957566', '30.1292712', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:20:39', '2022-09-27 04:20:39'),
(2442, NULL, 2, '2022-09-26 21:20:48', '31.2957797', '30.1292051', '47HW+H7X, El Matareya, EG', '2022-09-27 04:20:48', '2022-09-27 04:20:48'),
(2443, NULL, 2, '2022-09-26 21:20:58', '31.2957241', '30.1292498', '47HW+H7X, El Matareya, EG', '2022-09-27 04:20:58', '2022-09-27 04:20:58'),
(2444, NULL, 2, '2022-09-26 21:21:08', '31.2960904', '30.129041', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:21:08', '2022-09-27 04:21:08'),
(2445, NULL, 2, '2022-09-26 21:21:18', '31.2958509', '30.1291635', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:21:18', '2022-09-27 04:21:18'),
(2446, NULL, 2, '2022-09-26 21:21:29', '31.2958974', '30.1291338', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:21:29', '2022-09-27 04:21:29'),
(2447, NULL, 2, '2022-09-26 21:21:38', '31.2957306', '30.129214', '47HW+H7X, El Matareya, EG', '2022-09-27 04:21:38', '2022-09-27 04:21:38'),
(2448, NULL, 2, '2022-09-26 21:21:48', '31.29573', '30.1292571', '47HW+H7X, El Matareya, EG', '2022-09-27 04:21:48', '2022-09-27 04:21:48'),
(2449, NULL, 2, '2022-09-26 21:21:58', '31.2957168', '30.1292602', '47HW+H7X, El Matareya, EG', '2022-09-27 04:21:58', '2022-09-27 04:21:58'),
(2450, NULL, 2, '2022-09-26 21:22:08', '31.2957335', '30.1292544', '47HW+H7X, El Matareya, EG', '2022-09-27 04:22:08', '2022-09-27 04:22:08'),
(2451, NULL, 2, '2022-09-26 21:22:18', '31.2957215', '30.1292671', '47HW+H7X, El Matareya, EG', '2022-09-27 04:22:18', '2022-09-27 04:22:18'),
(2452, NULL, 2, '2022-09-26 21:22:28', '31.2956941', '30.1292166', '47HW+H7X, El Matareya, EG', '2022-09-27 04:22:28', '2022-09-27 04:22:28'),
(2453, NULL, 2, '2022-09-26 21:22:38', '31.2957297', '30.1292616', '47HW+H7X, El Matareya, EG', '2022-09-27 04:22:38', '2022-09-27 04:22:38'),
(2454, NULL, 2, '2022-09-26 21:22:50', '31.2960615', '30.1292164', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:22:50', '2022-09-27 04:22:50'),
(2455, NULL, 2, '2022-09-26 21:23:00', '31.2959153', '30.1291386', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:23:00', '2022-09-27 04:23:00'),
(2456, NULL, 2, '2022-09-26 21:23:08', '31.2957221', '30.129265', '47HW+H7X, El Matareya, EG', '2022-09-27 04:23:08', '2022-09-27 04:23:08'),
(2457, NULL, 2, '2022-09-26 21:23:18', '31.2957313', '30.1292271', '47HW+H7X, El Matareya, EG', '2022-09-27 04:23:18', '2022-09-27 04:23:18'),
(2458, NULL, 2, '2022-09-26 21:23:29', '31.295941', '30.1291467', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:23:29', '2022-09-27 04:23:29'),
(2459, NULL, 2, '2022-09-26 21:23:38', '31.2958237', '30.1292295', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:23:38', '2022-09-27 04:23:38'),
(2460, NULL, 2, '2022-09-26 21:23:49', '31.2958315', '30.1292549', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:23:49', '2022-09-27 04:23:49'),
(2461, NULL, 2, '2022-09-26 21:23:59', '31.2958676', '30.1292446', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:23:59', '2022-09-27 04:23:59'),
(2462, NULL, 2, '2022-09-26 21:24:08', '31.2957577', '30.1292088', '47HW+H7X, El Matareya, EG', '2022-09-27 04:24:08', '2022-09-27 04:24:08'),
(2463, NULL, 2, '2022-09-26 21:24:19', '31.2958626', '30.1291737', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:24:19', '2022-09-27 04:24:19'),
(2464, NULL, 2, '2022-09-26 21:24:28', '31.2957305', '30.1292649', '47HW+H7X, El Matareya, EG', '2022-09-27 04:24:28', '2022-09-27 04:24:28'),
(2465, NULL, 2, '2022-09-26 21:24:38', '31.2957529', '30.1292415', '47HW+H7X, El Matareya, EG', '2022-09-27 04:24:38', '2022-09-27 04:24:38'),
(2466, NULL, 2, '2022-09-26 21:24:48', '31.2957529', '30.129253', '47HW+H7X, El Matareya, EG', '2022-09-27 04:24:48', '2022-09-27 04:24:48'),
(2467, NULL, 2, '2022-09-26 21:24:58', '31.2957788', '30.1292514', '47HW+H7X, El Matareya, EG', '2022-09-27 04:24:58', '2022-09-27 04:24:58'),
(2468, NULL, 2, '2022-09-26 21:25:11', '31.2957515', '30.1290826', '47HW+H7X, El Matareya, EG', '2022-09-27 04:25:11', '2022-09-27 04:25:11'),
(2469, NULL, 2, '2022-09-26 21:25:24', '31.2957177', '30.1292734', '47HW+H7X, El Matareya, EG', '2022-09-27 04:25:24', '2022-09-27 04:25:24'),
(2470, NULL, 2, '2022-09-26 21:25:30', '31.2958728', '30.1292284', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:25:30', '2022-09-27 04:25:30'),
(2471, NULL, 2, '2022-09-26 21:25:38', '31.295761', '30.1292647', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:25:38', '2022-09-27 04:25:38'),
(2472, NULL, 2, '2022-09-26 21:26:57', '31.295871', '30.1291494', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:26:57', '2022-09-27 04:26:57'),
(2473, NULL, 2, '2022-09-26 21:26:59', '31.2958021', '30.1292049', '47HW+H7X, El Matareya, EG', '2022-09-27 04:26:59', '2022-09-27 04:26:59'),
(2474, NULL, 2, '2022-09-26 21:27:12', '31.2957201', '30.1292642', '47HW+H7X, El Matareya, EG', '2022-09-27 04:27:12', '2022-09-27 04:27:12'),
(2475, NULL, 2, '2022-09-26 21:27:18', '31.295711', '30.1292694', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:27:18', '2022-09-27 04:27:18'),
(2476, NULL, 2, '2022-09-26 21:27:43', '31.2957454', '30.1292591', '47HW+H7X, El Matareya, EG', '2022-09-27 04:27:43', '2022-09-27 04:27:43'),
(2477, NULL, 2, '2022-09-26 21:27:48', '31.2957183', '30.1292679', '47HW+H7X, El Matareya, EG', '2022-09-27 04:27:48', '2022-09-27 04:27:48'),
(2478, NULL, 2, '2022-09-26 21:27:59', '31.2957263', '30.1292404', '47HW+H7X, El Matareya, EG', '2022-09-27 04:27:59', '2022-09-27 04:27:59'),
(2479, NULL, 2, '2022-09-26 21:28:08', '31.2958394', '30.129225', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:28:08', '2022-09-27 04:28:08'),
(2480, NULL, 2, '2022-09-26 21:28:19', '31.2957243', '30.129128', '47HW+H7X, El Matareya, EG', '2022-09-27 04:28:19', '2022-09-27 04:28:19'),
(2481, NULL, 2, '2022-09-26 21:28:28', '31.2957222', '30.1292606', '47HW+H7X, El Matareya, EG', '2022-09-27 04:28:28', '2022-09-27 04:28:28'),
(2482, NULL, 2, '2022-09-26 21:30:07', '31.2957881', '30.1291591', '47HW+H7X, El Matareya, EG', '2022-09-27 04:30:07', '2022-09-27 04:30:07'),
(2483, NULL, 2, '2022-09-26 21:30:09', '31.2957881', '30.1291591', '47HW+H7X, El Matareya, EG', '2022-09-27 04:30:09', '2022-09-27 04:30:09'),
(2484, NULL, 2, '2022-09-26 21:30:52', '31.2957571', '30.1292403', '47HW+H7X, El Matareya, EG', '2022-09-27 04:30:52', '2022-09-27 04:30:52'),
(2485, NULL, 2, '2022-09-26 21:31:24', '31.2957027', '30.1292847', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:31:24', '2022-09-27 04:31:24'),
(2486, NULL, 2, '2022-09-26 21:35:48', '31.2957235', '30.1292381', '47HW+H7X, El Matareya, EG', '2022-09-27 04:35:48', '2022-09-27 04:35:48'),
(2487, NULL, 2, '2022-09-26 21:35:48', '31.2957235', '30.1292381', '47HW+H7X, El Matareya, EG', '2022-09-27 04:35:48', '2022-09-27 04:35:48'),
(2488, NULL, 2, '2022-09-26 21:36:02', '31.2957045', '30.1292483', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:36:02', '2022-09-27 04:36:02'),
(2489, NULL, 2, '2022-09-26 21:38:03', '31.2957541', '30.129103', '47HW+H7X, El Matareya, EG', '2022-09-27 04:38:03', '2022-09-27 04:38:03'),
(2490, NULL, 2, '2022-09-26 21:38:06', '31.2957541', '30.129103', '47HW+H7X, El Matareya, EG', '2022-09-27 04:38:06', '2022-09-27 04:38:06'),
(2491, NULL, 2, '2022-09-26 21:38:18', '31.2957009', '30.1292458', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:38:18', '2022-09-27 04:38:18'),
(2492, NULL, 2, '2022-09-26 21:39:02', '31.2957205', '30.129256', '47HW+H7X, El Matareya, EG', '2022-09-27 04:39:02', '2022-09-27 04:39:02'),
(2493, NULL, 2, '2022-09-26 21:39:03', '31.2957205', '30.129256', '47HW+H7X, El Matareya, EG', '2022-09-27 04:39:03', '2022-09-27 04:39:03'),
(2494, NULL, 2, '2022-09-26 21:39:19', '31.2957361', '30.129262', '47HW+H7X, El Matareya, EG', '2022-09-27 04:39:19', '2022-09-27 04:39:19'),
(2495, NULL, 2, '2022-09-26 21:39:34', '31.2956617', '30.129335', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:39:34', '2022-09-27 04:39:34'),
(2496, NULL, 2, '2022-09-26 21:39:42', '31.2956616', '30.1293351', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:39:42', '2022-09-27 04:39:42'),
(2497, NULL, 2, '2022-09-26 21:39:52', '31.2956975', '30.1292927', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:39:52', '2022-09-27 04:39:52'),
(2498, NULL, 2, '2022-09-26 21:40:02', '31.2957168', '30.1292816', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:40:02', '2022-09-27 04:40:02'),
(2499, NULL, 2, '2022-09-26 21:40:12', '31.2957402', '30.1292825', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:40:12', '2022-09-27 04:40:12'),
(2500, NULL, 2, '2022-09-26 21:40:23', '31.2958264', '30.1291941', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:40:23', '2022-09-27 04:40:23'),
(2501, NULL, 2, '2022-09-26 21:40:38', '31.2957346', '30.1292784', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:40:38', '2022-09-27 04:40:38'),
(2502, NULL, 2, '2022-09-26 21:40:45', '31.2962861', '30.1289838', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:40:45', '2022-09-27 04:40:45'),
(2503, NULL, 2, '2022-09-26 21:40:55', '31.2957263', '30.129265', '47HW+H7X, El Matareya, EG', '2022-09-27 04:40:55', '2022-09-27 04:40:55'),
(2504, NULL, 2, '2022-09-26 21:41:05', '31.2957401', '30.12924', '47HW+H7X, El Matareya, EG', '2022-09-27 04:41:05', '2022-09-27 04:41:05'),
(2505, NULL, 2, '2022-09-26 21:41:15', '31.2957048', '30.129278', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:41:15', '2022-09-27 04:41:15'),
(2506, NULL, 2, '2022-09-26 21:41:25', '31.2957515', '30.1292676', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:41:25', '2022-09-27 04:41:25'),
(2507, NULL, 2, '2022-09-26 21:41:37', '31.2956472', '30.1291277', '47HW+H7X, El Matareya, EG', '2022-09-27 04:41:37', '2022-09-27 04:41:37'),
(2508, NULL, 2, '2022-09-26 21:41:46', '31.2958792', '30.1291014', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:41:46', '2022-09-27 04:41:46'),
(2509, NULL, 2, '2022-09-26 21:42:06', '31.2957017', '30.129284', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:42:06', '2022-09-27 04:42:06'),
(2510, NULL, 2, '2022-09-26 21:42:16', '31.2956296', '30.1292827', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:42:16', '2022-09-27 04:42:16'),
(2511, NULL, 2, '2022-09-26 21:42:22', '31.2956274', '30.1292837', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:42:22', '2022-09-27 04:42:22'),
(2512, NULL, 2, '2022-09-26 21:42:34', '31.2956475', '30.1292807', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:42:34', '2022-09-27 04:42:34'),
(2513, NULL, 2, '2022-09-26 21:42:53', '31.2957495', '30.129233', '47HW+H7X, El Matareya, EG', '2022-09-27 04:42:53', '2022-09-27 04:42:53'),
(2514, NULL, 2, '2022-09-26 21:43:14', '31.2957345', '30.1292203', '47HW+H7X, El Matareya, EG', '2022-09-27 04:43:14', '2022-09-27 04:43:14'),
(2515, NULL, 2, '2022-09-26 21:43:29', '31.2957143', '30.1292911', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:43:29', '2022-09-27 04:43:29'),
(2516, NULL, 2, '2022-09-26 21:43:36', '31.2957228', '30.1292927', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:43:36', '2022-09-27 04:43:36'),
(2517, NULL, 2, '2022-09-26 21:43:47', '31.295802', '30.1292151', '47HW+H7X, El Matareya, EG', '2022-09-27 04:43:47', '2022-09-27 04:43:47'),
(2518, NULL, 2, '2022-09-26 21:43:57', '31.2957289', '30.1292042', '47HW+H7X, El Matareya, EG', '2022-09-27 04:43:57', '2022-09-27 04:43:57'),
(2519, NULL, 2, '2022-09-26 21:44:06', '31.2957387', '30.1292022', '47HW+H7X, El Matareya, EG', '2022-09-27 04:44:06', '2022-09-27 04:44:06'),
(2520, NULL, 2, '2022-09-26 21:44:16', '31.295721', '30.1292545', '47HW+H7X, El Matareya, EG', '2022-09-27 04:44:16', '2022-09-27 04:44:16'),
(2521, NULL, 2, '2022-09-26 21:44:26', '31.2957033', '30.1292507', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:44:26', '2022-09-27 04:44:26'),
(2522, NULL, 2, '2022-09-26 21:44:37', '31.2956648', '30.1291999', '47HW+H7X, El Matareya, EG', '2022-09-27 04:44:37', '2022-09-27 04:44:37'),
(2523, NULL, 2, '2022-09-26 21:44:48', '31.2957093', '30.1292338', '47HW+H7X, El Matareya, EG', '2022-09-27 04:44:48', '2022-09-27 04:44:48'),
(2524, NULL, 2, '2022-09-26 21:44:56', '31.2957252', '30.1292654', '47HW+H7X, El Matareya, EG', '2022-09-27 04:44:56', '2022-09-27 04:44:56'),
(2525, NULL, 2, '2022-09-26 21:45:07', '31.2957148', '30.1292782', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:45:07', '2022-09-27 04:45:07'),
(2526, NULL, 2, '2022-09-26 21:45:16', '31.2957043', '30.1292812', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:45:16', '2022-09-27 04:45:16'),
(2527, NULL, 2, '2022-09-26 21:45:27', '31.2957201', '30.1292458', '47HW+H7X, El Matareya, EG', '2022-09-27 04:45:27', '2022-09-27 04:45:27'),
(2528, NULL, 2, '2022-09-26 21:45:36', '31.2957574', '30.129221', '47HW+H7X, El Matareya, EG', '2022-09-27 04:45:36', '2022-09-27 04:45:36'),
(2529, NULL, 2, '2022-09-26 21:45:46', '31.2957043', '30.129266', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:45:46', '2022-09-27 04:45:46'),
(2530, NULL, 2, '2022-09-26 21:45:56', '31.2956962', '30.1292484', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:45:56', '2022-09-27 04:45:56'),
(2531, NULL, 2, '2022-09-26 21:46:06', '31.2957088', '30.1292635', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:46:06', '2022-09-27 04:46:06'),
(2532, NULL, 2, '2022-09-26 21:46:18', '31.2957341', '30.1292442', '47HW+H7X, El Matareya, EG', '2022-09-27 04:46:18', '2022-09-27 04:46:18'),
(2533, NULL, 2, '2022-09-26 21:46:32', '31.2957078', '30.129249', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:46:32', '2022-09-27 04:46:32'),
(2534, NULL, 2, '2022-09-26 21:46:42', '31.2957364', '30.1292594', '47HW+H7X, El Matareya, EG', '2022-09-27 04:46:42', '2022-09-27 04:46:42'),
(2535, NULL, 2, '2022-09-26 21:46:52', '31.295326', '30.1295206', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:46:52', '2022-09-27 04:46:52'),
(2536, NULL, 2, '2022-09-26 21:47:03', '31.2953247', '30.1295222', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:47:03', '2022-09-27 04:47:03'),
(2537, NULL, 2, '2022-09-26 21:47:11', '31.2954171', '30.1294367', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:47:11', '2022-09-27 04:47:11'),
(2538, NULL, 2, '2022-09-26 21:47:25', '31.2956913', '30.1290814', '47HW+H7X, El Matareya, EG', '2022-09-27 04:47:25', '2022-09-27 04:47:25'),
(2539, NULL, 2, '2022-09-26 21:47:30', '31.2956972', '30.1290645', '47HW+H7X, El Matareya, EG', '2022-09-27 04:47:30', '2022-09-27 04:47:30'),
(2540, NULL, 2, '2022-09-26 21:47:40', '31.2957338', '30.129285', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:47:40', '2022-09-27 04:47:40'),
(2541, NULL, 2, '2022-09-26 21:47:49', '31.2957513', '30.1292733', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:47:49', '2022-09-27 04:47:49'),
(2542, NULL, 2, '2022-09-26 21:48:07', '31.2957209', '30.1292265', '47HW+H7X, El Matareya, EG', '2022-09-27 04:48:07', '2022-09-27 04:48:07'),
(2543, NULL, 2, '2022-09-26 21:48:17', '31.2957203', '30.129248', '47HW+H7X, El Matareya, EG', '2022-09-27 04:48:17', '2022-09-27 04:48:17'),
(2544, NULL, 2, '2022-09-26 21:48:26', '31.2957156', '30.1292435', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:48:26', '2022-09-27 04:48:26'),
(2545, NULL, 2, '2022-09-26 21:48:35', '31.2957071', '30.1292312', '47HW+H7X, El Matareya, EG', '2022-09-27 04:48:35', '2022-09-27 04:48:35'),
(2546, NULL, 2, '2022-09-26 21:48:45', '31.2957126', '30.1292617', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:48:45', '2022-09-27 04:48:45'),
(2547, NULL, 2, '2022-09-26 21:48:56', '31.2957251', '30.1292536', '47HW+H7X, El Matareya, EG', '2022-09-27 04:48:56', '2022-09-27 04:48:56'),
(2548, NULL, 2, '2022-09-26 21:49:15', '31.2957252', '30.1292698', '47HW+H7X, El Matareya, EG', '2022-09-27 04:49:15', '2022-09-27 04:49:15'),
(2549, NULL, 2, '2022-09-26 21:49:15', '31.2957746', '30.1290434', '47HW+H7X, El Matareya, EG', '2022-09-27 04:49:15', '2022-09-27 04:49:15'),
(2550, NULL, 2, '2022-09-26 21:49:25', '31.2956969', '30.1292812', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:49:25', '2022-09-27 04:49:25'),
(2551, NULL, 2, '2022-09-26 21:50:00', '31.2957328', '30.1292845', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:50:00', '2022-09-27 04:50:00'),
(2552, NULL, 2, '2022-09-26 21:50:07', '31.2957094', '30.1292466', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:50:07', '2022-09-27 04:50:07'),
(2553, NULL, 2, '2022-09-26 21:50:15', '31.2957254', '30.1292695', '47HW+H7X, El Matareya, EG', '2022-09-27 04:50:15', '2022-09-27 04:50:15'),
(2554, NULL, 2, '2022-09-26 21:50:25', '31.2957418', '30.1292631', '47HW+H7X, El Matareya, EG', '2022-09-27 04:50:25', '2022-09-27 04:50:25'),
(2555, NULL, 2, '2022-09-26 21:50:35', '31.2957051', '30.1292681', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:50:35', '2022-09-27 04:50:35'),
(2556, NULL, 2, '2022-09-26 21:50:45', '31.2957142', '30.1292504', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:50:45', '2022-09-27 04:50:45'),
(2557, NULL, 2, '2022-09-26 21:50:55', '31.2956917', '30.1292333', '47HW+H7X, El Matareya, EG', '2022-09-27 04:50:55', '2022-09-27 04:50:55'),
(2558, NULL, 2, '2022-09-26 21:51:05', '31.2957072', '30.1292454', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:51:05', '2022-09-27 04:51:05'),
(2559, NULL, 2, '2022-09-26 21:51:16', '31.2957124', '30.1292439', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:51:16', '2022-09-27 04:51:16'),
(2560, NULL, 2, '2022-09-26 21:51:27', '31.2957228', '30.1292808', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:51:27', '2022-09-27 04:51:27'),
(2561, NULL, 2, '2022-09-26 21:51:35', '31.2957109', '30.1292649', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:51:35', '2022-09-27 04:51:35'),
(2562, NULL, 2, '2022-09-26 21:51:45', '31.295703', '30.1292443', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:51:45', '2022-09-27 04:51:45'),
(2563, NULL, 2, '2022-09-26 21:51:55', '31.2957185', '30.129284', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:51:55', '2022-09-27 04:51:55'),
(2564, NULL, 2, '2022-09-26 21:52:05', '31.2957036', '30.1292823', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:52:05', '2022-09-27 04:52:05'),
(2565, NULL, 2, '2022-09-26 21:52:15', '31.2957095', '30.1292059', '47HW+H7X, El Matareya, EG', '2022-09-27 04:52:15', '2022-09-27 04:52:15'),
(2566, NULL, 2, '2022-09-26 21:52:26', '31.2957208', '30.1292685', '47HW+H7X, El Matareya, EG', '2022-09-27 04:52:26', '2022-09-27 04:52:26'),
(2567, NULL, 2, '2022-09-26 21:52:35', '31.2957635', '30.1292717', '47HW+JCV, قسم المطرية, EG', '2022-09-27 04:52:35', '2022-09-27 04:52:35'),
(2568, NULL, 2, '2022-09-26 21:52:45', '31.2957413', '30.1292642', '47HW+H7X, El Matareya, EG', '2022-09-27 04:52:45', '2022-09-27 04:52:45'),
(2569, NULL, 2, '2022-09-26 21:52:56', '31.2956767', '30.1292359', '47HW+H7X, El Matareya, EG', '2022-09-27 04:52:56', '2022-09-27 04:52:56'),
(2570, NULL, 2, '2022-09-26 21:53:05', '31.295732', '30.1292689', '47HW+H7X, El Matareya, EG', '2022-09-27 04:53:05', '2022-09-27 04:53:05'),
(2571, NULL, 2, '2022-09-26 21:53:15', '31.2957158', '30.1292405', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:53:15', '2022-09-27 04:53:15'),
(2572, NULL, 2, '2022-09-26 21:53:25', '31.2957164', '30.129267', '47HW+H7X, El Matareya, EG', '2022-09-27 04:53:25', '2022-09-27 04:53:25'),
(2573, NULL, 2, '2022-09-26 21:53:35', '31.2957285', '30.1292511', '47HW+H7X, El Matareya, EG', '2022-09-27 04:53:35', '2022-09-27 04:53:35'),
(2574, NULL, 2, '2022-09-26 21:53:45', '31.2956957', '30.1291519', '47HW+H7X, El Matareya, EG', '2022-09-27 04:53:45', '2022-09-27 04:53:45'),
(2575, NULL, 2, '2022-09-26 21:53:56', '31.2957376', '30.129277', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:53:56', '2022-09-27 04:53:56'),
(2576, NULL, 2, '2022-09-26 21:54:05', '31.2957036', '30.1292323', '47HW+H7X, El Matareya, EG', '2022-09-27 04:54:05', '2022-09-27 04:54:05'),
(2577, NULL, 2, '2022-09-26 21:54:15', '31.2957012', '30.1292387', '47HW+H7X, El Matareya, EG', '2022-09-27 04:54:15', '2022-09-27 04:54:15'),
(2578, NULL, 2, '2022-09-26 21:54:25', '31.2956838', '30.1292224', '47HW+H7X, El Matareya, EG', '2022-09-27 04:54:25', '2022-09-27 04:54:25'),
(2579, NULL, 2, '2022-09-26 21:54:35', '31.2956935', '30.1292632', '47HW+P5C, قسم المطرية, EG', '2022-09-27 04:54:35', '2022-09-27 04:54:35'),
(2580, NULL, 2, '2022-09-26 21:54:45', '31.2957352', '30.1292599', '47HW+H7X, El Matareya, EG', '2022-09-27 04:54:45', '2022-09-27 04:54:45'),
(2581, NULL, 2, '2022-09-26 21:59:16', '31.2957054', '30.1289668', '47HW+H7X, El Matareya, EG', '2022-09-27 04:59:16', '2022-09-27 04:59:16'),
(2582, NULL, 2, '2022-09-26 21:59:16', '31.2957054', '30.1289668', '47HW+H7X, El Matareya, EG', '2022-09-27 04:59:16', '2022-09-27 04:59:16'),
(2583, NULL, 2, '2022-09-26 22:06:19', '31.2957185', '30.1292439', '47HW+H7X, El Matareya, EG', '2022-09-27 05:06:19', '2022-09-27 05:06:19'),
(2584, NULL, 2, '2022-09-26 22:06:21', '31.2957185', '30.1292439', '47HW+H7X, El Matareya, EG', '2022-09-27 05:06:21', '2022-09-27 05:06:21'),
(2585, NULL, 2, '2022-09-26 22:06:33', '31.2957229', '30.1292495', '47HW+H7X, El Matareya, EG', '2022-09-27 05:06:33', '2022-09-27 05:06:33'),
(2586, NULL, 2, '2022-09-26 22:06:41', '31.2957215', '30.1292659', '47HW+H7X, El Matareya, EG', '2022-09-27 05:06:41', '2022-09-27 05:06:41'),
(2587, NULL, 2, '2022-09-26 22:06:51', '31.2957217', '30.1292659', '47HW+H7X, El Matareya, EG', '2022-09-27 05:06:51', '2022-09-27 05:06:51'),
(2588, NULL, 2, '2022-09-26 22:07:02', '31.2957478', '30.129271', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:07:02', '2022-09-27 05:07:02'),
(2589, NULL, 2, '2022-09-26 22:07:25', '31.2957184', '30.1292665', '47HW+H7X, El Matareya, EG', '2022-09-27 05:07:25', '2022-09-27 05:07:25'),
(2590, NULL, 2, '2022-09-26 22:07:30', '31.2957157', '30.1292464', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:07:30', '2022-09-27 05:07:30'),
(2591, NULL, 2, '2022-09-26 22:07:40', '31.2956905', '30.1292324', '47HW+H7X, El Matareya, EG', '2022-09-27 05:07:40', '2022-09-27 05:07:40'),
(2592, NULL, 2, '2022-09-26 22:07:50', '31.2957309', '30.129242', '47HW+H7X, El Matareya, EG', '2022-09-27 05:07:50', '2022-09-27 05:07:50'),
(2593, NULL, 2, '2022-09-26 22:08:00', '31.2956775', '30.1292278', '47HW+H7X, El Matareya, EG', '2022-09-27 05:08:00', '2022-09-27 05:08:00'),
(2594, NULL, 2, '2022-09-26 22:08:11', '31.2957397', '30.1292441', '47HW+H7X, El Matareya, EG', '2022-09-27 05:08:11', '2022-09-27 05:08:11'),
(2595, NULL, 2, '2022-09-26 22:08:20', '31.2957247', '30.1292755', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:08:20', '2022-09-27 05:08:20'),
(2596, NULL, 2, '2022-09-26 22:08:31', '31.2957363', '30.1292565', '47HW+H7X, El Matareya, EG', '2022-09-27 05:08:31', '2022-09-27 05:08:31'),
(2597, NULL, 2, '2022-09-26 22:08:40', '31.2957121', '30.1292655', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:08:40', '2022-09-27 05:08:40'),
(2598, NULL, 2, '2022-09-26 22:08:50', '31.2957158', '30.1292544', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:08:50', '2022-09-27 05:08:50'),
(2599, NULL, 2, '2022-09-26 22:09:00', '31.2957182', '30.1292743', '47HW+H7X, El Matareya, EG', '2022-09-27 05:09:00', '2022-09-27 05:09:00'),
(2600, NULL, 2, '2022-09-26 22:09:10', '31.2957173', '30.1292712', '47HW+H7X, El Matareya, EG', '2022-09-27 05:09:10', '2022-09-27 05:09:10'),
(2601, NULL, 2, '2022-09-26 22:09:20', '31.2957156', '30.129275', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:09:20', '2022-09-27 05:09:20'),
(2602, NULL, 2, '2022-09-26 22:09:30', '31.2957236', '30.1292421', '47HW+H7X, El Matareya, EG', '2022-09-27 05:09:30', '2022-09-27 05:09:30'),
(2603, NULL, 2, '2022-09-26 22:09:40', '31.295725', '30.1292405', '47HW+H7X, El Matareya, EG', '2022-09-27 05:09:40', '2022-09-27 05:09:40'),
(2604, NULL, 2, '2022-09-26 22:09:50', '31.2957135', '30.1292677', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:09:50', '2022-09-27 05:09:50'),
(2605, NULL, 2, '2022-09-26 22:10:00', '31.295719', '30.1292229', '47HW+H7X, El Matareya, EG', '2022-09-27 05:10:00', '2022-09-27 05:10:00'),
(2606, NULL, 2, '2022-09-26 22:10:10', '31.2957207', '30.1292539', '47HW+H7X, El Matareya, EG', '2022-09-27 05:10:10', '2022-09-27 05:10:10'),
(2607, NULL, 2, '2022-09-26 22:10:20', '31.2957157', '30.1292702', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:10:20', '2022-09-27 05:10:20'),
(2608, NULL, 2, '2022-09-26 22:10:30', '31.2957072', '30.1292717', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:10:30', '2022-09-27 05:10:30'),
(2609, NULL, 2, '2022-09-26 22:10:40', '31.2957174', '30.1292648', '47HW+H7X, El Matareya, EG', '2022-09-27 05:10:40', '2022-09-27 05:10:40'),
(2610, NULL, 2, '2022-09-26 22:10:50', '31.2957125', '30.1292863', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:10:50', '2022-09-27 05:10:50'),
(2611, NULL, 2, '2022-09-26 22:11:00', '31.2957084', '30.1292741', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:11:00', '2022-09-27 05:11:00'),
(2612, NULL, 2, '2022-09-26 22:11:10', '31.2956873', '30.1292083', '47HW+H7X, El Matareya, EG', '2022-09-27 05:11:10', '2022-09-27 05:11:10'),
(2613, NULL, 2, '2022-09-26 22:11:21', '31.2956881', '30.129234', '47HW+H7X, El Matareya, EG', '2022-09-27 05:11:21', '2022-09-27 05:11:21'),
(2614, NULL, 2, '2022-09-26 22:11:30', '31.2957176', '30.1292434', '47HW+H7X, El Matareya, EG', '2022-09-27 05:11:30', '2022-09-27 05:11:30'),
(2615, NULL, 2, '2022-09-26 22:11:50', '31.2957259', '30.1292574', '47HW+H7X, El Matareya, EG', '2022-09-27 05:11:50', '2022-09-27 05:11:50'),
(2616, NULL, 2, '2022-09-26 22:11:50', '31.2957259', '30.1292574', '47HW+H7X, El Matareya, EG', '2022-09-27 05:11:50', '2022-09-27 05:11:50'),
(2617, NULL, 2, '2022-09-26 22:12:09', '31.2956981', '30.1292642', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:12:09', '2022-09-27 05:12:09'),
(2618, NULL, 2, '2022-09-26 22:12:24', '31.2956856', '30.1292302', '47HW+H7X, El Matareya, EG', '2022-09-27 05:12:24', '2022-09-27 05:12:24'),
(2619, NULL, 2, '2022-09-26 22:12:25', '31.2956805', '30.1292463', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:12:25', '2022-09-27 05:12:25'),
(2620, NULL, 2, '2022-09-26 22:12:30', '31.2957273', '30.1292706', '47HW+H7X, El Matareya, EG', '2022-09-27 05:12:30', '2022-09-27 05:12:30'),
(2621, NULL, 2, '2022-09-26 22:12:40', '31.2957258', '30.1292819', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:12:40', '2022-09-27 05:12:40'),
(2622, NULL, 2, '2022-09-26 22:12:50', '31.2957472', '30.1292744', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:12:50', '2022-09-27 05:12:50'),
(2623, NULL, 2, '2022-09-26 22:13:01', '31.295714', '30.129271', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:13:01', '2022-09-27 05:13:01'),
(2624, NULL, 2, '2022-09-26 22:13:11', '31.2957367', '30.1292635', '47HW+H7X, El Matareya, EG', '2022-09-27 05:13:11', '2022-09-27 05:13:11'),
(2625, NULL, 2, '2022-09-26 22:13:20', '31.2957229', '30.1292682', '47HW+H7X, El Matareya, EG', '2022-09-27 05:13:20', '2022-09-27 05:13:20'),
(2626, NULL, 2, '2022-09-26 22:13:30', '31.2957112', '30.1292771', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:13:30', '2022-09-27 05:13:30'),
(2627, NULL, 2, '2022-09-26 22:13:40', '31.2957171', '30.1292846', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:13:40', '2022-09-27 05:13:40'),
(2628, NULL, 2, '2022-09-26 22:13:50', '31.2957413', '30.1292518', '47HW+H7X, El Matareya, EG', '2022-09-27 05:13:50', '2022-09-27 05:13:50'),
(2629, NULL, 2, '2022-09-26 22:14:00', '31.2957161', '30.1292882', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:14:00', '2022-09-27 05:14:00'),
(2630, NULL, 2, '2022-09-26 22:14:10', '31.295749', '30.129263', '47HW+H7X, El Matareya, EG', '2022-09-27 05:14:10', '2022-09-27 05:14:10'),
(2631, NULL, 2, '2022-09-26 22:14:20', '31.2957243', '30.1292608', '47HW+H7X, El Matareya, EG', '2022-09-27 05:14:20', '2022-09-27 05:14:20'),
(2632, NULL, 2, '2022-09-26 22:14:30', '31.2957319', '30.1292673', '47HW+H7X, El Matareya, EG', '2022-09-27 05:14:30', '2022-09-27 05:14:30'),
(2633, NULL, 2, '2022-09-26 22:14:40', '31.2957086', '30.1292871', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:14:40', '2022-09-27 05:14:40'),
(2634, NULL, 2, '2022-09-26 22:14:50', '31.2957338', '30.1292652', '47HW+H7X, El Matareya, EG', '2022-09-27 05:14:50', '2022-09-27 05:14:50'),
(2635, NULL, 2, '2022-09-26 22:15:00', '31.2957428', '30.1292773', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:15:00', '2022-09-27 05:15:00'),
(2636, NULL, 2, '2022-09-26 22:15:10', '31.2957334', '30.12927', '47HW+H7X, El Matareya, EG', '2022-09-27 05:15:10', '2022-09-27 05:15:10'),
(2637, NULL, 2, '2022-09-26 22:15:20', '31.2957307', '30.1292606', '47HW+H7X, El Matareya, EG', '2022-09-27 05:15:20', '2022-09-27 05:15:20'),
(2638, NULL, 2, '2022-09-26 22:15:30', '31.2957694', '30.1292468', '47HW+H7X, El Matareya, EG', '2022-09-27 05:15:30', '2022-09-27 05:15:30'),
(2639, NULL, 2, '2022-09-26 22:15:40', '31.2956862', '30.1292284', '47HW+H7X, El Matareya, EG', '2022-09-27 05:15:40', '2022-09-27 05:15:40'),
(2640, NULL, 2, '2022-09-26 22:15:50', '31.2957201', '30.1291411', '47HW+H7X, El Matareya, EG', '2022-09-27 05:15:50', '2022-09-27 05:15:50'),
(2641, NULL, 2, '2022-09-26 22:16:00', '31.2957617', '30.1291487', '47HW+H7X, El Matareya, EG', '2022-09-27 05:16:00', '2022-09-27 05:16:00'),
(2642, NULL, 2, '2022-09-26 22:16:10', '31.2957213', '30.1292441', '47HW+H7X, El Matareya, EG', '2022-09-27 05:16:10', '2022-09-27 05:16:10'),
(2643, NULL, 2, '2022-09-26 22:16:20', '31.29571', '30.129258', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:16:20', '2022-09-27 05:16:20'),
(2644, NULL, 2, '2022-09-26 22:16:30', '31.295727', '30.1292412', '47HW+H7X, El Matareya, EG', '2022-09-27 05:16:30', '2022-09-27 05:16:30'),
(2645, NULL, 2, '2022-09-26 22:16:51', '31.2957395', '30.1292768', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:16:51', '2022-09-27 05:16:51'),
(2646, NULL, 2, '2022-09-26 22:16:59', '31.295808', '30.1292369', '47HW+JCV, قسم المطرية, EG', '2022-09-27 05:16:59', '2022-09-27 05:16:59'),
(2647, NULL, 2, '2022-09-26 22:17:06', '31.2958108', '30.1292407', '47HW+JCV, قسم المطرية, EG', '2022-09-27 05:17:06', '2022-09-27 05:17:06'),
(2648, NULL, 2, '2022-09-26 22:17:16', '31.2957929', '30.1292558', '47HW+H7X, El Matareya, EG', '2022-09-27 05:17:16', '2022-09-27 05:17:16'),
(2649, NULL, 2, '2022-09-26 22:17:26', '31.2957549', '30.1292394', '47HW+H7X, El Matareya, EG', '2022-09-27 05:17:26', '2022-09-27 05:17:26'),
(2650, NULL, 2, '2022-09-26 22:17:37', '31.29596', '30.1290274', '47HW+JCV, قسم المطرية, EG', '2022-09-27 05:17:37', '2022-09-27 05:17:37'),
(2651, NULL, 2, '2022-09-26 22:17:48', '31.2957105', '30.1292425', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:17:48', '2022-09-27 05:17:48'),
(2652, NULL, 2, '2022-09-26 22:17:57', '31.295742', '30.1292569', '47HW+H7X, El Matareya, EG', '2022-09-27 05:17:57', '2022-09-27 05:17:57'),
(2653, NULL, 2, '2022-09-26 22:20:59', '31.2957253', '30.1292614', '47HW+H7X, El Matareya, EG', '2022-09-27 05:20:59', '2022-09-27 05:20:59'),
(2654, NULL, 2, '2022-09-26 22:21:56', '31.2957429', '30.1292554', '47HW+H7X, El Matareya, EG', '2022-09-27 05:21:56', '2022-09-27 05:21:56'),
(2655, NULL, 2, '2022-09-26 22:21:56', '31.2957429', '30.1292554', '47HW+H7X, El Matareya, EG', '2022-09-27 05:21:56', '2022-09-27 05:21:56'),
(2656, NULL, 2, '2022-09-26 22:31:39', '31.295739', '30.1292677', '47HW+H7X, El Matareya, EG', '2022-09-27 05:31:39', '2022-09-27 05:31:39'),
(2657, NULL, 2, '2022-09-26 22:31:45', '31.295737', '30.1292654', '47HW+H7X, El Matareya, EG', '2022-09-27 05:31:45', '2022-09-27 05:31:45'),
(2658, NULL, 2, '2022-09-26 22:31:55', '31.2957288', '30.1292794', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:31:55', '2022-09-27 05:31:55'),
(2659, NULL, 2, '2022-09-26 22:32:05', '31.2957383', '30.1292471', '47HW+H7X, El Matareya, EG', '2022-09-27 05:32:05', '2022-09-27 05:32:05'),
(2660, NULL, 2, '2022-09-26 22:32:15', '31.2957163', '30.1292708', '47HW+H7X, El Matareya, EG', '2022-09-27 05:32:15', '2022-09-27 05:32:15'),
(2661, NULL, 2, '2022-09-26 22:32:25', '31.2957543', '30.1292644', '47HW+H7X, El Matareya, EG', '2022-09-27 05:32:25', '2022-09-27 05:32:25'),
(2662, NULL, 2, '2022-09-26 22:32:36', '31.2957251', '30.1292445', '47HW+H7X, El Matareya, EG', '2022-09-27 05:32:36', '2022-09-27 05:32:36'),
(2663, NULL, 2, '2022-09-26 22:32:46', '31.2957254', '30.1292569', '47HW+H7X, El Matareya, EG', '2022-09-27 05:32:46', '2022-09-27 05:32:46'),
(2664, NULL, 2, '2022-09-26 22:36:56', '31.2957314', '30.1292769', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:36:56', '2022-09-27 05:36:56'),
(2665, NULL, 2, '2022-09-26 22:36:57', '31.2957314', '30.1292769', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:36:57', '2022-09-27 05:36:57'),
(2666, NULL, 2, '2022-09-26 22:38:36', '31.2957397', '30.1292696', '47HW+H7X, El Matareya, EG', '2022-09-27 05:38:36', '2022-09-27 05:38:36'),
(2667, NULL, 2, '2022-09-26 22:38:59', '31.2957337', '30.1292749', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:38:59', '2022-09-27 05:38:59'),
(2668, NULL, 2, '2022-09-26 22:39:04', '31.295726', '30.1292703', '47HW+H7X, El Matareya, EG', '2022-09-27 05:39:04', '2022-09-27 05:39:04'),
(2669, NULL, 2, '2022-09-26 22:39:14', '31.2957409', '30.1292491', '47HW+H7X, El Matareya, EG', '2022-09-27 05:39:14', '2022-09-27 05:39:14'),
(2670, NULL, 2, '2022-09-26 22:39:24', '31.2957129', '30.1292548', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:39:24', '2022-09-27 05:39:24'),
(2671, NULL, 2, '2022-09-26 22:39:34', '31.295745', '30.1292846', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:39:34', '2022-09-27 05:39:34'),
(2672, NULL, 2, '2022-09-26 22:39:55', '31.2957169', '30.1292907', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:39:55', '2022-09-27 05:39:55'),
(2673, NULL, 2, '2022-09-26 22:40:10', '31.2957416', '30.1292776', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:40:10', '2022-09-27 05:40:10'),
(2674, NULL, 2, '2022-09-26 22:40:14', '31.2957252', '30.1292777', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:40:14', '2022-09-27 05:40:14'),
(2675, NULL, 2, '2022-09-26 22:40:41', '31.2957264', '30.1292774', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:40:41', '2022-09-27 05:40:41'),
(2676, NULL, 2, '2022-09-26 22:40:45', '31.2957161', '30.1292836', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:40:45', '2022-09-27 05:40:45'),
(2677, NULL, 2, '2022-09-26 22:44:03', '31.29555', '30.12924', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:44:03', '2022-09-27 05:44:03'),
(2678, NULL, 2, '2022-09-26 22:44:05', '31.29555', '30.12924', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:44:05', '2022-09-27 05:44:05'),
(2679, NULL, 2, '2022-09-26 22:44:17', '31.29555', '30.12924', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:44:17', '2022-09-27 05:44:17'),
(2680, NULL, 2, '2022-09-26 22:44:52', '31.2957109', '30.129277', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:44:52', '2022-09-27 05:44:52'),
(2681, NULL, 2, '2022-09-26 22:45:01', '31.2956535', '30.1292102', '47HW+H7X, El Matareya, EG', '2022-09-27 05:45:01', '2022-09-27 05:45:01'),
(2682, NULL, 2, '2022-09-26 22:45:09', '31.2957439', '30.1290732', '47HW+H7X, El Matareya, EG', '2022-09-27 05:45:09', '2022-09-27 05:45:09'),
(2683, NULL, 2, '2022-09-26 22:45:31', '31.2963557', '30.1289212', 'Al Kawetch (Al Matareyya), El Matareya, EG', '2022-09-27 05:45:31', '2022-09-27 05:45:31'),
(2684, NULL, 2, '2022-09-26 22:46:15', '31.2956794', '30.129314', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:46:15', '2022-09-27 05:46:15'),
(2685, NULL, 2, '2022-09-26 22:46:35', '31.2956888', '30.1292574', '47HW+P5C, قسم المطرية, EG', '2022-09-27 05:46:35', '2022-09-27 05:46:35'),
(2686, NULL, 2, '2022-09-26 22:55:30', '31.2965072', '30.1279341', '47HW+4JW, El Matareya, EG', '2022-09-27 05:55:30', '2022-09-27 05:55:30'),
(2687, NULL, 2, '2022-09-26 22:55:31', '31.2965072', '30.1279341', '47HW+4JW, El Matareya, EG', '2022-09-27 05:55:31', '2022-09-27 05:55:31'),
(2688, NULL, 2, '2022-09-26 22:55:47', '31.2969216', '30.1275095', 'Unknown Location Found', '2022-09-27 05:55:47', '2022-09-27 05:55:47'),
(2689, NULL, 2, '2022-09-26 22:56:08', '31.2969492', '30.1274533', '64, El Matareya, EG', '2022-09-27 05:56:08', '2022-09-27 05:56:08'),
(2690, NULL, 2, '2022-09-26 22:56:14', '31.297188', '30.1273551', 'شارع, El Matareya, EG', '2022-09-27 05:56:14', '2022-09-27 05:56:14'),
(2691, NULL, 2, '2022-09-26 22:56:24', '31.2973466', '30.1272997', '47GW+XXF, El Matareya, EG', '2022-09-27 05:56:24', '2022-09-27 05:56:24'),
(2692, NULL, 2, '2022-09-26 22:56:39', '31.297512', '30.1272894', 'شارع, El Matareya, EG', '2022-09-27 05:56:39', '2022-09-27 05:56:39'),
(2693, NULL, 2, '2022-09-26 22:56:49', '31.2975221', '30.1272191', 'شارع, El Matareya, EG', '2022-09-27 05:56:49', '2022-09-27 05:56:49'),
(2694, NULL, 2, '2022-09-26 22:56:59', '31.2975592', '30.1270964', 'شارع, El Matareya, EG', '2022-09-27 05:56:59', '2022-09-27 05:56:59'),
(2695, NULL, 2, '2022-09-26 22:57:11', '31.2976114', '30.127043', 'شارع, El Matareya, EG', '2022-09-27 05:57:11', '2022-09-27 05:57:11'),
(2696, NULL, 2, '2022-09-26 22:57:19', '31.2977854', '30.127052', '6, El Matareya, EG', '2022-09-27 05:57:19', '2022-09-27 05:57:19'),
(2697, NULL, 2, '2022-09-26 22:57:37', '31.2978122', '30.1267793', 'Cairo Governorate, El Matareya, EG', '2022-09-27 05:57:37', '2022-09-27 05:57:37'),
(2698, NULL, 2, '2022-09-26 22:58:01', '31.2981439', '30.1264219', '47GX+H6P, El Matareya, EG', '2022-09-27 05:58:01', '2022-09-27 05:58:01'),
(2699, NULL, 2, '2022-09-26 23:02:47', '31.2984423', '30.1257799', '47GX+9C3, El Matareya, EG', '2022-09-27 06:02:47', '2022-09-27 06:02:47'),
(2700, NULL, 2, '2022-09-26 23:02:59', '31.2984423', '30.1257799', '47GX+9C3, El Matareya, EG', '2022-09-27 06:02:59', '2022-09-27 06:02:59'),
(2701, NULL, 2, '2022-09-26 23:07:23', '31.2984726', '30.1258208', '47GX+9C3, El Matareya, EG', '2022-09-27 06:07:23', '2022-09-27 06:07:23'),
(2702, NULL, 2, '2022-09-26 23:07:43', '31.2984675', '30.1258131', '47GX+9C3, El Matareya, EG', '2022-09-27 06:07:43', '2022-09-27 06:07:43'),
(2703, NULL, 2, '2022-09-26 23:17:27', '31.3134582', '30.1132437', 'Helmeyat AZ Zaytoun, Ain Shams, EG', '2022-09-27 06:17:27', '2022-09-27 06:17:27'),
(2704, NULL, 2, '2022-09-26 23:17:34', '31.3213802', '30.1091455', 'Egypt, Ain Shams, EG', '2022-09-27 06:17:34', '2022-09-27 06:17:34'),
(2705, NULL, 2, '2022-09-26 23:17:44', '31.3226052', '30.1068569', '484F+Q3J, Zeitoun, EG', '2022-09-27 06:17:44', '2022-09-27 06:17:44'),
(2706, NULL, 2, '2022-09-26 23:17:58', '31.3226052', '30.1068569', '484F+Q3J, Zeitoun, EG', '2022-09-27 06:17:58', '2022-09-27 06:17:58'),
(2707, NULL, 2, '2022-09-26 23:20:25', '31.3415757', '30.0926624', '88, Heliopolis, EG', '2022-09-27 06:20:25', '2022-09-27 06:20:25'),
(2708, NULL, 2, '2022-09-26 23:22:06', '31.341035', '30.0864084', '55, Heliopolis, EG', '2022-09-27 06:22:06', '2022-09-27 06:22:06'),
(2709, NULL, 2, '2022-09-26 23:22:07', '31.341035', '30.0864084', '55, Heliopolis, EG', '2022-09-27 06:22:07', '2022-09-27 06:22:07'),
(2710, NULL, 2, '2022-09-26 23:22:53', '31.3402623', '30.0802177', '27, Nasr City, EG', '2022-09-27 06:22:53', '2022-09-27 06:22:53'),
(2711, NULL, 2, '2022-09-26 23:22:54', '31.3402623', '30.0802177', '27, Nasr City, EG', '2022-09-27 06:22:54', '2022-09-27 06:22:54'),
(2712, NULL, 2, '2022-09-26 23:27:10', '31.3410455', '30.0690158', '389R+J84, Nasr City, EG', '2022-09-27 06:27:10', '2022-09-27 06:27:10'),
(2713, NULL, 2, '2022-09-26 23:27:52', '31.3425414', '30.0693747', '389V+Q2C, Nasr City, EG', '2022-09-27 06:27:52', '2022-09-27 06:27:52'),
(2714, NULL, 2, '2022-09-26 23:28:38', '31.3427683', '30.0690989', 'Egypt, Nasr City, EG', '2022-09-27 06:28:38', '2022-09-27 06:28:38'),
(2715, NULL, 2, '2022-09-26 23:28:40', '31.3428031', '30.069171', 'Egypt, Nasr City, EG', '2022-09-27 06:28:40', '2022-09-27 06:28:40'),
(2716, NULL, 2, '2022-09-26 23:29:19', '31.3429095', '30.0690975', 'Egypt, Nasr City, EG', '2022-09-27 06:29:19', '2022-09-27 06:29:19'),
(2717, NULL, 2, '2022-09-26 23:29:20', '31.3429095', '30.0690975', 'Egypt, Nasr City, EG', '2022-09-27 06:29:20', '2022-09-27 06:29:20'),
(2718, NULL, 2, '2022-09-26 23:29:42', '31.3427071', '30.0692932', '4, Nasr City, EG', '2022-09-27 06:29:42', '2022-09-27 06:29:42'),
(2719, NULL, 2, '2022-09-26 23:29:51', '31.3428074', '30.0692121', '4, Nasr City, EG', '2022-09-27 06:29:51', '2022-09-27 06:29:51'),
(2720, NULL, 2, '2022-09-26 23:30:02', '31.3428434', '30.0691699', 'Egypt, Nasr City, EG', '2022-09-27 06:30:02', '2022-09-27 06:30:02'),
(2721, NULL, 2, '2022-09-26 23:30:11', '31.3427663', '30.0691561', 'Egypt, Nasr City, EG', '2022-09-27 06:30:11', '2022-09-27 06:30:11'),
(2722, NULL, 2, '2022-09-26 23:30:24', '31.3427736', '30.0691877', 'Egypt, Nasr City, EG', '2022-09-27 06:30:24', '2022-09-27 06:30:24'),
(2723, NULL, 2, '2022-09-26 23:30:48', '31.342843', '30.0692511', '4, Nasr City, EG', '2022-09-27 06:30:48', '2022-09-27 06:30:48'),
(2724, NULL, 2, '2022-09-26 23:33:00', '31.342829', '30.069215', 'Egypt, Nasr City, EG', '2022-09-27 06:33:00', '2022-09-27 06:33:00'),
(2725, NULL, 2, '2022-09-26 23:33:01', '31.342829', '30.069215', 'Egypt, Nasr City, EG', '2022-09-27 06:33:01', '2022-09-27 06:33:01'),
(2726, NULL, 2, '2022-09-26 23:35:05', '31.3428602', '30.0691942', 'Egypt, Nasr City, EG', '2022-09-27 06:35:05', '2022-09-27 06:35:05'),
(2727, NULL, 2, '2022-09-26 23:35:08', '31.3428602', '30.0691942', 'Egypt, Nasr City, EG', '2022-09-27 06:35:08', '2022-09-27 06:35:08'),
(2728, NULL, 2, '2022-09-26 23:35:24', '31.3428294', '30.0691051', 'Egypt, Nasr City, EG', '2022-09-27 06:35:24', '2022-09-27 06:35:24'),
(2729, NULL, 2, '2022-09-26 23:39:51', '31.3427584', '30.0693748', '4, Nasr City, EG', '2022-09-27 06:39:51', '2022-09-27 06:39:51'),
(2730, NULL, 2, '2022-09-26 23:39:53', '31.3427584', '30.0693748', '4, Nasr City, EG', '2022-09-27 06:39:53', '2022-09-27 06:39:53'),
(2731, NULL, 2, '2022-09-26 23:40:54', '31.3425447', '30.0694444', 'Unknown Location Found', '2022-09-27 06:40:54', '2022-09-27 06:40:54'),
(2732, NULL, 2, '2022-09-26 23:40:55', '31.3426851', '30.0693753', '4, Nasr City, EG', '2022-09-27 06:40:55', '2022-09-27 06:40:55'),
(2733, NULL, 2, '2022-09-26 23:41:04', '31.3426793', '30.0693243', '4, Nasr City, EG', '2022-09-27 06:41:04', '2022-09-27 06:41:04'),
(2734, NULL, 2, '2022-09-26 23:41:18', '31.3428603', '30.0692211', 'Egypt, Nasr City, EG', '2022-09-27 06:41:18', '2022-09-27 06:41:18'),
(2735, NULL, 2, '2022-09-26 23:41:34', '31.3428547', '30.0692168', 'Egypt, Nasr City, EG', '2022-09-27 06:41:34', '2022-09-27 06:41:34'),
(2736, NULL, 2, '2022-09-26 23:41:43', '31.3428039', '30.0692446', '4, Nasr City, EG', '2022-09-27 06:41:43', '2022-09-27 06:41:43'),
(2737, NULL, 2, '2022-09-26 23:43:02', '31.342798', '30.0692566', '4, Nasr City, EG', '2022-09-27 06:43:02', '2022-09-27 06:43:02'),
(2738, NULL, 2, '2022-09-26 23:43:03', '31.342798', '30.0692566', '4, Nasr City, EG', '2022-09-27 06:43:03', '2022-09-27 06:43:03'),
(2739, NULL, 2, '2022-09-26 23:43:15', '31.342757', '30.0693393', '4, Nasr City, EG', '2022-09-27 06:43:15', '2022-09-27 06:43:15'),
(2740, NULL, 2, '2022-09-26 23:43:55', '31.342788', '30.069265', '4, Nasr City, EG', '2022-09-27 06:43:55', '2022-09-27 06:43:55'),
(2741, NULL, 2, '2022-09-26 23:43:59', '31.3428028', '30.0691957', 'Egypt, Nasr City, EG', '2022-09-27 06:43:59', '2022-09-27 06:43:59'),
(2742, NULL, 2, '2022-09-26 23:44:13', '31.3428456', '30.0690883', 'Egypt, Nasr City, EG', '2022-09-27 06:44:13', '2022-09-27 06:44:13'),
(2743, NULL, 2, '2022-09-26 23:44:23', '31.3428304', '30.069166', 'Egypt, Nasr City, EG', '2022-09-27 06:44:23', '2022-09-27 06:44:23'),
(2744, NULL, 2, '2022-09-26 23:49:09', '31.3425461', '30.0694219', '389V+Q2C, Nasr City, EG', '2022-09-27 06:49:09', '2022-09-27 06:49:09'),
(2745, NULL, 2, '2022-09-26 23:49:14', '31.3425461', '30.0694219', '389V+Q2C, Nasr City, EG', '2022-09-27 06:49:14', '2022-09-27 06:49:14'),
(2746, NULL, 2, '2022-09-26 23:50:00', '31.3424362', '30.069317', 'Unknown Location Found', '2022-09-27 06:50:00', '2022-09-27 06:50:00'),
(2747, NULL, 2, '2022-09-26 23:50:00', '31.3424362', '30.069317', '389V+Q2C, Nasr City, EG', '2022-09-27 06:50:00', '2022-09-27 06:50:00'),
(2748, NULL, 2, '2022-09-26 23:50:10', '31.3428001', '30.0691474', 'Egypt, Nasr City, EG', '2022-09-27 06:50:10', '2022-09-27 06:50:10'),
(2749, NULL, 2, '2022-09-26 23:50:18', '31.3427877', '30.0692232', '4, Nasr City, EG', '2022-09-27 06:50:18', '2022-09-27 06:50:18'),
(2750, NULL, 2, '2022-09-26 23:51:24', '31.3428165', '30.0691038', 'Egypt, Nasr City, EG', '2022-09-27 06:51:24', '2022-09-27 06:51:24'),
(2751, NULL, 2, '2022-09-26 23:51:24', '31.3428165', '30.0691038', 'Egypt, Nasr City, EG', '2022-09-27 06:51:24', '2022-09-27 06:51:24'),
(2752, NULL, 2, '2022-09-26 23:51:34', '31.3426798', '30.0692434', '4, Nasr City, EG', '2022-09-27 06:51:34', '2022-09-27 06:51:34'),
(2753, NULL, 2, '2022-09-26 23:52:24', '31.3427794', '30.0692921', '4, Nasr City, EG', '2022-09-27 06:52:24', '2022-09-27 06:52:24'),
(2754, NULL, 2, '2022-09-26 23:52:34', '31.3427372', '30.0693046', '4, Nasr City, EG', '2022-09-27 06:52:34', '2022-09-27 06:52:34'),
(2755, NULL, 2, '2022-09-26 23:52:45', '31.3428127', '30.0694461', '4, Nasr City, EG', '2022-09-27 06:52:45', '2022-09-27 06:52:45'),
(2756, NULL, 2, '2022-09-26 23:54:00', '31.3428251', '30.0691327', 'Egypt, Nasr City, EG', '2022-09-27 06:54:00', '2022-09-27 06:54:00'),
(2757, NULL, 2, '2022-09-26 23:54:04', '31.3428497', '30.0691694', 'Egypt, Nasr City, EG', '2022-09-27 06:54:04', '2022-09-27 06:54:04'),
(2758, NULL, 2, '2022-09-26 23:54:20', '31.3428451', '30.0691641', 'Egypt, Nasr City, EG', '2022-09-27 06:54:20', '2022-09-27 06:54:20'),
(2759, NULL, 2, '2022-09-26 23:56:03', '31.3428532', '30.0691482', 'Egypt, Nasr City, EG', '2022-09-27 06:56:03', '2022-09-27 06:56:03'),
(2760, NULL, 2, '2022-09-26 23:56:07', '31.3428532', '30.0691482', 'Egypt, Nasr City, EG', '2022-09-27 06:56:07', '2022-09-27 06:56:07'),
(2761, NULL, 2, '2022-09-26 23:56:48', '31.3430361', '30.0691218', 'Egypt, Nasr City, EG', '2022-09-27 06:56:48', '2022-09-27 06:56:48'),
(2762, NULL, 2, '2022-09-26 23:56:48', '31.3430361', '30.0691218', 'Egypt, Nasr City, EG', '2022-09-27 06:56:48', '2022-09-27 06:56:48'),
(2763, NULL, 2, '2022-09-26 23:57:23', '31.3436047', '30.0687879', '389V+GCQ, Nasr City, EG', '2022-09-27 06:57:23', '2022-09-27 06:57:23'),
(2764, NULL, 2, '2022-09-26 23:57:30', '31.3441404', '30.0683778', 'Egypt, Nasr City, EG', '2022-09-27 06:57:30', '2022-09-27 06:57:30'),
(2765, NULL, 2, '2022-09-26 23:57:40', '31.34409', '30.0678128', '389V+4JJ, مدينة نصر, EG', '2022-09-27 06:57:40', '2022-09-27 06:57:40'),
(2766, NULL, 2, '2022-09-26 23:57:50', '31.3439296', '30.067939', '389V+4JJ, مدينة نصر, EG', '2022-09-27 06:57:50', '2022-09-27 06:57:50'),
(2767, NULL, 2, '2022-09-26 23:58:12', '31.3423173', '30.0679977', '4, Nasr City, EG', '2022-09-27 06:58:12', '2022-09-27 06:58:12'),
(2768, NULL, 2, '2022-09-26 23:58:20', '31.3420109', '30.0679734', '3, Nasr City, EG', '2022-09-27 06:58:20', '2022-09-27 06:58:20'),
(2769, NULL, 2, '2022-09-26 23:58:34', '31.3420261', '30.0678052', '3, Nasr City, EG', '2022-09-27 06:58:34', '2022-09-27 06:58:34'),
(2770, NULL, 2, '2022-09-26 23:58:55', '31.3418876', '30.0679509', '3, Nasr City, EG', '2022-09-27 06:58:55', '2022-09-27 06:58:55'),
(2771, NULL, 2, '2022-09-26 23:59:35', '31.3420148', '30.0675862', '388R+XPV, Nasr City, EG', '2022-09-27 06:59:35', '2022-09-27 06:59:35'),
(2772, NULL, 2, '2022-09-26 23:59:44', '31.3420148', '30.0675862', '388R+XPV, Nasr City, EG', '2022-09-27 06:59:44', '2022-09-27 06:59:44'),
(2773, NULL, 2, '2022-09-26 23:59:51', '31.3415533', '30.0680067', 'borg 3, Nasr City, EG', '2022-09-27 06:59:51', '2022-09-27 06:59:51'),
(2774, NULL, 2, '2022-09-27 00:00:22', '31.3392253', '30.0676535', '389Q+3PF, Nasr City, EG', '2022-09-27 07:00:22', '2022-09-27 07:00:22'),
(2775, NULL, 2, '2022-09-27 00:00:33', '31.3363916', '30.0671893', '388P+VGM, Nasr City, EG', '2022-09-27 07:00:33', '2022-09-27 07:00:33'),
(2776, NULL, 2, '2022-09-27 00:00:41', '31.337634', '30.0672788', 'مدينة نصر, مدينة نصر, EG', '2022-09-27 07:00:41', '2022-09-27 07:00:41'),
(2777, NULL, 2, '2022-09-27 00:00:52', '31.3376657', '30.0673804', 'مدينة نصر, مدينة نصر, EG', '2022-09-27 07:00:52', '2022-09-27 07:00:52'),
(2778, NULL, 2, '2022-09-27 00:01:01', '31.3376165', '30.0668639', 'Mohammed Hussein Haykal, Nasr City, EG', '2022-09-27 07:01:01', '2022-09-27 07:01:01'),
(2779, NULL, 2, '2022-09-27 00:01:11', '31.3373656', '30.0667238', '5, Nasr City, EG', '2022-09-27 07:01:11', '2022-09-27 07:01:11'),
(2780, NULL, 2, '2022-09-27 00:01:25', '31.3371326', '30.0667682', '388P+PRG, Nasr City, EG', '2022-09-27 07:01:25', '2022-09-27 07:01:25'),
(2781, NULL, 2, '2022-09-27 00:01:31', '31.336627', '30.0670888', '6, Nasr City, EG', '2022-09-27 07:01:31', '2022-09-27 07:01:31'),
(2782, NULL, 2, '2022-09-27 00:01:47', '31.3362896', '30.0676758', 'Unknown Location Found', '2022-09-27 07:01:47', '2022-09-27 07:01:47'),
(2783, NULL, 2, '2022-09-27 00:01:53', '31.3363305', '30.0679743', 'Egypt, Nasr City, EG', '2022-09-27 07:01:53', '2022-09-27 07:01:53'),
(2784, NULL, 2, '2022-09-27 00:02:03', '31.3367448', '30.0683796', '389P+9P3, Nasr City, EG', '2022-09-27 07:02:03', '2022-09-27 07:02:03'),
(2785, NULL, 2, '2022-09-27 00:02:13', '31.3382312', '30.0687261', '13, Nasr City, EG', '2022-09-27 07:02:13', '2022-09-27 07:02:13'),
(2786, NULL, 2, '2022-09-27 00:02:22', '31.3382572', '30.0687795', 'Medan EL Sa3a [ Nozha St. ], Nasr City, EG', '2022-09-27 07:02:22', '2022-09-27 07:02:22'),
(2787, NULL, 2, '2022-09-27 00:02:55', '31.3383848', '30.0703325', '17, Nasr City, EG', '2022-09-27 07:02:55', '2022-09-27 07:02:55'),
(2788, NULL, 2, '2022-09-27 00:03:05', '31.3384167', '30.0710055', '24, Nasr City, EG', '2022-09-27 07:03:05', '2022-09-27 07:03:05'),
(2789, NULL, 2, '2022-09-27 00:03:19', '31.3387353', '30.0720546', '22, Nasr City, EG', '2022-09-27 07:03:19', '2022-09-27 07:03:19');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(2790, NULL, 2, '2022-09-27 00:03:26', '31.3387271', '30.0722602', '38CQ+WFV, Nasr City, EG', '2022-09-27 07:03:27', '2022-09-27 07:03:27'),
(2791, NULL, 2, '2022-09-27 00:03:35', '31.338675', '30.0729799', 'Egypt, Nasr City, EG', '2022-09-27 07:03:35', '2022-09-27 07:03:35'),
(2792, NULL, 2, '2022-09-27 00:04:01', '31.3395595', '30.077163', '17, Nasr City, EG', '2022-09-27 07:04:01', '2022-09-27 07:04:01'),
(2793, NULL, 2, '2022-09-27 00:04:04', '31.3395595', '30.077163', '17, Nasr City, EG', '2022-09-27 07:04:04', '2022-09-27 07:04:04'),
(2794, NULL, 2, '2022-09-27 00:05:07', '31.339578', '30.0819467', '38JQ+PVR, Nasr City, EG', '2022-09-27 07:05:07', '2022-09-27 07:05:07'),
(2795, NULL, 2, '2022-09-27 00:05:30', '31.3409495', '30.0851616', '43, El Nozha, EG', '2022-09-27 07:05:30', '2022-09-27 07:05:30'),
(2796, NULL, 2, '2022-09-27 00:05:36', '31.3410494', '30.0851467', '43, El Nozha, EG', '2022-09-27 07:05:36', '2022-09-27 07:05:36'),
(2797, NULL, 2, '2022-09-27 00:05:44', '31.3408031', '30.0862193', '38PR+G6X, Heliopolis, EG', '2022-09-27 07:05:44', '2022-09-27 07:05:44'),
(2798, NULL, 2, '2022-09-27 00:05:54', '31.341104', '30.087156', 'Nozha Bridge Exit, Heliopolis, EG', '2022-09-27 07:05:54', '2022-09-27 07:05:54'),
(2799, NULL, 2, '2022-09-27 00:06:04', '31.3412982', '30.0882162', '65, Heliopolis, EG', '2022-09-27 07:06:04', '2022-09-27 07:06:04'),
(2800, NULL, 2, '2022-09-27 00:06:14', '31.3414353', '30.089131', '38QR+JF5, Heliopolis, EG', '2022-09-27 07:06:14', '2022-09-27 07:06:14'),
(2801, NULL, 2, '2022-09-27 00:06:24', '31.3414808', '30.0894149', '78, Heliopolis, EG', '2022-09-27 07:06:24', '2022-09-27 07:06:24'),
(2802, NULL, 2, '2022-09-27 00:06:34', '31.3414783', '30.08946', '78, Heliopolis, EG', '2022-09-27 07:06:34', '2022-09-27 07:06:34'),
(2803, NULL, 2, '2022-09-27 00:06:44', '31.3414749', '30.0894598', '78, Heliopolis, EG', '2022-09-27 07:06:44', '2022-09-27 07:06:44'),
(2804, NULL, 2, '2022-09-27 00:06:54', '31.3415554', '30.0901054', 'Cairo Sales Stores, Heliopolis, EG', '2022-09-27 07:06:54', '2022-09-27 07:06:54'),
(2805, NULL, 2, '2022-09-27 00:07:04', '31.3417107', '30.0911381', '38RR+GQ2, Heliopolis, EG', '2022-09-27 07:07:04', '2022-09-27 07:07:04'),
(2806, NULL, 2, '2022-09-27 00:07:16', '31.342012', '30.0923371', '88, Heliopolis, EG', '2022-09-27 07:07:16', '2022-09-27 07:07:16'),
(2807, NULL, 2, '2022-09-27 00:07:25', '31.3421993', '30.0935728', '38VR+CPX, Heliopolis, EG', '2022-09-27 07:07:25', '2022-09-27 07:07:25'),
(2808, NULL, 2, '2022-09-27 00:07:35', '31.3424279', '30.0947536', '38VR+WVX, Heliopolis, EG', '2022-09-27 07:07:35', '2022-09-27 07:07:35'),
(2809, NULL, 2, '2022-09-27 00:07:44', '31.3429915', '30.0948926', 'Cairo Governorate, El Nozha, EG', '2022-09-27 07:07:44', '2022-09-27 07:07:44'),
(2810, NULL, 2, '2022-09-27 00:07:54', '31.3439718', '30.0942133', 'Sun Mall, El Nozha, EG', '2022-09-27 07:07:54', '2022-09-27 07:07:54'),
(2811, NULL, 2, '2022-09-27 00:08:04', '31.3452442', '30.0934582', 'Abou Bakr El Sedeek Bridge, Heliopolis, EG', '2022-09-27 07:08:04', '2022-09-27 07:08:04'),
(2812, NULL, 2, '2022-09-27 00:08:16', '31.3460163', '30.0931538', 'كوبرى الماظة, El Nozha, EG', '2022-09-27 07:08:16', '2022-09-27 07:08:16'),
(2813, NULL, 2, '2022-09-27 00:08:24', '31.3455252', '30.0936513', 'Egypt, El Nozha, EG', '2022-09-27 07:08:24', '2022-09-27 07:08:24'),
(2814, NULL, 2, '2022-09-27 00:08:34', '31.3443812', '30.0942236', 'Sun Mall, El Nozha, EG', '2022-09-27 07:08:34', '2022-09-27 07:08:34'),
(2815, NULL, 2, '2022-09-27 00:08:44', '31.3430322', '30.0950483', 'Cairo Governorate, El Nozha, EG', '2022-09-27 07:08:44', '2022-09-27 07:08:44'),
(2816, NULL, 2, '2022-09-27 00:08:54', '31.34177', '30.0957861', 'Al Galaa Bridge (Helipolis), El Nozha, EG', '2022-09-27 07:08:54', '2022-09-27 07:08:54'),
(2817, NULL, 2, '2022-09-27 00:09:09', '31.3403304', '30.096602', 'Egypt, El Nozha, EG', '2022-09-27 07:09:09', '2022-09-27 07:09:09'),
(2818, NULL, 2, '2022-09-27 00:09:14', '31.3387443', '30.0975766', '38WQ+XF7, El Nozha, EG', '2022-09-27 07:09:14', '2022-09-27 07:09:14'),
(2819, NULL, 2, '2022-09-27 00:09:24', '31.3373494', '30.098423', '38XP+CXM, El Nozha, EG', '2022-09-27 07:09:24', '2022-09-27 07:09:24'),
(2820, NULL, 2, '2022-09-27 00:09:34', '31.3358685', '30.0992727', '42, Heliopolis, EG', '2022-09-27 07:09:34', '2022-09-27 07:09:34'),
(2821, NULL, 2, '2022-09-27 00:09:44', '31.334509', '30.1000926', '482M+4W9, El Nozha, EG', '2022-09-27 07:09:44', '2022-09-27 07:09:44'),
(2822, NULL, 2, '2022-09-27 00:09:54', '31.3332486', '30.1008405', 'Egypt, Heliopolis, EG', '2022-09-27 07:09:54', '2022-09-27 07:09:54'),
(2823, NULL, 2, '2022-09-27 00:10:04', '31.3319259', '30.1016098', '32, Heliopolis, EG', '2022-09-27 07:10:04', '2022-09-27 07:10:04'),
(2824, NULL, 2, '2022-09-27 00:10:14', '31.3306398', '30.1024077', '31, Heliopolis, EG', '2022-09-27 07:10:14', '2022-09-27 07:10:14'),
(2825, NULL, 2, '2022-09-27 00:10:25', '31.3292733', '30.1032568', 'Egypt, El Nozha, EG', '2022-09-27 07:10:25', '2022-09-27 07:10:25'),
(2826, NULL, 2, '2022-09-27 00:10:34', '31.3277683', '30.1041726', 'Heliopolis Courthouse Complex, El Nozha, EG', '2022-09-27 07:10:34', '2022-09-27 07:10:34'),
(2827, NULL, 2, '2022-09-27 00:10:45', '31.3262536', '30.1050622', '9, Heliopolis, EG', '2022-09-27 07:10:45', '2022-09-27 07:10:45'),
(2828, NULL, 2, '2022-09-27 00:10:54', '31.3250762', '30.1057963', '484G+C24, El Nozha, EG', '2022-09-27 07:10:54', '2022-09-27 07:10:54'),
(2829, NULL, 2, '2022-09-27 00:11:05', '31.3243004', '30.1064204', '484F+GMX, El Nozha, EG', '2022-09-27 07:11:05', '2022-09-27 07:11:05'),
(2830, NULL, 2, '2022-09-27 00:11:14', '31.3239261', '30.1066897', 'Egypt, El Nozha, EG', '2022-09-27 07:11:14', '2022-09-27 07:11:14'),
(2831, NULL, 2, '2022-09-27 00:11:24', '31.3238721', '30.1067012', 'Egypt, El Nozha, EG', '2022-09-27 07:11:24', '2022-09-27 07:11:24'),
(2832, NULL, 2, '2022-09-27 00:11:35', '31.3234935', '30.1069554', '89, Ain Shams, EG', '2022-09-27 07:11:35', '2022-09-27 07:11:35'),
(2833, NULL, 2, '2022-09-27 00:11:44', '31.3228526', '30.1076352', '484F+X3Q, Zeitoun, EG', '2022-09-27 07:11:44', '2022-09-27 07:11:44'),
(2834, NULL, 2, '2022-09-27 00:11:54', '31.3222221', '30.1083046', '485C+6QW, Zeitoun, EG', '2022-09-27 07:11:54', '2022-09-27 07:11:54'),
(2835, NULL, 2, '2022-09-27 00:12:04', '31.3215053', '30.1090938', 'Ibn Al Hakam, Ain Shams, EG', '2022-09-27 07:12:04', '2022-09-27 07:12:04'),
(2836, NULL, 2, '2022-09-27 00:12:14', '31.3207602', '30.1099034', '38, Ain Shams, EG', '2022-09-27 07:12:14', '2022-09-27 07:12:14'),
(2837, NULL, 2, '2022-09-27 00:12:25', '31.3195182', '30.1106238', '41, Zeitoun, EG', '2022-09-27 07:12:25', '2022-09-27 07:12:25'),
(2838, NULL, 2, '2022-09-27 00:12:35', '31.3181552', '30.1111665', 'North Cairo Electricity Distribution Company (Al Helmeya), Ain Shams, EG', '2022-09-27 07:12:35', '2022-09-27 07:12:35'),
(2839, NULL, 2, '2022-09-27 00:12:44', '31.3175865', '30.1114972', '22, Ain Shams, EG', '2022-09-27 07:12:44', '2022-09-27 07:12:44'),
(2840, NULL, 2, '2022-09-27 00:12:54', '31.3173671', '30.1116008', 'Cairo Governorate, Ain Shams, EG', '2022-09-27 07:12:54', '2022-09-27 07:12:54'),
(2841, NULL, 2, '2022-09-27 00:13:04', '31.317157', '30.111747', '4868+QV6, Ain Shams, EG', '2022-09-27 07:13:04', '2022-09-27 07:13:04'),
(2842, NULL, 2, '2022-09-27 00:13:14', '31.3170154', '30.111837', '4868+QV6, Ain Shams, EG', '2022-09-27 07:13:14', '2022-09-27 07:13:14'),
(2843, NULL, 2, '2022-09-27 00:13:24', '31.3170167', '30.1118517', 'Cairo Governorate, Ain Shams, EG', '2022-09-27 07:13:24', '2022-09-27 07:13:24'),
(2844, NULL, 2, '2022-09-27 00:13:35', '31.3168153', '30.1119837', '12, Ain Shams, EG', '2022-09-27 07:13:35', '2022-09-27 07:13:35'),
(2845, NULL, 2, '2022-09-27 00:13:45', '31.316162', '30.1123244', '4868+XC4, Ain Shams, EG', '2022-09-27 07:13:45', '2022-09-27 07:13:45'),
(2846, NULL, 2, '2022-09-27 00:13:55', '31.3151247', '30.1128655', '3st, Ain Shams, EG', '2022-09-27 07:13:55', '2022-09-27 07:13:55'),
(2847, NULL, 2, '2022-09-27 00:14:04', '31.3137598', '30.1132063', '4877+8G4, Ain Shams, EG', '2022-09-27 07:14:04', '2022-09-27 07:14:04'),
(2848, NULL, 2, '2022-09-27 00:14:16', '31.3121651', '30.1134888', 'Tereat Al Gabal St. (Al Horeyya St.), Zeitoun, EG', '2022-09-27 07:14:16', '2022-09-27 07:14:16'),
(2849, NULL, 2, '2022-09-27 00:14:25', '31.310908', '30.1139061', '4876+J8C, El Matareya, EG', '2022-09-27 07:14:25', '2022-09-27 07:14:25'),
(2850, NULL, 2, '2022-09-27 00:14:36', '31.3092996', '30.1144346', '4875+VP8, El Matareya, EG', '2022-09-27 07:14:36', '2022-09-27 07:14:36'),
(2851, NULL, 2, '2022-09-27 00:14:44', '31.3080278', '30.1149368', 'Cairo Governorate, El Matareya, EG', '2022-09-27 07:14:44', '2022-09-27 07:14:44'),
(2852, NULL, 2, '2022-09-27 00:14:54', '31.3064841', '30.1154238', '4884+4HP, Zeitoun, EG', '2022-09-27 07:14:54', '2022-09-27 07:14:54'),
(2853, NULL, 2, '2022-09-27 00:15:05', '31.3053375', '30.1166864', '4884+M63, El Matareya, EG', '2022-09-27 07:15:05', '2022-09-27 07:15:05'),
(2854, NULL, 2, '2022-09-27 00:15:15', '31.3047679', '30.1174566', '4883+WQ3, El Matareya, EG', '2022-09-27 07:15:15', '2022-09-27 07:15:15'),
(2855, NULL, 2, '2022-09-27 00:15:24', '31.3036524', '30.1188456', 'الحرية, قسم المطرية, EG', '2022-09-27 07:15:24', '2022-09-27 07:15:24'),
(2856, NULL, 2, '2022-09-27 00:15:35', '31.3028642', '30.119911', '4893+W2P, El Matareya, EG', '2022-09-27 07:15:35', '2022-09-27 07:15:35'),
(2857, NULL, 2, '2022-09-27 00:15:44', '31.302318', '30.1205851', '48C2+7VF, El Matareya, EG', '2022-09-27 07:15:44', '2022-09-27 07:15:44'),
(2858, NULL, 2, '2022-09-27 00:15:55', '31.3018233', '30.1212111', '48C2+CMV, El Matareya, EG', '2022-09-27 07:15:55', '2022-09-27 07:15:55'),
(2859, NULL, 2, '2022-09-27 00:16:05', '31.301359', '30.1218335', 'Egypt, El Matareya, EG', '2022-09-27 07:16:05', '2022-09-27 07:16:05'),
(2860, NULL, 2, '2022-09-27 00:16:14', '31.3008797', '30.1224396', '98, El Matareya, EG', '2022-09-27 07:16:14', '2022-09-27 07:16:14'),
(2861, NULL, 2, '2022-09-27 00:16:24', '31.3006802', '30.1226676', 'شارع التروللي, قسم المطرية, EG', '2022-09-27 07:16:24', '2022-09-27 07:16:24'),
(2862, NULL, 2, '2022-09-27 00:16:34', '31.3005857', '30.1228125', '48F2+466, El Matareya, EG', '2022-09-27 07:16:34', '2022-09-27 07:16:34'),
(2863, NULL, 2, '2022-09-27 00:16:44', '31.3001841', '30.1233461', '48F2+727, El Matareya, EG', '2022-09-27 07:16:44', '2022-09-27 07:16:44'),
(2864, NULL, 2, '2022-09-27 00:16:55', '31.2996677', '30.1241246', '47FX+PW3, El Matareya, EG', '2022-09-27 07:16:55', '2022-09-27 07:16:55'),
(2865, NULL, 2, '2022-09-27 00:17:04', '31.2993548', '30.1246453', 'Cairo Governorate, El Matareya, EG', '2022-09-27 07:17:04', '2022-09-27 07:17:04'),
(2866, NULL, 2, '2022-09-27 00:17:14', '31.299157', '30.1249186', '47GX+2M2, El Matareya, EG', '2022-09-27 07:17:14', '2022-09-27 07:17:14'),
(2867, NULL, 2, '2022-09-27 00:17:25', '31.2988803', '30.1252388', '47GX+4HW, El Matareya, EG', '2022-09-27 07:17:25', '2022-09-27 07:17:25'),
(2868, NULL, 2, '2022-09-27 00:17:35', '31.2985701', '30.1256249', 'كوبري كنيسة الرشاح, El Matareya, EG', '2022-09-27 07:17:35', '2022-09-27 07:17:35'),
(2869, NULL, 2, '2022-09-27 00:17:45', '31.2984946', '30.1258889', '47GX+9C3, El Matareya, EG', '2022-09-27 07:17:45', '2022-09-27 07:17:45'),
(2870, NULL, 2, '2022-09-27 00:17:55', '31.2984471', '30.1258868', '47GX+9C3, El Matareya, EG', '2022-09-27 07:17:55', '2022-09-27 07:17:55'),
(2871, NULL, 2, '2022-09-27 00:18:04', '31.2983633', '30.1259117', '47GX+99W, El Matareya, EG', '2022-09-27 07:18:04', '2022-09-27 07:18:04'),
(2872, NULL, 2, '2022-09-27 00:18:14', '31.2983605', '30.1259127', '47GX+99W, El Matareya, EG', '2022-09-27 07:18:14', '2022-09-27 07:18:14'),
(2873, NULL, 2, '2022-09-27 00:18:25', '31.2980461', '30.1258664', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:18:25', '2022-09-27 07:18:25'),
(2874, NULL, 2, '2022-09-27 00:18:34', '31.29804', '30.125865', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:18:34', '2022-09-27 07:18:34'),
(2875, NULL, 2, '2022-09-27 00:18:44', '31.29804', '30.125865', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:18:44', '2022-09-27 07:18:44'),
(2876, NULL, 2, '2022-09-27 00:18:55', '31.2981498', '30.1259204', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:18:55', '2022-09-27 07:18:55'),
(2877, NULL, 2, '2022-09-27 00:19:04', '31.2981517', '30.12592', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:19:04', '2022-09-27 07:19:04'),
(2878, NULL, 2, '2022-09-27 00:19:14', '31.2981467', '30.1258217', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:19:14', '2022-09-27 07:19:14'),
(2879, NULL, 2, '2022-09-27 00:19:25', '31.2981467', '30.1258217', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:19:25', '2022-09-27 07:19:25'),
(2880, NULL, 2, '2022-09-27 00:19:34', '31.2981467', '30.1258217', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:19:34', '2022-09-27 07:19:34'),
(2881, NULL, 2, '2022-09-27 00:19:44', '31.2981467', '30.1258217', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:19:44', '2022-09-27 07:19:44'),
(2882, NULL, 2, '2022-09-27 00:19:54', '31.2981666', '30.1259199', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:19:54', '2022-09-27 07:19:54'),
(2883, NULL, 2, '2022-09-27 00:20:05', '31.2981667', '30.12592', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:20:05', '2022-09-27 07:20:05'),
(2884, NULL, 2, '2022-09-27 00:20:14', '31.2981667', '30.12592', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:20:14', '2022-09-27 07:20:14'),
(2885, NULL, 2, '2022-09-27 00:20:24', '31.2981667', '30.12592', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:20:24', '2022-09-27 07:20:24'),
(2886, NULL, 2, '2022-09-27 00:20:34', '31.2981667', '30.12592', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:20:34', '2022-09-27 07:20:34'),
(2887, NULL, 2, '2022-09-27 00:20:44', '31.2981667', '30.12592', 'Abu Khater (Al Matareyya), El Matareya, EG', '2022-09-27 07:20:44', '2022-09-27 07:20:44'),
(2888, NULL, 2, '2022-09-27 19:43:25', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:43:25', '2022-09-28 02:43:25'),
(2889, NULL, 2, '2022-09-27 19:43:31', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:43:31', '2022-09-28 02:43:31'),
(2890, NULL, 2, '2022-09-27 19:43:40', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:43:40', '2022-09-28 02:43:40'),
(2891, NULL, 2, '2022-09-27 19:43:58', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:43:58', '2022-09-28 02:43:58'),
(2892, NULL, 2, '2022-09-27 19:44:16', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:44:16', '2022-09-28 02:44:16'),
(2893, NULL, 2, '2022-09-27 19:44:18', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:44:18', '2022-09-28 02:44:18'),
(2894, NULL, 2, '2022-09-27 19:44:30', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:44:30', '2022-09-28 02:44:30'),
(2895, NULL, 2, '2022-09-27 19:44:42', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:44:42', '2022-09-28 02:44:42'),
(2896, NULL, 2, '2022-09-27 19:44:52', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:44:52', '2022-09-28 02:44:52'),
(2897, NULL, 2, '2022-09-27 19:45:00', '31.2685379', '30.0625579', '23, Daher, EG', '2022-09-28 02:45:00', '2022-09-28 02:45:00'),
(2898, NULL, 2, '2022-09-27 19:45:10', '31.2595964', '30.0564646', '8, Bab El Sharia, EG', '2022-09-28 02:45:10', '2022-09-28 02:45:10'),
(2899, NULL, 2, '2022-09-27 19:45:20', '31.2595964', '30.0564646', '8, Bab El Sharia, EG', '2022-09-28 02:45:20', '2022-09-28 02:45:20'),
(2900, NULL, 2, '2022-09-27 19:45:29', '31.2595964', '30.0564646', '8, Bab El Sharia, EG', '2022-09-28 02:45:29', '2022-09-28 02:45:29'),
(2901, NULL, 2, '2022-09-27 19:46:17', '31.2595964', '30.0564646', '8, Bab El Sharia, EG', '2022-09-28 02:46:17', '2022-09-28 02:46:17'),
(2902, NULL, 2, '2022-09-27 19:46:19', '31.2595964', '30.0564646', '8, Bab El Sharia, EG', '2022-09-28 02:46:19', '2022-09-28 02:46:19'),
(2903, NULL, 2, '2022-09-27 19:50:01', '31.2481502', '30.0539525', '8, Al Azbakeya, EG', '2022-09-28 02:50:01', '2022-09-28 02:50:01'),
(2904, NULL, 2, '2022-09-27 19:50:13', '31.2481502', '30.0539525', '8, Al Azbakeya, EG', '2022-09-28 02:50:13', '2022-09-28 02:50:13'),
(2905, NULL, 2, '2022-09-27 19:50:23', '31.2481502', '30.0539525', '8, Al Azbakeya, EG', '2022-09-28 02:50:23', '2022-09-28 02:50:23'),
(2906, NULL, 2, '2022-09-27 19:50:35', '31.2481502', '30.0539525', '8, Al Azbakeya, EG', '2022-09-28 02:50:35', '2022-09-28 02:50:35'),
(2907, NULL, 2, '2022-09-27 20:00:40', '31.205933', '30.0286442', '46, Dokki, EG', '2022-09-28 03:00:40', '2022-09-28 03:00:40'),
(2908, NULL, 2, '2022-09-27 20:00:53', '31.205933', '30.0286442', '46, Dokki, EG', '2022-09-28 03:00:53', '2022-09-28 03:00:53'),
(2909, NULL, 2, '2022-09-27 20:07:38', '31.2366191', '30.0436533', '7 79, Abdeen, EG', '2022-09-28 03:07:38', '2022-09-28 03:07:38'),
(2910, NULL, 2, '2022-09-27 20:07:40', '31.2366191', '30.0436533', '7 79, Abdeen, EG', '2022-09-28 03:07:40', '2022-09-28 03:07:40'),
(2911, NULL, 2, '2022-09-27 20:07:50', '31.2358001', '30.0434217', '26VP+C8X, Qasr El Nil, EG', '2022-09-28 03:07:50', '2022-09-28 03:07:50'),
(2912, NULL, 2, '2022-09-27 20:08:01', '31.235869', '30.0433892', '26VP+C8X, Qasr El Nil, EG', '2022-09-28 03:08:01', '2022-09-28 03:08:01'),
(2913, NULL, 2, '2022-09-27 20:08:10', '31.235994', '30.0434097', '26VP+CF4, Abdeen, EG', '2022-09-28 03:08:10', '2022-09-28 03:08:10'),
(2914, NULL, 2, '2022-09-27 20:08:20', '31.2360136', '30.0435043', '26VP+C8X, Qasr El Nil, EG', '2022-09-28 03:08:20', '2022-09-28 03:08:20'),
(2915, NULL, 2, '2022-09-27 20:08:31', '31.2360517', '30.0436319', '26VP+CF4, Abdeen, EG', '2022-09-28 03:08:31', '2022-09-28 03:08:31'),
(2916, NULL, 2, '2022-09-27 20:08:40', '31.2362373', '30.0436592', '26VP+CF4, Abdeen, EG', '2022-09-28 03:08:40', '2022-09-28 03:08:40'),
(2917, NULL, 2, '2022-09-27 20:08:50', '31.2363212', '30.0436271', '3, Abdeen, EG', '2022-09-28 03:08:50', '2022-09-28 03:08:50'),
(2918, NULL, 2, '2022-09-27 20:09:00', '31.2363967', '30.0436529', '3, Abdeen, EG', '2022-09-28 03:09:00', '2022-09-28 03:09:00'),
(2919, NULL, 2, '2022-09-27 20:09:10', '31.2365154', '30.0437113', 'Ad Dawawin, Abdeen, EG', '2022-09-28 03:09:10', '2022-09-28 03:09:10'),
(2920, NULL, 2, '2022-09-27 20:09:20', '31.2366338', '30.043755', '7 79, Abdeen, EG', '2022-09-28 03:09:20', '2022-09-28 03:09:20'),
(2921, NULL, 2, '2022-09-27 20:09:30', '31.2367247', '30.0438289', '22, Abdeen, EG', '2022-09-28 03:09:30', '2022-09-28 03:09:30'),
(2922, NULL, 2, '2022-09-27 20:09:41', '31.2368428', '30.043881', '26VP+HR4, Abdeen, EG', '2022-09-28 03:09:41', '2022-09-28 03:09:41'),
(2923, NULL, 2, '2022-09-27 20:09:50', '31.2368896', '30.043875', '26VP+HR4, Abdeen, EG', '2022-09-28 03:09:50', '2022-09-28 03:09:50'),
(2924, NULL, 2, '2022-09-27 20:10:02', '31.2370381', '30.0438071', '26VP+HR4, Abdeen, EG', '2022-09-28 03:10:02', '2022-09-28 03:10:02'),
(2925, NULL, 2, '2022-09-27 20:10:11', '31.2370927', '30.0439496', '26VP+HR4, Abdeen, EG', '2022-09-28 03:10:11', '2022-09-28 03:10:11'),
(2926, NULL, 2, '2022-09-27 20:10:20', '31.2372021', '30.0440559', '26VP+JVX, Abdeen, EG', '2022-09-28 03:10:20', '2022-09-28 03:10:20'),
(2927, NULL, 2, '2022-09-27 20:10:30', '31.2372082', '30.044175', '1, Abdeen, EG', '2022-09-28 03:10:30', '2022-09-28 03:10:30'),
(2928, NULL, 2, '2022-09-27 20:10:41', '31.2371625', '30.044255', '1, Abdeen, EG', '2022-09-28 03:10:41', '2022-09-28 03:10:41'),
(2929, NULL, 2, '2022-09-27 20:10:51', '31.2371604', '30.0444135', '94, Abdeen, EG', '2022-09-28 03:10:51', '2022-09-28 03:10:51'),
(2930, NULL, 2, '2022-09-27 20:11:00', '31.2371439', '30.0444961', '161, Abdeen, EG', '2022-09-28 03:11:00', '2022-09-28 03:11:00'),
(2931, NULL, 2, '2022-09-27 20:11:10', '31.2371309', '30.0445566', 'Egypt, عابدين, EG', '2022-09-28 03:11:10', '2022-09-28 03:11:10'),
(2932, NULL, 2, '2022-09-27 20:11:21', '31.2371282', '30.0445919', 'Egypt, عابدين, EG', '2022-09-28 03:11:21', '2022-09-28 03:11:21'),
(2933, NULL, 2, '2022-09-27 20:11:30', '31.2371276', '30.044624', 'Egypt, عابدين, EG', '2022-09-28 03:11:30', '2022-09-28 03:11:30'),
(2934, NULL, 2, '2022-09-27 20:11:41', '31.2372307', '30.0446772', 'Egypt, Abdeen, EG', '2022-09-28 03:11:41', '2022-09-28 03:11:41'),
(2935, NULL, 2, '2022-09-27 20:11:50', '31.2374798', '30.0446929', '166, Abdeen, EG', '2022-09-28 03:11:50', '2022-09-28 03:11:50'),
(2936, NULL, 2, '2022-09-27 20:12:01', '31.2376616', '30.044664', 'Egypt, Abdeen, EG', '2022-09-28 03:12:01', '2022-09-28 03:12:01'),
(2937, NULL, 2, '2022-09-27 20:12:10', '31.2378026', '30.0446722', '168, Abdeen, EG', '2022-09-28 03:12:10', '2022-09-28 03:12:10'),
(2938, NULL, 2, '2022-09-27 20:12:20', '31.2379568', '30.0446616', 'Cairo Governorate, Abdeen, EG', '2022-09-28 03:12:20', '2022-09-28 03:12:20'),
(2939, NULL, 2, '2022-09-27 20:12:31', '31.2381401', '30.0446893', '171, Abdeen, EG', '2022-09-28 03:12:31', '2022-09-28 03:12:31'),
(2940, NULL, 2, '2022-09-27 20:12:41', '31.2382758', '30.0446994', '171, Abdeen, EG', '2022-09-28 03:12:41', '2022-09-28 03:12:41'),
(2941, NULL, 2, '2022-09-27 20:12:52', '31.2384047', '30.0446649', '12, Abdeen, EG', '2022-09-28 03:12:52', '2022-09-28 03:12:52'),
(2942, NULL, 2, '2022-09-27 20:13:01', '31.2384912', '30.0446047', '12, Abdeen, EG', '2022-09-28 03:13:01', '2022-09-28 03:13:01'),
(2943, NULL, 2, '2022-09-27 20:13:10', '31.2384737', '30.0444899', '12, Abdeen, EG', '2022-09-28 03:13:10', '2022-09-28 03:13:10'),
(2944, NULL, 2, '2022-09-27 20:13:21', '31.2383934', '30.0443929', 'Cairo Governorate, Abdeen, EG', '2022-09-28 03:13:21', '2022-09-28 03:13:21'),
(2945, NULL, 2, '2022-09-27 20:13:32', '31.2383513', '30.0443197', 'Cairo Governorate, Abdeen, EG', '2022-09-28 03:13:32', '2022-09-28 03:13:32'),
(2946, NULL, 2, '2022-09-27 20:13:55', '31.2383271', '30.0442944', 'Egypt, Abdeen, EG', '2022-09-28 03:13:55', '2022-09-28 03:13:55'),
(2947, NULL, 2, '2022-09-27 20:14:00', '31.2383345', '30.0439422', '10b, Abdeen, EG', '2022-09-28 03:14:00', '2022-09-28 03:14:00'),
(2948, NULL, 2, '2022-09-27 20:14:26', '31.2382364', '30.0434535', 'Egypt, Abdeen, EG', '2022-09-28 03:14:26', '2022-09-28 03:14:26'),
(2949, NULL, 2, '2022-09-27 20:16:08', '31.2390838', '30.0434274', '26VQ+9JP, Abdeen, EG', '2022-09-28 03:16:08', '2022-09-28 03:16:08'),
(2950, NULL, 2, '2022-09-27 20:16:11', '31.2390838', '30.0434274', '26VQ+9JP, Abdeen, EG', '2022-09-28 03:16:11', '2022-09-28 03:16:11'),
(2951, NULL, 2, '2022-09-27 20:16:30', '31.2390682', '30.0434278', '26VQ+9JP, Abdeen, EG', '2022-09-28 03:16:30', '2022-09-28 03:16:30'),
(2952, NULL, 2, '2022-09-27 20:16:33', '31.2390505', '30.0434636', '26VQ+9JP, Abdeen, EG', '2022-09-28 03:16:33', '2022-09-28 03:16:33'),
(2953, NULL, 2, '2022-09-27 20:17:00', '31.2390653', '30.0434062', '26VQ+9J8, Abdeen, EG', '2022-09-28 03:17:00', '2022-09-28 03:17:00'),
(2954, NULL, 2, '2022-09-27 20:17:02', '31.2390631', '30.0434087', '26VQ+9J8, Abdeen, EG', '2022-09-28 03:17:02', '2022-09-28 03:17:02'),
(2955, NULL, 2, '2022-09-27 20:18:13', '31.2390315', '30.0434269', '26VQ+9J8, Abdeen, EG', '2022-09-28 03:18:13', '2022-09-28 03:18:13'),
(2956, NULL, 2, '2022-09-27 20:18:22', '31.2390701', '30.0434112', '26VQ+9J8, Abdeen, EG', '2022-09-28 03:18:22', '2022-09-28 03:18:22'),
(2957, NULL, 2, '2022-09-27 20:18:33', '31.2390745', '30.0434134', '26VQ+9J8, Abdeen, EG', '2022-09-28 03:18:33', '2022-09-28 03:18:33'),
(2958, NULL, 2, '2022-09-27 20:18:43', '31.2391111', '30.0434229', '26VQ+9JP, Abdeen, EG', '2022-09-28 03:18:43', '2022-09-28 03:18:43'),
(2959, NULL, 2, '2022-09-27 20:18:52', '31.2390743', '30.0434312', '26VQ+9JP, Abdeen, EG', '2022-09-28 03:18:52', '2022-09-28 03:18:52'),
(2960, NULL, 2, '2022-09-29 16:36:07', '104.560725', '32.3532982', 'Unknown Location Found', '2022-09-29 23:36:07', '2022-09-29 23:36:07'),
(2961, NULL, 2, '2022-09-29 16:36:18', '104.560725', '32.3532984', 'Unknown Location Found', '2022-09-29 23:36:18', '2022-09-29 23:36:18'),
(2962, NULL, 2, '2022-09-29 16:36:28', '104.560725', '32.3532983', 'Unknown Location Found', '2022-09-29 23:36:28', '2022-09-29 23:36:28'),
(2963, NULL, 2, '2022-09-29 16:36:38', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-29 23:36:38', '2022-09-29 23:36:38'),
(2964, NULL, 2, '2022-09-29 16:36:48', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-29 23:36:48', '2022-09-29 23:36:48'),
(2965, NULL, 2, '2022-09-29 16:36:58', '104.5607256', '32.3532983', 'Unknown Location Found', '2022-09-29 23:36:58', '2022-09-29 23:36:58'),
(2966, NULL, 2, '2022-09-29 16:37:08', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-29 23:37:08', '2022-09-29 23:37:08'),
(2967, NULL, 2, '2022-09-29 16:37:18', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-29 23:37:18', '2022-09-29 23:37:18'),
(2968, NULL, 2, '2022-09-29 16:37:28', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-29 23:37:28', '2022-09-29 23:37:28'),
(2969, NULL, 2, '2022-09-29 16:37:38', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-29 23:37:38', '2022-09-29 23:37:38'),
(2970, NULL, 2, '2022-09-29 16:37:48', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-29 23:37:48', '2022-09-29 23:37:48'),
(2971, NULL, 2, '2022-09-29 16:37:58', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-29 23:37:58', '2022-09-29 23:37:58'),
(2972, NULL, 2, '2022-09-29 16:38:08', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-29 23:38:08', '2022-09-29 23:38:08'),
(2973, NULL, 2, '2022-09-29 16:38:18', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-29 23:38:18', '2022-09-29 23:38:18'),
(2974, NULL, 2, '2022-09-29 16:38:28', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-29 23:38:28', '2022-09-29 23:38:28'),
(2975, NULL, 2, '2022-09-29 16:38:38', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-29 23:38:38', '2022-09-29 23:38:38'),
(2976, NULL, 2, '2022-09-29 16:38:48', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-29 23:38:48', '2022-09-29 23:38:48'),
(2977, NULL, 2, '2022-09-29 16:38:58', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-29 23:38:58', '2022-09-29 23:38:58'),
(2978, NULL, 2, '2022-09-29 16:39:08', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-29 23:39:08', '2022-09-29 23:39:08'),
(2979, NULL, 2, '2022-09-29 16:39:18', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-29 23:39:18', '2022-09-29 23:39:18'),
(2980, NULL, 2, '2022-09-29 16:39:28', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-29 23:39:28', '2022-09-29 23:39:28'),
(2981, NULL, 2, '2022-09-29 16:39:38', '104.5607259', '32.3532992', 'Unknown Location Found', '2022-09-29 23:39:38', '2022-09-29 23:39:38'),
(2982, NULL, 2, '2022-09-29 16:39:48', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-29 23:39:48', '2022-09-29 23:39:48'),
(2983, NULL, 2, '2022-09-29 16:40:03', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-29 23:40:03', '2022-09-29 23:40:03'),
(2984, NULL, 2, '2022-09-29 16:40:13', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-29 23:40:13', '2022-09-29 23:40:13'),
(2985, NULL, 2, '2022-09-29 16:40:30', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-29 23:40:30', '2022-09-29 23:40:30'),
(2986, NULL, 2, '2022-09-29 16:40:40', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-29 23:40:40', '2022-09-29 23:40:40'),
(2987, NULL, 2, '2022-09-29 16:40:50', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-29 23:40:50', '2022-09-29 23:40:50'),
(2988, NULL, 2, '2022-09-29 16:41:00', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-29 23:41:00', '2022-09-29 23:41:00'),
(2989, NULL, 2, '2022-09-29 16:41:09', '104.5607251', '32.3532993', 'Unknown Location Found', '2022-09-29 23:41:09', '2022-09-29 23:41:09'),
(2990, NULL, 2, '2022-09-29 16:41:20', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-29 23:41:20', '2022-09-29 23:41:20'),
(2991, NULL, 2, '2022-09-29 16:41:30', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-29 23:41:30', '2022-09-29 23:41:30'),
(2992, NULL, 2, '2022-09-29 16:41:40', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-29 23:41:40', '2022-09-29 23:41:40'),
(2993, NULL, 2, '2022-09-29 16:41:50', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-29 23:41:50', '2022-09-29 23:41:50'),
(2994, NULL, 2, '2022-09-29 16:42:00', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-29 23:42:00', '2022-09-29 23:42:00'),
(2995, NULL, 2, '2022-09-29 16:42:10', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-29 23:42:10', '2022-09-29 23:42:10'),
(2996, NULL, 2, '2022-09-29 16:42:20', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-29 23:42:20', '2022-09-29 23:42:20'),
(2997, NULL, 2, '2022-09-29 16:42:30', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-29 23:42:30', '2022-09-29 23:42:30'),
(2998, NULL, 2, '2022-09-29 16:42:40', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-29 23:42:40', '2022-09-29 23:42:40'),
(2999, NULL, 2, '2022-09-29 16:42:50', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-29 23:42:50', '2022-09-29 23:42:50'),
(3000, NULL, 2, '2022-09-29 16:43:00', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-29 23:43:00', '2022-09-29 23:43:00'),
(3001, NULL, 2, '2022-09-29 16:43:10', '104.5607259', '32.3532992', 'Unknown Location Found', '2022-09-29 23:43:10', '2022-09-29 23:43:10'),
(3002, NULL, 2, '2022-09-29 16:43:24', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-29 23:43:24', '2022-09-29 23:43:24'),
(3003, NULL, 2, '2022-09-29 16:43:30', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-29 23:43:30', '2022-09-29 23:43:30'),
(3004, NULL, 2, '2022-09-29 16:43:40', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-29 23:43:40', '2022-09-29 23:43:40'),
(3005, NULL, 2, '2022-09-29 16:43:50', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-29 23:43:50', '2022-09-29 23:43:50'),
(3006, NULL, 2, '2022-09-29 16:44:00', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-29 23:44:00', '2022-09-29 23:44:00'),
(3007, NULL, 2, '2022-09-29 16:44:10', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-29 23:44:10', '2022-09-29 23:44:10'),
(3008, NULL, 2, '2022-09-29 16:44:20', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-29 23:44:20', '2022-09-29 23:44:20'),
(3009, NULL, 2, '2022-09-29 16:44:30', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-29 23:44:30', '2022-09-29 23:44:30'),
(3010, NULL, 2, '2022-09-29 16:44:40', '104.5607259', '32.3532985', 'Unknown Location Found', '2022-09-29 23:44:40', '2022-09-29 23:44:40'),
(3011, NULL, 2, '2022-09-29 16:44:50', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-29 23:44:50', '2022-09-29 23:44:50'),
(3012, NULL, 2, '2022-09-29 16:45:00', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-29 23:45:00', '2022-09-29 23:45:00'),
(3013, NULL, 2, '2022-09-29 16:45:10', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-29 23:45:10', '2022-09-29 23:45:10'),
(3014, NULL, 2, '2022-09-29 16:45:20', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-29 23:45:20', '2022-09-29 23:45:20'),
(3015, NULL, 2, '2022-09-29 16:45:30', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-29 23:45:30', '2022-09-29 23:45:30'),
(3016, NULL, 2, '2022-09-29 16:45:40', '104.5607255', '32.3532983', 'Unknown Location Found', '2022-09-29 23:45:40', '2022-09-29 23:45:40'),
(3017, NULL, 2, '2022-09-29 16:45:50', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-29 23:45:50', '2022-09-29 23:45:50'),
(3018, NULL, 2, '2022-09-29 16:45:59', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-29 23:45:59', '2022-09-29 23:45:59'),
(3019, NULL, 2, '2022-09-29 16:46:10', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-29 23:46:10', '2022-09-29 23:46:10'),
(3020, NULL, 2, '2022-09-29 16:46:20', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-29 23:46:20', '2022-09-29 23:46:20'),
(3021, NULL, 2, '2022-09-29 16:46:30', '104.5607259', '32.3532987', 'Unknown Location Found', '2022-09-29 23:46:30', '2022-09-29 23:46:30'),
(3022, NULL, 2, '2022-09-29 16:46:40', '104.5607255', '32.3532983', 'Unknown Location Found', '2022-09-29 23:46:40', '2022-09-29 23:46:40'),
(3023, NULL, 2, '2022-09-29 16:46:49', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-29 23:46:49', '2022-09-29 23:46:49'),
(3024, NULL, 2, '2022-09-29 16:46:59', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-29 23:46:59', '2022-09-29 23:46:59'),
(3025, NULL, 2, '2022-09-29 16:47:10', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-29 23:47:10', '2022-09-29 23:47:10'),
(3026, NULL, 2, '2022-09-29 16:47:29', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-29 23:47:29', '2022-09-29 23:47:29'),
(3027, NULL, 2, '2022-09-29 16:47:39', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-29 23:47:39', '2022-09-29 23:47:39'),
(3028, NULL, 2, '2022-09-29 16:47:49', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-29 23:47:49', '2022-09-29 23:47:49'),
(3029, NULL, 2, '2022-09-29 16:47:59', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-29 23:47:59', '2022-09-29 23:47:59'),
(3030, NULL, 2, '2022-09-29 16:48:09', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-29 23:48:09', '2022-09-29 23:48:09'),
(3031, NULL, 2, '2022-09-29 17:22:55', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-30 00:22:55', '2022-09-30 00:22:55'),
(3032, NULL, 2, '2022-09-29 17:23:05', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-30 00:23:05', '2022-09-30 00:23:05'),
(3033, NULL, 2, '2022-09-29 17:23:17', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-30 00:23:17', '2022-09-30 00:23:17'),
(3034, NULL, 2, '2022-09-29 17:23:27', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-30 00:23:27', '2022-09-30 00:23:27'),
(3035, NULL, 2, '2022-09-29 17:23:37', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 00:23:37', '2022-09-30 00:23:37'),
(3036, NULL, 2, '2022-09-29 17:23:47', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 00:23:47', '2022-09-30 00:23:47'),
(3037, NULL, 2, '2022-09-29 17:23:57', '104.5607253', '32.3532993', 'Unknown Location Found', '2022-09-30 00:23:57', '2022-09-30 00:23:57'),
(3038, NULL, 2, '2022-09-29 17:24:07', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-30 00:24:07', '2022-09-30 00:24:07'),
(3039, NULL, 2, '2022-09-29 17:24:17', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 00:24:17', '2022-09-30 00:24:17'),
(3040, NULL, 2, '2022-09-29 17:24:27', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 00:24:27', '2022-09-30 00:24:27'),
(3041, NULL, 2, '2022-09-29 17:24:40', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 00:24:40', '2022-09-30 00:24:40'),
(3042, NULL, 2, '2022-09-29 17:24:50', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-30 00:24:50', '2022-09-30 00:24:50'),
(3043, NULL, 2, '2022-09-29 17:25:00', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 00:25:00', '2022-09-30 00:25:00'),
(3044, NULL, 2, '2022-09-29 17:25:10', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 00:25:10', '2022-09-30 00:25:10'),
(3045, NULL, 2, '2022-09-29 17:25:20', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 00:25:20', '2022-09-30 00:25:20'),
(3046, NULL, 2, '2022-09-29 17:25:34', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 00:25:34', '2022-09-30 00:25:34'),
(3047, NULL, 2, '2022-09-29 17:25:44', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 00:25:44', '2022-09-30 00:25:44'),
(3048, NULL, 2, '2022-09-29 17:25:54', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-30 00:25:54', '2022-09-30 00:25:54'),
(3049, NULL, 2, '2022-09-29 17:26:04', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-30 00:26:04', '2022-09-30 00:26:04'),
(3050, NULL, 2, '2022-09-29 17:26:14', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 00:26:14', '2022-09-30 00:26:14'),
(3051, NULL, 2, '2022-09-29 17:26:24', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-30 00:26:24', '2022-09-30 00:26:24'),
(3052, NULL, 2, '2022-09-29 17:26:34', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 00:26:34', '2022-09-30 00:26:34'),
(3053, NULL, 2, '2022-09-29 17:26:58', '104.5607251', '32.3532982', 'Unknown Location Found', '2022-09-30 00:26:58', '2022-09-30 00:26:58'),
(3054, NULL, 2, '2022-09-29 17:27:17', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 00:27:17', '2022-09-30 00:27:17'),
(3055, NULL, 2, '2022-09-29 17:27:27', '104.5607259', '32.3532988', 'Unknown Location Found', '2022-09-30 00:27:27', '2022-09-30 00:27:27'),
(3056, NULL, 2, '2022-09-29 17:27:37', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 00:27:37', '2022-09-30 00:27:37'),
(3057, NULL, 2, '2022-09-29 17:27:47', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-30 00:27:47', '2022-09-30 00:27:47'),
(3058, NULL, 2, '2022-09-29 17:27:57', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 00:27:57', '2022-09-30 00:27:57'),
(3059, NULL, 2, '2022-09-29 17:28:07', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 00:28:07', '2022-09-30 00:28:07'),
(3060, NULL, 2, '2022-09-29 17:28:17', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 00:28:17', '2022-09-30 00:28:17'),
(3061, NULL, 2, '2022-09-29 17:28:27', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 00:28:27', '2022-09-30 00:28:27'),
(3062, NULL, 2, '2022-09-29 17:28:46', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 00:28:46', '2022-09-30 00:28:46'),
(3063, NULL, 2, '2022-09-29 17:28:56', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-30 00:28:56', '2022-09-30 00:28:56'),
(3064, NULL, 2, '2022-09-29 17:29:06', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 00:29:06', '2022-09-30 00:29:06'),
(3065, NULL, 2, '2022-09-29 17:29:16', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-30 00:29:16', '2022-09-30 00:29:16'),
(3066, NULL, 2, '2022-09-29 17:29:26', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 00:29:26', '2022-09-30 00:29:26'),
(3067, NULL, 2, '2022-09-29 17:29:36', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 00:29:36', '2022-09-30 00:29:36'),
(3068, NULL, 2, '2022-09-29 17:29:54', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-30 00:29:54', '2022-09-30 00:29:54'),
(3069, NULL, 2, '2022-09-29 17:29:56', '104.5607251', '32.3532992', 'Unknown Location Found', '2022-09-30 00:29:56', '2022-09-30 00:29:56'),
(3070, NULL, 2, '2022-09-29 17:30:06', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-30 00:30:06', '2022-09-30 00:30:06'),
(3071, NULL, 2, '2022-09-29 17:30:26', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 00:30:26', '2022-09-30 00:30:26'),
(3072, NULL, 2, '2022-09-29 17:30:36', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 00:30:36', '2022-09-30 00:30:36'),
(3073, NULL, 2, '2022-09-29 17:30:46', '104.5607259', '32.3532984', 'Unknown Location Found', '2022-09-30 00:30:46', '2022-09-30 00:30:46'),
(3074, NULL, 2, '2022-09-29 17:30:56', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 00:30:56', '2022-09-30 00:30:56'),
(3075, NULL, 2, '2022-09-29 17:32:39', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 00:32:39', '2022-09-30 00:32:39'),
(3076, NULL, 2, '2022-09-29 17:33:05', '104.560725', '32.3532988', 'Unknown Location Found', '2022-09-30 00:33:05', '2022-09-30 00:33:05'),
(3077, NULL, 2, '2022-09-29 17:33:15', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 00:33:15', '2022-09-30 00:33:15'),
(3078, NULL, 2, '2022-09-30 08:29:46', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 15:29:46', '2022-09-30 15:29:46'),
(3079, NULL, 2, '2022-09-30 08:29:56', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-30 15:29:56', '2022-09-30 15:29:56'),
(3080, NULL, 2, '2022-09-30 08:30:06', '104.5607256', '32.3532983', 'Unknown Location Found', '2022-09-30 15:30:06', '2022-09-30 15:30:06'),
(3081, NULL, 2, '2022-09-30 08:30:16', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 15:30:16', '2022-09-30 15:30:16'),
(3082, NULL, 2, '2022-09-30 08:30:26', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 15:30:26', '2022-09-30 15:30:26'),
(3083, NULL, 2, '2022-09-30 08:30:36', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-30 15:30:36', '2022-09-30 15:30:36'),
(3084, NULL, 2, '2022-09-30 08:30:46', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 15:30:46', '2022-09-30 15:30:46'),
(3085, NULL, 2, '2022-09-30 08:30:56', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 15:30:56', '2022-09-30 15:30:56'),
(3086, NULL, 2, '2022-09-30 08:31:06', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 15:31:06', '2022-09-30 15:31:06'),
(3087, NULL, 2, '2022-09-30 08:31:16', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 15:31:16', '2022-09-30 15:31:16'),
(3088, NULL, 2, '2022-09-30 08:31:26', '104.5607259', '32.3532991', 'Unknown Location Found', '2022-09-30 15:31:26', '2022-09-30 15:31:26'),
(3089, NULL, 2, '2022-09-30 08:31:36', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 15:31:36', '2022-09-30 15:31:36'),
(3090, NULL, 2, '2022-09-30 08:31:46', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 15:31:46', '2022-09-30 15:31:46'),
(3091, NULL, 2, '2022-09-30 08:31:56', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 15:31:56', '2022-09-30 15:31:56'),
(3092, NULL, 2, '2022-09-30 08:32:06', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 15:32:06', '2022-09-30 15:32:06'),
(3093, NULL, 2, '2022-09-30 08:32:16', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 15:32:16', '2022-09-30 15:32:16'),
(3094, NULL, 2, '2022-09-30 08:32:26', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-30 15:32:26', '2022-09-30 15:32:26'),
(3095, NULL, 2, '2022-09-30 08:32:36', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 15:32:36', '2022-09-30 15:32:36'),
(3096, NULL, 2, '2022-09-30 08:32:46', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 15:32:46', '2022-09-30 15:32:46'),
(3097, NULL, 2, '2022-09-30 08:32:56', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-30 15:32:56', '2022-09-30 15:32:56'),
(3098, NULL, 2, '2022-09-30 08:33:06', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-30 15:33:06', '2022-09-30 15:33:06'),
(3099, NULL, 2, '2022-09-30 08:33:16', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-30 15:33:16', '2022-09-30 15:33:16'),
(3100, NULL, 2, '2022-09-30 08:33:26', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-30 15:33:26', '2022-09-30 15:33:26'),
(3101, NULL, 2, '2022-09-30 08:33:36', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 15:33:36', '2022-09-30 15:33:36'),
(3102, NULL, 2, '2022-09-30 08:33:46', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 15:33:46', '2022-09-30 15:33:46'),
(3103, NULL, 2, '2022-09-30 08:34:11', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 15:34:11', '2022-09-30 15:34:11'),
(3104, NULL, 2, '2022-09-30 08:34:22', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 15:34:22', '2022-09-30 15:34:22'),
(3105, NULL, 2, '2022-09-30 08:34:35', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-30 15:34:35', '2022-09-30 15:34:35'),
(3106, NULL, 2, '2022-09-30 08:34:45', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 15:34:45', '2022-09-30 15:34:45'),
(3107, NULL, 2, '2022-09-30 08:34:55', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 15:34:55', '2022-09-30 15:34:55'),
(3108, NULL, 2, '2022-09-30 08:35:05', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 15:35:05', '2022-09-30 15:35:05'),
(3109, NULL, 2, '2022-09-30 08:35:15', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-30 15:35:15', '2022-09-30 15:35:15'),
(3110, NULL, 2, '2022-09-30 08:35:25', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 15:35:25', '2022-09-30 15:35:25'),
(3111, NULL, 2, '2022-09-30 08:35:35', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 15:35:35', '2022-09-30 15:35:35'),
(3112, NULL, 2, '2022-09-30 08:35:45', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 15:35:45', '2022-09-30 15:35:45'),
(3113, NULL, 2, '2022-09-30 08:35:55', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 15:35:55', '2022-09-30 15:35:55'),
(3114, NULL, 2, '2022-09-30 08:36:06', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-30 15:36:06', '2022-09-30 15:36:06'),
(3115, NULL, 2, '2022-09-30 08:36:19', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 15:36:19', '2022-09-30 15:36:19'),
(3116, NULL, 2, '2022-09-30 08:36:29', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-30 15:36:29', '2022-09-30 15:36:29'),
(3117, NULL, 2, '2022-09-30 08:36:39', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-30 15:36:39', '2022-09-30 15:36:39'),
(3118, NULL, 2, '2022-09-30 08:36:49', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 15:36:49', '2022-09-30 15:36:49'),
(3119, NULL, 2, '2022-09-30 08:36:59', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 15:36:59', '2022-09-30 15:36:59'),
(3120, NULL, 2, '2022-09-30 08:37:09', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 15:37:09', '2022-09-30 15:37:09'),
(3121, NULL, 2, '2022-09-30 08:37:19', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 15:37:19', '2022-09-30 15:37:19'),
(3122, NULL, 2, '2022-09-30 08:37:29', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 15:37:29', '2022-09-30 15:37:29'),
(3123, NULL, 2, '2022-09-30 08:37:39', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-30 15:37:39', '2022-09-30 15:37:39'),
(3124, NULL, 2, '2022-09-30 08:37:49', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 15:37:49', '2022-09-30 15:37:49'),
(3125, NULL, 2, '2022-09-30 08:37:59', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 15:37:59', '2022-09-30 15:37:59'),
(3126, NULL, 2, '2022-09-30 08:38:09', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 15:38:09', '2022-09-30 15:38:09'),
(3127, NULL, 2, '2022-09-30 08:38:19', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 15:38:19', '2022-09-30 15:38:19'),
(3128, NULL, 2, '2022-09-30 08:38:29', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 15:38:29', '2022-09-30 15:38:29'),
(3129, NULL, 2, '2022-09-30 08:38:39', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 15:38:39', '2022-09-30 15:38:39'),
(3130, NULL, 2, '2022-09-30 08:38:49', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-30 15:38:49', '2022-09-30 15:38:49'),
(3131, NULL, 2, '2022-09-30 08:38:59', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 15:38:59', '2022-09-30 15:38:59'),
(3132, NULL, 2, '2022-09-30 08:39:11', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 15:39:11', '2022-09-30 15:39:11'),
(3133, NULL, 2, '2022-09-30 08:39:21', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-30 15:39:21', '2022-09-30 15:39:21'),
(3134, NULL, 2, '2022-09-30 08:39:38', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 15:39:38', '2022-09-30 15:39:38'),
(3135, NULL, 2, '2022-09-30 08:39:48', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 15:39:48', '2022-09-30 15:39:48'),
(3136, NULL, 2, '2022-09-30 08:39:58', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 15:39:58', '2022-09-30 15:39:58'),
(3137, NULL, 2, '2022-09-30 08:40:08', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-30 15:40:08', '2022-09-30 15:40:08'),
(3138, NULL, 2, '2022-09-30 08:40:18', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 15:40:18', '2022-09-30 15:40:18'),
(3139, NULL, 2, '2022-09-30 08:40:28', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-30 15:40:28', '2022-09-30 15:40:28'),
(3140, NULL, 2, '2022-09-30 08:40:38', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 15:40:38', '2022-09-30 15:40:38'),
(3141, NULL, 2, '2022-09-30 08:40:48', '104.5607259', '32.3532989', 'Unknown Location Found', '2022-09-30 15:40:48', '2022-09-30 15:40:48'),
(3142, NULL, 2, '2022-09-30 08:41:03', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-30 15:41:03', '2022-09-30 15:41:03'),
(3143, NULL, 2, '2022-09-30 08:41:13', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 15:41:13', '2022-09-30 15:41:13'),
(3144, NULL, 2, '2022-09-30 08:41:23', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 15:41:23', '2022-09-30 15:41:23'),
(3145, NULL, 2, '2022-09-30 08:41:33', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 15:41:33', '2022-09-30 15:41:33'),
(3146, NULL, 2, '2022-09-30 08:41:43', '104.5607258', '32.3532993', 'Unknown Location Found', '2022-09-30 15:41:43', '2022-09-30 15:41:43'),
(3147, NULL, 2, '2022-09-30 08:41:53', '104.5607259', '32.3532991', 'Unknown Location Found', '2022-09-30 15:41:53', '2022-09-30 15:41:53'),
(3148, NULL, 2, '2022-09-30 08:42:03', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 15:42:03', '2022-09-30 15:42:03');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(3149, NULL, 2, '2022-09-30 08:42:13', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 15:42:13', '2022-09-30 15:42:13'),
(3150, NULL, 2, '2022-09-30 08:42:23', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 15:42:23', '2022-09-30 15:42:23'),
(3151, NULL, 2, '2022-09-30 08:42:33', '104.560725', '32.3532989', 'Unknown Location Found', '2022-09-30 15:42:33', '2022-09-30 15:42:33'),
(3152, NULL, 2, '2022-09-30 08:42:43', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-30 15:42:43', '2022-09-30 15:42:43'),
(3153, NULL, 2, '2022-09-30 08:42:53', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 15:42:53', '2022-09-30 15:42:53'),
(3154, NULL, 2, '2022-09-30 08:43:03', '104.5607259', '32.3532989', 'Unknown Location Found', '2022-09-30 15:43:03', '2022-09-30 15:43:03'),
(3155, NULL, 2, '2022-09-30 08:43:13', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 15:43:13', '2022-09-30 15:43:13'),
(3156, NULL, 2, '2022-09-30 08:43:23', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 15:43:23', '2022-09-30 15:43:23'),
(3157, NULL, 2, '2022-09-30 08:43:33', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 15:43:33', '2022-09-30 15:43:33'),
(3158, NULL, 2, '2022-09-30 08:43:43', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 15:43:43', '2022-09-30 15:43:43'),
(3159, NULL, 2, '2022-09-30 08:43:53', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 15:43:53', '2022-09-30 15:43:53'),
(3160, NULL, 2, '2022-09-30 08:44:03', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-30 15:44:03', '2022-09-30 15:44:03'),
(3161, NULL, 2, '2022-09-30 08:44:13', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 15:44:13', '2022-09-30 15:44:13'),
(3162, NULL, 2, '2022-09-30 08:44:27', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 15:44:27', '2022-09-30 15:44:27'),
(3163, NULL, 2, '2022-09-30 08:44:37', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 15:44:37', '2022-09-30 15:44:37'),
(3164, NULL, 2, '2022-09-30 08:44:47', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-30 15:44:47', '2022-09-30 15:44:47'),
(3165, NULL, 2, '2022-09-30 08:44:57', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 15:44:57', '2022-09-30 15:44:57'),
(3166, NULL, 2, '2022-09-30 08:45:07', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 15:45:07', '2022-09-30 15:45:07'),
(3167, NULL, 2, '2022-09-30 08:45:17', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 15:45:17', '2022-09-30 15:45:17'),
(3168, NULL, 2, '2022-09-30 08:45:27', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-30 15:45:27', '2022-09-30 15:45:27'),
(3169, NULL, 2, '2022-09-30 08:45:37', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-30 15:45:37', '2022-09-30 15:45:37'),
(3170, NULL, 2, '2022-09-30 08:45:47', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 15:45:47', '2022-09-30 15:45:47'),
(3171, NULL, 2, '2022-09-30 08:45:57', '104.5607259', '32.3532984', 'Unknown Location Found', '2022-09-30 15:45:57', '2022-09-30 15:45:57'),
(3172, NULL, 2, '2022-09-30 08:46:07', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-30 15:46:07', '2022-09-30 15:46:07'),
(3173, NULL, 2, '2022-09-30 08:46:17', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-30 15:46:17', '2022-09-30 15:46:17'),
(3174, NULL, 2, '2022-09-30 08:46:27', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 15:46:27', '2022-09-30 15:46:27'),
(3175, NULL, 2, '2022-09-30 08:46:37', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 15:46:37', '2022-09-30 15:46:37'),
(3176, NULL, 2, '2022-09-30 08:46:47', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 15:46:47', '2022-09-30 15:46:47'),
(3177, NULL, 2, '2022-09-30 08:46:57', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 15:46:57', '2022-09-30 15:46:57'),
(3178, NULL, 2, '2022-09-30 08:47:07', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 15:47:07', '2022-09-30 15:47:07'),
(3179, NULL, 2, '2022-09-30 08:47:20', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-30 15:47:20', '2022-09-30 15:47:20'),
(3180, NULL, 2, '2022-09-30 08:47:30', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-30 15:47:30', '2022-09-30 15:47:30'),
(3181, NULL, 2, '2022-09-30 08:47:40', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 15:47:40', '2022-09-30 15:47:40'),
(3182, NULL, 2, '2022-09-30 08:47:50', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 15:47:50', '2022-09-30 15:47:50'),
(3183, NULL, 2, '2022-09-30 08:48:01', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-30 15:48:01', '2022-09-30 15:48:01'),
(3184, NULL, 2, '2022-09-30 08:48:25', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-30 15:48:25', '2022-09-30 15:48:25'),
(3185, NULL, 2, '2022-09-30 08:48:35', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 15:48:35', '2022-09-30 15:48:35'),
(3186, NULL, 2, '2022-09-30 08:48:47', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 15:48:47', '2022-09-30 15:48:47'),
(3187, NULL, 2, '2022-09-30 08:48:57', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 15:48:57', '2022-09-30 15:48:57'),
(3188, NULL, 2, '2022-09-30 08:49:07', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-30 15:49:07', '2022-09-30 15:49:07'),
(3189, NULL, 2, '2022-09-30 08:49:26', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 15:49:26', '2022-09-30 15:49:26'),
(3190, NULL, 2, '2022-09-30 08:49:36', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-30 15:49:36', '2022-09-30 15:49:36'),
(3191, NULL, 2, '2022-09-30 08:49:46', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-30 15:49:46', '2022-09-30 15:49:46'),
(3192, NULL, 2, '2022-09-30 08:49:56', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 15:49:56', '2022-09-30 15:49:56'),
(3193, NULL, 2, '2022-09-30 08:50:06', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 15:50:06', '2022-09-30 15:50:06'),
(3194, NULL, 2, '2022-09-30 08:50:16', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 15:50:16', '2022-09-30 15:50:16'),
(3195, NULL, 2, '2022-09-30 08:50:33', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 15:50:33', '2022-09-30 15:50:33'),
(3196, NULL, 2, '2022-09-30 08:50:52', '104.560725', '32.3532984', 'Unknown Location Found', '2022-09-30 15:50:52', '2022-09-30 15:50:52'),
(3197, NULL, 2, '2022-09-30 08:51:16', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 15:51:16', '2022-09-30 15:51:16'),
(3198, NULL, 2, '2022-09-30 08:51:34', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 15:51:34', '2022-09-30 15:51:34'),
(3199, NULL, 2, '2022-09-30 08:51:44', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 15:51:44', '2022-09-30 15:51:44'),
(3200, NULL, 2, '2022-09-30 08:52:08', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 15:52:08', '2022-09-30 15:52:08'),
(3201, NULL, 2, '2022-09-30 08:52:18', '104.5607259', '32.3532992', 'Unknown Location Found', '2022-09-30 15:52:18', '2022-09-30 15:52:18'),
(3202, NULL, 2, '2022-09-30 08:52:28', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 15:52:28', '2022-09-30 15:52:28'),
(3203, NULL, 2, '2022-09-30 08:52:38', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-30 15:52:38', '2022-09-30 15:52:38'),
(3204, NULL, 2, '2022-09-30 08:53:03', '104.560725', '32.3532988', 'Unknown Location Found', '2022-09-30 15:53:03', '2022-09-30 15:53:03'),
(3205, NULL, 2, '2022-09-30 08:53:13', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 15:53:13', '2022-09-30 15:53:13'),
(3206, NULL, 2, '2022-09-30 08:53:23', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 15:53:23', '2022-09-30 15:53:23'),
(3207, NULL, 2, '2022-09-30 08:53:33', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 15:53:33', '2022-09-30 15:53:33'),
(3208, NULL, 2, '2022-09-30 08:53:43', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-30 15:53:43', '2022-09-30 15:53:43'),
(3209, NULL, 2, '2022-09-30 08:53:53', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 15:53:53', '2022-09-30 15:53:53'),
(3210, NULL, 2, '2022-09-30 08:54:12', '104.560725', '32.3532989', 'Unknown Location Found', '2022-09-30 15:54:12', '2022-09-30 15:54:12'),
(3211, NULL, 2, '2022-09-30 08:54:22', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-30 15:54:22', '2022-09-30 15:54:22'),
(3212, NULL, 2, '2022-09-30 08:54:32', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 15:54:32', '2022-09-30 15:54:32'),
(3213, NULL, 2, '2022-09-30 08:54:43', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 15:54:43', '2022-09-30 15:54:43'),
(3214, NULL, 2, '2022-09-30 08:55:03', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 15:55:03', '2022-09-30 15:55:03'),
(3215, NULL, 2, '2022-09-30 08:55:13', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 15:55:13', '2022-09-30 15:55:13'),
(3216, NULL, 2, '2022-09-30 08:55:23', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-30 15:55:23', '2022-09-30 15:55:23'),
(3217, NULL, 2, '2022-09-30 08:55:33', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 15:55:33', '2022-09-30 15:55:33'),
(3218, NULL, 2, '2022-09-30 08:55:43', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 15:55:43', '2022-09-30 15:55:43'),
(3219, NULL, 2, '2022-09-30 08:55:53', '104.5607259', '32.3532984', 'Unknown Location Found', '2022-09-30 15:55:53', '2022-09-30 15:55:53'),
(3220, NULL, 2, '2022-09-30 08:56:06', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 15:56:06', '2022-09-30 15:56:06'),
(3221, NULL, 2, '2022-09-30 08:56:16', '104.5607259', '32.3532992', 'Unknown Location Found', '2022-09-30 15:56:16', '2022-09-30 15:56:16'),
(3222, NULL, 2, '2022-09-30 08:56:26', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-30 15:56:26', '2022-09-30 15:56:26'),
(3223, NULL, 2, '2022-09-30 08:56:46', '104.5607253', '32.3532982', 'Unknown Location Found', '2022-09-30 15:56:46', '2022-09-30 15:56:46'),
(3224, NULL, 2, '2022-09-30 08:56:56', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 15:56:56', '2022-09-30 15:56:56'),
(3225, NULL, 2, '2022-09-30 08:57:06', '104.5607259', '32.353299', 'Unknown Location Found', '2022-09-30 15:57:06', '2022-09-30 15:57:06'),
(3226, NULL, 2, '2022-09-30 08:57:16', '104.5607252', '32.3532989', 'Unknown Location Found', '2022-09-30 15:57:16', '2022-09-30 15:57:16'),
(3227, NULL, 2, '2022-09-30 08:57:26', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-30 15:57:26', '2022-09-30 15:57:26'),
(3228, NULL, 2, '2022-09-30 08:57:36', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 15:57:36', '2022-09-30 15:57:36'),
(3229, NULL, 2, '2022-09-30 08:57:47', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 15:57:47', '2022-09-30 15:57:47'),
(3230, NULL, 2, '2022-09-30 08:57:58', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 15:57:58', '2022-09-30 15:57:58'),
(3231, NULL, 2, '2022-09-30 08:58:08', '104.5607259', '32.3532991', 'Unknown Location Found', '2022-09-30 15:58:08', '2022-09-30 15:58:08'),
(3232, NULL, 2, '2022-09-30 08:58:18', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-30 15:58:18', '2022-09-30 15:58:18'),
(3233, NULL, 2, '2022-09-30 08:58:28', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-30 15:58:28', '2022-09-30 15:58:28'),
(3234, NULL, 2, '2022-09-30 08:58:58', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 15:58:58', '2022-09-30 15:58:58'),
(3235, NULL, 2, '2022-09-30 08:59:08', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 15:59:08', '2022-09-30 15:59:08'),
(3236, NULL, 2, '2022-09-30 08:59:18', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 15:59:18', '2022-09-30 15:59:18'),
(3237, NULL, 2, '2022-09-30 08:59:49', '104.5607251', '32.3532987', 'Unknown Location Found', '2022-09-30 15:59:49', '2022-09-30 15:59:49'),
(3238, NULL, 2, '2022-09-30 09:00:01', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 16:00:01', '2022-09-30 16:00:01'),
(3239, NULL, 2, '2022-09-30 09:00:09', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-30 16:00:09', '2022-09-30 16:00:09'),
(3240, NULL, 2, '2022-09-30 09:00:25', '104.5607259', '32.3532987', 'Unknown Location Found', '2022-09-30 16:00:25', '2022-09-30 16:00:25'),
(3241, NULL, 2, '2022-09-30 09:00:45', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 16:00:45', '2022-09-30 16:00:45'),
(3242, NULL, 2, '2022-09-30 09:01:14', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 16:01:14', '2022-09-30 16:01:14'),
(3243, NULL, 2, '2022-09-30 09:01:25', '104.5607252', '32.3532993', 'Unknown Location Found', '2022-09-30 16:01:25', '2022-09-30 16:01:25'),
(3244, NULL, 2, '2022-09-30 09:01:34', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 16:01:34', '2022-09-30 16:01:34'),
(3245, NULL, 2, '2022-09-30 09:01:44', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 16:01:44', '2022-09-30 16:01:44'),
(3246, NULL, 2, '2022-09-30 09:01:54', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 16:01:54', '2022-09-30 16:01:54'),
(3247, NULL, 2, '2022-09-30 09:02:04', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 16:02:04', '2022-09-30 16:02:04'),
(3248, NULL, 2, '2022-09-30 09:02:14', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 16:02:14', '2022-09-30 16:02:14'),
(3249, NULL, 2, '2022-09-30 09:02:26', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-30 16:02:26', '2022-09-30 16:02:26'),
(3250, NULL, 2, '2022-09-30 09:03:04', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 16:03:04', '2022-09-30 16:03:04'),
(3251, NULL, 2, '2022-09-30 09:03:16', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 16:03:16', '2022-09-30 16:03:16'),
(3252, NULL, 2, '2022-09-30 09:03:24', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 16:03:24', '2022-09-30 16:03:24'),
(3253, NULL, 2, '2022-09-30 09:03:34', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:03:34', '2022-09-30 16:03:34'),
(3254, NULL, 2, '2022-09-30 09:03:56', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 16:03:56', '2022-09-30 16:03:56'),
(3255, NULL, 2, '2022-09-30 09:04:05', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 16:04:05', '2022-09-30 16:04:05'),
(3256, NULL, 2, '2022-09-30 09:04:13', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 16:04:13', '2022-09-30 16:04:13'),
(3257, NULL, 2, '2022-09-30 09:04:24', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 16:04:24', '2022-09-30 16:04:24'),
(3258, NULL, 2, '2022-09-30 09:04:33', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-30 16:04:33', '2022-09-30 16:04:33'),
(3259, NULL, 2, '2022-09-30 09:04:45', '104.5607252', '32.3532993', 'Unknown Location Found', '2022-09-30 16:04:45', '2022-09-30 16:04:45'),
(3260, NULL, 2, '2022-09-30 09:04:53', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 16:04:53', '2022-09-30 16:04:53'),
(3261, NULL, 2, '2022-09-30 09:05:04', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-30 16:05:04', '2022-09-30 16:05:04'),
(3262, NULL, 2, '2022-09-30 09:05:29', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 16:05:29', '2022-09-30 16:05:29'),
(3263, NULL, 2, '2022-09-30 09:05:39', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-30 16:05:39', '2022-09-30 16:05:39'),
(3264, NULL, 2, '2022-09-30 09:05:49', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:05:49', '2022-09-30 16:05:49'),
(3265, NULL, 2, '2022-09-30 09:06:01', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 16:06:01', '2022-09-30 16:06:01'),
(3266, NULL, 2, '2022-09-30 09:06:09', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 16:06:09', '2022-09-30 16:06:09'),
(3267, NULL, 2, '2022-09-30 09:06:20', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 16:06:20', '2022-09-30 16:06:20'),
(3268, NULL, 2, '2022-09-30 09:06:29', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 16:06:29', '2022-09-30 16:06:29'),
(3269, NULL, 2, '2022-09-30 09:06:39', '104.5607251', '32.3532992', 'Unknown Location Found', '2022-09-30 16:06:39', '2022-09-30 16:06:39'),
(3270, NULL, 2, '2022-09-30 09:06:51', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 16:06:51', '2022-09-30 16:06:51'),
(3271, NULL, 2, '2022-09-30 09:07:01', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 16:07:01', '2022-09-30 16:07:01'),
(3272, NULL, 2, '2022-09-30 09:07:11', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-30 16:07:11', '2022-09-30 16:07:11'),
(3273, NULL, 2, '2022-09-30 09:07:20', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-30 16:07:20', '2022-09-30 16:07:20'),
(3274, NULL, 2, '2022-09-30 09:07:31', '104.5607255', '32.3532983', 'Unknown Location Found', '2022-09-30 16:07:31', '2022-09-30 16:07:31'),
(3275, NULL, 2, '2022-09-30 09:07:41', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-30 16:07:41', '2022-09-30 16:07:41'),
(3276, NULL, 2, '2022-09-30 09:07:51', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-30 16:07:51', '2022-09-30 16:07:51'),
(3277, NULL, 2, '2022-09-30 09:08:00', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-30 16:08:00', '2022-09-30 16:08:00'),
(3278, NULL, 2, '2022-09-30 09:08:11', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 16:08:11', '2022-09-30 16:08:11'),
(3279, NULL, 2, '2022-09-30 09:08:20', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:08:20', '2022-09-30 16:08:20'),
(3280, NULL, 2, '2022-09-30 09:08:30', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-30 16:08:30', '2022-09-30 16:08:30'),
(3281, NULL, 2, '2022-09-30 09:08:41', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 16:08:41', '2022-09-30 16:08:41'),
(3282, NULL, 2, '2022-09-30 09:08:50', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-30 16:08:50', '2022-09-30 16:08:50'),
(3283, NULL, 2, '2022-09-30 09:09:01', '104.5607251', '32.3532992', 'Unknown Location Found', '2022-09-30 16:09:01', '2022-09-30 16:09:01'),
(3284, NULL, 2, '2022-09-30 09:09:11', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:09:11', '2022-09-30 16:09:11'),
(3285, NULL, 2, '2022-09-30 09:09:20', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-30 16:09:20', '2022-09-30 16:09:20'),
(3286, NULL, 2, '2022-09-30 09:09:30', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:09:30', '2022-09-30 16:09:30'),
(3287, NULL, 2, '2022-09-30 09:09:41', '104.5607255', '32.3532983', 'Unknown Location Found', '2022-09-30 16:09:41', '2022-09-30 16:09:41'),
(3288, NULL, 2, '2022-09-30 09:09:50', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:09:50', '2022-09-30 16:09:50'),
(3289, NULL, 2, '2022-09-30 09:10:00', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-30 16:10:00', '2022-09-30 16:10:00'),
(3290, NULL, 2, '2022-09-30 09:10:10', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:10:10', '2022-09-30 16:10:10'),
(3291, NULL, 2, '2022-09-30 09:10:21', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:10:21', '2022-09-30 16:10:21'),
(3292, NULL, 2, '2022-09-30 09:10:31', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 16:10:31', '2022-09-30 16:10:31'),
(3293, NULL, 2, '2022-09-30 09:10:41', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-30 16:10:41', '2022-09-30 16:10:41'),
(3294, NULL, 2, '2022-09-30 09:10:51', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:10:51', '2022-09-30 16:10:51'),
(3295, NULL, 2, '2022-09-30 09:11:01', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 16:11:01', '2022-09-30 16:11:01'),
(3296, NULL, 2, '2022-09-30 09:11:11', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 16:11:11', '2022-09-30 16:11:11'),
(3297, NULL, 2, '2022-09-30 09:11:21', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-30 16:11:21', '2022-09-30 16:11:21'),
(3298, NULL, 2, '2022-09-30 09:11:31', '104.5607258', '32.3532993', 'Unknown Location Found', '2022-09-30 16:11:31', '2022-09-30 16:11:31'),
(3299, NULL, 2, '2022-09-30 09:11:41', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:11:41', '2022-09-30 16:11:41'),
(3300, NULL, 2, '2022-09-30 09:11:51', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 16:11:51', '2022-09-30 16:11:51'),
(3301, NULL, 2, '2022-09-30 09:12:01', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 16:12:01', '2022-09-30 16:12:01'),
(3302, NULL, 2, '2022-09-30 09:12:11', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 16:12:11', '2022-09-30 16:12:11'),
(3303, NULL, 2, '2022-09-30 09:12:21', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 16:12:21', '2022-09-30 16:12:21'),
(3304, NULL, 2, '2022-09-30 09:12:31', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 16:12:31', '2022-09-30 16:12:31'),
(3305, NULL, 2, '2022-09-30 09:12:41', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:12:41', '2022-09-30 16:12:41'),
(3306, NULL, 2, '2022-09-30 09:12:51', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:12:51', '2022-09-30 16:12:51'),
(3307, NULL, 2, '2022-09-30 09:13:02', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-30 16:13:02', '2022-09-30 16:13:02'),
(3308, NULL, 2, '2022-09-30 09:13:10', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 16:13:10', '2022-09-30 16:13:10'),
(3309, NULL, 2, '2022-09-30 09:13:22', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-30 16:13:22', '2022-09-30 16:13:22'),
(3310, NULL, 2, '2022-09-30 09:13:30', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:13:30', '2022-09-30 16:13:30'),
(3311, NULL, 2, '2022-09-30 09:14:10', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 16:14:10', '2022-09-30 16:14:10'),
(3312, NULL, 2, '2022-09-30 09:14:10', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 16:14:10', '2022-09-30 16:14:10'),
(3313, NULL, 2, '2022-09-30 09:14:12', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:14:12', '2022-09-30 16:14:12'),
(3314, NULL, 2, '2022-09-30 09:14:23', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 16:14:23', '2022-09-30 16:14:23'),
(3315, NULL, 2, '2022-09-30 09:14:31', '104.5607259', '32.3532988', 'Unknown Location Found', '2022-09-30 16:14:31', '2022-09-30 16:14:31'),
(3316, NULL, 2, '2022-09-30 09:14:41', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 16:14:41', '2022-09-30 16:14:41'),
(3317, NULL, 2, '2022-09-30 09:14:51', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 16:14:51', '2022-09-30 16:14:51'),
(3318, NULL, 2, '2022-09-30 09:15:01', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:15:01', '2022-09-30 16:15:01'),
(3319, NULL, 2, '2022-09-30 09:15:11', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:15:11', '2022-09-30 16:15:11'),
(3320, NULL, 2, '2022-09-30 09:15:21', '104.560725', '32.353299', 'Unknown Location Found', '2022-09-30 16:15:21', '2022-09-30 16:15:21'),
(3321, NULL, 2, '2022-09-30 09:15:30', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 16:15:30', '2022-09-30 16:15:30'),
(3322, NULL, 2, '2022-09-30 09:15:41', '104.5607259', '32.353299', 'Unknown Location Found', '2022-09-30 16:15:41', '2022-09-30 16:15:41'),
(3323, NULL, 2, '2022-09-30 09:15:51', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 16:15:51', '2022-09-30 16:15:51'),
(3324, NULL, 2, '2022-09-30 09:16:01', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-30 16:16:01', '2022-09-30 16:16:01'),
(3325, NULL, 2, '2022-09-30 09:16:11', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 16:16:11', '2022-09-30 16:16:11'),
(3326, NULL, 2, '2022-09-30 09:17:08', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 16:17:08', '2022-09-30 16:17:08'),
(3327, NULL, 2, '2022-09-30 09:17:17', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 16:17:17', '2022-09-30 16:17:17'),
(3328, NULL, 2, '2022-09-30 09:17:27', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:17:27', '2022-09-30 16:17:27'),
(3329, NULL, 2, '2022-09-30 09:17:37', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 16:17:37', '2022-09-30 16:17:37'),
(3330, NULL, 2, '2022-09-30 09:17:48', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-30 16:17:48', '2022-09-30 16:17:48'),
(3331, NULL, 2, '2022-09-30 09:17:58', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 16:17:58', '2022-09-30 16:17:58'),
(3332, NULL, 2, '2022-09-30 09:18:07', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-30 16:18:07', '2022-09-30 16:18:07'),
(3333, NULL, 2, '2022-09-30 09:18:17', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 16:18:17', '2022-09-30 16:18:17'),
(3334, NULL, 2, '2022-09-30 09:18:27', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 16:18:27', '2022-09-30 16:18:27'),
(3335, NULL, 2, '2022-09-30 09:18:37', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:18:37', '2022-09-30 16:18:37'),
(3336, NULL, 2, '2022-09-30 09:18:47', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 16:18:47', '2022-09-30 16:18:47'),
(3337, NULL, 2, '2022-09-30 09:18:58', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:18:58', '2022-09-30 16:18:58'),
(3338, NULL, 2, '2022-09-30 09:19:08', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 16:19:08', '2022-09-30 16:19:08'),
(3339, NULL, 2, '2022-09-30 09:19:18', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 16:19:18', '2022-09-30 16:19:18'),
(3340, NULL, 2, '2022-09-30 09:19:27', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:19:27', '2022-09-30 16:19:27'),
(3341, NULL, 2, '2022-09-30 09:19:37', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-30 16:19:37', '2022-09-30 16:19:37'),
(3342, NULL, 2, '2022-09-30 09:19:47', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 16:19:47', '2022-09-30 16:19:47'),
(3343, NULL, 2, '2022-09-30 09:19:58', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-30 16:19:58', '2022-09-30 16:19:58'),
(3344, NULL, 2, '2022-09-30 09:20:08', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 16:20:08', '2022-09-30 16:20:08'),
(3345, NULL, 2, '2022-09-30 09:20:17', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 16:20:17', '2022-09-30 16:20:17'),
(3346, NULL, 2, '2022-09-30 09:20:27', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 16:20:27', '2022-09-30 16:20:27'),
(3347, NULL, 2, '2022-09-30 09:20:37', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-30 16:20:37', '2022-09-30 16:20:37'),
(3348, NULL, 2, '2022-09-30 09:20:47', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 16:20:47', '2022-09-30 16:20:47'),
(3349, NULL, 2, '2022-09-30 09:20:58', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 16:20:58', '2022-09-30 16:20:58'),
(3350, NULL, 2, '2022-09-30 09:21:07', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-30 16:21:07', '2022-09-30 16:21:07'),
(3351, NULL, 2, '2022-09-30 09:21:18', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:21:18', '2022-09-30 16:21:18'),
(3352, NULL, 2, '2022-09-30 09:21:27', '104.560725', '32.353299', 'Unknown Location Found', '2022-09-30 16:21:27', '2022-09-30 16:21:27'),
(3353, NULL, 2, '2022-09-30 09:21:37', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-30 16:21:37', '2022-09-30 16:21:37'),
(3354, NULL, 2, '2022-09-30 09:21:47', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-30 16:21:47', '2022-09-30 16:21:47'),
(3355, NULL, 2, '2022-09-30 09:21:58', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-30 16:21:58', '2022-09-30 16:21:58'),
(3356, NULL, 2, '2022-09-30 09:22:07', '104.5607252', '32.3532989', 'Unknown Location Found', '2022-09-30 16:22:07', '2022-09-30 16:22:07'),
(3357, NULL, 2, '2022-09-30 09:22:17', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 16:22:17', '2022-09-30 16:22:17'),
(3358, NULL, 2, '2022-09-30 09:22:27', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-30 16:22:27', '2022-09-30 16:22:27'),
(3359, NULL, 2, '2022-09-30 09:22:37', '104.5607257', '32.3532993', 'Unknown Location Found', '2022-09-30 16:22:37', '2022-09-30 16:22:37'),
(3360, NULL, 2, '2022-09-30 09:22:48', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 16:22:48', '2022-09-30 16:22:48'),
(3361, NULL, 2, '2022-09-30 09:22:57', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-30 16:22:57', '2022-09-30 16:22:57'),
(3362, NULL, 2, '2022-09-30 09:23:07', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 16:23:07', '2022-09-30 16:23:07'),
(3363, NULL, 2, '2022-09-30 09:23:17', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:23:17', '2022-09-30 16:23:17'),
(3364, NULL, 2, '2022-09-30 09:23:28', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 16:23:28', '2022-09-30 16:23:28'),
(3365, NULL, 2, '2022-09-30 09:23:37', '104.5607259', '32.3532984', 'Unknown Location Found', '2022-09-30 16:23:37', '2022-09-30 16:23:37'),
(3366, NULL, 2, '2022-09-30 09:23:48', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 16:23:48', '2022-09-30 16:23:48'),
(3367, NULL, 2, '2022-09-30 09:23:57', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:23:57', '2022-09-30 16:23:57'),
(3368, NULL, 2, '2022-09-30 09:24:07', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-30 16:24:07', '2022-09-30 16:24:07'),
(3369, NULL, 2, '2022-09-30 09:24:18', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-30 16:24:18', '2022-09-30 16:24:18'),
(3370, NULL, 2, '2022-09-30 09:24:27', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 16:24:27', '2022-09-30 16:24:27'),
(3371, NULL, 2, '2022-09-30 09:24:37', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-30 16:24:37', '2022-09-30 16:24:37'),
(3372, NULL, 2, '2022-09-30 09:24:47', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-30 16:24:47', '2022-09-30 16:24:47'),
(3373, NULL, 2, '2022-09-30 09:24:57', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 16:24:57', '2022-09-30 16:24:57'),
(3374, NULL, 2, '2022-09-30 09:25:07', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 16:25:07', '2022-09-30 16:25:07'),
(3375, NULL, 2, '2022-09-30 09:25:17', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:25:17', '2022-09-30 16:25:17'),
(3376, NULL, 2, '2022-09-30 09:25:27', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-30 16:25:27', '2022-09-30 16:25:27'),
(3377, NULL, 2, '2022-09-30 09:25:37', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 16:25:37', '2022-09-30 16:25:37'),
(3378, NULL, 2, '2022-09-30 09:25:47', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:25:47', '2022-09-30 16:25:47'),
(3379, NULL, 2, '2022-09-30 09:25:57', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 16:25:57', '2022-09-30 16:25:57'),
(3380, NULL, 2, '2022-09-30 09:26:07', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:26:07', '2022-09-30 16:26:07'),
(3381, NULL, 2, '2022-09-30 09:26:17', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-30 16:26:17', '2022-09-30 16:26:17'),
(3382, NULL, 2, '2022-09-30 09:26:27', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:26:27', '2022-09-30 16:26:27'),
(3383, NULL, 2, '2022-09-30 09:26:37', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 16:26:37', '2022-09-30 16:26:37'),
(3384, NULL, 2, '2022-09-30 09:26:47', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:26:47', '2022-09-30 16:26:47'),
(3385, NULL, 2, '2022-09-30 09:26:57', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 16:26:57', '2022-09-30 16:26:57'),
(3386, NULL, 2, '2022-09-30 09:27:07', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:27:07', '2022-09-30 16:27:07'),
(3387, NULL, 2, '2022-09-30 09:27:17', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 16:27:17', '2022-09-30 16:27:17'),
(3388, NULL, 2, '2022-09-30 09:27:27', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 16:27:27', '2022-09-30 16:27:27'),
(3389, NULL, 2, '2022-09-30 09:27:37', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-30 16:27:37', '2022-09-30 16:27:37'),
(3390, NULL, 2, '2022-09-30 09:27:47', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:27:47', '2022-09-30 16:27:47'),
(3391, NULL, 2, '2022-09-30 09:27:57', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-30 16:27:57', '2022-09-30 16:27:57'),
(3392, NULL, 2, '2022-09-30 09:28:08', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:28:08', '2022-09-30 16:28:08'),
(3393, NULL, 2, '2022-09-30 09:28:17', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-30 16:28:17', '2022-09-30 16:28:17'),
(3394, NULL, 2, '2022-09-30 09:28:27', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-30 16:28:27', '2022-09-30 16:28:27'),
(3395, NULL, 2, '2022-09-30 09:28:37', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-30 16:28:37', '2022-09-30 16:28:37'),
(3396, NULL, 2, '2022-09-30 09:28:47', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-30 16:28:47', '2022-09-30 16:28:47'),
(3397, NULL, 2, '2022-09-30 09:28:57', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 16:28:57', '2022-09-30 16:28:57'),
(3398, NULL, 2, '2022-09-30 09:29:08', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-30 16:29:08', '2022-09-30 16:29:08'),
(3399, NULL, 2, '2022-09-30 09:29:17', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-30 16:29:17', '2022-09-30 16:29:17'),
(3400, NULL, 2, '2022-09-30 09:29:27', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-30 16:29:27', '2022-09-30 16:29:27'),
(3401, NULL, 2, '2022-09-30 09:29:37', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 16:29:37', '2022-09-30 16:29:37'),
(3402, NULL, 2, '2022-09-30 09:29:47', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-30 16:29:47', '2022-09-30 16:29:47'),
(3403, NULL, 2, '2022-09-30 09:29:58', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-30 16:29:58', '2022-09-30 16:29:58'),
(3404, NULL, 2, '2022-09-30 09:30:07', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:30:07', '2022-09-30 16:30:07'),
(3405, NULL, 2, '2022-09-30 09:30:17', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-30 16:30:17', '2022-09-30 16:30:17'),
(3406, NULL, 2, '2022-09-30 09:30:27', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 16:30:27', '2022-09-30 16:30:27'),
(3407, NULL, 2, '2022-09-30 09:30:38', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 16:30:38', '2022-09-30 16:30:38'),
(3408, NULL, 2, '2022-09-30 09:30:47', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 16:30:47', '2022-09-30 16:30:47'),
(3409, NULL, 2, '2022-09-30 09:30:58', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-30 16:30:58', '2022-09-30 16:30:58'),
(3410, NULL, 2, '2022-09-30 09:31:07', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 16:31:07', '2022-09-30 16:31:07'),
(3411, NULL, 2, '2022-09-30 09:31:17', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 16:31:17', '2022-09-30 16:31:17'),
(3412, NULL, 2, '2022-09-30 09:31:27', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-30 16:31:27', '2022-09-30 16:31:27'),
(3413, NULL, 2, '2022-09-30 09:31:37', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 16:31:37', '2022-09-30 16:31:37'),
(3414, NULL, 2, '2022-09-30 09:31:48', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-30 16:31:48', '2022-09-30 16:31:48'),
(3415, NULL, 2, '2022-09-30 09:31:57', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 16:31:57', '2022-09-30 16:31:57'),
(3416, NULL, 2, '2022-09-30 09:32:08', '104.5607259', '32.353299', 'Unknown Location Found', '2022-09-30 16:32:08', '2022-09-30 16:32:08'),
(3417, NULL, 2, '2022-09-30 09:32:18', '104.5607256', '32.3532993', 'Unknown Location Found', '2022-09-30 16:32:18', '2022-09-30 16:32:18'),
(3418, NULL, 2, '2022-09-30 09:32:27', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-30 16:32:27', '2022-09-30 16:32:27'),
(3419, NULL, 2, '2022-09-30 09:32:37', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 16:32:37', '2022-09-30 16:32:37'),
(3420, NULL, 2, '2022-09-30 09:32:47', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 16:32:47', '2022-09-30 16:32:47'),
(3421, NULL, 2, '2022-09-30 09:32:58', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-30 16:32:58', '2022-09-30 16:32:58'),
(3422, NULL, 2, '2022-09-30 09:33:07', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-30 16:33:07', '2022-09-30 16:33:07'),
(3423, NULL, 2, '2022-09-30 09:33:17', '104.560725', '32.3532986', 'Unknown Location Found', '2022-09-30 16:33:17', '2022-09-30 16:33:17'),
(3424, NULL, 2, '2022-09-30 09:33:27', '104.560725', '32.3532986', 'Unknown Location Found', '2022-09-30 16:33:27', '2022-09-30 16:33:27'),
(3425, NULL, 2, '2022-09-30 09:33:37', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-30 16:33:37', '2022-09-30 16:33:37'),
(3426, NULL, 2, '2022-09-30 09:33:47', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 16:33:47', '2022-09-30 16:33:47'),
(3427, NULL, 2, '2022-09-30 09:33:57', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 16:33:57', '2022-09-30 16:33:57'),
(3428, NULL, 2, '2022-09-30 09:34:07', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-30 16:34:07', '2022-09-30 16:34:07'),
(3429, NULL, 2, '2022-09-30 09:34:17', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 16:34:17', '2022-09-30 16:34:17'),
(3430, NULL, 2, '2022-09-30 09:34:27', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 16:34:27', '2022-09-30 16:34:27'),
(3431, NULL, 2, '2022-09-30 09:34:38', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 16:34:38', '2022-09-30 16:34:38'),
(3432, NULL, 2, '2022-09-30 09:34:47', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-30 16:34:47', '2022-09-30 16:34:47'),
(3433, NULL, 2, '2022-09-30 09:34:57', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 16:34:57', '2022-09-30 16:34:57'),
(3434, NULL, 2, '2022-09-30 09:35:08', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-30 16:35:08', '2022-09-30 16:35:08'),
(3435, NULL, 2, '2022-09-30 09:35:17', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-30 16:35:17', '2022-09-30 16:35:17'),
(3436, NULL, 2, '2022-09-30 09:35:27', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 16:35:27', '2022-09-30 16:35:27'),
(3437, NULL, 2, '2022-09-30 09:35:37', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 16:35:37', '2022-09-30 16:35:37'),
(3438, NULL, 2, '2022-09-30 09:35:47', '104.5607254', '32.3532993', 'Unknown Location Found', '2022-09-30 16:35:47', '2022-09-30 16:35:47'),
(3439, NULL, 2, '2022-09-30 09:35:57', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-30 16:35:57', '2022-09-30 16:35:57'),
(3440, NULL, 2, '2022-09-30 09:36:07', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 16:36:07', '2022-09-30 16:36:07'),
(3441, NULL, 2, '2022-09-30 09:36:17', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 16:36:17', '2022-09-30 16:36:17'),
(3442, NULL, 2, '2022-09-30 09:36:27', '104.5607251', '32.3532986', 'Unknown Location Found', '2022-09-30 16:36:27', '2022-09-30 16:36:27'),
(3443, NULL, 2, '2022-09-30 09:36:37', '104.5607254', '32.3532992', 'Unknown Location Found', '2022-09-30 16:36:37', '2022-09-30 16:36:37'),
(3444, NULL, 2, '2022-09-30 09:36:47', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-30 16:36:47', '2022-09-30 16:36:47'),
(3445, NULL, 2, '2022-09-30 09:36:57', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 16:36:57', '2022-09-30 16:36:57'),
(3446, NULL, 2, '2022-09-30 09:37:07', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:37:07', '2022-09-30 16:37:07'),
(3447, NULL, 2, '2022-09-30 09:37:17', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:37:17', '2022-09-30 16:37:17'),
(3448, NULL, 2, '2022-09-30 09:37:27', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 16:37:27', '2022-09-30 16:37:27'),
(3449, NULL, 2, '2022-09-30 09:37:37', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 16:37:37', '2022-09-30 16:37:37'),
(3450, NULL, 2, '2022-09-30 09:37:47', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:37:47', '2022-09-30 16:37:47'),
(3451, NULL, 2, '2022-09-30 09:37:58', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-30 16:37:58', '2022-09-30 16:37:58'),
(3452, NULL, 2, '2022-09-30 09:38:08', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-30 16:38:08', '2022-09-30 16:38:08'),
(3453, NULL, 2, '2022-09-30 09:38:18', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-30 16:38:18', '2022-09-30 16:38:18'),
(3454, NULL, 2, '2022-09-30 09:38:27', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-30 16:38:27', '2022-09-30 16:38:27'),
(3455, NULL, 2, '2022-09-30 09:38:37', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 16:38:37', '2022-09-30 16:38:37'),
(3456, NULL, 2, '2022-09-30 09:38:47', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-30 16:38:47', '2022-09-30 16:38:47'),
(3457, NULL, 2, '2022-09-30 09:38:57', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 16:38:57', '2022-09-30 16:38:57'),
(3458, NULL, 2, '2022-09-30 09:39:07', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 16:39:07', '2022-09-30 16:39:07'),
(3459, NULL, 2, '2022-09-30 09:39:17', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:39:17', '2022-09-30 16:39:17'),
(3460, NULL, 2, '2022-09-30 09:39:27', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:39:27', '2022-09-30 16:39:27'),
(3461, NULL, 2, '2022-09-30 09:39:37', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 16:39:37', '2022-09-30 16:39:37'),
(3462, NULL, 2, '2022-09-30 09:39:47', '104.5607259', '32.3532989', 'Unknown Location Found', '2022-09-30 16:39:47', '2022-09-30 16:39:47'),
(3463, NULL, 2, '2022-09-30 09:39:57', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-30 16:39:57', '2022-09-30 16:39:57'),
(3464, NULL, 2, '2022-09-30 09:40:07', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:40:07', '2022-09-30 16:40:07'),
(3465, NULL, 2, '2022-09-30 09:40:17', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-30 16:40:17', '2022-09-30 16:40:17'),
(3466, NULL, 2, '2022-09-30 09:40:27', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-30 16:40:27', '2022-09-30 16:40:27'),
(3467, NULL, 2, '2022-09-30 09:40:37', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 16:40:37', '2022-09-30 16:40:37'),
(3468, NULL, 2, '2022-09-30 09:40:47', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:40:47', '2022-09-30 16:40:47'),
(3469, NULL, 2, '2022-09-30 09:40:57', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-30 16:40:57', '2022-09-30 16:40:57'),
(3470, NULL, 2, '2022-09-30 09:41:07', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:41:07', '2022-09-30 16:41:07'),
(3471, NULL, 2, '2022-09-30 09:41:17', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 16:41:17', '2022-09-30 16:41:17'),
(3472, NULL, 2, '2022-09-30 09:41:27', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 16:41:27', '2022-09-30 16:41:27'),
(3473, NULL, 2, '2022-09-30 09:41:38', '104.560725', '32.3532984', 'Unknown Location Found', '2022-09-30 16:41:38', '2022-09-30 16:41:38'),
(3474, NULL, 2, '2022-09-30 09:41:47', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-30 16:41:47', '2022-09-30 16:41:47'),
(3475, NULL, 2, '2022-09-30 09:41:57', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 16:41:57', '2022-09-30 16:41:57'),
(3476, NULL, 2, '2022-09-30 09:42:07', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:42:07', '2022-09-30 16:42:07'),
(3477, NULL, 2, '2022-09-30 09:42:18', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 16:42:18', '2022-09-30 16:42:18'),
(3478, NULL, 2, '2022-09-30 09:42:27', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 16:42:27', '2022-09-30 16:42:27'),
(3479, NULL, 2, '2022-09-30 09:42:37', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 16:42:37', '2022-09-30 16:42:37'),
(3480, NULL, 2, '2022-09-30 09:42:47', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 16:42:47', '2022-09-30 16:42:47'),
(3481, NULL, 2, '2022-09-30 09:42:57', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 16:42:57', '2022-09-30 16:42:57'),
(3482, NULL, 2, '2022-09-30 09:43:07', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 16:43:07', '2022-09-30 16:43:07'),
(3483, NULL, 2, '2022-09-30 09:43:18', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:43:18', '2022-09-30 16:43:18'),
(3484, NULL, 2, '2022-09-30 09:43:27', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-30 16:43:27', '2022-09-30 16:43:27'),
(3485, NULL, 2, '2022-09-30 09:43:37', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-30 16:43:37', '2022-09-30 16:43:37'),
(3486, NULL, 2, '2022-09-30 09:43:47', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 16:43:47', '2022-09-30 16:43:47'),
(3487, NULL, 2, '2022-09-30 09:43:57', '104.5607259', '32.3532984', 'Unknown Location Found', '2022-09-30 16:43:57', '2022-09-30 16:43:57'),
(3488, NULL, 2, '2022-09-30 09:44:08', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 16:44:08', '2022-09-30 16:44:08'),
(3489, NULL, 2, '2022-09-30 09:44:17', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-30 16:44:17', '2022-09-30 16:44:17'),
(3490, NULL, 2, '2022-09-30 09:44:27', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-30 16:44:27', '2022-09-30 16:44:27'),
(3491, NULL, 2, '2022-09-30 09:44:37', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 16:44:37', '2022-09-30 16:44:37'),
(3492, NULL, 2, '2022-09-30 09:44:48', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 16:44:48', '2022-09-30 16:44:48'),
(3493, NULL, 2, '2022-09-30 09:44:57', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-30 16:44:57', '2022-09-30 16:44:57'),
(3494, NULL, 2, '2022-09-30 09:45:07', '104.5607251', '32.3532987', 'Unknown Location Found', '2022-09-30 16:45:07', '2022-09-30 16:45:07'),
(3495, NULL, 2, '2022-09-30 09:45:17', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 16:45:17', '2022-09-30 16:45:17'),
(3496, NULL, 2, '2022-09-30 09:45:27', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-30 16:45:27', '2022-09-30 16:45:27'),
(3497, NULL, 2, '2022-09-30 09:45:38', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 16:45:38', '2022-09-30 16:45:38'),
(3498, NULL, 2, '2022-09-30 09:45:48', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:45:48', '2022-09-30 16:45:48'),
(3499, NULL, 2, '2022-09-30 09:45:58', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-30 16:45:58', '2022-09-30 16:45:58'),
(3500, NULL, 2, '2022-09-30 09:46:07', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:46:07', '2022-09-30 16:46:07'),
(3501, NULL, 2, '2022-09-30 09:46:17', '104.5607255', '32.3532987', 'Unknown Location Found', '2022-09-30 16:46:17', '2022-09-30 16:46:17'),
(3502, NULL, 2, '2022-09-30 09:46:27', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 16:46:27', '2022-09-30 16:46:27'),
(3503, NULL, 2, '2022-09-30 09:46:38', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 16:46:38', '2022-09-30 16:46:38'),
(3504, NULL, 2, '2022-09-30 09:46:47', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:46:47', '2022-09-30 16:46:47'),
(3505, NULL, 2, '2022-09-30 09:46:58', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 16:46:58', '2022-09-30 16:46:58'),
(3506, NULL, 2, '2022-09-30 09:47:07', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-30 16:47:07', '2022-09-30 16:47:07'),
(3507, NULL, 2, '2022-09-30 09:47:18', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 16:47:18', '2022-09-30 16:47:18');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(3508, NULL, 2, '2022-09-30 09:47:27', '104.560725', '32.3532991', 'Unknown Location Found', '2022-09-30 16:47:27', '2022-09-30 16:47:27'),
(3509, NULL, 2, '2022-09-30 09:47:37', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:47:37', '2022-09-30 16:47:37'),
(3510, NULL, 2, '2022-09-30 09:47:48', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 16:47:48', '2022-09-30 16:47:48'),
(3511, NULL, 2, '2022-09-30 09:47:57', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 16:47:57', '2022-09-30 16:47:57'),
(3512, NULL, 2, '2022-09-30 09:48:08', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-30 16:48:08', '2022-09-30 16:48:08'),
(3513, NULL, 2, '2022-09-30 09:48:17', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 16:48:17', '2022-09-30 16:48:17'),
(3514, NULL, 2, '2022-09-30 09:48:28', '104.5607256', '32.3532983', 'Unknown Location Found', '2022-09-30 16:48:28', '2022-09-30 16:48:28'),
(3515, NULL, 2, '2022-09-30 09:48:37', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:48:37', '2022-09-30 16:48:37'),
(3516, NULL, 2, '2022-09-30 09:48:48', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 16:48:48', '2022-09-30 16:48:48'),
(3517, NULL, 2, '2022-09-30 09:48:57', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 16:48:57', '2022-09-30 16:48:57'),
(3518, NULL, 2, '2022-09-30 09:49:07', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 16:49:07', '2022-09-30 16:49:07'),
(3519, NULL, 2, '2022-09-30 09:49:17', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 16:49:17', '2022-09-30 16:49:17'),
(3520, NULL, 2, '2022-09-30 09:49:28', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 16:49:28', '2022-09-30 16:49:28'),
(3521, NULL, 2, '2022-09-30 09:49:37', '104.560725', '32.3532987', 'Unknown Location Found', '2022-09-30 16:49:37', '2022-09-30 16:49:37'),
(3522, NULL, 2, '2022-09-30 09:49:47', '104.5607257', '32.3532993', 'Unknown Location Found', '2022-09-30 16:49:47', '2022-09-30 16:49:47'),
(3523, NULL, 2, '2022-09-30 09:49:57', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-30 16:49:57', '2022-09-30 16:49:57'),
(3524, NULL, 2, '2022-09-30 09:50:07', '104.5607253', '32.3532993', 'Unknown Location Found', '2022-09-30 16:50:07', '2022-09-30 16:50:07'),
(3525, NULL, 2, '2022-09-30 09:50:17', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-30 16:50:17', '2022-09-30 16:50:17'),
(3526, NULL, 2, '2022-09-30 09:50:27', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-30 16:50:27', '2022-09-30 16:50:27'),
(3527, NULL, 2, '2022-09-30 09:50:37', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 16:50:37', '2022-09-30 16:50:37'),
(3528, NULL, 2, '2022-09-30 09:50:47', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 16:50:47', '2022-09-30 16:50:47'),
(3529, NULL, 2, '2022-09-30 09:50:57', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-30 16:50:57', '2022-09-30 16:50:57'),
(3530, NULL, 2, '2022-09-30 09:51:07', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 16:51:07', '2022-09-30 16:51:07'),
(3531, NULL, 2, '2022-09-30 09:51:17', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-30 16:51:17', '2022-09-30 16:51:17'),
(3532, NULL, 2, '2022-09-30 09:51:27', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 16:51:27', '2022-09-30 16:51:27'),
(3533, NULL, 2, '2022-09-30 09:51:37', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 16:51:37', '2022-09-30 16:51:37'),
(3534, NULL, 2, '2022-09-30 09:51:47', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 16:51:47', '2022-09-30 16:51:47'),
(3535, NULL, 2, '2022-09-30 09:51:57', '104.560725', '32.3532985', 'Unknown Location Found', '2022-09-30 16:51:57', '2022-09-30 16:51:57'),
(3536, NULL, 2, '2022-09-30 09:52:07', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 16:52:07', '2022-09-30 16:52:07'),
(3537, NULL, 2, '2022-09-30 09:52:17', '104.5607256', '32.3532984', 'Unknown Location Found', '2022-09-30 16:52:17', '2022-09-30 16:52:17'),
(3538, NULL, 2, '2022-09-30 09:52:27', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-30 16:52:27', '2022-09-30 16:52:27'),
(3539, NULL, 2, '2022-09-30 09:52:37', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-30 16:52:37', '2022-09-30 16:52:37'),
(3540, NULL, 2, '2022-09-30 09:52:47', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 16:52:47', '2022-09-30 16:52:47'),
(3541, NULL, 2, '2022-09-30 09:52:57', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 16:52:57', '2022-09-30 16:52:57'),
(3542, NULL, 2, '2022-09-30 09:53:07', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 16:53:07', '2022-09-30 16:53:07'),
(3543, NULL, 2, '2022-09-30 09:53:17', '104.5607259', '32.3532986', 'Unknown Location Found', '2022-09-30 16:53:17', '2022-09-30 16:53:17'),
(3544, NULL, 2, '2022-09-30 09:53:27', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 16:53:27', '2022-09-30 16:53:27'),
(3545, NULL, 2, '2022-09-30 09:53:37', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 16:53:37', '2022-09-30 16:53:37'),
(3546, NULL, 2, '2022-09-30 09:53:47', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 16:53:47', '2022-09-30 16:53:47'),
(3547, NULL, 2, '2022-09-30 09:53:58', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 16:53:58', '2022-09-30 16:53:58'),
(3548, NULL, 2, '2022-09-30 09:54:07', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 16:54:07', '2022-09-30 16:54:07'),
(3549, NULL, 2, '2022-09-30 09:54:18', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 16:54:18', '2022-09-30 16:54:18'),
(3550, NULL, 2, '2022-09-30 09:54:27', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 16:54:27', '2022-09-30 16:54:27'),
(3551, NULL, 2, '2022-09-30 09:54:38', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 16:54:38', '2022-09-30 16:54:38'),
(3552, NULL, 2, '2022-09-30 09:54:48', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 16:54:48', '2022-09-30 16:54:48'),
(3553, NULL, 2, '2022-09-30 09:54:58', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 16:54:58', '2022-09-30 16:54:58'),
(3554, NULL, 2, '2022-09-30 09:55:08', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 16:55:08', '2022-09-30 16:55:08'),
(3555, NULL, 2, '2022-09-30 09:55:17', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-30 16:55:17', '2022-09-30 16:55:17'),
(3556, NULL, 2, '2022-09-30 09:55:27', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 16:55:27', '2022-09-30 16:55:27'),
(3557, NULL, 2, '2022-09-30 09:55:37', '104.5607255', '32.3532984', 'Unknown Location Found', '2022-09-30 16:55:37', '2022-09-30 16:55:37'),
(3558, NULL, 2, '2022-09-30 09:55:47', '104.5607253', '32.3532988', 'Unknown Location Found', '2022-09-30 16:55:47', '2022-09-30 16:55:47'),
(3559, NULL, 2, '2022-09-30 09:55:57', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 16:55:57', '2022-09-30 16:55:57'),
(3560, NULL, 2, '2022-09-30 09:56:07', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 16:56:07', '2022-09-30 16:56:07'),
(3561, NULL, 2, '2022-09-30 09:56:17', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 16:56:17', '2022-09-30 16:56:17'),
(3562, NULL, 2, '2022-09-30 09:56:27', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 16:56:27', '2022-09-30 16:56:27'),
(3563, NULL, 2, '2022-09-30 09:56:37', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 16:56:37', '2022-09-30 16:56:37'),
(3564, NULL, 2, '2022-09-30 09:56:47', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 16:56:47', '2022-09-30 16:56:47'),
(3565, NULL, 2, '2022-09-30 09:56:57', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-30 16:56:57', '2022-09-30 16:56:57'),
(3566, NULL, 2, '2022-09-30 09:57:08', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 16:57:08', '2022-09-30 16:57:08'),
(3567, NULL, 2, '2022-09-30 09:57:17', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 16:57:17', '2022-09-30 16:57:17'),
(3568, NULL, 2, '2022-09-30 09:57:28', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 16:57:28', '2022-09-30 16:57:28'),
(3569, NULL, 2, '2022-09-30 09:57:37', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 16:57:37', '2022-09-30 16:57:37'),
(3570, NULL, 2, '2022-09-30 09:57:47', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 16:57:47', '2022-09-30 16:57:47'),
(3571, NULL, 2, '2022-09-30 09:57:57', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 16:57:57', '2022-09-30 16:57:57'),
(3572, NULL, 2, '2022-09-30 09:58:07', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 16:58:07', '2022-09-30 16:58:07'),
(3573, NULL, 2, '2022-09-30 09:58:17', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-30 16:58:17', '2022-09-30 16:58:17'),
(3574, NULL, 2, '2022-09-30 09:58:28', '104.5607259', '32.3532984', 'Unknown Location Found', '2022-09-30 16:58:28', '2022-09-30 16:58:28'),
(3575, NULL, 2, '2022-09-30 09:58:37', '104.5607256', '32.353299', 'Unknown Location Found', '2022-09-30 16:58:37', '2022-09-30 16:58:37'),
(3576, NULL, 2, '2022-09-30 09:58:47', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 16:58:47', '2022-09-30 16:58:47'),
(3577, NULL, 2, '2022-09-30 09:58:57', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 16:58:57', '2022-09-30 16:58:57'),
(3578, NULL, 2, '2022-09-30 09:59:07', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 16:59:07', '2022-09-30 16:59:07'),
(3579, NULL, 2, '2022-09-30 09:59:17', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 16:59:17', '2022-09-30 16:59:17'),
(3580, NULL, 2, '2022-09-30 09:59:27', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 16:59:27', '2022-09-30 16:59:27'),
(3581, NULL, 2, '2022-09-30 09:59:37', '104.560725', '32.3532985', 'Unknown Location Found', '2022-09-30 16:59:37', '2022-09-30 16:59:37'),
(3582, NULL, 2, '2022-09-30 09:59:47', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 16:59:47', '2022-09-30 16:59:47'),
(3583, NULL, 2, '2022-09-30 09:59:58', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-30 16:59:58', '2022-09-30 16:59:58'),
(3584, NULL, 2, '2022-09-30 10:00:08', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 17:00:08', '2022-09-30 17:00:08'),
(3585, NULL, 2, '2022-09-30 10:00:17', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 17:00:17', '2022-09-30 17:00:17'),
(3586, NULL, 2, '2022-09-30 10:00:27', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 17:00:27', '2022-09-30 17:00:27'),
(3587, NULL, 2, '2022-09-30 10:00:37', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 17:00:37', '2022-09-30 17:00:37'),
(3588, NULL, 2, '2022-09-30 10:00:48', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 17:00:48', '2022-09-30 17:00:48'),
(3589, NULL, 2, '2022-09-30 10:00:58', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 17:00:58', '2022-09-30 17:00:58'),
(3590, NULL, 2, '2022-09-30 10:01:13', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 17:01:13', '2022-09-30 17:01:13'),
(3591, NULL, 2, '2022-09-30 10:01:23', '104.5607259', '32.3532992', 'Unknown Location Found', '2022-09-30 17:01:23', '2022-09-30 17:01:23'),
(3592, NULL, 2, '2022-09-30 10:01:33', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 17:01:33', '2022-09-30 17:01:33'),
(3593, NULL, 2, '2022-09-30 10:01:53', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 17:01:53', '2022-09-30 17:01:53'),
(3594, NULL, 2, '2022-09-30 10:02:03', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 17:02:03', '2022-09-30 17:02:03'),
(3595, NULL, 2, '2022-09-30 10:02:13', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 17:02:13', '2022-09-30 17:02:13'),
(3596, NULL, 2, '2022-09-30 10:02:14', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 17:02:14', '2022-09-30 17:02:14'),
(3597, NULL, 2, '2022-09-30 10:02:23', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 17:02:23', '2022-09-30 17:02:23'),
(3598, NULL, 2, '2022-09-30 10:02:33', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 17:02:33', '2022-09-30 17:02:33'),
(3599, NULL, 2, '2022-09-30 10:02:43', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-30 17:02:43', '2022-09-30 17:02:43'),
(3600, NULL, 2, '2022-09-30 10:02:53', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 17:02:53', '2022-09-30 17:02:53'),
(3601, NULL, 2, '2022-09-30 10:03:03', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 17:03:03', '2022-09-30 17:03:03'),
(3602, NULL, 2, '2022-09-30 10:03:14', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-30 17:03:14', '2022-09-30 17:03:14'),
(3603, NULL, 2, '2022-09-30 10:03:24', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 17:03:24', '2022-09-30 17:03:24'),
(3604, NULL, 2, '2022-09-30 10:03:34', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 17:03:34', '2022-09-30 17:03:34'),
(3605, NULL, 2, '2022-09-30 10:03:44', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-30 17:03:44', '2022-09-30 17:03:44'),
(3606, NULL, 2, '2022-09-30 10:03:54', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 17:03:54', '2022-09-30 17:03:54'),
(3607, NULL, 2, '2022-09-30 10:04:04', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 17:04:04', '2022-09-30 17:04:04'),
(3608, NULL, 2, '2022-09-30 10:04:14', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 17:04:14', '2022-09-30 17:04:14'),
(3609, NULL, 2, '2022-09-30 10:04:24', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 17:04:24', '2022-09-30 17:04:24'),
(3610, NULL, 2, '2022-09-30 10:04:34', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 17:04:34', '2022-09-30 17:04:34'),
(3611, NULL, 2, '2022-09-30 10:04:45', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 17:04:45', '2022-09-30 17:04:45'),
(3612, NULL, 2, '2022-09-30 10:04:54', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 17:04:54', '2022-09-30 17:04:54'),
(3613, NULL, 2, '2022-09-30 10:05:04', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 17:05:04', '2022-09-30 17:05:04'),
(3614, NULL, 2, '2022-09-30 10:05:33', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 17:05:33', '2022-09-30 17:05:33'),
(3615, NULL, 2, '2022-09-30 10:05:43', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 17:05:43', '2022-09-30 17:05:43'),
(3616, NULL, 2, '2022-09-30 10:05:53', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 17:05:53', '2022-09-30 17:05:53'),
(3617, NULL, 2, '2022-09-30 10:06:03', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-30 17:06:03', '2022-09-30 17:06:03'),
(3618, NULL, 2, '2022-09-30 10:06:13', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 17:06:13', '2022-09-30 17:06:13'),
(3619, NULL, 2, '2022-09-30 10:06:23', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 17:06:23', '2022-09-30 17:06:23'),
(3620, NULL, 2, '2022-09-30 10:06:33', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 17:06:33', '2022-09-30 17:06:33'),
(3621, NULL, 2, '2022-09-30 10:06:43', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 17:06:43', '2022-09-30 17:06:43'),
(3622, NULL, 2, '2022-09-30 10:06:53', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 17:06:53', '2022-09-30 17:06:53'),
(3623, NULL, 2, '2022-09-30 10:07:03', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-30 17:07:03', '2022-09-30 17:07:03'),
(3624, NULL, 2, '2022-09-30 10:07:13', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 17:07:13', '2022-09-30 17:07:13'),
(3625, NULL, 2, '2022-09-30 10:07:23', '104.5607258', '32.3532985', 'Unknown Location Found', '2022-09-30 17:07:23', '2022-09-30 17:07:23'),
(3626, NULL, 2, '2022-09-30 10:07:33', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 17:07:33', '2022-09-30 17:07:33'),
(3627, NULL, 2, '2022-09-30 10:07:43', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 17:07:43', '2022-09-30 17:07:43'),
(3628, NULL, 2, '2022-09-30 10:07:53', '104.5607256', '32.3532993', 'Unknown Location Found', '2022-09-30 17:07:53', '2022-09-30 17:07:53'),
(3629, NULL, 2, '2022-09-30 10:08:03', '104.5607258', '32.353299', 'Unknown Location Found', '2022-09-30 17:08:03', '2022-09-30 17:08:03'),
(3630, NULL, 2, '2022-09-30 10:08:13', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 17:08:13', '2022-09-30 17:08:13'),
(3631, NULL, 2, '2022-09-30 10:08:23', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 17:08:23', '2022-09-30 17:08:23'),
(3632, NULL, 2, '2022-09-30 10:08:33', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 17:08:33', '2022-09-30 17:08:33'),
(3633, NULL, 2, '2022-09-30 10:08:43', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 17:08:43', '2022-09-30 17:08:43'),
(3634, NULL, 2, '2022-09-30 10:08:53', '104.5607259', '32.3532989', 'Unknown Location Found', '2022-09-30 17:08:53', '2022-09-30 17:08:53'),
(3635, NULL, 2, '2022-09-30 10:09:03', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 17:09:03', '2022-09-30 17:09:03'),
(3636, NULL, 2, '2022-09-30 10:09:13', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-30 17:09:13', '2022-09-30 17:09:13'),
(3637, NULL, 2, '2022-09-30 10:09:23', '104.5607256', '32.3532983', 'Unknown Location Found', '2022-09-30 17:09:23', '2022-09-30 17:09:23'),
(3638, NULL, 2, '2022-09-30 10:09:33', '104.5607253', '32.3532983', 'Unknown Location Found', '2022-09-30 17:09:33', '2022-09-30 17:09:33'),
(3639, NULL, 2, '2022-09-30 10:09:43', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 17:09:43', '2022-09-30 17:09:43'),
(3640, NULL, 2, '2022-09-30 10:09:53', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 17:09:53', '2022-09-30 17:09:53'),
(3641, NULL, 2, '2022-09-30 10:10:33', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-30 17:10:33', '2022-09-30 17:10:33'),
(3642, NULL, 2, '2022-09-30 10:10:43', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-30 17:10:43', '2022-09-30 17:10:43'),
(3643, NULL, 2, '2022-09-30 10:10:53', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 17:10:53', '2022-09-30 17:10:53'),
(3644, NULL, 2, '2022-09-30 10:11:04', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-30 17:11:04', '2022-09-30 17:11:04'),
(3645, NULL, 2, '2022-09-30 10:11:13', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 17:11:13', '2022-09-30 17:11:13'),
(3646, NULL, 2, '2022-09-30 10:11:23', '104.5607258', '32.3532987', 'Unknown Location Found', '2022-09-30 17:11:23', '2022-09-30 17:11:23'),
(3647, NULL, 2, '2022-09-30 10:11:33', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-30 17:11:33', '2022-09-30 17:11:33'),
(3648, NULL, 2, '2022-09-30 10:11:52', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 17:11:52', '2022-09-30 17:11:52'),
(3649, NULL, 2, '2022-09-30 10:12:02', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 17:12:02', '2022-09-30 17:12:02'),
(3650, NULL, 2, '2022-09-30 10:12:16', '104.5607257', '32.3532989', 'Unknown Location Found', '2022-09-30 17:12:16', '2022-09-30 17:12:16'),
(3651, NULL, 2, '2022-09-30 10:12:32', '104.5607257', '32.3532982', 'Unknown Location Found', '2022-09-30 17:12:32', '2022-09-30 17:12:32'),
(3652, NULL, 2, '2022-09-30 10:12:42', '104.5607259', '32.3532988', 'Unknown Location Found', '2022-09-30 17:12:42', '2022-09-30 17:12:42'),
(3653, NULL, 2, '2022-09-30 10:12:52', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 17:12:52', '2022-09-30 17:12:52'),
(3654, NULL, 2, '2022-09-30 10:13:02', '104.5607255', '32.3532986', 'Unknown Location Found', '2022-09-30 17:13:02', '2022-09-30 17:13:02'),
(3655, NULL, 2, '2022-09-30 10:13:12', '104.5607257', '32.3532992', 'Unknown Location Found', '2022-09-30 17:13:12', '2022-09-30 17:13:12'),
(3656, NULL, 2, '2022-09-30 10:13:22', '104.5607255', '32.353299', 'Unknown Location Found', '2022-09-30 17:13:22', '2022-09-30 17:13:22'),
(3657, NULL, 2, '2022-09-30 10:13:32', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-30 17:13:32', '2022-09-30 17:13:32'),
(3658, NULL, 2, '2022-09-30 10:13:42', '104.5607259', '32.3532989', 'Unknown Location Found', '2022-09-30 17:13:42', '2022-09-30 17:13:42'),
(3659, NULL, 2, '2022-09-30 10:13:53', '104.5607257', '32.3532987', 'Unknown Location Found', '2022-09-30 17:13:53', '2022-09-30 17:13:53'),
(3660, NULL, 2, '2022-09-30 10:14:03', '104.5607259', '32.3532985', 'Unknown Location Found', '2022-09-30 17:14:03', '2022-09-30 17:14:03'),
(3661, NULL, 2, '2022-09-30 10:14:13', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-30 17:14:13', '2022-09-30 17:14:13'),
(3662, NULL, 2, '2022-09-30 10:14:23', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 17:14:23', '2022-09-30 17:14:23'),
(3663, NULL, 2, '2022-09-30 10:14:33', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 17:14:33', '2022-09-30 17:14:33'),
(3664, NULL, 2, '2022-09-30 10:14:55', '104.5607252', '32.3532985', 'Unknown Location Found', '2022-09-30 17:14:55', '2022-09-30 17:14:55'),
(3665, NULL, 2, '2022-09-30 10:14:55', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 17:14:55', '2022-09-30 17:14:55'),
(3666, NULL, 2, '2022-09-30 10:15:03', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 17:15:03', '2022-09-30 17:15:03'),
(3667, NULL, 2, '2022-09-30 10:15:13', '104.5607259', '32.3532986', 'Unknown Location Found', '2022-09-30 17:15:13', '2022-09-30 17:15:13'),
(3668, NULL, 2, '2022-09-30 10:15:23', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 17:15:23', '2022-09-30 17:15:23'),
(3669, NULL, 2, '2022-09-30 10:15:34', '104.5607258', '32.3532986', 'Unknown Location Found', '2022-09-30 17:15:34', '2022-09-30 17:15:34'),
(3670, NULL, 2, '2022-09-30 10:15:44', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 17:15:44', '2022-09-30 17:15:44'),
(3671, NULL, 2, '2022-09-30 10:15:54', '104.560725', '32.3532987', 'Unknown Location Found', '2022-09-30 17:15:54', '2022-09-30 17:15:54'),
(3672, NULL, 2, '2022-09-30 10:16:04', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 17:16:04', '2022-09-30 17:16:04'),
(3673, NULL, 2, '2022-09-30 10:16:14', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 17:16:14', '2022-09-30 17:16:14'),
(3674, NULL, 2, '2022-09-30 10:16:24', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 17:16:24', '2022-09-30 17:16:24'),
(3675, NULL, 2, '2022-09-30 10:16:34', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 17:16:34', '2022-09-30 17:16:34'),
(3676, NULL, 2, '2022-09-30 10:16:44', '104.5607255', '32.3532989', 'Unknown Location Found', '2022-09-30 17:16:44', '2022-09-30 17:16:44'),
(3677, NULL, 2, '2022-09-30 10:16:54', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 17:16:54', '2022-09-30 17:16:54'),
(3678, NULL, 2, '2022-09-30 10:17:04', '104.560725', '32.3532987', 'Unknown Location Found', '2022-09-30 17:17:04', '2022-09-30 17:17:04'),
(3679, NULL, 2, '2022-09-30 10:17:14', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 17:17:14', '2022-09-30 17:17:14'),
(3680, NULL, 2, '2022-09-30 10:17:24', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-30 17:17:24', '2022-09-30 17:17:24'),
(3681, NULL, 2, '2022-09-30 10:17:34', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-30 17:17:34', '2022-09-30 17:17:34'),
(3682, NULL, 2, '2022-09-30 10:17:44', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 17:17:44', '2022-09-30 17:17:44'),
(3683, NULL, 2, '2022-09-30 10:17:54', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 17:17:54', '2022-09-30 17:17:54'),
(3684, NULL, 2, '2022-09-30 10:18:04', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 17:18:04', '2022-09-30 17:18:04'),
(3685, NULL, 2, '2022-09-30 10:18:14', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 17:18:14', '2022-09-30 17:18:14'),
(3686, NULL, 2, '2022-09-30 10:18:24', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 17:18:24', '2022-09-30 17:18:24'),
(3687, NULL, 2, '2022-09-30 10:18:34', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 17:18:34', '2022-09-30 17:18:34'),
(3688, NULL, 2, '2022-09-30 10:18:44', '104.5607258', '32.3532988', 'Unknown Location Found', '2022-09-30 17:18:44', '2022-09-30 17:18:44'),
(3689, NULL, 2, '2022-09-30 10:18:54', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 17:18:54', '2022-09-30 17:18:54'),
(3690, NULL, 2, '2022-09-30 10:19:13', '104.5607257', '32.3532983', 'Unknown Location Found', '2022-09-30 17:19:13', '2022-09-30 17:19:13'),
(3691, NULL, 2, '2022-09-30 10:19:23', '104.5607257', '32.353299', 'Unknown Location Found', '2022-09-30 17:19:23', '2022-09-30 17:19:23'),
(3692, NULL, 2, '2022-09-30 10:19:33', '104.5607251', '32.3532985', 'Unknown Location Found', '2022-09-30 17:19:33', '2022-09-30 17:19:33'),
(3693, NULL, 2, '2022-09-30 10:19:43', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 17:19:43', '2022-09-30 17:19:43'),
(3694, NULL, 2, '2022-09-30 10:19:55', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 17:19:55', '2022-09-30 17:19:55'),
(3695, NULL, 2, '2022-09-30 10:20:05', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 17:20:05', '2022-09-30 17:20:05'),
(3696, NULL, 2, '2022-09-30 10:20:15', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-30 17:20:15', '2022-09-30 17:20:15'),
(3697, NULL, 2, '2022-09-30 10:20:25', '104.5607259', '32.3532989', 'Unknown Location Found', '2022-09-30 17:20:25', '2022-09-30 17:20:25'),
(3698, NULL, 2, '2022-09-30 10:20:35', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 17:20:35', '2022-09-30 17:20:35'),
(3699, NULL, 2, '2022-09-30 10:20:45', '104.5607252', '32.3532986', 'Unknown Location Found', '2022-09-30 17:20:45', '2022-09-30 17:20:45'),
(3700, NULL, 2, '2022-09-30 10:20:55', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 17:20:55', '2022-09-30 17:20:55'),
(3701, NULL, 2, '2022-09-30 10:21:05', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 17:21:05', '2022-09-30 17:21:05'),
(3702, NULL, 2, '2022-09-30 10:21:15', '104.5607255', '32.3532988', 'Unknown Location Found', '2022-09-30 17:21:15', '2022-09-30 17:21:15'),
(3703, NULL, 2, '2022-09-30 10:21:25', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 17:21:25', '2022-09-30 17:21:25'),
(3704, NULL, 2, '2022-09-30 10:21:35', '104.5607257', '32.3532985', 'Unknown Location Found', '2022-09-30 17:21:35', '2022-09-30 17:21:35'),
(3705, NULL, 2, '2022-09-30 10:21:45', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-30 17:21:45', '2022-09-30 17:21:45'),
(3706, NULL, 2, '2022-09-30 10:21:55', '104.5607259', '32.3532991', 'Unknown Location Found', '2022-09-30 17:21:55', '2022-09-30 17:21:55'),
(3707, NULL, 2, '2022-09-30 10:22:05', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-30 17:22:05', '2022-09-30 17:22:05'),
(3708, NULL, 2, '2022-09-30 10:22:15', '104.5607254', '32.3532991', 'Unknown Location Found', '2022-09-30 17:22:15', '2022-09-30 17:22:15'),
(3709, NULL, 2, '2022-09-30 10:22:25', '104.5607257', '32.3532984', 'Unknown Location Found', '2022-09-30 17:22:25', '2022-09-30 17:22:25'),
(3710, NULL, 2, '2022-09-30 10:22:35', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-30 17:22:35', '2022-09-30 17:22:35'),
(3711, NULL, 2, '2022-09-30 10:22:45', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-30 17:22:45', '2022-09-30 17:22:45'),
(3712, NULL, 2, '2022-09-30 10:22:55', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 17:22:55', '2022-09-30 17:22:55'),
(3713, NULL, 2, '2022-09-30 10:23:05', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-30 17:23:05', '2022-09-30 17:23:05'),
(3714, NULL, 2, '2022-09-30 10:23:15', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 17:23:15', '2022-09-30 17:23:15'),
(3715, NULL, 2, '2022-09-30 10:23:25', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 17:23:25', '2022-09-30 17:23:25'),
(3716, NULL, 2, '2022-09-30 10:23:35', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-30 17:23:35', '2022-09-30 17:23:35'),
(3717, NULL, 2, '2022-09-30 10:23:45', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 17:23:45', '2022-09-30 17:23:45'),
(3718, NULL, 2, '2022-09-30 10:23:55', '104.5607253', '32.3532984', 'Unknown Location Found', '2022-09-30 17:23:55', '2022-09-30 17:23:55'),
(3719, NULL, 2, '2022-09-30 10:24:05', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 17:24:05', '2022-09-30 17:24:05'),
(3720, NULL, 2, '2022-09-30 10:24:15', '104.5607252', '32.3532984', 'Unknown Location Found', '2022-09-30 17:24:15', '2022-09-30 17:24:15'),
(3721, NULL, 2, '2022-09-30 10:24:25', '104.5607255', '32.3532991', 'Unknown Location Found', '2022-09-30 17:24:25', '2022-09-30 17:24:25'),
(3722, NULL, 2, '2022-09-30 10:24:35', '104.5607256', '32.3532985', 'Unknown Location Found', '2022-09-30 17:24:35', '2022-09-30 17:24:35'),
(3723, NULL, 2, '2022-09-30 10:24:45', '104.5607257', '32.3532991', 'Unknown Location Found', '2022-09-30 17:24:45', '2022-09-30 17:24:45'),
(3724, NULL, 2, '2022-09-30 10:24:55', '104.5607251', '32.3532983', 'Unknown Location Found', '2022-09-30 17:24:55', '2022-09-30 17:24:55'),
(3725, NULL, 2, '2022-09-30 10:25:05', '104.5607253', '32.353299', 'Unknown Location Found', '2022-09-30 17:25:05', '2022-09-30 17:25:05'),
(3726, NULL, 2, '2022-09-30 10:25:15', '104.5607256', '32.3532987', 'Unknown Location Found', '2022-09-30 17:25:15', '2022-09-30 17:25:15'),
(3727, NULL, 2, '2022-09-30 10:25:25', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 17:25:25', '2022-09-30 17:25:25'),
(3728, NULL, 2, '2022-09-30 10:25:35', '104.5607251', '32.3532989', 'Unknown Location Found', '2022-09-30 17:25:35', '2022-09-30 17:25:35'),
(3729, NULL, 2, '2022-09-30 10:25:45', '104.5607254', '32.3532985', 'Unknown Location Found', '2022-09-30 17:25:45', '2022-09-30 17:25:45'),
(3730, NULL, 2, '2022-09-30 10:25:55', '104.5607251', '32.3532987', 'Unknown Location Found', '2022-09-30 17:25:55', '2022-09-30 17:25:55'),
(3731, NULL, 2, '2022-09-30 10:26:05', '104.5607258', '32.3532983', 'Unknown Location Found', '2022-09-30 17:26:05', '2022-09-30 17:26:05'),
(3732, NULL, 2, '2022-09-30 10:26:15', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 17:26:15', '2022-09-30 17:26:15'),
(3733, NULL, 2, '2022-09-30 10:26:25', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 17:26:25', '2022-09-30 17:26:25'),
(3734, NULL, 2, '2022-09-30 10:26:35', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 17:26:35', '2022-09-30 17:26:35'),
(3735, NULL, 2, '2022-09-30 10:26:45', '104.560725', '32.3532988', 'Unknown Location Found', '2022-09-30 17:26:45', '2022-09-30 17:26:45'),
(3736, NULL, 2, '2022-09-30 10:26:55', '104.5607256', '32.3532991', 'Unknown Location Found', '2022-09-30 17:26:55', '2022-09-30 17:26:55'),
(3737, NULL, 2, '2022-09-30 10:27:05', '104.5607251', '32.3532988', 'Unknown Location Found', '2022-09-30 17:27:05', '2022-09-30 17:27:05'),
(3738, NULL, 2, '2022-09-30 10:27:15', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-30 17:27:15', '2022-09-30 17:27:15'),
(3739, NULL, 2, '2022-09-30 10:27:25', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 17:27:25', '2022-09-30 17:27:25'),
(3740, NULL, 2, '2022-09-30 10:27:35', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 17:27:35', '2022-09-30 17:27:35'),
(3741, NULL, 2, '2022-09-30 10:27:45', '104.5607255', '32.3532992', 'Unknown Location Found', '2022-09-30 17:27:45', '2022-09-30 17:27:45'),
(3742, NULL, 2, '2022-09-30 10:27:55', '104.5607257', '32.3532986', 'Unknown Location Found', '2022-09-30 17:27:55', '2022-09-30 17:27:55'),
(3743, NULL, 2, '2022-09-30 10:28:05', '104.5607254', '32.3532988', 'Unknown Location Found', '2022-09-30 17:28:05', '2022-09-30 17:28:05'),
(3744, NULL, 2, '2022-09-30 10:28:15', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 17:28:15', '2022-09-30 17:28:15'),
(3745, NULL, 2, '2022-09-30 10:28:25', '104.5607255', '32.3532985', 'Unknown Location Found', '2022-09-30 17:28:25', '2022-09-30 17:28:25'),
(3746, NULL, 2, '2022-09-30 10:28:35', '104.5607253', '32.3532991', 'Unknown Location Found', '2022-09-30 17:28:35', '2022-09-30 17:28:35'),
(3747, NULL, 2, '2022-09-30 10:28:45', '104.5607254', '32.3532984', 'Unknown Location Found', '2022-09-30 17:28:45', '2022-09-30 17:28:45'),
(3748, NULL, 2, '2022-09-30 10:28:55', '104.5607252', '32.3532987', 'Unknown Location Found', '2022-09-30 17:28:55', '2022-09-30 17:28:55'),
(3749, NULL, 2, '2022-09-30 10:29:05', '104.5607252', '32.3532991', 'Unknown Location Found', '2022-09-30 17:29:05', '2022-09-30 17:29:05'),
(3750, NULL, 2, '2022-09-30 10:29:15', '104.5607252', '32.3532992', 'Unknown Location Found', '2022-09-30 17:29:15', '2022-09-30 17:29:15'),
(3751, NULL, 2, '2022-09-30 10:29:25', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 17:29:25', '2022-09-30 17:29:25'),
(3752, NULL, 2, '2022-09-30 10:29:35', '104.5607254', '32.3532983', 'Unknown Location Found', '2022-09-30 17:29:35', '2022-09-30 17:29:35'),
(3753, NULL, 2, '2022-09-30 10:29:45', '104.5607252', '32.3532988', 'Unknown Location Found', '2022-09-30 17:29:45', '2022-09-30 17:29:45'),
(3754, NULL, 2, '2022-09-30 10:29:55', '104.5607256', '32.3532986', 'Unknown Location Found', '2022-09-30 17:29:55', '2022-09-30 17:29:55'),
(3755, NULL, 2, '2022-09-30 10:30:05', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 17:30:05', '2022-09-30 17:30:05'),
(3756, NULL, 2, '2022-09-30 10:30:15', '104.5607258', '32.3532992', 'Unknown Location Found', '2022-09-30 17:30:15', '2022-09-30 17:30:15'),
(3757, NULL, 2, '2022-09-30 10:30:25', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 17:30:25', '2022-09-30 17:30:25'),
(3758, NULL, 2, '2022-09-30 10:30:35', '104.5607253', '32.3532992', 'Unknown Location Found', '2022-09-30 17:30:35', '2022-09-30 17:30:35'),
(3759, NULL, 2, '2022-09-30 10:30:45', '104.5607254', '32.3532989', 'Unknown Location Found', '2022-09-30 17:30:45', '2022-09-30 17:30:45'),
(3760, NULL, 2, '2022-09-30 10:30:55', '104.5607253', '32.3532989', 'Unknown Location Found', '2022-09-30 17:30:55', '2022-09-30 17:30:55'),
(3761, NULL, 2, '2022-09-30 10:31:05', '104.5607253', '32.3532986', 'Unknown Location Found', '2022-09-30 17:31:05', '2022-09-30 17:31:05'),
(3762, NULL, 2, '2022-09-30 10:31:15', '104.5607253', '32.3532987', 'Unknown Location Found', '2022-09-30 17:31:15', '2022-09-30 17:31:15'),
(3763, NULL, 2, '2022-09-30 10:31:25', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 17:31:25', '2022-09-30 17:31:25'),
(3764, NULL, 2, '2022-09-30 10:31:35', '104.5607251', '32.3532991', 'Unknown Location Found', '2022-09-30 17:31:35', '2022-09-30 17:31:35'),
(3765, NULL, 2, '2022-09-30 10:31:45', '104.5607251', '32.353299', 'Unknown Location Found', '2022-09-30 17:31:45', '2022-09-30 17:31:45'),
(3766, NULL, 2, '2022-09-30 10:31:55', '104.5607254', '32.3532987', 'Unknown Location Found', '2022-09-30 17:31:55', '2022-09-30 17:31:55'),
(3767, NULL, 2, '2022-09-30 10:32:05', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-30 17:32:05', '2022-09-30 17:32:05'),
(3768, NULL, 2, '2022-09-30 10:32:24', '104.5607258', '32.3532984', 'Unknown Location Found', '2022-09-30 17:32:24', '2022-09-30 17:32:24'),
(3769, NULL, 2, '2022-09-30 10:32:34', '104.5607252', '32.353299', 'Unknown Location Found', '2022-09-30 17:32:34', '2022-09-30 17:32:34'),
(3770, NULL, 2, '2022-09-30 10:32:44', '104.5607256', '32.3532992', 'Unknown Location Found', '2022-09-30 17:32:44', '2022-09-30 17:32:44'),
(3771, NULL, 2, '2022-09-30 10:32:54', '104.5607256', '32.3532988', 'Unknown Location Found', '2022-09-30 17:32:54', '2022-09-30 17:32:54'),
(3772, NULL, 2, '2022-09-30 10:33:04', '104.5607257', '32.3532988', 'Unknown Location Found', '2022-09-30 17:33:04', '2022-09-30 17:33:04'),
(3773, NULL, 2, '2022-09-30 10:33:14', '104.5607256', '32.3532989', 'Unknown Location Found', '2022-09-30 17:33:14', '2022-09-30 17:33:14'),
(3774, NULL, 2, '2022-09-30 10:33:24', '104.5607258', '32.3532989', 'Unknown Location Found', '2022-09-30 17:33:24', '2022-09-30 17:33:24'),
(3775, NULL, 2, '2022-09-30 10:33:34', '104.5607258', '32.3532991', 'Unknown Location Found', '2022-09-30 17:33:34', '2022-09-30 17:33:34'),
(3776, NULL, 2, '2022-09-30 10:33:44', '104.5607254', '32.353299', 'Unknown Location Found', '2022-09-30 17:33:44', '2022-09-30 17:33:44'),
(3777, NULL, 2, '2022-09-30 10:33:54', '104.5607251', '32.3532984', 'Unknown Location Found', '2022-09-30 17:33:54', '2022-09-30 17:33:54'),
(3778, NULL, 2, '2022-09-30 10:34:04', '104.560725', '32.353299', 'Unknown Location Found', '2022-09-30 17:34:04', '2022-09-30 17:34:04'),
(3779, NULL, 2, '2022-09-30 10:34:14', '104.5607252', '32.3532983', 'Unknown Location Found', '2022-09-30 17:34:14', '2022-09-30 17:34:14'),
(3780, NULL, 2, '2022-09-30 10:34:24', '104.5607253', '32.3532985', 'Unknown Location Found', '2022-09-30 17:34:24', '2022-09-30 17:34:24'),
(3781, NULL, 2, '2022-09-30 10:34:34', '104.5607254', '32.3532986', 'Unknown Location Found', '2022-09-30 17:34:34', '2022-09-30 17:34:34'),
(3782, NULL, 4, '2022-10-05 21:31:37', '31.3411529', '30.0767156', '12, Nasr City, EG', '2022-10-06 04:31:37', '2022-10-06 04:31:37'),
(3783, NULL, 4, '2022-10-05 21:31:47', '31.3411236', '30.0766908', '12, Nasr City, EG', '2022-10-06 04:31:47', '2022-10-06 04:31:47'),
(3784, NULL, 4, '2022-10-05 21:31:56', '31.3411552', '30.0767642', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:31:56', '2022-10-06 04:31:56'),
(3785, NULL, 4, '2022-10-05 21:32:06', '31.3411191', '30.0765911', '38GR+JFP, Nasr City, EG', '2022-10-06 04:32:06', '2022-10-06 04:32:06'),
(3786, NULL, 4, '2022-10-05 21:32:19', '31.3410567', '30.0765827', '12, Nasr City, EG', '2022-10-06 04:32:19', '2022-10-06 04:32:19'),
(3787, NULL, 4, '2022-10-05 21:32:31', '31.3409829', '30.0765241', '16, Nasr City, EG', '2022-10-06 04:32:31', '2022-10-06 04:32:31'),
(3788, NULL, 4, '2022-10-05 21:33:05', '31.3410669', '30.0765031', '16, Nasr City, EG', '2022-10-06 04:33:05', '2022-10-06 04:33:05'),
(3789, NULL, 4, '2022-10-05 21:33:14', '31.3410398', '30.0765287', '16, Nasr City, EG', '2022-10-06 04:33:14', '2022-10-06 04:33:14'),
(3790, NULL, 4, '2022-10-05 21:34:41', '31.3409174', '30.076522', '38GR+H92, Nasr City, EG', '2022-10-06 04:34:41', '2022-10-06 04:34:41'),
(3791, NULL, 4, '2022-10-05 21:35:03', '31.3409298', '30.0765012', '38GR+H92, Nasr City, EG', '2022-10-06 04:35:03', '2022-10-06 04:35:03'),
(3792, NULL, 4, '2022-10-05 21:38:09', '31.3409172', '30.0763503', '38GR+H92, Nasr City, EG', '2022-10-06 04:38:09', '2022-10-06 04:38:09'),
(3793, NULL, 4, '2022-10-05 21:38:15', '31.3409425', '30.0763331', '38GR+H92, Nasr City, EG', '2022-10-06 04:38:15', '2022-10-06 04:38:15'),
(3794, NULL, 4, '2022-10-05 21:38:25', '31.3411467', '30.0767601', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:38:25', '2022-10-06 04:38:25'),
(3795, NULL, 4, '2022-10-05 21:38:35', '31.3410574', '30.0765209', '16, Nasr City, EG', '2022-10-06 04:38:35', '2022-10-06 04:38:35'),
(3796, NULL, 4, '2022-10-05 21:38:46', '31.3411801', '30.0768374', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:38:46', '2022-10-06 04:38:46'),
(3797, NULL, 4, '2022-10-05 21:38:58', '31.3411019', '30.0765566', '38GR+JFP, Nasr City, EG', '2022-10-06 04:38:58', '2022-10-06 04:38:58'),
(3798, NULL, 4, '2022-10-05 21:39:06', '31.3411078', '30.0767554', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:39:06', '2022-10-06 04:39:06'),
(3799, NULL, 4, '2022-10-05 21:39:57', '31.3410925', '30.0765324', '16, Nasr City, EG', '2022-10-06 04:39:57', '2022-10-06 04:39:57'),
(3800, NULL, 4, '2022-10-05 21:46:16', '31.340961', '30.0764994', '38GR+H92, Nasr City, EG', '2022-10-06 04:46:16', '2022-10-06 04:46:16'),
(3801, NULL, 4, '2022-10-05 21:47:15', '31.3409942', '30.0765566', '16, Nasr City, EG', '2022-10-06 04:47:15', '2022-10-06 04:47:15'),
(3802, NULL, 4, '2022-10-05 21:47:57', '31.340977', '30.076545', '7, Nasr City, EG', '2022-10-06 04:47:57', '2022-10-06 04:47:57'),
(3803, NULL, 4, '2022-10-05 21:48:06', '31.341147', '30.0768175', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:48:06', '2022-10-06 04:48:06'),
(3804, NULL, 4, '2022-10-05 21:48:16', '31.3411877', '30.0768765', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:48:16', '2022-10-06 04:48:16'),
(3805, NULL, 4, '2022-10-05 21:48:24', '31.3411947', '30.0768812', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:48:24', '2022-10-06 04:48:24'),
(3806, NULL, 4, '2022-10-05 21:48:35', '31.3409976', '30.0764745', '16, Nasr City, EG', '2022-10-06 04:48:35', '2022-10-06 04:48:35'),
(3807, NULL, 4, '2022-10-05 21:48:46', '31.3410751', '30.0764919', '16, Nasr City, EG', '2022-10-06 04:48:46', '2022-10-06 04:48:46'),
(3808, NULL, 4, '2022-10-05 21:48:55', '31.3411204', '30.0767671', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:48:55', '2022-10-06 04:48:55'),
(3809, NULL, 4, '2022-10-05 21:49:06', '31.3411865', '30.0768499', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:49:06', '2022-10-06 04:49:06'),
(3810, NULL, 4, '2022-10-05 21:49:15', '31.3411911', '30.0768413', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:49:15', '2022-10-06 04:49:15'),
(3811, NULL, 4, '2022-10-05 21:49:24', '31.3410387', '30.0765269', '16, Nasr City, EG', '2022-10-06 04:49:24', '2022-10-06 04:49:24'),
(3812, NULL, 4, '2022-10-05 21:49:35', '31.3410346', '30.0765188', '16, Nasr City, EG', '2022-10-06 04:49:35', '2022-10-06 04:49:35'),
(3813, NULL, 4, '2022-10-05 21:49:45', '31.3410957', '30.0765228', '16, Nasr City, EG', '2022-10-06 04:49:45', '2022-10-06 04:49:45'),
(3814, NULL, 4, '2022-10-05 21:49:54', '31.3411297', '30.0767398', '12, Nasr City, EG', '2022-10-06 04:49:54', '2022-10-06 04:49:54'),
(3815, NULL, 4, '2022-10-05 21:50:06', '31.3411841', '30.0768568', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:50:06', '2022-10-06 04:50:06'),
(3816, NULL, 4, '2022-10-05 21:51:03', '31.341157', '30.0768162', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:51:03', '2022-10-06 04:51:03'),
(3817, NULL, 4, '2022-10-05 21:51:17', '31.3411752', '30.0768314', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:51:17', '2022-10-06 04:51:17'),
(3818, NULL, 4, '2022-10-05 21:51:39', '31.3410896', '30.0765171', '16, Nasr City, EG', '2022-10-06 04:51:39', '2022-10-06 04:51:39'),
(3819, NULL, 4, '2022-10-05 21:53:12', '31.341145', '30.076526', '38GR+JF5, Nasr City, EG', '2022-10-06 04:53:12', '2022-10-06 04:53:12'),
(3820, NULL, 4, '2022-10-05 21:53:13', '31.3411426', '30.0765117', '38GR+JF5, Nasr City, EG', '2022-10-06 04:53:13', '2022-10-06 04:53:13'),
(3821, NULL, 4, '2022-10-05 21:54:39', '31.3410732', '30.0764959', '16, Nasr City, EG', '2022-10-06 04:54:39', '2022-10-06 04:54:39'),
(3822, NULL, 4, '2022-10-05 21:54:43', '31.3410732', '30.0764959', '16, Nasr City, EG', '2022-10-06 04:54:43', '2022-10-06 04:54:43'),
(3823, NULL, 4, '2022-10-05 21:54:53', '31.3410633', '30.0764895', '16, Nasr City, EG', '2022-10-06 04:54:53', '2022-10-06 04:54:53'),
(3824, NULL, 4, '2022-10-05 21:55:09', '31.3409585', '30.0765417', '16, Nasr City, EG', '2022-10-06 04:55:09', '2022-10-06 04:55:09'),
(3825, NULL, 4, '2022-10-05 21:55:19', '31.3410913', '30.0765162', '16, Nasr City, EG', '2022-10-06 04:55:19', '2022-10-06 04:55:19'),
(3826, NULL, 4, '2022-10-05 21:55:29', '31.3410698', '30.0764837', '16, Nasr City, EG', '2022-10-06 04:55:29', '2022-10-06 04:55:29'),
(3827, NULL, 4, '2022-10-05 21:55:39', '31.3411849', '30.0768531', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:55:39', '2022-10-06 04:55:39'),
(3828, NULL, 4, '2022-10-05 21:55:48', '31.3411529', '30.076749', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:55:48', '2022-10-06 04:55:48'),
(3829, NULL, 4, '2022-10-05 21:55:58', '31.3411503', '30.076706', '12, Nasr City, EG', '2022-10-06 04:55:58', '2022-10-06 04:55:58'),
(3830, NULL, 4, '2022-10-05 21:56:09', '31.3411452', '30.0766931', '12, Nasr City, EG', '2022-10-06 04:56:09', '2022-10-06 04:56:09'),
(3831, NULL, 4, '2022-10-05 21:56:21', '31.3411111', '30.0766178', '12, Nasr City, EG', '2022-10-06 04:56:21', '2022-10-06 04:56:21'),
(3832, NULL, 4, '2022-10-05 21:56:31', '31.3411543', '30.0767211', '12, Nasr City, EG', '2022-10-06 04:56:31', '2022-10-06 04:56:31'),
(3833, NULL, 4, '2022-10-05 21:56:40', '31.3411839', '30.0768257', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:56:40', '2022-10-06 04:56:40'),
(3834, NULL, 4, '2022-10-05 21:56:56', '31.3411489', '30.0767813', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:56:56', '2022-10-06 04:56:56'),
(3835, NULL, 4, '2022-10-05 21:57:49', '31.3410903', '30.0764877', '16, Nasr City, EG', '2022-10-06 04:57:49', '2022-10-06 04:57:49'),
(3836, NULL, 4, '2022-10-05 21:58:01', '31.3410435', '30.0765917', '12, Nasr City, EG', '2022-10-06 04:58:01', '2022-10-06 04:58:01'),
(3837, NULL, 4, '2022-10-05 21:58:10', '31.3410451', '30.0765768', '12, Nasr City, EG', '2022-10-06 04:58:10', '2022-10-06 04:58:10'),
(3838, NULL, 4, '2022-10-05 21:58:20', '31.3411196', '30.0766862', '12, Nasr City, EG', '2022-10-06 04:58:20', '2022-10-06 04:58:20'),
(3839, NULL, 4, '2022-10-05 21:58:30', '31.3411842', '30.0768338', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:58:30', '2022-10-06 04:58:30'),
(3840, NULL, 4, '2022-10-05 21:58:40', '31.3409721', '30.0765799', '7, Nasr City, EG', '2022-10-06 04:58:40', '2022-10-06 04:58:40'),
(3841, NULL, 4, '2022-10-05 21:58:50', '31.3411226', '30.0765885', '38GR+JFP, Nasr City, EG', '2022-10-06 04:58:50', '2022-10-06 04:58:50'),
(3842, NULL, 4, '2022-10-05 21:59:01', '31.3411685', '30.0767923', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:59:01', '2022-10-06 04:59:01'),
(3843, NULL, 4, '2022-10-05 21:59:10', '31.3411869', '30.0768363', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:59:10', '2022-10-06 04:59:10'),
(3844, NULL, 4, '2022-10-05 21:59:20', '31.3411528', '30.0767304', '12, Nasr City, EG', '2022-10-06 04:59:20', '2022-10-06 04:59:20'),
(3845, NULL, 4, '2022-10-05 21:59:29', '31.3411821', '30.0768625', 'Cairo Governorate, Nasr City, EG', '2022-10-06 04:59:29', '2022-10-06 04:59:29'),
(3846, NULL, 4, '2022-10-05 21:59:42', '31.3410308', '30.076613', '12, Nasr City, EG', '2022-10-06 04:59:42', '2022-10-06 04:59:42'),
(3847, NULL, 4, '2022-10-05 21:59:52', '31.3411341', '30.0766711', '12, Nasr City, EG', '2022-10-06 04:59:52', '2022-10-06 04:59:52'),
(3848, NULL, 4, '2022-10-05 22:00:06', '31.3411527', '30.0767588', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:00:06', '2022-10-06 05:00:06'),
(3849, NULL, 4, '2022-10-05 22:01:31', '31.3410941', '30.0765859', '38GR+JFP, Nasr City, EG', '2022-10-06 05:01:31', '2022-10-06 05:01:31'),
(3850, NULL, 4, '2022-10-05 22:01:32', '31.3410978', '30.0765943', '12, Nasr City, EG', '2022-10-06 05:01:32', '2022-10-06 05:01:32'),
(3851, NULL, 4, '2022-10-05 22:01:42', '31.3410765', '30.0765031', '16, Nasr City, EG', '2022-10-06 05:01:42', '2022-10-06 05:01:42'),
(3852, NULL, 4, '2022-10-05 22:01:52', '31.3410939', '30.0765265', '16, Nasr City, EG', '2022-10-06 05:01:52', '2022-10-06 05:01:52'),
(3853, NULL, 4, '2022-10-05 22:02:27', '31.3411276', '30.0765519', '38GR+JFP, Nasr City, EG', '2022-10-06 05:02:27', '2022-10-06 05:02:27'),
(3854, NULL, 4, '2022-10-05 22:02:34', '31.3411108', '30.0765702', '38GR+JFP, Nasr City, EG', '2022-10-06 05:02:34', '2022-10-06 05:02:34'),
(3855, NULL, 4, '2022-10-05 22:02:45', '31.3411567', '30.0767823', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:02:45', '2022-10-06 05:02:45'),
(3856, NULL, 4, '2022-10-05 22:03:20', '31.3411107', '30.0766328', '12, Nasr City, EG', '2022-10-06 05:03:20', '2022-10-06 05:03:20'),
(3857, NULL, 4, '2022-10-05 22:03:29', '31.3411661', '30.0768352', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:03:29', '2022-10-06 05:03:29'),
(3858, NULL, 4, '2022-10-05 22:04:03', '31.3411407', '30.0766255', '12, Nasr City, EG', '2022-10-06 05:04:03', '2022-10-06 05:04:03'),
(3859, NULL, 4, '2022-10-05 22:04:10', '31.3410989', '30.0765636', '38GR+JFP, Nasr City, EG', '2022-10-06 05:04:10', '2022-10-06 05:04:10'),
(3860, NULL, 4, '2022-10-05 22:07:14', '31.3411716', '30.0768024', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:07:14', '2022-10-06 05:07:14'),
(3861, NULL, 4, '2022-10-05 22:07:22', '31.3410984', '30.0765717', '38GR+JFP, Nasr City, EG', '2022-10-06 05:07:22', '2022-10-06 05:07:22'),
(3862, NULL, 4, '2022-10-05 22:07:31', '31.3411446', '30.0767727', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:07:31', '2022-10-06 05:07:31'),
(3863, NULL, 4, '2022-10-05 22:08:34', '31.3411401', '30.076687', '12, Nasr City, EG', '2022-10-06 05:08:34', '2022-10-06 05:08:34'),
(3864, NULL, 4, '2022-10-05 22:08:37', '31.34114', '30.0767185', '12, Nasr City, EG', '2022-10-06 05:08:37', '2022-10-06 05:08:37'),
(3865, NULL, 4, '2022-10-05 22:09:07', '31.3411428', '30.0765404', '38GR+JFP, Nasr City, EG', '2022-10-06 05:09:07', '2022-10-06 05:09:07'),
(3866, NULL, 4, '2022-10-05 22:09:08', '31.3411675', '30.0767072', '12, Nasr City, EG', '2022-10-06 05:09:08', '2022-10-06 05:09:08');
INSERT INTO `delivery_histories` (`id`, `order_id`, `delivery_man_id`, `time`, `longitude`, `latitude`, `location`, `created_at`, `updated_at`) VALUES
(3867, NULL, 4, '2022-10-05 22:09:41', '31.3432623', '30.0759786', '38GV+HGJ, Nasr City, EG', '2022-10-06 05:09:41', '2022-10-06 05:09:41'),
(3868, NULL, 4, '2022-10-05 22:09:51', '31.3412708', '30.0765867', '38GR+JFP, Nasr City, EG', '2022-10-06 05:09:51', '2022-10-06 05:09:51'),
(3869, NULL, 4, '2022-10-05 22:10:00', '31.3410802', '30.0766963', '12, Nasr City, EG', '2022-10-06 05:10:00', '2022-10-06 05:10:00'),
(3870, NULL, 4, '2022-10-05 22:10:10', '31.3410698', '30.0766067', '12, Nasr City, EG', '2022-10-06 05:10:10', '2022-10-06 05:10:10'),
(3871, NULL, 4, '2022-10-05 22:10:20', '31.3410872', '30.0766327', '12, Nasr City, EG', '2022-10-06 05:10:20', '2022-10-06 05:10:20'),
(3872, NULL, 4, '2022-10-05 22:10:29', '31.3409897', '30.0765834', '12, Nasr City, EG', '2022-10-06 05:10:29', '2022-10-06 05:10:29'),
(3873, NULL, 4, '2022-10-05 22:10:38', '31.3411643', '30.0768063', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:10:38', '2022-10-06 05:10:38'),
(3874, NULL, 4, '2022-10-05 22:10:48', '31.3410336', '30.0765899', '12, Nasr City, EG', '2022-10-06 05:10:48', '2022-10-06 05:10:48'),
(3875, NULL, 4, '2022-10-05 22:12:43', '31.3411901', '30.0768377', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:12:43', '2022-10-06 05:12:43'),
(3876, NULL, 4, '2022-10-05 22:12:48', '31.3411901', '30.0768377', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:12:48', '2022-10-06 05:12:48'),
(3877, NULL, 4, '2022-10-05 22:13:05', '31.3411151', '30.0765212', '16, Nasr City, EG', '2022-10-06 05:13:05', '2022-10-06 05:13:05'),
(3878, NULL, 4, '2022-10-05 22:13:47', '31.3409519', '30.0765338', '16, Nasr City, EG', '2022-10-06 05:13:47', '2022-10-06 05:13:47'),
(3879, NULL, 4, '2022-10-05 22:13:57', '31.3410881', '30.0765578', '38GR+JFP, Nasr City, EG', '2022-10-06 05:13:57', '2022-10-06 05:13:57'),
(3880, NULL, 4, '2022-10-05 22:25:11', '31.3410627', '30.0764453', '16, Nasr City, EG', '2022-10-06 05:25:11', '2022-10-06 05:25:11'),
(3881, NULL, 4, '2022-10-05 22:25:33', '31.3411923', '30.0768411', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:25:33', '2022-10-06 05:25:33'),
(3882, NULL, 4, '2022-10-05 22:25:40', '31.3411923', '30.0768411', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:25:40', '2022-10-06 05:25:40'),
(3883, NULL, 4, '2022-10-05 22:25:58', '31.3411263', '30.0767832', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:25:58', '2022-10-06 05:25:58'),
(3884, NULL, 4, '2022-10-05 22:26:08', '31.3410463', '30.0765275', '16, Nasr City, EG', '2022-10-06 05:26:08', '2022-10-06 05:26:08'),
(3885, NULL, 4, '2022-10-05 22:26:18', '31.3411379', '30.0765987', '38GR+JFP, Nasr City, EG', '2022-10-06 05:26:18', '2022-10-06 05:26:18'),
(3886, NULL, 4, '2022-10-05 22:26:28', '31.3411037', '30.0766196', '12, Nasr City, EG', '2022-10-06 05:26:28', '2022-10-06 05:26:28'),
(3887, NULL, 4, '2022-10-05 22:26:57', '31.3410822', '30.0765077', '16, Nasr City, EG', '2022-10-06 05:26:57', '2022-10-06 05:26:57'),
(3888, NULL, 4, '2022-10-05 22:28:42', '31.3411464', '30.0767513', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:28:42', '2022-10-06 05:28:42'),
(3889, NULL, 4, '2022-10-05 22:28:47', '31.3411464', '30.0767513', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:28:47', '2022-10-06 05:28:47'),
(3890, NULL, 4, '2022-10-05 22:29:47', '31.3411586', '30.0767281', '12, Nasr City, EG', '2022-10-06 05:29:47', '2022-10-06 05:29:47'),
(3891, NULL, 4, '2022-10-05 22:29:54', '31.3411586', '30.0767281', '12, Nasr City, EG', '2022-10-06 05:29:54', '2022-10-06 05:29:54'),
(3892, NULL, 4, '2022-10-05 22:30:06', '31.3410854', '30.0766922', '12, Nasr City, EG', '2022-10-06 05:30:06', '2022-10-06 05:30:06'),
(3893, NULL, 4, '2022-10-05 22:30:16', '31.3411737', '30.076816', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:30:16', '2022-10-06 05:30:16'),
(3894, NULL, 4, '2022-10-05 22:30:27', '31.3411812', '30.076827', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:30:27', '2022-10-06 05:30:27'),
(3895, NULL, 4, '2022-10-05 22:30:40', '31.3411724', '30.0768173', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:30:40', '2022-10-06 05:30:40'),
(3896, NULL, 4, '2022-10-05 22:30:51', '31.3411597', '30.0768038', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:30:51', '2022-10-06 05:30:51'),
(3897, NULL, 4, '2022-10-05 22:31:00', '31.3411539', '30.0767746', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:31:00', '2022-10-06 05:31:00'),
(3898, NULL, 4, '2022-10-05 22:31:15', '31.3411626', '30.076786', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:31:15', '2022-10-06 05:31:15'),
(3899, NULL, 4, '2022-10-05 22:32:02', '31.3411567', '30.0768057', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:32:02', '2022-10-06 05:32:02'),
(3900, NULL, 4, '2022-10-05 22:32:05', '31.3411567', '30.0768057', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:32:05', '2022-10-06 05:32:05'),
(3901, NULL, 4, '2022-10-05 22:32:26', '31.341473', '30.0768999', '38GR+QJ2, Nasr City, EG', '2022-10-06 05:32:26', '2022-10-06 05:32:26'),
(3902, NULL, 4, '2022-10-05 22:32:38', '31.3411934', '30.0768149', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:32:38', '2022-10-06 05:32:38'),
(3903, NULL, 4, '2022-10-05 22:32:50', '31.3411216', '30.0767445', '12, Nasr City, EG', '2022-10-06 05:32:50', '2022-10-06 05:32:50'),
(3904, NULL, 4, '2022-10-05 22:33:02', '31.3411545', '30.0767642', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:33:02', '2022-10-06 05:33:02'),
(3905, NULL, 4, '2022-10-05 22:33:20', '31.3411482', '30.0767682', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:33:20', '2022-10-06 05:33:20'),
(3906, NULL, 4, '2022-10-05 22:33:32', '31.3411475', '30.0767899', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:33:32', '2022-10-06 05:33:32'),
(3907, NULL, 4, '2022-10-05 22:33:45', '31.3411677', '30.0768119', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:33:45', '2022-10-06 05:33:45'),
(3908, NULL, 4, '2022-10-05 22:33:56', '31.3411754', '30.0768102', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:33:56', '2022-10-06 05:33:56'),
(3909, NULL, 4, '2022-10-05 22:34:10', '31.3409867', '30.0765873', '12, Nasr City, EG', '2022-10-06 05:34:10', '2022-10-06 05:34:10'),
(3910, NULL, 4, '2022-10-05 22:34:19', '31.3410358', '30.0764724', '16, Nasr City, EG', '2022-10-06 05:34:19', '2022-10-06 05:34:19'),
(3911, NULL, 4, '2022-10-05 22:34:36', '31.3410688', '30.0765644', '12, Nasr City, EG', '2022-10-06 05:34:36', '2022-10-06 05:34:36'),
(3912, NULL, 4, '2022-10-05 22:35:35', '31.3410758', '30.0764322', '38GR+HCG, Nasr City, EG', '2022-10-06 05:35:35', '2022-10-06 05:35:35'),
(3913, NULL, 4, '2022-10-05 22:35:36', '31.3410758', '30.0764322', '38GR+HCG, Nasr City, EG', '2022-10-06 05:35:36', '2022-10-06 05:35:36'),
(3914, NULL, 4, '2022-10-05 22:42:02', '31.3410437', '30.0764123', '38GR+HCG, Nasr City, EG', '2022-10-06 05:42:02', '2022-10-06 05:42:02'),
(3915, NULL, 4, '2022-10-05 22:42:07', '31.3410437', '30.0764123', '38GR+HCG, Nasr City, EG', '2022-10-06 05:42:07', '2022-10-06 05:42:07'),
(3916, NULL, 4, '2022-10-05 22:43:00', '31.3411393', '30.0766798', '12, Nasr City, EG', '2022-10-06 05:43:00', '2022-10-06 05:43:00'),
(3917, NULL, 4, '2022-10-05 22:44:54', '31.3425475', '30.0751934', '38GV+63J, Nasr City, EG', '2022-10-06 05:44:54', '2022-10-06 05:44:54'),
(3918, NULL, 4, '2022-10-05 22:44:55', '31.3425475', '30.0751934', '38GV+63J, Nasr City, EG', '2022-10-06 05:44:55', '2022-10-06 05:44:55'),
(3919, NULL, 4, '2022-10-05 22:46:21', '31.3411034', '30.0765619', '38GR+JFP, Nasr City, EG', '2022-10-06 05:46:21', '2022-10-06 05:46:21'),
(3920, NULL, 4, '2022-10-05 22:47:22', '31.3411009', '30.0764921', '16, Nasr City, EG', '2022-10-06 05:47:22', '2022-10-06 05:47:22'),
(3921, NULL, 4, '2022-10-05 22:47:27', '31.3411009', '30.0764921', '16, Nasr City, EG', '2022-10-06 05:47:27', '2022-10-06 05:47:27'),
(3922, NULL, 4, '2022-10-05 22:47:36', '31.3410637', '30.0765605', '12, Nasr City, EG', '2022-10-06 05:47:36', '2022-10-06 05:47:36'),
(3923, NULL, 4, '2022-10-05 22:47:47', '31.3410523', '30.0765299', '16, Nasr City, EG', '2022-10-06 05:47:47', '2022-10-06 05:47:47'),
(3924, NULL, 4, '2022-10-05 22:48:07', '31.3411923', '30.0767383', 'Unknown Location Found', '2022-10-06 05:48:07', '2022-10-06 05:48:07'),
(3925, NULL, 4, '2022-10-05 22:48:12', '31.3411851', '30.0768428', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:48:12', '2022-10-06 05:48:12'),
(3926, NULL, 4, '2022-10-05 22:48:24', '31.3411123', '30.0766464', '12, Nasr City, EG', '2022-10-06 05:48:24', '2022-10-06 05:48:24'),
(3927, NULL, 4, '2022-10-05 22:48:39', '31.341062', '30.0764862', '16, Nasr City, EG', '2022-10-06 05:48:39', '2022-10-06 05:48:39'),
(3928, NULL, 4, '2022-10-05 22:48:56', '31.3411389', '30.0767939', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:48:56', '2022-10-06 05:48:56'),
(3929, NULL, 4, '2022-10-05 22:49:38', '31.3410452', '30.0764058', '38GR+HCG, Nasr City, EG', '2022-10-06 05:49:38', '2022-10-06 05:49:38'),
(3930, NULL, 4, '2022-10-05 22:50:07', '31.3411922', '30.0768381', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:50:07', '2022-10-06 05:50:07'),
(3931, NULL, 4, '2022-10-05 22:50:50', '31.3410822', '30.076542', '16, Nasr City, EG', '2022-10-06 05:50:50', '2022-10-06 05:50:50'),
(3932, NULL, 4, '2022-10-05 22:50:59', '31.3410822', '30.076542', '16, Nasr City, EG', '2022-10-06 05:50:59', '2022-10-06 05:50:59'),
(3933, NULL, 4, '2022-10-05 22:51:10', '31.3410173', '30.0766178', '12, Nasr City, EG', '2022-10-06 05:51:10', '2022-10-06 05:51:10'),
(3934, NULL, 4, '2022-10-05 22:51:19', '31.3409627', '30.0765355', '16, Nasr City, EG', '2022-10-06 05:51:19', '2022-10-06 05:51:19'),
(3935, NULL, 4, '2022-10-05 22:51:29', '31.3410728', '30.0766083', '12, Nasr City, EG', '2022-10-06 05:51:29', '2022-10-06 05:51:29'),
(3936, NULL, 4, '2022-10-05 22:51:39', '31.3409541', '30.0765352', '16, Nasr City, EG', '2022-10-06 05:51:39', '2022-10-06 05:51:39'),
(3937, NULL, 4, '2022-10-05 22:51:50', '31.3410339', '30.0763884', '38GR+HCG, Nasr City, EG', '2022-10-06 05:51:50', '2022-10-06 05:51:50'),
(3938, NULL, 4, '2022-10-05 22:51:59', '31.3411264', '30.0765382', '38GR+JF5, Nasr City, EG', '2022-10-06 05:51:59', '2022-10-06 05:51:59'),
(3939, NULL, 4, '2022-10-05 22:56:20', '31.3410903', '30.0766295', '12, Nasr City, EG', '2022-10-06 05:56:20', '2022-10-06 05:56:20'),
(3940, NULL, 4, '2022-10-05 22:56:24', '31.3410903', '30.0766295', '12, Nasr City, EG', '2022-10-06 05:56:24', '2022-10-06 05:56:24'),
(3941, NULL, 4, '2022-10-05 22:56:34', '31.3411816', '30.076848', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:56:34', '2022-10-06 05:56:34'),
(3942, NULL, 4, '2022-10-05 22:57:08', '31.3411434', '30.0768031', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:57:08', '2022-10-06 05:57:08'),
(3943, NULL, 4, '2022-10-05 22:57:14', '31.3411434', '30.0768031', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:57:14', '2022-10-06 05:57:14'),
(3944, NULL, 4, '2022-10-05 22:57:24', '31.3411801', '30.0768595', 'Cairo Governorate, Nasr City, EG', '2022-10-06 05:57:24', '2022-10-06 05:57:24'),
(3945, NULL, 4, '2022-10-05 22:58:06', '31.3410317', '30.07655', '16, Nasr City, EG', '2022-10-06 05:58:06', '2022-10-06 05:58:06'),
(3946, NULL, 4, '2022-10-05 22:58:16', '31.3411213', '30.076712', '12, Nasr City, EG', '2022-10-06 05:58:16', '2022-10-06 05:58:16'),
(3947, NULL, 4, '2022-10-10 11:13:24', '31.3409985', '30.0888063', '72, Heliopolis, EG', '2022-10-10 18:13:24', '2022-10-10 18:13:24'),
(3948, NULL, 4, '2022-10-10 11:13:33', '31.3409975', '30.0887989', '72, Heliopolis, EG', '2022-10-10 18:13:33', '2022-10-10 18:13:33'),
(3949, NULL, 4, '2022-10-10 11:13:43', '31.3410105', '30.0888168', '72, Heliopolis, EG', '2022-10-10 18:13:43', '2022-10-10 18:13:43'),
(3950, NULL, 4, '2022-10-10 11:13:54', '31.3409956', '30.0888115', '72, Heliopolis, EG', '2022-10-10 18:13:54', '2022-10-10 18:13:54'),
(3951, NULL, 4, '2022-10-10 11:14:03', '31.3410115', '30.0888162', '72, Heliopolis, EG', '2022-10-10 18:14:03', '2022-10-10 18:14:03'),
(3952, NULL, 4, '2022-10-10 11:14:13', '31.3410126', '30.0888198', '72, Heliopolis, EG', '2022-10-10 18:14:13', '2022-10-10 18:14:13'),
(3953, NULL, 4, '2022-10-10 11:14:24', '31.3410161', '30.0888072', '72, Heliopolis, EG', '2022-10-10 18:14:24', '2022-10-10 18:14:24'),
(3954, NULL, 4, '2022-10-10 11:14:33', '31.3410113', '30.0888189', '72, Heliopolis, EG', '2022-10-10 18:14:33', '2022-10-10 18:14:33'),
(3955, NULL, 4, '2022-10-10 11:14:44', '31.3409981', '30.0888071', '72, Heliopolis, EG', '2022-10-10 18:14:44', '2022-10-10 18:14:44'),
(3956, NULL, 4, '2022-10-10 11:14:55', '31.3409993', '30.0887942', '72, Heliopolis, EG', '2022-10-10 18:14:55', '2022-10-10 18:14:55'),
(3957, NULL, 4, '2022-10-10 11:15:04', '31.3410047', '30.0887956', '72, Heliopolis, EG', '2022-10-10 18:15:04', '2022-10-10 18:15:04'),
(3958, NULL, 4, '2022-10-10 11:15:28', '31.3411178', '30.0869339', 'Nozha Bridge Exit, Heliopolis, EG', '2022-10-10 18:15:28', '2022-10-10 18:15:28'),
(3959, NULL, 4, '2022-10-10 11:15:45', '31.3410045', '30.0888014', '72, Heliopolis, EG', '2022-10-10 18:15:45', '2022-10-10 18:15:45'),
(3960, NULL, 4, '2022-10-10 11:16:02', '31.3409998', '30.0887886', '72, Heliopolis, EG', '2022-10-10 18:16:02', '2022-10-10 18:16:02'),
(3961, NULL, 4, '2022-10-10 11:17:07', '31.3410142', '30.0887938', '72, Heliopolis, EG', '2022-10-10 18:17:07', '2022-10-10 18:17:07'),
(3962, NULL, 4, '2022-10-10 11:17:32', '31.3410057', '30.0887927', '72, Heliopolis, EG', '2022-10-10 18:17:32', '2022-10-10 18:17:32'),
(3963, NULL, 4, '2022-10-10 11:17:38', '31.3410057', '30.0887927', '72, Heliopolis, EG', '2022-10-10 18:17:38', '2022-10-10 18:17:38'),
(3964, NULL, 4, '2022-10-10 11:17:48', '31.3410027', '30.0887916', '72, Heliopolis, EG', '2022-10-10 18:17:48', '2022-10-10 18:17:48'),
(3965, NULL, 4, '2022-10-10 11:17:58', '31.3410009', '30.0887884', '72, Heliopolis, EG', '2022-10-10 18:17:58', '2022-10-10 18:17:58'),
(3966, NULL, 4, '2022-10-10 11:18:08', '31.3410066', '30.0888004', '72, Heliopolis, EG', '2022-10-10 18:18:08', '2022-10-10 18:18:08'),
(3967, NULL, 4, '2022-10-10 11:18:18', '31.3410062', '30.0887962', '72, Heliopolis, EG', '2022-10-10 18:18:18', '2022-10-10 18:18:18'),
(3968, NULL, 4, '2022-10-10 11:18:28', '31.3410084', '30.0887932', '72, Heliopolis, EG', '2022-10-10 18:18:28', '2022-10-10 18:18:28'),
(3969, NULL, 4, '2022-10-10 11:18:38', '31.3410159', '30.0888184', '72, Heliopolis, EG', '2022-10-10 18:18:38', '2022-10-10 18:18:38'),
(3970, NULL, 4, '2022-10-10 11:19:01', '31.3409938', '30.0888236', '72, Heliopolis, EG', '2022-10-10 18:19:01', '2022-10-10 18:19:01'),
(3971, NULL, 4, '2022-10-10 11:19:12', '31.3410059', '30.0887964', '72, Heliopolis, EG', '2022-10-10 18:19:12', '2022-10-10 18:19:12'),
(3972, NULL, 4, '2022-10-10 11:19:22', '31.3409956', '30.0888123', '72, Heliopolis, EG', '2022-10-10 18:19:22', '2022-10-10 18:19:22'),
(3973, NULL, 4, '2022-10-10 11:19:32', '31.3410064', '30.0888019', '72, Heliopolis, EG', '2022-10-10 18:19:32', '2022-10-10 18:19:32'),
(3974, NULL, 4, '2022-10-10 11:20:01', '31.3410093', '30.0888308', '72, Heliopolis, EG', '2022-10-10 18:20:01', '2022-10-10 18:20:01'),
(3975, NULL, 4, '2022-10-10 11:20:01', '31.3410093', '30.0888308', '72, Heliopolis, EG', '2022-10-10 18:20:01', '2022-10-10 18:20:01'),
(3976, NULL, 4, '2022-10-10 11:20:11', '31.3409966', '30.0888098', '72, Heliopolis, EG', '2022-10-10 18:20:11', '2022-10-10 18:20:11'),
(3977, NULL, 4, '2022-10-10 11:20:28', '31.3410079', '30.0888123', '72, Heliopolis, EG', '2022-10-10 18:20:28', '2022-10-10 18:20:28'),
(3978, NULL, 4, '2022-10-10 11:20:31', '31.3410079', '30.0888123', '72, Heliopolis, EG', '2022-10-10 18:20:31', '2022-10-10 18:20:31'),
(3979, NULL, 4, '2022-10-10 11:20:41', '31.3410092', '30.0888033', '72, Heliopolis, EG', '2022-10-10 18:20:41', '2022-10-10 18:20:41'),
(3980, NULL, 4, '2022-10-10 11:23:17', '31.3410022', '30.0888012', '72, Heliopolis, EG', '2022-10-10 18:23:17', '2022-10-10 18:23:17'),
(3981, NULL, 4, '2022-10-10 11:23:21', '31.3410025', '30.0888037', '72, Heliopolis, EG', '2022-10-10 18:23:21', '2022-10-10 18:23:21'),
(3982, NULL, 4, '2022-10-10 11:23:31', '31.3410194', '30.0888175', '72, Heliopolis, EG', '2022-10-10 18:23:31', '2022-10-10 18:23:31'),
(3983, NULL, 4, '2022-10-10 11:23:41', '31.3410198', '30.0888265', '72, Heliopolis, EG', '2022-10-10 18:23:41', '2022-10-10 18:23:41'),
(3984, NULL, 4, '2022-10-10 11:23:57', '31.3410147', '30.0888055', '72, Heliopolis, EG', '2022-10-10 18:23:57', '2022-10-10 18:23:57'),
(3985, NULL, 4, '2022-10-10 11:24:01', '31.3410147', '30.0888055', '72, Heliopolis, EG', '2022-10-10 18:24:01', '2022-10-10 18:24:01'),
(3986, NULL, 4, '2022-10-10 11:24:15', '31.341002', '30.0888063', '72, Heliopolis, EG', '2022-10-10 18:24:15', '2022-10-10 18:24:15'),
(3987, NULL, 4, '2022-10-10 11:24:22', '31.3409887', '30.0887975', '72, Heliopolis, EG', '2022-10-10 18:24:22', '2022-10-10 18:24:22'),
(3988, NULL, 4, '2022-10-10 11:24:32', '31.3410091', '30.0888106', '72, Heliopolis, EG', '2022-10-10 18:24:32', '2022-10-10 18:24:32'),
(3989, NULL, 4, '2022-10-10 11:24:42', '31.3410163', '30.0888153', '72, Heliopolis, EG', '2022-10-10 18:24:42', '2022-10-10 18:24:42'),
(3990, NULL, 4, '2022-10-10 11:24:52', '31.3410183', '30.0888272', '72, Heliopolis, EG', '2022-10-10 18:24:52', '2022-10-10 18:24:52'),
(3991, NULL, 4, '2022-10-10 11:25:02', '31.3409873', '30.0888042', '72, Heliopolis, EG', '2022-10-10 18:25:02', '2022-10-10 18:25:02'),
(3992, NULL, 4, '2022-10-10 11:27:14', '31.3409996', '30.0888005', '72, Heliopolis, EG', '2022-10-10 18:27:14', '2022-10-10 18:27:14'),
(3993, NULL, 4, '2022-10-10 11:27:58', '31.3410105', '30.0888034', '72, Heliopolis, EG', '2022-10-10 18:27:58', '2022-10-10 18:27:58'),
(3994, NULL, 4, '2022-10-10 11:28:04', '31.3410147', '30.0888024', '72, Heliopolis, EG', '2022-10-10 18:28:04', '2022-10-10 18:28:04'),
(3995, NULL, 4, '2022-10-10 11:28:14', '31.3410028', '30.0887966', '72, Heliopolis, EG', '2022-10-10 18:28:14', '2022-10-10 18:28:14'),
(3996, NULL, 4, '2022-10-10 11:28:24', '31.3409965', '30.088794', '72, Heliopolis, EG', '2022-10-10 18:28:24', '2022-10-10 18:28:24'),
(3997, NULL, 4, '2022-10-10 11:28:34', '31.3410002', '30.0888067', '72, Heliopolis, EG', '2022-10-10 18:28:34', '2022-10-10 18:28:34'),
(3998, NULL, 4, '2022-10-10 11:28:51', '31.3410113', '30.0888103', '72, Heliopolis, EG', '2022-10-10 18:28:51', '2022-10-10 18:28:51'),
(3999, NULL, 4, '2022-10-10 11:28:53', '31.3410113', '30.0888103', '72, Heliopolis, EG', '2022-10-10 18:28:53', '2022-10-10 18:28:53'),
(4000, NULL, 4, '2022-10-10 11:31:17', '31.3410141', '30.0887999', '72, Heliopolis, EG', '2022-10-10 18:31:17', '2022-10-10 18:31:17'),
(4001, NULL, 4, '2022-10-10 11:31:25', '31.3410032', '30.0888026', '72, Heliopolis, EG', '2022-10-10 18:31:25', '2022-10-10 18:31:25'),
(4002, NULL, 4, '2022-10-10 11:32:05', '31.3409959', '30.0887913', '72, Heliopolis, EG', '2022-10-10 18:32:05', '2022-10-10 18:32:05'),
(4003, NULL, 4, '2022-10-10 11:32:16', '31.3410063', '30.0887991', '72, Heliopolis, EG', '2022-10-10 18:32:16', '2022-10-10 18:32:16'),
(4004, NULL, 4, '2022-10-10 11:32:25', '31.3410001', '30.0887911', '72, Heliopolis, EG', '2022-10-10 18:32:25', '2022-10-10 18:32:25'),
(4005, NULL, 4, '2022-10-10 11:32:35', '31.3410141', '30.0888207', '72, Heliopolis, EG', '2022-10-10 18:32:35', '2022-10-10 18:32:35'),
(4006, NULL, 4, '2022-10-10 11:32:45', '31.341015', '30.0888094', '72, Heliopolis, EG', '2022-10-10 18:32:45', '2022-10-10 18:32:45'),
(4007, NULL, 4, '2022-10-10 11:32:55', '31.3410144', '30.0888226', '72, Heliopolis, EG', '2022-10-10 18:32:55', '2022-10-10 18:32:55'),
(4008, NULL, 4, '2022-10-10 11:33:05', '31.34101', '30.0888036', '72, Heliopolis, EG', '2022-10-10 18:33:05', '2022-10-10 18:33:05'),
(4009, NULL, 4, '2022-10-10 11:33:15', '31.3410186', '30.0887996', '72, Heliopolis, EG', '2022-10-10 18:33:15', '2022-10-10 18:33:15'),
(4010, NULL, 4, '2022-10-10 11:33:25', '31.3409977', '30.0887988', '72, Heliopolis, EG', '2022-10-10 18:33:25', '2022-10-10 18:33:25'),
(4011, NULL, 4, '2022-10-10 11:33:35', '31.3410075', '30.0887913', '72, Heliopolis, EG', '2022-10-10 18:33:35', '2022-10-10 18:33:35'),
(4012, NULL, 4, '2022-10-10 11:33:45', '31.3409992', '30.0887912', '72, Heliopolis, EG', '2022-10-10 18:33:45', '2022-10-10 18:33:45'),
(4013, NULL, 4, '2022-10-10 11:33:55', '31.3410046', '30.0887961', '72, Heliopolis, EG', '2022-10-10 18:33:55', '2022-10-10 18:33:55'),
(4014, NULL, 4, '2022-10-10 11:34:05', '31.3410103', '30.088798', '72, Heliopolis, EG', '2022-10-10 18:34:05', '2022-10-10 18:34:05'),
(4015, NULL, 4, '2022-10-10 11:34:15', '31.3410077', '30.0887927', '72, Heliopolis, EG', '2022-10-10 18:34:15', '2022-10-10 18:34:15'),
(4016, NULL, 4, '2022-10-10 11:34:25', '31.3410058', '30.0888035', '72, Heliopolis, EG', '2022-10-10 18:34:25', '2022-10-10 18:34:25'),
(4017, NULL, 4, '2022-10-10 11:34:35', '31.3410077', '30.0887892', '72, Heliopolis, EG', '2022-10-10 18:34:35', '2022-10-10 18:34:35'),
(4018, NULL, 4, '2022-10-10 11:34:45', '31.3410171', '30.0888057', '72, Heliopolis, EG', '2022-10-10 18:34:45', '2022-10-10 18:34:45'),
(4019, NULL, 4, '2022-10-10 11:34:55', '31.3409987', '30.0888048', '72, Heliopolis, EG', '2022-10-10 18:34:55', '2022-10-10 18:34:55'),
(4020, NULL, 4, '2022-10-10 11:35:05', '31.3410039', '30.0887934', '72, Heliopolis, EG', '2022-10-10 18:35:05', '2022-10-10 18:35:05'),
(4021, NULL, 4, '2022-10-10 11:35:15', '31.3410062', '30.0888137', '72, Heliopolis, EG', '2022-10-10 18:35:15', '2022-10-10 18:35:15'),
(4022, NULL, 4, '2022-10-10 11:35:25', '31.3410062', '30.0888151', '72, Heliopolis, EG', '2022-10-10 18:35:25', '2022-10-10 18:35:25'),
(4023, NULL, 4, '2022-10-10 11:35:35', '31.3409996', '30.0887997', '72, Heliopolis, EG', '2022-10-10 18:35:35', '2022-10-10 18:35:35'),
(4024, NULL, 4, '2022-10-10 11:35:45', '31.3410107', '30.0888044', '72, Heliopolis, EG', '2022-10-10 18:35:45', '2022-10-10 18:35:45'),
(4025, NULL, 4, '2022-10-10 11:35:55', '31.3410035', '30.0888094', '72, Heliopolis, EG', '2022-10-10 18:35:55', '2022-10-10 18:35:55'),
(4026, NULL, 4, '2022-10-10 11:36:05', '31.341001', '30.0887969', '72, Heliopolis, EG', '2022-10-10 18:36:05', '2022-10-10 18:36:05'),
(4027, NULL, 4, '2022-10-10 11:36:15', '31.3409949', '30.0887914', '72, Heliopolis, EG', '2022-10-10 18:36:15', '2022-10-10 18:36:15'),
(4028, NULL, 4, '2022-10-10 11:36:53', '31.3410297', '30.0888249', '72, Heliopolis, EG', '2022-10-10 18:36:53', '2022-10-10 18:36:53'),
(4029, NULL, 4, '2022-10-10 11:37:03', '31.3410213', '30.0888201', '72, Heliopolis, EG', '2022-10-10 18:37:03', '2022-10-10 18:37:03');

-- --------------------------------------------------------

--
-- بنية الجدول `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `delivery_man_wallets`
--

INSERT INTO `delivery_man_wallets` (`id`, `delivery_man_id`, `collected_cash`, `created_at`, `updated_at`, `total_earning`, `total_withdrawn`, `pending_withdraw`) VALUES
(1, 2, 750.00, '2022-08-07 17:55:44', '2022-09-28 02:41:59', 160.00, 0.00, 0.00),
(2, 3, 320.00, '2022-08-08 17:57:51', '2022-08-08 17:57:51', 20.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- بنية الجدول `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `earning` tinyint(1) NOT NULL DEFAULT '1',
  `current_orders` int(11) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `restaurant_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_order_count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `auth_token`, `fcm_token`, `zone_id`, `created_at`, `updated_at`, `status`, `active`, `earning`, `current_orders`, `type`, `restaurant_id`, `application_status`, `order_count`, `assigned_order_count`) VALUES
(1, 'shady', 'Elkholy', '+201000000000', 'repuffapp@gmail.com', '01000010000', 'nid', '[]', '2022-07-13-62ce37834edaf.png', '$2y$10$u5MC8qf9bgDwaKXSkOAxlekm1xteQuOwztS9rxF9pZSoI0/QvaIci', NULL, NULL, 1, '2022-07-13 11:24:19', '2022-07-13 12:09:55', 1, 0, 1, 0, 'zone_wise', NULL, 'approved', 0, 0),
(2, 'ahmed', 'emam', '+201010101010', 'ahmed.gabr951@gmail.com', '21212111', 'nid', '[\"2022-08-07-62ef731da1b9e.png\"]', '2022-08-07-62ef731d9ebcd.png', '$2y$10$6FnVShc5Nx11N4ZJSKbjHur77z3bKRRJQsTCA3KcAD0ZnAVdMyU5m', 'UX10ft66Chs2XTHsZ4iNmMzhaie7PtSuWtUGIwT693BnabivnLTDiYT62ilH1bAWP7QwYjiRnUSZdZ24I4aHEntaRcCm5eEVxgmgXBMX0wceoyX4ASHLvzPc', 'f2zpeMugQ_qZojEYG_GXTu:APA91bG3BN5DoJn1cHp1FzxWkuUaxTke5yBwieGvZ7XlxHLaVMrCZ2oFVKwtSZ90Q3k0MvzuVanxA5CHdqIUBW32_xHa_gIo-Fz01V-nfbIob-Urvo6qp-l_G0l4jV2A7fYfCT--rx3j', 4, '2022-08-07 17:09:01', '2022-09-30 17:10:20', 1, 1, 1, 0, 'zone_wise', NULL, 'approved', 8, 9),
(3, 'ahmed', 'jox', '+201020304050', 'jox@jox.com', '1212121212', 'passport', '[\"2022-08-08-62f0cd5657a35.png\"]', '2022-08-08-62f0cd56561cc.png', '$2y$10$FMm92y1Is.2eAiuVim3ljO44CxybWQGBURCQTKcg75VxTpiDXj97e', 'fkgFDkANenHuPcVJyAUWHe3svcUZmthLggX7Z7ipbKVTLvuDBMlBSEhACHTiOA1ZuArhiFafyRMIt59WBXxnXSpv77nxcuxQoHwYYJLbTmGUxGegePMhq4UF', 'd7oB5-9WQxCCSgu-E1GF41:APA91bEsyLFze8lxopPOu6w96T2BtgdmrRmXU2H8w5AaTwifoJ7FavVn9I2Dme0vx-nKqjDiZmAHj1EQ-P1ggof6LQNl7dOGtIg2OdIn9PV2z1QO6OrGgn3jl-QNEeUcIe2b3KviqLfY', 4, '2022-08-08 17:46:14', '2022-09-27 03:56:37', 1, 1, 1, 0, 'zone_wise', NULL, 'approved', 1, 2),
(4, 'jjj', 'jjjj', '+201234567890', 'jjj@jjj.com', '123456578900999', 'driving_license', '[]', '2022-10-05-633dd92ae5756.png', '$2y$10$ZeT/tewHjNkYQpsDvfd/WOCYqomKjAXXqp6E1IYQ6Sg2muz03IZr.', 'Ur7QPc8cGsqaV2DdZNqcsF4MhcvqboDF9ZbIrmnewugzE41NCtvT6Vmo2v4KXgFrDLiTVnlZiS5vKHgbYryPt1wbJ1b9MVKHPQ93au0QxLRQiYYXnGiw4p6f', 'cExWuGEoShCEF72HK5aaKK:APA91bGdGp94I-2NIr8i19-k09r1s-hKSq8cLegqtu-0FR1F8tDc77T0jbImf27dCO-CvOS55T9RNF28buEy-kU22ZyAIjmatmVTugN4NkcE4gXz-7IPnoxeCyl87bM7ChGvkOrXmvvB', 4, '2022-10-06 04:21:15', '2022-10-10 18:36:29', 1, 1, 1, 2, 'zone_wise', NULL, 'approved', 0, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `d_m_reviews`
--

INSERT INTO `d_m_reviews` (`id`, `delivery_man_id`, `user_id`, `order_id`, `comment`, `attachment`, `rating`, `created_at`, `updated_at`, `status`) VALUES
(1, 2, 52, 100013, 'رجل توصيل محترف', '[]', 5, '2022-08-08 07:22:19', '2022-08-08 07:22:19', 1),
(2, 2, 56, 100017, 'Thanks', '[]', 5, '2022-09-26 23:58:00', '2022-09-26 23:58:00', 1),
(3, 2, 30, 100021, 'Good', '[]', 3, '2022-09-27 03:55:16', '2022-09-27 03:55:16', 1),
(4, 2, 30, 100022, 'Gys', '[]', 3, '2022-09-27 04:02:04', '2022-09-27 04:02:04', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `date`, `address`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'title', 'description', '2022-08-07', '73 Tereet Elzomor', '01:55', '13:55', '2022-08-07 20:55:35', '2022-08-07 20:55:35'),
(2, 'Eva', 'Eva', '2022-08-08', 'مصر', '15:24', '22:24', '2022-08-08 00:24:35', '2022-08-08 00:24:35'),
(3, 'DVM', 'DVM one of the most popular event in Egypt for the Vapor Social, it will have different type of Local and foreign vape manufactures .', '2022-10-07', 'Hilton Hotel', '12:01', '23:00', '2022-09-29 22:12:44', '2022-09-29 22:12:44');

-- --------------------------------------------------------

--
-- بنية الجدول `event_attendances`
--

CREATE TABLE `event_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `attend` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `event_attendances`
--

INSERT INTO `event_attendances` (`id`, `user_id`, `event_id`, `attend`, `created_at`, `updated_at`) VALUES
(1, 42, 1, 1, '2022-08-07 23:46:03', '2022-08-07 23:56:11'),
(2, 52, 2, 1, '2022-08-08 00:55:48', '2022-08-08 00:55:48'),
(3, 52, 1, 1, '2022-08-08 07:38:03', '2022-08-08 07:38:12'),
(4, 30, 1, 0, '2022-09-15 19:36:17', '2022-10-10 18:08:44'),
(5, 56, 1, 1, '2022-09-24 05:12:51', '2022-09-24 05:12:51'),
(6, 30, 2, 1, '2022-09-26 07:45:15', '2022-09-26 07:45:15'),
(7, 30, 3, 1, '2022-09-29 22:13:17', '2022-09-29 22:13:17');

-- --------------------------------------------------------

--
-- بنية الجدول `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `fixed_products`
--

CREATE TABLE `fixed_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT '0',
  `avg_rating` double(16,14) NOT NULL DEFAULT '0.00000000000000',
  `rating_count` int(11) NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `sizes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nls` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `fixed_products`
--

INSERT INTO `fixed_products` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`, `brand_id`, `sizes`, `nls`) VALUES
(31, 'منتج ثابت 1', 'وصف', '[\"2022-07-23-62dbf6d7cd4dd.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-07-23 22:25:43', '2022-07-23 22:25:43', 0, 0.00000000000000, 0, NULL, 2, '', '0'),
(32, 'منتج ثابت 2', 'سسسسسسسسسسس', '[\"2022-07-23-62dbf6f63489a.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-07-23 22:26:14', '2022-07-23 22:26:14', 0, 0.00000000000000, 0, NULL, 2, '', '0'),
(33, 'منتج ثابت 3', 'ييييي', '[\"2022-07-23-62dbf707670e7.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-07-23 22:26:31', '2022-07-23 22:26:31', 0, 0.00000000000000, 0, NULL, 1, '', '0'),
(34, 'منتج ثابت 4', NULL, '[\"2022-07-23-62dbf716c17cb.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-07-23 22:26:46', '2022-07-23 22:26:46', 0, 0.00000000000000, 0, NULL, 1, '', '0'),
(35, 'منتج ثابت 5', NULL, '[\"2022-07-23-62dbf7319bf71.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-07-23 22:27:13', '2022-07-23 22:27:13', 0, 0.00000000000000, 0, NULL, 2, '', '0'),
(36, 'منتج ثابت 6', NULL, '[\"2022-07-23-62dbf7454f9b9.png\"]', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 100.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-07-23 22:27:33', '2022-08-03 08:54:05', 0, 0.00000000000000, 0, NULL, 1, '', '0'),
(40, 'Geekvape Tengu RDA Tank', NULL, '[\"2022-08-09-62f189618d0c7.png\",\"2022-08-09-62f189618d2d8.png\",\"2022-08-09-62f189618d339.png\",\"2022-08-09-62f189618d389.png\"]', 13, '[{\"id\":\"13\",\"position\":1}]', '[{\"type\":\"Blue\",\"price\":1},{\"type\":\"Black\",\"price\":1},{\"type\":\"Gunmetal\",\"price\":1},{\"type\":\"Rainbow\",\"price\":1}]', '[]', '[\"13\"]', '[{\"name\":\"choice_13\",\"title\":\"Color\",\"options\":[\"Blue\",\"Black\",\"Gunmetal\",\"Rainbow\"]}]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-08-09 07:08:33', '2022-08-09 07:19:26', 0, 0.00000000000000, 0, NULL, 9, '', '0'),
(41, 'SMOK RPM80 Kit', NULL, '[\"2022-08-13-62f6d0a534ffc.png\"]', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 2.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-08-13 07:13:57', '2022-08-13 07:13:57', 0, 0.00000000000000, 0, NULL, 10, '', '0'),
(42, 'emam pro 1', 'emam pro 1', '[\"2022-09-23-632db1ab76037.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-09-23 22:16:27', '2022-09-23 22:16:27', 0, 0.00000000000000, 0, NULL, 1, '', '0'),
(43, 'emam pro 2', 'emam pro 2', '[\"2022-09-23-632db1d1dbea5.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-09-23 22:17:05', '2022-09-23 22:17:05', 0, 0.00000000000000, 0, NULL, 1, '', '0'),
(47, 'Handcraft Alien coil 2 cores for DL Mix KA1+Ni80 / 0.36 OHM', NULL, '[\"2022-10-02-633955b9413e7.png\"]', 17, '[{\"id\":\"10\",\"position\":1},{\"id\":\"17\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 18:11:21', '2022-10-02 18:36:06', 0, 0.00000000000000, 0, NULL, 11, '', '0'),
(48, 'Handcraft Alien coil 3 cores for DL Mix KA1+Ni80 / 0.4 OHM', NULL, '[\"2022-10-02-6339562f9b95e.png\"]', 17, '[{\"id\":\"10\",\"position\":1},{\"id\":\"17\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 18:13:19', '2022-10-02 18:35:54', 0, 0.00000000000000, 0, NULL, 11, '', '0'),
(49, 'Handcraft Alien coil 3cores for DL full Ni80 / 0.30 OHM', NULL, '[\"2022-10-02-6339566857c64.png\"]', 17, '[{\"id\":\"10\",\"position\":1},{\"id\":\"17\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 18:14:16', '2022-10-02 18:35:40', 0, 0.00000000000000, 0, NULL, 11, '', '0'),
(50, 'Handcraft Alien coil 2 cores for MTL Mix KA1+Ni80 / 0.80 OHM', NULL, '[\"2022-10-02-633956d8e8735.png\"]', 16, '[{\"id\":\"10\",\"position\":1},{\"id\":\"16\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 18:16:08', '2022-10-02 18:35:21', 0, 0.00000000000000, 0, NULL, 11, '', '0'),
(51, 'Handcraft Alien coil 3 cores for MTL Mix KA1+Ni80 / 0.85 OHM', NULL, '[\"2022-10-02-6339573336f33.png\"]', 16, '[{\"id\":\"10\",\"position\":1},{\"id\":\"16\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 18:17:39', '2022-10-02 18:35:10', 0, 0.00000000000000, 0, NULL, 11, '', '0'),
(52, 'Handcraft Alien coil 3 Cores for MTL full Ni80 0.6 OHM', NULL, '[\"2022-10-02-6339578550d2d.png\"]', 16, '[{\"id\":\"10\",\"position\":1},{\"id\":\"16\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 18:19:01', '2022-10-02 18:34:58', 0, 0.00000000000000, 0, NULL, 11, '', '0'),
(53, 'Handcraft Alien coil 2 cores for DL full Ni80 / 0.28 OHM', NULL, '[\"2022-10-02-633957e7c871e.png\"]', 17, '[{\"id\":\"10\",\"position\":1},{\"id\":\"17\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 18:20:39', '2022-10-02 18:34:47', 0, 0.00000000000000, 0, NULL, 11, '', '0'),
(54, 'ACID ( DMT ) DL 2.5Nic', NULL, '[\"2022-10-02-633976a6d933c.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:31:50', '2022-10-02 20:31:50', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(55, 'ACID ( ALC.15 ) DL 2.5Nic', NULL, '[\"2022-10-02-633976ee5dad4.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:33:02', '2022-10-02 20:33:02', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(56, 'ACID ( PANAMA ) DL 2.5Nic', NULL, '[\"2022-10-02-63397730b13fe.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:34:08', '2022-10-02 20:34:08', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(57, 'ACID ( THC ) DL 2.5Nic', NULL, '[\"2022-10-02-633977610a3b4.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:34:57', '2022-10-02 20:34:57', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(58, 'ACID ( HYDRO ) DL 2.5Nic', NULL, '[\"2022-10-02-633977a6c8a9e.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:36:06', '2022-10-02 20:36:06', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(59, 'ACID ( KETAMINE ) DL 2.5Nic', NULL, '[\"2022-10-02-633977f5cd786.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:37:25', '2022-10-02 20:37:25', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(60, 'ACID ( MDMA ) DL 2.5Nic', 'MDMA (Pink Panther)\r\nخليط من الكرز المثلج والتوت البري والفراولة', '[\"2022-10-02-63397868a9886.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:39:20', '2022-10-02 20:39:20', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(61, 'ACID ( LSD ) DL 2.5Nic', 'ACID ( LSD ) DL 2.5Nic\r\nLSD (Ice Mango)\r\nعصير المانجو الطبيعي المثلج مع بعض قطع المانجو من أنواع مختلفة', '[\"2022-10-02-6339793a55622.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-02 20:42:50', '2022-10-02 20:42:50', 0, 0.00000000000000, 0, NULL, 12, '', '0'),
(63, 'sd', 'asas', '[\"2022-10-17-634dc49204ab1.png\"]', 7, '[{\"id\":\"3\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-18 06:09:38', '2022-10-18 06:09:38', 0, 0.00000000000000, 0, NULL, 2, '{\"20ml\":\"22\",\"13ml\":\"11\"}', '[\"10gm\"]'),
(64, 'sfdf', 'sdfsd', '[\"2022-10-17-634dc4c516664.png\"]', 5, '[{\"id\":\"3\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-18 06:10:29', '2022-10-18 06:54:44', 0, 0.00000000000000, 0, NULL, 2, '{\"20ml\":\"25\",\"13ml\":\"15\"}', '[\"10gm\"]'),
(65, 'asas', 'asas', '[\"2022-10-17-634dc77db872c.png\"]', 5, '[{\"id\":\"3\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-18 06:22:05', '2022-10-18 06:22:05', 0, 0.00000000000000, 0, NULL, 1, '{\"20ml\":\"12\",\"13ml\":\"12\"}', '[\"10gm\"]'),
(66, 'XXX', 'XXX', '[\"2022-10-18-634e704d13794.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[{\"type\":\"3Ni-30ml\",\"price\":75},{\"type\":\"3Ni-60ml\",\"price\":120},{\"type\":\"6Ni-30ml\",\"price\":75},{\"type\":\"6Ni-60ml\",\"price\":120},{\"type\":\"9Ni-30ml\",\"price\":75},{\"type\":\"9Ni-60ml\",\"price\":120},{\"type\":\"12Ni-30ml\",\"price\":75},{\"type\":\"12Ni-60ml\",\"price\":120}]', '[]', '[\"15\",\"14\"]', '[{\"name\":\"choice_15\",\"title\":\"NI\",\"options\":[\"3Ni\",\"6Ni\",\"9Ni\",\"12Ni\"]},{\"name\":\"choice_14\",\"title\":\"Size\",\"options\":[\"30ml\",\"60ml\"]}]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, NULL, '2022-10-18 18:22:21', '2022-10-18 18:22:21', 0, 0.00000000000000, 0, NULL, 10, '{\"20ml\":null,\"13ml\":null}', 'null');

-- --------------------------------------------------------

--
-- بنية الجدول `food`
--

CREATE TABLE `food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` mediumtext COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT '0',
  `avg_rating` double(16,14) NOT NULL DEFAULT '0.00000000000000',
  `rating_count` int(11) NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `food`
--

INSERT INTO `food` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`, `brand_id`) VALUES
(27, 'منتج ثابت 1', 'وصف', '[\"2022-07-23-62dbf6d7cd4dd.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 4, '2022-07-23 22:28:07', '2022-07-23 22:28:07', 0, 0.00000000000000, 0, NULL, NULL),
(28, 'منتج ثابت 2', 'سسسسسسسسسسس', '[\"2022-07-23-62dbf6f63489a.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 4, '2022-07-23 22:28:28', '2022-07-23 22:28:28', 0, 0.00000000000000, 0, NULL, NULL),
(29, 'منتج ثابت 3', 'ييييي', '[\"2022-07-23-62dbf707670e7.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 4, '2022-07-23 22:29:21', '2022-07-23 22:29:21', 0, 0.00000000000000, 0, NULL, NULL),
(30, 'منتج ثابت 4', NULL, '[\"2022-07-23-62dbf716c17cb.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 5, '2022-07-23 22:30:02', '2022-07-23 22:30:02', 0, 0.00000000000000, 0, NULL, NULL),
(31, 'منتج ثابت 5', NULL, '[\"2022-07-23-62dbf7319bf71.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 5, '2022-07-23 22:30:13', '2022-07-23 22:30:13', 0, 0.00000000000000, 0, NULL, NULL),
(32, 'منتج ثابت 6', NULL, '[\"2022-07-23-62dbf7454f9b9.png\"]', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 5, '2022-07-23 22:30:22', '2022-07-23 22:30:22', 0, 0.00000000000000, 0, NULL, NULL),
(33, 'منتج ثابت 6', NULL, '[\"2022-07-23-62dbf7454f9b9.png\"]', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 100.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 3, '2022-07-28 06:08:03', '2022-07-28 06:08:03', 0, 0.00000000000000, 0, NULL, NULL),
(34, 'منتج ثابت 1', 'وصف', '[\"2022-07-23-62dbf6d7cd4dd.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', '18:59:00', '18:00:00', 0, 1, 1, '2022-07-31 06:57:40', '2022-08-01 01:56:39', 0, 0.00000000000000, 0, NULL, 1),
(35, 'منتج ثابت 6', NULL, '[\"2022-07-23-62dbf7454f9b9.png\"]', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 100.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 2, '2022-08-03 08:55:48', '2022-08-03 08:55:48', 0, 0.00000000000000, 0, NULL, 1),
(40, 'منتج ثابت 1', 'وصف', '[\"2022-07-23-62dbf6d7cd4dd.png\"]', 2, '[{\"id\":\"2\",\"position\":1}]', '[]', '[]', '[]', '[]', 300.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 7, '2022-08-07 17:21:39', '2022-08-08 18:46:34', 7, 5.00000000000000, 1, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', 2),
(41, 'Jokjok', 'Good good', '2022-08-13-62f6f39081e94.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[{\"type\":\"Blue\",\"price\":758},{\"type\":\"Black\",\"price\":750}]', '[\"\"]', '[13]', '[{\"name\":\"choice_13\",\"title\":\"Color\",\"options\":[\"Blue\",\"Black\"]}]', 750.00, 0.00, 'percent', 1.00, 'amount', '02:42:00', '05:42:00', 0, 1, 3, '2022-08-13 09:42:56', '2022-08-13 09:42:56', 0, 0.00000000000000, 0, NULL, NULL),
(42, 'SMOK RPM80 Kit', NULL, '[\"2022-08-13-62f6d0a534ffc.png\"]', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 7, '2022-09-21 17:47:53', '2022-09-21 17:47:53', 0, 0.00000000000000, 0, NULL, 10),
(43, 'emam pro 2', 'emam pro 2', '[\"2022-09-23-632db1d1dbea5.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 6, '2022-09-23 22:18:08', '2022-09-28 02:41:59', 3, 5.00000000000000, 2, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":2}', 1),
(44, 'emam pro 1', 'emam pro 1', '[\"2022-09-23-632db1ab76037.png\"]', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 7, '2022-09-23 22:18:41', '2022-09-27 04:00:27', 1, 3.00000000000000, 1, '{\"1\":0,\"2\":0,\"3\":1,\"4\":0,\"5\":0}', 1),
(45, 'ACID ( LSD ) DL 2.5Nic', 'ACID ( LSD ) DL 2.5Nic\r\nLSD (Ice Mango)\r\nعصير المانجو الطبيعي المثلج مع بعض قطع المانجو من أنواع مختلفة', '[\"2022-10-02-6339793a55622.png\"]', 4, '[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 8, '2022-10-02 22:07:06', '2022-10-02 22:10:12', 0, 0.00000000000000, 0, NULL, 12),
(46, 'AAAA', 'AAA Test Jox', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPkAAADLCAMAAACbI8UEAAAAw1BMVEX/////yjgcOo7/xyf/yTP/673/1GT/0VcAK4r5+vwAIoYHMIq9w9kYOI2Gkbzj5u///voALIkoRJQAJod3hLWWoMUcPZGiqsoQM4v/xyLM0OBjdKzV2egAKIj/6LRfb6n/7sepsc7/5qz/4pz/zEBUZqT/8c//3Ib/+Ob/+u5vfbAAAH7/2n0AHYT/7MA7UZn/9d7/1m3/0l3/zky1vNVDWJ3/2n//3o3t7/WBjboxSZVPYqPa3usAD4L/xAiQmsEAFIIOoL6cAAAMFElEQVR4nO2dW3uiOhSGqTCtQhlUtOCp1rb2oKVuOzpDrR3n//+qDSICOZBwCAYev4te1Gh4ScgKyVorgpBFzaeH5+XlVeG6XD7fPzUzXXom7Nul2BOlE0ns9T5uTwLffJBE6eKkci7goXj2uwvxtNieROm2YPDn3onb+6jesshmb35w0eCepMeX4sCveGnwvSSpMPQPrsAd9IvXYsDfOOrqnqRfhYDf9k4NCkt8LgD8hUNwZ4R/Yk9+ydlD7qmA/n7HZZM7/f2eNfkFl03uSGQ8oXngblz3Jf5mCv7KLbgzyP3HkvyN177uSPpgCP4fp8Obp94PduR8zddBSY/MBjkeZ29hiQ+MwJtct7irHqOXNn4tmi9pyQT8lfO+7orN9H3JfWdnNH1/KkGTs5m+/ypBkzuScrds99wPb55yX6Pg36L5ynv6/qckTZ779J3vCXtUvfc8yflcgsIpR3Bel6DQynP6/liqJr/o5bbxwP+EParcpu88L0Ghldf0/Xe5+roj6SoX8DJZNF+9XPwJ+F6CwiiP6fuPEjZ5LtP35qkZUir79L1sFs2XdJkRvHwWzVfW6XsZlqDQkh4zgZdjCQqtbNP3x55YXv3NsPr+evujzCrAg+Sss84666yzzqqIGo6qUQm17OvubL1p35hmrb1Zz7orjUEljb7R+dq0Va+SwY5JJa5ebgPFFhzu2vpIMVVHtZr711RG+k2njygJabvVbKoWtI31SG+5tdQOlbRGutq5xn/j9S4QTQ2BPkKvKjHFVgtLca8GkKrI7RVQtPGtQ5Jl2bJq65nRt2Mq6X9ZLROuRVV01cDduPe/wYvLXRLw9/DbKbbUsK0jsA/XNWpH271Rx5Tdt6C8+InoJq60qWxiK2kp4A32AYIVlUQv6s3IdhKuVFfGcu8vS/5JRe63oNxGteBEx3J7lQxI5Ile1KOLb5hCM3yDHzQa05O7FHVzAlZiWKRvKQtUjw+TX4jU+2yA/xe6UGdEuCRH9VkScoddn0YxVha5EmVNIpfeaMmBxTdkmZVMvqZaTQ4akYbcwdiE0bX45+mg1ieBnHqfDVx8Q5VpIAZbhFTlCEJHHm3BaewzfpS1JZDTusmB/l+oMkYdpjQRd6NlJCSv1YNxcYjo66hKzDF0fT+iq+V0bnKQ/xeq0BqsX7HU6XRttcDbsUlKXrOOs7NPBUSUla/pwoJ+yYIGOYCcKsoF3ltAFNLAp7zV8eYiO3Dck30OiNxUFAU1QzGPdgqcJJlf3o+tRsAHI8iqQ+QUUS7wbjmi0DUAGPS3GfBojvwpJkhujo1ut9tZQPZarR8mdDbQ2dW2X8kEeNaUyMwBRU6xz4bYLUeUMoBerR8nYFs9+snxQQfJla73/+Ea7NN+Cw5xP+WMr9FP4AcdIie7ySF2yxGldsDVhh40oKGOzYEjF4QF0HeVjvf/PtCxgtsrfEW/okImHSInRrmgAjYQxX5GydV68BHQHD5GDDnYtj4H+EjJwYvpIFpL8BzgyQnOBE3U1mky8jYASCYXNkAL3jRI5J0U5OKfOHKkeytzcsB6qSObSA58g4Y8NsoF7QzEnBwcL2U25HHOBGj3VubkK8BIHRDzJr/o3eHA39G75czJwUGcFTl+jQLj3sqeHBjcWZFj1yhwzkDVIcf4AuPi0aQKkaN9gXHOQKgZAPfk75j+i1qjwDoDVYoctUaBjUerFDlijQIfj1Yt8gsJGORe8R5/FSMHfYF/4708K0YOrFHEee+Xkhxj1fY8kYCHuHDbqpFH1ihiE0hUjjxEFB9um5g8Ilbk0VqSkQdrFPHhtonJb8Iy2ZCbkUqCVX0q8uMaBSHjW0JynHIlJyqe3J++P8d771eQ/GDZSAEbVSSX9tMZUh6FKpJ7zgSk1BnVJL+lyGh5AnLi2mtmcneMI5U5AbnOnvxCdIw5KS6rcHK1RtxjyU7ujO7EFBLsyQFEdYH8d85tfif8IhQpgHwc3SXzp31sye+Fx5OTfwJbLPVJEeQPxZG3APJdw7bt7epnG9hVU0daMeS59fbr8QChMc5nombW63VdHkEew+aXUAw5MRk7LflENhGq+256sG/U3jEclu571rAlvyW9ryQgh13kHCl4crSCN062Vu2JnP6sYHJrmAf5LZH8lRxoXSy5jDXzuZLvN5S5anM95L3LlNxdkCLlai6QXLXCLn0syfc7i6REYIWRq/VaJCaHIfnBe4KQCawYctXUwWgOhuQH5wnC6M6KXD3afKU1sm5mUAwWS3JvW5GQ3ZKW3PiWXdGSq4upp8Hs07hGQbEjl/xdxfhsObTktubKBp1YceQtKFonAXl3HBUUwBRPHrjL5NLmBwEe63hyA/5ZavJOPTJFVm4SkYf8QPPcV1MLISftq8WTh4jiMqFVjjziMJLj/jn35IAnZMxErmrkgPdrzBZTQvIa5+SQMyDesiUkv6H0HDgVOezljp3DVoscEdmAcfHOTM5Zb0eF7OEW5CrV5sh0qDjLViVyTGjuM6Z0hcgx4dgYy1Yhcmyqa/SLOiN/uFOQi9i4LaT7RHXIY1JtIJfkqkN+EROfidpMrwx5bEwuymmmKuSEZBMIR9CqkBNi7xGrkTTkevBRMVaNFIsMkxOTysALUyhyKPI++GjEbN4eirwH/Etgj1+YnJxICLJsKHIo28Ixo4sNLDsru9TkoLNYaLUWiFg/OhvgySmSR0F7qyhyMHr4yAfdE9/pJQX5FriJ5vT4CXBPzBn4XXBSRpUwDIxVRJGDF3XsiVswjdaxiyYnB1NW1EaHHWYbaHLEb4HkVNncwfhUZH4GYBxzc111VytjADRGTTX9vbIU5FDypNFiN1kZM2iHTobSJwHklBn8gYUpJDmU3qdmKq16C8rzFPTDFOQrKB2ZqtTrcPYdFdpoAMlpT22QyORbqixeTmscfT9SkIP7NTiN4I2qKDn1SR3Rg0jQ2Ug6UKOjpARDTxryCVUqNtimQeTUp7NEtlwweVjaFBnMfN/dtOTCAMzAhaoEfsoB8gQHakYWpjDktklEN5XQvm8q8gaUWgkBjkp+GiZPdIhqeMsFl3tH2xAaRGmHN7xTkTvjOyHpollH5gwNk+NTiiAUXpjCZh1qfFoxzW5as4jzR0pyoRtXiSpP0ZliQ+QJT1t7CGW6xQ8P2y8ZlejWtT7yehgt27BaEVmU5II2wFRSM/UNLs3vfXD9jA7IHnZUPWpg3cS1eu1zCJZs7LoR7TCZbRHSdhu3kkgtTiXKmP4nmKhvDDa6PPKky/XFwBjmnm9bmww2dVk/1CLL7XG3z0VS78a2f73XkC5FdbpKtEMl/W1cGuizzjrrrLPOOussT/cfl+XVVZaT5ZqiVFqJ2Q5HJsZ08ausZ8WScjFwK4kib3msSPE93Ir+QA6ciJH5fCrbaal7vfw9NUQaSfiTg+gVn1WKU2U9FXkvQmgTl8p8EranElq27KefeyqdZcvhxHtPpbNs2S2ar5Kdgp5gH40kYm4prpTxzPeoSmXZEu2jkYQ8s4NT5WTRfJXIsuW9j1YayxZ/7EoKlcayxR+1k0YlsWw5WjRf5bBsiTxDaIUJbeJLtGdFJlIZLFtCzxBalcCyMfIMISWeOb1yt2i+uLds+Vs0X5xbNmS4bT6KS0dxeknZNlXixfU7G5VFs7daKvcini0bhUVr7Grz+dz6wvkPxoljy4Y+QSysa2vUHdpafzCfpvBd49aykTdVVnM/dm7baidH59eykSya9j0ThovFYj3rC5oM5dgii9N9NtIRuIIwkAWhP5+sVoO5JkzmiHAAgvi0bOQlKPvfThCGc7eXjwyhAR8iTdYDh+gSeHYYrOt5/0Cu/ZsIwnSRnFxY8je+U5jy1bfmkFuD2dhyI34+lRTkTe7W5MgPuUvuPNnDf4bxvY/x6qgpyIXmFV+tTgPudPRrr7d/7o/aXk9JX0BrydGzLolU6zANN3ZuOLeFhjPACTZ1MAmo+x4vPb53Sbl9uHOMWd8hd8Y6Tfj8Th0c8LLkgV0SJZqe7qndbthd16oZ/et5l1gcr6dlTzwtvNR7vE+wFqEp7UNckXGcx6bUy8OvnngqL0mxJ73dJbteezxfd1eTT+U77UMe0uvd/fPy46poXb79uU3jELLdrW9uxpP968r/35KsDo+mqhoAAAAASUVORK5CYII=', 3, '[{\"id\":3,\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 100.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 8, '2022-10-05 17:36:18', '2022-10-05 17:36:18', 0, 0.00000000000000, 0, NULL, 2),
(47, 'BBBBB', 'BBB Test Jox', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAACICAMAAADNhJDwAAAAn1BMVEX///+bnaBgu0aYmp2Vl5r7+/teukPv7++dn6JZuT1cukG6u71XuDqcnqGjpaj39/fW19iqrK7AwcPq6uv6/fm5urywsbTl5ebS09Tc3d7Gx8mmqKpTtzSX0Yj1+/Pf4OFxwlvp9eZ4xGO84bPV7M+LzHrs9+nD5Luq2Z7j89/N6cav26SByG7S6syf1JFnvk5KtCeDyHGV0ISt2qJFsx3aAY2GAAARPElEQVR4nO1dCXuquhYt8yAyiCIgDrXOWml73v//bY9AghBCGBTtta7vfr0eRQOLzZ6ys/P29sILL7zwH4QgGJI9nnue6bqmZwuPPp+nhSHNPdcfjBxrossMH0F2eq45ll6U3xqGPXcHjs7H4OK/uuObY+PRJ/aMMGzTdyKJ5iIwETiO71s990V2JzAkc2DpDJ9wHdPNRLI9Nl5apAsIY3+kcxe2Y7pHrv0S7m5gu46cYRsoE85x7Uef1rPC8HpMlm4mMpaWP370aT0tJNORs3RHfPcdV3r0aT0tDG+k83m+Zcd88d0Z7EGeb4ZjrJd8dwfBtTC++b7/4rs72AMeI5wbzR99Us+MscNhAq6/BLxLFAjnLPMVXHYIAuHei/AOITm4zbReKrxLGIM84cyL8I7hynnCOd179Ck9N2wHI1z2Xzq8Swg+hzHee7mFncK2eEzEr1fim9Xh43g+T6c/P9Pz+Xz82B5Wmxuc63PAxUPNwXW/tzme2CAIviJE/ws0TVMUJfobvQ6X0+NhP7vNef9nYeBaXL82Fz6MAP7O9qvD9rj7OS1YQLsqsqyoqtELdjH92P9dkR/rmGc4uvnU2nA2ez8cp98R8zHvrCiqmhqedofN8NZj/QfgYnaTcbsba7Y/7L5DUYtpjwReCcLvf6u/xvoAt5udT7DN9h/rSM+obEr79PCHWDdwT8W603z9/nhCrEe0a8H68EcsqjTB1fgdB998rBXEOqsq7M9f0DA2Zjiv9Q0b4/24VBDpoqIsj8/uxDyc8QjDz7WosEjUtfC8v/853A8Sg2kV/zHnsZ9qKemiov08L+m/hfEIm3OA1Esk6sFp9bAz6RQSrlV6jzyb/UkTL6Rr62eUdAPzVTjnwSe0XaTahWUV9vx8hrSQVnl4/exmrV04Z7Vw2/aH4vUz9nhsS5IhdJ7yTwerGmuABfnMb6ihPQYX5cKKwbqFoEueP7LkZE0HWNwhW87ALLs2AxOziD1wl2oPJozdnqVzmbH88uJBMx9zMrxZe5wusWLVjKCr2kejbwteT46uPE4ZcWiFB6jKBmXZJCpMnmd0y4lgTWTmcp/AGoXK0STXKQwGxpJ7Hklh2JiMP9Z0ZvC+zCj0SLt8188C2D0GXn902RMr4ZFPeecI1ZRjyFOKlA+Okwe0517wHMh2dNeSwcBiB/hlximwbli4Wvk1k5yzZVbOWWVR01+cO4nLyzHWwARqVYh1uu2mlcMEFpHkWSkmej+9S0x5Dtu0IN/xIhIwGLAf5gg5gRynY+lYLHnIcL9oIn8W5jhXxTpWVBrBB1v3C6tNDc9hUiZ6uU9t+LYkIBiGNPcteHxZUtVOan0Iwmy4yA/k85SOcbXyaP8wh3dVzHIuasfKr8CMPye75KfVHiFJz2c0pD6kHDt+7ECZ5Eicw9F4h6R5BDe5X5gDqGNahfldU/mHnDqPFPqUfrwACeIpNSD2hCeQK8lkyi/uhVz4CI7GMWWaQRhFB3D5jKyLC/kDkllU7LQmnMMoumq+1ueKj3M55W9uwjmHJ7MNOBptWsGMNFgueWLgprN4Jx8MzISybHAuP1jqQw6qrsKMDsKySIZeSjkKFTHVghh3qIHjWOZzJSl4EISfBxH3nbFZBSzGeak+l+RqqYOYMzxWm0OjfAzZybnP0NXjnAoPT+KzpyPhQs7XiPRn1SbsplhjYs5qJX6LAN1duU66Ysxj3BqTcsrfJpDz7HujZDS90qfOnU5ByOtMvZ3faxx0Q+xxMRcVcmoRcoBzWROCRaHch5ol45f4fJvRoMXICHmNCf1Dhc9we+DanFVD0ryoydXXjQTAZ4RMOXRauIsystuNhrsrTL/6O8PF3bPXW8xRjOJQggkVoPzoLUehUg6jF+6SfYJKbNIwVJ9gjNe5ZbvT3WfeN6GIcx4UQ3/07LcOnmmUI5lOI3cPqpWGGUA88CTHV3nMvu5sPAFOuGZh1cKNN+Cjb7UexWlCORLyhhMLhTS5XP2d6dedjSfAUcMpZwPca4FCfkXiuQ7l6NfnfDu70ceFvNpf2XwtHlDRsyooc1Zc5KMDASYurpjPGtXQ5fPcsY2dIxtLIdaRkF3w02yQm+C9qMxx5xyJ3RX5ChrlKOSHH6IUWNMUYMFfqZ5/m4U1Unm3x2xRpFxd5g7pQbG7IvNMoxzpYPhPs6VeGTXPr2y1ssivUwyL9jPiPOuswtCxVvRcBhrlel7zIr3StC65kLbVKyn/VoOH1JQUYn7gm+8yB6RTOlcM0iunHFPlbW+wgavyatPzzorBAxwWMuVimDkAPenXTNtSKIcuO7qhNnQ8mkZd4+aUbzU2eEgRzw+B8typDHC/uQXKKUc3FOmROdfOeuKlFDUoj648eEitPUnKWe1wOcC5NvR8o1AuQTWSGksU6DZ1j4oOS6UujxyHx0j5N4nyrDJHydVr1tmUUQ6z8JkFDojyqx2WSo8FuMcPMZ/DQi4xdlkuIQIKhFrmbROUUG5yOOOIuqZqTCiUr1T65Ss1/zTfDRuCXw488zQQNjqjfA4tZ06ikRprmFyAGfksqh5LMNvesEztNiAE/LHLklKOEv+3oNyEhYgCqGKZQBHPt0VpaTkEPHMb/XDFg/KhRaJ19wmKCDsy5WwXlDMcKKgbgQbsfR5KuI6VxFgtKSdIeYUFBlcuPiKtRdQr0e3vhHIGFSaiV06htVVbKS/q8qpc8xkI2wPs555kPHOUN9TlSftpATNdKE1zATdx/DnBc26py4vZ8sqp8Zhy0hxYxzgT9UpWsaQeS73CeIdndF3mrLz0Ql1uJztoeOPyvuAtPRaCX84wdPv5D1w6nqi+A4oTFLj5RPmimn75ABag5N+lBPzE7zf3y71C9Fn1G9v42u/us3yUUZ4xK80e9SSUwWdk6lPutow+CzMUESbUb3wq7APEfEiYn0hU+fpyUK+R3EHKMcbqU942xyIQFAs9G7lPLlXb0Q66OcqEPGdVkNzV6zpgXkl520ziGyH8pBsEJG/aPZ2WDVsi5LlAGKVF65EAKcceifqUt54QIbgsFZoFJvTUe/rmP2R3JUKQOQupkZfoESmnzQphaDsr5JE0C/VH0DOu3c9RLFZqkVR5aj+rAugEV1Pedu6zOC1UpQz36BkP7uW1lKsVVskl2NwmFq025Z+78y7bA2kLX8MMevNFPoXJT6YqmEjz1veadV6UBJ55r/wNFHFDFuoIKZXyCwH7cPFxOH+FqemaBYfcsc0TDKRgiH7jtqjuWFTuIuffpWqFxas7nAZu4pxIuYNRPvuKVdfh4hQfgxP6hZaaRSJIebaet4hLQcldOJ+W+YdAyLHpqTnyWWp4EfUoPye1gMP0gZ4tLxmmljWJeLeEhHKqn5VxkrVd134LhfGCkL+9TeqLOZlyOBmBHIjhMsAucPt9TBcqtay8JcX8Fec8zJizYN1pGDpcUxgXw8LY6cVU61eiLheKlGPxx+Jz88WicfV29eVGcZqiyiZsM6tIlLDDhkCzRbkeJxTevl20eXX5EJXyVLH+aMvcfV1F4cg69dVarqJA1Y2YmFPvXNaiiUFnyuWTLfVVWFBeTviKgeYpKlkooTy5+nTeYf+lsB8Z0k8R2ystnXCFa4W4ho1UDJKfyPC0DFm+ClZZfjYbsR5mZ7XUHwe3WiPWjKHYrjKPTaQcrYi7TPUcQk0L08Vo7yqgfxmgCxagua1eEZcHUczpOdBtTsWqyvT2JXMrqlIpzx/7fD3OyZTrhWt/Py80jYWDnXegQfVB+0afwk6e3KiS89zUqYCviYPnTIv7z3mzpqi725rR96lGUyrRiOuyr6KuGxUalpjWQpTnbtdsGypJ2DcMFsvT6bRUxdSowq57fAXnhpWffiqWySWg+Zt4gKLdkvTNWaOLODWrhjjnqQuciZSjNfzY3RqelLje9LhcxVhnFrRDzumrqb2CoiakcMGvUKdBC2G4ot2ob+e+knBWDWmazE171pT0BgEgKpYSyiPjBRzDYQhj/b2WcddhX+byThWgXUtBz9lkKedocdWsmPpQ2PXVfYFnn2u2inBWVOme6Rh1p+Z0l3wJwtwikYsWo+C+w2zBvoGMJvzn8JTN6aF9UrgR0XGRBuA5wLsFoJrGAue0bg/vBPumXtcXeLjfLRS6Dk8Yr6rQE/w+8lz0noe1gBOMsW/BBwF73lHXIVSiPoTP7SZcg7goVScfQU6xzaER7Y/m2GMljHtxASlXrPUkqxa6nG+WBHFUNXW9bafVV/+WmkLzC1PGa6QwpUEfqRe+7wxcb2zbkm3PTb8HdvlOPuGYUd5HQLENSl8PleRSPsCy3s9LJDoTg/xdd2XUW6tnpp2ljPlgAjtA9Yo8FtpVpPqcIufDb2I4rmraetvQa9x//LBBDQEHP6/WCwMM1+JTbrlLKRDgJn5j4uMy+TbnkyItlErd/y/unvbxBfTIMrMY7Bx8578peE4yGugIGPf9s+T4jWgkmbxP57zEa6GvLztrJWVrmrY419syCGxGcYqOp8Y92Z8O6xtp0MItJhkJFJeQr1s9d0yyrJ7uxE0S0+z1YRloofYNeF8tM/p7tVwWzInhotFSREM5bmloSpoFTU6T5t9+lMbkoqKA/VP277MZwaSCDVf2q4/dehmySj3pTqCdmtkKQZq7A9C0EGBiOT3fHEvlfkzySaZx6nC2R1se5S4j3rOn+HXb9EdwMMsZ+SZlqDdyFhcaE4pC3y8p+WxV0cQwih7WYK+s3b9jhH+76OV0fVouQhHsK1RXuNF9nLZyiUDzPYD7dH+sPRje2TnDOW01y2xaolwQS6IaQckBvCM24jqByj6isr1DSHIp59RJ8y1LSWrfEtryIasfu0RJRBQbUYfmuewqw8UbQFUfsY69axSas2QEXaYJ+v6nIgt1PeHa+ulEPMYc7xWSE3RaIn51auJ3NIWoLR+xJOwuoHHOcT4tz3VYdiXpohJ+PPGeTmOmXLkwXJ+a9/9cBh3odFVjj09M+BvNb4m1i0ytINhP1RuLuhosH9GK5L4oto/PS7pFXQO2OdbLTdXjW2N/OplX/W0QenTOI9JpgdVsdV7UzphQICrq8+8Ql6IkfZ6SzlsmNZqdHX5C5SpZBxma81/YBzGFTVXogPSy/vcIw89zGLRTMaKiBYvdk25RVo64szydda5XtX7gfTtdBHBr5ppsqwpI+27/jD7JwdTpgh4r9ZKZxQuGm+1uvVADrSKPBZJfmqYuvv/odtkJJLoVTfSL3ivMrBQB9yIPI42hxVnEiP4Y8WvwphguTtPj4f2PbB1cDq9S0AHrE79eRd5ss99vj7vp+nRaLhZhGC4Wy+Xp+2d33K72Ncn+bTs2dAAf3x7+OtavguENut8r/RfAGPA1SAcezIDUzuFWkLyBzvPVPRyfA2gfqkrWOXlUMdXXCoZtDib9eJ785r/9azEe0VJdeVm3BnihzhUwJM93dCYuTZAHf0TEIey6pIOqjXgbvGtpB1PlzoTj0cZjf4xwAGnA1VLqkHZednyvHUvG2PNHE1CAg0rc+Eml+/+cEMxJbdIh75zV8z27lsSDzXc9d+BMkoKqrK6ibrP57BgP9Casx8RzTF/WndHAd00P7J2chW3PPdP1Bz1nost9JrulKeS7VqT13DBMR67nwODMg7o0QH8EPf4vQvIoFJhG39FHxA14/x4k12JasN7wFjF6p37+fw7JvtCd0c3zlNLJvwthDsLBW9Me0c1ZxRLkFxAktzep7zrWoBt4li9tUgFDMnuWTLZ/jdhmdNBz8yXe9SBIc3+k90scj0q2OUaOwtXyrpsvlMEYmwNHTleG1BJtnmecgfdi+ypEEg+WEeiI+wL90EPn+xNnYI5fZN8OgmGPvTiutCYTHWECmoJHceictnTkhSuBVoxACC+qX3jhufF/AEEpwlu4PBoAAAAASUVORK5CYII=', 3, '[{\"id\":11,\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 55.00, 0.00, 'percent', 0.00, 'percent', NULL, NULL, 0, 1, 8, '2022-10-05 17:36:18', '2022-10-05 17:36:18', 0, 0.00000000000000, 0, NULL, 1),
(48, 'CCCCC', 'CCC Test Jox', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIQEhISExAWFhUXFxUVGBgYFxoXFxgXFRgXGBYWGBoZHSggGRolHhUWITIiJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGjIlICUtLS0wLy8tLS0tMS8tLS0tLSs1LS8tLS0vLS0tLS8tLS0tLS0tLS8tLS0tLS0tLy0tLf/AABEIATkAoQMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAABAMFBgcCAQj/xABPEAACAQIDBAcDBwcJBQkBAAABAgMAEQQSIQUxQVEGEyIyYXGRgaGxBxQjM0JywVJikqKy0eEVNENzgrPC0vAWJERT8VRjdIOUpMPT4jX/xAAaAQEAAgMBAAAAAAAAAAAAAAAAAwQBAgUG/8QANREAAQMBAwgKAgIDAQAAAAAAAQACEQMEITESQVFxgbHR8AUTIjIzYZGhweEUUkJyIyTxFf/aAAwDAQACEQMRAD8A7jRRRREVjelvyh4TZzGI5pZha8cduxcXGdiQF0I0FzqNLVsq/LPS/Fdbjsa/PETgeSSMi+5RUlNgcb0W22h8suLe/UYaGMfnl5Tb2FAD61TT/KLtaU6YsJ4JFGPeyk++sfGQN5FN4adBvb0ufhU4a0ZllaE9INpSd7aGI15Pk/ZtSmI2hjVFzjcQfvTO3xNGE2rAveznyRq+7Y2jFMgSGGa/E5P41mBoRV46QYy9hiJCfU/CveI2ltBRd3nUHmpX8BSaYfHC+RJVB0NrrfzsRSw2ViEOYQ5TvuLA+oN6zPluROR7XxJOuImHlI4+BrT4GPFMgZcZiwPDEygftVi5pMSe+zH7zZj7ya0Wwuk3UIUeJmHhakoraTa+Pi0XaGJHnJn/AGwa+J8oG1YT/PM45PFER+qoPvqrxm3opNcrjzU1VYjGIePqCKwQ3Qi3mB+WTGJ9dhoJR+ZniNvaXF/YK3fRL5ScHtBxDZ4ZjfKklrPYXORxodL6Gx0OlfnuRwdxFN9GJ+rxuDe9rYnDnlp1qX9160dTbFywv1dRRRVZEUUUURFFFFERRRRREV+U+kSIuLxQU51E89idL/SNw/HjX6sr8nbb/nGJ/r5/7xqmo4lEvGt+Q8gBTeHwwbff1NKRuBvNOYbFovH0FTrKucDsmN9Mg99Sbc2KkMYbIuvhUOB27FHvVz5L/Gptt7bGKUJFh5yR+Zf9kmsyixc0ljoBUXWHnVt/s1jXN1wc5/8AKf8Ay15k6MY1d+DmHnG4/Ckoq+CU3310Pozg4JojmiQsOJAvWBfZ0yHtRsPMEfhWg2Dt04a4Mbm4toP3miK12ns2JTpGo9lUOJw6jcLU/i+kCSb1cea/xqrnxyHifQ0lEpMg/wCutS7EjRsThwxyKZoQzDWwMi3Nr1DJKDxr3sr6+H+ti/bWtSi/W9FFFU1hFFFFERRRRREUUUURFflbpQ8XzzF9WhydfNbMbn6xr+y9yL8CK/VNfm7E9CMbicbigITEhxGIPWSaJYyORltq1wRawt4ipaZAmUWYQ+Q8gBU8RT7RPqa3mE+SIn6zHfoRfiz/AIVawfI7hT3sViT5dWPjGak61qLn2Hnwo7y39prztLaWFy2hjKnncmup4f5H9nL33xLfelUfsxrU8vyW7HQbnPniGHwNOuCLgcuLcnRmt5mozO/Nq7sfk82OPs+uJf8Az15/2B2L+Sv/AKqT/wCysdcEXDEncHiavdm7biUWlwqP4lQD6iurD5Pdjn7P/uX/AM9Mw/Jhsd+DjyxLfiadcEXJZto4Zt0IXyFJyzRncLV1/EfJFs49x8Qv3ZVP7SNVdiPkgwo7uJxI8zGfhGKz1oRcokYefnr8ab6PNH86w3WKcnXw5spsbZ1/1+7fW1xfyTW+rxp/txX94cfCqIdB8bhsVAOq61OthPWR6r31vmB1W3p406xpRfpiiiiqyIooooiKKKKIiiivDOALk2HjRF7rDbf6OY8tI8GNRUJZwhTIQCSxGcBiTrv0rXtjF4AnyH76imxBZWXLvBF789OVEWXg2YnFpX+/NIb+zNl9BTabMgO+GM+ahvjTyYC3H3VMuE8aIoMNs6Fd0EQ8o1H4VaLh0CmyKPJRUCQkcalu1rX91ESLgcqMx50wcNfjR818aIlAKd6lSmqKfYK8fNfGpcrWteiKqxOz4TvhjPmin8Kr5dmwjdDGPJQPgKv3w9+NQPgb8TRFm59nJwaRfuyyD3Zre6pti9Fsarq02NVowQSmTOWW97ZyFKm3HWreTZd/tH0q1TFEADKN3P8AhRE9RSfz5eKsPG1/hc+6mUcMLggjmNaIvdFFFERRRRRFDiJggufIDmeX+uVV5JY3Y3PuHlXnFTZpDyXsj/EfXT+zXkPRFOor2KhVqkBoimAr2BUS3r2L0RSooqQIKX1r51lETOUcqMo5Uv1lfDJREwyioiKjMlfQb0RfTXhqk6s15aOiKI14Ne2FROaIvJrwGKnMpsePI+Y415d6iZ6IrrC4gSLcb9xHI8qnqhwOIyyDk3ZP+E+un9o1fURFFFFEWXWW+vMk+pv+NSK9LR1MlETKyVMj0stTJRE3G9NRUlHTkVERiDYVXySGn8VVdJRF86w0ZzXiiiL0Xr6kprwaEoisoJzxr5LP4VBDX16Io3kpd5Kkkpd6Io3lqBpa9vUD0RAkNxbfcW876VsaxJbLry19Na21ERRRRRFl4kFganSMVXYfBEFW61tGLW1tqN2/xq0SiKRIRTEcA8ajjqdHAIBOpvbxsLn3CiKdMOvjUyoBQlK7Ux6YeJ5n7qi+m8ncAPEkge2mKJmSMNvpSXDr41zrG/KPig10ihC/kkMxt4sGHwrQ7L6cYebCyYmT6MxWEiXzG7dzJuzZtw3ag8r1K6i9okhFemEV86oVzDFfKXi5H+gw0apmVQHDOxzhmW5DKBdUY7rWB141c9H/AJQlxKSq8YjnWJ5EFyY5ciF+zfUHS+Xlcgmxtk0HgSQi23VCvccA8awfQvp1NjsSIHhjRcjvdS17rbTU+Necd8oE8WNfCiCIqJhFmJbNYsBffa+tY6l85MeaLpKYZfGvpwy+NZDpl0ulwE0cUcaMGTOS173zMLaHwq82RjZ51glKgJJEkhtuBdA2l9d5t5etaFhDQ7MUTcuHXxpSSEeNWMtJy1qiRkiFLvEKckpZ6IlmiB056Vsa5n0j6QJARCpBlcqth9gMQCzcjY6D8K6ZWYWxaQAUUUUVharJ4PEq9wL3G/1I/wAJp5Kr8EZCWzZcv2SPM6HXeKsEoinjrL9LNoSR4mIqbdUqyDxLMQwPgQoHtNXG19qrhUDlS12ygA24E7z5VVbS6vHJFPHuBKODoy5fpMp9ga33hWQp6Ig5RF2CvNobcCt1UNmYkKW4Ak2AA4n91JfKSSMGBffKgPjox/AVR7HxkSTqZS2VSSLAkZr7zxsDrpyFbDbWHGJgXKgkBZWAYC1rHWz6cePOgfkHKIw0YpXp9WAANulYrYuy4pNl412iVpB1pVrXYFI1KZTvGuunM1gI9j4t9FwuIKkqTaGRlOW9iQBrYM3qa7jgsLImFkTJlazZQuVd6i1sug1qgwewppOtWYOt07LFs1nDC3Hle9Z/PeDLWE5V95w8iquVhcq3ZmzFhhVTDlJTUPGQbXeyWkLMq9tzYk99hzFZbpT0cxInLwYaY6k3SKU7xwNyMoHZCqAABbWtWcHjIewI3IuLZLlbDNutuuWvc63A5U/sTo+5frcRppot9SSLZmtp4876nxpWavVbXc+85WY4N9lIa2U0NDYhY35Mtlzw48GTDyxjqpBd43QX7Ol2AF6rNtuBteS5A/3tf21rZ4zY2LhYhDI68GRju8QDcGm49kY14yzMTyjdsxI4mzXA8j/1tNt7ssk0zhHN25RZZ0Kp+Vj+dQ/1P/yPXROi/wDMsJ/4eH+7WscnRiTFt9NABuBdhkIA5ZbFvDhW5BiwsSKWVI0VUBZgAFUAAXPgK2FcVKYABEaR9lbtdK9y0nLWe2z8oOEiuIy0zfmCy/pN+ANYnafTXG4q6xDql/7sXb2ud3stSFM2i488lb/bG2IMKLyyqvJd7HyUamue7d6dyS3TDqY13ZzrIfLgvvPiKpP5NZiWkfU79czHzY/xpiOBU7q2PPefX91VqlsoszyfLjgr9KwON5HrwS2ysGxljZ76yIde8SWG/wDjrX6MriGyMHEzIXldT3xYKEuHVURmNzmc5rADcraiu31tRfUeMt+BiI0KvbCzKyW5pBnWiiiiplTWLwMsYkdQxzMx7J3XBN8un+reFNyYzLNFH+WH9RlK+4N7qWaN2ZlMakMZVzDeo7QXx8PbWRh2vJ9E73ZoSL3OrDNcBvHet/CkKWlTy555vW52zhVmheJgCWByA6fSAErbx/jWU6LMepnkbPlRWVrWD3QZkJuNDlZ+1vFudXOGL43Bh2cI4Z3BsSoylraAg2A8b6ca+7Bi+d4eRsioZ2cSBTa56vKWOhsSbtbmb60JuhTN7DHA6RPl/wB+PNI9DtlDEs7yA5EItbuk78pvry4e2ujVzvZnSf5spjSBCl2C5Wa91NmZ2N8/DUeFtK2Wwsc2IhWVlC5ibAX3A24+RrYyb1i0tfOUcMysqWmpmqTbm3cNhBeedU5Le7nyUan0rVVQJwTRr5XN9rfKmCcmEwxc8Gk09oRdT7SKzOP2ttPF/WzmND9lT1Y8sqdo/wBqsOLWCXGB5qwyzVHmAOdi63tPpBhcN9diEQ/k3u36K3PurLY/5U8OmkMLyHm1o1/FvcKwWH2HGurMzHw7I9u8+8VaYSBE7iKviBr6nWqj+kKLcL9X2r9Potx73OwK2l6a7SxP1aiJT+SttPvyH4Wqtl2fLKc085Y+JLn1bd7KdhNSGqj+kqh7gA9+A9lfp2CmzmPv3VeNnxJ9m55tr7t3ur7IaYlpWSqT61Sp3yTzowVltNrO6IULVA1TNULVhFfbG2I04w8wdVEb27vaP0iM3avbLZdx3EAjjfsVcl2AB1Uf0pXXui/bOY23b+PrXWq9BZ/CZqG5eWtPjP8A7O3lFFFFSqFY3CKvXSZZG0eTMh3au2o9t6qdpQ4eWSSOJx1pPaWxtmGpINrZh2ri/EneNb/Dqc8hKi/WOARvK5tL+nurKYzYmIw86zRqZ4y5ZkG8Am+ut767xxGumlFNRicYOZRbM6RyQYeNepDJmdWLA2tlDZRbicx1Ps3aeujGPWNJw7tGFeJ1ZLZhmzgpqLkaHSx46VJ0nwCxqGW9pJXJUA/0qi8i66aqunnaq9MF9F1heMRg5XZiAoN8wDL3pHs2lhx0ra4hXAGOaSLp4q5b5u3WdVhhaDIGzB8o7TgmyvrqL3N/LSriHppBDCOtULIugjjFwQNxW+ir5nhxrK4jpFNOGjwgMEDMSzsbyOSAGN+F9Tpz3jdXnZeyQD2I2kfeTYsfOw3ee/xqvWtNOlcbzoF54DapGWZ9dt4u0k+vqUztnpTj8UCIR83jPEGzEffIv+iKyh2Kly0jNIx1NyQCfE94+tanHKRcMCDxBBB9oNVk8L2zZGy88pt67q5dXpCq65nZ9z6ro0rDSYL79yRRAgsqhRyAt686+GvTV5NUCS4ycVcAAEBAqSOgRNbNlNudjb1ojrCynoalNQw1KayigkpaSmZKWesrUqF6XamHpdq3WiutiT4kNhliwsZjzoXnkfRQZjmVUvq9luDY3JHKuz1x3YGDZjhnEUZsyjrHlbMPpX7McSjVjc9pmt4HLXYq9BQ8JuobgvLWjxn/ANnbyiiiipVCsphMuabKSfpZLg8DnYkDw1qLamyhiMv0jIRfVd9jy5Hx8TTMYOaQkC5kk3csxAvzNrV6xWKSFGlkNkQFmPgPx4e2iyCQZCxA2y+FHU4qIloQOpbRtcpVVy6ZlIJsdfdpSR4YyMXlA1JYRjugneW5nw3cN2gkklaaQzSEliSVB+wCb2+98N1TR1zbXbckllLaeHH0XobNZR33jHNzp0bUzEa23RZVw+HlxD7tf0U5eZJHsFYqAXsBv3DzroW0IcNFho8NPLkUgDQ2LFCGbgdM1ifOqthZLy/QPc3D5TpOoBTbT/Y+wvPwqbp1hcsiyjdItj95P3qR+jRtcn+R9/2Y/wC+WrTbUUeIwTdU+fqwGVt5JjHaHmVzD21V7X//AI/9mP8Avlq4acVXuGDmH7581QbVyqFNudrwNl8Kng6HSyRxyLKlnCtY37KsL3OmtqX210WlwydZnWRBbMQCCL6A21uNd96v9u4eSTZaJGGJKYfMFvcp2cwsN+nDkDXnZcBh2ZMsylV6uchW0IQqbCx3a3NvGo/xKRhgBktmZu9FMbdXEvJEB0RF5x4KSDCPPsxIo+8yqBc2H1tySeVgaqNodEJIImlEquFGZhlK2Uakg3N7DXhup2aVhsYkEgmIC40PakAb3EivXR0W2XiRwCYkAch1V/iT61I+mypkMeL8i4zhziom1atE1KjDdl3iMZJ+BCR2NsAyxGeSVYYhftNrexsTqQAL6b6l2vsEQxLOkyyxsQMwFt+4ggkEX0pzBbLijwUc8kUuIJVGEQdsgzEWGUG1he5JBp3pESdnITCIiWiPVjcoMgsNw1tbhvNQCzU+qvF+TOJnhsU5tlXr+yezlRgI47cFhpaWemJKWeucF1yoGqFqnaoGrdaLX9Fo0VMJIQSxkyjU2H09r2HLOT8fDqVcd2FFi3bBhcQkeHEkZKgXllYYhiyHkh7PEcdDXYq9DR8NuobgvK1/Ff8A2dvKKKKKkUSzf2n+/J+21Y/prtDPIuHB7KWd/FzqinwUdrzZeVayeYJ1zt3VaVj5KzE/CuYzTM7M7d5mLHzY3I8hu8gKq2usaVO7E3ffOeF0OjqHWVZOA3r6tMRUulMRVwV6NNYdypBBsQQQeRGoNPS4iSVg0kjOQCBmI0BsTaw8BVfFTkdMogETcmQ0uBIvGCZj2pPCpWKUoCbkZVa5tb7QPIVVYnaU5gGG636IADLkXcrZhra41ArcNgsLgYVkxKhmNhYjN2jrlRfDnUEmzMJtCJnw69W400UpZrXAdd1jzHrpar7bNXDckOvjuzm0fXuuU612Vzi4sukdqLp06ecEjtLpAsWChEOIQTqMOMoZS29Q4K+V76Vl9r7cxOKXq5ZF6u4JVFy5rG4zEkk6623VfdDNlQzibrYgxVkAuSCO9caHmPdTeHTZU0pgVPpMzJa0yjMtwQGOl9DxqQ9dVY0hwaCIiTfGxRf69Go4OaXEGZgGJv0iQsrLtadoPm2cCKwGXIL6Nm72/fXqDas6xNAkmWN84YZVJIcZW1IuNKsdp9HCmLjw8RJEgzKW1ygE57232tf2irzEJs7AZI5EzyML6p1jkbsxG5RcHlu41EylXLjlOjJuk7h5c6rFSvZg0ZLcrLvgD31zIVBs/bmJhjEcc2VRuBVWt5ZhpXnEY+eROrfESMt7kGxBObNyvvrQ7d2PAcP86gGVbBiBcKVJAJse6RfdpuOl6ypqGr11KGF10XQboU1AWevNRrL5vkXzzzMqKSlnpiSl5Krq2VC1QNU7VA1brRaHo5tcK+DhEXbEyqXY6ASTXOVQdTZrXNreNdgrgfR1VOOwovc9fFp5OpJ91d8rt2R5cy/NA9l523U2sqdnPJ2klFFFFWlSWB6XYjJBMOLysn67MR6KfWsGtazp/Lqic5Jm9GsPiayS1x+kHTUDdA33r0HRjMmjOknhxUyUxFS6VNHXPXTTUVPYZwrKTuBB9DekI6bSsLK1XT6AukEo1RS9yNQM4GVj4aEX8RSuytj4DGRj6BmZVTOSZVXORrlN7Hju3XHOotndJ5IECMgkQaDXKwHK9iCPA+tfJenRzi2FtGAbguM5PC1hZR6+yuq2rQe/rXkXgXETHmDoXDdRtNOl1DGnEkOBgEaCPvFSdBECnFqosqzFAN9grSAb/KoY5tlYeZpOu+kV3JBMjWcls2gGupNVXR/pIMKcQzQs3WytIAGXsgs7WJO/vCs+8mZna1szyPblncsBp51q600202gAOIJxzXmCt22SrUrOJJaC0XjP2RI+lstj7bXF7RDgFYxC8UeYWLHMHZrcLgGw5Dzqq6Y4dkxkjtudYyh4WVApAP3g2niOdUsErIyupIZSCCOBFa7DdOOyBLhszDijCxPOzd31NaCu2vTLKjskzMxdqW5szrNUbUpNygBBE3571Xy9GWXD/OpCgAUEKQc/aNlG7Qm49arzT+29vS40qGURxKcwQHMWYbi7WG7kPfpSFVq4pAgUzI+VdsxrOBdVABJ5nTtUMlQPU8lQPUKnKhaoGqdqgat1om+jNzjcLYWHXR3PPtV3auFdF0Y43C3Nh1yHzsb/AIV3WuxYe4dfwFwekvEGr5KKKKKurnLk3T1/94y8gT6yP+6s6lXnTlr4txy095P41RrXBtZms7nMF6exCKDNSlWp46gSp4qqq4mY6aSoMPEWvbcONTZgN7D3/uqRtnqvblNaSNS1NRjTBKZwSkuLQ9dYM3V3y5rDibbhvtxtVjjMHDYTCKN7YWaayBo4pHjZV0QnMqjNrzuKovnoQhllCsNxDgEe+oJduSGQS/OryAFQ2cGyneAvdseOmthyqzRDqYh9Nxv/AF89MTsv2Z6doa6o6abwLv215sNF9226LnF4GBFfEdUDbD4eURlmCB53ZCdDmyjLe1+NVe2NnouJWNOyriJgN+TrbXGuptrSqbblEjSjEXkYZWYlDdRuXKRlt4W586WfFs0hlaXNIWDFiVvcWt4aWGlraUq5LmwKZx0RpnDTozZkosqNdLnjA/yJzCBB0Y5WJzhaJejkINjiW0n+bG0X9Iyhlt2t1jqfCvuA6OIWjR5XzSNOq5EBUCBirFiToSRpVH/LEt79eL9b1/8AR/W2sH3cBw3eFP7P6TNClgyl80j5jMQpaS5LNGDlbVibaDdxFSNZRLvDcBqcc/kTm3qB/wCWG3VAT5FozeYGfcEjA1wDzAPrUtQYewAAYaADvDh7abWMncRVNtmrH+B9DwXS65n7D1S0lLy0zOhU2NLPUZBBg4rMgi5RNUDVO9LtWy1Vj0VcfPsKOPWr8DXca4Z0QYHH4ew16wXPKwP7q7nXYsI/xnX8BcDpI/5Rq+Siiiirq564300P++z+BH7K/vqoWrbpl/PsR99f2FqpWvPWjxXazvK9TZfBZ/UblKlTx1Apq2h2WxVmuAVYqRqRpk3FbgntjTkCeFRBpOAVhz2tiSnNnMOrFx9rXy0/CmMZHHK56yWMrrkCMkRCl1BzFlsMqkkKdeyfbVxK6XupGgJBBGh3E19MQkNrG53BTr+Ndez2+k2m1j5BF2E7lRr2Vz3FzV4l2LAyZ+ubKMt2DR2N45nICd5CDEF7W++lVOJ2JBkk7TsRHPJHkALnLHhJFDdqxsJnFgB3XPCws8dg2dRE0kpVdQhbMFsCbhbaWF/ZeqHE7BU652t90Hd7fEetWPzqB/n7O4KqbHXN/wAjivWK6KI0hy4hEUzthwApsJQ7nIAXJt1ShgSTcuq340hFsZIsaMOyvMoUtlWN89zEXUNGrByFaxYKwJANjrahujy/807vyBu/Srx/s+P+d+p/+qz+ZQ/fetfw62g+3FWp6JkyP2lVQ7o3VqzRoyvAqpd2zBiJycrG4yEa8HsP0VQMQXl0tdciLJ9aY89i5AjIGcG+oB86o8PsYIyssxDKQVOQaFTcHvc6ciwVs46xrOQXGUDMQcwJ15m9Z/Nofvv4LP4lfRu4q+wWyYFCkz3GvaVkCtYSXVQbspGRdW0ObyvYrLEqrkjBzxgElwzKwY33AWOg4DSs/hcGACwDEAgE6Wub2G7wNWXUui5urIFs1zyJUA8OLr61qbdQxDidh4KQWSpN+8LxtP7PPX8KrJaeELSEnkL63tbMq6WHNh76hmwcgBJQgAXN9NL23HU68t3GuNXea1RzwLj8XLoMhjQ0lIvULVM9QtUS3T/Q+/z/AA+lh1vr2W/h6V3KuGdDFH8o4cXJOdj4Lox+IFdzrs2Edg6/gLz/AEj4o1fJRRRRVxUFxrpp/PsT95f2FqpWrjpr/PsR95f7tKp1rztfxXazvK9VZvBZ/UbgpVNW0LTRIe6ozMuVgM9+wXGozAaR3F+AqpWrPCY4orKVzBr5iWa9ipU21sDYntWvqeFaMIBxhSvBOAlPQbYbtWVQTfUXuGYsS2t+L3sLDQU3FtROMWhZSBe6gKU0sdL2VtfzzXyPaMb2utuy7ahXCsesIChgMzdpd51yj2BxMBuer/Kt2ba9sgkqe7qgyjdb1mlwweNo5085oA1szkHZyNHN0+l2lFvKm5za5Va10ZeJFxqOyeR14UmcZh7gMhsMx7oC5iIQ5sL2v1cmg3Zhu3rLijAyMeyrZI8oGfvAWcWOl78bkWtxJNeYpsPljLZcypkII0Je/abgcoD682TlWWvcTBLeTHrnRzWgYO0e12zNn9FW4HGKqTKWKq1yACwc9lwoDLoR2rEPpYkjWvrthSeAFzYgSaLnjIVt5MmUSgkaajXiJHwmGGXts2g+2gvdoxfcSujSHKRfs+deVwcDEDOAuQAnrUuWzMC1iNBYA25EWvWAHxk9k+p8/lZcWTlS4cxrOGdRvLAQwUKDlXKSGN9DnG/Rr5bHdofaYmfD9ZGUjOQG7DiVvop3XIG/nzO+iMxdczkplVVIBGZWaygDKO8MxJI/NNSthcPfssCpLWJexW4JiUra53rmbgb8tcdogxGO47vjOs9kETlYadI3i7bmm5GJxisuRRxDE5FTMQticq93yGml+NMjaQV3lQMHc3btCwvIkhC2FyDlI14Hw1IzAFCACQ9iw7dybpnVCLantb+VQ42YLmhQgoG321YqMpa/Im5t41hxc0zPpfff93+eCy0B3ZyTtu0fW0aF5k2s1rBQNANSSNMlso+z9WNOJJ8LJYjHOwKkjKSSRYbyxY+I1Y1G9RPWhqPOJW4pMGAUL1C1TPUDVhZVh0HkvtCDKtgJGueZyuLV3KuJdBiTtDD30Gd7eJCOfwrttdmxdw6/gLz/AEj4o1fJRRRRVxUFx7pyhGOxHj1ZHl1afuPpVKtdH6S7KTEySBtGBGVhvHYT1HhWNxuwJ4fsZ15pr6jePh41xrVZnh5cBIN9y9BYrXTcxrCYIEX540cMVXrUyVAoq0wwhPVg77PmzXUE2umovYX03cBVFoysF0XHJxHPPuoo6v8AZmylkjDX7TOBxsqKVDm+7N2xoeA8aTTZqt9XMrX1AO/eo15d69vCpBgpFspkAVmVT2jlDEBhm8gQb62qRrC0y5sjnWozVDxDXQdXwfXziM6+4nCR54NWRJCQbkFkyuyE3sNNAd3MUtLsGU2VVvJYl10AUlmWNb8WbIx8rVJjsLO5JfO9gRckk2UkcdbeHjUMzYtS7EMWbRsyBz9GAAxDA2sGsG4a+NZAbJlp3a/K8j3I0LBLoGS8T53/AHp2gearp9myKmcgWspIzLmUPquZb5hcai4r1NgURFLSNnZA6qEBWzd0M5YWJGu4gU5jMVJ1PUmBwbJmZlFyIrhbWjDW1HeZrbhSrYueJUBUC2iM8Sl1Cm+VWZbgAndwvQtpjCcNBxnZm5wjIdUMXgX6ReI2xn0H0v8An8izXsQo0U3MiBTnLBbG9jcow9lDbIlVbsoHZd7E62Tve3wpnDbVnkzAKrOerI7KEKA72spFic8177x5bvEU2KGig2BJ0QEMXut2IX6S9yLm9ZLKWIDjs5m7QtQ6tMEt99HtenRsBuyMygjOHLHsghygAsPD3GlMZgjGsbZg2cE6WIBAUlbg7xmF9341Ovzu988gYgk9sKbM5BvqLXYHf50Ps6dgMxuBdVzNp2d4XfYaeWlHMB7rDPP3tkrVtQtPbeI2ee6Z1BVLVC9XI2YrWyzA3sQLdogjQWvo11cangDxpHHQxILLIWbjYWUb78NTu41oabgJO8KTrWkwNxVc9QtUz07gthzzWsmVfym0HsG8+lZY1zzDRKPe1glxgc83KToFEx2hASb2MhA5Dq3199drrCdE9kJBLHl1btFmO89hhYDgLndW7rt2ak6myHY4rzlrrNq1JbgBHuT8ooooqwqqze0vrpPNf2FqNam2qlpm/OCt7sv+H3ioVoi8YjARS9+JWPMjX1GtV8nRWBu7nTyNx+sL++rgVKlRvo0395oOxS069Wn3HEbvTBZt+iDfZmU/eUj4E18bo5iVAAKmxuMr2sTbUXA10HpWsSplqsbBRzAjUeMq23pO0DEg6xwhYiXZ+PUEWksbg9vNvNzbtG1zvpDEpjrsckozZrgJp2tTYW0/1zNdGal3rX8BuZ7vX6W//puOLG+h4rm4bGreyTC+/wCiPABR9nkoFLYjD4hwoaKQ5d30bclHBeSiun18vWD0eDcXlbDpSDIpiVzDD4LEIcyRSg2IuI23EEHhyJp+JcaQR1UhPZAYoQy5SCMp0A3DXfpW/NeaN6Pa3B5WHdKOdjTasNHs3HNplkseGbKN5O7MOJJ9tMJ0cxTd4qPvPf4XraLX01sOj6eck7RwWp6UrZg0bDxWOToi/wBqZR5At8SKZj6KwjvF29oUfC/vrRvUL1K2x0G/x9ZO8qB9vtDv5+kDcFXwbPii7kSqedrn1OtSNUslQtVgAAQFVJJMkyUxsZrTx+OYfqsfwrV1l9hR5plP5IZvdl/xVqKysIooooirtrYIyrde+tyvjfep87D0FUMWI1IYWI0IO8HxrX0htDZkc+/RhuYb/I8x4GiKqU3qZKr8Ts3EQ6gdYvNN/tXf6XqGHautjvG8Hf7aIr2Oplqqh2mtNJj050RNtS716+dIeNRNIDxoiK+V8zDnRmHOiL6a80FxzrznHOiKVa+moevUca8PjFFEUjVC9QS7QApGbamthvO4DefKiJ2Q0rJNqAoJJ0AGpPkK94XZmJn1y9Wv5T6H2Lv9bVo9mbJjw4uO053ud/kOQ8B76IjYuB6lLt32sW8OS+y59TVlRRREUUUURFFFFERSuJwUcvfjVvMAkeR3imqKIqKboxCe4zp5NcfrXpSTo1KO7Op8GUj3gn4VqKKIsi2xsWvBG8nP4gVGcFix/QE+Tp/mrZUURYoxYkb8O/uPwNfMuI/7PJ+jW2ooixQixJ/4d/cPia+jBYw/8OR5un+atpRRFj12Li24Rr5ufwBqaLozKe/iFHgqE+8kfCtVRRFQw9FoR32d/NrD9W1WmFwMUX1car5AXPmd5pqiiIooooiKKKKIiikqKIv/2Q==', 13, '[{\"id\":13,\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 60.00, 0.00, 'percent', 0.00, '', NULL, NULL, 0, 1, 8, '2022-10-05 17:36:18', '2022-10-05 17:36:18', 0, 0.00000000000000, 0, NULL, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `mail_configs`
--

CREATE TABLE `mail_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_05_081114_create_admins_table', 1),
(5, '2021_05_05_102600_create_attributes_table', 1),
(6, '2021_05_05_102742_create_categories_table', 1),
(7, '2021_05_06_102004_create_vendors_table', 1),
(8, '2021_05_06_153204_create_restaurants_table', 1),
(9, '2021_05_08_113436_create_add_ons_table', 2),
(47, '2021_05_08_123446_create_food_table', 10),
(48, '2021_05_08_141209_create_currencies_table', 10),
(49, '2021_05_09_050232_create_orders_table', 10),
(50, '2021_05_09_051907_create_reviews_table', 10),
(51, '2021_05_09_054237_create_order_details_table', 10),
(52, '2021_05_10_105324_create_mail_configs_table', 10),
(53, '2021_05_10_152713_create_business_settings_table', 10),
(54, '2021_05_11_111722_create_banners_table', 11),
(55, '2021_05_11_134442_create_coupons_table', 11),
(56, '2021_05_12_053344_create_conversations_table', 11),
(57, '2021_05_12_055454_create_delivery_men_table', 12),
(58, '2021_05_12_060138_create_d_m_reviews_table', 12),
(59, '2021_05_12_060527_create_track_deliverymen_table', 12),
(60, '2021_05_12_061345_create_email_verifications_table', 12),
(61, '2021_05_12_061454_create_delivery_histories_table', 12),
(62, '2021_05_12_061718_create_wishlists_table', 12),
(63, '2021_05_12_061924_create_notifications_table', 12),
(64, '2021_05_12_062152_create_customer_addresses_table', 12),
(68, '2021_05_12_062412_create_order_delivery_histories_table', 13),
(69, '2021_05_19_115112_create_zones_table', 13),
(70, '2021_05_19_120612_create_restaurant_zone_table', 13),
(71, '2021_06_07_103835_add_column_to_vendor_table', 14),
(73, '2021_06_07_112335_add_column_to_vendors_table', 15),
(74, '2021_06_08_162354_add_column_to_restaurants_table', 16),
(77, '2021_06_09_115719_add_column_to_add_ons_table', 17),
(78, '2021_06_10_091547_add_column_to_coupons_table', 18),
(79, '2021_06_12_070530_rename_banners_table', 19),
(80, '2021_06_12_091154_add_column_on_campaigns_table', 20),
(87, '2021_06_12_091848_create_item_campaigns_table', 21),
(92, '2021_06_13_155531_create_campaign_restaurant_table', 22),
(93, '2021_06_14_090520_add_item_campaign_id_column_to_reviews_table', 23),
(94, '2021_06_14_091735_add_item_campaign_id_column_to_order_details_table', 24),
(95, '2021_06_14_120713_create_new_banners_table', 25),
(96, '2021_06_15_103656_add_zone_id_column_to_banners_table', 26),
(97, '2021_06_16_110322_create_discounts_table', 27),
(100, '2021_06_17_150243_create_withdraw_requests_table', 28),
(103, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(104, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(105, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(106, '2016_06_01_000004_create_oauth_clients_table', 30),
(107, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(108, '2021_06_21_051135_add_delivery_charge_to_orders_table', 31),
(110, '2021_06_23_080009_add_role_id_to_admins_table', 32),
(111, '2021_06_27_140224_add_interest_column_to_users_table', 33),
(113, '2021_06_27_142558_change_column_to_restaurants_table', 34),
(114, '2021_06_27_152139_add_restaurant_id_column_to_wishlists_table', 35),
(115, '2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table', 36),
(118, '2021_06_29_134119_add_schedule_column_to_orders_table', 37),
(122, '2021_06_30_084854_add_cm_firebase_token_column_to_users_table', 38),
(123, '2021_06_30_133932_add_code_column_to_coupons_table', 39),
(127, '2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table', 40),
(129, '2021_07_04_142159_add_callback_column_to_orders_table', 41),
(131, '2021_07_05_155506_add_cm_firebase_token_to_vendors_table', 42),
(133, '2021_07_05_162404_add_otp_to_orders_table', 43),
(134, '2021_07_13_133941_create_admin_roles_table', 44),
(135, '2021_07_14_074431_add_status_to_delivery_men_table', 45),
(136, '2021_07_14_104102_create_vendor_employees_table', 46),
(137, '2021_07_14_110011_create_employee_roles_table', 46),
(138, '2021_07_15_124141_add_cover_photo_to_restaurants_table', 47),
(143, '2021_06_17_145949_create_wallets_table', 48),
(144, '2021_06_19_052600_create_admin_wallets_table', 48),
(145, '2021_07_19_103748_create_delivery_man_wallets_table', 48),
(146, '2021_07_19_105442_create_account_transactions_table', 48),
(147, '2021_07_19_110152_create_order_transactions_table', 48),
(148, '2021_07_19_134356_add_column_to_notifications_table', 49),
(149, '2021_07_25_125316_add_available_to_delivery_men_table', 50),
(150, '2021_07_25_154722_add_columns_to_restaurants_table', 51),
(151, '2021_07_29_162336_add_schedule_order_column_to_restaurants_table', 52),
(152, '2021_07_31_140756_create_phone_verifications_table', 53),
(153, '2021_08_01_151717_add_column_to_order_transactions_table', 54),
(154, '2021_08_01_163520_add_column_to_admin_wallets_table', 54),
(155, '2021_08_02_141909_change_time_column_to_restaurants_table', 55),
(157, '2021_08_02_183356_add_tax_column_to_restaurants_table', 56),
(158, '2021_08_04_215618_add_zone_id_column_to_restaurants_table', 57),
(159, '2021_08_06_123001_add_address_column_to_orders_table', 58),
(160, '2021_08_06_123326_add_zone_wise_topic_column_to_zones_table', 58),
(161, '2021_08_08_112127_add_scheduled_column_on_orders_table', 59),
(162, '2021_08_08_203108_add_status_column_to_users_table', 60),
(163, '2021_08_11_193805_add_product_discount_ammount_column_to_orders_table', 61),
(165, '2021_08_12_112511_add_addons_column_to_order_details_table', 62),
(166, '2021_08_12_195346_add_zone_id_to_notifications_table', 63),
(167, '2021_08_14_110131_create_user_notifications_table', 64),
(168, '2021_08_14_175657_add_order_count_column_to_foods_table', 65),
(169, '2021_08_14_180044_add_order_count_column_to_users_table', 65),
(170, '2021_08_19_051055_add_earnign_column_to_deliverymen_table', 66),
(171, '2021_08_19_051721_add_original_delivery_charge_column_to_orders_table', 66),
(172, '2021_08_19_055839_create_provide_d_m_earnings_table', 67),
(173, '2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table', 67),
(174, '2021_08_19_114851_add_columns_to_delivery_man_wallets_table', 67),
(175, '2021_08_21_162616_change_comission_column_to_restaurants_table', 68),
(176, '2021_06_17_054551_create_soft_credentials_table', 69),
(177, '2021_08_22_232507_add_failed_column_to_orders_table', 69),
(178, '2021_09_04_172723_add_column_reviews_section_to_restaurants_table', 69),
(179, '2021_09_11_164936_change_delivery_address_column_to_orders_table', 70),
(180, '2021_09_11_165426_change_address_column_to_customer_addresses_table', 70),
(181, '2021_09_23_120332_change_available_column_to_delivery_men_table', 71),
(182, '2021_10_03_214536_add_active_column_to_restaurants_table', 72),
(183, '2021_10_04_123739_add_priority_column_to_categories_table', 72),
(184, '2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table', 72),
(185, '2021_10_07_223332_add_self_delivery_column_to_restaurants_table', 72),
(186, '2021_10_11_214123_change_add_ons_column_to_order_details_table', 72),
(187, '2021_10_11_215352_add_adjustment_column_to_orders_table', 72),
(188, '2021_10_24_184553_change_column_to_account_transactions_table', 73),
(189, '2021_10_24_185143_change_column_to_add_ons_table', 73),
(190, '2021_10_24_185525_change_column_to_admin_roles_table', 73),
(191, '2021_10_24_185831_change_column_to_admin_wallets_table', 73),
(192, '2021_10_24_190550_change_column_to_coupons_table', 73),
(193, '2021_10_24_190826_change_column_to_delivery_man_wallets_table', 73),
(194, '2021_10_24_191018_change_column_to_discounts_table', 73),
(195, '2021_10_24_191209_change_column_to_employee_roles_table', 73),
(196, '2021_10_24_191343_change_column_to_food_table', 73),
(197, '2021_10_24_191514_change_column_to_item_campaigns_table', 73),
(198, '2021_10_24_191626_change_column_to_orders_table', 73),
(199, '2021_10_24_191938_change_column_to_order_details_table', 73),
(200, '2021_10_24_192341_change_column_to_order_transactions_table', 73),
(201, '2021_10_24_192621_change_column_to_provide_d_m_earnings_table', 73),
(202, '2021_10_24_192820_change_column_type_to_restaurants_table', 73),
(203, '2021_10_24_192959_change_column_type_to_restaurant_wallets_table', 73),
(204, '2021_11_02_123115_add_delivery_time_column_to_restaurants_table', 74),
(205, '2021_11_02_170217_add_total_uses_column_to_coupons_table', 74),
(206, '2021_12_01_131746_add_status_column_to_reviews_table', 75),
(207, '2021_12_01_135115_add_status_column_to_d_m_reviews_table', 75),
(208, '2021_12_13_125126_rename_comlumn_set_menu_to_food_table', 75),
(209, '2021_12_13_132438_add_zone_id_column_to_admins_table', 75),
(210, '2021_12_18_174714_add_application_status_column_to_delivery_men_table', 75),
(211, '2021_12_20_185736_change_status_column_to_vendors_table', 75),
(212, '2021_12_22_114414_create_translations_table', 75),
(213, '2022_01_05_133920_add_sosial_data_column_to_users_table', 75),
(214, '2022_01_05_172441_add_veg_non_veg_column_to_restaurants_table', 75),
(215, '2022_01_20_151449_add_restaurant_id_column_on_employee_roles_table', 76),
(216, '2022_01_31_124517_add_veg_column_to_item_campaigns_table', 76),
(217, '2022_02_01_101248_change_coupon_code_column_length_to_coupons_table', 76),
(218, '2022_02_01_104336_change_column_length_to_notifications_table', 76),
(219, '2022_02_06_160701_change_column_length_to_item_campaigns_table', 76),
(220, '2022_02_06_161110_change_column_length_to_campaigns_table', 76),
(221, '2022_02_07_091359_add_zone_id_column_on_orders_table', 76),
(222, '2022_02_07_101547_change_name_column_to_categories_table', 76),
(223, '2022_02_07_152844_add_zone_id_column_to_order_transactions_table', 76),
(224, '2022_02_07_162330_add_zone_id_column_to_users_table', 76),
(225, '2022_02_07_173644_add_column_to_food_table', 76),
(226, '2022_02_07_181314_add_column_to_delivery_men_table', 76),
(227, '2022_02_07_183001_add_total_order_count_column_to_restaurants_table', 76),
(228, '2022_01_19_060356_create_restaurant_schedule_table', 77),
(229, '2022_08_03_210903_create_used_products_table', 78),
(230, '2022_08_07_104706_create_events_table', 79),
(231, '2022_08_07_105412_create_event_attendances_table', 80),
(232, '2022_08_13_011212_create_used_market_settings_table', 81);

-- --------------------------------------------------------

--
-- بنية الجدول `nls`
--

CREATE TABLE `nls` (
  `id` int(11) NOT NULL,
  `nl` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `nls`
--

INSERT INTO `nls` (`id`, `nl`, `created_at`, `updated_at`) VALUES
(2, '10gm', '2022-10-18 05:23:06', '2022-10-18 05:23:39');

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`, `tergat`, `zone_id`) VALUES
(1, 'test', 'test', '2022-06-27-62b8ec2bddb5e.png', 1, '2022-06-27 08:30:51', '2022-06-27 08:30:51', 'customer', NULL),
(2, 'test', 'test', '2022-08-08-62f0d0c70da35.png', 1, '2022-08-08 18:00:55', '2022-08-08 18:00:55', 'deliveryman', 4),
(3, 'test2', 'test 2', '2022-08-08-62f0d14152b39.png', 1, '2022-08-08 18:02:57', '2022-08-08 18:02:57', 'deliveryman', 4),
(4, 'Test Notification', 'Test your Puff', '2022-09-29-633598605f8b9.png', 1, '2022-09-29 22:06:40', '2022-09-29 22:06:40', 'customer', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('008f734341720723bd506264900d660d39433c1e78a89db580304819c15b14915aa69a979f8e2818', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-07 02:16:06', '2022-08-07 02:16:06', '2023-08-06 19:16:06'),
('01f685a99f22d1e47e8cf59b444fb6d43c000d78e3dfa3ccedbdc4dd83bae5b1f03afc5895697d20', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 06:41:05', '2022-07-07 06:41:05', '2023-07-06 23:41:05'),
('02237c9bcf1a8d2883e567d6307b8c913429b3a9998c39ecf643410b28bd86a19bc6c0ec47d7af44', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-09 06:30:48', '2022-08-09 06:30:48', '2023-08-08 23:30:48'),
('02c187400441f53687a30af580361503d21ab9e30fc263f729536e3e6fb8e013c5f10f170df66154', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:26:44', '2021-08-14 07:26:44', '2022-08-14 13:26:44'),
('03652f98734cb46633be656afd61eb9d6bef93da6cb3f97e5d862e758bc8a7458f4271c9fc525a03', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 04:56:56', '2021-07-04 04:56:56', '2022-07-04 10:56:56'),
('046130bf3d2f19d02eecc1bcbd075d1034f559c49ae63595383b2e42948b6552110c847df485cc55', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-16 00:38:19', '2022-07-16 00:38:19', '2023-07-15 17:38:19'),
('04b2614a9741c3f6ec9762a92d96618f876f88b08670e7ac4b63acd81407840d72e6ff7962302274', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-04 08:25:54', '2022-07-04 08:25:54', '2023-07-04 01:25:54'),
('068241a5ceff8b5971309a84521fda51d94c61f1838701714ccf91466c959f2344eb40b073f63651', 49, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-04 18:37:53', '2022-08-04 18:37:53', '2023-08-04 11:37:53'),
('069af72c55ba2967e9faadf0a2884721e06a67e4696fd758344ff6054e49cbd09a050bdebe2b99da', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 15:48:17', '2022-07-15 15:48:17', '2023-07-15 08:48:17'),
('07aaeca4f6f67ad94bb664ff89c5247a3a9a6bb6bb76df354c445407a052c45291bb4be9c4c188d6', 44, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-01 06:02:31', '2022-08-01 06:02:31', '2023-07-31 23:02:31'),
('085917398f4e1d4f8628203ad23820b321354547d987fe7d32c3176dca51a5c5fdf947b5067f4d9f', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-01 12:38:46', '2022-08-01 12:38:46', '2023-08-01 05:38:46'),
('08e6d36621fd85d272baeee30450d74b43b1c14428f43f6d4468dd2396ded065fddbdcfdb3e86dd4', 53, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-31 05:19:33', '2022-08-31 05:19:33', '2023-08-30 22:19:33'),
('0c19218c89872b6531eee55f0b87e1d5f435879053271fbec8693c489dde30781a6fbd9c3b999b0c', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-24 02:22:14', '2022-09-24 02:22:14', '2023-09-23 19:22:14'),
('0c6275f09536d59b0d2649c719e19cef80f29ec2acb20f23d52e6d1694fce62e7be40f8b14062471', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-31 05:22:20', '2022-08-31 05:22:20', '2023-08-30 22:22:20'),
('0ce77d214106aa7d2691f22e57a52d61e83c4a74e232b6cf6409728c337a731412d5f011c265abf9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:51:24', '2021-08-08 14:51:24', '2022-08-08 20:51:24'),
('0de5bcf87f5947b09e3dce1d6ab2a33f1df1607b4b5494016015d8e2dcf791953d96e3332596c078', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 20:27:15', '2022-06-01 20:27:15', '2023-06-01 15:27:15'),
('0e945d46cd1dff2aaf9ea6d2ab7958af7182fb756580c80170aa8326195bd84c9cc9d996d9bfb19c', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-24 20:34:57', '2022-09-24 20:34:57', '2023-09-24 13:34:57'),
('11a5d9e6700d04b1725b28fae4c7fcc012af94340f5313bda2084985a06faacfa79832345ca41ede', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-13 02:54:36', '2022-07-13 02:54:36', '2023-07-12 19:54:36'),
('1213f1e4751e2a30002be7c99c3071c1faed415874328a61d6b05ab4d5523f89a6126976e47bf660', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 21:38:01', '2022-07-15 21:38:01', '2023-07-15 14:38:01'),
('1453ab603b073afbb4fecb07c12eced84e0497010a44651aca961d0578d881209d83797d7d44f011', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-13 06:32:50', '2022-07-13 06:32:50', '2023-07-12 23:32:50'),
('145d20acf28a59692a13976cd8325b77f7db20c30e543352286c5fa8da7ea6a453812b2abd2798ac', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-27 08:41:09', '2022-06-27 08:41:09', '2023-06-27 01:41:09'),
('14e7878f44abd7991ef9ac9cf2384ccf080f5addf0abc8cc62f484e28993fd156adf32dca1a69713', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-02 12:58:01', '2022-08-02 12:58:01', '2023-08-02 05:58:01'),
('15eca4c21251bbd10a063b79c7899476c10af04d6142330579efd56bd7abd9534c459e9f63e1120d', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-02 13:32:53', '2022-08-02 13:32:53', '2023-08-02 06:32:53'),
('1796645666d7dd6ef53186e095fb9c39d2128e5cca19f2e1ac8e7e7da82d6174fe98b14e94925188', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:29', '2021-08-04 07:35:29', '2022-08-04 13:35:29'),
('188b9fa1101a93d6a9abfbb5783f22ebdebd04b3c9688426ed00738fa575f85bc8833e03158ebaec', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-07 03:35:51', '2022-08-07 03:35:51', '2023-08-06 20:35:51'),
('19441ab273d08e3a5051effb5a4d277bd302070f2467f7f6824148aadc52b651db6a3580aa51470c', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 23:26:58', '2022-07-31 23:26:58', '2023-07-31 16:26:58'),
('1950e3575fc60fbef9ebed1b39a8b66bf39be3c5b6fd9d2530e566bf8352749c454e31f20d4df5b8', 19, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 12:21:52', '2022-07-11 12:21:52', '2023-07-11 05:21:52'),
('1b56206d04a08578f2afe21a9cc3fdc69e0a168f6da74a617fc452716367fcc329612e82a0fd6930', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-27 02:57:48', '2022-09-27 02:57:48', '2023-09-26 19:57:48'),
('1c1686352ad974fc43f90b2235824dd9abf0e582ee1218600ece72737598a3d60d2c03bea9e0caba', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 11:13:25', '2022-08-03 11:13:25', '2023-08-03 04:13:25'),
('1c27bbece826df9fd02b1c8906bbf816bbcf52b23f41cdd43f5375ecd76081d551fea827683234b5', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 01:41:05', '2022-07-31 01:41:05', '2023-07-30 18:41:05'),
('1c5906abf6668b088f8d0ab75bd579bf2a4b7211f80e1fdb0a15f61e04d6e03226029ef281dfd4ac', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 15:41:01', '2022-07-15 15:41:01', '2023-07-15 08:41:01'),
('1e2787598219de125a191d68b7bcebc888571cf00f97e2a33e16555957d82b6feff765780c41c7c0', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 21:58:44', '2022-07-15 21:58:44', '2023-07-15 14:58:44'),
('1e4ca289163ae77dfd866739e9be0d3faa392c1a26564b7377a81ea06600aa535e62d4846d2e574b', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-06 08:16:43', '2022-07-06 08:16:43', '2023-07-06 01:16:43'),
('1fc3a09e339e394a10685167df0dc00279498f9913c76a4bf89efa3eb30932d6fb535fa39aefd1f8', 53, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-30 03:36:24', '2022-08-30 03:36:24', '2023-08-29 20:36:24'),
('1fc8a28497ee55f2b2326a9b85a4027ac6347d3eb39a0f67ebe94385547ee2fc1fa1d286d52cfce6', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-19 03:57:08', '2022-08-19 03:57:08', '2023-08-18 20:57:08'),
('2048ae4a3dc5bc63740e0675de15cf0b461a92155c4f97ec7de718d296631f0548bbbeaac61b1d4c', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-03 08:46:17', '2022-07-03 08:46:17', '2023-07-03 01:46:17'),
('225eed24cf86f5441192bed856fa3e6d4c6a8cd08823a1bd288bee4a6780caa20d152667a1e62e59', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-01 08:31:34', '2022-08-01 08:31:34', '2023-08-01 01:31:34'),
('22cfc0410fe033bfd1ed6ff06f85e80ab5f4b06509e770e4400784844262b289573a00a067c2e0b0', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-01 09:30:24', '2022-08-01 09:30:24', '2023-08-01 02:30:24'),
('234aee5843e3ccf4da55df2645597781302c5d8cc7c4b49d6e4a1f2a4ef393db4310a4cfdcf05503', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-23 22:02:09', '2022-09-23 22:02:09', '2023-09-23 15:02:09'),
('241bed06747221b7dbf34bda0b42009de053b3d73db56ac442da8d0d172c12aca08fa9421cf7e4aa', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-23 23:51:46', '2022-09-23 23:51:46', '2023-09-23 16:51:46'),
('24992e39b0877267b521488dcbac1f2e44907e8633f433468a83a6152f0c09ace68bc1dff2963f8e', 31, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-17 08:04:02', '2022-07-17 08:04:02', '2023-07-17 01:04:02'),
('273d4e557f33b5362f93facd13d9f5b18553d11ae0403b0a9998351477440ee0247aadfe88d700a7', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-31 05:22:27', '2022-08-31 05:22:27', '2023-08-30 22:22:27'),
('2919672ecc1e3dd9f2759d15f8cc54882d1d9f780cfda82fb83c8359de8654492ea6703956a7c50d', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-15 08:22:28', '2021-07-15 08:22:28', '2022-07-15 14:22:28'),
('2ae7ab4bb33ab91d2dc4e254f204b98f7f0097324e07eedc43749376a0d9711f52f04c851ef8b7b8', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-24 09:10:12', '2022-09-24 09:10:12', '2023-09-24 02:10:12'),
('2da6c992a14609096055ff5a5ad43fcbee6d54d85bb62fc5cae8089b32167fa54605cd32eb9c262a', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 12:16:59', '2022-06-01 12:16:59', '2023-06-01 07:16:59'),
('2dde411b5668ccdf54bff50f811652a87955ba47ef3281368d79508c0f6b8e3e7b1389257e661c1d', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-10 01:57:55', '2022-08-10 01:57:55', '2023-08-09 18:57:55'),
('2f49586a4ac33179f846e60afba15e655ceef494cd64f6812d4ab109336f5fb008cb3005137f700c', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-03 13:21:13', '2021-08-03 13:21:13', '2022-08-03 19:21:13'),
('2f966e73679a3f7e061cde5b8d77b5b1edbdb52996fab45c1f5bc44b2a559fbbd973e1c44691f82f', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-08 00:14:54', '2022-08-08 00:14:54', '2023-08-07 17:14:54'),
('2fa2a60657543a2b748781e564d378839c88a312b3019c0ddb19aa589fd05e5c2b5aefc975a83b54', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 22:39:20', '2022-09-26 22:39:20', '2023-09-26 15:39:20'),
('3115e428f22908fa2d94bf2804d1ed2d9929cb27da233aedf24c8bc71dc8066f91b0c63a795c26e9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:33:37', '2021-07-31 08:33:37', '2022-07-31 14:33:37'),
('3265ceb458abbf765c45368956588c4cc01eb9549277df53c41ba94e1ce40328190889effdcf5187', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-29 00:07:09', '2022-07-29 00:07:09', '2023-07-28 17:07:09'),
('33d1c6914283a8e3c66bcb24a9803376aa831e4eeb95aa129dc4d4a3e2b577a6022a16a0696f01e2', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-17 01:37:22', '2022-07-17 01:37:22', '2023-07-16 18:37:22'),
('347a8d5310da171f5cb82243be121c5681c57ac09efb9f3022fa71aceb281e8012b38502ac2857e7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-16 13:03:04', '2022-07-16 13:03:04', '2023-07-16 06:03:04'),
('349639baee176be35b754f7b87f9d25cdbb534eb3e248c8c9c6b0d2d84cfceadec3d1c685381f8ad', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-28 23:55:54', '2022-07-28 23:55:54', '2023-07-28 16:55:54'),
('36217e984b8904eb4dfd30ed62eef9d725c1e8e63a6c1485bb084ef323ad5eea852c84e17560bd54', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-14 00:51:51', '2021-07-14 00:51:51', '2022-07-14 06:51:51'),
('36317001001ce6f4b8e70df7b33b3c628fcb74f4c0a7c813f94373cf497b6a1711cb550e8323ff4e', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 08:51:04', '2022-09-26 08:51:04', '2023-09-26 01:51:04'),
('3769f777128e578800cf149fd06999ddf2c977ba3fccd56206c144b1c8212d4910755137d3c073d2', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:18:50', '2022-07-15 22:18:50', '2023-07-15 15:18:50'),
('37fc3fed2c6155433183db3b7112925813c6f16b505bfb56ae0bcf432e771b4e7ae232eea7f2c955', 35, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-23 22:08:54', '2022-07-23 22:08:54', '2023-07-23 15:08:54'),
('3abfb4980fdf3c858e1c371352db40dae9e1e40f095b00dcd09c84ff7c8189a305f1be985e4274b3', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:50:53', '2021-06-19 03:50:53', '2022-06-19 09:50:53'),
('3ae648bc238cbd54ff4b99a894b21bdc4fc5a8ab885b33fab4675f4c2a7120f4c00d5f7566247020', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 23:55:25', '2022-07-15 23:55:25', '2023-07-15 16:55:25'),
('3b53f1a330f4ab934d5761051776e63440b623900a23d8ea35a12e035891e4c072393e658eab3223', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-12 06:53:55', '2022-10-12 06:53:55', '2023-10-11 23:53:55'),
('3cd3269423e543961a7b64e8169875725eb47f8d0f309c69a4a770258de65e9c02057ed9000942da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:04', '2021-08-04 07:35:04', '2022-08-04 13:35:04'),
('3da391c0eaf7b6804973b1838e80808eb4f6c2dce644d452c05d0c0b67b9427ebdf3a9c603681478', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-16 04:10:01', '2022-09-16 04:10:01', '2023-09-15 21:10:01'),
('3de520827474f04b68f013ce870ef319c7f078811a6699a67ba44374296221711bc4352c6a6f6de4', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 01:49:15', '2022-07-31 01:49:15', '2023-07-30 18:49:15'),
('3e923b1f4084faba1a2e5448bd8b72e09b74db6ed25fbe14f6960a5f005107496cc507c1ba15c6e1', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-22 01:32:58', '2021-06-22 01:32:58', '2022-06-22 07:32:58'),
('3e9507badc5dc9f842b8bc36945a8452f05192a048758f2b3a47eec46c332feffe5ac417323e9b2a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 06:16:18', '2022-09-26 06:16:18', '2023-09-25 23:16:18'),
('3f3a93e1e4c25791d211b6bf833ebd599923e0b74d86234fb16b41b44dd8eef870d3e56b82bc48e1', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 23:14:22', '2022-09-22 23:14:22', '2023-09-22 16:14:22'),
('404a50eb1a4182d240c02c3629c1509eadaa0c1a27d4c34ce9209803dc92576e5be7598f2d030209', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-29 06:45:58', '2022-07-29 06:45:58', '2023-07-28 23:45:58'),
('405892693e59257b19b6e1803f0721aa7bad4a03364293de66014204f36dbb4ab7dc2be2dce853e9', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-04 08:17:55', '2022-08-04 08:17:55', '2023-08-04 01:17:55'),
('413dd4193cd6be5b6a6f81ed13a6ed730a0c9a98e332d3f4153bda5e6c3b0f65de57521dab3d65b0', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 23:56:02', '2022-09-26 23:56:02', '2023-09-26 16:56:02'),
('4140d5b9b3d16e4bbef1b676b01f13f75d9c3fb2cada6548e50b0b2679562aace3b9b44f82f15f30', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-19 17:10:26', '2021-08-19 17:10:26', '2022-08-19 23:10:26'),
('42f6754e1075439fda29822112d7b759a99f82f1d4171b06555c88ff20ae0833e3dff6455d8d7c64', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 08:49:12', '2022-08-03 08:49:12', '2023-08-03 01:49:12'),
('434d450475bf18faaef6837b138b92bef1b241be88b9e40243bb9941e912a272afbba68f9c5631d2', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 15:20:04', '2022-07-15 15:20:04', '2023-07-15 08:20:04'),
('435c886e6fd602df8a3bd5506994ed3a061791a04a32020b22ef067b6d57b0c5d6e58f6dca801816', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-16 12:26:52', '2022-07-16 12:26:52', '2023-07-16 05:26:52'),
('487c408c0d8aa9107821a4e55bb861bfd5aad910af893992afbbbcbd27e993c294dee859804a1071', 39, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-30 01:04:49', '2022-07-30 01:04:49', '2023-07-29 18:04:49'),
('48d1bdfdee65e25229cd010fcde0e881f938572400c8a2c050dffba09b7e0f892052af54d2360801', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-10 07:19:25', '2022-10-10 07:19:25', '2023-10-10 00:19:25'),
('4968d61ec85b49863005dfaa96d4b5a2a9ef541496d5a7543ecbc81a2081c85c4201951664590508', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-07 03:21:17', '2022-08-07 03:21:17', '2023-08-06 20:21:17'),
('4bba00445dc9758edf31452eaf39818fae7faa80a8aefb2191a2ddd7dda34357bba035f97afd33bb', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:52:52', '2022-07-15 22:52:52', '2023-07-15 15:52:52'),
('4ca7d9ff91d0da3a0fe7a34520d0a503860a032855e640c485d9732cd088cab89415f2226ed0ba90', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-17 07:58:44', '2022-07-17 07:58:44', '2023-07-17 00:58:44'),
('4cd19ea1fd0d8086390c3b988c921baf0fa820f802881786a40fd7efa14053e4ca417d672bbd816c', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-26 09:53:04', '2022-06-26 09:53:04', '2023-06-26 02:53:04'),
('4cfad08796e4a1eecfe8bbdc20e512e0954570168990fa60442ad41b5ecf05e4005cadcae08fbddd', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:29:52', '2021-06-19 03:29:52', '2022-06-19 09:29:52'),
('4f7de49694da5d8d63da99d71278ae857b3524168121a347d8a30ff6bf2b34986915691994ac69a4', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 15:58:44', '2022-07-15 15:58:44', '2023-07-15 08:58:44'),
('509183200b2989e2a51658878f47b33430608e550a8d2aa623484bd7aae34a66e05e561bd060109c', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-17 21:50:00', '2022-07-17 21:50:00', '2023-07-17 14:50:00'),
('52618f9cfb75631a35fbc8ca6a19d2639da9d384ee3be4dc46566766c52b969cd8d352923cf3a7c4', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 21:57:35', '2022-07-15 21:57:35', '2023-07-15 14:57:35'),
('53a29e9e949bdb4ea5ac9fff45d5e57869afdb92f8f3b310fa45d24fe2f34d92993095fe16056e9c', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 21:24:07', '2022-07-15 21:24:07', '2023-07-15 14:24:07'),
('53afc11b36d08435d8ec82c42305f7aa4397d10b2d296f6e7d819e091d0d7c6d48e14cdc5e66e6c9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:01', '2021-06-23 23:08:01', '2022-06-24 05:08:01'),
('5646d6337aaed0e662c059ed368372e2da241ff97a42df56310667ec321fdbf2252d92771988640a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:37:55', '2021-08-04 07:37:55', '2022-08-04 13:37:55'),
('56d692dbe83f04c1299e972b48f82e0b6b6c6fea51d014d1bde466d7254e5c8533b1ac335e82703d', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-07 04:37:02', '2022-08-07 04:37:02', '2023-08-06 21:37:02'),
('575a51d965761e0c4773c051e80f1bc74a64eb492c683f902aa28a1ac572d1fc09286ef72023e8b2', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-02 01:40:25', '2022-07-02 01:40:25', '2023-07-01 18:40:25'),
('59551e481bc1fb037bee07e1501d81dad38d4ff34fdca68a49c40d0cf423176ca111940acd359aeb', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:50:59', '2021-08-08 14:50:59', '2022-08-08 20:50:59'),
('5a400be4dd4cc86e8550d310e44f9ee376d05ad5c9d5c16de0a7884f698f8de391ac12d3488bcf3a', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 19:50:11', '2022-07-11 19:50:11', '2023-07-11 12:50:11'),
('5d2c1541a426a2ed4108b3874c3780a1a98b179f205640f036d6448922068e7698400bc259153697', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:49:21', '2022-07-15 22:49:21', '2023-07-15 15:49:21'),
('5d9e2db89167eac6b14b8e56e7a29c541e2cd428b2df44cfc156dfc08cd44b4f8ba99dd923731e46', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-05-31 14:15:36', '2022-05-31 14:15:36', '2023-05-31 09:15:36'),
('5faeb404f9162ab1b9309078c1c31d7952544724cf1aeec48590a8042fcf29317ba13d6d42e4b902', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-23 00:37:43', '2022-09-23 00:37:43', '2023-09-22 17:37:43'),
('5fbdff077d96148be2f72b267151642a4c0dd310a78f183467777558dd088f01dfbb1b84f6303367', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-13 03:47:07', '2022-10-13 03:47:07', '2023-10-12 20:47:07'),
('60380abea6ad9a301a6ed673e7a3482a62cbea43286befc1cfb638b542846bd126d462772a2fb439', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-07 04:59:44', '2022-08-07 04:59:44', '2023-08-06 21:59:44'),
('61d46367e316255832827bb0df2be57effc1b0ac1da347fdd412db7dec91f084155596d8eccf6e16', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 23:46:10', '2022-07-15 23:46:10', '2023-07-15 16:46:10'),
('62736a4a9c82ace935f0ae0d9c2eb22a01686ddb865379497f1d3672030c8f2fbfb66e3ebf712f97', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-27 04:17:52', '2022-09-27 04:17:52', '2023-09-26 21:17:52'),
('62990047db67f18e559cc0d1188b7dca5c66dc54cb8de770c380d57cefdd23a33d9a45e75fd45e64', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 09:30:37', '2022-07-31 09:30:37', '2023-07-31 02:30:37'),
('62bee799464d3d178d9b2b8a52bd86a4849c132f1a4470cca7de4fe1a7a6af5a4706d7802ee6775f', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-16 00:04:02', '2022-07-16 00:04:02', '2023-07-15 17:04:02'),
('6452dd1e1d831a0f820fe994f1d57557fd94c5de18cfcaf44e1a67e3198c95118439a389f2e6aa73', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-31 05:22:39', '2022-08-31 05:22:39', '2023-08-30 22:22:39'),
('64a26d8183338f6eef95aadb70419a0202e1af8ec18509947c19136a72c33c2f2842f95f41c62db0', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-07 17:25:41', '2022-08-07 17:25:41', '2023-08-07 10:25:41'),
('64c3c878305f7a207f6545176babc9be4c73282adf92bd0527a43bebf28a9da14ec8c291d9d4e23e', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-05-29 18:17:12', '2022-05-29 18:17:12', '2023-05-29 13:17:12'),
('6627f151affec1f08ddf0ddc945ac1864610905efc15faafc273be122b9fb16512083a0c2f58d30d', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-11 06:52:53', '2022-10-11 06:52:53', '2023-10-10 23:52:53'),
('6664de77bd592a8ab552c9cbcc1fd63ef3beec13c852b4ac3f8d3b087a51d1cfbb48c6f780df84c0', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-27 02:31:11', '2022-09-27 02:31:11', '2023-09-26 19:31:11'),
('66c1ea3655f8a437673fe4705dbb0baeed2ef7e29a86b1105ec3b861022b9e4b435bec2b3ae8cb14', 45, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-02 06:22:49', '2022-08-02 06:22:49', '2023-08-01 23:22:49'),
('67a5cfea95ec0388c30996564db8a6e4979cbfe35e31c4a80310e9dae03bcf291e671843dd605fbd', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 15:31:53', '2022-07-15 15:31:53', '2023-07-15 08:31:53'),
('68b06321c4bbbea81e7dfcbd8d5fae1a94a2fa0500041ee5774be2d9300c1ff7590d03604b77514a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-28 02:33:54', '2021-07-28 02:33:54', '2022-07-28 08:33:54'),
('6a9ea0ee8d25b41695edce0b4a3d1c08a65881890d17bd4d952d5d6583d1f2cceccefb8d1f3be728', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 12:23:58', '2022-06-01 12:23:58', '2023-06-01 07:23:58'),
('6ab8d75831b88b348f2fdb240b3e183ae78e43147a93d51182d843270bb253b11aa2524086e5cdd7', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-18 17:04:47', '2022-07-18 17:04:47', '2023-07-18 10:04:47'),
('6ca608854b4a10d4d8e5608e61c0d766c670227decd588d133e05e71028e256e3b7ea04748763b1a', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-02 05:12:04', '2022-07-02 05:12:04', '2023-07-01 22:12:04'),
('6e2bbff30c185d67a410255b97f8b257c6cb94531a17d3d8d8f506afd01fa5fc958235d7413b90d5', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-15 19:32:09', '2022-08-15 19:32:09', '2023-08-15 12:32:09'),
('714ed1183f583f9cedb276cb3a40086664529890a80aed4801cb286023f7a0d1030b1f42abd64da4', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 08:53:54', '2022-07-11 08:53:54', '2023-07-11 01:53:54'),
('715df14c2571b4bd832ecb24b8aa74e83a5eadd93dc31e0e110b5ec8ddb05b966cd036d879bd5648', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-03 15:46:14', '2022-07-03 15:46:14', '2023-07-03 08:46:14'),
('7181d45d994cc19beae400da2d80ff9de44ab1c5e96fb3b587bd3986101c4f89e341df30289ac5ba', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-04 15:31:27', '2022-08-04 15:31:27', '2023-08-04 08:31:27'),
('723ceee668cd1a7fc2e977be48cab3f31aed1ace0883692711b5cc2ddf42c2f23c6d75461172105f', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-01 05:46:27', '2021-07-01 05:46:27', '2022-07-01 11:46:27'),
('74e2dd27429bb92c12e33f891ccff32f48c22463166666705d145cfd8968d96ec992fa2cc3a36e76', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:23', '2021-06-23 23:08:23', '2022-06-24 05:08:23'),
('777af54f8052c2ac660de017b746ad4fa628fbcad2ed67f0349cbf37460b338866bfa92b7e584bae', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-24 00:42:20', '2022-09-24 00:42:20', '2023-09-23 17:42:20'),
('77c9389b2ab3031e09005a7e7be90d00496ff073dbbefeb57229cee5d0a240376c1f7c3c8a94faff', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:38:22', '2021-06-19 03:38:22', '2022-06-19 09:38:22'),
('786d60a40feffacc3bcd468cfcc085fff813a72ec51aa9b946c8cf9e9f517f2c745f0637440c9e24', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-23 21:58:50', '2022-09-23 21:58:50', '2023-09-23 14:58:50'),
('78eb07632199016e6b1a91b373514a695441f9e2ea6b64f1583eb49f0879fa880c081f0cec9f629f', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 21:27:12', '2022-07-31 21:27:12', '2023-07-31 14:27:12'),
('79071db0c3e8f9e44a8f345da24c36954dd8f928b1ba4fb0e806850987ae3d0234da9a1d93f02525', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 12:26:22', '2022-07-11 12:26:22', '2023-07-11 05:26:22'),
('7c5170a1293bc7c3083d9ba7cca0c84d6475dbaf9dd04356619398ebc13c3a2db781a9b8989cf8f1', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 11:41:59', '2022-06-01 11:41:59', '2023-06-01 06:41:59'),
('7de4056fbca7bd32b6331aca816e86d3cdc8eaf9ede8e65d4b3d1ec98a8d8c2479b20d22c82b879e', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-01 09:26:29', '2022-08-01 09:26:29', '2023-08-01 02:26:29'),
('82ac2ba5962e59f0fd3ed2560c9e332425e4658684e57062ec892f9c9bb53b402a35ce02aedf9251', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-08 07:37:38', '2022-08-08 07:37:38', '2023-08-08 00:37:38'),
('83b5f17c5cd2c66c835493ee161666d09fadf1b7ee4a09ee30f246bbe09c84280e0c47be31b2f455', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-28 20:53:49', '2022-07-28 20:53:49', '2023-07-28 13:53:49'),
('867c991f2c4d84579d6877a5c37cba3d58fb65890ad435e7e50221f53a74bdc702787110dd386b14', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-04 08:04:31', '2022-07-04 08:04:31', '2023-07-04 01:04:31'),
('87fbbdec854fb60dbf68c09781df75093ad7013fffb42a67399c8ee75f93ccce7f7da884952c85e0', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-06 08:15:51', '2022-07-06 08:15:51', '2023-07-06 01:15:51'),
('89384619659ae2ff1531e0564231a484a0fcd8eb1ae3bda77944746f3f842841acd361280c744f73', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-15 19:09:08', '2022-09-15 19:09:08', '2023-09-15 12:09:08'),
('8a20c4f8656e404615f9abc15a95f6754dd87e4e894677647dd17236b95d8a5d7cc243c38457b048', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 02:36:57', '2021-07-04 02:36:57', '2022-07-04 08:36:57'),
('8a73efda42ea5993c4ea2f4c9ce0bf7dfa7abe437546b09de3951178248da51d8f248264e7a4128e', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-09 23:32:48', '2022-08-09 23:32:48', '2023-08-09 16:32:48'),
('8bf229e45730c008ec5909298fcbf2a9939e588b3c09780b6a5401f14753e2f924546e03e543c36e', 35, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-23 11:04:14', '2022-07-23 11:04:14', '2023-07-23 04:04:14'),
('8d3ef29fac12cd79839b6cb5e2726081e4abb58ca5b476079b6717b611e6762ca9c5f7ae7b467a5f', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-28 21:42:32', '2022-07-28 21:42:32', '2023-07-28 14:42:32'),
('8d9621189e49620b4e6b172571e737111f57a3909fe12ea2618d5d4cb92405ad4acb01e4286c9b3e', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 01:29:19', '2022-07-31 01:29:19', '2023-07-30 18:29:19'),
('8db5486c2645ca5076b1c03434affef1c980682e410ce8a25a567f40c78669bf2f73f02056a1a988', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 18:00:05', '2022-09-21 18:00:05', '2023-09-21 11:00:05'),
('8ffc458ddbcbbbec17035dc2153c4baeebb5c54796b3a9008f24c8699197a8a2fc1111c36cc1d7da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:27:12', '2021-08-14 07:27:12', '2022-08-14 13:27:12'),
('907aa944726a622e7c296b910f81b10ab8c62375726ed461f50a85fece5feed07144b1e917b554e4', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 20:05:32', '2022-07-11 20:05:32', '2023-07-11 13:05:32'),
('90b17f5565598a7df6eb8be2b4e2b6e8d90b70e4f81be6342832c031271dce47eaec0e128a2b435e', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-10 18:27:29', '2022-10-10 18:27:29', '2023-10-10 11:27:29'),
('90e47237a014115571fb24f07949d9f746a4919ceeacea9f1b63f8f3bc92fce1ada2beaf4c482d54', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-22 23:34:18', '2022-09-22 23:34:18', '2023-09-22 16:34:18'),
('91424e9511329ac29203c785609afa76d0f19f4e68c445ffeb5528369fbd083152a13cc11e280cfa', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-30 16:18:05', '2022-09-30 16:18:05', '2023-09-30 09:18:05'),
('91eed9c06f05f0aa9120ce9e3d0a522a2ebab7cfaf8abfb7f833abd473008fcba2ea6d49ae82ca9b', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 07:48:12', '2022-07-31 07:48:12', '2023-07-31 00:48:12'),
('938b765e7fbccd0989560e645d1033e4e2357cb4e5dd861e13f39f5e73e0e3fd83354b8f8ffc9f09', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-05 23:18:27', '2022-10-05 23:18:27', '2023-10-05 16:18:27'),
('944af07a078b455fded39c91a4f9c50c21ba087bc474596b6035787f2eddebb2e98e26dcb4259b1f', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-16 12:59:07', '2022-07-16 12:59:07', '2023-07-16 05:59:07'),
('956687ebe7739c76e9e07229930aeef4c54ef0e24abca98910ca60a79171a5aef178b684c8cc52b5', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-27 02:53:00', '2022-09-27 02:53:00', '2023-09-26 19:53:00'),
('970ee254e4906a07bb82177aceeb3bb418b72ca937955aa8b04051a1effcf99ee463aa90feb29b7c', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-08 23:36:09', '2022-08-08 23:36:09', '2023-08-08 16:36:09'),
('9939633b70a59c018f7270caafa0b32c0c42a8bc1e725c403455115be4488c336d11bd845bf59c62', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 01:58:10', '2022-07-31 01:58:10', '2023-07-30 18:58:10'),
('99a1c1787224ece47ad44c62228ec66d6ebb31f17959f3bac602de03e8152d2754803d61d9ef5f5d', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-20 00:47:10', '2022-09-20 00:47:10', '2023-09-19 17:47:10'),
('9a51887994c30b65a7fe917d4c72615b47aa890887270dcf58137c443ec9adbd3b4f956e5e311a8c', 17, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 20:35:14', '2022-07-11 20:35:14', '2023-07-11 13:35:14'),
('9a6bfd65196f6c0cd411c837ec291f65525c0f067253915cdab1ab6e984114940dd829953ccca9df', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 22:58:44', '2022-08-03 22:58:44', '2023-08-03 15:58:44'),
('9eb06331cf13c18fb541674c30b07091e3f3e6553940f7ee5fb9424693c526c77397d08170b5223c', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:15:07', '2022-07-15 22:15:07', '2023-07-15 15:15:07'),
('a092dc4a49ec27a06d8c9c335446de3d90e03363c6059cdf6fbf2113edaab5fe752053a794ac9236', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 10:12:49', '2021-08-08 10:12:49', '2022-08-08 16:12:49'),
('a3b62d03e2c7954a199fe578afb704ed03245eb037a44a20f4db6f9770128c3161ad4034e4ad7d36', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-18 15:51:57', '2022-07-18 15:51:57', '2023-07-18 08:51:57'),
('a4affca6b8edd018908fd7a2f7b5f779b30ad9a0dc14955504123bb574b39edf3bace31ab45667a4', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 13:12:08', '2022-07-31 13:12:08', '2023-07-31 06:12:08'),
('a5e11645d121d3f8e532578725465055f36556bea7a92c8b88e811bb86dea2473319801d2e8666e2', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 21:55:08', '2022-07-15 21:55:08', '2023-07-15 14:55:08'),
('a6594f54f2d4b9ee4fb4193eac8312fe785228d1e77383007b52f5fa63530066a6b09981b5e2cc77', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-06 01:55:41', '2022-10-06 01:55:41', '2023-10-05 18:55:41'),
('a858ed105c79fb7b9136f36b22c9b731dc3600b46dd4441336112a2e5d302430a430eda8c82a60a2', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 22:38:34', '2022-09-26 22:38:34', '2023-09-26 15:38:34'),
('a8afd73aa4631c01064064d773060133d28b3f13721c234753eaba57e19f0d6ba448fe9dcdd1c368', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 10:21:03', '2022-07-11 10:21:03', '2023-07-11 03:21:03'),
('ac4eb29334a96f494ea4fa617f5a7539435a6e5a33f73faa6176d236c6674b4fa0b5be4f98053c8b', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 09:26:53', '2022-07-31 09:26:53', '2023-07-31 02:26:53'),
('aed559cd09bf434e06b6e98fd4ab6ed913c8c34f456e1aa3f357c676864394ca66066f52ed1a1cb6', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-30 00:58:45', '2022-07-30 00:58:45', '2023-07-29 17:58:45'),
('aedabe994956edae401713a638a66c5a227fbd3409cf15b9705f455783c8c2aff4b3cc08517be6d1', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:42:56', '2022-07-15 22:42:56', '2023-07-15 15:42:56'),
('b03d869e0fbd005761146ddb77b11b14b8cdc15d8b04c0eeb6acf223e71786f2637ba2e014f6ab17', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-10 01:56:31', '2022-08-10 01:56:31', '2023-08-09 18:56:31'),
('b173ed37d259dccbcc2970a57caaa857e4657386c71b6305ef5c8a4f5d09aefcbf766ea695873077', 43, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-01 01:35:37', '2022-08-01 01:35:37', '2023-07-31 18:35:37'),
('b1b898251b87d4fe220ff332a4270e2f2128d576703b8dfb3047f34b25fbc0f60dbc4c8968daeab2', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-02 07:45:03', '2022-08-02 07:45:03', '2023-08-02 00:45:03'),
('b1e3ba291e0d4149c353524dd0781b9ca03f10c428a2df4737b20269f7d32f42c60de64facdc12b7', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 20:25:53', '2022-09-26 20:25:53', '2023-09-26 13:25:53'),
('b4651c7e8bbe8a68b4959504c3a7e3705208cbdb79fcc2498b9b3d0efa9c7cadc77699590cf8f2d4', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-20 03:59:46', '2021-06-20 03:59:46', '2022-06-20 09:59:46'),
('b48f9653f30d4e6fc2c9b7f28e4eb55873b8ebaa8769fa3c6083e84a5a8c6be6728e82f49c0c39ed', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 06:41:08', '2022-07-31 06:41:08', '2023-07-30 23:41:08'),
('b5a03ade6dbe88477f685519738aacb6a9d85ea211b9907fb97d105f0b6b06ec3c2238f563b5f496', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 21:34:21', '2022-07-31 21:34:21', '2023-07-31 14:34:21'),
('b7637feae9657f19ae1103ae7b0a4e7de2eedce92f850a930a4916114882b4ffe61949cf2ed29027', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 09:30:58', '2022-07-11 09:30:58', '2023-07-11 02:30:58'),
('bc56a4fe85f97fb6e891e63bdf01caf31d2dab0f8f64a57e94c83fddefbbfc9c0730c3cbb2c7b059', 13, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-07 22:21:50', '2022-07-07 22:21:50', '2023-07-07 15:21:50'),
('be226856694f13086ca31f2d5535b0da3dca758385230ae328d738dc9084c6d5f08672dbc02287ef', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-07 01:40:16', '2022-08-07 01:40:16', '2023-08-06 18:40:16'),
('be85926d0d715f2f1a977af1d10addd718d11fb2c6b10558f97e0ae80a89054be9f2e423484dcb96', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 11:25:33', '2022-07-31 11:25:33', '2023-07-31 04:25:33'),
('bf24e16194d82c4e2982724df0fef68f7923d6d01ce8c5e1b64e2716d2412db6e62891f0f8dae8a6', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:34:19', '2021-07-31 08:34:19', '2022-07-31 14:34:19'),
('c1b7df78e7373f5eca5f64083ac9bbc6c9bd582adf6c143f520c8a65420d3ee050044e6f65f0a033', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-24 03:40:43', '2021-06-24 03:40:43', '2022-06-24 09:40:43'),
('c23466a74200418692cc1db99d481aef0d27be73da360865c83e68c222b02aa08a4c626eb5adfe0f', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-10 07:37:56', '2022-08-10 07:37:56', '2023-08-10 00:37:56'),
('c262958bde43048c2e6acd35d544b2786375255e264782f785aca2e95b898708d54f46bea72fbad1', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 17:05:08', '2022-06-01 17:05:08', '2023-06-01 12:05:08'),
('c2c46a54cbc7da6b16f61ad4211c00754ad8bfc5d342165c09160fc969f2281bd478592811773ab2', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-09 07:13:49', '2022-08-09 07:13:49', '2023-08-09 00:13:49'),
('c393c4c2a346c91a0a396e06c66ef4780a67b69d32f1aa16269da330673afb782d0e064e10dac70c', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 21:32:22', '2022-08-03 21:32:22', '2023-08-03 14:32:22'),
('c7b6053c9e2216fa1e3979f5414ddf0d26e0067ad11a1bcfa71f1930e57c9306e7f702f93461a9a9', 48, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-04 18:33:44', '2022-08-04 18:33:44', '2023-08-04 11:33:44'),
('c926c3a68624e1872d9d5a34dfabb27e9642b5708ad57f59715f2f4920b4fcdf00491fc13b767d50', 33, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-17 21:52:47', '2022-07-17 21:52:47', '2023-07-17 14:52:47'),
('cac966fd18272c092d32438acc6c364fe184d1350f8c52bac5e8f1cae0f0e6675b0a370a5c9ef447', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-06 08:19:40', '2022-07-06 08:19:40', '2023-07-06 01:19:40'),
('cc7d521043335125101b747a2351b048075a4c24f40b1a2cccd12eb55a8a3629aac7a4897c823246', 51, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-04 18:44:45', '2022-08-04 18:44:45', '2023-08-04 11:44:45'),
('cdfa8612bba5b04ada6791fd506a4f5fd478908e038b255513364e9d934ad864f98ed123a3e53671', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-24 05:12:08', '2022-09-24 05:12:08', '2023-09-23 22:12:08'),
('ce57a5a27ef8e25cac8658f1eace933f02fcdb6f58c9a9d4a130801798454ce149af9c4d00e0eff2', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-10 18:23:55', '2022-10-10 18:23:55', '2023-10-10 11:23:55'),
('ceaacede6a4a3c5dd61e78b2c2c358c4412933532822cbff618226a7d6b23684e962770e0e042c76', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 00:20:55', '2022-06-01 00:20:55', '2023-05-31 19:20:55'),
('ceabc49134ca2f49b9affc2b3630067fa9e8413ac3b28a20b63742e28e3bb25cf3b71e38572d64b0', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-18 06:41:03', '2022-07-18 06:41:03', '2023-07-17 23:41:03'),
('cff52fb8ff7879540d5222e2092a61136f48fd512886deb33c56952652cc6b9952d4fb471be5f827', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-24 07:02:44', '2022-09-24 07:02:44', '2023-09-24 00:02:44'),
('d0a27c26f6533392b1971dea520808d3efe0e6fd2b8346b5de5f4679f1ce1a3511f1085b92b5cb3e', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:17:11', '2022-07-15 22:17:11', '2023-07-15 15:17:11'),
('d25dbe45c3a4b9c5b9ccf09d6da820da1db6afd1ddead00c53d7b3c30654fb4a858abd2793b1432a', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 21:32:54', '2022-07-31 21:32:54', '2023-07-31 14:32:54'),
('d31236453e71ae8cea03621317564250be3e7d188291aea32160ea87d3b95812bc8c254d825c16a9', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:26:57', '2022-07-15 22:26:57', '2023-07-15 15:26:57'),
('d3290e7b04a795642b661340d5fcd21e0fe72fcdb15eae05789a3df0f36b312746ba8bebeabd8689', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:29:57', '2022-07-15 22:29:57', '2023-07-15 15:29:57'),
('d3304f8667f73420cb6db8116f5b5d2ba248e313ac3fc9508cc8edb10f6e9a8d70e46f45473860a5', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:48:34', '2022-07-15 22:48:34', '2023-07-15 15:48:34'),
('d6e89da656f02f6b27fb669c03fbebbc0b84fcdf97448a97177bf81abad812d435213a157466ee0f', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 12:25:17', '2022-06-01 12:25:17', '2023-06-01 07:25:17'),
('d736532a58b4c1e1defa9e3f82a00eddfe7446591d7a5654452c8229bbb83d0013cdd6372a9f0fba', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 23:44:37', '2022-07-15 23:44:37', '2023-07-15 16:44:37'),
('d7433df0d64e5951c083f43c58fe9c22c6cddb7cc69c07565b274d902670a16ba08b5082b09f01d5', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-21 18:30:36', '2022-09-21 18:30:36', '2023-09-21 11:30:36'),
('d7bf011f36e6ac66ba528a8d1cf1743d0030d0300fb4fe7dc1c1317b2dcb82899c9449f6e92123eb', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 01:43:06', '2022-07-31 01:43:06', '2023-07-30 18:43:06'),
('d81903e32ca3a6309e66b256e260c6bd8ee6f5603d09974efcfa1881a030c75f629d38c13fd3e007', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-01 12:15:35', '2022-06-01 12:15:35', '2023-06-01 07:15:35'),
('d99962bbfa3c47434998056020609be697041950c12770d700903865103d768aad0e497acf3c8fcd', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-09 23:38:07', '2022-08-09 23:38:07', '2023-08-09 16:38:07'),
('dad60f81fc92cbaa758f837d38c7f33594ae096138a53e121d094c3da060191344fb6c3ae169abc6', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 21:22:22', '2022-07-31 21:22:22', '2023-07-31 14:22:22'),
('dafbef99740e4e1308ba7c5be77742b29899c87619b1d7dd18787f7d3ac26248be162eaec531b9d4', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 21:13:33', '2022-07-15 21:13:33', '2023-07-15 14:13:33'),
('dbb4cf1ca684224472a34ee0ff4c826b53de73bcf6b7f3d1ba35321790057f7687437c425a601a50', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-04 18:42:07', '2022-08-04 18:42:07', '2023-08-04 11:42:07'),
('dc08544381049f1a13558e77d9f67da9dd92680e1e5e99616c8751a05496aef152482949eef07338', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 23:05:39', '2022-07-15 23:05:39', '2023-07-15 16:05:39'),
('dd1c19c6a1b771a8e02e74378a4e64bff7f4897ed6432c03a9d2cfca8785038e8e18e1c04e270881', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 22:37:30', '2022-09-26 22:37:30', '2023-09-26 15:37:30'),
('dd460274398eb1778419639bd883558e575d055a581a1792a61026506d589636b4372554d0e99767', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-02 07:37:03', '2022-08-02 07:37:03', '2023-08-02 00:37:03'),
('dd6578c99fc90f666b9433871d28f9913fefc860d9a60427388cfcf727be6f5c10eb8b764b39c557', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-28 10:20:50', '2021-06-28 10:20:50', '2022-06-28 16:20:50'),
('ddb6f20ee856e826b71176fc54f690905e1a7c132e7cdc6c0bdbf57191c124f63281efca30086ee6', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-27 01:45:37', '2022-09-27 01:45:37', '2023-09-26 18:45:37'),
('de632bdcac390cfb75ee642e89a3068ac256cd1301e15c08e81f31d80722a3a6a5b507e39114160f', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-26 23:22:12', '2022-09-26 23:22:12', '2023-09-26 16:22:12'),
('dfed3e7fe1ec7a91bd3ff7572647af6c55dae5d0fa4b603475efa9056bc724eb1bdd72e07ca41b94', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 07:24:30', '2022-08-03 07:24:30', '2023-08-03 00:24:30'),
('e1cabb8138a46bfcc0e42c1d62efbc34cd4abfea033ea580c553d10be994b74bcaacdc8f39af0866', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-10 18:31:03', '2022-10-10 18:31:03', '2023-10-10 11:31:03'),
('e37855a3eed3e68c520d10329f3635946da5d05f6fe9fd7da613facf5faf5747d49226e310a1c527', 17, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 09:53:14', '2022-07-11 09:53:14', '2023-07-11 02:53:14'),
('e447977c41c36b134cb988be9fa10b60b33a61871510a514f3a926c74a1a081282fdfaba75fe9c4e', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-06 08:20:22', '2022-07-06 08:20:22', '2023-07-06 01:20:22'),
('e64a7428983f7fccae6b6b43f46e15a810182d9b978161a91a3c1aaddff85ebc30e3a190f3726c4e', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-28 06:45:44', '2022-07-28 06:45:44', '2023-07-27 23:45:44'),
('e6e57d897a193fa4b5ce94fb5f56fb86b36deaee5ef21735512e449fe506d0ca4bd045921bc8c94f', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 15:17:21', '2022-07-15 15:17:21', '2023-07-15 08:17:21'),
('e90c7926565d8048ea8e99d3d1d53ab77778ea5d71c6d6a61b5d0c100ee030368648879663bce193', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-08 07:21:26', '2022-08-08 07:21:26', '2023-08-08 00:21:26'),
('ea3ca170bd7935fe3f2a9c80c74d1e8e6eda8cc197ce2066305a286d175ad250475a4657e498779b', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-21 01:24:25', '2021-06-21 01:24:25', '2022-06-21 07:24:25'),
('eb0e844143dd09d19ecfc9640188fe5446134e575b44e9361c1d17b145779cee7d7f1b35b0c320a5', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-06-27 08:51:48', '2022-06-27 08:51:48', '2023-06-27 01:51:48'),
('f3525efb3d6587a432fafade8067956e6481e1398929c0692795083d9ad62c8e3ac5963835e5cc13', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-04 08:18:39', '2022-07-04 08:18:39', '2023-07-04 01:18:39'),
('f39ec8fff0a9b77f7bab7c5fd18388dd02520bd28f5ba06e544c53c23f15e1e63a03907dd29edb0d', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-11 19:35:08', '2022-07-11 19:35:08', '2023-07-11 12:35:08'),
('f6478d2f86f63dbd4bcd475704c45a867f0a0d98664e70c1e154972ce97feb66dfeee049f8fce9bc', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-31 01:09:18', '2022-07-31 01:09:18', '2023-07-30 18:09:18'),
('f65a21af11154963bb26417b2987e003bc65a60f831db6ea3ac1b66cceb96038d471c65dce1a905f', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 15:56:47', '2022-07-15 15:56:47', '2023-07-15 08:56:47'),
('f74d1676172f50938c1c1706f203020e0ad49a5eb94b958a7a5f2ecb79036bd4516b2332951a70a4', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-10-09 01:39:07', '2022-10-09 01:39:07', '2023-10-08 18:39:07'),
('f7f379a89131db0c817b187b0a0e2e312e914a330d4329d45cae63e1d7f04aa2126d6e551fe2e832', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-15 22:28:45', '2022-07-15 22:28:45', '2023-07-15 15:28:45'),
('f862e35a5d9328ddaa1933432a5e9ad48dce9ed7b79601454b6dc0f3f5959af117da82baef42a594', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-05-30 10:18:01', '2022-05-30 10:18:01', '2023-05-30 05:18:01'),
('fa439dbb388bf08f4db0ce08d0f6034be14d46af1c110f554e9e24465e9770806e80d63a6982a563', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-23 23:52:22', '2022-09-23 23:52:22', '2023-09-23 16:52:22'),
('fa8a63cf0f2933f25eefec7858b060da998570cda101078ff0290cba729c40e545f82ae29881c1e5', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-02 11:14:46', '2022-08-02 11:14:46', '2023-08-02 04:14:46'),
('fa8d95b2d3cc4a13abaf1275605010bcb9d3203852409d00f42ef5c823145da914ed7a82f8d12b59', 54, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-09-18 09:20:23', '2022-09-18 09:20:23', '2023-09-18 02:20:23'),
('fa9dce087788074eaf94522e20f9b8c358ac2b6d3f6ee6305b1d762e469de27d42b9519018a1eabd', 53, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-31 04:53:26', '2022-08-31 04:53:26', '2023-08-30 21:53:26'),
('fb6f46fd1964ecaec1f66465dbe2bdacdd8961308bdead71c1196a18d0ccfdf7d339164c1f17fa04', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-08-03 08:56:29', '2022-08-03 08:56:29', '2023-08-03 01:56:29'),
('fbedd95deef314d0387da2ff73ce660ea48902a26a38732e1d09a4c869807ed11a9566924e77e968', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 00:42:18', '2022-07-08 00:42:18', '2023-07-07 17:42:18');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qFAwGhxq8A6SDmolyxZunXyQ4mxOH0jEezXsgaxP', NULL, 'http://localhost', 1, 0, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(2, NULL, 'Laravel Password Grant Client', 'qdV021R3MGGAwRxvvqG0mWgnypwzolzusBq1L5W6', 'users', 'http://localhost', 0, 1, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-19 03:27:59', '2021-06-19 03:27:59');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_discount_amount` decimal(24,2) NOT NULL,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT '0.00',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `restaurant_id`, `created_at`, `updated_at`, `delivery_charge`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`, `zone_id`) VALUES
(100001, 9, 350.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-03 09:25:19', '2022-07-03 16:25:16', 0.00, '2022-07-03 09:25:19', NULL, '5091', '2022-07-03 09:25:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Test\",\"contact_person_number\":\"+201096816000\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\\u060c Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100002, 20, 500.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-11 12:30:27', '2022-07-13 06:08:38', 0.00, '2022-07-11 12:30:27', NULL, '6294', '2022-07-11 12:30:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"\\u0647\\u0627\\u0644\\u0648 \\u0647\\u0627\\u0644\\u0648\",\"contact_person_number\":\"+201096856074\",\"address_type\":\"others\",\"address\":\"Cairo, Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100003, 21, 300.00, 0.00, '', 'unpaid', 'handover', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-11 19:59:03', '2022-07-13 11:30:23', 0.00, '2022-07-11 19:59:03', NULL, '1280', '2022-07-11 19:59:03', NULL, '2022-07-13 11:29:48', '2022-07-13 11:30:14', '2022-07-13 11:30:23', NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Hesham Azab\",\"contact_person_number\":\"+201222727785\",\"address_type\":\"others\",\"address\":\"\\u0645\\u062f\\u064a\\u0646\\u0629 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c \\u0645\\u0631\\u0643\\u0632 \\u0628\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0633\\u0628\\u0639\\u060c\\u060c J3HH+PW3, Madinet Berkat as Sabee, Birket el Sab, Menofia Governorate 6160621, Egypt\",\"longitude\":\"31.0794826\",\"latitude\":\"30.6297614\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100004, 5, 240.00, 0.00, '', 'unpaid', 'handover', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-13 09:52:54', '2022-07-13 09:56:56', 0.00, '2022-07-13 09:52:54', NULL, '2137', '2022-07-13 09:52:54', NULL, '2022-07-13 09:55:20', '2022-07-13 09:56:24', '2022-07-13 09:56:56', NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Fahd Gad\",\"contact_person_number\":\"+201033563559\",\"address_type\":\"others\",\"address\":\"Cairo, Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100005, 23, 300.00, 0.00, '', 'unpaid', 'handover', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-13 10:16:47', '2022-07-13 10:18:36', 0.00, '2022-07-13 10:16:47', NULL, '2466', '2022-07-13 10:16:47', NULL, '2022-07-13 10:18:09', '2022-07-13 10:18:21', '2022-07-13 10:18:36', NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Moko\",\"contact_person_number\":\"+201096813074\",\"address_type\":\"others\",\"address\":\"Cairo, Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100006, 5, 60.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-13 11:58:41', '2022-07-13 11:58:50', 0.00, '2022-07-13 11:58:41', NULL, '1232', '2022-07-13 11:58:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Fahd Gad\",\"contact_person_number\":\"+201033563559\",\"address_type\":\"others\",\"address\":\"Cairo, Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100007, 6, 60.00, 0.00, '', 'unpaid', 'handover', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-13 11:58:45', '2022-07-13 12:03:31', 0.00, '2022-07-13 11:58:45', NULL, '8650', '2022-07-13 11:58:45', NULL, '2022-07-13 12:03:19', '2022-07-13 12:03:23', '2022-07-13 12:03:31', NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"George Xeplod\",\"contact_person_number\":\"+201223157398\",\"address_type\":\"others\",\"address\":\"Cairo, Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100008, 25, 500.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-15 22:45:03', '2022-07-16 06:58:08', 0.00, '2022-07-15 22:45:03', NULL, '8422', '2022-07-15 22:45:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmedmalek Salem\",\"contact_person_number\":\"+201010816074\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\\u060c Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100009, 2, 81.00, 0.00, '', 'unpaid', 'confirmed', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-15 23:16:08', '2022-08-09 07:23:23', 0.00, '2022-07-15 23:16:08', NULL, '3077', '2022-07-15 23:16:08', NULL, '2022-08-09 07:23:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Hesham Azab\",\"contact_person_number\":\"+201004479160\",\"address_type\":\"home\",\"address\":\"Cairo Festival City, Nasr City, Egypt\",\"longitude\":\"31.41001235693693\",\"latitude\":\"30.03286406207867\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100010, 30, 501.00, 0.00, '', 'unpaid', 'confirmed', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-07-18 15:52:23', '2022-08-07 17:13:30', 0.00, '2022-07-18 15:52:23', NULL, '6114', '2022-07-18 15:52:23', NULL, '2022-08-07 17:13:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"George Wadia\",\"contact_person_number\":\"+201223157368\",\"address_type\":\"others\",\"address\":\"Cairo, Egypt\",\"longitude\":\"31.235711686313152\",\"latitude\":\"30.044419567021205\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100011, 43, 100.00, 0.00, '', 'unpaid', 'picked_up', 0.00, 'cash_on_delivery', '111', NULL, NULL, NULL, NULL, 'delivery', 1, 3, '2022-08-01 22:50:12', '2022-08-07 17:16:21', 0.00, '2022-08-01 22:50:12', NULL, '3655', '2022-08-01 22:50:12', NULL, NULL, NULL, NULL, '2022-08-07 17:16:21', NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"hemoo alii\",\"contact_person_number\":\"+201022222222\",\"address_type\":\"others\",\"address\":\"10th of Ramadan City, Egypt\",\"longitude\":\"31.742343418300152\",\"latitude\":\"30.29266538402099\"}', 0, 0.00, 0.00, NULL, 0.00, 0, 1),
(100012, 52, 320.00, 0.00, '', 'paid', 'delivered', 0.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 7, '2022-08-07 17:27:37', '2022-08-07 17:55:44', 20.00, '2022-08-07 17:27:37', NULL, '4710', '2022-08-07 17:27:37', '2022-08-07 17:28:18', NULL, NULL, '2022-08-07 17:29:24', '2022-08-07 17:55:36', '2022-08-07 17:55:44', NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Lob\",\"contact_person_number\":\"+201020202020\",\"address_type\":\"others\",\"address\":\"Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt\",\"longitude\":\"31.3521273\",\"latitude\":\"30.1790578\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100013, 52, 620.00, 0.00, '', 'paid', 'delivered', 0.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 7, '2022-08-08 06:35:51', '2022-08-08 17:47:08', 20.00, '2022-08-08 19:01:00', NULL, '9533', '2022-08-08 06:35:51', '2022-08-08 06:36:27', '2022-08-08 06:39:18', '2022-08-08 17:46:49', NULL, '2022-08-08 06:39:53', '2022-08-08 17:47:08', NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Lob\",\"contact_person_number\":\"+201020202020\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c \\u0645\\u0631\\u0643\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0646\\u0643\\u0629\\u060c\\u060c 59H4+MHX, Al Qalg, Al Khankah, Al Qalyubia Governorate 6345386, Egypt\",\"longitude\":\"31.3565756\",\"latitude\":\"30.1791694\"}', 1, 0.00, 20.00, NULL, 0.00, 0, 4),
(100014, 52, 320.00, 0.00, '', 'paid', 'delivered', 0.00, 'cash_on_delivery', NULL, NULL, 3, NULL, NULL, 'delivery', 1, 7, '2022-08-08 17:47:57', '2022-08-08 17:57:51', 20.00, '2022-08-08 19:31:00', NULL, '4761', '2022-08-08 17:47:57', '2022-08-08 17:50:30', '2022-08-08 17:52:28', '2022-08-08 17:55:31', '2022-08-08 17:55:52', '2022-08-08 17:55:59', '2022-08-08 17:57:51', NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Lob\",\"contact_person_number\":\"+201020202020\",\"address_type\":\"others\",\"address\":\"Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt\",\"longitude\":\"31.352121\",\"latitude\":\"30.1790606\"}', 1, 0.00, 20.00, NULL, 0.00, 0, 4),
(100015, 52, 920.00, 0.00, '', 'paid', 'delivered', 0.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 7, '2022-08-08 17:57:37', '2022-08-08 18:46:34', 20.00, '2022-08-08 19:31:00', NULL, '3756', '2022-08-08 17:57:37', '2022-08-08 18:04:13', '2022-08-08 18:33:31', NULL, '2022-08-08 18:36:35', '2022-08-08 18:37:28', '2022-08-08 18:46:34', NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Lob\",\"contact_person_number\":\"+201020202020\",\"address_type\":\"others\",\"address\":\"Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt\",\"longitude\":\"31.352121\",\"latitude\":\"30.1790606\"}', 1, 0.00, 20.00, NULL, 0.00, 0, 4),
(100016, 52, 920.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 7, '2022-08-09 06:39:28', '2022-08-09 06:45:59', 20.00, '2022-08-09 06:39:28', NULL, '3946', '2022-08-09 06:39:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Lob\",\"contact_person_number\":\"+201020202020\",\"address_type\":\"others\",\"address\":\"Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt\",\"longitude\":\"31.3521086\",\"latitude\":\"30.1790593\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100017, 56, 460.00, 0.00, '', 'paid', 'delivered', 40.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 6, '2022-09-26 23:26:15', '2022-09-26 23:31:11', 20.00, '2022-09-26 23:26:15', NULL, '9910', '2022-09-26 23:26:15', '2022-09-26 23:29:25', '2022-09-26 23:30:10', '2022-09-26 23:30:35', '2022-09-26 23:30:53', '2022-09-26 23:31:00', '2022-09-26 23:31:11', NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Emko\",\"contact_person_number\":\"+201020405060\",\"address_type\":\"home\",\"address\":\"Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt\",\"longitude\":\"31.352163814008232\",\"latitude\":\"30.179034130800368\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100018, 55, 900.00, 0.00, '', 'unpaid', 'pending', 80.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 6, '2022-09-26 23:36:25', '2022-09-26 23:36:38', 20.00, '2022-09-27 01:25:00', NULL, '6108', '2022-09-26 23:36:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"sayed ashrf\",\"contact_person_number\":\"+201093152235\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Qalg, Al Khankah, Egypt\",\"longitude\":\"31.35512832552195\",\"latitude\":\"30.181716782989994\"}', 1, 0.00, 20.00, NULL, 0.00, 0, 4),
(100019, 56, 1120.00, 0.00, '', 'unpaid', 'canceled', 100.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 6, '2022-09-26 23:56:34', '2022-09-26 23:59:23', 20.00, '2022-09-26 23:56:34', NULL, '2907', '2022-09-26 23:56:34', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-26 23:59:23', NULL, NULL, '{\"contact_person_name\":\"Ahmed Emko\",\"contact_person_number\":\"+201020405060\",\"address_type\":\"home\",\"address\":\"Atroos, Al Qalg, Al Khankah, Al Qalyubia Governorate, Egypt\",\"longitude\":\"31.352163814008232\",\"latitude\":\"30.179034130800368\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100020, 30, 900.00, 0.00, '', 'unpaid', 'canceled', 80.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 6, '2022-09-27 03:45:41', '2022-09-27 03:46:13', 20.00, '2022-09-27 03:45:41', NULL, '6426', '2022-09-27 03:45:41', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-27 03:45:59', NULL, NULL, '{\"contact_person_name\":\"George Wadia\",\"contact_person_number\":\"+201223157368\",\"address_type\":\"office\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Khankah, Egypt\",\"longitude\":\"31.35988119989634\",\"latitude\":\"30.172028052914847\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100021, 30, 1120.00, 0.00, '', 'paid', 'delivered', 100.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 6, '2022-09-27 03:46:55', '2022-09-27 03:54:25', 20.00, '2022-09-27 03:46:55', NULL, '2639', '2022-09-27 03:46:55', '2022-09-27 03:52:02', '2022-09-27 03:52:42', '2022-09-27 03:53:27', '2022-09-27 03:53:12', '2022-09-27 03:53:50', '2022-09-27 03:54:25', NULL, NULL, NULL, '{\"contact_person_name\":\"George Wadia\",\"contact_person_number\":\"+201223157368\",\"address_type\":\"office\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Khankah, Egypt\",\"longitude\":\"31.35988119989634\",\"latitude\":\"30.172028052914847\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100022, 30, 170.00, 0.00, '', 'paid', 'delivered', 0.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 7, '2022-09-27 03:55:44', '2022-09-27 03:57:57', 20.00, '2022-09-27 03:55:44', NULL, '9297', '2022-09-27 03:55:44', '2022-09-27 03:56:37', '2022-09-27 03:57:42', NULL, NULL, NULL, '2022-09-27 03:57:57', NULL, NULL, NULL, '{\"contact_person_name\":\"George Wadia\",\"contact_person_number\":\"+201223157368\",\"address_type\":\"office\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Khankah, Egypt\",\"longitude\":\"31.35988119989634\",\"latitude\":\"30.172028052914847\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100023, 56, 900.00, 0.00, '', 'unpaid', 'canceled', 80.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 6, '2022-09-27 04:19:02', '2022-09-27 04:22:13', 20.00, '2022-09-27 04:19:02', NULL, '5302', '2022-09-27 04:19:02', '2022-09-27 04:19:36', NULL, NULL, NULL, NULL, NULL, '2022-09-27 04:22:13', NULL, NULL, '{\"contact_person_name\":\"Ahmed Emko\",\"contact_person_number\":\"+201020405060\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Qalg, Al Khankah, Egypt\",\"longitude\":\"31.35512832552195\",\"latitude\":\"30.181716782989994\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100024, 56, 680.00, 0.00, '', 'paid', 'delivered', 60.00, 'cash_on_delivery', NULL, NULL, 2, NULL, NULL, 'delivery', 1, 6, '2022-09-27 04:23:16', '2022-09-28 02:41:59', 20.00, '2022-09-27 04:23:16', NULL, '5888', '2022-09-27 04:23:16', '2022-09-27 04:43:14', '2022-09-27 04:41:50', '2022-09-27 04:42:55', '2022-09-27 04:43:26', '2022-09-28 02:41:56', '2022-09-28 02:41:59', NULL, NULL, NULL, '{\"contact_person_name\":\"Ahmed Emko\",\"contact_person_number\":\"+201020405060\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Qalg, Al Khankah, Egypt\",\"longitude\":\"31.35512832552195\",\"latitude\":\"30.181716782989994\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100025, 55, 240.00, 0.00, '', 'unpaid', 'pending', 20.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 6, '2022-09-30 16:47:51', '2022-10-02 17:54:42', 20.00, '2022-10-01 23:55:00', NULL, '9229', '2022-09-30 16:47:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"sayed ashrf\",\"contact_person_number\":\"+201093152235\",\"address_type\":\"others\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Qalg, Al Khankah, Egypt\",\"longitude\":\"31.35512832552195\",\"latitude\":\"30.181716782989994\"}', 1, 0.00, 20.00, NULL, 0.00, 0, 4),
(100026, 30, 320.00, 0.00, '', 'unpaid', 'handover', 0.00, 'cash_on_delivery', NULL, NULL, 4, NULL, 'اضافة مكسرات', 'delivery', 1, 8, '2022-10-06 04:54:02', '2022-10-10 18:17:30', 20.00, '2022-10-06 04:54:02', NULL, '8709', '2022-10-06 04:54:02', '2022-10-06 04:54:41', '2022-10-06 04:58:28', '2022-10-10 18:17:26', '2022-10-10 18:17:30', NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"George Wadia\",\"contact_person_number\":\"+201223157368\",\"address_type\":\"office\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Khankah, Egypt\",\"longitude\":\"31.35988119989634\",\"latitude\":\"30.172028052914847\"}', 0, 0.00, 20.00, NULL, 0.00, 0, 4),
(100027, 30, 100.00, 0.00, '', 'unpaid', 'picked_up', 0.00, 'cash_on_delivery', NULL, NULL, 4, '1st Puff', NULL, 'delivery', 1, 8, '2022-10-10 18:11:49', '2022-10-10 18:14:18', 0.00, '2022-10-11 19:31:00', NULL, '3471', '2022-10-10 18:11:49', '2022-10-10 18:12:22', NULL, NULL, '2022-10-10 18:12:58', '2022-10-10 18:14:18', NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"George Wadia\",\"contact_person_number\":\"+201223157368\",\"address_type\":\"office\",\"address\":\"\\u0627\\u0644\\u0642\\u0644\\u062c\\u060c Al Khankah, Egypt\",\"longitude\":\"31.35988119989634\",\"latitude\":\"30.172028052914847\"}', 1, 0.00, 20.00, NULL, 0.00, 0, 4);

-- --------------------------------------------------------

--
-- بنية الجدول `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `food_details` text COLLATE utf8mb4_unicode_ci,
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci,
  `discount_on_food` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `tax_amount` decimal(24,2) NOT NULL DEFAULT '1.00',
  `variant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `order_details`
--

INSERT INTO `order_details` (`id`, `food_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(1, 9, 100001, 200.00, '{\"id\":9,\"name\":\"test 1\",\"description\":\"test 1\",\"image\":\"[\\\"2022-06-27-62b94592a9407.png\\\",\\\"2022-06-27-62b94592b43e2.png\\\"]\",\"category_id\":2,\"category_ids\":[{\"id\":\"2\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-06-27T05:55:43.000000Z\",\"updated_at\":\"2022-07-02T23:49:44.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-03 09:25:19', '2022-07-03 09:25:19', NULL, 0.00),
(2, 13, 100001, 150.00, '{\"id\":13,\"name\":\"SHOCK WATER\",\"description\":\"\\u0627\\u062d\\u0633\\u0646 \\u0644\\u064a\\u0643\\u0648\\u064a\\u062f \\u0641\\u0649 \\u0645\\u0635\\u0631\",\"image\":\"[\\\"2022-06-26-62b7ff002dfc6.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"4\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-03T00:23:36.000000Z\",\"updated_at\":\"2022-07-03T00:23:36.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-03 09:25:19', '2022-07-03 09:25:19', NULL, 0.00),
(3, 19, 100002, 500.00, '{\"id\":19,\"name\":\"test3\",\"description\":\"test3\",\"image\":\"[\\\"2022-07-06-62c4b6f50db1f.png\\\"]\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-05T22:11:17.000000Z\",\"updated_at\":\"2022-07-05T22:11:17.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-11 12:30:27', '2022-07-11 12:30:27', NULL, 0.00),
(4, 17, 100003, 300.00, '{\"id\":17,\"name\":\"SHOCK WATER\",\"description\":\"\\u0627\\u062d\\u0633\\u0646 \\u0644\\u064a\\u0643\\u0648\\u064a\\u062f \\u0641\\u0649 \\u0645\\u0635\\u0631\",\"image\":\"[\\\"2022-06-26-62b7ff002dfc6.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"4\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-05T22:06:29.000000Z\",\"updated_at\":\"2022-07-05T22:06:29.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-11 19:59:03', '2022-07-11 19:59:03', NULL, 0.00),
(5, 21, 100004, 120.00, '{\"id\":21,\"name\":\"man\",\"description\":null,\"image\":\"[\\\"2022-07-13-62ce13260d4aa.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"15\",\"position\":3}],\"variations\":[{\"type\":\"30ml\",\"price\":60},{\"type\":\"60ml\",\"price\":120},{\"type\":\"150ml\",\"price\":200}],\"add_ons\":[],\"attributes\":[\"7\"],\"choice_options\":[{\"name\":\"choice_7\",\"title\":\"SIZE\",\"options\":[\"30ml\",\"60ml\",\"150ml\"]}],\"price\":1,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-13T00:42:23.000000Z\",\"updated_at\":\"2022-07-13T00:43:50.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[{\"type\":\"60ml\",\"price\":120}]', '[]', 0.00, 'discount_on_product', 2, 0.00, 'null', '2022-07-13 09:52:54', '2022-07-13 09:52:54', NULL, 0.00),
(6, 17, 100005, 300.00, '{\"id\":17,\"name\":\"SHOCK WATER\",\"description\":\"\\u0627\\u062d\\u0633\\u0646 \\u0644\\u064a\\u0643\\u0648\\u064a\\u062f \\u0641\\u0649 \\u0645\\u0635\\u0631\",\"image\":\"[\\\"2022-06-26-62b7ff002dfc6.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"4\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-05T22:06:29.000000Z\",\"updated_at\":\"2022-07-05T22:06:29.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-13 10:16:47', '2022-07-13 10:16:47', NULL, 0.00),
(7, 21, 100006, 60.00, '{\"id\":21,\"name\":\"man\",\"description\":null,\"image\":\"[\\\"2022-07-13-62ce13260d4aa.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"15\",\"position\":3}],\"variations\":[{\"type\":\"30ml\",\"price\":60},{\"type\":\"60ml\",\"price\":120},{\"type\":\"150ml\",\"price\":200}],\"add_ons\":[],\"attributes\":[\"7\"],\"choice_options\":[{\"name\":\"choice_7\",\"title\":\"SIZE\",\"options\":[\"30ml\",\"60ml\",\"150ml\"]}],\"price\":1,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-13T00:42:23.000000Z\",\"updated_at\":\"2022-07-13T00:43:50.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[{\"type\":\"30ml\",\"price\":60}]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-13 11:58:41', '2022-07-13 11:58:41', NULL, 0.00),
(8, 21, 100007, 60.00, '{\"id\":21,\"name\":\"man\",\"description\":null,\"image\":\"[\\\"2022-07-13-62ce13260d4aa.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"3\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"15\",\"position\":3}],\"variations\":[{\"type\":\"30ml\",\"price\":60},{\"type\":\"60ml\",\"price\":120},{\"type\":\"150ml\",\"price\":200}],\"add_ons\":[],\"attributes\":[\"7\"],\"choice_options\":[{\"name\":\"choice_7\",\"title\":\"SIZE\",\"options\":[\"30ml\",\"60ml\",\"150ml\"]}],\"price\":1,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-13T00:42:23.000000Z\",\"updated_at\":\"2022-07-13T00:43:50.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[{\"type\":\"30ml\",\"price\":60}]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-13 11:58:45', '2022-07-13 11:58:45', NULL, 0.00),
(9, 16, 100008, 500.00, '{\"id\":16,\"name\":\"SHOCK WATER\",\"description\":\"\\u0627\\u062d\\u0633\\u0646 \\u0644\\u064a\\u0643\\u0648\\u064a\\u062f \\u0641\\u0649 \\u0645\\u0635\\u0631\",\"image\":\"[\\\"2022-06-26-62b7ff002dfc6.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"4\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-05T22:06:18.000000Z\",\"updated_at\":\"2022-07-05T22:06:18.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-15 22:45:03', '2022-07-15 22:45:03', NULL, 0.00),
(10, 24, 100009, 1.00, '{\"id\":24,\"name\":\"ABC\",\"description\":null,\"image\":\"[\\\"2022-07-15-62d14e74bc561.png\\\"]\",\"category_id\":5,\"category_ids\":[{\"id\":\"5\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":1,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-15T11:25:24.000000Z\",\"updated_at\":\"2022-07-15T11:25:24.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-15 23:16:08', '2022-07-15 23:16:08', NULL, 0.00),
(11, 22, 100009, 80.00, '{\"id\":22,\"name\":\"Shock\",\"description\":null,\"image\":\"[\\\"2022-07-13-62ce39f0087a3.png\\\",\\\"2022-07-13-62ce39f0089fe.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"4\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":80,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"amount\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-13T03:23:46.000000Z\",\"updated_at\":\"2022-07-13T03:23:46.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-15 23:16:08', '2022-07-15 23:16:08', NULL, 0.00),
(12, 24, 100010, 1.00, '{\"id\":24,\"name\":\"ABC\",\"description\":null,\"image\":\"[\\\"2022-07-15-62d14e74bc561.png\\\"]\",\"category_id\":5,\"category_ids\":[{\"id\":\"5\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":1,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-15T11:25:24.000000Z\",\"updated_at\":\"2022-07-15T11:25:24.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-18 15:52:23', '2022-07-18 15:52:23', NULL, 0.00),
(13, 16, 100010, 500.00, '{\"id\":16,\"name\":\"SHOCK WATER\",\"description\":\"\\u0627\\u062d\\u0633\\u0646 \\u0644\\u064a\\u0643\\u0648\\u064a\\u062f \\u0641\\u0649 \\u0645\\u0635\\u0631\",\"image\":\"[\\\"2022-06-26-62b7ff002dfc6.png\\\"]\",\"category_id\":4,\"category_ids\":[{\"id\":\"4\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-05T22:06:18.000000Z\",\"updated_at\":\"2022-07-05T22:06:18.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-07-18 15:52:23', '2022-07-18 15:52:23', NULL, 0.00),
(14, 33, 100011, 100.00, '{\"id\":33,\"name\":\"\\u0645\\u0646\\u062a\\u062c \\u062b\\u0627\\u0628\\u062a 6\",\"description\":null,\"image\":\"[\\\"2022-07-23-62dbf7454f9b9.png\\\"]\",\"category_id\":9,\"category_ids\":[{\"id\":\"9\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":3,\"created_at\":\"2022-07-27T21:08:03.000000Z\",\"updated_at\":\"2022-07-27T21:08:03.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":null,\"restaurant_name\":\"JOXS\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-08-01 22:50:12', '2022-08-01 22:50:12', NULL, 0.00),
(15, 40, 100012, 300.00, '{\"id\":40,\"name\":\"\\u0645\\u0646\\u062a\\u062c \\u062b\\u0627\\u0628\\u062a 1\",\"description\":\"\\u0648\\u0635\\u0641\",\"image\":\"[\\\"2022-07-23-62dbf6d7cd4dd.png\\\"]\",\"category_id\":2,\"category_ids\":[{\"id\":\"2\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2022-08-07T08:21:39.000000Z\",\"updated_at\":\"2022-08-07T08:21:39.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":2,\"restaurant_name\":\"\\u0627\\u0645\\u0627\\u0645\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":false}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-08-07 17:27:37', '2022-08-07 17:27:37', NULL, 0.00),
(16, 40, 100013, 300.00, '{\"id\":40,\"name\":\"\\u0645\\u0646\\u062a\\u062c \\u062b\\u0627\\u0628\\u062a 1\",\"description\":\"\\u0648\\u0635\\u0641\",\"image\":\"[\\\"2022-07-23-62dbf6d7cd4dd.png\\\"]\",\"category_id\":2,\"category_ids\":[{\"id\":\"2\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2022-08-07T08:21:39.000000Z\",\"updated_at\":\"2022-08-07T08:55:44.000000Z\",\"order_count\":\"1\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":2,\"restaurant_name\":\"\\u0627\\u0645\\u0627\\u0645\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-08-08 06:35:51', '2022-08-08 06:35:51', NULL, 0.00),
(17, 40, 100013, 300.00, '{\"id\":40,\"name\":\"\\u0645\\u0646\\u062a\\u062c \\u062b\\u0627\\u0628\\u062a 1\",\"description\":\"\\u0648\\u0635\\u0641\",\"image\":\"[\\\"2022-07-23-62dbf6d7cd4dd.png\\\"]\",\"category_id\":2,\"category_ids\":[{\"id\":\"2\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2022-08-07T08:21:39.000000Z\",\"updated_at\":\"2022-08-07T08:55:44.000000Z\",\"order_count\":\"1\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":2,\"restaurant_name\":\"\\u0627\\u0645\\u0627\\u0645\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-08-08 06:35:51', '2022-08-08 06:35:51', NULL, 0.00),
(18, 40, 100014, 300.00, '{\"id\":40,\"name\":\"\\u0645\\u0646\\u062a\\u062c \\u062b\\u0627\\u0628\\u062a 1\",\"description\":\"\\u0648\\u0635\\u0641\",\"image\":\"[\\\"2022-07-23-62dbf6d7cd4dd.png\\\"]\",\"category_id\":2,\"category_ids\":[{\"id\":\"2\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2022-08-07T08:21:39.000000Z\",\"updated_at\":\"2022-08-08T08:47:08.000000Z\",\"order_count\":\"5\",\"avg_rating\":5,\"rating_count\":1,\"brand_id\":2,\"restaurant_name\":\"\\u0627\\u0645\\u0627\\u0645\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-08-08 17:47:57', '2022-08-08 17:47:57', NULL, 0.00),
(19, 40, 100015, 300.00, '{\"id\":40,\"name\":\"\\u0645\\u0646\\u062a\\u062c \\u062b\\u0627\\u0628\\u062a 1\",\"description\":\"\\u0648\\u0635\\u0641\",\"image\":\"[\\\"2022-07-23-62dbf6d7cd4dd.png\\\"]\",\"category_id\":2,\"category_ids\":[{\"id\":\"2\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2022-08-07T08:21:39.000000Z\",\"updated_at\":\"2022-08-08T08:47:08.000000Z\",\"order_count\":\"5\",\"avg_rating\":5,\"rating_count\":1,\"brand_id\":2,\"restaurant_name\":\"\\u0627\\u0645\\u0627\\u0645\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 3, 0.00, 'null', '2022-08-08 17:57:37', '2022-08-08 17:57:37', NULL, 0.00),
(20, 40, 100016, 300.00, '{\"id\":40,\"name\":\"\\u0645\\u0646\\u062a\\u062c \\u062b\\u0627\\u0628\\u062a 1\",\"description\":\"\\u0648\\u0635\\u0641\",\"image\":\"[\\\"2022-07-23-62dbf6d7cd4dd.png\\\"]\",\"category_id\":2,\"category_ids\":[{\"id\":\"2\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2022-08-07T08:21:39.000000Z\",\"updated_at\":\"2022-08-08T09:46:34.000000Z\",\"order_count\":\"7\",\"avg_rating\":5,\"rating_count\":1,\"brand_id\":2,\"restaurant_name\":\"\\u0627\\u0645\\u0627\\u0645\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 3, 0.00, 'null', '2022-08-09 06:39:28', '2022-08-09 06:39:28', NULL, 0.00),
(21, 43, 100017, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-23T13:18:08.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 2, 20.00, 'null', '2022-09-26 23:26:15', '2022-09-26 23:26:15', NULL, 0.00),
(22, 43, 100018, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-26T14:31:11.000000Z\",\"order_count\":\"1\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 4, 20.00, 'null', '2022-09-26 23:36:25', '2022-09-26 23:36:25', NULL, 0.00),
(23, 43, 100019, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-26T14:31:11.000000Z\",\"order_count\":\"1\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 5, 20.00, 'null', '2022-09-26 23:56:34', '2022-09-26 23:56:34', NULL, 0.00),
(24, 43, 100020, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-26T14:57:49.000000Z\",\"order_count\":\"1\",\"avg_rating\":5,\"rating_count\":1,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 4, 20.00, 'null', '2022-09-27 03:45:41', '2022-09-27 03:45:41', NULL, 0.00),
(25, 43, 100021, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-26T14:57:49.000000Z\",\"order_count\":\"1\",\"avg_rating\":5,\"rating_count\":1,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 5, 20.00, 'null', '2022-09-27 03:46:55', '2022-09-27 03:46:55', NULL, 0.00),
(26, 44, 100022, 150.00, '{\"id\":44,\"name\":\"emam pro 1\",\"description\":\"emam pro 1\",\"image\":\"[\\\"2022-09-23-632db1ab76037.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":7,\"created_at\":\"2022-09-23T13:18:41.000000Z\",\"updated_at\":\"2022-09-23T13:18:41.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":1,\"restaurant_name\":\"emam\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-09-27 03:55:44', '2022-09-27 03:55:44', NULL, 0.00),
(27, 43, 100023, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-26T18:54:58.000000Z\",\"order_count\":\"2\",\"avg_rating\":5,\"rating_count\":2,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 4, 20.00, 'null', '2022-09-27 04:19:02', '2022-09-27 04:19:02', NULL, 0.00),
(28, 43, 100024, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-26T18:54:58.000000Z\",\"order_count\":\"2\",\"avg_rating\":5,\"rating_count\":2,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 3, 20.00, 'null', '2022-09-27 04:23:16', '2022-09-27 04:23:16', NULL, 0.00),
(29, 43, 100025, 200.00, '{\"id\":43,\"name\":\"emam pro 2\",\"description\":\"emam pro 2\",\"image\":\"[\\\"2022-09-23-632db1d1dbea5.png\\\"]\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":6,\"created_at\":\"2022-09-23T13:18:08.000000Z\",\"updated_at\":\"2022-09-27T17:41:59.000000Z\",\"order_count\":\"3\",\"avg_rating\":5,\"rating_count\":2,\"brand_id\":1,\"restaurant_name\":\"emam2\",\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"23:00\",\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 1, 20.00, 'null', '2022-09-30 16:47:51', '2022-09-30 16:47:51', NULL, 0.00),
(30, 46, 100026, 100.00, '{\"id\":46,\"name\":\"AAAA\",\"description\":\"AAA Test Jox\",\"image\":\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPkAAADLCAMAAACbI8UEAAAAw1BMVEX\\/\\/\\/\\/\\/yjgcOo7\\/xyf\\/yTP\\/673\\/1GT\\/0VcAK4r5+vwAIoYHMIq9w9kYOI2Gkbzj5u\\/\\/\\/voALIkoRJQAJod3hLWWoMUcPZGiqsoQM4v\\/xyLM0OBjdKzV2egAKIj\\/6LRfb6n\\/7sepsc7\\/5qz\\/4pz\\/zEBUZqT\\/8c\\/\\/3Ib\\/+Ob\\/+u5vfbAAAH7\\/2n0AHYT\\/7MA7UZn\\/9d7\\/1m3\\/0l3\\/zky1vNVDWJ3\\/2n\\/\\/3o3t7\\/WBjboxSZVPYqPa3usAD4L\\/xAiQmsEAFIIOoL6cAAAMFElEQVR4nO2dW3uiOhSGqTCtQhlUtOCp1rb2oKVuOzpDrR3n\\/\\/+qDSICOZBwCAYev4te1Gh4ScgKyVorgpBFzaeH5+XlVeG6XD7fPzUzXXom7Nul2BOlE0ns9T5uTwLffJBE6eKkci7goXj2uwvxtNieROm2YPDn3onb+6jesshmb35w0eCepMeX4sCveGnwvSSpMPQPrsAd9IvXYsDfOOrqnqRfhYDf9k4NCkt8LgD8hUNwZ4R\\/Yk9+ydlD7qmA\\/n7HZZM7\\/f2eNfkFl03uSGQ8oXngblz3Jf5mCv7KLbgzyP3HkvyN177uSPpgCP4fp8Obp94PduR8zddBSY\\/MBjkeZ29hiQ+MwJtct7irHqOXNn4tmi9pyQT8lfO+7orN9H3JfWdnNH1\\/KkGTs5m+\\/ypBkzuScrds99wPb55yX6Pg36L5ynv6\\/qckTZ779J3vCXtUvfc8yflcgsIpR3Bel6DQynP6\\/liqJr\\/o5bbxwP+EParcpu88L0Ghldf0\\/Xe5+roj6SoX8DJZNF+9XPwJ+F6CwiiP6fuPEjZ5LtP35qkZUir79L1sFs2XdJkRvHwWzVfW6XsZlqDQkh4zgZdjCQqtbNP3x55YXv3NsPr+evujzCrAg+Sss84666yzzqqIGo6qUQm17OvubL1p35hmrb1Zz7orjUEljb7R+dq0Va+SwY5JJa5ebgPFFhzu2vpIMVVHtZr711RG+k2njygJabvVbKoWtI31SG+5tdQOlbRGutq5xn\\/j9S4QTQ2BPkKvKjHFVgtLca8GkKrI7RVQtPGtQ5Jl2bJq65nRt2Mq6X9ZLROuRVV01cDduPe\\/wYvLXRLw9\\/DbKbbUsK0jsA\\/XNWpH271Rx5Tdt6C8+InoJq60qWxiK2kp4A32AYIVlUQv6s3IdhKuVFfGcu8vS\\/5JRe63oNxGteBEx3J7lQxI5Ile1KOLb5hCM3yDHzQa05O7FHVzAlZiWKRvKQtUjw+TX4jU+2yA\\/xe6UGdEuCRH9VkScoddn0YxVha5EmVNIpfeaMmBxTdkmZVMvqZaTQ4akYbcwdiE0bX45+mg1ieBnHqfDVx8Q5VpIAZbhFTlCEJHHm3BaewzfpS1JZDTusmB\\/l+oMkYdpjQRd6NlJCSv1YNxcYjo66hKzDF0fT+iq+V0bnKQ\\/xeq0BqsX7HU6XRttcDbsUlKXrOOs7NPBUSUla\\/pwoJ+yYIGOYCcKsoF3ltAFNLAp7zV8eYiO3Dck30OiNxUFAU1QzGPdgqcJJlf3o+tRsAHI8iqQ+QUUS7wbjmi0DUAGPS3GfBojvwpJkhujo1ut9tZQPZarR8mdDbQ2dW2X8kEeNaUyMwBRU6xz4bYLUeUMoBerR8nYFs9+snxQQfJla73\\/+Ea7NN+Cw5xP+WMr9FP4AcdIie7ySF2yxGldsDVhh40oKGOzYEjF4QF0HeVjvf\\/PtCxgtsrfEW\\/okImHSInRrmgAjYQxX5GydV68BHQHD5GDDnYtj4H+EjJwYvpIFpL8BzgyQnOBE3U1mky8jYASCYXNkAL3jRI5J0U5OKfOHKkeytzcsB6qSObSA58g4Y8NsoF7QzEnBwcL2U25HHOBGj3VubkK8BIHRDzJr\\/o3eHA39G75czJwUGcFTl+jQLj3sqeHBjcWZFj1yhwzkDVIcf4AuPi0aQKkaN9gXHOQKgZAPfk75j+i1qjwDoDVYoctUaBjUerFDlijQIfj1Yt8gsJGORe8R5\\/FSMHfYF\\/4708K0YOrFHEee+Xkhxj1fY8kYCHuHDbqpFH1ihiE0hUjjxEFB9um5g8Ilbk0VqSkQdrFPHhtonJb8Iy2ZCbkUqCVX0q8uMaBSHjW0JynHIlJyqe3J++P8d771eQ\\/GDZSAEbVSSX9tMZUh6FKpJ7zgSk1BnVJL+lyGh5AnLi2mtmcneMI5U5AbnOnvxCdIw5KS6rcHK1RtxjyU7ujO7EFBLsyQFEdYH8d85tfif8IhQpgHwc3SXzp31sye+Fx5OTfwJbLPVJEeQPxZG3APJdw7bt7epnG9hVU0daMeS59fbr8QChMc5nombW63VdHkEew+aXUAw5MRk7LflENhGq+256sG\\/U3jEclu571rAlvyW9ryQgh13kHCl4crSCN062Vu2JnP6sYHJrmAf5LZH8lRxoXSy5jDXzuZLvN5S5anM95L3LlNxdkCLlai6QXLXCLn0syfc7i6REYIWRq\\/VaJCaHIfnBe4KQCawYctXUwWgOhuQH5wnC6M6KXD3afKU1sm5mUAwWS3JvW5GQ3ZKW3PiWXdGSq4upp8Hs07hGQbEjl\\/xdxfhsObTktubKBp1YceQtKFonAXl3HBUUwBRPHrjL5NLmBwEe63hyA\\/5ZavJOPTJFVm4SkYf8QPPcV1MLISftq8WTh4jiMqFVjjziMJLj\\/jn35IAnZMxErmrkgPdrzBZTQvIa5+SQMyDesiUkv6H0HDgVOezljp3DVoscEdmAcfHOTM5Zb0eF7OEW5CrV5sh0qDjLViVyTGjuM6Z0hcgx4dgYy1Yhcmyqa\\/SLOiN\\/uFOQi9i4LaT7RHXIY1JtIJfkqkN+EROfidpMrwx5bEwuymmmKuSEZBMIR9CqkBNi7xGrkTTkevBRMVaNFIsMkxOTysALUyhyKPI++GjEbN4eirwH\\/Etgj1+YnJxICLJsKHIo28Ixo4sNLDsru9TkoLNYaLUWiFg\\/OhvgySmSR0F7qyhyMHr4yAfdE9\\/pJQX5FriJ5vT4CXBPzBn4XXBSRpUwDIxVRJGDF3XsiVswjdaxiyYnB1NW1EaHHWYbaHLEb4HkVNncwfhUZH4GYBxzc111VytjADRGTTX9vbIU5FDypNFiN1kZM2iHTobSJwHklBn8gYUpJDmU3qdmKq16C8rzFPTDFOQrKB2ZqtTrcPYdFdpoAMlpT22QyORbqixeTmscfT9SkIP7NTiN4I2qKDn1SR3Rg0jQ2Ug6UKOjpARDTxryCVUqNtimQeTUp7NEtlwweVjaFBnMfN\\/dtOTCAMzAhaoEfsoB8gQHakYWpjDktklEN5XQvm8q8gaUWgkBjkp+GiZPdIhqeMsFl3tH2xAaRGmHN7xTkTvjOyHpollH5gwNk+NTiiAUXpjCZh1qfFoxzW5as4jzR0pyoRtXiSpP0ZliQ+QJT1t7CGW6xQ8P2y8ZlejWtT7yehgt27BaEVmU5II2wFRSM\\/UNLs3vfXD9jA7IHnZUPWpg3cS1eu1zCJZs7LoR7TCZbRHSdhu3kkgtTiXKmP4nmKhvDDa6PPKky\\/XFwBjmnm9bmww2dVk\\/1CLL7XG3z0VS78a2f73XkC5FdbpKtEMl\\/W1cGuizzjrrrLPOOussT\\/cfl+XVVZaT5ZqiVFqJ2Q5HJsZ08ausZ8WScjFwK4kib3msSPE93Ir+QA6ciJH5fCrbaal7vfw9NUQaSfiTg+gVn1WKU2U9FXkvQmgTl8p8EranElq27KefeyqdZcvhxHtPpbNs2S2ar5Kdgp5gH40kYm4prpTxzPeoSmXZEu2jkYQ8s4NT5WTRfJXIsuW9j1YayxZ\\/7EoKlcayxR+1k0YlsWw5WjRf5bBsiTxDaIUJbeJLtGdFJlIZLFtCzxBalcCyMfIMISWeOb1yt2i+uLds+Vs0X5xbNmS4bT6KS0dxeknZNlXixfU7G5VFs7daKvcini0bhUVr7Grz+dz6wvkPxoljy4Y+QSysa2vUHdpafzCfpvBd49aykTdVVnM\\/dm7baidH59eykSya9j0ThovFYj3rC5oM5dgii9N9NtIRuIIwkAWhP5+sVoO5JkzmiHAAgvi0bOQlKPvfThCGc7eXjwyhAR8iTdYDh+gSeHYYrOt5\\/0Cu\\/ZsIwnSRnFxY8je+U5jy1bfmkFuD2dhyI34+lRTkTe7W5MgPuUvuPNnDf4bxvY\\/x6qgpyIXmFV+tTgPudPRrr7d\\/7o\\/aXk9JX0BrydGzLolU6zANN3ZuOLeFhjPACTZ1MAmo+x4vPb53Sbl9uHOMWd8hd8Y6Tfj8Th0c8LLkgV0SJZqe7qndbthd16oZ\\/et5l1gcr6dlTzwtvNR7vE+wFqEp7UNckXGcx6bUy8OvnngqL0mxJ73dJbteezxfd1eTT+U77UMe0uvd\\/fPy46poXb79uU3jELLdrW9uxpP968r\\/35KsDo+mqhoAAAAASUVORK5CYII=\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":0},{\"id\":\"0\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":8,\"created_at\":\"2022-10-05T08:36:18.000000Z\",\"updated_at\":\"2022-10-05T08:36:18.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":1,\"restaurant_name\":\"GS1\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 3, 0.00, 'null', '2022-10-06 04:54:02', '2022-10-06 04:54:02', NULL, 0.00),
(31, 46, 100027, 100.00, '{\"id\":46,\"name\":\"AAAA\",\"description\":\"AAA Test Jox\",\"image\":\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPkAAADLCAMAAACbI8UEAAAAw1BMVEX\\/\\/\\/\\/\\/yjgcOo7\\/xyf\\/yTP\\/673\\/1GT\\/0VcAK4r5+vwAIoYHMIq9w9kYOI2Gkbzj5u\\/\\/\\/voALIkoRJQAJod3hLWWoMUcPZGiqsoQM4v\\/xyLM0OBjdKzV2egAKIj\\/6LRfb6n\\/7sepsc7\\/5qz\\/4pz\\/zEBUZqT\\/8c\\/\\/3Ib\\/+Ob\\/+u5vfbAAAH7\\/2n0AHYT\\/7MA7UZn\\/9d7\\/1m3\\/0l3\\/zky1vNVDWJ3\\/2n\\/\\/3o3t7\\/WBjboxSZVPYqPa3usAD4L\\/xAiQmsEAFIIOoL6cAAAMFElEQVR4nO2dW3uiOhSGqTCtQhlUtOCp1rb2oKVuOzpDrR3n\\/\\/+qDSICOZBwCAYev4te1Gh4ScgKyVorgpBFzaeH5+XlVeG6XD7fPzUzXXom7Nul2BOlE0ns9T5uTwLffJBE6eKkci7goXj2uwvxtNieROm2YPDn3onb+6jesshmb35w0eCepMeX4sCveGnwvSSpMPQPrsAd9IvXYsDfOOrqnqRfhYDf9k4NCkt8LgD8hUNwZ4R\\/Yk9+ydlD7qmA\\/n7HZZM7\\/f2eNfkFl03uSGQ8oXngblz3Jf5mCv7KLbgzyP3HkvyN177uSPpgCP4fp8Obp94PduR8zddBSY\\/MBjkeZ29hiQ+MwJtct7irHqOXNn4tmi9pyQT8lfO+7orN9H3JfWdnNH1\\/KkGTs5m+\\/ypBkzuScrds99wPb55yX6Pg36L5ynv6\\/qckTZ779J3vCXtUvfc8yflcgsIpR3Bel6DQynP6\\/liqJr\\/o5bbxwP+EParcpu88L0Ghldf0\\/Xe5+roj6SoX8DJZNF+9XPwJ+F6CwiiP6fuPEjZ5LtP35qkZUir79L1sFs2XdJkRvHwWzVfW6XsZlqDQkh4zgZdjCQqtbNP3x55YXv3NsPr+evujzCrAg+Sss84666yzzqqIGo6qUQm17OvubL1p35hmrb1Zz7orjUEljb7R+dq0Va+SwY5JJa5ebgPFFhzu2vpIMVVHtZr711RG+k2njygJabvVbKoWtI31SG+5tdQOlbRGutq5xn\\/j9S4QTQ2BPkKvKjHFVgtLca8GkKrI7RVQtPGtQ5Jl2bJq65nRt2Mq6X9ZLROuRVV01cDduPe\\/wYvLXRLw9\\/DbKbbUsK0jsA\\/XNWpH271Rx5Tdt6C8+InoJq60qWxiK2kp4A32AYIVlUQv6s3IdhKuVFfGcu8vS\\/5JRe63oNxGteBEx3J7lQxI5Ile1KOLb5hCM3yDHzQa05O7FHVzAlZiWKRvKQtUjw+TX4jU+2yA\\/xe6UGdEuCRH9VkScoddn0YxVha5EmVNIpfeaMmBxTdkmZVMvqZaTQ4akYbcwdiE0bX45+mg1ieBnHqfDVx8Q5VpIAZbhFTlCEJHHm3BaewzfpS1JZDTusmB\\/l+oMkYdpjQRd6NlJCSv1YNxcYjo66hKzDF0fT+iq+V0bnKQ\\/xeq0BqsX7HU6XRttcDbsUlKXrOOs7NPBUSUla\\/pwoJ+yYIGOYCcKsoF3ltAFNLAp7zV8eYiO3Dck30OiNxUFAU1QzGPdgqcJJlf3o+tRsAHI8iqQ+QUUS7wbjmi0DUAGPS3GfBojvwpJkhujo1ut9tZQPZarR8mdDbQ2dW2X8kEeNaUyMwBRU6xz4bYLUeUMoBerR8nYFs9+snxQQfJla73\\/+Ea7NN+Cw5xP+WMr9FP4AcdIie7ySF2yxGldsDVhh40oKGOzYEjF4QF0HeVjvf\\/PtCxgtsrfEW\\/okImHSInRrmgAjYQxX5GydV68BHQHD5GDDnYtj4H+EjJwYvpIFpL8BzgyQnOBE3U1mky8jYASCYXNkAL3jRI5J0U5OKfOHKkeytzcsB6qSObSA58g4Y8NsoF7QzEnBwcL2U25HHOBGj3VubkK8BIHRDzJr\\/o3eHA39G75czJwUGcFTl+jQLj3sqeHBjcWZFj1yhwzkDVIcf4AuPi0aQKkaN9gXHOQKgZAPfk75j+i1qjwDoDVYoctUaBjUerFDlijQIfj1Yt8gsJGORe8R5\\/FSMHfYF\\/4708K0YOrFHEee+Xkhxj1fY8kYCHuHDbqpFH1ihiE0hUjjxEFB9um5g8Ilbk0VqSkQdrFPHhtonJb8Iy2ZCbkUqCVX0q8uMaBSHjW0JynHIlJyqe3J++P8d771eQ\\/GDZSAEbVSSX9tMZUh6FKpJ7zgSk1BnVJL+lyGh5AnLi2mtmcneMI5U5AbnOnvxCdIw5KS6rcHK1RtxjyU7ujO7EFBLsyQFEdYH8d85tfif8IhQpgHwc3SXzp31sye+Fx5OTfwJbLPVJEeQPxZG3APJdw7bt7epnG9hVU0daMeS59fbr8QChMc5nombW63VdHkEew+aXUAw5MRk7LflENhGq+256sG\\/U3jEclu571rAlvyW9ryQgh13kHCl4crSCN062Vu2JnP6sYHJrmAf5LZH8lRxoXSy5jDXzuZLvN5S5anM95L3LlNxdkCLlai6QXLXCLn0syfc7i6REYIWRq\\/VaJCaHIfnBe4KQCawYctXUwWgOhuQH5wnC6M6KXD3afKU1sm5mUAwWS3JvW5GQ3ZKW3PiWXdGSq4upp8Hs07hGQbEjl\\/xdxfhsObTktubKBp1YceQtKFonAXl3HBUUwBRPHrjL5NLmBwEe63hyA\\/5ZavJOPTJFVm4SkYf8QPPcV1MLISftq8WTh4jiMqFVjjziMJLj\\/jn35IAnZMxErmrkgPdrzBZTQvIa5+SQMyDesiUkv6H0HDgVOezljp3DVoscEdmAcfHOTM5Zb0eF7OEW5CrV5sh0qDjLViVyTGjuM6Z0hcgx4dgYy1Yhcmyqa\\/SLOiN\\/uFOQi9i4LaT7RHXIY1JtIJfkqkN+EROfidpMrwx5bEwuymmmKuSEZBMIR9CqkBNi7xGrkTTkevBRMVaNFIsMkxOTysALUyhyKPI++GjEbN4eirwH\\/Etgj1+YnJxICLJsKHIo28Ixo4sNLDsru9TkoLNYaLUWiFg\\/OhvgySmSR0F7qyhyMHr4yAfdE9\\/pJQX5FriJ5vT4CXBPzBn4XXBSRpUwDIxVRJGDF3XsiVswjdaxiyYnB1NW1EaHHWYbaHLEb4HkVNncwfhUZH4GYBxzc111VytjADRGTTX9vbIU5FDypNFiN1kZM2iHTobSJwHklBn8gYUpJDmU3qdmKq16C8rzFPTDFOQrKB2ZqtTrcPYdFdpoAMlpT22QyORbqixeTmscfT9SkIP7NTiN4I2qKDn1SR3Rg0jQ2Ug6UKOjpARDTxryCVUqNtimQeTUp7NEtlwweVjaFBnMfN\\/dtOTCAMzAhaoEfsoB8gQHakYWpjDktklEN5XQvm8q8gaUWgkBjkp+GiZPdIhqeMsFl3tH2xAaRGmHN7xTkTvjOyHpollH5gwNk+NTiiAUXpjCZh1qfFoxzW5as4jzR0pyoRtXiSpP0ZliQ+QJT1t7CGW6xQ8P2y8ZlejWtT7yehgt27BaEVmU5II2wFRSM\\/UNLs3vfXD9jA7IHnZUPWpg3cS1eu1zCJZs7LoR7TCZbRHSdhu3kkgtTiXKmP4nmKhvDDa6PPKky\\/XFwBjmnm9bmww2dVk\\/1CLL7XG3z0VS78a2f73XkC5FdbpKtEMl\\/W1cGuizzjrrrLPOOussT\\/cfl+XVVZaT5ZqiVFqJ2Q5HJsZ08ausZ8WScjFwK4kib3msSPE93Ir+QA6ciJH5fCrbaal7vfw9NUQaSfiTg+gVn1WKU2U9FXkvQmgTl8p8EranElq27KefeyqdZcvhxHtPpbNs2S2ar5Kdgp5gH40kYm4prpTxzPeoSmXZEu2jkYQ8s4NT5WTRfJXIsuW9j1YayxZ\\/7EoKlcayxR+1k0YlsWw5WjRf5bBsiTxDaIUJbeJLtGdFJlIZLFtCzxBalcCyMfIMISWeOb1yt2i+uLds+Vs0X5xbNmS4bT6KS0dxeknZNlXixfU7G5VFs7daKvcini0bhUVr7Grz+dz6wvkPxoljy4Y+QSysa2vUHdpafzCfpvBd49aykTdVVnM\\/dm7baidH59eykSya9j0ThovFYj3rC5oM5dgii9N9NtIRuIIwkAWhP5+sVoO5JkzmiHAAgvi0bOQlKPvfThCGc7eXjwyhAR8iTdYDh+gSeHYYrOt5\\/0Cu\\/ZsIwnSRnFxY8je+U5jy1bfmkFuD2dhyI34+lRTkTe7W5MgPuUvuPNnDf4bxvY\\/x6qgpyIXmFV+tTgPudPRrr7d\\/7o\\/aXk9JX0BrydGzLolU6zANN3ZuOLeFhjPACTZ1MAmo+x4vPb53Sbl9uHOMWd8hd8Y6Tfj8Th0c8LLkgV0SJZqe7qndbthd16oZ\\/et5l1gcr6dlTzwtvNR7vE+wFqEp7UNckXGcx6bUy8OvnngqL0mxJ73dJbteezxfd1eTT+U77UMe0uvd\\/fPy46poXb79uU3jELLdrW9uxpP968r\\/35KsDo+mqhoAAAAASUVORK5CYII=\",\"category_id\":3,\"category_ids\":[{\"id\":\"3\",\"position\":0},{\"id\":\"0\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":null,\"available_time_ends\":null,\"veg\":0,\"status\":1,\"restaurant_id\":8,\"created_at\":\"2022-10-05T08:36:18.000000Z\",\"updated_at\":\"2022-10-05T08:36:18.000000Z\",\"order_count\":\"0\",\"avg_rating\":0,\"rating_count\":0,\"brand_id\":1,\"restaurant_name\":\"GS1\",\"restaurant_discount\":0,\"restaurant_opening_time\":null,\"restaurant_closing_time\":null,\"schedule_order\":true}', '[]', '[]', 0.00, 'discount_on_product', 1, 0.00, 'null', '2022-10-10 18:11:49', '2022-10-10 18:11:49', NULL, 0.00);

-- --------------------------------------------------------

--
-- بنية الجدول `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `restaurant_amount` decimal(24,2) NOT NULL,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `order_transactions`
--

INSERT INTO `order_transactions` (`id`, `vendor_id`, `delivery_man_id`, `order_id`, `order_amount`, `restaurant_amount`, `admin_commission`, `received_by`, `status`, `created_at`, `updated_at`, `delivery_charge`, `original_delivery_charge`, `tax`, `zone_id`) VALUES
(1, 7, 2, 100012, 320.00, 300.00, 0.00, 'deliveryman', NULL, '2022-08-07 17:55:44', '2022-08-07 17:55:44', 20.00, 20.00, 0.00, 4),
(2, 7, 2, 100013, 620.00, 600.00, 0.00, 'deliveryman', NULL, '2022-08-08 06:40:26', '2022-08-08 06:40:26', 20.00, 20.00, 0.00, 4),
(3, 7, 3, 100014, 320.00, 300.00, 0.00, 'deliveryman', NULL, '2022-08-08 17:57:51', '2022-08-08 17:57:51', 20.00, 20.00, 0.00, 4),
(4, 7, 2, 100015, 920.00, 900.00, 0.00, 'deliveryman', NULL, '2022-08-08 18:46:34', '2022-08-08 18:46:34', 20.00, 20.00, 0.00, 4),
(5, 6, 2, 100017, 460.00, 440.00, 0.00, 'deliveryman', NULL, '2022-09-26 23:31:11', '2022-09-26 23:31:11', 20.00, 20.00, 40.00, 4),
(6, 6, 2, 100021, 1120.00, 1100.00, 0.00, 'deliveryman', NULL, '2022-09-27 03:54:25', '2022-09-27 03:54:25', 20.00, 20.00, 100.00, 4),
(7, 7, 2, 100022, 170.00, 150.00, 0.00, 'deliveryman', NULL, '2022-09-27 03:57:57', '2022-09-27 03:57:57', 20.00, 20.00, 0.00, 4),
(8, 6, 2, 100024, 680.00, 660.00, 0.00, 'deliveryman', NULL, '2022-09-28 02:41:59', '2022-09-28 02:41:59', 20.00, 20.00, 60.00, 4);

-- --------------------------------------------------------

--
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('target.adv.event@gmail.com', '9402', '2022-07-13 02:51:01'),
('a7a@a7a.com', '2652', '2022-07-17 01:19:01'),
('a7a@a7a.com', '7595', '2022-07-17 01:19:07'),
('a7a@a7a.com', '1589', '2022-07-17 01:20:28'),
('a7a@a7a.com', '5581', '2022-07-17 01:22:24'),
('a7a@a7a.com', '8382', '2022-07-17 01:22:35'),
('target.adv.event@gmail.com', '8729', '2022-07-17 01:24:48'),
('target.adv.event@gmail.com', '5541', '2022-07-17 01:24:55'),
('a7a@a7a.com', '5845', '2022-07-17 01:26:58'),
('a7a@a7a.com', '1427', '2022-07-17 01:43:19'),
('eng.ibrahem010673@gmail.com', '7807', '2022-07-31 21:36:45'),
('eng.ibrahem010673@gmail.com', '9526', '2022-07-31 21:37:03'),
('eng.ibrahem010673@gmail.com', '4058', '2022-07-31 21:37:09'),
('eng.ibrahem0sarrrrrrrrrrrrrrrdfasd10673@gmail.com', '8588', '2022-08-01 01:30:09'),
('eng.ibrahem0sarrrrrrrrrrrrrrrdfasd10673@gmail.com', '9348', '2022-08-01 01:32:00'),
('eng.ibrahem0sarrrrrrrrrrrrrrrdfasd10673@gmail.com', '7637', '2022-08-01 01:32:08'),
('a7a@a7a.com', '8205', '2022-09-15 19:08:45');

-- --------------------------------------------------------

--
-- بنية الجدول `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT '0.00',
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT '0',
  `opening_time` time DEFAULT '10:00:00',
  `closeing_time` time DEFAULT '23:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `take_away` tinyint(1) NOT NULL DEFAULT '1',
  `food_section` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT '0',
  `pos_system` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `delivery_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT '1',
  `non_veg` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_order` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `opening_time`, `closeing_time`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `food_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `delivery_charge`, `delivery_time`, `veg`, `non_veg`, `order_count`, `total_order`) VALUES
(1, 'REPUFF', '01096816074', 'ahmed.ziate@gmail.com', '2022-06-01-6296d26eba67b.png', '30.225689530633037', '31.48713984651617', 'عين شمس', NULL, 100.00, 15.00, 1, NULL, NULL, 1, 1, '2022-06-01 09:43:58', '2022-06-26 21:33:24', 0, NULL, '2022-06-01-6296d26ebb443.png', 1, 0, 1, 0.00, 1, 1, 1, '', '{\"status\":\"1\",\"code\":\"20\"}', 0, 0, 0.00, '30-60', 1, 1, 0, 0),
(2, 'VSpot', '01111111111', 'Masry@gmail.com', '2022-06-20-62b0cac13e057.png', '30.14395157713056', '31.344653167727728', '26 a, أنور المفتي، المنطقة الأولى، مدينة نصر، محافظة القاهرة‬ 4450233', NULL, 0.00, NULL, 0, '10:00:00', '23:00:00', 1, 2, '2022-06-21 04:30:09', '2022-06-26 20:56:47', 0, NULL, '2022-06-20-62b0cac13e840.png', 1, 1, 1, 15.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-60', 1, 1, 0, 0),
(3, 'JOXS', '01022220671', 'HFHJ@gmail.com', '2022-06-20-62b0d61ecd94b.png', '30.107990435623453', '31.337449103426586', 'جسر السويس', NULL, 10.00, 20.00, 0, NULL, NULL, 1, 3, '2022-06-21 05:18:38', '2022-10-06 05:01:51', 1, NULL, '2022-06-20-62b0d99860a53.png', 1, 0, 1, 0.00, 1, 1, 0, ' ', NULL, 1, 1, 0.00, '24-48', 1, 1, 0, 11),
(4, 'Test 1', '01096816001', 'test1test@elmaghara.com', '2022-07-05-62c38487b19cf.png', '29.968652796770733', '31.754710647595562', 'Test', NULL, 0.00, NULL, 0, '10:00:00', '23:00:00', 1, 4, '2022-07-05 09:23:35', '2022-07-05 09:23:35', 0, NULL, '2022-07-05-62c38487b323b.png', 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1, 0, 0),
(5, 'Test store 2', '01096816004', 'testtesttest@test.com', '2022-07-05-62c384e8adcee.png', '30.09422862369483', '31.35435742451016', 'Test', NULL, 0.00, NULL, 0, '10:00:00', '23:00:00', 1, 5, '2022-07-05 09:25:12', '2022-07-05 09:25:12', 0, NULL, '2022-07-05-62c384e8adfd8.png', 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '30-40', 1, 1, 0, 0),
(6, 'emam2', '0151548488', 'emam2@gmail.com', '2022-08-03-62eab9bde8dc9.png', '30.16980776719814', '31.35780743811096', 'emam store', NULL, 0.00, NULL, 1, '10:00:00', '23:00:00', 1, 6, '2022-08-04 03:09:01', '2022-09-30 16:47:51', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":2}', '2022-08-03-62eab9bdea5d4.png', 1, 0, 1, 10.00, 4, 1, 1, ' ', NULL, 0, 0, 0.00, '15-30', 1, 1, 3, 8),
(7, 'emam', '01096816088', 'emam1@gmail.com', '2022-08-07-62ef75f11b7d1.png', '30.163959387646322', '31.34751446101631', 'القلج', NULL, 0.00, NULL, 1, NULL, NULL, 1, 7, '2022-08-07 17:21:05', '2022-09-27 04:00:27', 0, '{\"1\":0,\"2\":0,\"3\":1,\"4\":0,\"5\":1}', '2022-08-07-62ef75f11bc26.png', 1, 1, 1, 0.00, 4, 1, 1, '', '{\"status\":null,\"code\":null}', 0, 0, 0.00, '30-40', 1, 1, 6, 6),
(8, 'GS1', '01111234567', 'kjd@gs1.com', '2022-09-29-6335693a5f2fb.png', '30.185101888449807', '31.349357128132162', 'Nasr City', NULL, 100.00, 10.00, 1, NULL, NULL, 1, 8, '2022-09-29 18:45:30', '2022-10-10 18:11:50', 0, NULL, '2022-10-02-633959e44d156.png', 1, 0, 1, 0.00, 4, 1, 1, ' ', NULL, 0, 0, 0.00, '30-60', 1, 1, 0, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `restaurant_schedule`
--

CREATE TABLE `restaurant_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `restaurant_schedule`
--

INSERT INTO `restaurant_schedule` (`id`, `restaurant_id`, `day`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(8, 1, 1, '02:00:00', '14:00:00', NULL, NULL),
(10, 1, 2, '02:20:00', '14:20:00', NULL, NULL),
(11, 1, 3, '02:20:00', '14:20:00', NULL, NULL),
(12, 1, 4, '02:20:00', '14:20:00', NULL, NULL),
(13, 1, 5, '02:20:00', '14:20:00', NULL, NULL),
(14, 1, 6, '02:20:00', '14:20:00', NULL, NULL),
(15, 1, 0, '12:27:00', '23:59:00', NULL, NULL),
(17, 3, 1, '00:00:00', '20:00:00', NULL, NULL),
(18, 3, 2, '00:00:00', '20:00:00', NULL, NULL),
(19, 3, 3, '00:00:00', '20:00:00', NULL, NULL),
(20, 3, 4, '00:00:00', '20:00:00', NULL, NULL),
(21, 3, 5, '00:00:00', '20:00:00', NULL, NULL),
(22, 3, 6, '00:00:00', '20:00:00', NULL, NULL),
(23, 3, 0, '00:00:00', '20:00:00', NULL, NULL),
(24, 7, 0, '09:26:00', '12:00:00', NULL, NULL),
(25, 7, 1, '11:30:00', '23:59:00', NULL, NULL),
(26, 6, 1, '16:24:00', '23:24:00', NULL, NULL),
(27, 6, 2, '16:24:00', '23:24:00', NULL, NULL),
(28, 6, 3, '16:24:00', '23:24:00', NULL, NULL),
(29, 6, 4, '16:24:00', '23:24:00', NULL, NULL),
(30, 6, 5, '16:24:00', '23:24:00', NULL, NULL),
(31, 6, 6, '16:24:00', '23:24:00', NULL, NULL),
(32, 6, 0, '16:24:00', '23:24:00', NULL, NULL),
(33, 8, 1, '11:00:00', '23:59:00', NULL, NULL),
(34, 8, 2, '11:00:00', '23:59:00', NULL, NULL),
(35, 8, 3, '11:00:00', '23:59:00', NULL, NULL),
(36, 8, 4, '11:00:00', '23:59:00', NULL, NULL),
(37, 8, 5, '11:00:00', '23:59:00', NULL, NULL),
(38, 8, 6, '11:00:00', '23:59:00', NULL, NULL),
(39, 8, 0, '11:00:00', '23:59:00', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `restaurant_wallets`
--

CREATE TABLE `restaurant_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `restaurant_wallets`
--

INSERT INTO `restaurant_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, 0.00, 0.00, 0.00, '2022-06-18 05:41:33', '2022-06-18 05:41:33'),
(2, 3, 0.00, 0.00, 0.00, 0.00, '2022-06-21 05:18:57', '2022-06-21 05:18:57'),
(3, 2, 0.00, 0.00, 0.00, 0.00, '2022-06-21 05:26:58', '2022-06-21 05:26:58'),
(4, 7, 2250.00, 0.00, 0.00, 0.00, '2022-08-07 17:55:44', '2022-09-27 03:57:57'),
(5, 6, 2200.00, 0.00, 0.00, 0.00, '2022-09-26 23:31:11', '2022-09-28 02:41:59'),
(6, 8, 0.00, 0.00, 0.00, 0.00, '2022-09-29 18:45:35', '2022-09-29 18:45:35');

-- --------------------------------------------------------

--
-- بنية الجدول `restaurant_zone`
--

CREATE TABLE `restaurant_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `reviews`
--

INSERT INTO `reviews` (`id`, `food_id`, `user_id`, `comment`, `attachment`, `rating`, `order_id`, `created_at`, `updated_at`, `item_campaign_id`, `status`) VALUES
(1, 40, 52, 'ممتاز', '[]', 5, 100013, '2022-08-08 07:22:06', '2022-08-08 07:22:06', NULL, 1),
(2, 43, 56, 'Nice', '[]', 5, 100017, '2022-09-26 23:57:49', '2022-09-26 23:57:49', NULL, 1),
(3, 43, 30, 'Good', '[]', 5, 100021, '2022-09-27 03:54:58', '2022-09-27 03:54:58', NULL, 1),
(4, 44, 30, 'Bad', '[]', 3, 100022, '2022-09-27 04:00:27', '2022-09-27 04:00:27', NULL, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `size` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `created_at`, `updated_at`) VALUES
(1, '20ml', '2022-10-17 06:05:22', '2022-10-17 06:05:22'),
(3, '13ml', '2022-10-17 06:21:32', '2022-10-17 06:23:45');

-- --------------------------------------------------------

--
-- بنية الجدول `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`) VALUES
(15, 'Prestige', 'def.png', 4, 0, 1, '2022-07-13 09:31:53', '2022-07-13 12:13:11', 0),
(16, 'Shock E-liquid', 'def.png', 4, 0, 1, '2022-07-13 09:32:28', '2022-07-13 12:12:56', 0),
(17, 'Mix Fruits', 'def.png', 16, 1, 1, '2022-07-13 12:13:51', '2022-07-13 12:13:51', 0),
(18, 'Mexico Cigar', 'def.png', 16, 1, 1, '2022-07-13 12:14:05', '2022-07-13 12:14:05', 0),
(19, 'Cheesecake Strawberry', 'def.png', 16, 1, 1, '2022-07-13 12:14:19', '2022-07-13 12:14:19', 0),
(20, 'Banana Pie', 'def.png', 16, 1, 1, '2022-07-13 12:14:31', '2022-07-13 12:14:31', 0),
(21, 'Queen', 'def.png', 15, 1, 1, '2022-07-13 12:14:38', '2022-07-13 12:14:38', 0),
(22, 'Cookies', 'def.png', 15, 1, 1, '2022-07-13 12:14:43', '2022-07-13 12:14:43', 0),
(23, 'Creamy Nuts', 'def.png', 15, 1, 1, '2022-07-13 12:14:49', '2022-07-13 12:14:49', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `translations`
--

INSERT INTO `translations` (`id`, `translationable_type`, `translationable_id`, `locale`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Brands', 1, 'ar', 'name', 'جميل22', NULL, NULL),
(2, 'App\\Models\\Category', 2, 'ar', 'name', 'Mods & Kits', NULL, NULL),
(3, 'App\\Models\\Category', 3, 'ar', 'name', 'ليكويد', NULL, NULL),
(4, 'App\\Models\\Food', 3, 'ar', 'name', 'MIX FRUITS', NULL, NULL),
(5, 'App\\Models\\Food', 3, 'ar', 'description', 'SHOCK', NULL, NULL),
(6, 'App\\Models\\Food', 5, 'ar', 'name', 'منتج تجريبي', NULL, NULL),
(7, 'App\\Models\\Food', 5, 'ar', 'description', 'منتج تجريبي', NULL, NULL),
(8, 'App\\Models\\Fixed_Products', 14, 'ar', 'name', 'منتج ثابت تجريبي', NULL, NULL),
(9, 'App\\Models\\Fixed_Products', 14, 'ar', 'description', 'منتج ثابت تجريبي', NULL, NULL),
(10, 'App\\Models\\Fixed_Products', 15, 'ar', 'name', 'SHOCK WATER', NULL, NULL),
(11, 'App\\Models\\Food', 17, 'ar', 'name', 'تجربة المراجعه', NULL, NULL),
(12, 'App\\Models\\Food', 17, 'ar', 'description', 'تجربة المراجعه', NULL, NULL),
(13, 'App\\Models\\Fixed_Products', 18, 'ar', 'name', 'منتج تجريبي للصور ar', NULL, NULL),
(14, 'App\\Models\\Fixed_Products', 18, 'ar', 'description', 'منتج تجريبي للصور', NULL, NULL),
(15, 'App\\Models\\Fixed_Products', 20, 'ar', 'name', 'test 1', NULL, NULL),
(16, 'App\\Models\\Fixed_Products', 20, 'ar', 'description', 'test 1', NULL, NULL),
(17, 'App\\Models\\Fixed_Products', 21, 'ar', 'name', 'Regan King ar', NULL, NULL),
(18, 'App\\Models\\Fixed_Products', 21, 'ar', 'description', 'Nulla sed voluptatem. Similique ut sint dicta alias ut. Ad aperiam ratione ab magnam voluptates et dignissimos ut facilis. Porro aut esse corrupti earum similique maxime dolore nobis. Exercitationem repudiandae natus. Totam sunt et aut dolorem dicta assumenda non ea suscipit. ( ar )', NULL, NULL),
(19, 'App\\Models\\Category', 8, 'ar', 'name', 'Trinity_Jacobi', NULL, NULL),
(20, 'App\\Models\\Used_Product', 9, 'ar', 'name', 'اميرة', NULL, NULL),
(21, 'App\\Models\\Category', 10, 'ar', 'name', 'Jamal Harber', NULL, NULL),
(22, 'App\\Models\\Category', 11, 'ar', 'name', 'Leone O\'Reilly', NULL, NULL),
(23, 'App\\Models\\Category', 12, 'ar', 'name', 'Alfonzo Nicolas', NULL, NULL),
(24, 'App\\Models\\Brands', 13, 'ar', 'name', 'تجربة جوكس', NULL, NULL),
(25, 'App\\Models\\Category', 14, 'ar', 'name', 'voluptatem 2', NULL, NULL),
(26, 'App\\Models\\Food', 10, 'ar', 'name', 'kokoko', NULL, NULL),
(27, 'App\\Models\\Food', 10, 'ar', 'description', 'ksajfdhkaujsbn', NULL, NULL),
(30, 'App\\Models\\Used_Product', 9, 'ar', 'name', 'اميرة', NULL, NULL),
(31, 'App\\Models\\Used_Product', 9, 'ar', 'name', 'اميرة', NULL, NULL),
(32, 'App\\Models\\Brands', 13, 'ar', 'name', 'تجربة جوكس', NULL, NULL),
(33, 'App\\Models\\Brands', 13, 'ar', 'name', 'تجربة جوكس', NULL, NULL),
(34, 'App\\Models\\Fixed_Products', 24, 'ar', 'name', 'test1111', NULL, NULL),
(35, 'App\\Models\\Fixed_Products', 24, 'ar', 'description', 'test1111', NULL, NULL),
(36, 'App\\Models\\Fixed_Products', 25, 'ar', 'name', 'test3', NULL, NULL),
(37, 'App\\Models\\Fixed_Products', 25, 'ar', 'description', 'test3', NULL, NULL),
(38, 'App\\Models\\Fixed_Products', 26, 'ar', 'name', 'test4', NULL, NULL),
(39, 'App\\Models\\Fixed_Products', 26, 'ar', 'description', 'test4', NULL, NULL),
(40, 'App\\Models\\Food', 20, 'ar', 'name', 'test4', NULL, NULL),
(41, 'App\\Models\\Food', 20, 'ar', 'description', 'test4', NULL, NULL),
(42, 'App\\Models\\Food', 21, 'ar', 'name', 'man', NULL, NULL),
(43, 'App\\Models\\Brands', 1, 'ar', 'name', 'جميل22', NULL, NULL),
(44, 'App\\Models\\Food', 34, 'ar', 'name', 'منتج ثابت 1', NULL, NULL),
(45, 'App\\Models\\Food', 34, 'ar', 'description', 'وصف', NULL, NULL),
(46, 'App\\Models\\Fixed_Products', 36, 'ar', 'name', 'منتج ثابت 6', NULL, NULL),
(47, 'App\\Models\\Brands', 2, 'ar', 'name', 'براند 2', NULL, NULL),
(60, 'App\\Models\\Event', 1, 'ar', 'title', 'عنوان', NULL, NULL),
(61, 'App\\Models\\Event', 1, 'ar', 'description', 'وصف', NULL, NULL),
(62, 'App\\Models\\Event', 2, 'ar', 'title', 'ايفا', NULL, NULL),
(63, 'App\\Models\\Event', 2, 'ar', 'description', 'ايفا', NULL, NULL),
(64, 'App\\Models\\Fixed_Products', 40, 'ar', 'name', 'Geekvape Tengu RDA Tank', NULL, NULL),
(65, 'App\\Models\\Used_Product', 20, 'ar', 'name', 'لين', NULL, NULL),
(66, 'App\\Models\\Used_Product', 20, 'ar', 'description', 'لين', NULL, NULL),
(67, 'App\\Models\\Food', 41, 'ar', 'name', 'Jokjok', NULL, NULL),
(68, 'App\\Models\\Food', 41, 'ar', 'description', 'Good good', NULL, NULL),
(69, 'App\\Models\\Fixed_Products', 43, 'ar', 'name', 'emam pro 2', NULL, NULL),
(70, 'App\\Models\\Fixed_Products', 43, 'ar', 'description', 'emam pro 2', NULL, NULL),
(71, 'App\\Models\\Event', 3, 'ar', 'title', 'DVM', NULL, NULL),
(72, 'App\\Models\\Event', 3, 'ar', 'description', 'DVM هو اشهر حدث لمجتمع التبخير الالكترونى \r\nسيكون به العديد من المصنعين المحليين و الاجانب', NULL, NULL),
(73, 'App\\Models\\Campaign', 2, 'ar', 'title', 'توصيل مجانى', NULL, NULL),
(74, 'App\\Models\\Campaign', 2, 'ar', 'description', 'حملة توصيل مجانى', NULL, NULL),
(75, 'App\\Models\\Fixed_Products', 53, 'ar', 'name', 'Handcraft Alien coil 2 cores for DL full Ni80 / 0.28 OHM', NULL, NULL),
(76, 'App\\Models\\Fixed_Products', 52, 'ar', 'name', 'Handcraft Alien coil 3 Cores for MTL full Ni80 0.6 OHM', NULL, NULL),
(77, 'App\\Models\\Fixed_Products', 51, 'ar', 'name', 'Handcraft Alien coil 3 cores for MTL Mix KA1+Ni80 / 0.85 OHM', NULL, NULL),
(78, 'App\\Models\\Fixed_Products', 50, 'ar', 'name', 'Handcraft Alien coil 2 cores for MTL Mix KA1+Ni80 / 0.80 OHM', NULL, NULL),
(79, 'App\\Models\\Fixed_Products', 49, 'ar', 'name', 'Handcraft Alien coil 3cores for DL full Ni80 / 0.30 OHM', NULL, NULL),
(80, 'App\\Models\\Fixed_Products', 48, 'ar', 'name', 'Handcraft Alien coil 3 cores for DL Mix KA1+Ni80 / 0.4 OHM', NULL, NULL),
(81, 'App\\Models\\Fixed_Products', 47, 'ar', 'name', 'Handcraft Alien coil 2 cores for DL Mix KA1+Ni80 / 0.36 OHM', NULL, NULL),
(82, 'App\\Models\\Food', 45, 'ar', 'name', 'ACID ( LSD ) DL 2.5Nic', NULL, NULL),
(83, 'App\\Models\\Food', 45, 'ar', 'description', 'ACID ( LSD ) DL 2.5Nic\r\nLSD (Ice Mango)\r\nعصير المانجو الطبيعي المثلج مع بعض قطع المانجو من أنواع مختلفة', NULL, NULL),
(84, 'App\\Models\\Brands', 13, 'ar', 'name', 'تجربة جوكس', NULL, NULL),
(85, 'App\\Models\\Food', 46, 'ar', 'name', 'اااا', NULL, NULL),
(86, 'App\\Models\\Food', 46, 'ar', 'description', 'AAA تجربة', NULL, NULL),
(87, 'App\\Models\\Food', 47, 'ar', 'name', 'بببب', NULL, NULL),
(88, 'App\\Models\\Food', 47, 'ar', 'description', 'BBB تجربة', NULL, NULL),
(89, 'App\\Models\\Food', 48, 'ar', 'name', 'تتتت', NULL, NULL),
(90, 'App\\Models\\Food', 48, 'ar', 'description', 'ccc تجربة', NULL, NULL),
(93, 'App\\Models\\Fixed_Products', 65, 'ar', 'name', 'as', NULL, NULL),
(94, 'App\\Models\\Fixed_Products', 65, 'ar', 'description', 'as', NULL, NULL),
(95, 'App\\Models\\Fixed_Products', 64, 'ar', 'name', 'sfdf', NULL, NULL),
(96, 'App\\Models\\Fixed_Products', 64, 'ar', 'description', 'sdfsd', NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `used_market_settings`
--

CREATE TABLE `used_market_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `expiryDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `used_market_settings`
--

INSERT INTO `used_market_settings` (`id`, `amount`, `expiryDate`, `created_at`, `updated_at`) VALUES
(1, 4, '2022-10-29', '2022-08-13 08:32:17', '2022-10-03 00:07:12');

-- --------------------------------------------------------

--
-- بنية الجدول `used_products`
--

CREATE TABLE `used_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `used_products`
--

INSERT INTO `used_products` (`id`, `name`, `description`, `image`, `price`, `phone`, `created_at`, `updated_at`, `address`) VALUES
(4, 'ali', 'description', '2021-05-08-6096bb467d0c6.png', 410, '0115185485', '2022-08-27 00:50:15', '2022-08-13 18:04:35', 'sagaegerhyt'),
(9, 'amira', 'amira description', '2022-08-10-62f40b0224c94.png', 150, '0115484964897', '2022-08-08 20:39:38', '2022-08-13 18:05:20', ';ldkfngopda'),
(11, 'Monem', 'desc', 'def.png', 12, '0124548478', '2022-08-09 23:05:50', '2022-08-09 23:05:50', 'addres'),
(12, 'Monem', 'desc', 'def.png', 12, '0124548478', '2022-08-09 23:07:29', '2022-08-09 23:07:29', 'addres'),
(13, 'Monem', 'desc', 'def.png', 12, '0124548478', '2022-08-10 02:24:51', '2022-08-10 02:24:51', 'addres'),
(14, 'Monem', 'desc', 'def.png', 12, '0124548478', '2022-08-10 02:24:59', '2022-08-10 02:24:59', 'addres'),
(16, 'onem', 'desc', 'def.png', 12, '0124548478', '2022-08-10 02:46:08', '2022-08-10 02:46:08', 'addres'),
(17, 'onem', 'desc', 'def.png', 12, '0124548478', '2022-08-10 02:50:48', '2022-08-10 02:50:48', 'addres'),
(18, 'lol', 'afqer', 'def.png', 500, '01151875214', '2022-08-10 03:01:26', '2022-08-10 03:01:26', 'qewgqwg'),
(20, 'leen', 'leen desc', '2022-08-10-62f41d5cbdaed.png', 50, '0151548488', '2022-08-11 06:04:28', '2022-08-11 06:04:28', 'cairo'),
(21, 'new', 'test', '2022-08-13-62f76c71d7cf0.png', 100, '011548496487', '2022-08-13 18:18:41', '2022-08-13 18:18:41', 'address'),
(23, 'test', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:05:13', '2022-08-15 21:05:13', 'addres'),
(24, 'test', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:06:11', '2022-08-15 21:06:11', 'addres'),
(25, 'test', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:06:40', '2022-08-15 21:06:40', 'addres'),
(26, 'test', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:06:55', '2022-08-15 21:06:55', 'addres'),
(27, 'test', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:06:58', '2022-08-15 21:06:58', 'addres'),
(28, 'test2', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:07:18', '2022-08-15 21:07:18', 'addres'),
(29, 'test2', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:19:02', '2022-08-15 21:19:02', 'addres'),
(30, 'test2', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:20:32', '2022-08-15 21:20:32', 'addres'),
(31, 'test2', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:20:37', '2022-08-15 21:20:37', 'addres'),
(32, 'test2', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:20:41', '2022-08-15 21:20:41', 'addres'),
(33, 'test2', 'desc', 'def.png', 12, '0124548478', '2022-08-15 21:20:44', '2022-08-15 21:20:44', 'addres'),
(34, 'vape', 'vepresso', 'def.png', 200, '012223157979', '2022-09-29 20:43:00', '2022-09-29 20:43:00', 'cairo');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int(11) NOT NULL DEFAULT '0',
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender` int(11) DEFAULT '1',
  `date_of_birth` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `country` text COLLATE utf8mb4_unicode_ci,
  `city` text COLLATE utf8mb4_unicode_ci,
  `facebook` text COLLATE utf8mb4_unicode_ci,
  `user_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_product_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`, `zone_id`, `gender`, `date_of_birth`, `address`, `country`, `city`, `facebook`, `user_name`, `used_product_count`) VALUES
(1, 'أحمد', 'روسيا', '+201203423409', 'ahmedrosea20@gmail.com', NULL, 0, NULL, '$2y$10$0w7ixGDzQF5SCrJhTHH1h.lCExs6WpZrd2mrRewFyDHbzoLsrGQK.', NULL, '2022-05-29 18:17:11', '2022-05-29 18:18:05', NULL, 'ehPxxlK5RyqniF0bLKAQ4V:APA91bEsrgmjPfyHFPyXo4uCsEKNJCPVvce8YeXC8tz-6NtkURvoHpOmd8xwj3t2zSqwZMiKuIvsAPgyZW5aKsQozswh0ygFKQnF6vA6iCk84AI6EC-geftm2VJ3R2QmdelKRRhXQvGI', 1, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '', 0),
(2, 'Hesham', 'Azab', '+201004479160', 'gwassou6@gmail.com', '2022-07-15-62d17d80dea08.png', 0, NULL, '$2y$10$9/u8Mh0iTNivHsK8CTkkSOtsjVSgztt6DK/b0OoFma7R/vEmDBquq', NULL, '2022-05-30 10:18:01', '2022-07-17 21:24:25', NULL, 'cCycWumzTsOCysFFbD0FSg:APA91bH16ivkcCKQmYgIgLS5h_PMycHlMg4LjTQlmvEs8owR2I4GEIJKHmsDlNQStUSTHolmxq6fhMeVfmg7i8-H9cvV4SdmWOYDJwk3wKmG7xKonUZ4dBL6zixJDarhpKo51hmtZLv2', 1, 0, NULL, NULL, 1, 1, '٢٦/١٢/١٩٦١', 'الاسكندريه', 'الاسكندريه', 'الاسكندريه', 'الاسكندريه', 'هشام كمال', 0),
(3, 'احمد', 'محمد', '+201096816077', 'ahmed@ahmed.com', NULL, 0, NULL, '$2y$10$Xcy7Ruu3DXRXA.g3qvGaS.2of37zRvbVhUDWfFCCuR41vUIIvQJ5i', NULL, '2022-06-01 12:16:59', '2022-06-01 12:17:13', '[1]', 'cEA58mgZQe--ekuwtZReO8:APA91bHYMwWv1AZkm87FOLYIPLskF6mHkbnAK4Jpvrhvckl4ilxcTapPRIJdhh4epNUZHhcxjPaEoYmIPA6NetvfgJpExXSvh8Sk2jrzvvsmsv2ayUhHPBwFqGKoyDYX6LgXv5HaH5Ce', 1, 0, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, '', 0),
(4, 'Ahmed', 'Mohamed', '+201096816079', 'ahaamed.aa@a.com', NULL, 0, NULL, '$2y$10$EI26JfmbM8xvjhzZKZcO/upxa.duNly25166WC2AAWNvZCIFGlX8a', NULL, '2022-06-01 12:25:17', '2022-06-01 12:25:29', '[1]', 'c20WNMBJTh2pOnGNfHhOQC:APA91bHQ78d_u2UYeLcqn853bCHB48-E4mbhJDaHoU1FrO63WcOWlBwFZkN-Vxxrs2CQbcZVc6jztNs_eVoGQHbS3aHZlstkMCVGRfNJIBZ5HIeGr3lqGSzsu5vh5XaaZ2M2m7VPIpxI', 1, 0, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, '', 0),
(5, 'fahdgad', 'fahd gad', '+201033563559', 'target.adv.event@gmail.com', '2022-06-01-62973c21b5f73.png', 0, NULL, '$2y$10$ed14eRBBrOJKkR.SQXfja.D.MaPevfUBfIpVAsXAKqDxWu4be8ofC', NULL, '2022-06-01 17:05:07', '2022-09-27 02:58:14', NULL, '@', 1, 0, NULL, NULL, 1, 1, '14/8/1988', 'cairo', 'Egypt', 'cairo', 'fahd', 'Korabeka', 0),
(6, 'Joka', 'jox', '+201223157398', 'jox@jox.com', '2022-06-01-6297629dde396.png', 0, NULL, '$2y$10$p7gprWt.Qx/sQqAx9mliCur.VqSVwBFSRgiPrrJTcUt8i//VbmvQu', NULL, '2022-06-01 19:56:07', '2022-10-10 18:34:33', '[1]', 'c2BcHLFxRPqSBTvqEjJ3qh:APA91bGM8JBWCKXjLSc7HfZ-FZeQZC1twVTQIlI_fyQ36uiO7LpJcaI3AoN75n62JJMIFnufLG2SQfgYZyVPOlLroFsO22C3yJBnJnzv1foNelCAuoxg4ZbJIZ0A0wkUwEGJCUh_OQN8', 1, 0, NULL, NULL, 4, 1, '2-2-22', 'Cairo', 'Egypt', 'Cairo', 'joka.magdy', 'xeplod', 0),
(7, 'Ahmed', 'Emam', '+201096816075', 'ahmedfathy1988000@gmail.com', NULL, 0, NULL, '$2y$10$DH/P7KCapwhJJo4xFk2k3eabdTmfJFq0k2PeJKr5cBMoEOaGqiNMy', NULL, '2022-06-26 09:53:03', '2022-06-27 09:54:45', '[1,2,3]', 'eFlj-VkGR8iT2vzlok67WY:APA91bEdcbg1SCTIOKht3YC2xBlvA9vZ4Sbbn132QuipCQrQFle4xsI-Pw3IipydPjj5fMOVPDJ8JOLYnwkqhFvcNSX0WITNhrL5eaSwa3AcM_N344z2qjiufh5cDIWOIaUC-5sQp7Wq', 1, 0, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, '', 0),
(8, 'hesham', 'Azab', '+201022839797', 'gwassou@gmail.com', '2022-07-07-62c65f9946a66.png', 0, NULL, '$2y$10$ET7RGmkLTel1QLPQsQHNuOoQljzKEIZdYVUgpAWtRf3PRAo3Jfeym', NULL, '2022-07-02 01:40:25', '2022-07-07 14:32:51', '[1,2,3]', '@', 1, 0, NULL, NULL, 1, 1, '5/10/1955', 'ddddddd', 'eg', 'xxxxxx', 'ggggggggg', '', 0),
(9, 'Ahmed', 'Test', '+201096816000', 'test@test.com', '2022-07-04-62c2230f9d3dd.png', 0, NULL, '$2y$10$8xKRF5l4rj2zC908cMyKOOYVEf1pER/HiuHFN3EwZy8Fv2vGg0Q1.', NULL, '2022-07-03 08:46:17', '2022-07-04 08:15:27', '[1,2,3]', 'dBCIdtF7TxmziwFd1ZXhcP:APA91bEZxilGXU_9svdRxL-AZIdNCQJ7S04zDF4cW4CYhm-Qy5XyfOU4Ft6TORA0PIiQVQJeMAJXWLcfT0CUqLVthH7NDKRbgfCVl8Smpau2u_RKnIB6VFi65W0p43-TkbrgcwR2mhVL', 1, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '', 0),
(10, 'مهم', 'سالم', '+201096816011', 'te@te.com', NULL, 0, NULL, '$2y$10$1bzReQ04iovewHAEPTP5a.H1HjkP/w2Q2pBz7AeGx3C8eQt5bMFFW', NULL, '2022-07-03 15:46:14', '2022-07-03 15:47:11', '[1,2,3]', 'eVVbqM0RSGS-_SD5nVg4U-:APA91bEt_axOdr2XBXQxbXUZG0uvNF_nVzKYG53fLVuUwQjL9nqHcv9q36YsCuCJMx7UtpbvZZKkk6cRLTKHwcyVKW35Fk2OqkskVcOaipiekU0EzywhlFkPryui5WrRAn79dX9ApTuW', 1, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '', 0),
(11, 'abdo', 'Hassan', '+201096816001', 'abdo@gmail.com', NULL, 0, NULL, '$2y$10$R3NNge3z1w8k..WaEs7GouG9GCFEiGP1HVOqh0aT77hN8z5HAVnC2', NULL, '2022-07-04 08:25:54', '2022-07-04 08:25:54', NULL, NULL, 1, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', 0),
(12, 'Ahmed', 'Emo', '+201096816072', 'ahmed@emo.com', NULL, 0, NULL, '$2y$10$dltPFgoATiZImigOJ6P2J.612C/uptsCvQ0H0JHmcBrF8Nm4pA0zy', NULL, '2022-07-07 06:41:05', '2022-07-07 06:41:50', '[1,2,3]', 'dQl3p-FcRmaoJYjtRd2n18:APA91bGvnZNPyDAKPwGBmb5-uG8avUhKyvIlf8KyOTjkmk77uwwx8cNVo3QvHKdbh6CUNxUUnjglKCns39_NoupIEIa4-0e5jJ5qMTBkgCR7wP_TnybG0v339r3nFoTCzLBygcU-kzgh', 1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', 0),
(13, 'Ahmed', 'Mohamed', '+201096816023', 'loka@loka.com', NULL, 0, NULL, '$2y$10$lNKLyKykU/9.dLrqacIQq.n0Te7y74ENt6zeNCLcSMEMoRkRBZr/.', NULL, '2022-07-07 22:21:50', '2022-07-07 22:22:38', '[1,2,3]', 'diXoe4JWT2WuG-B3mtFeEB:APA91bHCLn6RFrebeRegWhazv2rlB3JvlW74KHzTNInlkJNlkpeRZ6V9PhtusdznkWDnmbPw9udhI9vZu-3uWnvUI2Kxv9QeLLpxo-QjnQWNtjQgxU20AsAjlhbjVmYnTmtKXkuTilgi', 1, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', 0),
(14, 'مصطفي', 'جاد', '+201011611323', 'mostafagad22@gmail.com', NULL, 0, NULL, '$2y$10$iTFBRSMPMaIpylBLlSc6Bu7u0yjNxg0hN3jxg2Lap2uFZoc357a.G', NULL, '2022-07-08 00:42:18', '2022-07-08 00:44:17', '[1]', 'd7BPxVnLR_2PTOZO2stlYK:APA91bFeZTJDkoW0_myct2p-tW3xIRX2volqZI5SbPXwr2w3HD1LtAJA0EP1Oq_OIfh51DgLT_qs9C0EmDwhf83975HrzOtP27QOe0s4JGXYaMuGECpmMLb-N_y5hCV8e88CKV19m7kX', 1, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, '', 0),
(15, 'hesham', 'azab', '+201004479180', 'hesham@gmail.com', '2022-07-11-62cb713191ba1.png', 0, NULL, '$2y$10$H65Z3sEcUlsuxRLo3TXKb.R.IWxpnIbKgR3cm.nMglub/jke88G.K', NULL, '2022-07-11 08:53:54', '2022-07-11 09:39:13', '[1,2,3]', 'cDDRHYYKTSmo-grNwwJ0Uw:APA91bG2TVYc_oDvTllpt7gnPesV33Wu4NMiHG977FKUHQVr0_SxYc0kPmY7AgqlTtPxSMtTqHV5CR8EamcCL4GOjbG82M5THSp1rH4HgrT8fhHk4D6zUsKmPeI_zuLjqM9ED4Duv7Eo', 1, 0, NULL, NULL, 1, 0, '5/12/1552', 'aaaassa', 'ghjknvv', 'ffgxgkbvd', 'cchngddd', '', 0),
(16, 'Ahmedemam', 'Makel', '+201096816022', 'makel@makel.com', NULL, 0, NULL, '$2y$10$YiFvdVdO/7FrLjwVDrO0QuMsqkSv4bMFjgx/M1gEJ5m7N4geNVTDi', NULL, '2022-07-11 09:30:58', '2022-07-11 09:31:44', '[1,3]', 'dAFTXwTbRDqBkyvTvCiYP3:APA91bGUrvSDhEekA6PznQ_ku_9vOSLT3_jME20PVm3njdW1yCIIEfa7bISZ_2VBruzsQO-IgUx1okhC81cATye7hwfHbR7KrOZSlG1EqQzOjPQrXRA8X3BZvJTTxVTh6Etmxwg7F3Ss', 1, 0, NULL, NULL, 1, NULL, '2', NULL, NULL, NULL, NULL, '', 0),
(17, 'قاهره', 'قاهره', '+201222727783', 'g@gmail.com', '2022-07-12-62ccdd699e055.png', 0, NULL, '$2y$10$UbHAdodfiAA37Zl/5ZydTeEVQKaKHO2cJrkTta7BsKa5rFNPgzXQm', NULL, '2022-07-11 09:53:14', '2022-07-15 22:50:34', '[1,2,3]', 'cRjBuLPgR2CeMLNDwGdPEv:APA91bEroBD1gBJDBLJ09wnmywmTgBf2c0lXpw9pIZB6wRr6p2JGJBSaSKzWlEy5wcLm1a_p0Iq6fmSSWlyJgWSzE4qFOBDOM8uhvNucYivwwVhm6PfnK21mBYjivxf0QILMLTLmISKt', 1, 0, NULL, NULL, 1, 0, '5/12/1995', 'الاسكندريه', 'الاسكندريه', 'الاسكندريه', 'الاسكندريه', 'احمد زيات', 0),
(18, 'Ahmedemam', 'Lolo', '+201096816872', 'lolo@gmail.com', NULL, 0, NULL, '$2y$10$ytJFH9dlzT7vgWtDA5bgcun7PENGLLmAU7/DUUQG5imvwYd.Zc1qG', NULL, '2022-07-11 10:21:03', '2022-07-11 10:21:40', '[1,3]', 'exPhJDlqQd2N8wbMUsbEL2:APA91bHQrdYd_Xb_AjxBW5IlPekYCu9E_K-VQNKChlDZnD2cvMo24eKvuV3zSoKo2G6WM0HrjNKGmDXdj4_98JyNgoUORmuaS_D0JEG6BbjshmKQe3Z_xOifmM8SnXZmcOMpsf7vdb6x', 1, 0, NULL, NULL, 2, NULL, '1', NULL, NULL, NULL, NULL, '', 0),
(19, 'soso', 'soso', '+201066816074', 'soso@soso.com', '2022-07-11-62cb97dea2042.png', 0, NULL, '$2y$10$DIBcq3ztRmfg8FLDkPFfcOWYfoeC83HfxRAZtmwQ2M.6hhMuUuamK', NULL, '2022-07-11 12:21:52', '2022-07-11 12:24:49', '[3]', 'eSt7D-HjS_WxLPtpswD7Zx:APA91bG3pY1CPLBYE5u0A7sESqxahwTt9fQx_2A1fB-Ht1oF7j0glw6_ZOH72SVhfVWVO1kwQOsCdpLNODl8-d4MmDht2EF5mB1rgS_v8w61XZhx7j5GK1rv-LGYglM3OkPLI_4fcRVD', 1, 0, NULL, NULL, 1, 0, '15/2/1993', 'القاهره', 'القاهره', 'القاهره', 'القاهره', '', 0),
(20, 'هالو', 'هالو', '+201096856074', 'hello@hello.com', NULL, 0, NULL, '$2y$10$2vM3KqvcOk9pwxpP.r/lXeYAJQq40wCQH8YcKWN4C84jiiejSMzvu', NULL, '2022-07-11 12:26:22', '2022-07-11 12:29:56', '[1]', '@', 1, 0, NULL, NULL, 1, NULL, '16', NULL, NULL, NULL, NULL, '', 0),
(21, 'Hesham', 'Azab', '+201222727785', 'sekas@gmail.com', NULL, 0, NULL, '$2y$10$5521BfUktl75oHJXGeaHleua41j4H7rFjmutKlCJycLmhtNi4PaXG', NULL, '2022-07-11 19:35:08', '2022-07-11 19:35:29', '[1,2,3]', '@', 1, 0, NULL, NULL, 1, 0, '2022-07-26T00:00:00.000', NULL, NULL, NULL, NULL, '', 0),
(22, 'hesham', 'kamal', '+201222727784', 'gg@gmail.com', '2022-07-11-62cc094bc714d.png', 0, NULL, '$2y$10$Xjb8u.8DcpqDaARyxUhuue3BBsJmWQdzHIzO8s2pues7KXMfP2iSC', NULL, '2022-07-11 20:05:32', '2022-07-11 20:28:11', '[1,2,3]', '@', 1, 0, NULL, NULL, 1, 0, '2022-07-11', 'Egypt', 'Egypt', 'Egypt', 'Egypt', '', 0),
(23, 'Ahmed', 'Moko', '+201096813074', 'mokol@mokol.com', NULL, 0, NULL, '$2y$10$jRhG7LX49A2vzkga1MPPcOcUfFkH7ls6ciJZPtggr3uZw//6wVWa2', NULL, '2022-07-13 06:32:50', '2022-07-13 09:07:29', '[1,3]', 'cbuJGFDxRy204JFsVhUnUL:APA91bGxGP0O-L_SBGX_30oge7BQGiwD1HZ4r-br2wzahuyS7dC8slpdp8jaGOLOhXqAg9pU8UgA9qzxbCYLKoa8UYnxhZigi0k6TNJIFFLeH1yk7fxAqxzJR1Oh5r0bJ_uDTYeD6Shl', 1, 0, NULL, NULL, 1, NULL, '1990-07-26', NULL, NULL, NULL, NULL, '', 0),
(24, 'ahmed', 'gamal', '+201004479120', 'ahmedgamal@gmail.com', NULL, 0, NULL, '$2y$10$H2WovyIuIzDRtW.nIH86h.qb/ON4kvunku7WHhVeaf3kRuTrGNSTy', NULL, '2022-07-15 22:15:07', '2022-07-15 22:16:12', NULL, '@', 1, 0, NULL, NULL, 1, 0, '6/10/1998', 'cairo', 'cairo', 'cairo', 'cairo', 'ahmedgamal', 0),
(25, 'Ahmedmalek', 'Salem', '+201010816074', 'kokomol@gmail.com', NULL, 0, NULL, '$2y$10$uhn3wTbUlzt8iKcbyw9k1Oj17Kp1yPmNkNw7bNwT/KkqcTP0Ej9Bu', NULL, '2022-07-15 22:42:56', '2022-07-15 22:43:30', '[2,3,9,10,11]', 'ekMKhAn9RDS9ixJ9m3W127:APA91bFdNFcKdeNxk81ICLpx8GATUedGOrRLnbOqx5pRkcgdp-YoZJzVHQLEu9Xd9FjKX6BPVSmk6jmasmZzwIEi129YkQF8phK0RGKidazfZZWQT0D9uSwaJOIKWKhX4wXETWNoZe7V', 1, 0, NULL, NULL, 1, NULL, '1993-07-15', NULL, NULL, NULL, NULL, 'Kokomol', 0),
(26, 'abdo', 'Hassan', '+201224078648', 'atwa@gmail.com', NULL, 0, NULL, '$2y$10$exhx4TnX4/3Lt7nYSn65xOK68G3MW5zhJZeXNDb8VCuJZsfhpC1Ju', NULL, '2022-07-15 23:55:25', '2022-07-15 23:56:05', NULL, 'fJqUhOjhQ8-dvGkR7HGsnd:APA91bHKJTZ8aQ-eyk1OB-2SGT0qgdTcONqzdZX4j21UMhW0GwZhPPUgL4bxH2CqzRUqyFYjZXn-5OcG-G2T236PBmQs-IkTRoMyXimAPN4EjmQzLkKqVMKtPMC-ofQBeRbTkD9c3ER7', 1, 0, NULL, NULL, 1, NULL, '5/10/1997', NULL, NULL, NULL, NULL, 'AtwaHassan', 0),
(27, 'محمود', 'محمد', '+201004479170', 'df@gmail.com', '2022-07-15-62d182256c1b0.png', 0, NULL, '$2y$10$DRyqYyHO6epTP/w6XwHUqu4dhP8r/z/Pm9VDdXXj.xUW7q870YYBy', NULL, '2022-07-16 00:04:02', '2022-07-16 00:17:14', '[2,3,9,10,11]', 'dGRGd4wGSbC0HDV-YxFMFd:APA91bG4JBE1ZtNn8_Y7oP7B0y-BCro2tkrJAEld3ykA_RhrUlKOaOnxb-z3ZrgFT4Lvpjq6tiFe4FLcN9NGTMTsYn9IVOjxuQs1st7WQRSeBJcWf7KV0qu6-LsItZnKykHUE14Uqfjr', 1, 0, NULL, NULL, 1, 1, '23/9/1334', 'ggggg', 'gggggg', 'gggggg', 'ggggg', 'احمد محمد', 0),
(28, 'Bigo', 'Bigo', '+201010101010', 'bigo@bigo.com', NULL, 0, NULL, '$2y$10$D9MZmhZ09vyW8DQSXjJDW.qOCaOW0zl1yXmjaJzPTAdKhymbYfYQW', NULL, '2022-07-16 12:59:07', '2022-07-16 12:59:29', '[2,3,9,10,11]', 'enk9O41xS9CUHhAlBNuydU:APA91bHxxUWuPLvAtoF6aT6s3SHXrC90pH0THDZ7HW3MpJxnEDsJohHZMYF-7KQnZRxbVbrLr0_w__D-hNui0NIAxBl26t2MJzphh7sJk9uWy5AUmSW9Rkh3YbdSE9OXQ3T9mjQHWp3-', 1, 0, NULL, NULL, 1, NULL, '1993-07-30', NULL, NULL, NULL, NULL, 'Bigo', 0),
(29, 'kamel', 'kamel', '+201010101011', 'kamel@gmail.com', NULL, 0, NULL, '$2y$10$Vtpgh0w8Bepy94g65VlLAu8nan7lcorPRG5EUbdgCym5FigHp./1S', NULL, '2022-07-16 13:03:04', '2022-07-16 13:03:25', '[2,3,9,10,11]', 'cPPJeko7SvaFcCxQCmhaqw:APA91bH9phmoK7sBYBXVa_noq39OAiYa9tCBwzgajfMAqvDjOOVatDnDlPRyFE_8OYfWFfb5OA8Z-uD-Zggrs7QiHN7JtzWzqQS7x-gjNjPBw1vhviDz8Kn5CFUZoHFjfkc8HQ6HAHV6', 1, 0, NULL, NULL, 1, NULL, '1992-07-28', NULL, NULL, NULL, NULL, 'kamel', 0),
(30, 'George', 'Wadia', '+201223157368', 'XEPLOD@gmail.com', NULL, 0, NULL, '$2y$10$5L8embfY3bx5laPvcHoNc.X/0TwAyuoU0BCgJto7tAb.BDE3btqqm', NULL, '2022-07-17 07:58:44', '2022-10-10 18:28:09', '[9]', '@', 1, 2, NULL, NULL, 4, NULL, '02-02-1988', NULL, NULL, NULL, NULL, 'Xeplod', 1),
(31, 'Pola', 'Attia', '+201258191133', 'pola.2000@gmail.com', NULL, 0, NULL, '$2y$10$CNpesQYya0519NveOjMKcu4U5NrERfzcidYR7GrJR.RufiFYh39qu', NULL, '2022-07-17 08:04:02', '2022-07-17 08:09:04', '[3]', 'fx_V8OxvQ_KfvidDkFLmkg:APA91bEp9pBxaIai0-dzK59ROravhIKJNeD82FnuIww_IQDS7MhS5GIfnzw8AGFfU7U8XIfyIg4oWxvweyCBRaw_NwNydkkKsk0kH4egfDf8JZcjG7qJwsRANjcOaHJcCuc5j-7IpDRt', 1, 0, NULL, NULL, 1, NULL, '8', NULL, NULL, NULL, NULL, 'Pola', 0),
(32, 'Hesham', 'Azab', '+201004479139', 'seka.2@gmail.com', NULL, 0, NULL, '$2y$10$glCtJtbP19wB1xkxkhIsHeywHtkFW5OyUqvL5o7a1PKmiNvi8hK7W', NULL, '2022-07-17 21:50:00', '2022-07-17 21:50:37', '[2,3,9,10,11]', '@', 1, 0, NULL, NULL, 1, 0, '1987-07-15', NULL, NULL, NULL, NULL, 'Heshamazab', 0),
(33, 'احمد', 'محمود', '+201005578150', 'ge@gmail.com', '2022-07-17-62d409c25b4da.png', 0, NULL, '$2y$10$iLzjx8t2Zuiq.0PUZWubBePBY/bcn/2AffflTb/F4XXFcOqBfOSPm', NULL, '2022-07-17 21:52:47', '2022-07-17 22:08:18', '[2,3,9,10,11]', '@', 1, 0, NULL, NULL, 1, 1, '12/3/1885', 'القاهره', 'القاهره', 'القاهره', 'القاهره', 'Georgewassouf', 0),
(34, 'Kore', 'Kore', '+201020202200', 'kore@kore.com', NULL, 0, NULL, '$2y$10$fCY2DmVxagpOhB/P4BFyquRYEqACmSiVEAdZASM1QXoJ84cb1Ya1S', NULL, '2022-07-18 17:04:47', '2022-07-18 17:05:24', '[2,3,9,10,11]', 'dDf6BXZhQky03y-odr3ltu:APA91bE0fxqASjyMhGFAs3QrdmI7pSvYOfjE_1HNA7yARm_7eNFtdFuRL4cBB-OX0uRVO6O4SqumZDWnnYUaDJutZooBmD6_xkcNavfIjSwsMkGlOXKp0x3AmTCGeG0PmlJD1qxzUPWN', 1, 0, NULL, NULL, 1, NULL, '1995-07-26', NULL, NULL, NULL, NULL, 'Kore', 0),
(35, 'اكونت', 'تست', '+201032447891', 'test@clint.com', NULL, 0, NULL, '$2y$10$t4N5WtpJ8uwtUxQGevPqF.iy904rhPg4ygtzHMOO9oZzfhkmG8tne', NULL, '2022-07-23 11:04:14', '2022-07-23 11:04:41', '[2,3,9,10,11]', 'fYOrQQyeQcilPgXuOBdHTZ:APA91bHYyiDrqWRpnJp-7ls9cR65SwVP_--xY4PBCZaBRu5dpDrYRqBVqfTG7JYzjEKHxjT92xlpvQzMbvE1NJwpODvxrOFG3RSXvRg7wYDfrmHzW8Fh3DrrP_SRzQ-I0RG96N2o9zcK', 1, 0, NULL, NULL, 1, 1, '2000-07-23', NULL, NULL, NULL, NULL, 'test_account', 0),
(36, 'Mohamed', 'Saudi', '+201007024777', 'saudi.mohamed@hotmail.com', NULL, 0, NULL, '$2y$10$cjp/Ycb6mIQib7.hFQd1seMR2TxsNtckwxwQXztZ1JsFfUywvGjCC', NULL, '2022-07-24 08:54:24', '2022-10-03 03:45:10', '[2,3,9,10,11]', 'd---CTDkSJWYMfdNbXMJSb:APA91bGIS-Hz4UViVwc6OjlouvGij-quh8klWTEhwZsKg7CbV1qRO_VOjpFVXxMKleSnL4ubZ3PUAS5jnxbzYryhDP90vwUQ0VcbFBFUerpre7ex17jp_h2muXMLwAk08OmvI-9FxIGo', 0, 0, NULL, NULL, 1, NULL, '1991-05-17', NULL, NULL, NULL, NULL, 'Saudi', 0),
(37, 'rrrrrr', 'rrrrrrr', '+201067368720', 'eng.ibrahem0sarrrrrrrrrrrrrrrdfasd10673@gmail.com', NULL, 0, NULL, '$2y$10$eJkAM4ZSWcNyY5Xm3zhNWecF0OAvdzev8bPjKAeEe7R.IYNh5.ChW', NULL, '2022-07-28 06:45:44', '2022-08-01 00:59:46', NULL, '@', 1, 0, NULL, NULL, 1, 1, '1998-11fff-02', 'rrrrrrr', 'rrrrrrrrrr', 'rrrrrrr', 'rrrrrrr', 'rrrrr', 0),
(38, 'Malek', 'Zamalek', '+201030806090', 'zemo@gmaol.com', NULL, 0, NULL, '$2y$10$t6mn0j0H0Luof3UMJ1kMb.ggUeyX0tI.n1nRi/2BCSr1fDoi/XAZ2', NULL, '2022-07-29 00:07:09', '2022-07-29 00:07:53', '[2,3,9,10,11]', 'dnW5fKIhQ1OlfsrxHau6l4:APA91bEZIS__TjhmRlgBWXM6V_t7uKUGCctrsp6CvGJ14TBo0ImAdtxn1QmZczmySd-CUsyikqnGD2t6PKlv4-CTJmMHLqOca6RfOaI3d0SD3Pfvr8vPzEwfa_tvq3I2Uq0j5SWMy2g0', 1, 0, NULL, NULL, 1, NULL, '1990-07-17', NULL, NULL, NULL, NULL, 'Zemo', 0),
(39, 'dd', 'ddd', '+201067367878', 'eng.ibrahem01adfadfasdf0673@gmail.com', NULL, 0, NULL, '$2y$10$LyfOVEiLwYeZyPaDT6wq1.ilbov/cPbQIBEw2IST1gwQPCV8oIKAi', NULL, '2022-07-30 01:04:49', '2022-07-30 01:05:21', '[2,9]', '@', 1, 0, NULL, NULL, 1, 1, '1954-07-28', NULL, NULL, NULL, NULL, 'ddd', 0),
(40, 'mohamed', 'saad', '+201069869698', 'epestl2022@gmail.com', NULL, 0, NULL, '$2y$10$TvrLX6Nrqa11Usl1HJ9aae78aiVipF5s.nPHVZlepPK5V9wDX0V3W', NULL, '2022-07-31 01:43:06', '2022-07-31 01:43:28', '[2,3,9,10,11]', 'fUQuq7deTKaA9OfMCvH1Qv:APA91bHp7uMAxbbM1BCI1nnktCIK-e2r8eiwETq7UgTKMqcvPB6p4ilwAaL1LuUVU8tCCV7389-oyzR0ti5DAoMBM_eaaoLA40UBsoYgQRWlj5v97-BG4BF9qOeIM3SDGkEb0AYIvEKU', 1, 0, NULL, NULL, 1, 0, '1984-07-23', NULL, NULL, NULL, NULL, 'ffffg', 0),
(41, 'Ahmed', 'Kolde', '+201090604705', 'arnob@gmail.com', NULL, 0, NULL, '$2y$10$5iFe8OXcg1mB0F.l5EIRReg0RFIXpWg47NxrNw0QkIHWvVImZW7XK', NULL, '2022-07-31 01:49:15', '2022-07-31 01:50:22', '[2,3,9,10,11]', 'fefFL9XWSwynz4vxPXbuwT:APA91bHl8stMUifNuDN2QRuFBWwzMHpsRkw1BlFc_pLN3YG7baLFG9C__F9rd40PRV1SY_EY_NV26ncQlPnGIaWQAMXlZwttgYF2JMZK_aAbD4_n6lnYEyWjs-JJq6Lrp7LC784dDIFd', 1, 0, NULL, NULL, 1, NULL, '1993-07-21', NULL, NULL, NULL, NULL, 'Arnob', 0),
(42, 'Ahmed', 'Monem', '+201151875214', 'ahmedmoniem922@gmail.com', NULL, 0, NULL, '$2y$10$Q2IQl42BkHZL5eDTMPnhmuU4E8WBDr6UKhRMLrboQG.enJsAqn76W', NULL, '2022-07-31 06:41:08', '2022-08-15 21:20:44', '[2,9,11]', '@', 1, 0, NULL, NULL, 1, NULL, '2001-01-09', NULL, NULL, NULL, NULL, 'Monem1', 5),
(43, 'hemoo', 'alii', '+201022222222', 'ibrahem.ahmdsaad@gmail.com', NULL, 0, NULL, '$2y$10$lHL9DJ8tAQgzeTt2AJymCe8D/Ekbx36dM3DNyg7UGKg7sFp9RAsoa', NULL, '2022-08-01 01:35:37', '2022-08-01 01:36:07', NULL, '@', 1, 0, NULL, NULL, 1, NULL, '1963-07-10', NULL, NULL, NULL, NULL, 'alihemoo', 0),
(44, 'Ahmedemo', 'Malke', '+201060907080', 'kosbra@elmaghara.cok', NULL, 0, NULL, '$2y$10$XsPoczcdPUu/YUOj0z3JV.jzP61iUHpgHaxheaNAuZ/AEyyd.WMF2', NULL, '2022-08-01 06:02:31', '2022-08-01 06:03:26', '[2,3,9,10,11]', 'd6mESQVwRDCUmCGoVr8Bcg:APA91bFRCYSy-Hw_QlBZ7YUM1yVN4agironYpmT1fv-mrv9w8ddhJFLoFmRXWaTVOxlGmMiolHCa5U_PbKo0zPj4HCY6vvOcfxXAu7dteUwtxGFM4WCSrwXK_Lzf8Ao8287V3G3Aq1fA', 1, 0, NULL, NULL, 1, NULL, '1993-07-20', NULL, NULL, NULL, NULL, 'Kosbra', 0),
(45, 'ggg', 'fff', '+201088888888', 'ggg@gmail.com', NULL, 0, NULL, '$2y$10$GEZ2C.LqWyXIMkSTmrnL9e/gARBHDxR6WlS/qnDDrcR/uEHPOb2Bu', NULL, '2022-08-02 06:22:49', '2022-08-02 06:25:41', NULL, 'epQfqBzKQW6AI1Qs_KLEbA:APA91bG4Q5VCmYAPycNuk0K291bTX4nJtMnVc-38Zc96jdkUslBBLJDkfQHZHFoILBqC42vh6jBlcljr6lVxr9E5YMhBR0_WbNsWKMq4ruvUXRCLd4mNpP8YnkpOg-pUZMd8KBqXFGV8', 1, 0, NULL, NULL, 1, NULL, '1996-08-08', NULL, NULL, NULL, NULL, 'Rr', 0),
(46, 'Mk', 'Mi', '+201060907040', 'mk@elmaghara.com', NULL, 0, NULL, '$2y$10$XdxhOWyec/8Nn9vWgPuiIOeqV3KRh63icMXV1cOAimxuAzwmJ.ici', NULL, '2022-08-02 07:37:03', '2022-08-03 08:56:52', '[2,9,11]', 'fPQRIBKYSsSuR-uU2jtDSU:APA91bFZdAOGkuaNetT1-i_sYKmfCyusW65Gxi0t0-W-il_46eHZqSY8fdYmsc6C4_P-v9HdRjnwQvzggwf0_M6sisg2A36SD_2q0yENmGgskDegx_BkTgI_uPLyE4xfO9o1STzxBd7K', 1, 0, NULL, NULL, 1, NULL, '1990-08-22', NULL, NULL, NULL, NULL, 'Mk', 0),
(47, 'fff', 'last', '+201099999999', 'erasf@ffasdf.com', NULL, 0, NULL, '$2y$10$vnpddlEdo7sCjIG99ncjR.SAbbVeaUBx8v4PGQp8YXw3Humqvk8vi', NULL, '2022-08-03 21:32:22', '2022-08-03 21:40:34', NULL, 'ctXN63EvQ--tRKHE9qhT6I:APA91bGYXRAMJ2-u1UZRGL02SDN3p2-tkoHGVyrlyyiphL8CVMzv3DMARc0sjmbvtA0hHFunys6Zgp_laWH55AtPHl25nH-z5YREm1ne1VxrSCG763Kctliab5dYdrGoFtYG4xBlcbv4', 1, 0, NULL, NULL, 1, NULL, '333333', NULL, NULL, NULL, NULL, 'sadfasdf', 0),
(48, 'g', 'g', '+201098765653', 'eng.ibrahem01adfadf73@gmail.com', NULL, 0, NULL, '$2y$10$HIs5TaUE9PdhNhsP47qkSOGDHZFHUZRblxxuzXAiz9t7Be1hCn08.', NULL, '2022-08-04 18:33:44', '2022-08-04 18:34:23', NULL, '@', 1, 0, NULL, NULL, 1, NULL, '2022-08-04', NULL, NULL, NULL, NULL, 'gdfg', 0),
(49, 'gfgg', 'gfg', '+201099999987', 'enga.iasdf@gd.com', NULL, 0, NULL, '$2y$10$41ANcwbwen8jQc1pO8t/6Oqn6XNilxhSoQpMzmZBM9SNZm8JZL2Py', NULL, '2022-08-04 18:37:53', '2022-08-04 18:39:08', NULL, '@', 1, 0, NULL, NULL, 1, NULL, '1954-08-11', NULL, NULL, NULL, NULL, 'sdfg', 0),
(50, 'dsfa', 'dsf', '+201087788999', 'ekmfads@sdkf.com', NULL, 0, NULL, '$2y$10$Q/tYaj3v1LLVLlsW1v5jGuoc8XElbCODrMIklf3zvjSP1wCW7sfaG', NULL, '2022-08-04 18:42:07', '2022-08-04 18:43:03', NULL, '@', 1, 0, NULL, NULL, 1, 0, '1973-04-04', 'vv', 'sdfg', 'sdfg', 'sdfg', 'asdf', 0),
(51, 'fasdff', 'asdf', '+201088787878', 'ejlsdfa@af.com', NULL, 0, NULL, '$2y$10$cNMgY8SGIKngNh/UwXFfAuOnBnLRsTm1RqhwZX7JTMf7b6SS9PFG6', NULL, '2022-08-04 18:44:45', '2022-08-04 18:45:06', NULL, 'ctXN63EvQ--tRKHE9qhT6I:APA91bGYXRAMJ2-u1UZRGL02SDN3p2-tkoHGVyrlyyiphL8CVMzv3DMARc0sjmbvtA0hHFunys6Zgp_laWH55AtPHl25nH-z5YREm1ne1VxrSCG763Kctliab5dYdrGoFtYG4xBlcbv4', 1, 0, NULL, NULL, 1, NULL, '1951-08-15', NULL, NULL, NULL, NULL, 'sdf', 0),
(52, 'Ahmed', 'Lob', '+201020202020', 'lob@lob.com', NULL, 0, NULL, '$2y$10$JEQ7dvFasQ2D0ckVZLkrcePjbARRnfgTwqKgE1oRwY6YuqfIfvK4m', NULL, '2022-08-07 17:25:41', '2022-08-08 18:46:34', '[2,3,9,10,11,12]', 'c0zhC5yJSH2-3YaFgbtHai:APA91bEwM9qunJJHAr-ToCgRmd0hJZAslZtTGDa3KQuUe6QMAReNjvYsZ0Zs6dGlb3qlZBInKDDRxh2coDliItzz3gjLxLMsR8vbI-T8NEu4-uQZZnGBs4KcB0ExkiUSLaZmzRx9RGyD', 1, 5, NULL, NULL, 4, NULL, '1998-08-24', NULL, NULL, NULL, NULL, 'Lob', 0),
(53, 'abdelhamid', 'elsayed', '01095971895', 'abdelhamid@gmail.com', NULL, 0, NULL, '$2y$10$Plv9svBiMAZRWYIxMYpmAe4JkFJN9hLtTEKhXwy63IbiYD7yzl0Vm', NULL, '2022-08-30 03:36:24', '2022-08-30 03:36:24', NULL, 'clvitvBnTJGhmtSqz1yG61:APA91bHPhH3l6hYgC6IoEJebTvtcalLmgTjv3X7nmestCYLsYKiaxf5G9YI0JEWo87SV-rARvSsaswBNRArJhOSImnw3Z965L2CILXUqE-DPDCxcisbQdJ5DN-sqcuCUQTNLlMIftK8-', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'abdelhamid', NULL),
(54, 'Ahmed', 'Moler', '+201050505050', 'soso@gmail.com', NULL, 0, NULL, '$2y$10$EttGRko.2a/mK3E5W.K6suGB2xszdBsQz.CnPjpx46bpHc2lmNE9a', NULL, '2022-09-18 09:20:22', '2022-09-18 09:20:47', '[2,3,9,10,11,12,13]', 'cxgdhF44SZmR_i6PViAm5t:APA91bEdipYERaP8lssbQT24CprVbiE40go_f-_ODD5CwKa4629S_HBh9MeqC0koC1oE9X3uY4Nba2qQNP65aUAwOk-Y8Gd2ITx23y-kMZEz0bIrvFHKYPO0RWw3H4UTu0UviYE0nQWn', 1, 0, NULL, NULL, 4, 0, '1981-09-10', NULL, NULL, NULL, NULL, 'Soso', NULL),
(55, 'sayed', 'ashrf', '+201093152235', 'ssayedaashrf@gmail.com', NULL, 0, NULL, '$2y$10$SpxRfIJN3Kif6ziAqY0yDOP1YBU9ZUJNn3ACAcSyitZdENLZgMif2', NULL, '2022-09-20 00:47:10', '2022-10-05 23:27:05', NULL, 'eSTOt3jdQQG0MEdVYZqGz6:APA91bGR-yWxSRIv8HEGV5W2BHriZrHj1kZLhhEjuyhZCl4emDclvfYMnOdSEh9Wa_S5reIeo4bJxtFjIbW34YOTJVte29KsWTzSblKDSrA6C2FowVv6bJ7Xqr-vQk1gSksMLoHk4tVe', 1, 0, NULL, NULL, 1, 1, '1999-06-01', NULL, NULL, NULL, NULL, 'sayed123', NULL),
(56, 'Ahmed', 'Emko', '+201020405060', 'emko@em.com', NULL, 0, NULL, '$2y$10$mlFLkLevJMAPkhCIJKO/IOTmswf8S2cnNZZwa0hWgTQGBDGu9mIde', NULL, '2022-09-23 21:58:50', '2022-09-28 02:41:59', '[2,3,9,10,11,12,13]', 'f268JI1XQUmPrzMupogPpJ:APA91bHi4pVjaLCvxqbKUlrdSS5TSfbqP1hkWkFgoVK7JllMmK4i-n1e0SiHHZiEzARf99x65bjyBHCNNWUTApyRViUw23aJ6tZF2dW9w8bopGkqTuHAoLSTTveSCRh-E8cUdAhPghIS', 1, 2, NULL, NULL, 4, NULL, '1993-09-22', NULL, NULL, NULL, NULL, 'Emko', NULL),
(57, 'Klem', 'Loker', '+201020304050', 'aorr@gmaol.com', NULL, 0, NULL, '$2y$10$sES0oXRecgrPQwxL26XlruSPZvIdud4MChVMUu0WhB0e5yINDvFTK', NULL, '2022-10-06 01:55:41', '2022-10-06 01:57:34', '[2,3,9,10,11,13]', 'c4qB5FHfTnaGscpZTgCerS:APA91bF79SSiRBAdcC8wJvYr_M58My7p7ZCrjy4qj5VM-XAK2URRO6FYCpMrkl_LQcmUAqg1F8wMDPVLEnfCHpeHrwweY5qA7LDXywI65nHboesleKj-xNeG06gumYRVqu8-QJP5Bdul', 1, 0, NULL, NULL, 4, 0, '1996-11-21', NULL, NULL, NULL, NULL, 'Sorry', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 9, NULL, NULL, '2022-07-03 09:25:19', '2022-07-03 09:25:19'),
(2, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-03 09:25:19', '2022-07-03 09:25:19'),
(3, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 20, NULL, NULL, '2022-07-11 12:30:27', '2022-07-11 12:30:27'),
(4, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-11 12:30:27', '2022-07-11 12:30:27'),
(5, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 21, NULL, NULL, '2022-07-11 19:59:03', '2022-07-11 19:59:03'),
(6, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-11 19:59:04', '2022-07-11 19:59:04'),
(7, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-07-13 09:52:54', '2022-07-13 09:52:54'),
(8, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100004,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-13 09:52:54', '2022-07-13 09:52:54'),
(9, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 23, NULL, NULL, '2022-07-13 10:16:47', '2022-07-13 10:16:47'),
(10, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100005,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-13 10:16:47', '2022-07-13 10:16:47'),
(11, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}', 1, 5, NULL, NULL, '2022-07-13 11:58:41', '2022-07-13 11:58:41'),
(12, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100006,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-13 11:58:41', '2022-07-13 11:58:41'),
(13, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}', 1, 6, NULL, NULL, '2022-07-13 11:58:45', '2022-07-13 11:58:45'),
(14, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100007,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-13 11:58:45', '2022-07-13 11:58:45'),
(15, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 25, NULL, NULL, '2022-07-15 22:45:03', '2022-07-15 22:45:03'),
(16, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100008,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-15 22:45:03', '2022-07-15 22:45:03'),
(17, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2022-07-15 23:16:08', '2022-07-15 23:16:08'),
(18, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100009,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-15 23:16:09', '2022-07-15 23:16:09'),
(19, '{\"title\":\"Suspended\",\"description\":\"Your account has been blocked! Please contact to our customer care.\",\"order_id\":\"\",\"image\":\"\",\"type\":\"block\"}', 1, 6, NULL, NULL, '2022-07-17 01:26:43', '2022-07-17 01:26:43'),
(20, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-07-18 15:52:23', '2022-07-18 15:52:23'),
(21, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100010,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-07-18 15:52:24', '2022-07-18 15:52:24'),
(22, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 43, NULL, NULL, '2022-08-01 22:50:13', '2022-08-01 22:50:13'),
(23, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100011,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2022-08-01 22:50:13', '2022-08-01 22:50:13'),
(24, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 43, NULL, NULL, '2022-08-07 17:16:21', '2022-08-07 17:16:21'),
(25, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 3, NULL, '2022-08-07 17:16:21', '2022-08-07 17:16:21'),
(26, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-07 17:27:37', '2022-08-07 17:27:37'),
(27, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100012,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-08-07 17:28:18', '2022-08-07 17:28:18'),
(28, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-07 17:28:45', '2022-08-07 17:28:45'),
(29, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 7, NULL, '2022-08-07 17:28:45', '2022-08-07 17:28:45'),
(30, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2022-08-07 17:29:24', '2022-08-07 17:29:24'),
(31, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-07 17:55:36', '2022-08-07 17:55:36'),
(32, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 7, NULL, '2022-08-07 17:55:36', '2022-08-07 17:55:36'),
(33, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-08 06:35:51', '2022-08-08 06:35:51'),
(34, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100013,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-08-08 06:36:27', '2022-08-08 06:36:27'),
(35, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-08 06:39:53', '2022-08-08 06:39:53'),
(36, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 7, NULL, '2022-08-08 06:39:54', '2022-08-08 06:39:54'),
(37, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-08 17:47:57', '2022-08-08 17:47:57'),
(38, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100014,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 3, '2022-08-08 17:50:30', '2022-08-08 17:50:30'),
(39, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 3, '2022-08-08 17:55:52', '2022-08-08 17:55:52'),
(40, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-08 17:55:59', '2022-08-08 17:55:59'),
(41, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 7, NULL, '2022-08-08 17:55:59', '2022-08-08 17:55:59'),
(42, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-08 17:57:37', '2022-08-08 17:57:37'),
(43, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100015,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-08-08 18:04:13', '2022-08-08 18:04:13'),
(44, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2022-08-08 18:36:35', '2022-08-08 18:36:35'),
(45, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-08 18:37:29', '2022-08-08 18:37:29'),
(46, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 7, NULL, '2022-08-08 18:37:29', '2022-08-08 18:37:29'),
(47, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100016,\"image\":\"\",\"type\":\"order_status\"}', 1, 52, NULL, NULL, '2022-08-09 06:39:28', '2022-08-09 06:39:28'),
(48, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}', 1, 56, NULL, NULL, '2022-09-26 23:26:15', '2022-09-26 23:26:15'),
(49, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100017,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-09-26 23:29:25', '2022-09-26 23:29:25'),
(50, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2022-09-26 23:30:54', '2022-09-26 23:30:54'),
(51, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}', 1, 56, NULL, NULL, '2022-09-26 23:31:01', '2022-09-26 23:31:01'),
(52, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100017,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 6, NULL, '2022-09-26 23:31:01', '2022-09-26 23:31:01'),
(53, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100018,\"image\":\"\",\"type\":\"order_status\"}', 1, 55, NULL, NULL, '2022-09-26 23:36:25', '2022-09-26 23:36:25'),
(54, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100019,\"image\":\"\",\"type\":\"order_status\"}', 1, 56, NULL, NULL, '2022-09-26 23:56:34', '2022-09-26 23:56:34'),
(55, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100020,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-09-27 03:45:41', '2022-09-27 03:45:41'),
(56, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100021,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-09-27 03:46:55', '2022-09-27 03:46:55'),
(57, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100021,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-09-27 03:52:02', '2022-09-27 03:52:02'),
(58, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100021,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2022-09-27 03:53:12', '2022-09-27 03:53:12'),
(59, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100021,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-09-27 03:53:50', '2022-09-27 03:53:50'),
(60, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100021,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 6, NULL, '2022-09-27 03:53:50', '2022-09-27 03:53:50'),
(61, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100022,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-09-27 03:55:44', '2022-09-27 03:55:44'),
(62, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100022,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-09-27 03:56:18', '2022-09-27 03:56:18'),
(63, '{\"title\":\"Order\",\"description\":\"You are unassigned from a order\",\"order_id\":\"\",\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-09-27 03:56:31', '2022-09-27 03:56:31'),
(64, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100022,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 3, '2022-09-27 03:56:31', '2022-09-27 03:56:31'),
(65, '{\"title\":\"Order\",\"description\":\"You are unassigned from a order\",\"order_id\":\"\",\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 3, '2022-09-27 03:56:37', '2022-09-27 03:56:37'),
(66, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100022,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 2, '2022-09-27 03:56:37', '2022-09-27 03:56:37'),
(67, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100023,\"image\":\"\",\"type\":\"order_status\"}', 1, 56, NULL, NULL, '2022-09-27 04:19:03', '2022-09-27 04:19:03'),
(68, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100024,\"image\":\"\",\"type\":\"order_status\"}', 1, 56, NULL, NULL, '2022-09-27 04:23:16', '2022-09-27 04:23:16'),
(69, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100024,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 6, NULL, '2022-09-27 04:23:16', '2022-09-27 04:23:16'),
(70, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100024,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 2, '2022-09-27 04:43:26', '2022-09-27 04:43:26'),
(71, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100024,\"image\":\"\",\"type\":\"order_status\"}', 1, 56, NULL, NULL, '2022-09-28 02:41:56', '2022-09-28 02:41:56'),
(72, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100024,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 6, NULL, '2022-09-28 02:41:57', '2022-09-28 02:41:57'),
(73, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100025,\"image\":\"\",\"type\":\"order_status\"}', 1, 55, NULL, NULL, '2022-09-30 16:47:51', '2022-09-30 16:47:51'),
(74, '{\"title\":\"Suspended\",\"description\":\"Your account has been blocked! Please contact to our customer care.\",\"order_id\":\"\",\"image\":\"\",\"type\":\"block\"}', 1, 36, NULL, NULL, '2022-10-03 03:45:10', '2022-10-03 03:45:10'),
(75, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100026,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-10-06 04:54:02', '2022-10-06 04:54:02'),
(76, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100026,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 8, NULL, '2022-10-06 04:54:02', '2022-10-06 04:54:02'),
(77, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100026,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 4, '2022-10-06 04:54:41', '2022-10-06 04:54:41'),
(78, '{\"title\":\"Suspended\",\"description\":\"Your account has been blocked! Please contact to our customer care.\",\"order_id\":\"\",\"image\":\"\",\"type\":\"block\"}', 1, 6, NULL, NULL, '2022-10-10 18:07:16', '2022-10-10 18:07:16'),
(79, '{\"title\":\"Order\",\"description\":\"\\u0627\\u0644\\u0637\\u0644\\u0628 \\u0645\\u0639\\u0644\\u0642 \\u0627\\u0644\\u0623\\u0646\",\"order_id\":100027,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-10-10 18:11:50', '2022-10-10 18:11:50'),
(80, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100027,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 4, '2022-10-10 18:12:22', '2022-10-10 18:12:22'),
(81, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100027,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 4, '2022-10-10 18:12:58', '2022-10-10 18:12:58'),
(82, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100027,\"image\":\"\",\"type\":\"order_status\"}', 1, 30, NULL, NULL, '2022-10-10 18:14:18', '2022-10-10 18:14:18'),
(83, '{\"title\":\"Order\",\"description\":\"\\u0637\\u0644\\u0628\\u0643 \\u062e\\u0631\\u062c \\u0645\\u0639 \\u0627\\u0644\\u062f\\u0644\\u064a\\u0641\\u0631\\u064a\",\"order_id\":100027,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, 8, NULL, '2022-10-10 18:14:18', '2022-10-10 18:14:18'),
(84, '{\"title\":\"Order\",\"description\":\"Ready for delivery\",\"order_id\":100026,\"image\":\"\",\"type\":\"order_status\"}', 1, NULL, NULL, 4, '2022-10-10 18:17:30', '2022-10-10 18:17:30');

-- --------------------------------------------------------

--
-- بنية الجدول `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(1, 'ahmed', 'emam', '01096816074', 'ahmed.ziate@gmail.com', NULL, '$2y$10$92oYo2UuwkLhpgQrkCSINul0r5NRR4VZ04NqZx55/ZfNygepwyMbK', NULL, '2022-06-01 09:43:58', '2022-08-01 08:27:19', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, 'Mahmoud', 'Masry', '01111111111', 'Masry@gmail.com', NULL, '$2y$10$zxAEMppLc/LggwVnfKM1XusnohfbA3P8uPx0u3TGZYwlmuyv5R2DW', NULL, '2022-06-21 04:30:09', '2022-08-03 08:54:51', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(3, 'JOKA', 'JOXS', '01022220671', 'HFHJ@gmail.com', NULL, '$2y$10$X1cdoQ.sXZ7Q/fmKUJFo9ujITu9EsSz7YYinxZNYdYiHzhvB.7.yi', 'V93YxupWNR5XXW1OYLaat4O1x8K2YsTBlRHhLOxxsqURWvrhpBQZXSQSgpXw', '2022-06-21 05:18:38', '2022-10-06 05:01:36', NULL, NULL, NULL, NULL, NULL, 1, 'fiIuoiYaSCSMI1eRbH5GRY:APA91bGXzh2_EeU9-Wg5OLBeCryNEqwUXyHxN7YZwWMalVbaMfwVnTqoIHH0E8pOe6-iz1k2x3g0dIdk9M2z2howrKocj0iHHXn4CpKn_U4sOmNnZrw5WQQ5lhth0te4inxxRurv4X1Q', '3ykrAUuTPohFQ2mqG3jX4DsX9JxKIGYclMiKyCiAxdBOXkLgZwzcFYkmvidI4DKNCdLe8giJT6lcczcgaOPKEqVC2kAB3kKDDKU9gBXiBfS8ISSOno8yXQio'),
(4, 'Tets1', 'Test', '01096816001', 'test1test@elmaghara.com', NULL, '$2y$10$QunJL.JTcJ0TWNnqF3NcFe8x7QxYUAtCcw7xPsFUfxv1r1AHjHBH.', 'xI95VVCuXLWZwJurfo6vGS3adUrvmjdIuCMfXpoyP0WWdvJJRH75RLbwQgSC', '2022-07-05 09:23:35', '2022-08-01 08:28:17', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(5, 'Ahmed', 'Test', '01096816004', 'testtesttest@test.com', NULL, '$2y$10$1DNFDBFCHCiYFHAI0xXtVe5t8cRgS8.6YKVeAQrdiCy1uFSdJVfIO', NULL, '2022-07-05 09:25:12', '2022-08-06 19:40:32', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(6, 'amira', 'ibrahim', '0151548488', 'emam2@gmail.com', NULL, '$2y$10$6lKDElB4VFgD.0D3jg7Sdux/Aidk9Rj2kZ26rtX2S22DNM2UZVf26', 'LkiBLdnCN6g6Qt7OEUSL7SRXFJ7RwXs9mxyoT9HOLzvzYLSHtphMAeMVPzjl', '2022-08-04 03:09:01', '2022-09-28 02:54:10', NULL, NULL, NULL, NULL, NULL, 1, 'dB5QHqrbRFOlNI2O3AMDKt:APA91bFZ20JQigyQdrhjdXJO2ykvECnanWyBZ87hBBOBxsQ5N1_rHd6YpRZQzRWcqpB8whNFXTX139pMcuKam3TeN1ZJKkhPpAoMdc_NX8hG4GV-RFgb0lsDHha5t0oSthweliDjNTph', '7qKcQhIUUWCho7jJaAu0s2Cz1WTv3TBnDhtgWbxJMXGmLimKnELsXIVU9gt6VKymIqKL6SmJpi4nXpZLtf7U78eUKVv2kg9M49074AZSkhTOf1lq7mehTXqr'),
(7, 'احمد', 'امام', '01096816088', 'emam1@gmail.com', NULL, '$2y$10$UMI7TtqEWYxg.IU.QNDHpuA/1lFypFIjMBpZQisI6Y2Ao.kNaOfZi', NULL, '2022-08-07 17:21:05', '2022-09-23 22:13:14', NULL, NULL, NULL, NULL, NULL, 1, '@', '4TgQtm6awBj7u0BOIHzxqPI9O1i9pwg6th5p3x2dFUjGCP9h3MWzWYtZl1v4hDNHwAGpRcuWQ688bYJVF1ROzqLdZkISeT26OB7Q7MgJBCXiMpZzyIbye6vy'),
(8, 'jjj', 'jjjj', '01111234567', 'kjd@gs1.com', NULL, '$2y$10$JSt4MYT71aJ/b7zCrrwSHuuM7l51T3V2EQpI6yaMrdf1yLeQk94pW', NULL, '2022-09-29 18:45:30', '2022-10-02 18:27:09', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `food_id`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(6, 7, NULL, '2022-06-26 09:54:24', '2022-06-26 09:54:24', 3),
(9, 8, 10, '2022-07-05 11:35:47', '2022-07-05 11:35:47', NULL),
(12, 5, 17, '2022-07-13 06:46:00', '2022-07-13 06:46:00', NULL),
(13, 42, 28, '2022-08-03 09:10:55', '2022-08-03 09:10:55', NULL),
(17, 42, 30, '2022-08-04 01:03:01', '2022-08-04 01:03:01', NULL),
(18, 54, 42, '2022-09-21 17:51:11', '2022-09-21 17:51:11', NULL),
(19, 55, 27, '2022-09-21 18:33:49', '2022-09-21 18:33:49', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(1, 'مصر', 0x000000000103000000010000000c000000595d3dddefc23e401e332c739dca3d40595d3dddafc53f40a63df597515b3d40f3ae9eeea32540400461568f92673d40acae9eeecf8f404095615391dd9f3d40f3ae9eee6b7b40406a2295f093453e40f3ae9eee5339404035cf4a6645d33e40e55d3ddd57d23f404ea7900540253f40e55d3dddb7453f40dc617a08884a3f40e55d3ddde7bb3e4079a9d8208d7a3f40595d3ddd9f4f3e40c588cbf626603f40595d3ddddf2d3e403b0c2f11eedc3e40595d3dddefc23e401e332c739dca3d40, 1, '2022-05-25 04:27:49', '2022-06-26 16:17:38', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man'),
(2, 'عين شمس', 0x000000000103000000010000000f0000000814fb15fc3d3f4020bfb06177253e407f14fb5531413f4084f1233d9f1b3e405714fb954f4c3f407f727a83e1153e402214fb9592543f4029997ddd16113e40dc13fb9586603f408515eceb3e143e401514fb5537683f405e5f15a848143e400414fb55b86e3f40ceb01c626c1f3e40fb13fbd590703f4006708298c2293e403d14fb15f96d3f408caa0e4672303e407614fbd599673f40ebe1a4cd92323e406014fb15275e3f40303a4a5b7f323e408714fbd5684d3f40c76e7e604b303e404e14fb15e8423f406aa9de173b2f3e406014fb15373f3f40ab6ac4e00c283e400814fb15fc3d3f4020bfb06177253e40, 1, '2022-06-01 09:38:04', '2022-06-21 05:21:13', 'zone_2_restaurant', 'zone_2_customer', 'zone_2_delivery_man'),
(3, 'Heliopolis', 0x000000000103000000010000001f0000005626cb69ad5c3f40737d0b53e4203e40c225cbc9d7593f4025b35e814d203e40b926cbc9c9583f40c1b8d369c01f3e40f925cba91e513f405bd4fcff92193e402c26cbc9f14e3f4071a65cdee1173e400b26cba96d4d3f400facad62aa163e408b26cb69fa4b3f4093326c3bd4153e40db25cb69244f3f40a5aa33c752163e40f125cb2927503f40f5d5b89859173e40ac25cb0935533f40941b2fc177153e408026cb09e9533f405991471790153e40cd25cb29b9543f40670a5a6da8153e402826cb097e553f406d236b5dcf153e40e325cbe9bb553f409c2c648113163e40d825cb890a583f4070991ebce5143e400926cbc9f35b3f40cb83024189143e400426cb09e05c3f40a778a52420153e401626cb09cf5e3f4020cedcdc4f173e401626cb099f613f4046601f8880173e40ec25cb69f3613f4092b257563e183e400726cbe909623f40c5b4b789a4183e405f26cbe944633f406194afda721a3e40c225cbc947623f40c8b6e400461c3e40c426cb29bb613f401ff660b6e11c3e40af25cbe9ce603f406d206f52a71c3e40a726cbc94a5f3f40bae31648f31b3e408f26cb29be5e3f4066aaa177591c3e405f26cbe9a45d3f4052b9a3ddd91d3e40cd25cb29295d3f40f8ddcde8441e3e40b226cb29fc5c3f40e630eb2d35203e405626cb69ad5c3f40737d0b53e4203e40, 1, '2022-06-21 05:05:11', '2022-06-21 05:06:10', 'zone_3_restaurant', 'zone_3_customer', 'zone_3_delivery_man'),
(4, 'القلج', 0x000000000103000000010000000b000000f6d8946b5c593f409693e49515373e40a1d994ab1e573f40a0f61beecd2e3e4052d9942b0b543f40247cbd28252c3e40f1d894ab78573f4014ea69a588253e4040d9942b5c5d3f4090aa8d23b3273e409dd994eb7a603f40017aa7ab212a3e4098d9942b37643f40c17ee479352d3e4068d994eb1d633f40b771ede852303e40fad8942b105e3f404dfec5de4f343e40aed994ebf9593f405ba9c86d49363e40f6d8946b5c593f409693e49515373e40, 1, '2022-08-07 17:19:29', '2022-08-07 17:19:29', 'zone_4_restaurant', 'zone_4_customer', 'zone_4_delivery_man'),
(5, 'Nasr City', 0x00000000010300000001000000320000002229824e25513f40fc73d9f49f143e409b29826e14513f403be8859e87143e406a29823e36503f40ba49fab9f0133e40832982ce87503f40df38074d6d133e40ec28825e33513f4082aac21e97123e404829822ebd513f4088dab045d9113e401129824e06523f40fe7a7b3136113e408debf6097a513f406533ed9f1e113e40e3ebf6298b4d3f4009393848130f3e4095ebf6990c4d3f40d0ba8cf3c20e3e40c004055d894c3f4084fdddb0860e3e402505059dff4a3f4002df2e0e2f0e3e40420505fd9f4a3f40ae8288cd000e3e40e204056d024b3f401bbc565efe0d3e40fb0405fd534b3f404722f61f980d3e40e004058d784b3f40d3bf25f6530d3e40ec0405ddbe4b3f404f7226cc0f0d3e400605055dd54b3f40f9cc6a80d00c3e406305051d244c3f40325971f19a0c3e40110505bd564c3f402751882b480c3e40f304057d2c4d3f40ccb2a923c70b3e400905053d2f4e3f40e97e98fa120b3e406405050db94e3f4098cbb9ef010b3e400205059d914f3f40d6a7fbe3280b3e40770505fd6c503f409a3d3c591c0c3e409c223354b0513f4014fe2037be0b3e40f622333475523f40240577b3610b3e40bd22337434533f40ee55ad89ad0a3e40812233d469543f40a158bdac58093e40b086ad6e2e553f40b036e56148083e400786ad0ef6563f40fc6b48ada7073e40e786ad4eb5573f40b1fbd590a5063e407986ad8e47583f40c206b05418063e404f86adee9b583f402e6955d39b063e402686ad4ef0583f40a212850450073e406a86ad6e825b3f406533ba20120a3e40b3be94ed6d5d3f40c7a70e21280c3e4003be94ed67633f40776520a54c123e40bebe944d8f633f409e99e7e2fb123e4020be944d08633f403b07d30840133e4099be946df7623f404b499be58f143e40cebe946d54603f400547444838143e40e0bd94edb95c3f404b499be58f143e40ffbd942de45b3f4081b70bf8b1143e402fbe946d2d5a3f4024b5ad6b59163e404ebe94ad57593f401e25fef720173e409fbe940d25593f40d400f03da9173e40e9bd946d11583f4018c992d849183e40debd940d90573f40cfee183f84183e402229824e25513f40fc73d9f49f143e40, 1, '2022-09-29 18:39:58', '2022-09-29 18:39:58', 'zone_5_restaurant', 'zone_5_customer', 'zone_5_delivery_man');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_food_id_foreign` (`food_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_attendances`
--
ALTER TABLE `event_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_attendances_user_id_foreign` (`user_id`),
  ADD KEY `event_attendances_event_id_foreign` (`event_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fixed_products`
--
ALTER TABLE `fixed_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_configs`
--
ALTER TABLE `mail_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nls`
--
ALTER TABLE `nls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_zone_id_index` (`zone_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`);

--
-- Indexes for table `restaurant_schedule`
--
ALTER TABLE `restaurant_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `used_market_settings`
--
ALTER TABLE `used_market_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `used_products`
--
ALTER TABLE `used_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_zone_id_index` (`zone_id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4030;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_attendances`
--
ALTER TABLE `event_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fixed_products`
--
ALTER TABLE `fixed_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_configs`
--
ALTER TABLE `mail_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `nls`
--
ALTER TABLE `nls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100028;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `restaurant_schedule`
--
ALTER TABLE `restaurant_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `used_market_settings`
--
ALTER TABLE `used_market_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `used_products`
--
ALTER TABLE `used_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `event_attendances`
--
ALTER TABLE `event_attendances`
  ADD CONSTRAINT `event_attendances_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
