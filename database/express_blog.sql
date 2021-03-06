-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2021 at 01:21 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `parent` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `author_id`, `post_id`, `user_name`, `user_email`, `user_url`, `comment`, `created_at`, `status`, `parent`) VALUES
(2, 8, 1, 'میلاد تقی پور', 'miladtaghipour1369@gmail.com', 'mmta.ir', 'مطلب بسیار عالی', '2021-07-21 19:51:19', 2, 0),
(3, 8, 2, 'میلاد تقی پور', 'mmta@gmail.com', 'mmta.ir', '!@#$%^&*)(', '2021-07-21 19:51:19', 1, 0),
(4, 9, 3, 'علی معصومی', 'ali@gmail.com', 'ali.ir', 'مطلب مورد قبول', '2021-07-21 19:51:19', 0, 0),
(5, NULL, 1, 'کاربر مهربان', 'user1990@gmail.com', '', 'سلام دوستان عزیز\r\nمطلب واقعا عالی بود\r\n\r\nسپاس بیکران', '2021-08-05 18:23:24', 2, 0),
(7, NULL, 1, 'کاربر نامهربان', 'baduser1990@gmail.com', '', 'سلام\r\nاصلا خوب نبود', '2021-08-05 18:27:00', 2, 0),
(9, NULL, 1, 'کاربر مهربان', 'user1990@gmail.com', 'www.xxx.com', 'Good !', '2021-08-21 09:35:10', 1, 5),
(10, NULL, 1, 'دکتر آوند', 'avand.loghman@gmail.com', '', 'آفرین میلاد جان.', '2021-08-21 10:13:29', 2, 0),
(11, NULL, 1, 'میلاد تقی پور', 'miladtaghipour1369@gmail.com', '', 'سپاس دکتر عزیز.', '2021-08-21 10:33:29', 2, 10),
(12, NULL, 1, 'دکتر آوند', 'avand.loghman@gmail.com', '', 'خواهش می کنم مهندس.', '2021-08-21 11:33:29', 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `thumbnail` text DEFAULT NULL,
  `comments` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `title`, `slug`, `content`, `status`, `created_at`, `views`, `thumbnail`, `comments`) VALUES
(1, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(2, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(3, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(13, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(20, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(21, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(22, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(23, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(24, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(25, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(26, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(27, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(28, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(29, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(30, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(31, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(32, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(33, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(34, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(35, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(36, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(37, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(38, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(39, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(40, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(41, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(42, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(43, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(44, 8, 'مطلب اصلی', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-07-18 20:27:59', 369, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(45, 8, 'مطلب فرعی', 'mmta@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 1, '2021-07-19 20:27:59', 258, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(46, 9, 'مطلب جدید من ویرایش شده', 'mmta@gmail.com', 'مطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید منمطلب جدید من', 0, '2021-07-20 12:55:19', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(47, 10, 'مطلب جدید من 2', 'ali@gmail.com', 'مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2مطلب جدید من 2', 1, '2021-07-22 15:07:46', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(48, 8, 'آخرین مطلب', 'miladtaghipour1369@gmail.com', 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.', 2, '2021-08-05 12:05:00', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(52, 8, 'مطلب جدید من با تصویر', 'miladtaghipour1369@gmail.com', 'مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر مطلب جدید من با تصویر', 2, '2021-08-25 11:30:05', 0, '3c7143be-1f34-4c24-897b-bfd5b7f99f20.jpg', 0),
(54, 8, 'مطلب جدید من با تصویر 2', 'miladtaghipour1369@gmail.com', 'مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 مطلب جدید من با تصویر 2 ', 2, '2021-08-25 11:47:27', 0, '862589c4-d735-49e0-b138-2801b227572f.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('QMNDciKmuxQfqd8W72YChJV14NtOOLaw', 1629890605, '{\"cookie\":{\"originalMaxAge\":600000,\"expires\":\"2021-08-25T11:23:24.817Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_name` varchar(100) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`) VALUES
(1, 'website_title', 'بلاگ اشتراک گذاری دیدگاه ها'),
(2, 'website_description', 'بلاگ اشتراک گذاری دیدگاه ها با زبان برنامه نویسی JavaScript و MYSQL و NodeJS و Express'),
(3, 'posts_per_page', '3'),
(4, 'users_can_submit_comment', '1'),
(5, 'users_can_register', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `role` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `description`, `created_at`, `role`) VALUES
(8, 'میلاد تقی پور', 'miladtaghipour1369@gmail.com', '$2b$10$Kl09uOLxRF63tPNqq3IYUOlaIh9BgpCriwS7ME/krsH4iEWO734zG', 'بیرون زتو نیست آنچه در عالم هست، از خود بطلب هر آنچه خواهی که تویی', '2021-07-26 12:22:39', 2),
(9, 'علی معصومی', 'ali1369@gmail.com', '$2b$10$n2Q38T6Vd5juiZecdYKz1.qbB2hhyeaApDV/DZStW.dYLZH/cwy8i', NULL, '2021-07-26 12:23:08', 1),
(10, 'معین عراقی', 'moein1370@gmail.com', '$2b$10$/58XCQVtplDrvWw5Kxi42.9qJULIYcT1Mt2l/27vFRLcwAnPMLRb.', NULL, '2021-07-26 12:23:20', 0),
(11, 'علی میرزایی پور', 'alimir1369@gmail.com', '$2b$10$J/laxa8dYYIlm.JNKvO4HuKPL394V/p6GG1ISIEhba1ESoBuygsaG', NULL, '2021-07-26 12:24:37', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Final Edition