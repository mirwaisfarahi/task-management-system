-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2021 at 08:03 AM
-- Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.33-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(512) NOT NULL,
  `type` varchar(128) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_title` varchar(1024) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `task_title` varchar(1024) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `comment` text,
  `archieve_id` int(11) DEFAULT NULL,
  `archieve_title` varchar(1024) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(1024) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `file_name` varchar(1024) DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `milestone` varchar(1024) DEFAULT NULL,
  `activity` varchar(28) NOT NULL,
  `message` varchar(1024) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `workspace_id`, `user_id`, `user_name`, `type`, `project_id`, `project_title`, `task_id`, `task_title`, `comment_id`, `comment`, `archieve_id`, `archieve_title`, `report_id`, `report_title`, `file_id`, `file_name`, `milestone_id`, `milestone`, `activity`, `message`, `date_created`) VALUES
(30, 1, 1, 'Main Admin', 'Project', 22, 'جلسه هئیت رهبری', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Updated', 'Main Admin Updated Project جلسه هئیت رهبری', '2021-07-02 10:16:10'),
(31, 1, 1, 'Main Admin', 'Project', 22, 'جلسه هئیت رهبری', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Updated', 'Main Admin Updated Project جلسه هئیت رهبری', '2021-07-02 10:16:28'),
(32, 1, 1, 'Main Admin', 'Project', 22, 'جلسه هئیت رهبری', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Updated', 'Main Admin Updated Project جلسه هئیت رهبری', '2021-07-02 10:20:58'),
(33, 1, 1, 'Main Admin', 'Project', 23, 'آزمایش', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Created', 'Main Admin Created Project آزمایش', '2021-07-26 11:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` text,
  `pinned` tinyint(4) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `archieve`
--

CREATE TABLE `archieve` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `title` varchar(1024) NOT NULL,
  `archieve_type` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `archieve_media`
--

CREATE TABLE `archieve_media` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `original_file_name` text NOT NULL,
  `file_name` text NOT NULL,
  `file_extension` varchar(64) NOT NULL,
  `file_size` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_groups`
--

CREATE TABLE `chat_groups` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `no_of_members` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_group_members`
--

CREATE TABLE `chat_group_members` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT '1',
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_media`
--

CREATE TABLE `chat_media` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `original_file_name` text NOT NULL,
  `file_name` text NOT NULL,
  `file_extension` varchar(64) NOT NULL,
  `file_size` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `comment` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `workspace_id`, `project_id`, `task_id`, `user_id`, `comment`, `date_created`) VALUES
(2, 1, 22, 17, 45, 'امروز ساعت 1 بعد از ظهر ترتیب میگردد', '2021-06-16 07:06:48'),
(3, 1, 22, 17, 16, 'tnx', '2021-06-16 07:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `to` text NOT NULL,
  `attachments` text,
  `status` varchar(28) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `workspace_id`, `subject`, `message`, `to`, `attachments`, `status`, `date_sent`) VALUES
(1, 1, 'digitalization', '<p>salam</p>', 'nawid.shoresh@gmail.com', NULL, '1', '2021-06-16 07:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `text_color` varchar(128) NOT NULL,
  `bg_color` varchar(128) NOT NULL,
  `from_date` timestamp NULL DEFAULT NULL,
  `to_date` timestamp NULL DEFAULT NULL,
  `is_public` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `workspace_id`, `user_id`, `title`, `text_color`, `bg_color`, `from_date`, `to_date`, `is_public`, `date_created`) VALUES
(1, 1, 1, 'demo task', '#ffffff', '#3f0df8', '2021-06-13 19:30:00', '2021-06-13 19:30:00', 1, '2021-06-14 07:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'clients', 'It is used for clients ');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(64) NOT NULL,
  `code` varchar(8) NOT NULL,
  `is_rtl` int(11) DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `code`, `is_rtl`, `date_created`) VALUES
(1, 'english', 'en', 0, '2020-04-25 07:33:40'),
(4, 'dari', 'da', 1, '2021-04-05 09:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `leave_days` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `action_by` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) DEFAULT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT '1',
  `message` text NOT NULL,
  `type` varchar(128) NOT NULL,
  `media` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `workspace_id`, `from_id`, `to_id`, `is_read`, `message`, `type`, `media`, `date_created`) VALUES
(1, 1, 12, 1, 0, 'hi', 'person', '', '2021-04-04 17:06:05'),
(2, 1, 1, 12, 0, 'hello', 'person', '', '2021-04-04 17:06:42'),
(3, 1, 1, 12, 0, 'hru?', 'person', '', '2021-04-04 17:13:35'),
(4, 1, 12, 1, 0, 'im good ', 'person', '', '2021-04-04 17:22:35'),
(5, 1, 12, 1, 0, 'and u', 'person', '', '2021-04-04 17:22:35'),
(6, 1, 12, 1, 0, 'plz complete the task before the deadline. it is urgent.', 'person', '', '2021-04-04 17:22:35'),
(7, 1, 12, 1, 0, 'regards', 'person', '', '2021-04-04 17:22:35'),
(9, 1, 12, 1, 0, 'salam', 'person', '', '2021-04-05 04:32:27'),
(10, 1, 1, 12, 0, 'salam', 'person', '', '2021-04-05 04:32:50'),
(11, 1, 1, 16, 0, 'hi', 'person', '', '2021-06-15 08:09:55'),
(12, 1, 16, 45, 1, 'salam', 'person', '', '2021-06-16 07:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `cost` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `class` varchar(64) NOT NULL DEFAULT 'danger',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `class` varchar(64) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `workspace_id`, `user_id`, `title`, `description`, `class`, `date_created`) VALUES
(1, 1, 1, 'demo note', 'desc', 'bg-info', '2021-06-14 09:02:29'),
(2, 1, 1, 'demo notes 2 of type warning', 'desc', 'bg-warning', '2021-06-14 09:05:44'),
(3, 1, 1, 'demo note 3 of type danger', 'desc', 'bg-danger', '2021-06-14 09:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ids` varchar(1024) NOT NULL,
  `type` varchar(128) NOT NULL,
  `type_id` int(11) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `notification` text,
  `read_by` varchar(512) DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `workspace_id`, `user_id`, `user_ids`, `type`, `type_id`, `title`, `notification`, `read_by`, `date_created`) VALUES
