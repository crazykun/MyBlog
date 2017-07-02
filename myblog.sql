/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-07-02 23:59:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `think_admin_user`;
CREATE TABLE `think_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of think_admin_user
-- ----------------------------
INSERT INTO `think_admin_user` VALUES ('1', 'admin', '0dfc7612f607db6c17fd99388e9e5f9c', '1', '2017-03-28 09:33:49', null, '2017-07-02 23:51:22', '0.0.0.0');
INSERT INTO `think_admin_user` VALUES ('2', 'test', 'b9b433cfeb75458aea0cd77cef76f5bf', '1', '2017-03-28 09:33:52', null, '2017-04-01 15:22:20', '127.0.0.1');

-- ----------------------------
-- Table structure for think_article
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES ('1', '1', '测试', '测试', '测试', '一阵风', '1', '0', '/uploads/20170330/0e262bc5b3c3a46e72fcc3d01200b0a4.jpg', null, '1', '1', '2017-03-30 18:32:28', '2017-03-30 18:32:04', null);

-- ----------------------------
-- Table structure for think_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理组', '1', '1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72');

-- ----------------------------
-- Table structure for think_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('1', '1');
INSERT INTO `think_auth_group_access` VALUES ('2', '1');

-- ----------------------------
-- Table structure for think_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='规则表';

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', 'admin/System/default', '系统配置', '1', '1', '0', 'fa fa-gears', '5', '');
INSERT INTO `think_auth_rule` VALUES ('2', 'admin/System/siteConfig', '站点配置', '1', '1', '1', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('3', 'admin/System/updateSiteConfig', '更新配置', '1', '0', '1', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('5', 'admin/Menu/default', '菜单管理', '1', '1', '0', 'fa fa-bars', '4', '');
INSERT INTO `think_auth_rule` VALUES ('6', 'admin/Menu/index', '后台菜单', '1', '1', '5', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('7', 'admin/Menu/add', '添加菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('8', 'admin/Menu/save', '保存菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('9', 'admin/Menu/edit', '编辑菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('10', 'admin/Menu/update', '更新菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('11', 'admin/Menu/delete', '删除菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('12', 'admin/Nav/index', '导航管理', '1', '1', '5', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('13', 'admin/Category/index', '栏目管理', '1', '1', '14', 'fa fa-sitemap', '0', '');
INSERT INTO `think_auth_rule` VALUES ('14', 'admin/Content/default', '内容管理', '1', '1', '0', 'fa fa-file-text', '1', '');
INSERT INTO `think_auth_rule` VALUES ('15', 'admin/Article/index', '文章管理', '1', '1', '14', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('16', 'admin/User/default', '用户管理', '1', '1', '0', 'fa fa-users', '3', '');
INSERT INTO `think_auth_rule` VALUES ('17', 'admin/User/index', '普通用户', '1', '1', '16', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('18', 'admin/AdminUser/index', '管理员', '1', '1', '16', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('19', 'admin/AuthGroup/index', '权限组', '1', '1', '16', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('20', 'admin/Category/add', '添加栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('21', 'admin/Category/save', '保存栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('22', 'admin/Category/edit', '编辑栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('23', 'admin/Category/update', '更新栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('24', 'admin/Category/delete', '删除栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('25', 'admin/Article/add', '添加文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('26', 'admin/Article/save', '保存文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('27', 'admin/Article/edit', '编辑文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('28', 'admin/Article/update', '更新文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('29', 'admin/Article/delete', '删除文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('30', 'admin/Article/toggle', '文章审核', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('31', 'admin/AuthGroup/add', '添加权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('32', 'admin/AuthGroup/save', '保存权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('33', 'admin/AuthGroup/edit', '编辑权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('34', 'admin/AuthGroup/update', '更新权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('35', 'admin/AuthGroup/delete', '删除权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('36', 'admin/AuthGroup/auth', '授权', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('37', 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('39', 'admin/Nav/add', '添加导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('40', 'admin/Nav/save', '保存导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('41', 'admin/Nav/edit', '编辑导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('42', 'admin/Nav/update', '更新导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('43', 'admin/Nav/delete', '删除导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('44', 'admin/User/add', '添加用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('45', 'admin/User/save', '保存用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('46', 'admin/User/edit', '编辑用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('47', 'admin/User/update', '更新用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('48', 'admin/User/delete', '删除用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('49', 'admin/AdminUser/add', '添加管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('50', 'admin/AdminUser/save', '保存管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('51', 'admin/AdminUser/edit', '编辑管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('52', 'admin/AdminUser/update', '更新管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('53', 'admin/AdminUser/delete', '删除管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('54', 'admin/Slide/default', '扩展管理', '1', '1', '0', 'fa fa-wrench', '2', '');
INSERT INTO `think_auth_rule` VALUES ('55', 'admin/SlideCategory/index', '轮播分类', '1', '1', '54', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('56', 'admin/Slide/index', '轮播图管理', '1', '1', '54', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('57', 'admin/Link/index', '友情链接', '1', '1', '54', 'fa fa-link', '0', '');
INSERT INTO `think_auth_rule` VALUES ('58', 'admin/SlideCategory/add', '添加分类', '1', '0', '55', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('59', 'admin/SlideCategory/save', '保存分类', '1', '0', '55', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('60', 'admin/SlideCategory/edit', '编辑分类', '1', '0', '55', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('61', 'admin/SlideCategory/update', '更新分类', '1', '0', '55', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('62', 'admin/SlideCategory/delete', '删除分类', '1', '0', '55', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('63', 'admin/Slide/add', '添加轮播', '1', '0', '56', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('64', 'admin/Slide/save', '保存轮播', '1', '0', '56', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('65', 'admin/Slide/edit', '编辑轮播', '1', '0', '56', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('66', 'admin/Slide/update', '更新轮播', '1', '0', '56', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('67', 'admin/Slide/delete', '删除轮播', '1', '0', '56', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('68', 'admin/Link/add', '添加链接', '1', '0', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('69', 'admin/Link/save', '保存链接', '1', '0', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('70', 'admin/Link/edit', '编辑链接', '1', '0', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('71', 'admin/Link/update', '更新链接', '1', '0', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('72', 'admin/Link/delete', '删除链接', '1', '0', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('73', 'admin/ChangePassword/index', '修改密码', '1', '1', '1', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('74', 'admin/ChangePassword/updatePassword', '更新密码', '1', '0', '1', '', '0', '');

-- ----------------------------
-- Table structure for think_category
-- ----------------------------
DROP TABLE IF EXISTS `think_category`;
CREATE TABLE `think_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) DEFAULT '' COMMENT '导航别名',
  `content` longtext COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `icon` varchar(20) DEFAULT '' COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT '' COMMENT '分类列表模板',
  `detail_template` varchar(50) DEFAULT '' COMMENT '分类详情模板',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT '' COMMENT '路径',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of think_category
