/*
Navicat MySQL Data Transfer

Source Server         : 本地开发服务器
Source Server Version : 50613
Source Host           : 127.0.0.1:3306
Source Database       : industry-cloud

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2019-09-25 09:46:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_order
-- ----------------------------
DROP TABLE IF EXISTS `order_order`;
CREATE TABLE `order_order` (
  `id` varchar(32) NOT NULL COMMENT '订单ID',
  `order_no` varchar(50) NOT NULL COMMENT '订单编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单总价（单位元）',
  `order_time` bigint(20) NOT NULL COMMENT '订购时间',
  `pay_time` bigint(20) DEFAULT NULL COMMENT '付款时间',
  `order_status` smallint(2) NOT NULL COMMENT '订单状态（0:待付款 1：已付款  ）',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表';

-- ----------------------------
-- Records of order_order
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'id',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `app_id` varchar(32) DEFAULT NULL COMMENT 'app_id',
  `app_name` varchar(80) DEFAULT NULL COMMENT 'app名称',
  `app_version` varchar(30) DEFAULT NULL COMMENT 'app版本号',
  `tier_id` varchar(32) DEFAULT NULL COMMENT '套餐id',
  `tier_name` varchar(80) NOT NULL COMMENT '套餐名称',
  `tier_cpu` int(11) DEFAULT NULL COMMENT 'CPU数量',
  `tier_ram` int(11) DEFAULT NULL COMMENT '内存大小',
  `tier_disk` int(11) DEFAULT NULL COMMENT '磁盘大小',
  `tier_price` decimal(10,2) NOT NULL COMMENT '套餐价格（以元为存储单位）',
  `tier_other` varchar(32) DEFAULT NULL COMMENT '其他',
  `months` int(11) DEFAULT NULL COMMENT '时长',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for prod_app_category
-- ----------------------------
DROP TABLE IF EXISTS `prod_app_category`;
CREATE TABLE `prod_app_category` (
  `id` varchar(32) NOT NULL,
  `name` varchar(60) NOT NULL COMMENT '分类名称',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app分类表';

-- ----------------------------
-- Records of prod_app_category
-- ----------------------------

-- ----------------------------
-- Table structure for prod_app_category_rel
-- ----------------------------
DROP TABLE IF EXISTS `prod_app_category_rel`;
CREATE TABLE `prod_app_category_rel` (
  `id` varchar(32) NOT NULL,
  `app_id` varchar(32) NOT NULL COMMENT 'appid',
  `category_id` varchar(32) NOT NULL COMMENT '分类Id',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app分类关系表';

-- ----------------------------
-- Records of prod_app_category_rel
-- ----------------------------

-- ----------------------------
-- Table structure for prod_app_info
-- ----------------------------
DROP TABLE IF EXISTS `prod_app_info`;
CREATE TABLE `prod_app_info` (
  `id` varchar(32) NOT NULL COMMENT '工业APPID',
  `name` varchar(80) NOT NULL COMMENT 'APP名称',
  `version` varchar(30) NOT NULL COMMENT '版本号',
  `param_id` varchar(20) DEFAULT NULL COMMENT 'APP参数ID',
  `introduction` varchar(1024) DEFAULT NULL COMMENT 'APP简介',
  `shortcut` varchar(256) DEFAULT NULL COMMENT 'APP快照文件名',
  `attachment` varchar(256) DEFAULT NULL COMMENT 'APP附件材料文件名',
  `min_flavor_id` varchar(1024) NOT NULL COMMENT '最低要求Flavor_ID',
  `views` int(11) DEFAULT NULL COMMENT '浏览次数',
  `shelve_time` bigint(20) DEFAULT NULL COMMENT '上架时间',
  `sales` int(11) DEFAULT NULL COMMENT '订购量',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业APP信息表';

-- ----------------------------
-- Records of prod_app_info
-- ----------------------------

-- ----------------------------
-- Table structure for prod_app_params
-- ----------------------------
DROP TABLE IF EXISTS `prod_app_params`;
CREATE TABLE `prod_app_params` (
  `id` varchar(32) NOT NULL COMMENT '工业APPID',
  `name` varchar(80) NOT NULL COMMENT '工业APP名称',
  `port` varchar(10) NOT NULL COMMENT '端口号',
  `ip` varchar(23) NOT NULL COMMENT 'IP地址',
  `params` varchar(1024) NOT NULL COMMENT '参数表',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业APP参数表';

-- ----------------------------
-- Records of prod_app_params
-- ----------------------------

-- ----------------------------
-- Table structure for prod_app_tier
-- ----------------------------
DROP TABLE IF EXISTS `prod_app_tier`;
CREATE TABLE `prod_app_tier` (
  `id` varchar(32) NOT NULL COMMENT '套餐ID',
  `name` varchar(80) NOT NULL COMMENT '套餐名称',
  `cpu` int(11) DEFAULT NULL COMMENT 'CPU数量',
  `ram` int(11) DEFAULT NULL COMMENT '内存大小',
  `disk` int(11) DEFAULT NULL COMMENT '磁盘大小',
  `other` varchar(32) DEFAULT NULL COMMENT '其他',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品套餐信息表';

-- ----------------------------
-- Records of prod_app_tier
-- ----------------------------

-- ----------------------------
-- Table structure for prod_app_tier_rel
-- ----------------------------
DROP TABLE IF EXISTS `prod_app_tier_rel`;
CREATE TABLE `prod_app_tier_rel` (
  `id` varchar(32) NOT NULL,
  `app_id` varchar(32) DEFAULT NULL COMMENT '工业AppID',
  `tier_id` varchar(32) DEFAULT NULL COMMENT '套餐ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业App与套餐关联表';

-- ----------------------------
-- Records of prod_app_tier_rel
-- ----------------------------

-- ----------------------------
-- Table structure for prod_flavor
-- ----------------------------
DROP TABLE IF EXISTS `prod_flavor`;
CREATE TABLE `prod_flavor` (
  `id` varchar(32) NOT NULL COMMENT 'FlavorID',
  `source_type` smallint(2) NOT NULL COMMENT '来源类型',
  `cpu` int(11) NOT NULL COMMENT 'CPU数量',
  `ram` int(11) NOT NULL COMMENT '内存大小',
  `disk` int(11) NOT NULL COMMENT '磁盘大小',
  `network` int(11) NOT NULL COMMENT '网络配额',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚机Flavor信息表';

-- ----------------------------
-- Records of prod_flavor
-- ----------------------------

-- ----------------------------
-- Table structure for prod_products
-- ----------------------------
DROP TABLE IF EXISTS `prod_products`;
CREATE TABLE `prod_products` (
  `id` varchar(32) NOT NULL COMMENT '工业APPID',
  `name` varchar(100) DEFAULT NULL COMMENT '云产品名称',
  `introduction` varchar(1024) DEFAULT NULL COMMENT '云产品概述',
  `picture` varchar(256) DEFAULT NULL COMMENT '云产品宣传图文件名',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业云产品信息表';

-- ----------------------------
-- Records of prod_products
-- ----------------------------

-- ----------------------------
-- Table structure for prod_solutions
-- ----------------------------
DROP TABLE IF EXISTS `prod_solutions`;
CREATE TABLE `prod_solutions` (
  `id` varchar(32) NOT NULL COMMENT '方案ID',
  `name` varchar(100) NOT NULL COMMENT '方案名称',
  `introduction` varchar(1024) DEFAULT NULL COMMENT '方案概述',
  `picture` varchar(256) DEFAULT NULL COMMENT '方案宣传图文件名',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='解决方案信息表';

-- ----------------------------
-- Records of prod_solutions
-- ----------------------------

-- ----------------------------
-- Table structure for sys_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin` (
  `id` varchar(32) NOT NULL,
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `card` varchar(30) DEFAULT '' COMMENT '身份证号',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `company` varchar(50) DEFAULT '' COMMENT '公司名称',
  `department` varchar(50) DEFAULT '' COMMENT '部门名称',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业云管理员信息表';

-- ----------------------------
-- Records of sys_admin
-- ----------------------------

-- ----------------------------
-- Table structure for sys_customer
-- ----------------------------
DROP TABLE IF EXISTS `sys_customer`;
CREATE TABLE `sys_customer` (
  `id` varchar(32) NOT NULL,
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `nickname` varchar(30) DEFAULT '' COMMENT '昵称',
  `card` varchar(30) DEFAULT '' COMMENT '身份证号',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `company` varchar(50) DEFAULT '' COMMENT '公司名称',
  `address` varchar(80) DEFAULT '' COMMENT '公司地址',
  `avatar_path` varchar(200) DEFAULT NULL COMMENT '头像路径',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业云客户信息表';

-- ----------------------------
-- Records of sys_customer
-- ----------------------------
INSERT INTO `sys_customer` VALUES ('5ee7b9978577ef67b5e36f6caed87301', 'tianyu', '$2a$10$aJIO088vk/q0MHsI2fYyZuYNf6cucnjVMsU2bajUL.KVn4z/gFwqC', '田雨', '', '', '', '', '', null, '0', '1568874102609', '1569307285721');
INSERT INTO `sys_customer` VALUES ('8727996c68671215d98de0da1e65fb82', 'dengchun', '$2a$10$z8Q6/8EMVAifrKJqTiqmX.hsDsA06MD8QUhsUEj5hLQ0hhpvnH2qa', '邓春', '', '', '', '', '', null, '0', '1568874937937', '1569311165244');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` varchar(32) NOT NULL,
  `entity_name` varchar(60) DEFAULT '' COMMENT '表实体名',
  `data_id` varchar(32) DEFAULT '' COMMENT '表数据ID',
  `file_name` varchar(50) DEFAULT '' COMMENT '随机生成文件名',
  `original_name` varchar(100) DEFAULT '' COMMENT '原始文件名',
  `file_path` varchar(100) DEFAULT '' COMMENT '文件路径',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统文件上传表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_quota
-- ----------------------------
DROP TABLE IF EXISTS `sys_quota`;
CREATE TABLE `sys_quota` (
  `id` varchar(32) NOT NULL,
  `customerId` varchar(32) NOT NULL COMMENT '客户ID',
  `cpu` int(11) DEFAULT NULL COMMENT 'CPU数量',
  `ram` int(11) DEFAULT NULL COMMENT '内存大小',
  `disk` int(11) DEFAULT NULL COMMENT '磁盘大小',
  `network` int(11) DEFAULT NULL COMMENT '网络配额',
  `status` smallint(2) DEFAULT NULL COMMENT '状态(0：正常 1：删除)',
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户资源配额信息表';

-- ----------------------------
-- Records of sys_quota
-- ----------------------------
