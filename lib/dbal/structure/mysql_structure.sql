#
# MySQL Roster Structure File
#
# * $Id: mysql_structure.sql 2632 2014-08-21 20:28:28Z ulminia@gmail.com $
#
# --------------------------------------------------------
### Account

DROP TABLE IF EXISTS `renprefix_account`;
CREATE TABLE `renprefix_account` (
  `account_id` smallint(6) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  `hash` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`account_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_user_members`;
CREATE TABLE IF NOT EXISTS `renprefix_user_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(32) DEFAULT NULL,
  `pass` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `regIP` varchar(15) DEFAULT NULL,
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` varchar(25) DEFAULT NULL,
  `user_permissions` text,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `age` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `zone` varchar(32) DEFAULT NULL,
  `homepage` varchar(64) DEFAULT NULL,
  `other_guilds` varchar(64) DEFAULT NULL,
  `why` varchar(64) DEFAULT NULL,
  `about` varchar(64) DEFAULT NULL,
  `notes` varchar(64) DEFAULT NULL,
  `last_login` varchar(64) DEFAULT NULL,
  `date_joined` varchar(64) DEFAULT NULL,
  `tmp_mail` varchar(32) DEFAULT NULL,
  `group_id` smallint(6) NOT NULL DEFAULT '1',
  `is_member` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `online` int(11) NOT NULL DEFAULT '0',
  `user_lastvisit` int(15) DEFAULT NULL,
  `last_sid` varchar(80) DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usr` (`usr`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_guild_rank`;
CREATE TABLE `renprefix_guild_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `control` varchar(255) NOT NULL DEFAULT '0',
  `guild_id` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `renprefix_user_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc` text COLLATE utf8_bin NOT NULL,
  `group_permissions` text,
  `group_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `renprefix_permissions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `type_id` int(5) DEFAULT NULL,
  `catagory` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  `cfg_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_sessions`;
CREATE TABLE IF NOT EXISTS `renprefix_sessions` (
  `sess_id` varchar(35) DEFAULT NULL,
  `session_id` char(32) NOT NULL DEFAULT '',
  `session_user_id` varchar(5) DEFAULT NULL,
  `session_last_visit` int(11) NOT NULL DEFAULT '0',
  `session_start` int(11) NOT NULL DEFAULT '0',
  `session_time` int(11) NOT NULL DEFAULT '0',
  `session_ip` varchar(40) NOT NULL DEFAULT '',
  `session_browser` varchar(150) NOT NULL DEFAULT '',
  `session_forwarded_for` varchar(255) NOT NULL DEFAULT '',
  `session_page` varchar(255) NOT NULL DEFAULT '',
  `session_viewonline` tinyint(1) NOT NULL DEFAULT '1',
  `session_autologin` tinyint(1) NOT NULL DEFAULT '0',
  `session_admin` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `sess_id` (`sess_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_sessions_keys`;
CREATE TABLE `renprefix_sessions_keys` (
 `key_id` char(32) NOT NULL,
 `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
 `last_ip` varchar(40) NOT NULL,
 `last_login` int(11) UNSIGNED NOT NULL DEFAULT '0',
 KEY `last_login` ( `last_login` ),
 PRIMARY KEY  ( `key_id`, `user_id` )
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Addon

DROP TABLE IF EXISTS `renprefix_addon`;
CREATE TABLE `renprefix_addon` (
  `addon_id` int(11) NOT NULL auto_increment,
  `basename` varchar(16) NOT NULL default '',
  `version` varchar(16) NOT NULL default '0',
  `active` int(1) NOT NULL default '1',
  `access` varchar(30) NOT NULL default '0',
  `fullname` tinytext NOT NULL,
  `description` mediumtext NOT NULL,
  `credits` mediumtext NOT NULL,
  `icon` varchar(64) NOT NULL default '',
  `wrnet_id` int(4) NOT NULL default '0',
  `versioncache` tinytext,
  PRIMARY KEY  (`addon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### plugin

DROP TABLE IF EXISTS `renprefix_plugin`;
CREATE TABLE `renprefix_plugin` (
  `addon_id` int(11) NOT NULL auto_increment,
  `basename` varchar(16) NOT NULL default '',
  `parent` VARCHAR( 100 ) NULL DEFAULT NULL,
  `scope` VARCHAR( 20 ) NULL DEFAULT NULL,
  `version` varchar(16) NOT NULL default '0',
  `active` int(1) NOT NULL default '1',
  `access` int(1) NOT NULL default '0',
  `fullname` tinytext NOT NULL,
  `description` mediumtext NOT NULL,
  `credits` mediumtext NOT NULL,
  `icon` varchar(64) NOT NULL default '',
  `wrnet_id` int(4) NOT NULL default '0',
  `versioncache` tinytext,
  PRIMARY KEY  (`addon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Addon Config

DROP TABLE IF EXISTS `renprefix_addon_config`;
CREATE TABLE `renprefix_addon_config` (
  `addon_id` int(11) NOT NULL default '0',
  `id` int(11) unsigned NOT NULL,
  `config_name` varchar(255) default NULL,
  `config_value` tinytext,
  `form_type` mediumtext,
  `config_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`,`addon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_plugin_config`;
CREATE TABLE `renprefix_plugin_config` (
  `addon_id` int(11) NOT NULL default '0',
  `id` int(11) unsigned NOT NULL,
  `config_name` varchar(255) default NULL,
  `config_value` tinytext,
  `form_type` mediumtext,
  `config_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`,`addon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
# --------------------------------------------------------
### API Tables

DROP TABLE IF EXISTS `renprefix_api_usage`;
CREATE TABLE IF NOT EXISTS `renprefix_api_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `url` mediumtext,
  `responce_code` varchar(20) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `renprefix_api_enchant`;
CREATE TABLE `renprefix_api_enchant` (
 `id` int(11) UNSIGNED NOT NULL DEFAULT '0',
 `name` varchar(200) NOT NULL,
 `bonus` mediumtext DEFAULT NULL,
 `slot` varchar(30) NOT NULL,
 `icon` varchar(64) NOT NULL,
 `description` mediumtext NOT NULL,
 `castTime` varchar(100) DEFAULT NULL,
 KEY `name` ( `name` ),
 PRIMARY KEY  ( `id` )
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_all_gems`;
CREATE TABLE `renprefix_all_gems` (
 `gem_id` int(11) NOT NULL,
 `gem_name` varchar(96) NOT NULL,
 `gem_color` varchar(16) NOT NULL,
 `gem_tooltip` mediumtext NOT NULL,
 `gem_texture` varchar(64) NOT NULL,
 `gem_bonus` varchar(255) NOT NULL,
 `gem_bonus_stat1` varchar(255) NOT NULL,
 `gem_bonus_stat2` varchar(255) NOT NULL,
 `locale` varchar(16) NOT NULL,
 `timestamp` int(10) NOT NULL,
 `json` longtext DEFAULT NULL,
 PRIMARY KEY  ( `gem_id`, `locale` )
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `renprefix_api_error`;
CREATE TABLE `renprefix_api_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `error` varchar(250) DEFAULT NULL,
  `error_info` text,
  `content_type` varchar(100) DEFAULT NULL,
  `responce_code` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `total` int(10) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_api_gems`;
CREATE TABLE `renprefix_api_gems` (
  `gem_id` int(11) NOT NULL,
  `gem_name` varchar(96) NOT NULL default '',
  `gem_color` varchar(16) NOT NULL default '',
  `gem_tooltip` mediumtext NOT NULL,
  `gem_texture` varchar(64) NOT NULL default '',
  `gem_bonus` varchar(255) NOT NULL default '',
  `locale` varchar(16) NOT NULL default '',
  `timestamp` int(10) NOT NULL,
  `json` longtext,
  PRIMARY KEY  (`gem_id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_api_items`;
CREATE TABLE `renprefix_api_items` (
   `item_id`        int(11) NOT NULL,
   `context` VARCHAR( 100 ) NULL DEFAULT NULL,
   `bonus` INT( 10 ) NULL DEFAULT NULL,
   `item_name`      varchar(96) NOT NULL,
   `item_color`     varchar(16) NOT NULL,
   `item_texture`   varchar(64) NOT NULL,
   `item_tooltip`   mediumtext NOT NULL,
   `level`          int(11) DEFAULT NULL,
   `item_level`     int(11) DEFAULT NULL,
   `item_type`      varchar(64) DEFAULT NULL,
   `item_subtype`   varchar(64) DEFAULT NULL,
   `item_rarity`    int(4) NOT NULL DEFAULT '-1',
   `locale`         varchar(16) DEFAULT NULL,
   `timestamp`      int(10) NOT NULL,
   `json`           longtext DEFAULT NULL,
  PRIMARY KEY  (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_api_cache`;
CREATE TABLE `renprefix_api_cache` (
   `id`				int(11) NOT NULL,
   `type`			varchar(96) NOT NULL,
   `lastmodified`	varchar(16) NOT NULL,
   `name`			varchar(64) NOT NULL,
   `locale`         varchar(16) DEFAULT NULL,
   `json`           longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
# --------------------------------------------------------
### Buffs

DROP TABLE IF EXISTS `renprefix_buffs`;
CREATE TABLE `renprefix_buffs` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `name` varchar(96) NOT NULL default '',
  `rank` varchar(32) NOT NULL default '',
  `count` int(11) unsigned NOT NULL default '0',
  `icon` varchar(64) NOT NULL default '',
  `tooltip` mediumtext NOT NULL,
  PRIMARY KEY  (`member_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Companions

DROP TABLE IF EXISTS `renprefix_companions`;
CREATE TABLE `renprefix_companions` (
  `comp_id` int(11) NOT NULL auto_increment,
  `member_id` int(11) unsigned NOT NULL default '0',
  `name` varchar(96) NOT NULL,
  `type` varchar(96) NOT NULL,
  `slot` int(11) NOT NULL,
  `spellid` int(11) NOT NULL default '0',
  `icon` varchar(64) NOT NULL default '',
  `creatureid` int(11) NOT NULL default '0',
  `tooltip` mediumtext NOT NULL,
  PRIMARY KEY  (`comp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Config

DROP TABLE IF EXISTS `renprefix_config`;
CREATE TABLE `renprefix_config` (
  `id` int(11) unsigned NOT NULL,
  `config_name` varchar(255) default NULL,
  `config_value` tinytext,
  `form_type` mediumtext,
  `config_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Currency

DROP TABLE IF EXISTS `renprefix_currency`;
CREATE TABLE `renprefix_currency` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `order` tinyint(4) NOT NULL default '0',
  `category` varchar(96) NOT NULL,
  `name` varchar(96) NOT NULL default '',
  `type` tinyint(4) unsigned NOT NULL default '0',
  `count` int(5) unsigned NOT NULL default '0',
  `icon` varchar(64) NOT NULL,
  `tooltip` mediumtext NOT NULL,
  `watched` varchar(10) NOT NULL,
  PRIMARY KEY  (`member_id`,`category`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Gems

DROP TABLE IF EXISTS `renprefix_gems`;
CREATE TABLE `renprefix_gems` (
  `gem_id` int(11) NOT NULL default '0',
  `gem_name` varchar(96) NOT NULL default '',
  `gem_color` varchar(16) NOT NULL default '',
  `gem_tooltip` mediumtext NOT NULL,
  `gem_texture` varchar(64) NOT NULL default '',
  `gem_bonus` varchar(255) NOT NULL default '',
  `gem_socketid` int(11) NOT NULL default '0',
  `locale` varchar(16) NOT NULL default '',
  PRIMARY KEY  (`gem_id`,`locale`),
  KEY `gem_socketid` (`gem_socketid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Glyphs

DROP TABLE IF EXISTS `renprefix_glyphs`;
CREATE TABLE `renprefix_glyphs` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `glyph_build` tinyint(2) NOT NULL default '0',
  `glyph_order` tinyint(4) NOT NULL default '0',
  `glyph_type` tinyint(4) NOT NULL default '0',
  `glyph_name` varchar(96) NOT NULL default '',
  `glyph_icon` varchar(64) NOT NULL default '',
  `glyph_tooltip` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Guild

DROP TABLE IF EXISTS `renprefix_guild`;
CREATE TABLE `renprefix_guild` (
  `guild_id` int(11) unsigned NOT NULL auto_increment,
  `guild_name` varchar(64) NOT NULL default '',
  `server` varchar(32) NOT NULL default '',
  `region` char(2) NOT NULL default '',
  `faction` varchar(32) NOT NULL default '',
  `factionEn` varchar(32) NOT NULL default '',
  `guild_motd` varchar(255) NOT NULL default '',
  `guild_num_members` int(11) NOT NULL default '0',
  `guild_num_accounts` int(11) NOT NULL default '0',
  `guild_xp` varchar(32) NULL default '',
  `guild_xpcap` varchar(32) NULL default '',
  `guild_level` varchar(32) NULL default '',
  `update_time` datetime default NULL,
  `GPversion` varchar(6) NOT NULL default '0.0.0',
  `DBversion` varchar(6) NOT NULL default '0.0.0',
  `guild_info_text` mediumtext,
  PRIMARY KEY  (`guild_id`),
  KEY `guild` (`guild_name`,`server`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Items

DROP TABLE IF EXISTS `renprefix_items`;
CREATE TABLE `renprefix_items` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `item_name` varchar(96) NOT NULL default '',
  `item_parent` varchar(64) NOT NULL default '',
  `item_slot` varchar(32) NOT NULL default '',
  `item_color` varchar(16) NOT NULL default '',
  `item_id` varchar(64) default NULL,
  `item_texture` varchar(64) NOT NULL default '',
  `item_quantity` int(11) default NULL,
  `item_tooltip` mediumtext NOT NULL,
  `level` int(11) default NULL,
  `item_level` int(11) default NULL,
  `item_type` varchar(64) default NULL,
  `item_subtype` varchar(64) default NULL,
  `item_rarity` int(4) NOT NULL default -1,
  `locale` varchar(4) default NULL,
  `json` longtext DEFAULT NULL,
  PRIMARY KEY  (`member_id`,`item_parent`,`item_slot`),
  KEY `parent` (`item_parent`),
  KEY `slot` (`item_slot`),
  KEY `name` (`item_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Mailbox

DROP TABLE IF EXISTS `renprefix_mailbox`;
CREATE TABLE `renprefix_mailbox` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `mailbox_slot` int(11) NOT NULL default '0',
  `mailbox_icon` varchar(64) NOT NULL default '',
  `mailbox_coin` int(11) NOT NULL default '0',
  `mailbox_coin_icon` varchar(64) NOT NULL default '',
  `mailbox_days` float NOT NULL default '0',
  `mailbox_sender` varchar(30) NOT NULL default '',
  `mailbox_subject` mediumtext NOT NULL,
  PRIMARY KEY  (`member_id`,`mailbox_slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Member Log

DROP TABLE IF EXISTS `renprefix_memberlog`;
CREATE TABLE `renprefix_memberlog` (
  `log_id` int(11) unsigned NOT NULL auto_increment,
  `member_id` int(11) unsigned NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `server` varchar(32) NOT NULL default '',
  `region` char(2) NOT NULL default '',
  `guild_id` int(11) unsigned NOT NULL default '0',
  `class` varchar(32) NOT NULL default '',
  `classid` int(11) NOT NULL default '0',
  `level` int(11) NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  `guild_rank` int(11) default '0',
  `guild_title` varchar(64) default NULL,
  `officer_note` varchar(255) NOT NULL default '',
  `update_time` datetime default NULL,
  `type` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Members

DROP TABLE IF EXISTS `renprefix_members`;
CREATE TABLE `renprefix_members` (
  `member_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `server` varchar(32) NOT NULL default '',
  `region` char(2) NOT NULL default '',
  `guild_id` int(11) unsigned NOT NULL default '0',
  `class` varchar(32) NOT NULL default '',
  `classid` int(11) NOT NULL default '0',
  `level` int(11) NOT NULL default '0',
  `note` varchar(255) NOT NULL default '',
  `guild_rank` int(11) default '0',
  `guild_title` varchar(64) default NULL,
  `officer_note` varchar(255) NOT NULL default '',
  `zone` varchar(64) NOT NULL default '',
  `status` varchar(16) NOT NULL default '',
  `online` int(1) default '0',
  `last_online` datetime default NULL,
  `account_id` smallint(6) NULL default NULL,
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`member_id`),
  KEY `member` (`guild_id`,`name`),
  KEY `name` (`name`),
  KEY `char` (`region`,`server`,`name`),
  KEY `class` (`class`),
  KEY `level` (`level`),
  KEY `guild_rank` (`guild_rank`),
  KEY `last_online` (`last_online`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Menu

DROP TABLE IF EXISTS `renprefix_menu`;
CREATE TABLE `renprefix_menu` (
  `config_id` int(11) NOT NULL auto_increment,
  `section` varchar(64) default NULL,
  `config` mediumtext,
  PRIMARY KEY  (`config_id`),
  UNIQUE KEY `section` (`section`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Menu Button

DROP TABLE IF EXISTS `renprefix_menu_button`;
CREATE TABLE `renprefix_menu_button` (
  `button_id` int(11) NOT NULL auto_increment,
  `addon_id` int(11) NOT NULL COMMENT '0 for main roster',
  `title` varchar(32) default NULL,
  `scope` varchar(16) default NULL,
  `url` varchar(128) default NULL,
  `icon` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`button_id`),
  KEY `idtitle` (`addon_id`,`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Pets

DROP TABLE IF EXISTS `renprefix_pets`;
CREATE TABLE `renprefix_pets` (
  `pet_id` int(11) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL default '0',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `slot` int(11) NOT NULL default '0',
  `level` int(11) NOT NULL default '0',
  `health` int(11) NOT NULL default '0',
  `mana` int(11) NOT NULL default '0',
  `power` varchar(32) NOT NULL default '',
  `xp` varchar(32) NOT NULL default '0',
  `totaltp` int(11) NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `icon` varchar(64) NOT NULL default '',
  `melee_power` int(11) NOT NULL default '0',
  `melee_power_c` int(11) NOT NULL default '0',
  `melee_power_b` int(11) NOT NULL default '0',
  `melee_power_d` int(11) NOT NULL default '0',
  `melee_hit` int(11) NOT NULL default '0',
  `melee_hit_c` int(11) NOT NULL default '0',
  `melee_hit_b` int(11) NOT NULL default '0',
  `melee_hit_d` int(11) NOT NULL default '0',
  `melee_crit` int(11) NOT NULL default '0',
  `melee_crit_c` int(11) NOT NULL default '0',
  `melee_crit_b` int(11) NOT NULL default '0',
  `melee_crit_d` int(11) NOT NULL default '0',
  `melee_haste` int(11) NOT NULL default '0',
  `melee_haste_c` int(11) NOT NULL default '0',
  `melee_haste_b` int(11) NOT NULL default '0',
  `melee_haste_d` int(11) NOT NULL default '0',
  `melee_expertise` int(11) NOT NULL default '0',
  `melee_expertise_c` int(11) NOT NULL default '0',
  `melee_expertise_b` int(11) NOT NULL default '0',
  `melee_expertise_d` int(11) NOT NULL default '0',
  `melee_crit_chance` float NOT NULL default '0',
  `melee_power_dps` float NOT NULL default '0',
  `melee_mhand_speed` float NOT NULL default '0',
  `melee_mhand_dps` float NOT NULL default '0',
  `melee_mhand_skill` int(11) NOT NULL default '0',
  `melee_mhand_mindam` int(11) NOT NULL default '0',
  `melee_mhand_maxdam` int(11) NOT NULL default '0',
  `melee_mhand_rating` int(11) NOT NULL default '0',
  `melee_mhand_rating_c` int(11) NOT NULL default '0',
  `melee_mhand_rating_b` int(11) NOT NULL default '0',
  `melee_mhand_rating_d` int(11) NOT NULL default '0',
  `melee_range_tooltip` tinytext,
  `melee_power_tooltip` tinytext,
  `stat_int` int(11) NOT NULL default '0',
  `stat_int_c` int(11) NOT NULL default '0',
  `stat_int_b` int(11) NOT NULL default '0',
  `stat_int_d` int(11) NOT NULL default '0',
  `stat_agl` int(11) NOT NULL default '0',
  `stat_agl_c` int(11) NOT NULL default '0',
  `stat_agl_b` int(11) NOT NULL default '0',
  `stat_agl_d` int(11) NOT NULL default '0',
  `stat_sta` int(11) NOT NULL default '0',
  `stat_sta_c` int(11) NOT NULL default '0',
  `stat_sta_b` int(11) NOT NULL default '0',
  `stat_sta_d` int(11) NOT NULL default '0',
  `stat_str` int(11) NOT NULL default '0',
  `stat_str_c` int(11) NOT NULL default '0',
  `stat_str_b` int(11) NOT NULL default '0',
  `stat_str_d` int(11) NOT NULL default '0',
  `stat_spr` int(11) NOT NULL default '0',
  `stat_spr_c` int(11) NOT NULL default '0',
  `stat_spr_b` int(11) NOT NULL default '0',
  `stat_spr_d` int(11) NOT NULL default '0',
  `stat_def` int(11) NOT NULL default '0',
  `stat_def_c` int(11) NOT NULL default '0',
  `stat_def_b` int(11) NOT NULL default '0',
  `stat_def_d` int(11) NOT NULL default '0',
  `stat_armor` int(11) NOT NULL default '0',
  `stat_armor_c` int(11) NOT NULL default '0',
  `stat_armor_b` int(11) NOT NULL default '0',
  `stat_armor_d` int(11) NOT NULL default '0',
  `stat_block` int(11) NOT NULL default '0',
  `stat_block_c` int(11) NOT NULL default '0',
  `stat_block_b` int(11) NOT NULL default '0',
  `stat_block_d` int(11) NOT NULL default '0',
  `stat_parry` int(11) NOT NULL default '0',
  `stat_parry_c` int(11) NOT NULL default '0',
  `stat_parry_b` int(11) NOT NULL default '0',
  `stat_parry_d` int(11) NOT NULL default '0',
  `stat_defr` int(11) NOT NULL default '0',
  `stat_defr_c` int(11) NOT NULL default '0',
  `stat_defr_b` int(11) NOT NULL default '0',
  `stat_defr_d` int(11) NOT NULL default '0',
  `stat_dodge` int(11) NOT NULL default '0',
  `stat_dodge_c` int(11) NOT NULL default '0',
  `stat_dodge_b` int(11) NOT NULL default '0',
  `stat_dodge_d` int(11) NOT NULL default '0',
  `stat_res_ranged` int(11) NOT NULL default '0',
  `stat_res_spell` int(11) NOT NULL default '0',
  `stat_res_melee` int(11) NOT NULL default '0',
  `res_holy` int(11) NOT NULL default '0',
  `res_holy_c` int(11) NOT NULL default '0',
  `res_holy_b` int(11) NOT NULL default '0',
  `res_holy_d` int(11) NOT NULL default '0',
  `res_frost` int(11) NOT NULL default '0',
  `res_frost_c` int(11) NOT NULL default '0',
  `res_frost_b` int(11) NOT NULL default '0',
  `res_frost_d` int(11) NOT NULL default '0',
  `res_arcane` int(11) NOT NULL default '0',
  `res_arcane_c` int(11) NOT NULL default '0',
  `res_arcane_b` int(11) NOT NULL default '0',
  `res_arcane_d` int(11) NOT NULL default '0',
  `res_fire` int(11) NOT NULL default '0',
  `res_fire_c` int(11) NOT NULL default '0',
  `res_fire_b` int(11) NOT NULL default '0',
  `res_fire_d` int(11) NOT NULL default '0',
  `res_shadow` int(11) NOT NULL default '0',
  `res_shadow_c` int(11) NOT NULL default '0',
  `res_shadow_b` int(11) NOT NULL default '0',
  `res_shadow_d` int(11) NOT NULL default '0',
  `res_nature` int(11) NOT NULL default '0',
  `res_nature_c` int(11) NOT NULL default '0',
  `res_nature_b` int(11) NOT NULL default '0',
  `res_nature_d` int(11) NOT NULL default '0',
  `dodge` float NOT NULL default '0',
  `parry` float NOT NULL default '0',
  `block` float NOT NULL default '0',
  `mitigation` float NOT NULL default '0',
  PRIMARY KEY  (`pet_id`,`member_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Pet Spellbook

DROP TABLE IF EXISTS `renprefix_pet_spellbook`;
CREATE TABLE `renprefix_pet_spellbook` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `pet_id` int(11) unsigned NOT NULL default '0',
  `spell_name` varchar(64) NOT NULL default '',
  `spell_texture` varchar(64) NOT NULL default '',
  `spell_rank` varchar(64) NOT NULL default '',
  `spell_tooltip` mediumtext NOT NULL,
  PRIMARY KEY  (`member_id`,`pet_id`,`spell_name`,`spell_rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Pet Talents

DROP TABLE IF EXISTS `renprefix_pet_talents`;
CREATE TABLE `renprefix_pet_talents` (
  `member_id` int(11) NOT NULL default '0',
  `pet_id` int(11) unsigned NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  `tree` varchar(64) NOT NULL default '',
  `row` tinyint(4) NOT NULL default '0',
  `column` tinyint(4) NOT NULL default '0',
  `rank` tinyint(4) NOT NULL default '0',
  `maxrank` tinyint(4) NOT NULL default '0',
  `tooltip` mediumtext NOT NULL,
  `icon` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`member_id`,`pet_id`,`tree`,`row`,`column`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Pet Talent Tree

DROP TABLE IF EXISTS `renprefix_pet_talenttree`;
CREATE TABLE `renprefix_pet_talenttree` (
  `member_id` int(11) NOT NULL default '0',
  `pet_id` int(11) unsigned NOT NULL default '0',
  `tree` varchar(64) NOT NULL default '',
  `background` varchar(64) NOT NULL default '',
  `order` tinyint(4) NOT NULL default '0',
  `pointsspent` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`member_id`,`pet_id`,`tree`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Players

DROP TABLE IF EXISTS `renprefix_players`;
CREATE TABLE `renprefix_players` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL default '',
  `guild_id` int(11) unsigned NOT NULL default '0',
  `dateupdatedutc` datetime default NULL,
  `CPversion` varchar(6) NOT NULL default '0.0.0',
  `DBversion` varchar(6) NOT NULL default '0.0.0',
  `race` varchar(32) NOT NULL default '',
  `raceid` tinyint(1) NOT NULL default '0',
  `raceEn` varchar(32) NOT NULL default '',
  `sex` varchar(10) NOT NULL default '',
  `sexid` tinyint(1) NOT NULL default '0',
  `hearth` varchar(32) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `server` varchar(32) NOT NULL default '',
  `region` char(2) NOT NULL default '',
  `talent_points` int(11) NOT NULL default '0',
  `money_c` int(11) NOT NULL default '0',
  `money_s` int(11) NOT NULL default '0',
  `money_g` int(11) NOT NULL default '0',
  `exp` varchar(32) NOT NULL default '',
  `class` varchar(32) NOT NULL default '',
  `classid` tinyint(1) NOT NULL default '0',
  `classEn` varchar(32) NOT NULL default '',
  `health` int(11) NOT NULL default '0',
  `maildateutc` datetime default NULL,
  `melee_power` int(11) NOT NULL default '0',
  `melee_power_c` int(11) NOT NULL default '0',
  `melee_power_b` int(11) NOT NULL default '0',
  `melee_power_d` int(11) NOT NULL default '0',
  `melee_hit` int(11) NOT NULL default '0',
  `melee_hit_c` int(11) NOT NULL default '0',
  `melee_hit_b` int(11) NOT NULL default '0',
  `melee_hit_d` int(11) NOT NULL default '0',
  `melee_crit` int(11) NOT NULL default '0',
  `melee_crit_c` int(11) NOT NULL default '0',
  `melee_crit_b` int(11) NOT NULL default '0',
  `melee_crit_d` int(11) NOT NULL default '0',
  `melee_haste` int(11) NOT NULL default '0',
  `melee_haste_c` int(11) NOT NULL default '0',
  `melee_haste_b` int(11) NOT NULL default '0',
  `melee_haste_d` int(11) NOT NULL default '0',
  `melee_expertise` int(11) NOT NULL default '0',
  `melee_expertise_c` int(11) NOT NULL default '0',
  `melee_expertise_b` int(11) NOT NULL default '0',
  `melee_expertise_d` int(11) NOT NULL default '0',
  `melee_crit_chance` float NOT NULL default '0',
  `melee_power_dps` float NOT NULL default '0',
  `melee_mhand_speed` float NOT NULL default '0',
  `melee_mhand_dps` float NOT NULL default '0',
  `melee_mhand_skill` int(11) NOT NULL default '0',
  `melee_mhand_mindam` int(11) NOT NULL default '0',
  `melee_mhand_maxdam` int(11) NOT NULL default '0',
  `melee_mhand_rating` int(11) NOT NULL default '0',
  `melee_mhand_rating_c` int(11) NOT NULL default '0',
  `melee_mhand_rating_b` int(11) NOT NULL default '0',
  `melee_mhand_rating_d` int(11) NOT NULL default '0',
  `melee_ohand_speed` float NOT NULL default '0',
  `melee_ohand_dps` float NOT NULL default '0',
  `melee_ohand_skill` int(11) NOT NULL default '0',
  `melee_ohand_mindam` int(11) NOT NULL default '0',
  `melee_ohand_maxdam` int(11) NOT NULL default '0',
  `melee_ohand_rating` int(11) NOT NULL default '0',
  `melee_ohand_rating_c` int(11) NOT NULL default '0',
  `melee_ohand_rating_b` int(11) NOT NULL default '0',
  `melee_ohand_rating_d` int(11) NOT NULL default '0',
  `melee_range_tooltip` tinytext,
  `melee_power_tooltip` tinytext,
  `ranged_power` int(11) NOT NULL default '0',
  `ranged_power_c` int(11) NOT NULL default '0',
  `ranged_power_b` int(11) NOT NULL default '0',
  `ranged_power_d` int(11) NOT NULL default '0',
  `ranged_hit` int(11) NOT NULL default '0',
  `ranged_hit_c` int(11) NOT NULL default '0',
  `ranged_hit_b` int(11) NOT NULL default '0',
  `ranged_hit_d` int(11) NOT NULL default '0',
  `ranged_crit` int(11) NOT NULL default '0',
  `ranged_crit_c` int(11) NOT NULL default '0',
  `ranged_crit_b` int(11) NOT NULL default '0',
  `ranged_crit_d` int(11) NOT NULL default '0',
  `ranged_haste` int(11) NOT NULL default '0',
  `ranged_haste_c` int(11) NOT NULL default '0',
  `ranged_haste_b` int(11) NOT NULL default '0',
  `ranged_haste_d` int(11) NOT NULL default '0',
  `ranged_crit_chance` float NOT NULL default '0',
  `ranged_power_dps` float NOT NULL default '0',
  `ranged_speed` float NOT NULL default '0',
  `ranged_dps` float NOT NULL default '0',
  `ranged_skill` int(11) NOT NULL default '0',
  `ranged_mindam` int(11) NOT NULL default '0',
  `ranged_maxdam` int(11) NOT NULL default '0',
  `ranged_rating` int(11) NOT NULL default '0',
  `ranged_rating_c` int(11) NOT NULL default '0',
  `ranged_rating_b` int(11) NOT NULL default '0',
  `ranged_rating_d` int(11) NOT NULL default '0',
  `ranged_range_tooltip` tinytext,
  `ranged_power_tooltip` tinytext,
  `spell_hit` int(11) NOT NULL default '0',
  `spell_hit_c` int(11) NOT NULL default '0',
  `spell_hit_b` int(11) NOT NULL default '0',
  `spell_hit_d` int(11) NOT NULL default '0',
  `spell_crit` int(11) NOT NULL default '0',
  `spell_crit_c` int(11) NOT NULL default '0',
  `spell_crit_b` int(11) NOT NULL default '0',
  `spell_crit_d` int(11) NOT NULL default '0',
  `spell_haste` int(11) NOT NULL default '0',
  `spell_haste_c` int(11) NOT NULL default '0',
  `spell_haste_b` int(11) NOT NULL default '0',
  `spell_haste_d` int(11) NOT NULL default '0',
  `spell_crit_chance` float NOT NULL default '0',
  `spell_crit_chance_holy` float NOT NULL default '0',
  `spell_crit_chance_frost` float NOT NULL default '0',
  `spell_crit_chance_arcane` float NOT NULL default '0',
  `spell_crit_chance_fire` float NOT NULL default '0',
  `spell_crit_chance_shadow` float NOT NULL default '0',
  `spell_crit_chance_nature` float NOT NULL default '0',
  `mana_regen` int(11) NOT NULL default '0',
  `mana_regen_cast` int(11) NOT NULL default '0',
  `spell_penetration` int(11) NOT NULL default '0',
  `spell_damage` int(11) NOT NULL default '0',
  `spell_healing` int(11) NOT NULL default '0',
  `spell_damage_holy` int(11) NOT NULL default '0',
  `spell_damage_frost` int(11) NOT NULL default '0',
  `spell_damage_arcane` int(11) NOT NULL default '0',
  `spell_damage_fire` int(11) NOT NULL default '0',
  `spell_damage_shadow` int(11) NOT NULL default '0',
  `spell_damage_nature` int(11) NOT NULL default '0',
  `mana` int(11) NOT NULL default '0',
  `power` varchar(32) NOT NULL default '',
  `stat_int` int(11) NOT NULL default '0',
  `stat_int_c` int(11) NOT NULL default '0',
  `stat_int_b` int(11) NOT NULL default '0',
  `stat_int_d` int(11) NOT NULL default '0',
  `stat_agl` int(11) NOT NULL default '0',
  `stat_agl_c` int(11) NOT NULL default '0',
  `stat_agl_b` int(11) NOT NULL default '0',
  `stat_agl_d` int(11) NOT NULL default '0',
  `stat_sta` int(11) NOT NULL default '0',
  `stat_sta_c` int(11) NOT NULL default '0',
  `stat_sta_b` int(11) NOT NULL default '0',
  `stat_sta_d` int(11) NOT NULL default '0',
  `stat_str` int(11) NOT NULL default '0',
  `stat_str_c` int(11) NOT NULL default '0',
  `stat_str_b` int(11) NOT NULL default '0',
  `stat_str_d` int(11) NOT NULL default '0',
  `stat_spr` int(11) NOT NULL default '0',
  `stat_spr_c` int(11) NOT NULL default '0',
  `stat_spr_b` int(11) NOT NULL default '0',
  `stat_spr_d` int(11) NOT NULL default '0',
  `stat_def` int(11) NOT NULL default '0',
  `stat_def_c` int(11) NOT NULL default '0',
  `stat_def_b` int(11) NOT NULL default '0',
  `stat_def_d` int(11) NOT NULL default '0',
  `stat_armor` int(11) NOT NULL default '0',
  `stat_armor_c` int(11) NOT NULL default '0',
  `stat_armor_b` int(11) NOT NULL default '0',
  `stat_armor_d` int(11) NOT NULL default '0',
  `stat_block` int(11) NOT NULL default '0',
  `stat_block_c` int(11) NOT NULL default '0',
  `stat_block_b` int(11) NOT NULL default '0',
  `stat_block_d` int(11) NOT NULL default '0',
  `stat_parry` int(11) NOT NULL default '0',
  `stat_parry_c` int(11) NOT NULL default '0',
  `stat_parry_b` int(11) NOT NULL default '0',
  `stat_parry_d` int(11) NOT NULL default '0',
  `stat_defr` int(11) NOT NULL default '0',
  `stat_defr_c` int(11) NOT NULL default '0',
  `stat_defr_b` int(11) NOT NULL default '0',
  `stat_defr_d` int(11) NOT NULL default '0',
  `stat_dodge` int(11) NOT NULL default '0',
  `stat_dodge_c` int(11) NOT NULL default '0',
  `stat_dodge_b` int(11) NOT NULL default '0',
  `stat_dodge_d` int(11) NOT NULL default '0',
  `stat_res_ranged` int(11) NOT NULL default '0',
  `stat_res_spell` int(11) NOT NULL default '0',
  `stat_res_melee` int(11) NOT NULL default '0',
  `res_holy` int(11) NOT NULL default '0',
  `res_holy_c` int(11) NOT NULL default '0',
  `res_holy_b` int(11) NOT NULL default '0',
  `res_holy_d` int(11) NOT NULL default '0',
  `res_frost` int(11) NOT NULL default '0',
  `res_frost_c` int(11) NOT NULL default '0',
  `res_frost_b` int(11) NOT NULL default '0',
  `res_frost_d` int(11) NOT NULL default '0',
  `res_arcane` int(11) NOT NULL default '0',
  `res_arcane_c` int(11) NOT NULL default '0',
  `res_arcane_b` int(11) NOT NULL default '0',
  `res_arcane_d` int(11) NOT NULL default '0',
  `res_fire` int(11) NOT NULL default '0',
  `res_fire_c` int(11) NOT NULL default '0',
  `res_fire_b` int(11) NOT NULL default '0',
  `res_fire_d` int(11) NOT NULL default '0',
  `res_shadow` int(11) NOT NULL default '0',
  `res_shadow_c` int(11) NOT NULL default '0',
  `res_shadow_b` int(11) NOT NULL default '0',
  `res_shadow_d` int(11) NOT NULL default '0',
  `res_nature` int(11) NOT NULL default '0',
  `res_nature_c` int(11) NOT NULL default '0',
  `res_nature_b` int(11) NOT NULL default '0',
  `res_nature_d` int(11) NOT NULL default '0',
  `pvp_ratio` float NOT NULL default '0',
  `sessionHK` int(11) NOT NULL default '0',
  `sessionCP` int(11) NOT NULL default '0',
  `yesterdayHK` int(11) NOT NULL default '0',
  `yesterdayContribution` int(11) NOT NULL default '0',
  `lifetimeHK` int(11) NOT NULL default '0',
  `lifetimeRankName` varchar(64) NOT NULL default '0',
  `honorpoints` int(11) NOT NULL default '0',
  `arenapoints` int(11) NOT NULL default '0',
  `dodge` float NOT NULL default '0',
  `parry` float NOT NULL default '0',
  `block` float NOT NULL default '0',
  `mitigation` float NOT NULL default '0',
  `crit` float NOT NULL default '0',
  `mastery` VARCHAR( 10 ) NOT NULL default '0',
  `mastery_tooltip` MEDIUMTEXT NULL DEFAULT NULL,
  `ilevel` VARCHAR( 20 ) NOT NULL default '0',
  `pvppower` VARCHAR( 20 ) NOT NULL default '0',
  `pvppower_bonus` VARCHAR( 20 ) NOT NULL default '0',
  `lifetimeHighestRank` int(11) NOT NULL default '0',
  `clientLocale` varchar(4) NOT NULL default '',
  `timeplayed` int(11) NOT NULL default '0',
  `timelevelplayed` int(11) NOT NULL default '0',
  PRIMARY KEY  (`member_id`),
  KEY `name` (`name`,`server`),
  KEY `char` (`region`,`server`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Quest Data

DROP TABLE IF EXISTS `renprefix_quest_data`;
CREATE TABLE `renprefix_quest_data` (
  `quest_id` int(11) NOT NULL default '0',
  `quest_name` varchar(64) NOT NULL default '',
  `quest_level` int(11) unsigned NOT NULL default '0',
  `quest_tag` varchar(32) NOT NULL default '',
  `group` int(1) NOT NULL default '0',
  `daily` int(1) NOT NULL default '0',
  `reward_money` int(11) NOT NULL default '0',
  `zone` varchar(32) NOT NULL default '',
  `description` text NOT NULL,
  `objective` text NOT NULL,
  `locale` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`quest_id`,`locale`),
  FULLTEXT KEY `quest_name` (`quest_name`),
  FULLTEXT KEY `zone` (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Quests

DROP TABLE IF EXISTS `renprefix_quests`;
CREATE TABLE `renprefix_quests` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `quest_id` int(11) NOT NULL default '0',
  `quest_index` int(11) NOT NULL default '0',
  `difficulty` int(1) NOT NULL default '0',
  `is_complete` int(1) NOT NULL default '0',
  PRIMARY KEY  (`member_id`,`quest_id`),
  KEY `quest_index` (`quest_id`,`quest_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Realmstatus

DROP TABLE IF EXISTS `renprefix_realmstatus`;
CREATE TABLE `renprefix_realmstatus` (
  `server_name` varchar(20) NOT NULL default '',
  `server_region` varchar(2) NOT NULL default '',
  `servertype` varchar(20) NOT NULL default '',
  `serverstatus` varchar(20) NOT NULL default '',
  `serverpop` varchar(20) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  UNIQUE KEY `server_name` (`server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Recipes

DROP TABLE IF EXISTS `renprefix_recipes`;
CREATE TABLE `renprefix_recipes` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `recipe_id` varchar(32) default NULL,
  `item_id` varchar(64) default NULL,
  `recipe_name` varchar(64) NOT NULL default '',
  `recipe_type` varchar(100) NOT NULL default '',
  `recipe_sub_type` VARCHAR( 100 ) NULL DEFAULT NULL,
  `skill_name` varchar(64) NOT NULL default '',
  `difficulty` int(11) NOT NULL default '0',
  `item_color` varchar(16) NOT NULL,
  `reagents` mediumtext NOT NULL,
  `recipe_texture` varchar(64) NOT NULL default '',
  `recipe_tooltip` mediumtext NOT NULL,
  `level` int(11) default NULL,
  `item_level` int(11) default NULL,
  PRIMARY KEY  (`member_id`,`skill_name`,`recipe_name`),
  KEY `skill_nameI` (`skill_name`),
  KEY `recipe_nameI` (`recipe_name`),
  KEY `levelI` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Recipe Reagents

DROP TABLE IF EXISTS `renprefix_recipes_reagents`;
CREATE TABLE IF NOT EXISTS `renprefix_recipes_reagents` (
  `member_id` int(11) unsigned NOT NULL DEFAULT '0',
  `reagent_name` varchar(96) NOT NULL DEFAULT '',
  `reagent_color` varchar(16) NOT NULL DEFAULT '',
  `reagent_id` varchar(64) NOT NULL DEFAULT '',
  `reagent_texture` varchar(64) NOT NULL DEFAULT '',
  `reagent_count` int(11) DEFAULT NULL,
  `reagent_tooltip` mediumtext NOT NULL,
  `level` int(11) DEFAULT NULL,
  `reagent_level` int(11) DEFAULT NULL,
  `reagent_type` varchar(64) DEFAULT NULL,
  `reagent_subtype` varchar(64) DEFAULT NULL,
  `reagent_rarity` int(4) NOT NULL DEFAULT '-1',
  `locale` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`reagent_id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Reputation

DROP TABLE IF EXISTS `renprefix_reputation`;
CREATE TABLE `renprefix_reputation` (
  `member_id` int(10) unsigned NOT NULL default '0',
  `faction` varchar(32) NOT NULL default '',
  `parent` varchar(32) default NULL,
  `name` varchar(32) NOT NULL default '',
  `curr_rep` int(8) default NULL,
  `max_rep` int(8) default NULL,
  `AtWar` int(11) NOT NULL default '0',
  `Standing` varchar(32) default '',
  `Description` mediumtext NULL,
  PRIMARY KEY  (`member_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Skills

DROP TABLE IF EXISTS `renprefix_skills`;
CREATE TABLE `renprefix_skills` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `skill_type` varchar(32) NOT NULL default '',
  `skill_name` varchar(32) NOT NULL default '',
  `skill_order` int(11) NOT NULL default '0',
  `skill_level` varchar(16) NOT NULL default '',
  PRIMARY KEY  (`member_id`,`skill_name`),
  KEY `skill_type` (`skill_type`),
  KEY `skill_name` (`skill_name`),
  KEY `skill_order` (`skill_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Spellbook

DROP TABLE IF EXISTS `renprefix_spellbook`;
CREATE TABLE `renprefix_spellbook` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `spell_build` tinyint(2) NOT NULL default '0',
  `spell_name` varchar(64) NOT NULL default '',
  `spell_type` varchar(100) NOT NULL default '',
  `spell_texture` varchar(64) NOT NULL default '',
  `spell_rank` varchar(64) NOT NULL default '',
  `spell_tooltip` mediumtext NOT NULL,
  PRIMARY KEY  (`member_id`,`spell_build`,`spell_name`,`spell_rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Spellbook Tree

DROP TABLE IF EXISTS `renprefix_spellbooktree`;
CREATE TABLE `renprefix_spellbooktree` (
  `member_id` int(11) unsigned NOT NULL default '0',
  `spell_build` tinyint(2) NOT NULL default '0',
  `spell_type` varchar(64) NOT NULL default '',
  `spell_texture` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`member_id`,`spell_build`,`spell_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Talents

DROP TABLE IF EXISTS `renprefix_talents`;
CREATE TABLE `renprefix_talents` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `build` tinyint(2) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `tree` varchar(64) NOT NULL DEFAULT '',
  `row` tinyint(4) NOT NULL DEFAULT '0',
  `column` tinyint(4) NOT NULL DEFAULT '0',
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `maxrank` tinyint(4) NOT NULL DEFAULT '0',
  `tooltip` mediumtext NOT NULL,
  `texture` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`,`build`,`tree`,`row`,`column`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_talents_data`;
CREATE TABLE `renprefix_talents_data` (
  `talent_id` int(11) NOT NULL DEFAULT '0',
  `talent_num` int(11) NOT NULL DEFAULT '0',
  `tree_order` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `tree` varchar(1) NOT NULL DEFAULT '',
  `row` tinyint(4) NOT NULL DEFAULT '0',
  `column` tinyint(4) NOT NULL DEFAULT '0',
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `tooltip` mediumtext NOT NULL,
  `texture` varchar(64) NOT NULL DEFAULT '',
  `isspell` int(1) DEFAULT '0',
  PRIMARY KEY (`rank`,`tree`,`tree_order`,`row`,`column`,`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_talenttree`;
CREATE TABLE `renprefix_talenttree` (
  `member_id` int(11) NOT NULL DEFAULT '0',
  `build` tinyint(2) NOT NULL DEFAULT '0',
  `tree` varchar(64) NOT NULL DEFAULT '',
  `background` varchar(64) NOT NULL DEFAULT '',
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `pointsspent` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`,`build`,`tree`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_talenttree_data`;
CREATE TABLE `renprefix_talenttree_data` (
`class_id` int(11) NOT NULL DEFAULT '0',
  `build` tinyint(2) NOT NULL DEFAULT '0',
  `tree` varchar(64) NOT NULL DEFAULT '',
  `tree_num` varchar(64) NOT NULL DEFAULT '',
  `background` varchar(64) NOT NULL DEFAULT '',
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(64) NOT NULL DEFAULT '',
  `roles` varchar(10) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`class_id`,`build`,`tree`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_talent_builds`;
CREATE TABLE `renprefix_talent_builds` (
`member_id` int(11) NOT NULL DEFAULT '0',
  `build` tinyint(2) NOT NULL DEFAULT '0',
  `tree` varchar(200) NOT NULL DEFAULT '',
  `spec` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`member_id`,`build`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `renprefix_talent_mastery`;
CREATE TABLE `renprefix_talent_mastery` (
  `class_id` int(11) NOT NULL DEFAULT '0',
  `tree` varchar(64) NOT NULL DEFAULT '',
  `tree_num` varchar(64) NOT NULL DEFAULT '',
  `icon` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `spell_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`class_id`,`spell_id`,`tree`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Upload rules

DROP TABLE IF EXISTS `renprefix_upload`;
CREATE TABLE `renprefix_upload` (
  `rule_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `server` varchar(32) NOT NULL default '',
  `region` char(2) NOT NULL default '',
  `type` tinyint(4) NOT NULL default '0',
  `default` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# --------------------------------------------------------
### Web Data table

DROP TABLE IF EXISTS `renprefix_webdb_cache`;
CREATE TABLE `renprefix_webdb_cache` (
  `item_id` int(11) NOT NULL,
  `texture` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_level` int(11) NOT NULL,
  `required_level` int(11) NOT NULL,
  `locale` varchar(4) NOT NULL,
  `timestamp` int(8) NOT NULL,
  `tooltip_html` varchar(255) NOT NULL COMMENT 'passed from web db, not roster parsed tooltip_html',
  `basestats` mediumtext NOT NULL,
  `sockets` varchar(32) default NULL,
  `source_id` smallint(8) NOT NULL COMMENT 'source data was collected from',
  PRIMARY KEY  (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