-- ----------------------------
INSERT INTO `think_category` VALUES ('1', '分类一', '', '', '', '', '', '', '1', '0', '0', '0,', '2016-12-22 18:22:24');

-- ----------------------------
-- Table structure for think_link
-- ----------------------------
DROP TABLE IF EXISTS `think_link`;
CREATE TABLE `think_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of think_link
-- ----------------------------

-- ----------------------------
-- Table structure for think_nav
-- ----------------------------
DROP TABLE IF EXISTS `think_nav`;
CREATE TABLE `think_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of think_nav
-- ----------------------------
INSERT INTO `think_nav` VALUES ('1', '0', '技术分享', '', '', '', '_self', '1', '0', '2017-07-02 23:56:10', '2017-07-02 23:56:10');
INSERT INTO `think_nav` VALUES ('2', '0', '闲言碎语', '', '', '', '_self', '1', '0', '2017-07-02 23:58:15', '2017-07-02 23:58:15');
INSERT INTO `think_nav` VALUES ('3', '0', '关于ME', '', '', '', '_self', '1', '0', '2017-07-02 23:58:35', '2017-07-02 23:58:35');

-- ----------------------------
-- Table structure for think_slide
-- ----------------------------
DROP TABLE IF EXISTS `think_slide`;
CREATE TABLE `think_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '轮播图名称',
  `description` varchar(255) DEFAULT '' COMMENT '说明',
  `link` varchar(255) DEFAULT '' COMMENT '链接',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) DEFAULT '' COMMENT '轮播图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1 显示  0  隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of think_slide
-- ----------------------------
INSERT INTO `think_slide` VALUES ('1', '2', '广告', '', '', '_self', '/static/images/js.jpg', '1', '0');

-- ----------------------------
-- Table structure for think_slide_category
-- ----------------------------
DROP TABLE IF EXISTS `think_slide_category`;
CREATE TABLE `think_slide_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '轮播图分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='轮播图分类表';