(1, 1, 1, '12', 'project', 1, 'Main Admin assigned you new project <b>demo project</b>.', 'Main Admin assigned you new project - <b>demo project</b> ID <b>#1</b>.', '0', '2021-04-04 16:29:20'),
(2, 1, 1, '13', 'project', 2, 'Main Admin assigned you new project <b>e-gif</b>.', 'Main Admin assigned you new project - <b>e-gif</b> ID <b>#2</b>.', '0', '2021-04-04 16:31:26'),
(3, 1, 1, '12', 'project', 3, 'Main Admin assigned you new project <b>e-gif</b>.', 'Main Admin assigned you new project - <b>e-gif</b> ID <b>#3</b>.', '0', '2021-04-04 17:08:56'),
(4, 1, 1, '12', 'project', 19, 'Main Admin assigned you new project <b>e-gif</b>.', 'Main Admin assigned you new project - <b>e-gif</b> ID <b>#19</b>.', '12', '2021-04-04 17:35:31'),
(5, 1, 1, '13', 'project', 20, 'Main Admin assigned you new project <b>demo e-gif</b>.', 'Main Admin assigned you new project - <b>demo e-gif</b> ID <b>#20</b>.', '0', '2021-04-05 05:05:43'),
(6, 1, 1, '13', 'task', 20, 'Main Admin assigned you new task <b>policy study</b>.', 'Main Admin assigned you new task - <b>policy study</b> ID <b>#15</b> , Project - <b>demo e-gif</b> ID <b>#20</b>', '0', '2021-04-05 05:18:40'),
(7, 1, 1, '13', 'report', 3, 'Main Admin sent you new report <b>e-gif report to minister</b>.', 'Main Admin Sent you new report - <b>e-gif report to minister</b> ID <b>#3</b>.', '0', '2021-04-05 14:59:03'),
(8, 1, 1, '12', 'task', 20, 'Main Admin assigned you new task <b>policy study</b>.', 'Main Admin assigned you new task - <b>policy study</b> ID <b>#15</b> , Project - <b>demo e-gif</b> ID <b>#20</b>', '0', '2021-04-05 16:01:52'),
(9, 1, 1, '12,15', 'project', 21, 'Main Admin assigned you new project <b>task management system</b>.', 'Main Admin assigned you new project - <b>task management system</b> ID <b>#21</b>.', '15', '2021-04-05 17:07:48'),
(10, 1, 1, '15', 'project', 20, 'Main Admin assigned you new project <b>87892</b>.', 'Main Admin assigned you new project - <b>87892</b> ID <b>#20</b>.', '0', '2021-04-05 17:09:46'),
(11, 1, 1, '12,13,14,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45', 'event', 1, 'Main Admin created event <b>demo task</b>.', 'Main Admin created event - <b>demo task</b> ID <b>#1</b>', '16,37', '2021-06-14 07:53:25'),
(12, 1, 45, '60,61,64', 'project', 22, 'Namid Shoresh Minister Secerter assigned you new project <b>جلسه هئیت رهبری</b>.', 'Namid Shoresh Minister Secerter assigned you new project - <b>جلسه هئیت رهبری</b> ID <b>#22</b>.', '60', '2021-06-16 06:51:34'),
(13, 1, 45, '16', 'task', 22, 'Namid Shoresh Minister Secerter assigned you new task <b>جلسه هئیت رهبری</b>.', 'Namid Shoresh Minister Secerter assigned you new task - <b>جلسه هئیت رهبری</b> ID <b>#17</b> , Project - <b>جلسه هئیت رهبری</b> ID <b>#22</b>', '16', '2021-06-16 07:05:54'),
(14, 1, 1, '16', 'project', 23, 'Main Admin assigned you new project <b>آزمایش</b>.', 'Main Admin assigned you new project - <b>آزمایش</b> ID <b>#23</b>.', '0', '2021-07-26 11:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `project_number` varchar(256) DEFAULT NULL,
  `meeting_lead` varchar(1024) DEFAULT NULL,
  `project_type` varchar(1024) NOT NULL,
  `section` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'ongoing',
  `budget` varchar(128) NOT NULL,
  `class` varchar(64) NOT NULL DEFAULT 'info',
  `task_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `workspace_id`, `user_id`, `client_id`, `title`, `project_number`, `meeting_lead`, `project_type`, `section`, `description`, `status`, `budget`, `class`, `task_count`, `comment_count`, `start_date`, `end_date`, `date_created`) VALUES
(22, 1, '1,14,16,45,60,61,64,1,14,45,16', '', 'جلسه هئیت رهبری', '1', 'Minister', 'General', 'Hedayat', 'امروز تدویر گردد', 'ongoing', '0', 'info', 2, 2, '2019-06-01', '2019-06-01', '2021-07-02 10:20:58'),
(23, 1, '16,1,14,45,16', '', 'آزمایش', '00000', 'مقام وزارت', 'مشورتی', 'هدایت', '<p>بذلبیا ی</p><p>لاتلبات</p><p>لتالب</p>', 'ongoing', '200000', 'info', 0, 0, '2021-07-26', '2021-09-17', '2021-07-26 11:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `project_media`
--

CREATE TABLE `project_media` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `original_file_name` text NOT NULL,
  `file_name` text NOT NULL,
  `file_extension` varchar(64) NOT NULL,
  `file_size` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reporting`
--

CREATE TABLE `reporting` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `title` varchar(1024) NOT NULL,
  `report_type` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'ongoing',
  `class` varchar(64) NOT NULL DEFAULT 'info',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_media`
--

CREATE TABLE `report_media` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `original_file_name` text NOT NULL,
  `file_name` text NOT NULL,
  `file_extension` varchar(64) NOT NULL,
  `file_size` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_media`
--

INSERT INTO `report_media` (`id`, `workspace_id`, `type_id`, `user_id`, `type`, `original_file_name`, `file_name`, `file_extension`, `file_size`, `date_created`) VALUES
(3, 1, 3, 1, 'report', 'mcit_logo1.png', 'mcit_logo1.png', '.png', '159.68 KB', '2021-04-05 15:12:19');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `data` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `data`, `date_created`) VALUES
(1, 'web_fcm_settings', '{\"fcm_server_key\":\"AAAAIcyQbpU:APA91bGfTlgH5U67OowXQtVP2ibIRNV4i04YPKp5UT8XxJq09egc9zNGCWttXEPwDNONi5dF9RdfGkuPUKWgsbQQtzCBzrOtrCAW-iQM98zS3orht70rr0wr43HpXUE0kO1iHClQ0jWW\",\"apiKey\":\"YOUR_FCM_API_KEY\",\"projectId\":\"task-management-system-3c14f\",\"authDomain\":\"task-management-system-3c14f.firebaseapp.com\",\"databaseURL\":\"https:\\/\\/task-management-system-3c14f.firebaseio.com\",\"storageBucket\":\"task-management-system-3c14f.appspot.com\",\"messagingSenderId\":\"145165938325\"}', '2021-04-04 17:02:59'),
(2, 'general', '{\"app_url\":\"https:\\/\\/emis.mcit.gov.af\\/\",\"company_title\":\"\\u0648\\u0632\\u0627\\u0631\\u062a \\u0645\\u062e\\u0627\\u0628\\u0631\\u0627\\u062a \\u0648 \\u062a\\u06a9\\u0646\\u0627\\u0644\\u0648\\u062c\\u06cc \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u06cc\",\"full_logo\":\"logo1.png\",\"half_logo\":\"mcit_logo.png\",\"favicon\":\"mcit_logo1.png\",\"php_timezone\":\"Asia\\/Tehran\",\"mysql_timezone\":\"+04:30\",\"currency_full_form\":\"Afghani\",\"currency_symbol\":\"AF\",\"currency_shortcode\":\"AF\",\"hide_budget\":1,\"system_font\":\"default\"}', '2021-04-04 16:43:36'),
(3, 'email', '{\"email\":\"task.mcit@gmail.com\",\"password\":\"Task@1111222112\",\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":\"587\",\"mail_content_type\":\"html\",\"smtp_encryption\":\"tls\"}', '2021-04-04 17:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` varchar(256) DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `task_number` varchar(256) DEFAULT NULL,
  `description` text NOT NULL,
  `priority` varchar(32) NOT NULL,
  `due_date` date NOT NULL,
  `status` varchar(64) NOT NULL DEFAULT 'todo',
  `class` varchar(64) NOT NULL DEFAULT 'success',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `workspace_id`, `project_id`, `user_id`, `milestone_id`, `title`, `task_number`, `description`, `priority`, `due_date`, `status`, `class`, `comment_count`, `start_date`, `date_created`) VALUES
