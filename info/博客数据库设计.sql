CREATE TABLE `auth_group` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `name` (`name`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `auth_group_permissions` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`group_id` int(11) NOT NULL,
`permission_id` int(11) NOT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `group_id` (`group_id`, `permission_id`),
INDEX `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `auth_permission` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`content_type_id` int(11) NOT NULL,
`codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `content_type_id` (`content_type_id`, `codename`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=37;

CREATE TABLE `blog_ad` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`image_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`callback_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`date_publish` datetime NOT NULL,
`index` int(11) NOT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2;

CREATE TABLE `blog_article` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`click_count` int(11) NOT NULL,
`is_recommend` tinyint(1) NOT NULL,
`date_publish` datetime NOT NULL,
`category_id` int(11) NULL DEFAULT NULL,
`user_id` int(11) NOT NULL,
PRIMARY KEY (`id`) ,
INDEX `blog_article_b583a629` (`category_id`),
INDEX `blog_article_e8701ad4` (`user_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2;

CREATE TABLE `blog_article_tag` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`article_id` int(11) NOT NULL,
`tag_id` int(11) NOT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `article_id` (`article_id`, `tag_id`),
INDEX `blog_article_tag_tag_id_7f711bf5_fk_blog_tag_id` (`tag_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4;

CREATE TABLE `blog_category` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`index` int(11) NOT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2;

CREATE TABLE `blog_comment` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`date_publish` datetime NOT NULL,
`pid_id` int(11) NULL DEFAULT NULL,
`user_id` int(11) NULL DEFAULT NULL,
`article_id` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `blog_comment_user_id_47f3b573_fk_blog_user_id` (`user_id`),
INDEX `blog_comment_pid_id_36aa5e28_fk_blog_comment_id` (`pid_id`),
INDEX `blog_comment_a00c1b00` (`article_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `blog_links` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`callback_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`date_publish` datetime NOT NULL,
`index` int(11) NOT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `blog_tag` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4;

CREATE TABLE `blog_user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
`last_login` datetime NULL DEFAULT NULL,
`is_superuser` tinyint(1) NOT NULL,
`username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`is_staff` tinyint(1) NOT NULL,
`is_active` tinyint(1) NOT NULL,
`date_joined` datetime NOT NULL,
`avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`isvip` tinyint NOT NULL DEFAULT 0,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `username` (`username`),
UNIQUE INDEX `mobile` (`mobile`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2;

CREATE TABLE `blog_user_groups` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL,
`group_id` int(11) NOT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `user_id` (`user_id`, `group_id`),
INDEX `blog_user_groups_group_id_17533145_fk_auth_group_id` (`group_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `blog_user_user_permissions` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL,
`permission_id` int(11) NOT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `user_id` (`user_id`, `permission_id`),
INDEX `blog_user_user_permi_permission_id_7c26d92_fk_auth_permission_id` (`permission_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1;

CREATE TABLE `django_admin_log` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`action_time` datetime NOT NULL,
`object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`action_flag` smallint(5) UNSIGNED NOT NULL,
`change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`content_type_id` int(11) NULL DEFAULT NULL,
`user_id` int(11) NOT NULL,
PRIMARY KEY (`id`) ,
INDEX `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
INDEX `django_admin_log_user_id_1c5f563_fk_blog_user_id` (`user_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10;

CREATE TABLE `django_content_type` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `django_content_type_app_label_3ec8c61c_uniq` (`app_label`, `model`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13;

CREATE TABLE `django_migrations` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`applied` datetime NOT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14;

CREATE TABLE `django_session` (
`session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`expire_date` datetime NOT NULL,
PRIMARY KEY (`session_key`) ,
INDEX `django_session_de54fa62` (`expire_date`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);
ALTER TABLE `auth_permission` ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
ALTER TABLE `blog_article` ADD CONSTRAINT `blog_article_category_id_1edad293_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`);
ALTER TABLE `blog_article` ADD CONSTRAINT `blog_article_user_id_60c35d4c_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`);
ALTER TABLE `blog_article_tag` ADD CONSTRAINT `blog_article_tag_article_id_4cf54675_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`);
ALTER TABLE `blog_article_tag` ADD CONSTRAINT `blog_article_tag_tag_id_7f711bf5_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`);
ALTER TABLE `blog_comment` ADD CONSTRAINT `blog_comment_article_id_484cf50b_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`);
ALTER TABLE `blog_comment` ADD CONSTRAINT `blog_comment_pid_id_36aa5e28_fk_blog_comment_id` FOREIGN KEY (`pid_id`) REFERENCES `blog_comment` (`id`);
ALTER TABLE `blog_comment` ADD CONSTRAINT `blog_comment_user_id_47f3b573_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`);
ALTER TABLE `blog_user_groups` ADD CONSTRAINT `blog_user_groups_group_id_17533145_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);
ALTER TABLE `blog_user_groups` ADD CONSTRAINT `blog_user_groups_user_id_3a8a3282_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`);
ALTER TABLE `blog_user_user_permissions` ADD CONSTRAINT `blog_user_user_permi_permission_id_7c26d92_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
ALTER TABLE `blog_user_user_permissions` ADD CONSTRAINT `blog_user_user_permissions_user_id_528ed84c_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`);
ALTER TABLE `django_admin_log` ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
ALTER TABLE `django_admin_log` ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`);