-- ----------------------------
-- Records of think_slide_category
-- ----------------------------
INSERT INTO `think_slide_category` VALUES ('1', '首页轮播');
INSERT INTO `think_slide_category` VALUES ('2', '栏目侧边广告');

-- ----------------------------
-- Table structure for think_spider
-- ----------------------------
DROP TABLE IF EXISTS `think_spider`;
CREATE TABLE `think_spider` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` int(10) DEFAULT NULL,
  `Google` int(10) DEFAULT '0',
  `GoogleAdsense` int(10) DEFAULT '0',
  `Baidu` int(10) DEFAULT '0',
  `Sogou` int(10) DEFAULT '0',
  `Sogouweb` int(10) DEFAULT '0',
  `soso` int(10) DEFAULT '0',
  `360Spider` int(10) DEFAULT '0',
  `Yahoo` int(10) DEFAULT '0',
  `MSN` int(10) DEFAULT '0',
  `msnbot` int(10) DEFAULT '0',
  `Sohu` int(10) DEFAULT '0',
  `Yodao` int(10) DEFAULT '0',
  `Twiceler` int(10) DEFAULT '0',
  `Alexa_` int(10) DEFAULT '0',
  `Alexa` int(10) DEFAULT '0',
  `other` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='蜘蛛统计';

-- ----------------------------
-- Records of think_spider
-- ----------------------------
INSERT INTO `think_spider` VALUES ('1', '1486828800', '7', '0', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `think_spider` VALUES ('2', '1486915200', '65', '0', '58', '1', '0', '0', '396', '1', '0', '0', '0', '0', '0', '0', '0', '7');
INSERT INTO `think_spider` VALUES ('3', '1487001600', '104', '0', '57', '0', '0', '0', '248', '1', '0', '0', '0', '0', '0', '0', '0', '9');
INSERT INTO `think_spider` VALUES ('4', '1487088000', '64', '0', '36', '0', '0', '0', '196', '0', '0', '0', '0', '0', '0', '0', '0', '6');
INSERT INTO `think_spider` VALUES ('5', '1487174400', '22', '0', '32', '0', '0', '0', '230', '0', '0', '0', '0', '0', '0', '0', '0', '29');
INSERT INTO `think_spider` VALUES ('6', '1487260800', '42', '0', '31', '0', '0', '0', '300', '1', '0', '0', '0', '0', '0', '0', '0', '18');
INSERT INTO `think_spider` VALUES ('7', '1487347200', '483', '0', '31', '0', '0', '0', '315', '0', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `think_spider` VALUES ('8', '1487433600', '159', '0', '163', '0', '0', '0', '345', '0', '1', '0', '0', '0', '0', '0', '0', '6');
INSERT INTO `think_spider` VALUES ('9', '1487520000', '214', '0', '84', '0', '0', '0', '154', '0', '0', '0', '0', '0', '0', '0', '0', '7');
INSERT INTO `think_spider` VALUES ('10', '1487606400', '154', '0', '49', '2', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '6');
INSERT INTO `think_spider` VALUES ('11', '1487692800', '187', '0', '69', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '6');
INSERT INTO `think_spider` VALUES ('12', '1487779200', '125', '0', '50', '0', '0', '0', '163', '0', '1', '0', '0', '0', '0', '0', '0', '16');
INSERT INTO `think_spider` VALUES ('13', '1487865600', '649', '0', '93', '0', '0', '0', '56', '0', '3', '0', '0', '0', '0', '0', '0', '26');
INSERT INTO `think_spider` VALUES ('14', '1487952000', '525', '0', '62', '0', '0', '0', '421', '0', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `think_spider` VALUES ('15', '1488038400', '511', '0', '53', '0', '0', '0', '278', '0', '0', '0', '0', '0', '0', '0', '0', '13');
INSERT INTO `think_spider` VALUES ('16', '1488124800', '381', '0', '139', '0', '0', '0', '303', '0', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `think_spider` VALUES ('17', '1488211200', '601', '0', '19', '1', '0', '0', '172', '0', '0', '0', '0', '0', '0', '0', '0', '15');
INSERT INTO `think_spider` VALUES ('18', '1488297600', '391', '0', '138', '0', '0', '0', '414', '1', '0', '0', '0', '0', '0', '0', '0', '41');
INSERT INTO `think_spider` VALUES ('19', '1488384000', '60', '0', '52', '2', '0', '0', '302', '0', '2', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `think_spider` VALUES ('20', '1488470400', '25', '0', '66', '1', '0', '0', '282', '0', '2', '0', '0', '0', '0', '0', '0', '8');
INSERT INTO `think_spider` VALUES ('21', '1488556800', '30', '0', '26', '1', '0', '0', '280', '0', '1', '0', '0', '0', '0', '0', '0', '7');
INSERT INTO `think_spider` VALUES ('22', '1488643200', '19', '0', '31', '0', '0', '0', '239', '0', '1', '0', '0', '0', '0', '0', '0', '12');
INSERT INTO `think_spider` VALUES ('23', '1488729600', '39', '0', '28', '0', '0', '0', '261', '0', '0', '0', '0', '0', '0', '0', '0', '26');
INSERT INTO `think_spider` VALUES ('24', '1488816000', '31', '0', '88', '1', '0', '0', '142', '0', '1', '0', '0', '0', '0', '0', '0', '9');
INSERT INTO `think_spider` VALUES ('25', '1488902400', '82', '0', '50', '2', '0', '0', '267', '0', '3', '0', '0', '0', '0', '0', '0', '9');
INSERT INTO `think_spider` VALUES ('26', '1488988800', '24', '0', '73', '0', '0', '0', '358', '0', '3', '0', '0', '0', '0', '0', '0', '8');
INSERT INTO `think_spider` VALUES ('27', '1489075200', '32', '0', '145', '0', '0', '0', '229', '0', '1', '0', '0', '0', '0', '0', '0', '15');
INSERT INTO `think_spider` VALUES ('28', '1489161600', '146', '0', '58', '1', '0', '0', '335', '0', '0', '0', '0', '0', '0', '0', '0', '8');
INSERT INTO `think_spider` VALUES ('29', '1489248000', '54', '0', '78', '0', '0', '0', '172', '0', '1', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `think_spider` VALUES ('30', '1489334400', '22', '0', '150', '2', '0', '0', '601', '1', '1', '0', '0', '0', '0', '0', '0', '27');
INSERT INTO `think_spider` VALUES ('31', '1489420800', '55', '0', '49', '0', '0', '0', '49', '0', '0', '0', '0', '0', '0', '0', '0', '27');
INSERT INTO `think_spider` VALUES ('32', '1489507200', '48', '0', '75', '0', '0', '0', '388', '0', '0', '0', '0', '0', '0', '0', '0', '25');
INSERT INTO `think_spider` VALUES ('33', '1489593600', '24', '0', '54', '0', '0', '0', '191', '0', '3', '0', '0', '0', '0', '0', '0', '14');
INSERT INTO `think_spider` VALUES ('34', '1489680000', '20', '0', '75', '0', '0', '0', '281', '0', '2', '0', '0', '0', '0', '0', '0', '104');
INSERT INTO `think_spider` VALUES ('35', '1489680000', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `think_spider` VALUES ('36', '1489766400', '21', '0', '71', '0', '0', '0', '94', '0', '0', '0', '0', '0', '0', '0', '0', '145');
INSERT INTO `think_spider` VALUES ('37', '1489852800', '31', '0', '88', '0', '0', '0', '281', '0', '0', '0', '0', '0', '0', '0', '0', '167');
INSERT INTO `think_spider` VALUES ('38', '1489939200', '49', '0', '109', '0', '0', '0', '284', '0', '0', '0', '0', '0', '0', '0', '0', '233');
INSERT INTO `think_spider` VALUES ('39', '1490025600', '23', '0', '87', '1', '0', '0', '186', '0', '1', '0', '0', '0', '0', '0', '0', '12');
INSERT INTO `think_spider` VALUES ('40', '1490112000', '57', '0', '105', '3', '0', '0', '357', '0', '3', '0', '0', '0', '0', '0', '0', '251');
INSERT INTO `think_spider` VALUES ('41', '1490198400', '28', '0', '66', '0', '0', '0', '469', '3', '1', '0', '0', '0', '0', '0', '0', '85');
INSERT INTO `think_spider` VALUES ('42', '1490284800', '983', '0', '158', '0', '0', '0', '233', '1', '0', '0', '0', '0', '0', '0', '0', '68');
INSERT INTO `think_spider` VALUES ('43', '1490371200', '33', '0', '162', '0', '0', '0', '256', '3', '1', '0', '0', '0', '0', '0', '0', '57');
INSERT INTO `think_spider` VALUES ('44', '1490457600', '47', '0', '90', '0', '0', '0', '327', '3', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `think_spider` VALUES ('45', '1490544000', '36', '0', '103', '0', '0', '0', '219', '5', '0', '0', '0', '0', '0', '0', '0', '38');
INSERT INTO `think_spider` VALUES ('46', '1490630400', '50', '0', '135', '0', '0', '0', '241', '4', '1', '0', '0', '0', '0', '0', '0', '6');
INSERT INTO `think_spider` VALUES ('47', '1490716800', '66', '0', '129', '0', '0', '0', '264', '1', '0', '0', '0', '0', '0', '0', '0', '7');
INSERT INTO `think_spider` VALUES ('48', '1490803200', '13', '0', '44', '1', '0', '0', '164', '0', '1', '0', '0', '0', '0', '0', '0', '46');

-- ----------------------------
-- Table structure for think_system
-- ----------------------------
DROP TABLE IF EXISTS `think_system`;
CREATE TABLE `think_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `value` text NOT NULL COMMENT '配置项值',
  `group` int(5) DEFAULT NULL COMMENT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(5) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of think_system
