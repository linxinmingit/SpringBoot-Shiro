/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : springboot-shiro

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-03-12 14:39:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `urlDescription` varchar(64) DEFAULT NULL COMMENT 'url描述',
  `requestMode` varchar(10) DEFAULT NULL COMMENT '请求方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '/user/user', '查询用户', 'GET');
INSERT INTO `permission` VALUES ('2', '/role/role', '查询角色', 'GET');
INSERT INTO `permission` VALUES ('3', '/permission/permission', '查询权限', 'GET');
INSERT INTO `permission` VALUES ('4', '/role/role', '添加角色', 'POST');
INSERT INTO `permission` VALUES ('5', '/role/role/*', '删除角色', 'DELETE');
INSERT INTO `permission` VALUES ('6', '/role/role', '修改角色', 'PUT');
INSERT INTO `permission` VALUES ('7', '/role/role/*', '跳入角色修改页面', 'GET');
INSERT INTO `permission` VALUES ('8', '/role/add', '跳入角色添加页面', 'GET');
INSERT INTO `permission` VALUES ('9', '/user/user', '添加用户', 'POST');
INSERT INTO `permission` VALUES ('10', '/user/user/*', '删除用户', 'DELETE');
INSERT INTO `permission` VALUES ('11', '/user/user', '修改用户', 'PUT');
INSERT INTO `permission` VALUES ('12', '/user/user/*', '跳入用户修改页面', 'GET');
INSERT INTO `permission` VALUES ('13', '/user/add', '跳入用户添加页面', 'GET');
INSERT INTO `permission` VALUES ('14', '/permission/permission/*', '跳入权限修改页面', 'GET');
INSERT INTO `permission` VALUES ('15', '/permission/add', '跳入权限添加页面', 'GET');
INSERT INTO `permission` VALUES ('16', '/user/role_echo', '角色回显', 'GET');
INSERT INTO `permission` VALUES ('17', '/user/addRole', '给用户添加角色', 'POST');
INSERT INTO `permission` VALUES ('18', '/role/permission_echo', '权限回显', 'GET');
INSERT INTO `permission` VALUES ('19', '/role/addPermission', '给角色添加权限', 'POST');
INSERT INTO `permission` VALUES ('20', '/permission/permission/*', '删除权限', 'DELETE');
INSERT INTO `permission` VALUES ('21', '/permission/permission', '修改权限', 'PUT');
INSERT INTO `permission` VALUES ('22', '/permission/permission', '添加权限', 'POST');
INSERT INTO `permission` VALUES ('23', '/login/jumpRole', '跳入角色页面', 'GET');
INSERT INTO `permission` VALUES ('24', '/login/jumpUser', '跳入用户页面', 'GET');
INSERT INTO `permission` VALUES ('25', '/login/jumpPermission', '跳入权限页面', 'GET');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(32) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'add');
INSERT INTO `role` VALUES ('3', 'role');
INSERT INTO `role` VALUES ('4', '邹想云');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '4');
INSERT INTO `role_permission` VALUES ('1', '5');
INSERT INTO `role_permission` VALUES ('1', '6');
INSERT INTO `role_permission` VALUES ('1', '7');
INSERT INTO `role_permission` VALUES ('1', '8');
INSERT INTO `role_permission` VALUES ('1', '9');
INSERT INTO `role_permission` VALUES ('1', '10');
INSERT INTO `role_permission` VALUES ('1', '11');
INSERT INTO `role_permission` VALUES ('1', '12');
INSERT INTO `role_permission` VALUES ('1', '13');
INSERT INTO `role_permission` VALUES ('1', '14');
INSERT INTO `role_permission` VALUES ('1', '15');
INSERT INTO `role_permission` VALUES ('1', '16');
INSERT INTO `role_permission` VALUES ('1', '17');
INSERT INTO `role_permission` VALUES ('1', '18');
INSERT INTO `role_permission` VALUES ('1', '19');
INSERT INTO `role_permission` VALUES ('1', '20');
INSERT INTO `role_permission` VALUES ('1', '21');
INSERT INTO `role_permission` VALUES ('1', '22');
INSERT INTO `role_permission` VALUES ('1', '23');
INSERT INTO `role_permission` VALUES ('1', '24');
INSERT INTO `role_permission` VALUES ('1', '25');
INSERT INTO `role_permission` VALUES ('4', '20');
INSERT INTO `role_permission` VALUES ('4', '4');
INSERT INTO `role_permission` VALUES ('4', '9');
INSERT INTO `role_permission` VALUES ('4', '8');
INSERT INTO `role_permission` VALUES ('4', '24');
INSERT INTO `role_permission` VALUES ('4', '21');
INSERT INTO `role_permission` VALUES ('4', '1');
INSERT INTO `role_permission` VALUES ('4', '3');
INSERT INTO `role_permission` VALUES ('4', '23');
INSERT INTO `role_permission` VALUES ('4', '13');
INSERT INTO `role_permission` VALUES ('4', '15');
INSERT INTO `role_permission` VALUES ('4', '12');
INSERT INTO `role_permission` VALUES ('4', '25');
INSERT INTO `role_permission` VALUES ('4', '14');
INSERT INTO `role_permission` VALUES ('4', '2');
INSERT INTO `role_permission` VALUES ('4', '7');
INSERT INTO `role_permission` VALUES ('4', '18');
INSERT INTO `role_permission` VALUES ('4', '17');
INSERT INTO `role_permission` VALUES ('4', '22');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'tzh_java@126.com', '123456', '2017-05-10 20:22:59', '2019-03-12 06:12:51', '1');
INSERT INTO `user` VALUES ('2', 'liucong', 'yc_java@126.com', '123456', '2019-03-05 14:02:56', '2019-03-11 09:20:41', '1');
INSERT INTO `user` VALUES ('4', 'test', 'test@126.com', '123456', '2019-03-06 12:09:30', '2019-03-11 03:11:52', '1');
INSERT INTO `user` VALUES ('12', '邹想云', 'zxy_java@126.com', '123456', '2019-03-11 09:23:20', '2019-03-12 06:11:45', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('1', '2');
INSERT INTO `user_role` VALUES ('2', '2');
INSERT INTO `user_role` VALUES ('5', '2');
INSERT INTO `user_role` VALUES ('5', '1');
INSERT INTO `user_role` VALUES ('5', '3');
INSERT INTO `user_role` VALUES ('6', '4');
INSERT INTO `user_role` VALUES ('8', '6');
INSERT INTO `user_role` VALUES ('4', '3');
INSERT INTO `user_role` VALUES ('10', '4');
INSERT INTO `user_role` VALUES ('12', '4');
