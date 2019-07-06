DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