-- ----------------------------
INSERT INTO `think_system` VALUES ('1', 'site_title', '网站标题', '吉趣 | 吉语自天成，妙手偶得之', '1', null, '0');
INSERT INTO `think_system` VALUES ('2', 'seo_title', 'SEO标题', 'MyBlog', '1', null, '0');
INSERT INTO `think_system` VALUES ('3', 'seo_keywords', 'SEO关键字', '', '1', null, '0');
INSERT INTO `think_system` VALUES ('4', 'seo_description', 'SEO说明', '后台管理系统', '1', null, '0');
INSERT INTO `think_system` VALUES ('5', 'site_copyright', '版权信息', '', '1', null, '0');
INSERT INTO `think_system` VALUES ('6', 'site_icp', 'ICP备案号', '', '1', null, '0');
INSERT INTO `think_system` VALUES ('7', 'site_tongji', '统计代码', '', '1', null, '0');
INSERT INTO `think_system` VALUES ('8', 'site_url', '网址网址', 'http://jifuns.com', '1', null, '0');

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', 'user', 'b27f5727b0f2eb1e58b633e7f3b01ff6', '', '', '1', '2017-04-01 15:25:12', '2017-04-01 15:25:12', null, '');

-- ----------------------------
-- Table structure for think_visitor
-- ----------------------------
DROP TABLE IF EXISTS `think_visitor`;
CREATE TABLE `think_visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站访问量表';

-- ----------------------------
-- Records of think_visitor
-- ----------------------------
INSERT INTO `think_visitor` VALUES ('1', '1486828800', '61');
INSERT INTO `think_visitor` VALUES ('2', '1486915200', '1684');
INSERT INTO `think_visitor` VALUES ('3', '1487001600', '1718');
INSERT INTO `think_visitor` VALUES ('4', '1487088000', '357');
INSERT INTO `think_visitor` VALUES ('5', '1487174400', '380');
INSERT INTO `think_visitor` VALUES ('6', '1487260800', '1075');
INSERT INTO `think_visitor` VALUES ('7', '1487347200', '2743');
INSERT INTO `think_visitor` VALUES ('8', '1487433600', '705');
INSERT INTO `think_visitor` VALUES ('9', '1487520000', '613');
INSERT INTO `think_visitor` VALUES ('10', '1487606400', '248');
INSERT INTO `think_visitor` VALUES ('11', '1487692800', '387');
INSERT INTO `think_visitor` VALUES ('12', '1490889600', '2');
INSERT INTO `think_visitor` VALUES ('13', '1490976000', '12');
INSERT INTO `think_visitor` VALUES ('14', '1491148800', '17');
INSERT INTO `think_visitor` VALUES ('15', '1498492800', '34');
INSERT INTO `think_visitor` VALUES ('16', '1498665600', '3');
INSERT INTO `think_visitor` VALUES ('17', '1498924800', '34');
