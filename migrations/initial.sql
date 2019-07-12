-- MariaDB dump 10.17  Distrib 10.4.6-MariaDB, for osx10.13 (x86_64)
--
-- Host: localhost    Database: archivetube
-- ------------------------------------------------------
-- Server version	10.4.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_logs` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_utc` datetime DEFAULT NULL,
  `user_id_parent` bigint(11) unsigned DEFAULT NULL,
  `user_id_child` bigint(11) unsigned DEFAULT NULL,
  `video_group_id` bigint(11) unsigned DEFAULT NULL,
  `video_id` bigint(11) unsigned DEFAULT NULL,
  `channel_id` bigint(11) unsigned DEFAULT NULL,
  `comment_id` bigint(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `namespace` (`namespace`,`code`),
  KEY `time_utc` (`time_utc`),
  KEY `user_id_parent` (`user_id_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_format` enum('txt','md','html') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'txt',
  `description_short` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_short_format` enum('txt','md','html') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'txt',
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribers` int(10) unsigned NOT NULL DEFAULT 0,
  `created_utc` datetime DEFAULT NULL,
  `latest_activity_utc` datetime DEFAULT NULL,
  `visibility` enum('public','unlisted','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `country_iso_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ISO 3166-1 alpha-3 codes',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_views` int(11) NOT NULL DEFAULT 0,
  `videos` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) unsigned NOT NULL DEFAULT 0,
  `last_comment_utc` datetime DEFAULT NULL,
  `banned_until_utc` datetime DEFAULT NULL,
  `settings_json` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_json` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_main_channel` tinyint(1) NOT NULL DEFAULT 0,
  `is_commentable` tinyint(1) NOT NULL DEFAULT 1,
  `is_perm_banned` tinyint(1) NOT NULL DEFAULT 0,
  `is_temp_banned` tinyint(1) NOT NULL DEFAULT 0,
  `is_retired` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subscribers` (`subscribers`),
  KEY `created_utc` (`created_utc`),
  KEY `latest_activity_utc` (`latest_activity_utc`),
  KEY `visibility` (`visibility`),
  KEY `country_iso_code` (`country_iso_code`),
  KEY `country` (`country`),
  KEY `channel_views` (`channel_views`),
  KEY `videos` (`videos`),
  KEY `comments` (`comments`),
  KEY `last_comment_utc` (`last_comment_utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_format` enum('txt','md','html') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'txt',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creation_utc` datetime DEFAULT NULL,
  `last_edit_utc` datetime DEFAULT NULL,
  `is_spam_flagged` tinyint(1) NOT NULL DEFAULT 0,
  `is_spam` tinyint(1) NOT NULL DEFAULT 0,
  `is_edited` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_created_by_bot` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `language` (`language`),
  KEY `creation_utc` (`creation_utc`),
  KEY `last_edit_utc` (`last_edit_utc`),
  KEY `is_spam_flagged` (`is_spam_flagged`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorite_video_groups`
--

DROP TABLE IF EXISTS `favorite_video_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_video_groups` (
  `user_id` bigint(11) unsigned NOT NULL,
  `video_group_id` bigint(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`video_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorite_videos`
--

DROP TABLE IF EXISTS `favorite_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_videos` (
  `user_id` bigint(11) unsigned NOT NULL,
  `video_id` bigint(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_files` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` bigint(11) unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` bigint(11) DEFAULT NULL,
  `created_utc` datetime DEFAULT NULL,
  `added_utc` datetime DEFAULT NULL,
  `type` enum('video','audio') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality` enum('240p','360p','720p','1080p') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_codec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_codec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decoded_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encoded_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution_width` smallint(5) DEFAULT NULL,
  `resolution_height` smallint(5) DEFAULT NULL,
  `framerate` float DEFAULT NULL,
  `channels` enum('mono','stereo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_rate` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artist` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `album` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disc_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `created_utc` (`created_utc`),
  KEY `added_utc` (`added_utc`),
  KEY `type` (`type`),
  KEY `quality` (`quality`),
  KEY `resolution_width` (`resolution_width`),
  KEY `resolution_height` (`resolution_height`),
  KEY `framerate` (`framerate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) unsigned DEFAULT NULL,
  `layout_json` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio_format` enum('txt','md','html') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'txt',
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate_utc` date DEFAULT NULL,
  `country_iso_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings_json` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity_utc` datetime DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` smallint(5) DEFAULT NULL,
  `avatar_height` smallint(5) DEFAULT NULL,
  `is_unlisted` tinyint(1) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_bot` tinyint(1) NOT NULL DEFAULT 0,
  `is_individual` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `display_name` (`display_name`),
  KEY `real_name` (`real_name`),
  KEY `birthdate_utc` (`birthdate_utc`),
  KEY `country_iso_code` (`country_iso_code`),
  KEY `country` (`country`),
  KEY `last_activity_utc` (`last_activity_utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `user_id_parent` bigint(11) unsigned NOT NULL,
  `user_id_child` bigint(11) unsigned NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden_from_feed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id_parent`,`user_id_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_id` bigint(11) unsigned NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`group`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_new` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_new_utc` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_confirmed` datetime DEFAULT NULL,
  `email_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_backup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requires_pw_change` tinyint(1) NOT NULL DEFAULT 0,
  `invalid_attempts` int(11) NOT NULL DEFAULT 0,
  `created_utc` datetime DEFAULT NULL,
  `banned_until_utc` datetime DEFAULT NULL,
  `ip_lock` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `2fa_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_temp_banned` tinyint(1) NOT NULL DEFAULT 0,
  `is_perm_banned` tinyint(1) NOT NULL DEFAULT 0,
  `is_ip_locked` tinyint(1) NOT NULL DEFAULT 0,
  `is_2fa_locked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `email_token` (`email_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_groups`
--

DROP TABLE IF EXISTS `video_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_groups` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_format` enum('txt','md','html') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'txt',
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_utc` datetime DEFAULT NULL,
  `visibility` enum('public','unlisted','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `is_created_by_bot` tinyint(1) NOT NULL DEFAULT 0,
  `is_playlist` tinyint(1) NOT NULL DEFAULT 0,
  `is_listed_on_home` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `namespace` (`namespace`,`identifier`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `language` (`language`),
  KEY `publication_utc` (`publication_utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_format` enum('txt','md','html') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'txt',
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_utc` datetime DEFAULT NULL,
  `publication_utc` datetime DEFAULT NULL,
  `comments` int(11) NOT NULL DEFAULT 0,
  `last_comment_utc` datetime DEFAULT NULL,
  `settings_json` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` enum('public','unlisted','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `classification` enum('sfw','nsfw') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sfw',
  `ia_identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_collection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_uploaded_by_bot` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`,`identifier`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `language` (`language`),
  KEY `copyright` (`copyright`),
  KEY `publication_utc` (`publication_utc`),
  KEY `visibility` (`visibility`),
  KEY `classification` (`classification`),
  KEY `ia_identifier` (`ia_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-12 22:19:16