(16, 1, 22, '45', 0, 'جلسه هئیت رهبری', '1', '<p>امروز تدویر گردد</p>', 'high', '2021-07-02', 'todo', 'danger', 0, '2021-06-01', '2021-07-02 10:12:35'),
(17, 1, 22, '16,45', 0, 'جلسه هئیت رهبری', '2', '<p>خاطره تابع </p>', 'high', '0000-00-00', 'todo', 'danger', 2, '0000-00-00', '2021-06-16 07:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) UNSIGNED NOT NULL,
  `version` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`) VALUES
(1, 1),
(2, 1.1),
(3, 1.2),
(4, 1.3),
(5, 2),
(6, 2.1),
(7, 2.2),
(8, 2.3),
(9, 2.4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `workspace_id` varchar(256) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` text,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(256) DEFAULT NULL,
  `zip_code` varchar(56) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `web_fcm` text NOT NULL,
  `last_online` int(11) UNSIGNED NOT NULL,
  `lang` varchar(128) NOT NULL DEFAULT 'english',
  `chat_theme` varchar(256) NOT NULL DEFAULT 'chat-theme-light',
  `profile` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `workspace_id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `address`, `city`, `state`, `zip_code`, `country`, `company`, `phone`, `web_fcm`, `last_online`, `lang`, `chat_theme`, `profile`) VALUES
(1, '1,3,4,5', '103.250.163.214', 'administrator', '$2y$12$5qPJoAzddFQ/sZ6S1a8OqOI7xekl47V2RDOtKKIuVKnTmqFOuN2Q.', 'task.mcit@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1636435077, 1, 'Main', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fU33vyfnhPY:APA91bFbRbZ-2aFvLkOXRjMTAJdILaRuRH4DqR0X9XOEVL6JD5myUq2Z1Cql8WSayJnSm1v1O0mq1aeA99bDeRtiuAWuXKx8a9rbAIqsHoLvjzCrMX8qzf2OnB-lP4-2gwyGofE_nq2z', 1635939108, 'english', 'chat-theme-dark', NULL),
(12, '', '103.28.132.80', 'waisfarahi@gmail.com', '$2y$10$crzbJptBCJgWeYkSOnFzx.5xp4WRBD7Qaq9YFpWHeyQub85pMcVC.', 'waisfarahi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1617553491, 1620460314, 1, 'Mirwais', 'Farahi', 'CDO, MCIT', 'Kabul', '', '', '', NULL, NULL, 'cxmJ3KgGOb4:APA91bFz-3bTGVyspU7IBHSOQH_27iO3F08m6mopH7xn7GqOtGxSviXJnM7JsN6x6R7UiDhu-5G9dhyuoyT6eodvhNPLIrnR3Xe033DwMcuz4azmVNMg8OfO8XXie04AbSZVx3GgePLz', 1620460366, 'english', 'chat-theme-light', NULL),
(13, '', '103.28.132.80', 'mirfarahi92@gmail.com', '$2y$10$Fx4zAOvf77/UCxuwEvYV2.V69LfTUCu8/ed27el59k1EcNzHKxo/m', 'mirfarahi92@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1617553553, NULL, 1, 'Mir', 'Farahi', 'CDO, MCIT', 'Kabul', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(14, '1,3', '180.94.91.88', 'n.jami1353@gmail.com', '$2y$10$e/8f9s2VlFup4.C8zVAzVeuumpQBsWDVH4/xL6CwXZURVe0oTgHEW', 'n.jami1353@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1617615036, 1624880870, 1, 'Naqeebullah', 'Jami', 'Deputy of Plans and Program, MCIT', 'Kabul', '', '', '', NULL, NULL, 'fQAMNrtMzNo:APA91bHU02gLh60Cyw-NPWFndq44vFwGF3k_7MpqNXVfskpXJjxjziY2glh2KEOzwaQQoDe5XpeVPlWvcFnmHb5MmSoWP92fvr_TRpKvjBg1WqPRcyraXhExXyW9kba0kVRXqCIeQfvg', 1619498015, 'dari', 'chat-theme-light', NULL),
(15, '', '103.28.132.223', 'farahi1992@gmail.com', '$2y$10$DD9ec36FBsPrwAg.b2jAue4R67Q.Gc6quttaOCzz03OrcoDvu3AJ.', 'farahi1992@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1617642405, 1617642972, 1, 'Client', 'client', 'mcit', '', '', '', '', 'mcit', '0770616164', '', 0, 'english', 'chat-theme-light', NULL),
(16, '1,3,4', '103.28.133.1', 'tabbykhatera@gmail.com', '$2y$12$0.3Sizv8V.4GO1xXjI17T.zVH3SEK8Hkh71bMkuihr0IxOvFpdHJS', 'tabbykhatera@gmail.com', NULL, NULL, '763f4c86f4bc4db0ad63', '$2y$10$1iHf4tRo8H889TJgIv7O3OFAjoDOVgox1KxSqG9vGF/rYQ4uxzlKS', 1627296420, NULL, NULL, 1618913178, 1623827706, 1, 'khatera', 'Tabby', 'CDO', '', '', '', '', NULL, NULL, 'c8d-jxxTnFI:APA91bEhdL5qa5ud9GQSa7lJsEllbAiWzumk2aKTSYsIXimEqsR4Ex5_791xHE6QimrtZZ65WrMxEWIhWotRDXRqVGb5Uta7HYx-Hl0MrS7yndNxoKYL6Ccw7An_vJXmQvEUVgU5OczL', 1623828060, 'english', 'chat-theme-light', NULL),
(17, '1,3', '180.94.91.88', 'haseebullah.sammiee@gmail.com', '$2y$10$Ncgl2vuTaqiXQk8mGpNeK.qRCBEthz55DiHfXaWdwQKzj0j0eXC.e', 'haseebullah.sammiee@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618977204, NULL, 1, 'حسیب الله سمیعی', 'مدیر اجراییه ریاست تفتیش داخلی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(18, '1,3', '180.94.91.88', 'ah.jawidamarkhil@gmail.com', '$2y$10$rN6fuBQKS27UYFi29O7BIOTQNs559vLDFRQ5wY3HVSUXQbCebrBAO', 'ah.jawidamarkhil@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618977461, NULL, 1, 'احمد جاوید امرخیل', 'مدیر اجراییه ریاست ساینس و نوآوری', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(19, '1,3', '180.94.91.88', 'y_rasoli@yahoo.com', '$2y$10$oCjcg9ZQn6ZmT8QwPEAGsOBaN2kO2H/ZtljbP.RcWR5t9EbyNzmYK', 'y_rasoli@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618977559, NULL, 1, 'محمد یوسف رسولی', 'کارمند ریاست اداری و خدمات', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(20, '1,3', '180.94.91.88', 'solimankrimi33@gmail.com', '$2y$10$NyfYlnIt.ixln1eWuEDGFuyRX3cwLvYMYvEkEKDX5Lfph11a3lni6', 'solimankrimi33@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618977661, NULL, 1, 'محمد سلیمان کریمی', 'مدیر اجراییه ریاست منابع بشری', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(21, '1,3', '180.94.91.88', 'sayidhafiz55@gmail.com', '$2y$10$s3uVlNByY4FYnMjevlHqAuvCUZw8eeyAtDn0dZO4VO.cLGjIfI8zW', 'sayidhafiz55@gmail.com', NULL, NULL, '62d097e9c6224f1f8d08', NULL, NULL, NULL, NULL, 1618977753, NULL, 1, 'سید حفیظ الله حیدری', 'مدیر اجراییه ریاست زیربناء کلید عامه', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(22, '1,3', '180.94.91.88', 'alim.rahimi2015@gmail.com', '$2y$10$K73r4oD4sse.dbak7aqoiuBjUVd6u.eS9nyOuFwn8qMMHfBWfSqjK', 'alim.rahimi2015@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618978032, NULL, 1, 'محمد عالم رحیمی', 'مدیر اجراییه ریاست عمومی ارشد دیجیتلی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(23, '1', '180.94.91.88', 'shaheer.najeeb2@hotmail.com', '$2y$10$GdHsVjkmev4veHAFos1ZQOF7lRdBdzIPFy8b50t2jaVimoLDApfum', 'shaheer.najeeb2@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618978167, NULL, 1, 'احمد شهیر', 'مدیر تعقیب و پیگیری ریاست دفتر', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(24, '1,1,3', '180.94.91.88', 'azida1992@gmail.com', '$2y$10$LX92RsYA.fmMmwIJtryv4e4RCxwnYG5CGsGQnCnNCnwDnHlrZMPTW', 'azida1992@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618978637, NULL, 1, 'اقلیما', 'مدیر اجراییه ریاست نظارت و ارزیابی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(25, '1,3', '180.94.91.88', 'younos.helali178@gmail.com', '$2y$10$Pg8sVKKOOU2SVSMzq1WFc.HS0SN8/huZ1kan42734Kh9Dj5NNip9u', 'younos.helali178@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618978759, NULL, 1, 'محمد یونس', 'مسول پلان گزاری و هماهنگی ریاست پلان و پالیسی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(26, '1,3', '180.94.91.88', 'agareza.nikzad@yahoo.com', '$2y$10$1/keOgen5eFNJPiUx8sLKuNepMB8RLSrvMCRTKs6qRG/Uu5qwyrqK', 'agareza.nikzad@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618979177, NULL, 1, 'اقا رضا نیکزاد', 'نماینده وزیر صاحب', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(27, '1,3', '180.94.91.88', 'tawab2012maz@gmail.com', '$2y$10$2R1WqQRSrZYCswAPoRGjseqt2wQLOmqENnnpvewHP7BfyHT8xb9S.', 'tawab2012maz@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618979311, 1625640017, 1, 'تواب مزیدی', 'مدیر اجراییه پلان و پالیسی', '', '', '', '', '', NULL, NULL, 'd6jI5Dbn0-s:APA91bGKKCB_3tSkuaVE_uVpzKlk9TbLgQ2b2RHLdKjOFPACDCf614PVbvlPtTaDvbY7qrmT3qYJkWmejk7QWYOdjxz24pw_wiYumDYSQeSeENIrjTja3xWuBHAZEzeFX4HbomTqxD7r', 1624693006, 'english', 'chat-theme-light', NULL),
(28, '1,3', '180.94.91.88', 'sheen.peakai53@gmail.com', '$2y$10$P51Xfc2VMZETUpnWRRD.P.TvGyPerGO48/Nny5alca4eem7D/eW3O', 'sheen.peakai53@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618979413, NULL, 1, 'شین پیکی شیرزی', 'مدیر اجراییه ریاست مالی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(29, '1,3', '180.94.91.88', 'nazem.sahel@mcit.gov.af', '$2y$10$XgDYgFIt8drWycxGIG34q.yXIqrEJWH35htyrS/zmW7ok.WjddEjW', 'nazem.sahel@mcit.gov.af', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618979539, NULL, 1, 'محمد نظیم ساحل', 'مدیر اجراییه ریاست امنیت معلومات', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(30, '1,3', '180.94.91.88', 'mohammad.hussaini@mcit.gov.af', '$2y$10$Tp/wlKh7wZR2XnyqbOWqEOZPLV.0BfGv.vhntZjpno9zYtpfFkTPa', 'mohammad.hussaini@mcit.gov.af', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618979628, NULL, 1, 'محمد حسینی', 'سرپرست ریاست امنیت سیستم های معلوماتی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(31, '1,3', '180.94.91.88', 'bilal.sediqee622@gmail.com', '$2y$10$rjVTA5egD3uiYqye/QQCdu.DUARYg4HnlUkQq3QYIhdBp.Z8g3SUy', 'bilal.sediqee622@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618980285, NULL, 1, 'محمد بلال مسکین', 'ریس مخابرات ولایت کابل', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(32, '1,3', '180.94.91.88', 'zabihullah4830@gmail.com', '$2y$10$uHr4UgW3umIICwiid4rIneGX9p3vT9yGIknbfKNKhjzIznmDgf6Z6', 'zabihullah4830@gmail.com', NULL, NULL, NULL, NULL, NULL, 'd8529f5da033502532deef771357b888e24b1201', '$2y$10$ONNLkOM9gz2M03AuF8gFz.ZkGYI/AwIauhAcbtLV8T3BSWXIyvEde', 1618980359, 1618980485, 1, 'ذبیح الله حبیبی', 'ریس مخابرات ولایت بامیان', '', '', '', '', '', NULL, NULL, '', 1618980610, 'english', 'chat-theme-light', NULL),
(33, '1,3', '180.94.91.88', 'arghandwall@yahoo.com', '$2y$10$J6VYnRwfhO3kqgu4XdT8VeNf.w40xqcKtXrggkHZXHNiz4jwp/l3K', 'arghandwall@yahoo.com', NULL, NULL, NULL, NULL, NULL, '1b0fa839d0c70e24c8c3c2e619317dc0a7840354', '$2y$10$3Wwo6Oag/3mRy5AKMQcrweeeJi/vF5dPo9u8TbjJO6I/7hPS1bgXu', 1618980439, 1619053391, 1, 'فیض محمد  ارغند', 'ریس مخابرات ولایت بغلان', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(34, '1,3', '180.94.91.88', 'mtaqipoya44@gmail.com', '$2y$10$b2va5QWxpOjMPpBJ/HNfYOWL5Kww6gSD4E6ht1SuAs2nTr4RNsRj.', 'mtaqipoya44@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618980516, 1619083295, 1, 'mohammad Taqi', 'Poya', 'karti amani mazar e Sharif  Balkh  Afghanistan', 'balkh', 'Mazar e sharif', '1701', 'Afghanistan', '', '0700020172', '', 1619059692, 'english', 'chat-theme-light', NULL),
(35, '1,3', '180.94.91.88', 'zia.ashna2@gmail.com', '$2y$10$wqywOsr7gLeijLFEuaxXqOYnizyB7MnVHZbyA1L9Oi890dpvL7ewi', 'zia.ashna2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618980591, NULL, 1, 'سیدضیاالله  آشنا', 'ریس مخابرات ولایت پنجشیر', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(36, '1,1', '180.94.91.88', 'ghtalash@gmail.com', '$2y$10$ye5.4AWwTTAaxvZ0XyurYeUPv28HQ2M0ebEMYv8WJ6IwKrI491y/2', 'ghtalash@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618980659, NULL, 1, 'عبدالغفور تلاش', 'ریس مخابرات ولایت تخار', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(37, '1,3', '180.94.91.88', 'shahpoordadullah@gmail.com', '$2y$10$HZGfYEhmp1Nb0DHmYWL8MeVSo1ZycKXXDr473BhkomCj.kbNmDS7y', 'shahpoordadullah@gmail.com', NULL, NULL, NULL, NULL, NULL, '0b320ca9824950f3c114643105f7450ec964de4a', '$2y$10$juTI0mybDQkzZq7FyxVmH.4K1N8w9KC0vohwksetkdatKarXCnvUC', 1618980739, 1627712624, 1, 'شاهپور بختیار', 'ریس مخابرات ولایت جوزجان', '', '', '', '', '', NULL, NULL, 'eg3zCEx2AWE:APA91bEGq183-ZokCR0LLfE9tBiS1BQEGtYn_eK-hJAZ66j1Kp2rNO5g69isYvLZ519y-O2hli9JICen_nscH10qnRniYfmoZslKyR29vv2zXA5zH-6D7igiP_2ItCmbI0OX6il14ku6', 1627701168, 'english', 'chat-theme-light', NULL),
(38, '1,3', '180.94.91.88', 'wahedikhalid@gmail.com', '$2y$10$BoUOPPVSeGvgHkFHmMwtxe4cLy.zNuZ41Mp98j/f6HIqMvRhs5Dte', 'wahedikhalid@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618980811, NULL, 1, 'محمد خالد واحدي', 'ریس مخابرات ولایت زابل', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(39, '1,1', '180.94.91.88', 'parwizdanyar@gmail.com', '$2y$10$4cnLyUQo.JKKlxHk7XUV/.KAxRL2TDGO9kYn78aFbOokOm3X.gl52', 'parwizdanyar@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618980887, 1619926676, 1, 'پرویز دانیار', 'ریس مخابرات ولایت غور', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(40, '1,3', '180.94.91.88', 'mamoonrashidrazmal@gmail.com', '$2y$10$ZfMzzAEDcqhGlC97g/ouPe.f63eA.De6Z7g/pTC.DLm.mlEssUFYu', 'mamoonrashidrazmal@gmail.com', NULL, NULL, NULL, NULL, NULL, 'fae6ac39783e47631dca8e4e2a89977a4b73513e', '$2y$10$soJ17RrQFuCnXd/SmcSTCO8kaI9yS0hbi4BxRsDivoQyGQ0JTOFgK', 1618980946, 1618982511, 1, 'مامون الرشید رازمل', 'ریس مخابرات ولایت قندهار', '', '', '', '', '', NULL, NULL, 'fl9me-STR9o:APA91bEQPwvBrUkXOuI8WYLlanlNI3nMCM3y0tNuoYfyEg340LAkY7g8uGOmSPFSAwc9kIjJaMMHDkBySSYPgqsCm7bMl5QNTELQJG75TfT0XyigNy4-GU8QVNCRfq9mYg5kTpmQWU8c', 1618982632, 'english', 'chat-theme-light', NULL),
(41, '1,3', '180.94.91.88', 'm.hamayunshams@gmail.com', '$2y$10$c7zbSVKO.Ai/SnF47vvUHOlKcNrnDyVUG2nQMZEsgCr4NpHoH1cii', 'm.hamayunshams@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618981014, NULL, 1, 'محمد همایون شمس', 'ریس مخابرات ولایت لغمان', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(42, '1', '180.94.91.88', 'mushfiq.mcs@gmail.com', '$2y$10$dqlYVRwmRsHCYM9J11IMf.SjQD0DbG8IxgayerIYVoXGnjHt0yDjO', 'mushfiq.mcs@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618981092, NULL, 1, 'شفیق الله مشفق سلارزی', 'ریس مخابرات ولایت ننگرهار', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(43, '1,3', '180.94.91.88', 'mjnuristani@gmail.com', '$2y$10$occyUvf6sLBrT3zD5MK1I.U/NE3jPzqP2UiognbqCbStDzvDirU22', 'mjnuristani@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618981155, NULL, 1, 'محمدجان نورستانی', 'ریس مخابرات ولایت نورستان', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(44, '1,3', '180.94.91.88', 'alizai.csf@gmail.com', '$2y$10$J.M7juNxqgBtcSTO4qQz5OCqncW6zdqgr3yzvyt7v/WtlJqemqlWm', 'alizai.csf@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618981219, NULL, 1, 'عاشق الله علیزی', 'ریس مخابرات ولایت هرات', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(45, '3,5,1,6', '109.169.72.86', 'nawid.shoresh@gmail.com', '$2y$12$7ucth/4uoenJKzWwcKIbj.w8Qq6dd9byvW4yXnCFvHDgCiRnbJeU2', 'nawid.shoresh@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1618994179, 1624336441, 1, 'Namid Shoresh', 'Minister Secerter', '', 'Kabul', 'on', '', 'Afghanistan', NULL, NULL, 'eUK9_V_4zpU:APA91bG5KdmIKNQQvsc5BtXkBJaOgr3hKhdtReMNiiQOaqrlj_d8EX8IffRv-Z3z2LUQ5dbGAHdcPB_7aSHJGZH1jMPGhN1jWplgoQKk0VPH1ir8qj39PW7Op9HpIuU50_RKLh4Kudjw', 1624337928, 'english', 'chat-theme-light', NULL),
(46, '1', '180.94.91.88', 'mirwais.naikmal@gmail.com', '$2y$10$vGIdzzA6suB2dRwwqD8AZOAHec580Kt8/amYdASz1N3WWKBK8pLh2', 'mirwais.naikmal@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623747939, NULL, 1, 'میرویس  نیکمل', 'رئیس پلان و پالیسی', '', '', '', '', '', '', '', '', 0, 'english', 'chat-theme-light', NULL),
(47, '1', '180.94.91.88', 'masoodsamim@yahoo.com', '$2y$10$4nmG.uo/YyG.g0ltR1Tu5eo1wBi17fMDZLpYDErqGfZwCXU9gp8Qu', 'masoodsamim@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824459, NULL, 1, 'مسعود صمیم', 'رئیس منابع بشری', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(48, '1', '180.94.91.88', 'hasibullahbaryalisafi@gmail.com', '$2y$10$PACqESDVfnY/KZNp.tBe4ONsnAJkDozEYJ3VGiWhUppm6fvcI6HUm', 'hasibullahbaryalisafi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824513, NULL, 1, 'حسیب الله بریالی صافی', 'رئیس اداری', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(49, '1', '180.94.91.88', 'mustafa2noori@gmail.com', '$2y$10$iolF.3bqmzfdlDA09plUBOOWis5e1FB5v0t6emZUYQ2GJt6Mp1w0K', 'mustafa2noori@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824562, NULL, 1, 'مصطفی نوری', 'رئیس مالی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(50, '1', '180.94.91.88', 'sayed.mousavi@digitalcasa.gov.af', '$2y$10$TSkNNArMCQqLpkADoh78xe5QS5YXsdmQqiQXPLlc9geh5A9O/Muqa', 'sayed.mousavi@digitalcasa.gov.af', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824604, 1624447519, 1, 'سید خداداد موسوی', 'رئیس دیجتل کاسا', '', '', '', '', '', '', '', '', 0, 'english', 'chat-theme-light', NULL),
(51, '1', '180.94.91.88', 'taufiquepopal@gmail.com', '$2y$10$GEkGLco/KDJyeAQiMgL./ueNqxshX6l.hBkj656XIAbl6uhi/S1SW', 'taufiquepopal@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824658, 1623832375, 1, 'توفیق پوپل', 'رئیس ساینس و نو اوری', '', '', '', '', '', NULL, NULL, '', 1623832544, 'dari', 'chat-theme-light', NULL),
(52, '1', '180.94.91.88', 'mustafanaier@gmil.com', '$2y$10$GJ5blAgtc5NyyFNLkafVnOL4AU9/Z0F.tLHVhTjFY1ius86Dn91.u', 'mustafanaier@gmil.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824709, NULL, 1, 'مصطفی نایر', 'رئیس زیر بنا های کلیدی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(53, '1', '180.94.91.88', 'zs.hossainy@gmail.com', '$2y$10$h92rqaByBuNKtaihrfnfBuPlWzS8YR377tpC/hLheNmcbcPcgTJ56', 'zs.hossainy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824850, NULL, 1, 'ضیا ثنا', 'رئیس مهارت های دیجتلی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(54, '1', '180.94.91.88', 'wazir.cs@gmail.com', '$2y$10$iUmH45OO.6KfWGvybeovQOK//v3.cpXYiuMT37HaJssCH9Nfnxsi.', 'wazir.cs@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623824913, NULL, 1, 'وزیر آرمین', 'رئیس CDO', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(55, '1', '180.94.91.88', 'eng.jamalnaser.sarwary@gmail.com', '$2y$10$xcWO27SpvqXjwppLLIkw/O8r30Bsr6jDxKl55f.0qGAl7nEcC10TO', 'eng.jamalnaser.sarwary@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825084, 1625132840, 1, 'جمال ناصر سروری', 'رئیس امنیت سیستم ها', '', '', '', '', '', NULL, NULL, 'dS2eikMILhs:APA91bEzx0HDn-V7DQlxRm0axelpNl76dtRuPH6hNo-tUNrQQd3sf2_VTLsFg5tsPkVzako3jgPusTGqXSv2w3LqoDRK97nQqw3beFS27ACrPiGWjoOXVCTL9Sowaflg1l6SLtymLPa2', 1624522236, 'english', 'chat-theme-light', NULL),
(56, '1', '180.94.91.88', 'enghamidehsan@gmail.com', '$2y$10$qSfaJnNPrIeAmXABMeeWFuvaVE9thb7p2pPokL9ebtxdv2Lis3W9K', 'enghamidehsan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825121, 1623826938, 1, 'حمید الله احسان', 'ریاست نظارت و ارزیابی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(57, '1', '180.94.91.88', 'javid.hussain.f@gmail.com', '$2y$10$Rkj9nXHPh8R8HF.p1WLw9O9YG.WevMXkrgSpeo25u7xyqY8bhjlVK', 'javid.hussain.f@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825267, 1623872429, 1, 'جاوید حسین فضایلی', 'رئیس عمومی مالی و اداری', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(58, '1', '180.94.91.88', 'idress.angar@gmail.com', '$2y$10$S84ywgRY0jNFY9PYuCbDWOoMHAHDC4JutoU6ZpI9/kzdHYSQzMwTW', 'idress.angar@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825303, NULL, 1, 'ادریس انگار', 'مشاوری مقام', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(59, '1', '180.94.91.88', 'masood.latifrai@gmail.com', '$2y$10$hsFF1Jquas3L9MQG6OgN0.b5NYrDW7W3sWtwxmtByPXmtN4UWkJUO', 'masood.latifrai@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825350, 1623833310, 1, 'Ahmad Masood Latifrai', 'معین پالیسی و پروگرام', '', '', '', '', '', '', '', '', 1623833372, 'english', 'chat-theme-light', NULL),
(60, '1', '180.94.91.88', 'mohsenkhawari@gmail.com', '$2y$10$n3H/F50vD7E23e51En.CcOW2K4yzM0VXs.GypKWIUZQxOP0i.nROq', 'mohsenkhawari@gmail.com', NULL, NULL, NULL, NULL, NULL, '32496d9be7fb023e8de1063650a23a4a843cf247', '$2y$10$tOQsgWcLPdZVHNiEtbjTn.Y8qn8x3VKYLJov00YH6GPZ73ZOQQZza', 1623825404, 1623835942, 1, 'Mohsen Khawari', 'Special Assistant to the Minister', '', 'Kabul', '', '', 'Afghanistan', '', '0093791939286', '', 0, 'english', 'chat-theme-light', '1623836160.3616.jpg'),
(61, '1', '180.94.91.88', 'suhrabkhan.ali@gmail.com', '$2y$10$OD29Adk4RrcJdFjMefQRLeKMPzydu/NadDBXfMRUQKB4UrHJo9zU6', 'suhrabkhan.ali@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825432, NULL, 1, 'سهراب خان', 'سکرتر مقام', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(62, '1', '180.94.91.88', 'masomakhawari11@gmail.com', '$2y$10$1qCiHDauROqW6b0KhlDsLuc04bYOUtEol41q2gV9htqWIpdw7xpm2', 'masomakhawari11@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825472, NULL, 1, 'معصومه خاوری', 'وزیر مخابرات و تکنالوژی معلوماتی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(63, '1', '180.94.91.88', 'bilall.wardak25@gmail.com', '$2y$10$Y3O6gLsFQE5ACFBRfRZ4Ueo86UPKwXhIqqHA54GDml6vOgDlWUIva', 'bilall.wardak25@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825531, NULL, 1, 'بلال وردگ', 'آمر تحریرات ریاست دفتر', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(64, '1', '180.94.91.88', 'hashimpashtun@gmail.com', '$2y$10$0FV/ssICnjeUV6vPKK3RHeZi92cyQf0atgZZeN3UK5wibTnj.ke2.', 'hashimpashtun@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1623825851, NULL, 1, 'هاشم پشتون', 'کارشناس دفتر مقام', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL),
(65, '1', '180.94.91.88', 'wahedullahnasrteyar@gmail.com', '$2y$10$vho5fDxLaxT/KchmX8j7POjuwBHMAyhLkkUBOvsCgGZ9g0kBUc.oa', 'wahedullahnasrteyar@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1624336593, NULL, 1, 'وحید الله', 'امر تفتیش داخلی', '', '', '', '', '', NULL, NULL, '', 0, 'english', 'chat-theme-light', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(4, 12, 2),
(5, 13, 2),
(6, 14, 2),
(7, 15, 3),
(8, 16, 2),
(9, 17, 2),
(10, 18, 2),
(11, 19, 2),
(12, 20, 2),
(13, 21, 2),
(14, 22, 2),
(15, 23, 2),
(16, 24, 2),
(17, 25, 2),
(18, 26, 2),
(19, 27, 2),
(20, 28, 2),
(21, 29, 2),
(22, 30, 2),
(23, 31, 2),
(24, 32, 2),
(25, 33, 2),
(26, 34, 2),
(27, 35, 2),
(28, 36, 2),
(29, 37, 2),
(30, 38, 2),
(31, 39, 2),
(32, 40, 2),
(33, 41, 2),
(34, 42, 2),
(35, 43, 2),
(36, 44, 2),
(37, 45, 1),
(38, 46, 2),
(39, 47, 2),
(40, 48, 2),
(41, 49, 2),
(42, 50, 2),
(43, 51, 2),
(44, 52, 2),
(45, 53, 2),
(46, 54, 2),
(47, 55, 2),
(48, 56, 2),
(49, 57, 2),
(50, 58, 2),
(51, 59, 2),
(52, 60, 2),
(53, 61, 2),
(54, 62, 2),
(55, 63, 2),
(56, 64, 2),
(57, 65, 2);

-- --------------------------------------------------------

--
-- Table structure for table `workspace`
--

CREATE TABLE `workspace` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `user_id` varchar(256) NOT NULL,
  `admin_id` varchar(256) NOT NULL,
  `leave_editors` varchar(256) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workspace`
--

INSERT INTO `workspace` (`id`, `title`, `user_id`, `admin_id`, `leave_editors`, `created_by`, `status`, `date_created`) VALUES
(1, 'Main Workspace', '1,10,11,14,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,24,36,39,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65', '1,14,45', NULL, 1, 1, '2021-11-03 10:58:59'),
(3, 'Deputy of Plans and Program', '1,14,16,34,45,18,26,24,27,17,32,35,21,37,28,44,33,40,31,38,41,30,20,22,29,43,19,25', '1,14', NULL, 1, 1, '2021-05-18 09:54:46'),
(4, 'CDO', '1,16', '1', NULL, 1, 1, '2021-05-31 11:22:54'),
(5, 'ریاست دفتر مقام', '1,45', '1,45', NULL, 1, 1, '2021-06-15 07:15:57'),
(6, 'هئیت رهبری وزارت مخابرات و تکنالوژی معلوماتی ', '45', '45', NULL, 45, 1, '2021-06-22 04:40:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archieve`
--
ALTER TABLE `archieve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archieve_media`
--
ALTER TABLE `archieve_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_groups`
--
ALTER TABLE `chat_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspace_id` (`workspace_id`);

--
-- Indexes for table `chat_group_members`
--
ALTER TABLE `chat_group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspace_id` (`workspace_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `chat_media`
--
ALTER TABLE `chat_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspace_id` (`workspace_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspace_id` (`workspace_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_media`
--
ALTER TABLE `project_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reporting`
--
ALTER TABLE `reporting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_media`
--
ALTER TABLE `report_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workspace`
--
ALTER TABLE `workspace`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `archieve`
--
ALTER TABLE `archieve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `archieve_media`
--
ALTER TABLE `archieve_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_groups`
--
ALTER TABLE `chat_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_group_members`
--
ALTER TABLE `chat_group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_media`
--
ALTER TABLE `chat_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `project_media`
--
ALTER TABLE `project_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reporting`
--
ALTER TABLE `reporting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_media`
--
ALTER TABLE `report_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `workspace`
--
ALTER TABLE `workspace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
