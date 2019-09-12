/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : shiro01

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-09-12 15:04:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限编号',
  `description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `rid` bigint(20) DEFAULT NULL COMMENT '此权限关联角色的id',
  `available` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_permissions_permission` (`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES ('31', 'resource:create', '用户新增', '23', '0');
INSERT INTO `sys_permissions` VALUES ('32', 'user:update', '用户修改', '23', '0');
INSERT INTO `sys_permissions` VALUES ('33', 'user:delete', '用户删除', '23', '0');
INSERT INTO `sys_permissions` VALUES ('34', 'user:view', '用户查看', '23', '0');
INSERT INTO `sys_permissions` VALUES ('35', 'role:update', '角色更新', '21', '0');
INSERT INTO `sys_permissions` VALUES ('36', 'role:delete', '角色删除', '21', '0');
INSERT INTO `sys_permissions` VALUES ('37', 'role:create', '角色创建', '21', '0');
INSERT INTO `sys_permissions` VALUES ('38', 'role:view', '角色查看', '21', '0');
INSERT INTO `sys_permissions` VALUES ('39', 'permission:delete', '权限删除', '21', '0');
INSERT INTO `sys_permissions` VALUES ('40', 'permission:create', '权限创建', '21', '0');
INSERT INTO `sys_permissions` VALUES ('41', 'permission:view', '权限查看', '21', '0');
INSERT INTO `sys_permissions` VALUES ('42', 'project:manage', '项目管理', '27', '0');
INSERT INTO `sys_permissions` VALUES ('43', 'project:distribution', '项目任务分配', '27', '0');
INSERT INTO `sys_permissions` VALUES ('44', 'project:develop', '项目开发', '28', '0');
INSERT INTO `sys_permissions` VALUES ('45', 'project:maintain', '项目维护', '28', '0');
INSERT INTO `sys_permissions` VALUES ('46', 'security:maintain', '安全维护', '30', '0');
INSERT INTO `sys_permissions` VALUES ('47', 'security:develop', '安全功能设计', '30', '0');
INSERT INTO `sys_permissions` VALUES ('48', 'security:test', '安全测试', '31', '0');
INSERT INTO `sys_permissions` VALUES ('49', 'security:bug-test', 'BUG检测', '31', '0');
INSERT INTO `sys_permissions` VALUES ('53', 'security:manager', '安全管理员2', '31', '0');
INSERT INTO `sys_permissions` VALUES ('54', 'engineer:update', '工程更新', '41', '0');
INSERT INTO `sys_permissions` VALUES ('55', 'sell:add', '销售人员添加', '43', '0');

-- ----------------------------
-- Table structure for `sys_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `pid` bigint(20) DEFAULT NULL COMMENT '父节点',
  `available` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_roles_role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('21', 'admin', '总经理', '0', '0');
INSERT INTO `sys_roles` VALUES ('22', 'personnel', '人事部', '0', '0');
INSERT INTO `sys_roles` VALUES ('23', 'personnel-resource', '人力资源部部长', '22', '0');
INSERT INTO `sys_roles` VALUES ('24', 'personnel-administration', '行政部部长', '22', '0');
INSERT INTO `sys_roles` VALUES ('26', 'technical', '技术部', '0', '0');
INSERT INTO `sys_roles` VALUES ('27', 'technical-development', '项目经理', '26', '0');
INSERT INTO `sys_roles` VALUES ('28', 'technical-maintenance', '项目组组长', '26', '0');
INSERT INTO `sys_roles` VALUES ('29', 'security', '安全部', '0', '0');
INSERT INTO `sys_roles` VALUES ('30', 'security-net', '网络安全部负责人', '29', '0');
INSERT INTO `sys_roles` VALUES ('31', 'security-test', '项目安全测试人员1', '29', '0');
INSERT INTO `sys_roles` VALUES ('40', 'engineer', '工程部', '0', '0');
INSERT INTO `sys_roles` VALUES ('41', 'engineer-manager', '工程关理', '40', '0');
INSERT INTO `sys_roles` VALUES ('42', 'shop-sell', '销售部', '0', '0');
INSERT INTO `sys_roles` VALUES ('43', 'shop-sell-manager', '销售主管', '42', '0');

-- ----------------------------
-- Table structure for `sys_roles_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  `permission_id` bigint(20) DEFAULT NULL COMMENT '权限编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_roles_permissions
-- ----------------------------
INSERT INTO `sys_roles_permissions` VALUES ('1', '21', '35');
INSERT INTO `sys_roles_permissions` VALUES ('2', '21', '36');
INSERT INTO `sys_roles_permissions` VALUES ('3', '21', '37');
INSERT INTO `sys_roles_permissions` VALUES ('4', '21', '38');
INSERT INTO `sys_roles_permissions` VALUES ('5', '21', '39');
INSERT INTO `sys_roles_permissions` VALUES ('6', '21', '40');
INSERT INTO `sys_roles_permissions` VALUES ('7', '21', '41');
INSERT INTO `sys_roles_permissions` VALUES ('8', '23', '31');
INSERT INTO `sys_roles_permissions` VALUES ('9', '23', '32');
INSERT INTO `sys_roles_permissions` VALUES ('10', '23', '33');
INSERT INTO `sys_roles_permissions` VALUES ('11', '23', '34');
INSERT INTO `sys_roles_permissions` VALUES ('14', '28', '44');
INSERT INTO `sys_roles_permissions` VALUES ('15', '28', '45');
INSERT INTO `sys_roles_permissions` VALUES ('16', '30', '46');
INSERT INTO `sys_roles_permissions` VALUES ('17', '30', '47');
INSERT INTO `sys_roles_permissions` VALUES ('18', '31', '48');
INSERT INTO `sys_roles_permissions` VALUES ('19', '31', '49');
INSERT INTO `sys_roles_permissions` VALUES ('20', '31', null);
INSERT INTO `sys_roles_permissions` VALUES ('21', '31', null);
INSERT INTO `sys_roles_permissions` VALUES ('22', '0', null);
INSERT INTO `sys_roles_permissions` VALUES ('23', '31', null);
INSERT INTO `sys_roles_permissions` VALUES ('29', '27', '43');
INSERT INTO `sys_roles_permissions` VALUES ('31', '27', '42');
INSERT INTO `sys_roles_permissions` VALUES ('32', '41', '53');
INSERT INTO `sys_roles_permissions` VALUES ('33', '41', null);
INSERT INTO `sys_roles_permissions` VALUES ('37', '41', '54');

-- ----------------------------
-- Table structure for `sys_users`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL COMMENT '盐值',
  `role_id` varchar(50) DEFAULT NULL COMMENT '角色列表',
  `locked` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_users_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES ('1', 'admin', '95657d3e3052fb39d70d610c70a9a575', '87cc486c53b49f72f5b96bb55d93bc7f', '超级管理员', '0');
INSERT INTO `sys_users` VALUES ('2', 'tycoding', '7de3848c92d39e98f7c74139f1a079d7', '6478ccf88032592fe9396f008408400b', '普通管理员', '0');
INSERT INTO `sys_users` VALUES ('3', '涂陌', '7247c372a4aae00c2f78239739384c0b', 'f0a35a4d99e23ad4a59616bd4d8eea02', '普通用户', '0');
INSERT INTO `sys_users` VALUES ('7', 'huawei1', '09eae453e8d4ef5479cb8cdabc35e2e0', '1a00c58ad7b8b198fccf99ddbf750bb6', null, '0');

-- ----------------------------
-- Table structure for `sys_users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES ('1', '1', '21');
INSERT INTO `sys_users_roles` VALUES ('2', '2', '27');
INSERT INTO `sys_users_roles` VALUES ('3', '2', '30');
