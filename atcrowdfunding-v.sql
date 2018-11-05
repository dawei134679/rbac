/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : atcrowdfunding-v

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-11-05 16:56:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '系统菜单', '0', null, null);
INSERT INTO `t_permission` VALUES ('2', '控制面板', '1', null, null);
INSERT INTO `t_permission` VALUES ('3', '权限管理', '1', null, null);
INSERT INTO `t_permission` VALUES ('4', '用户维护', '3', '/user/index', null);
INSERT INTO `t_permission` VALUES ('5', '角色维护', '3', '/role/index', null);
INSERT INTO `t_permission` VALUES ('6', '许可维护', '3', '/permission/index', null);

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'PM-项目经理');
INSERT INTO `t_role` VALUES ('2', 'SE-软件工程师');
INSERT INTO `t_role` VALUES ('3', 'PG-程序员');
INSERT INTO `t_role` VALUES ('4', 'TL-组长');
INSERT INTO `t_role` VALUES ('5', 'GL-组长');
INSERT INTO `t_role` VALUES ('6', 'QC-品质控制');
INSERT INTO `t_role` VALUES ('7', 'SA-软件架构师');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `roleid` int(10) NOT NULL,
  `permissionid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('13', '1', '1');
INSERT INTO `t_role_permission` VALUES ('14', '1', '2');
INSERT INTO `t_role_permission` VALUES ('15', '1', '3');
INSERT INTO `t_role_permission` VALUES ('16', '1', '4');
INSERT INTO `t_role_permission` VALUES ('17', '1', '5');
INSERT INTO `t_role_permission` VALUES ('18', '1', '6');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `loginacct` varchar(255) NOT NULL DEFAULT '',
  `userpswd` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createtime` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin', '532231254@qq.com', '2018年10月23日');
INSERT INTO `t_user` VALUES ('2', 'test', 'test', '123456', '532231254@qq.com', '2018-11-02 16:46:05');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `roleid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('2', '2', '1');
