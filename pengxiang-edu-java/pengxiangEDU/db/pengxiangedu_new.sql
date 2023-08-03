/*
 Navicat Premium Data Transfer

 Source Server         : 鹏翔
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : 111.229.11.46:3377
 Source Schema         : pengxiangedu_new

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 02/08/2023 15:43:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy`  (
  `academy_id` int(11) NOT NULL AUTO_INCREMENT,
  `academy_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`academy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES (23, '廊坊市城轨交通技工学校', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `academy` VALUES (26, '浙江理工小学', NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for edu_certificate
-- ----------------------------
DROP TABLE IF EXISTS `edu_certificate`;
CREATE TABLE `edu_certificate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) NOT NULL COMMENT '学生id',
  `certificate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证书名称（茶艺证、礼仪证、铁路客服证、急救证、普通话证、教师资格证、保育员证等，其他证书）',
  `information` tinyint(2) NULL DEFAULT NULL COMMENT '错补证信息（0无，1已补发/2未补发）',
  `exam_time` datetime(0) NULL DEFAULT NULL COMMENT '考证时间',
  `issue_time` datetime(0) NULL DEFAULT NULL COMMENT '发证日期',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '1 必考 0 选考',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '考证状态 1已考 0未考',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_certificate
-- ----------------------------
INSERT INTO `edu_certificate` VALUES (4, 119, '茶艺证', 0, '2023-08-23 00:00:00', '2023-08-22 00:00:00', '', 1, 0, '2023-08-01 00:00:00', '2023-08-01 02:23:30', 3, 3, b'1');
INSERT INTO `edu_certificate` VALUES (5, 122, '', 1, '2023-08-02 00:00:00', '2023-08-01 00:00:00', '', 0, 1, '2023-08-01 00:00:00', '2023-08-01 15:36:56', 1, 6, b'0');
INSERT INTO `edu_certificate` VALUES (6, 119, '礼仪证', NULL, NULL, NULL, '', 1, 1, '2023-08-02 10:06:07', '2023-08-02 10:06:07', 1, 1, b'0');
INSERT INTO `edu_certificate` VALUES (7, 119, '急救证', 1, '2023-08-21 00:00:00', '2023-08-28 00:00:00', '是', 0, 1, '2023-08-02 10:06:26', '2023-08-02 10:06:26', 1, 1, b'0');

-- ----------------------------
-- Table structure for fee_arrearage
-- ----------------------------
DROP TABLE IF EXISTS `fee_arrearage`;
CREATE TABLE `fee_arrearage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stu_id` bigint(20) NOT NULL COMMENT '学生id',
  `academy_id` bigint(20) NULL DEFAULT NULL COMMENT '院校id',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `year` int(11) NULL DEFAULT NULL COMMENT '年份',
  `train_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠培训费',
  `clothes_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠服装费',
  `book_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠教材费',
  `hotel_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠住宿费',
  `bed_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠被褥费',
  `insurance_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠保险费',
  `public_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠公物押金',
  `certificate_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠证书费',
  `defense_edu_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠国防教育费',
  `body_exam_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠体检费',
  `fee_num` decimal(10, 0) NULL DEFAULT 0 COMMENT '欠费合计',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '欠费明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fee_arrearage
-- ----------------------------
INSERT INTO `fee_arrearage` VALUES (8, 119, NULL, NULL, 1, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, '2023-08-01 11:21:23', '2023-08-01 11:21:23', 5, 5, b'0');
INSERT INTO `fee_arrearage` VALUES (9, 124, NULL, NULL, 1, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, '2023-08-01 16:41:07', '2023-08-01 16:41:07', 6, 6, b'0');

-- ----------------------------
-- Table structure for fee_return
-- ----------------------------
DROP TABLE IF EXISTS `fee_return`;
CREATE TABLE `fee_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stu_id` bigint(20) NOT NULL COMMENT '学生id',
  `academy_id` bigint(20) NULL DEFAULT NULL COMMENT '院校id',
  `return_school_year` int(11) NULL DEFAULT NULL COMMENT '退费学年',
  `return_money_time` date NULL DEFAULT NULL COMMENT '退费时间',
  `return_fee_num` decimal(10, 0) NULL DEFAULT 0 COMMENT '退费金额',
  `train_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退培训费',
  `clothes_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退服装费',
  `book_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退教材费',
  `hotel_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退住宿费',
  `bed_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退被褥费',
  `insurance_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退保险费',
  `public_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退公物押金',
  `certificate_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退证书费',
  `defense_edu_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退国防教育费',
  `body_exam_fee` decimal(10, 0) NULL DEFAULT 0 COMMENT '退体检费',
  `account` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '退费账户',
  `account_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '退费账号',
  `deposit_bank` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '退费开户行',
  `create_time` datetime(0) NOT NULL COMMENT '创建(退费)时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '学生减免退费管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fee_return
-- ----------------------------
INSERT INTO `fee_return` VALUES (3, 123, NULL, 2023, '2023-02-27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2023-08-01 00:58:26', '2023-08-01 10:45:02', 5, 5, b'0');
INSERT INTO `fee_return` VALUES (4, 128, 383, 2023, '2023-02-27', 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '中国银行', '2023-08-01 00:00:00', '2023-08-01 10:45:02', 5, 5, b'0');
INSERT INTO `fee_return` VALUES (5, 126, NULL, 2023, '2023-02-26', 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '中国农业银行', '2023-08-01 10:45:02', '2023-08-01 10:45:02', 5, 5, b'0');

-- ----------------------------
-- Table structure for fee_school_sundry
-- ----------------------------
DROP TABLE IF EXISTS `fee_school_sundry`;
CREATE TABLE `fee_school_sundry`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stu_id` bigint(20) NOT NULL COMMENT '学生id',
  `academy_id` bigint(20) NULL DEFAULT NULL COMMENT '院校id',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `pay_school_date` date NULL DEFAULT NULL COMMENT '缴费日期',
  `pay_school_year` int(11) NULL DEFAULT NULL COMMENT '缴费学年',
  `train_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴培训费',
  `clothes_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴服装费',
  `book_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴教材费',
  `hotel_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴住宿费',
  `bed_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴被褥费',
  `insurance_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴保险费',
  `public_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴公物押金',
  `certificate_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴证书费',
  `defense_edu_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴国防教育费',
  `body_exam_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实缴体检费',
  `derate_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '减免金额',
  `derate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '减免类型 1：贫困生 0：非贫困',
  `derate_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '减免备注',
  `return_fee_time` datetime(0) NULL DEFAULT NULL COMMENT '返费时间',
  `need_return_fee_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '应返费总额',
  `fact_return_fee_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '返费金额',
  `account` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返费账户',
  `account_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返费账号',
  `deposit_bank` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返费开户行',
  `pay_train_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴培训费',
  `pay_clothes_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴服装费',
  `pay_book_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴教材费',
  `pay_hotel_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴住宿费',
  `pay_bed_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴被褥费',
  `pay_insurance_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴保险费',
  `pay_public_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴公物押金',
  `pay_certificate_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴证书费',
  `pay_defense_edu_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴国防教育费',
  `pay_body_exam_fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应缴体检费',
  `is_arrearage` tinyint(2) NULL DEFAULT NULL COMMENT '是否欠费 1：是 0：否',
  `create_time` datetime(0) NOT NULL COMMENT '创建(缴费)时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '学杂费收支管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fee_school_sundry
-- ----------------------------
INSERT INTO `fee_school_sundry` VALUES (204, 119, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 1, '2023-08-01 10:42:41', '2023-08-01 16:40:27', 5, 6, b'0');
INSERT INTO `fee_school_sundry` VALUES (205, 120, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:00', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (206, 121, NULL, NULL, '2023-02-26', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:00', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (207, 122, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (208, 123, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (209, 124, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 1, '2023-08-01 10:42:41', '2023-08-01 16:41:08', 5, 6, b'0');
INSERT INTO `fee_school_sundry` VALUES (210, 125, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (211, 126, NULL, NULL, '2023-02-17', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 4000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (212, 127, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (213, 128, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (214, 129, NULL, NULL, '2023-03-01', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, NULL, NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (215, 130, NULL, NULL, '2023-02-26', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 4000, '/奖金', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (216, 131, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, NULL, NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (217, 132, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (218, 133, NULL, NULL, '2022-12-30', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (219, 134, NULL, NULL, '2023-02-28', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 6000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (220, 135, NULL, NULL, '2023-02-27', 1, 4410.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 0, NULL, NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (221, 136, NULL, NULL, '2023-03-01', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:41', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (222, 137, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (223, 138, NULL, NULL, '2023-02-16', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 4000, '奖金', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (224, 139, NULL, NULL, '2023-02-28', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '/奖金', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (225, 140, NULL, NULL, '2023-02-26', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (226, 141, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '奖金', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (227, 142, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (228, 143, NULL, NULL, '2023-02-28', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (229, 144, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (230, 145, NULL, NULL, '2023-02-09', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (231, 146, NULL, NULL, '2023-02-26', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 4000, NULL, NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:01', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (232, 147, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (233, 148, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (234, 149, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (235, 150, NULL, NULL, '2023-02-18', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (236, 151, NULL, NULL, '2023-02-07', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (237, 152, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (238, 153, NULL, NULL, '2023-02-17', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 6000, 4000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (239, 154, NULL, NULL, '2023-03-13', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (240, 155, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (241, 156, NULL, NULL, '2023-02-28', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (242, 157, NULL, NULL, '2023-02-25', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '/奖金', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (243, 158, NULL, NULL, '2023-02-07', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (244, 159, NULL, NULL, '2023-02-18', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:42', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (245, 160, NULL, NULL, '2023-02-19', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (246, 161, NULL, NULL, '2023-02-20', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (247, 162, NULL, NULL, '2023-02-20', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 5000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (248, 163, NULL, NULL, '2023-02-24', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 4000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (249, 164, NULL, NULL, '2023-02-24', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (250, 165, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (251, 166, NULL, NULL, '2023-02-26', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 4000, NULL, NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (252, 167, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');
INSERT INTO `fee_school_sundry` VALUES (253, 168, NULL, NULL, '2023-02-27', 1, 9800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, 2000.00, '农村户口', '政府补助', NULL, 7000, 7000, '盐城/城轨对固安', NULL, NULL, 11800.00, 750.00, 500.00, 2600.00, 500.00, 300.00, 200.00, 0.00, 350.00, 390.00, NULL, '2023-08-01 10:42:43', '2023-08-01 10:43:02', 5, 5, b'0');

-- ----------------------------
-- Table structure for invalid_educe_list_eco
-- ----------------------------
DROP TABLE IF EXISTS `invalid_educe_list_eco`;
CREATE TABLE `invalid_educe_list_eco`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `academy_id` bigint(20) NULL DEFAULT NULL COMMENT '学院id',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家庭困难类型',
  `reduce_train_fee` decimal(10, 0) NOT NULL COMMENT '扣减学费',
  `reduce_clothes_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减服装费',
  `reduce_book_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减教材费',
  `reduce_hotel_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减住宿费',
  `reduce_bed_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减被褥费',
  `reduce_insurance_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减保险费',
  `reduce_public_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减公物押金',
  `reduce_certificate_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减证书费',
  `reduce_defense_edu_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减国防教育费',
  `reduce_body_exam_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减体检费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_educe_list_eco
-- ----------------------------
INSERT INTO `invalid_educe_list_eco` VALUES (1, 1, '无困难', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `invalid_educe_list_eco` VALUES (2, 1, '22个县户籍', 500, 100, 50, 600, 400, 0, 0, 0, 0, 0);
INSERT INTO `invalid_educe_list_eco` VALUES (3, 8, '无困难', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `invalid_educe_list_eco` VALUES (4, 1, '涉农专业', 800, 200, 100, 400, 100, 0, 0, 0, 0, 0);
INSERT INTO `invalid_educe_list_eco` VALUES (5, 8, '涉农专业', 1000, 200, 400, 100, 100, 500, 0, 0, 0, 0);
INSERT INTO `invalid_educe_list_eco` VALUES (6, 34, '无减免', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for invalid_enter_type_list
-- ----------------------------
DROP TABLE IF EXISTS `invalid_enter_type_list`;
CREATE TABLE `invalid_enter_type_list`  (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `academy_id` bigint(255) NOT NULL COMMENT '每个学院回扣力度不一样，所以需要学院id',
  `enter_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '招生方式名称',
  `could_get` decimal(10, 0) NOT NULL COMMENT '回扣金额',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invalid_enter_type_list
-- ----------------------------
INSERT INTO `invalid_enter_type_list` VALUES (6, 34, '就业班招生', 6000, '2023-03-31 09:37:12', '2023-03-31 16:03:38', 13, 13, b'0');
INSERT INTO `invalid_enter_type_list` VALUES (8, 34, '升学班招生', 7000, '2023-03-31 16:03:56', '2023-03-31 16:03:56', 13, 13, b'0');

-- ----------------------------
-- Table structure for invalid_fee_standard
-- ----------------------------
DROP TABLE IF EXISTS `invalid_fee_standard`;
CREATE TABLE `invalid_fee_standard`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `academy_id` bigint(20) NOT NULL COMMENT '院校id',
  `grade_id` bigint(20) NOT NULL COMMENT '年级',
  `major_id` bigint(20) NOT NULL COMMENT '专业',
  `class_type` int(11) NOT NULL COMMENT '0升学,1就业',
  `school_system` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学制',
  `school_year` int(11) NOT NULL COMMENT '学年数',
  `train_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '培训费',
  `clothes_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '服装费',
  `book_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '教材费',
  `hotel_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '住宿费',
  `bed_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '被褥费',
  `insurance_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '保险费',
  `public_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '公物押金',
  `certificate_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '证书费',
  `defense_edu_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '国防教育费',
  `body_exam_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '体检费',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '收费标准设置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_fee_standard
-- ----------------------------
INSERT INTO `invalid_fee_standard` VALUES (31, 34, 167, 99, 0, '3', 1, 9800, 750, 500, 2600, 500, 300, 200, 0, 350, 390, '2023-03-31 12:26:51', '2023-03-31 12:26:51', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (32, 34, 167, 99, 0, '3', 2, 9800, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:27:14', '2023-03-31 12:27:14', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (33, 34, 167, 99, 0, '3', 3, 9800, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:27:34', '2023-03-31 12:27:34', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (34, 34, 169, 100, 0, '3', 1, 9800, 750, 500, 2600, 500, 300, 200, 0, 350, 390, '2023-03-31 12:28:02', '2023-03-31 12:28:02', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (35, 34, 169, 100, 0, '3', 2, 9800, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:28:28', '2023-03-31 12:28:28', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (36, 34, 169, 100, 0, '3', 3, 9800, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:28:48', '2023-03-31 12:28:48', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (37, 34, 222, 100, 1, '3', 1, 6900, 1500, 500, 2600, 500, 300, 200, 0, 350, 390, '2023-03-31 12:29:18', '2023-03-31 12:29:18', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (38, 34, 222, 100, 1, '3', 2, 6900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:29:39', '2023-03-31 12:29:39', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (39, 34, 222, 100, 1, '3', 3, 6900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:30:03', '2023-03-31 12:30:03', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (40, 34, 223, 100, 1, '3', 1, 6900, 750, 500, 2600, 500, 300, 200, 0, 350, 390, '2023-03-31 12:30:29', '2023-03-31 12:30:29', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (41, 34, 223, 100, 1, '3', 2, 6900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:30:57', '2023-03-31 12:30:57', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (42, 34, 223, 100, 1, '3', 3, 6900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:31:22', '2023-03-31 12:31:22', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (43, 34, 170, 101, 1, '3', 1, 6900, 750, 500, 2600, 500, 300, 200, 0, 350, 390, '2023-03-31 12:31:53', '2023-03-31 12:31:53', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (44, 34, 170, 101, 1, '3', 2, 6900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:32:16', '2023-03-31 12:32:16', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (45, 34, 170, 101, 1, '3', 3, 6900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:32:40', '2023-03-31 12:32:40', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (46, 34, 171, 101, 1, '3', 1, 8800, 750, 500, 2600, 500, 300, 200, 0, 350, 390, '2023-03-31 12:33:09', '2023-03-31 12:33:09', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (47, 34, 171, 101, 1, '3', 2, 8800, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:33:29', '2023-03-31 12:33:29', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (48, 34, 171, 101, 1, '3', 3, 8800, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:33:57', '2023-03-31 12:33:57', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (49, 34, 198, 101, 1, '3', 1, 8900, 750, 500, 2600, 500, 300, 200, 0, 350, 390, '2023-03-31 12:34:30', '2023-03-31 12:34:30', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (50, 34, 198, 101, 1, '3', 2, 8900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:34:50', '2023-03-31 12:34:50', 13, 13, b'0');
INSERT INTO `invalid_fee_standard` VALUES (51, 34, 198, 101, 1, '3', 3, 8900, 0, 500, 2600, 0, 0, 0, 0, 0, 0, '2023-03-31 12:35:11', '2023-03-31 12:35:11', 13, 13, b'0');

-- ----------------------------
-- Table structure for invalid_fee_stu_need_pay
-- ----------------------------
DROP TABLE IF EXISTS `invalid_fee_stu_need_pay`;
CREATE TABLE `invalid_fee_stu_need_pay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '真正的主键！',
  `stu_id` bigint(20) NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `school_year_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学年信息（2021-2022学年）',
  `school_year` int(4) NULL DEFAULT NULL COMMENT '学年（1、2、3）',
  `train_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '培训费',
  `clothes_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '服装费',
  `book_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '教材费',
  `hotel_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '住宿费',
  `bed_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '被褥费',
  `insurance_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '保险费',
  `public_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '公物押金',
  `certificate_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '证书费',
  `defense_edu_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '国防教育费',
  `body_exam_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '体检费',
  `total_need_fee` decimal(10, 0) NOT NULL COMMENT '应收合计',
  `standard_id` bigint(20) NOT NULL COMMENT '学生应缴对应feestandard',
  `eco_reduce_type` bigint(20) NOT NULL COMMENT '学费eco减免类型',
  `stipend_reduce_type` bigint(20) NOT NULL COMMENT '学费stipend减免类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_fee_stu_need_pay
-- ----------------------------
INSERT INTO `invalid_fee_stu_need_pay` VALUES (2, 1, 1, '2017-2018学年', 1, 1000, 1000, 1000, 1000, 1000, 0, 2000, 2000, 2000, 200, 11200, 3, 1, 1);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (3, 1, 1, '2018-2019学年', 2, 1000, 1000, 1000, 1000, 1000, 0, 2000, 2000, 2000, 200, 11200, 3, 1, 1);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (4, 1, 1, '2019-2020学年', 3, 100, 100, 100, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 10000, 3, 1, 1);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (11, 27, 2, '2022-2023学年', 3, 10000, 100, 100, 100, 100, 100, 100, 100, 100, 100, 10900, 10, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (12, 31, 2, '2022-2023学年', 2, 2500, 100, 150, -300, -300, 20, 20, 2, 20, 300, 2512, 5, 2, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (13, 32, 2, '2022-2023学年', 3, 10000, 100, 100, 100, 100, 100, 100, 100, 100, 100, 10900, 10, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (14, 33, 2, '2022-2023学年', 2, 2500, 100, 150, -300, -300, 20, 20, 2, 20, 300, 2512, 5, 2, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (15, 34, 2, '2022-2023学年', 3, 10000, 100, 100, 100, 100, 100, 100, 100, 100, 100, 10900, 10, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (19, 38, 2, '2022-2023学年', 2, 2500, 100, 150, -300, -300, 20, 20, 2, 20, 300, 2512, 5, 2, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (21, 45, 2, '2022-2023学年', 1, 10200, 950, 0, 1400, 0, 0, 0, 0, 0, 0, 12550, 13, 1, 3);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (23, 47, 2, '2022-2023学年', 1, 11000, 1100, 200, 1500, 100, 100, 100, 100, 100, 100, 14400, 13, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (25, 1, NULL, '2023-2024学年', 2, 3502, 200, 50, 600, -200, 500, 100, 100, 200, 80, 5132, 2, 2, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (26, 2, NULL, '2023-2024学年', 3, 3000, 200, 200, 300, 100, 20, 20, 2, 20, 300, 4162, 5, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (27, 51, 2, '2022-2023学年', 1, 10000, 300, 150, 1500, 200, 100, 100, 300, 100, 100, 12850, 12, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (28, 51, NULL, '2023-2024学年', 2, 4002, 300, 100, 1200, 200, 500, 100, 100, 200, 80, 6782, 2, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (29, 52, 2, '2022-2023学年', 1, 10000, 300, 150, 1500, 200, 100, 100, 300, 100, 100, 12850, 12, 1, 2);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (30, 77, 99, '2022-2023学年', 1, 9800, 750, 500, 2600, 500, 300, 200, 0, 350, 390, 15390, 31, 6, 5);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (31, 79, 99, '2022-2023学年', 1, 9800, 750, 500, 2600, 500, 300, 200, 0, 350, 390, 15390, 31, 6, 5);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (32, 80, 99, '2022-2023学年', 1, 9800, 750, 500, 2600, 500, 300, 200, 0, 350, 390, 15390, 31, 6, 6);
INSERT INTO `invalid_fee_stu_need_pay` VALUES (33, 81, 99, '2022-2023学年', 1, 9800, 750, 500, 2600, 500, 300, 200, 0, 350, 390, 15390, 31, 6, 6);

-- ----------------------------
-- Table structure for invalid_fee_stu_paid
-- ----------------------------
DROP TABLE IF EXISTS `invalid_fee_stu_paid`;
CREATE TABLE `invalid_fee_stu_paid`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fee_need_pay_id` bigint(20) NOT NULL COMMENT '每条记录和needpay表中每条记录一一对应',
  `stu_id` bigint(20) NOT NULL COMMENT '学生id',
  `academy_id` bigint(20) NOT NULL COMMENT '院校id',
  `bill_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '清单描述记录',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `train_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴培训费',
  `clothes_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴服装费',
  `book_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴教材费',
  `hotel_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴住宿费',
  `bed_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴被褥费',
  `insurance_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴保险费',
  `public_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴公物押金',
  `certificate_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴证书费',
  `defense_edu_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴国防教育费',
  `body_exam_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴体检费',
  `total_paid_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '已缴费合计',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `fee_standard_id` bigint(15) NOT NULL COMMENT '当前支付的费用类型',
  `fee_status` int(11) NOT NULL COMMENT '当前费用状态，是否缴清（已缴清800，未缴清801）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_fee_stu_paid
-- ----------------------------
INSERT INTO `invalid_fee_stu_paid` VALUES (1, 2, 1, 1, '机电系2020级(升学)测试记录', 1, 1000, 1000, 1000, 1000, 1000, 0, 2000, 2000, 2000, 200, 11200, '2023-01-03 20:49:20', '2023-01-03 20:49:24', 1, 1, b'0', 1, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (2, 3, 1, 1, '机电系2020级(升学)测试记录', 1, 1000, 1000, 1000, 1000, 1000, 0, 2000, 2000, 2000, 200, 11200, '2023-01-03 20:49:20', '2023-01-03 20:49:24', 1, 1, b'0', 1, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (3, 4, 1, 1, '机电系2020级(升学)测试记录', 1, 100, 100, 100, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 7300, '2023-01-04 13:21:41', '2023-01-04 13:21:47', 1, 1, b'0', 1, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (5, 19, 38, 1, '机电系2020级(升学)测试记录', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-02-27 16:42:17', '2023-02-27 16:42:17', 1, 1, b'0', 5, 801);
INSERT INTO `invalid_fee_stu_paid` VALUES (6, 20, 2, 1, '机电系2020级(升学)测试记录', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-01 14:07:14', '2023-03-01 14:07:14', 6, 6, b'0', 2, 801);
INSERT INTO `invalid_fee_stu_paid` VALUES (7, 21, 45, 1, '机电系2020级(升学)测试记录', NULL, 10200, 950, 0, 1400, 0, 0, 0, 0, 0, 0, 12550, '2023-03-02 10:45:25', '2023-03-02 10:45:25', 6, 6, b'0', 13, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (9, 23, 47, 1, '机电系2020级(升学)测试记录', NULL, 11000, 1100, 200, 1500, 100, 100, 100, 100, 100, 0, 14400, '2023-03-02 15:23:49', '2023-03-02 15:23:49', 6, 6, b'0', 13, 801);
INSERT INTO `invalid_fee_stu_paid` VALUES (11, 25, 1, 1, '机电系2020级(升学)测试记录', NULL, 3502, 200, 50, 600, -200, 500, 100, 100, 200, 80, 5132, '2023-03-07 09:44:02', '2023-03-07 09:44:02', 1, 1, b'0', 2, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (12, 26, 2, 1, '机电系2020级(升学)测试记录', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-07 09:44:02', '2023-03-07 09:44:02', 1, 1, b'0', 5, 801);
INSERT INTO `invalid_fee_stu_paid` VALUES (13, 27, 51, 1, '机电系2020级(升学)测试记录', NULL, 10000, 300, 150, 1500, 200, 100, 100, 300, 100, 100, 12850, '2023-03-07 09:55:06', '2023-03-07 09:55:06', 1, 1, b'0', 12, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (14, 28, 51, 1, '机电系2020级(升学)测试记录', NULL, 4002, 300, 100, 1200, 200, 500, 100, 100, 200, 80, 6782, '2023-03-07 10:40:38', '2023-03-07 10:40:38', 1, 1, b'0', 2, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (15, 29, 52, 1, '机电系2020级(就业)', NULL, 10000, 300, 150, 1500, 200, 100, 100, 300, 100, 100, 12850, '2023-03-08 15:02:31', '2023-03-08 15:02:31', 1, 1, b'0', 12, 800);
INSERT INTO `invalid_fee_stu_paid` VALUES (16, 30, 77, 34, '升学部升学专业(升学)', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-31 16:04:28', '2023-03-31 16:04:28', 13, 13, b'0', 31, 801);
INSERT INTO `invalid_fee_stu_paid` VALUES (17, 31, 79, 34, '升学部升学专业(升学)', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-31 16:12:33', '2023-03-31 16:12:33', 1, 1, b'0', 31, 801);
INSERT INTO `invalid_fee_stu_paid` VALUES (18, 32, 80, 34, '升学部升学专业(升学)', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-29 14:14:44', '2023-05-29 14:14:44', 6, 6, b'0', 31, 801);
INSERT INTO `invalid_fee_stu_paid` VALUES (19, 33, 81, 34, '升学部升学专业(升学)', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-03 10:33:59', '2023-06-03 10:33:59', 1, 1, b'0', 31, 801);

-- ----------------------------
-- Table structure for invalid_fee_train_in_out
-- ----------------------------
DROP TABLE IF EXISTS `invalid_fee_train_in_out`;
CREATE TABLE `invalid_fee_train_in_out`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证',
  `academy_id` bigint(20) NOT NULL COMMENT '院校id',
  `train_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '培训类别',
  `certificate_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '证书名称',
  `certificate_level` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '证书等级',
  `need_fee_num` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '应收金额',
  `fact_fee_num` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '实收金额',
  `derate_fee_num` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '减免金额',
  `teacher` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '招生老师',
  `teacher_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '招生老师电话',
  `return_fee_time` datetime(0) NULL DEFAULT NULL COMMENT '返费时间',
  `need_return_fee_num` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '应返费总额',
  `fact_return_fee_num` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '返费金额',
  `return_account` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返费账户',
  `return_account_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返费账号',
  `back_fee_time` datetime(0) NULL DEFAULT NULL COMMENT '退费时间',
  `back_fee_num` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '退费金额',
  `back_account` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '退费账户',
  `back_account_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '退费账号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建(缴费)时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '培训费收支管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_fee_train_in_out
-- ----------------------------
INSERT INTO `invalid_fee_train_in_out` VALUES (2, '张三', '330326200111112233', 3, '英语', '英语六级', '6', 2000, 2000, 0, 'xra', '17816725366', NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, '2022-11-28 19:34:36', '2022-11-28 19:34:36', 1, 1, b'0');

-- ----------------------------
-- Table structure for invalid_fee_type
-- ----------------------------
DROP TABLE IF EXISTS `invalid_fee_type`;
CREATE TABLE `invalid_fee_type`  (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '此表用于表示缴纳费用种类的对应',
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '费用种类，英文表示',
  `description` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '费用对应的中文描述',
  `is_deleted` int(1) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_fee_type
-- ----------------------------
INSERT INTO `invalid_fee_type` VALUES (1, 'Train', '培训费', 0, '2023-01-13 13:40:08', '2023-01-13 13:40:10');
INSERT INTO `invalid_fee_type` VALUES (2, 'Clothes', '服装费', 0, '2023-01-13 13:40:36', '2023-01-13 13:40:39');
INSERT INTO `invalid_fee_type` VALUES (3, 'Book', '教材费', 0, '2023-01-13 13:41:06', '2023-01-13 13:41:08');
INSERT INTO `invalid_fee_type` VALUES (4, 'Hotel', '住宿费', 0, '2023-01-13 13:42:24', '2023-01-13 13:42:27');
INSERT INTO `invalid_fee_type` VALUES (5, 'Bed', '被褥费', 0, '2023-01-13 14:03:44', '2023-01-13 14:03:46');
INSERT INTO `invalid_fee_type` VALUES (6, 'Insurance', '保险费', 0, '2023-01-13 14:04:12', '2023-01-13 14:04:14');
INSERT INTO `invalid_fee_type` VALUES (7, 'Public', '公物押金', 0, '2023-01-13 14:04:42', '2023-01-13 14:04:45');
INSERT INTO `invalid_fee_type` VALUES (8, 'Certificate', '证书费', 0, '2023-01-13 14:05:13', '2023-01-13 14:05:15');
INSERT INTO `invalid_fee_type` VALUES (9, 'DefenseEdu', '国防教育费', 0, '2023-01-13 14:05:40', '2023-01-13 14:05:42');
INSERT INTO `invalid_fee_type` VALUES (10, 'BodyExam', '体检费', 0, '2023-01-13 14:05:59', '2023-01-13 14:06:01');

-- ----------------------------
-- Table structure for invalid_inem_emp_revisit
-- ----------------------------
DROP TABLE IF EXISTS `invalid_inem_emp_revisit`;
CREATE TABLE `invalid_inem_emp_revisit`  (
  `wa` bigint(11) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(11) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  `is_work` bit(1) NULL DEFAULT NULL COMMENT '是否在岗(1在岗，0不在岗)',
  `is_satisfied` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否对岗位满意',
  `emp_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生就业工作情况(升职、降职、加薪、降薪、其他)',
  `leave_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '离职原因(辞职、辞退)',
  `regularize_salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转正薪酬',
  `trial_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期限(二次就业分配填写)',
  `rework_job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业岗位(二次就业分配填写)',
  `work_leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位负责人',
  `is_need_reemp` int(11) NULL DEFAULT NULL COMMENT '是否需要二次就业(0需要，1不需要)',
  `reemp_allocate_time` datetime(0) NULL DEFAULT NULL COMMENT '二次就业分配时间(二次就业分配填写)',
  `rework_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业单位(二次就业分配填写)',
  `probation_salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期薪酬',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`wa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for invalid_inem_employed_stu_record
-- ----------------------------
DROP TABLE IF EXISTS `invalid_inem_employed_stu_record`;
CREATE TABLE `invalid_inem_employed_stu_record`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(11) NOT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `admission_date` datetime(0) NULL DEFAULT NULL COMMENT '入学日期',
  `leave_date` datetime(0) NULL DEFAULT NULL COMMENT '离校日期',
  `leave_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '离校原因(上岗就业或自主择业)',
  `work_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业单位',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业岗位',
  `trial_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期限',
  `probation_salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期薪酬',
  `regularize_salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转正薪酬',
  `work_leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位负责人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_inem_employed_stu_record
-- ----------------------------
INSERT INTO `invalid_inem_employed_stu_record` VALUES (1, 1, 1, '2023-01-06 20:43:45', '2023-01-06 20:43:48', '上岗就业', '浙江理工大学', 'java开发', '3个月', '5000', '8000', '老包', '2023-01-06 20:44:36', '2023-01-06 20:44:39', 1, 1, b'0');
INSERT INTO `invalid_inem_employed_stu_record` VALUES (3, 38, NULL, NULL, '2023-02-21 00:00:00', '上岗就业', '江南皮革厂', '流水线工程师', NULL, '8000', '10000', '姜煜', '2023-02-27 16:42:17', '2023-02-27 19:27:53', 1, 1, b'0');
INSERT INTO `invalid_inem_employed_stu_record` VALUES (9, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 16:04:28', '2023-03-31 16:04:28', 13, 13, b'0');
INSERT INTO `invalid_inem_employed_stu_record` VALUES (10, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 16:12:33', '2023-03-31 16:12:33', 1, 1, b'0');
INSERT INTO `invalid_inem_employed_stu_record` VALUES (11, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-29 14:14:44', '2023-05-29 14:14:44', 6, 6, b'0');
INSERT INTO `invalid_inem_employed_stu_record` VALUES (12, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 10:33:59', '2023-06-03 10:33:59', 1, 1, b'0');

-- ----------------------------
-- Table structure for invalid_inem_stu_internship
-- ----------------------------
DROP TABLE IF EXISTS `invalid_inem_stu_internship`;
CREATE TABLE `invalid_inem_stu_internship`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) NOT NULL,
  `Internship_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习类别(认识实习、岗位实习)',
  `Internship_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习单位',
  `Internship_salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习报酬',
  `Internship_post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习岗位',
  `Internship_leave_date` datetime(0) NULL DEFAULT NULL COMMENT '实习离校日期',
  `expected_end_date` datetime(0) NULL DEFAULT NULL COMMENT '预计实习结束日期',
  `actual_end_date` datetime(0) NULL DEFAULT NULL COMMENT '实际实习结束日期',
  `internship_results` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生实习鉴定结果(优、良、合格、不合格)',
  `is_satisfied` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否对岗位满意',
  `lead_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '带队教师',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建(缴费)时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_inem_stu_internship
-- ----------------------------
INSERT INTO `invalid_inem_stu_internship` VALUES (1, 1, '认识实习', '浙江理工大学', '3000', 'java开发', '2023-02-24 00:00:00', '2023-03-24 00:00:00', '2023-01-06 00:00:00', '优', '满意', '包老师', '2023-01-06 20:14:50', '2023-02-24 20:54:00', 1, 1, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (2, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-25 12:58:42', '2023-02-25 12:58:42', 1, 1, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (4, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 16:42:17', '2023-02-27 16:42:17', 1, 1, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (5, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 10:45:25', '2023-03-02 10:45:25', 6, 6, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (7, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 15:23:49', '2023-03-02 15:23:49', 6, 6, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (8, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-07 09:55:06', '2023-03-07 09:55:06', 1, 1, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (9, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-08 15:02:31', '2023-03-08 15:02:31', 1, 1, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (10, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 16:04:28', '2023-03-31 16:04:28', 13, 13, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (11, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 16:12:33', '2023-03-31 16:12:33', 1, 1, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (12, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-29 14:14:44', '2023-05-29 14:14:44', 6, 6, b'0');
INSERT INTO `invalid_inem_stu_internship` VALUES (13, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 10:33:59', '2023-06-03 10:33:59', 1, 1, b'0');

-- ----------------------------
-- Table structure for invalid_order_info
-- ----------------------------
DROP TABLE IF EXISTS `invalid_order_info`;
CREATE TABLE `invalid_order_info`  (
  `id` bigint(11) NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该费用名称',
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '学生id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '对应needpay的id',
  `total_fee` decimal(11, 0) NULL DEFAULT NULL COMMENT '订单支付费用',
  `order_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invalid_order_info
-- ----------------------------
INSERT INTO `invalid_order_info` VALUES (1632925914524311554, '学费：2020级机电系2班(就业)', '20230307100730BEED14A4D0CB4926966A6D138C172BBA', NULL, 5, 0, '未支付', NULL, NULL);
INSERT INTO `invalid_order_info` VALUES (1633302546649022466, '学费：2020级机电系1班(就业)', '20230308110407086EDBD5DD654A8A8FC5E662E6FCF6EF', 1, 1, 200, '支付成功', NULL, NULL);
INSERT INTO `invalid_order_info` VALUES (1633350352357060609, '学费：2020级机电系1班(就业)', '20230308141404D0EEBBAC7781428885C9F6D8273ADE37', 51, 14, 6782, '支付成功', NULL, NULL);
INSERT INTO `invalid_order_info` VALUES (1633364955648544770, '学费：2020级机电系null(就业)', '202303081512060023C4B3B9244C9B90A692F78D9C98F1', 52, 15, 12850, '支付成功', NULL, NULL);
INSERT INTO `invalid_order_info` VALUES (1634191022328160257, '学费：机电系2020级(升学)测试记录', '20230310215436454FF9CE32E3447D98C8E33EEFE784DC', 1, 1, 200, '支付成功', NULL, NULL);

-- ----------------------------
-- Table structure for invalid_pay_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `invalid_pay_sys_user`;
CREATE TABLE `invalid_pay_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) NOT NULL COMMENT '学生表对应id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生账号（学号）',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_pay_sys_user
-- ----------------------------
INSERT INTO `invalid_pay_sys_user` VALUES (1, 1, '张三', '330901202211281234', 'zhangsan', NULL, '131545@qq.com', NULL, 1, '2023-03-02 13:51:08', '2023-03-02 13:51:15', 1, 1, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (2, 45, '苏洪斌', '330731199803043344', '043344', NULL, '', NULL, 1, '2023-03-02 13:51:32', '2023-03-02 13:51:35', 1, 1, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (3, 47, '彭书友', '330327199705044488', '044488', NULL, NULL, NULL, NULL, '2023-03-02 15:23:49', '2023-03-02 15:23:49', 6, 6, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (4, 51, '浩1', '330326111122223333', '223333', NULL, NULL, NULL, NULL, '2023-03-07 09:55:06', '2023-03-07 09:55:06', 1, 1, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (5, 52, '余龙勇', '330523199703040045', '040045', NULL, NULL, NULL, NULL, '2023-03-08 15:02:31', '2023-03-08 15:02:31', 1, 1, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (6, 77, '李博宇', '230107199004091514', '091514', NULL, NULL, NULL, NULL, '2023-03-31 16:04:28', '2023-03-31 16:04:28', 13, 13, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (7, 79, '李博宇', '230107199004091514', '091514', NULL, NULL, NULL, NULL, '2023-03-31 16:12:33', '2023-03-31 16:12:33', 1, 1, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (8, 80, 'qwe', '345563454543656', '543656', NULL, NULL, NULL, NULL, '2023-05-29 14:14:44', '2023-05-29 14:14:44', 6, 6, b'0');
INSERT INTO `invalid_pay_sys_user` VALUES (9, 81, '朱博伦', '330521199709090033', '090033', NULL, NULL, NULL, NULL, '2023-06-03 10:33:59', '2023-06-03 10:33:59', 1, 1, b'0');

-- ----------------------------
-- Table structure for invalid_recruit_admission_payment_useless
-- ----------------------------
DROP TABLE IF EXISTS `invalid_recruit_admission_payment_useless`;
CREATE TABLE `invalid_recruit_admission_payment_useless`  (
  `stu_id` bigint(20) NULL DEFAULT NULL COMMENT '学生id',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rebate_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返费账户',
  `rebate_account_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返费账号',
  `rebate_bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返费开户行',
  `payment_date` datetime(0) NOT NULL COMMENT '缴费日期',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for invalid_recruit_plan_settings
-- ----------------------------
DROP TABLE IF EXISTS `invalid_recruit_plan_settings`;
CREATE TABLE `invalid_recruit_plan_settings`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `admission_season` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生季',
  `major_id` bigint(20) NULL DEFAULT NULL COMMENT '专业',
  `further` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升学/就业',
  `enrollment_plan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生计划',
  `school_id` int(11) NULL DEFAULT NULL COMMENT '院校id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_recruit_plan_settings
-- ----------------------------
INSERT INTO `invalid_recruit_plan_settings` VALUES (1, '2022级', '春季', 2, '升学', '计划招生500人', 1, NULL, '2023-03-14 08:43:18', 0, 1, b'0');
INSERT INTO `invalid_recruit_plan_settings` VALUES (2, '二年级', '春季', 3, '实习', '计划招生300人', 1, NULL, NULL, 0, 0, b'0');
INSERT INTO `invalid_recruit_plan_settings` VALUES (3, '一年级', '春季', 2, '升学', '200', 1, '2022-11-28 21:07:13', '2022-11-28 21:07:13', 1, 1, b'0');
INSERT INTO `invalid_recruit_plan_settings` VALUES (4, '1', '春季', NULL, '升学', '100', 16, '2023-03-31 08:51:33', '2023-03-31 08:51:33', 1, 1, b'0');
INSERT INTO `invalid_recruit_plan_settings` VALUES (5, '2024', '春', NULL, '升学', '500', 34, '2023-06-03 11:01:37', '2023-06-03 11:01:37', 1, 1, b'0');

-- ----------------------------
-- Table structure for invalid_reduce_list_stipend
-- ----------------------------
DROP TABLE IF EXISTS `invalid_reduce_list_stipend`;
CREATE TABLE `invalid_reduce_list_stipend`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `academy_id` bigint(20) NULL DEFAULT NULL COMMENT '学院id',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家庭困难类型',
  `reduce_train_fee` decimal(10, 0) NOT NULL COMMENT '扣减学费',
  `reduce_clothes_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减服装费',
  `reduce_book_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减教材费',
  `reduce_hotel_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减住宿费',
  `reduce_bed_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减被褥费',
  `reduce_insurance_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减保险费',
  `reduce_public_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减公物押金',
  `reduce_certificate_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减证书费',
  `reduce_defense_edu_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减国防教育费',
  `reduce_body_exam_fee` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '扣减体检费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_reduce_list_stipend
-- ----------------------------
INSERT INTO `invalid_reduce_list_stipend` VALUES (2, 1, '无困难', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `invalid_reduce_list_stipend` VALUES (3, 1, '农村（含县镇）学生 ', 800, 150, 200, 100, 100, 100, 100, 100, 100, 100);
INSERT INTO `invalid_reduce_list_stipend` VALUES (4, 8, '无困难', 1000, 50, 100, 200, 100, 100, 100, 100, 100, 100);
INSERT INTO `invalid_reduce_list_stipend` VALUES (5, 34, '入学前，农村户口减免2000元', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `invalid_reduce_list_stipend` VALUES (6, 34, '无减免', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for invalid_stu_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `invalid_stu_detail_info`;
CREATE TABLE `invalid_stu_detail_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) NOT NULL,
  `edu_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培养层次',
  `skill_before_admission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入学前技能水平',
  `entrance_qual` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入学学历',
  `graduated_school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `registered_residence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户口性质',
  `is_difficulty` bit(1) NULL DEFAULT NULL COMMENT '是否家庭困难',
  `difficulty_type` bigint(20) NULL DEFAULT NULL COMMENT '(家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、家庭经济困难残疾人子女、其他',
  `waive_type` bigint(20) NULL DEFAULT NULL COMMENT '免学费申请：农村（含县镇）学生 、城市涉农专业学生、城市家庭经济困难学生、民族地区就读学生、戏曲表演专业学生',
  `support_type` int(11) NULL DEFAULT NULL COMMENT '资助申请类型',
  `total_income` decimal(10, 2) NULL DEFAULT NULL COMMENT '家庭年总收入（元）',
  `ave_income` decimal(10, 2) NULL DEFAULT NULL COMMENT '家庭人均收入（元）',
  `income_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_semester_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `second_semester_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `third_semester_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fourth_semester_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fifth_semester_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sixth_semester_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账户',
  `bank_card_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡帐号',
  `deposit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invalid_stu_detail_info
-- ----------------------------
INSERT INTO `invalid_stu_detail_info` VALUES (1, 1, '本科111', '四级', '本科', '浙江理工大学', '农村', b'0', 2, 2, 1, 8000.01, 2000.00, '务农', '良', '良', '优', '优', '优', '优', '5446455464', '45456546546', '中国银行', '2022-12-05 17:00:43', '2023-03-14 13:11:59', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (2, 2, '本科', '四级', '本科', '浙江理工大学', '农村', b'0', 1, 2, 1, 8000.01, 2000.00, '务农', '优', '良', '优', '优', '优', '优', '5446455464', '45456546546', '中国银行', '2022-12-05 17:00:43', '2022-12-05 17:00:43', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (6, 34, NULL, NULL, NULL, NULL, NULL, b'1', 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-25 12:58:42', '2023-02-25 12:58:42', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (9, 37, NULL, NULL, NULL, NULL, NULL, b'1', 2, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 16:35:51', '2023-02-27 16:35:51', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (10, 38, NULL, NULL, NULL, NULL, NULL, b'1', 2, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 16:42:17', '2023-02-27 19:44:25', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (17, 45, NULL, NULL, NULL, NULL, NULL, b'1', 1, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 10:45:24', '2023-03-02 10:48:04', 6, 6, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (19, 47, NULL, NULL, NULL, NULL, NULL, b'1', 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 15:23:49', '2023-03-02 15:23:49', 6, 6, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (23, 51, NULL, NULL, NULL, NULL, NULL, b'1', 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-07 09:55:04', '2023-03-07 09:55:04', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (24, 52, NULL, NULL, NULL, NULL, NULL, b'1', 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-08 15:02:31', '2023-03-08 15:02:31', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (48, 77, NULL, NULL, NULL, NULL, NULL, b'1', 6, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 16:04:28', '2023-03-31 16:04:28', 13, 13, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (50, 79, NULL, NULL, NULL, NULL, NULL, b'1', 6, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 16:12:33', '2023-03-31 16:12:33', 1, 1, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (51, 80, NULL, NULL, NULL, NULL, NULL, b'1', 6, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-29 14:14:44', '2023-05-29 14:14:44', 6, 6, b'0');
INSERT INTO `invalid_stu_detail_info` VALUES (52, 81, NULL, NULL, NULL, NULL, NULL, b'1', 6, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 10:33:59', '2023-06-03 10:56:34', 1, 1, b'0');

-- ----------------------------
-- Table structure for invalid_train_stu_info
-- ----------------------------
DROP TABLE IF EXISTS `invalid_train_stu_info`;
CREATE TABLE `invalid_train_stu_info`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别(男 or 女)',
  `age` int(11) NOT NULL COMMENT '年龄',
  `education_background` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学历',
  `id_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `native_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '户籍地\r\n户籍地',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '联系方式',
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现住址',
  `work` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '从事工作',
  `train_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '培训类别',
  `certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '证书名称',
  `certificate_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '证书等级',
  `is_social_security` tinyint(255) NOT NULL COMMENT '有无社保（有无）',
  `payment_amount` decimal(10, 0) NOT NULL COMMENT '缴费金额',
  `payment_date` date NOT NULL COMMENT '缴费日期',
  `train_start_date` date NOT NULL COMMENT '培训开始日期',
  `train_end_date` date NOT NULL COMMENT '培训结束日期',
  `period_sum` decimal(10, 0) NOT NULL COMMENT '总学时',
  `period` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '理论学时',
  `teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '理论教师',
  `study_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学习形式',
  `train_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '培训场所',
  `practice_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '实践学时',
  `info_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报名信息来源（微信 熟人介绍 抖音）',
  `admission_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '招生老师',
  `admission_teacher_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '招生老师电话',
  `certificate_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '证书编号',
  `lodgment_date` date NOT NULL COMMENT '签收日期',
  `stu_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学员状态（在培、结业、退学）',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` bigint(20) NOT NULL,
  `update_user` bigint(20) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-G0JA6CT1690940247120', 1690962208316, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'G7-15-75881690943135591', 1690962214336, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'iZbp1iv72o35ai7e7a7ssqZ1690961206186', 1690962215770, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'VM-4-9-centos1689382129183', 1690962205885, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 415 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-08 16:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 11:00:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 12:00:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 16:00:01');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-16 16:30:01');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-16 18:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-16 20:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-16 21:00:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 09:00:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-17 09:30:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-17 10:00:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-17 10:30:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-17 11:00:04');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 12:00:01');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 13:00:01');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 13:30:01');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-17 14:30:04');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-17 15:00:02');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 15:30:03');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 16:00:02');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-18 18:30:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-19 10:00:01');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-19 11:00:01');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-19 11:30:01');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-22 10:30:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 11:00:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-22 11:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-22 12:00:01');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 14:00:01');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 7, '2022-11-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-22 20:00:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 7, '2022-11-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-22 22:00:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-22 23:00:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-22 23:30:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 81, '2022-11-23 00:00:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-23 00:30:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-23 01:00:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 01:30:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 02:00:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 02:30:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 03:00:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 03:30:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 04:00:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 04:30:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-23 05:00:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 05:30:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 06:00:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 06:30:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 07:00:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 07:30:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 08:00:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 08:30:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 09:00:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 09:30:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 10:00:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 9, '2022-11-23 10:30:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-23 11:00:01');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-23 11:30:01');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-23 12:00:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 12:30:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 13:00:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 13:30:02');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-23 14:00:01');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 14:30:01');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 15:00:04');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-23 15:30:01');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 16:00:02');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-23 16:30:01');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 17:00:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 18:00:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 18:30:01');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 19:00:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-23 19:30:01');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 20:00:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-23 20:30:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 20:00:00');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-24 21:30:00');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-24 22:00:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 22:30:00');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 23:00:00');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-24 23:30:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 24, '2022-11-25 00:00:00');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 7, '2022-11-25 07:30:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 08:00:00');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 08:30:00');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-25 09:00:00');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 09:30:00');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 13, '2022-11-25 10:00:00');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-25 10:30:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 10, '2022-11-25 11:00:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-25 11:30:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 7, '2022-11-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-25 22:30:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-25 23:00:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-25 23:30:00');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-26 00:00:00');
INSERT INTO `schedule_job_log` VALUES (194, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 00:30:00');
INSERT INTO `schedule_job_log` VALUES (195, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 01:00:00');
INSERT INTO `schedule_job_log` VALUES (196, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 01:30:00');
INSERT INTO `schedule_job_log` VALUES (197, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 02:00:00');
INSERT INTO `schedule_job_log` VALUES (198, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 02:30:00');
INSERT INTO `schedule_job_log` VALUES (199, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 03:00:00');
INSERT INTO `schedule_job_log` VALUES (200, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 03:30:00');
INSERT INTO `schedule_job_log` VALUES (201, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 04:00:00');
INSERT INTO `schedule_job_log` VALUES (202, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 04:30:00');
INSERT INTO `schedule_job_log` VALUES (203, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 05:00:00');
INSERT INTO `schedule_job_log` VALUES (204, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 05:30:00');
INSERT INTO `schedule_job_log` VALUES (205, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 06:00:00');
INSERT INTO `schedule_job_log` VALUES (206, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 06:30:00');
INSERT INTO `schedule_job_log` VALUES (207, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 07:00:00');
INSERT INTO `schedule_job_log` VALUES (208, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 07:30:00');
INSERT INTO `schedule_job_log` VALUES (209, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 08:00:00');
INSERT INTO `schedule_job_log` VALUES (210, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 08:30:00');
INSERT INTO `schedule_job_log` VALUES (211, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 09:00:00');
INSERT INTO `schedule_job_log` VALUES (212, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 09:30:00');
INSERT INTO `schedule_job_log` VALUES (213, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES (214, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES (215, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES (216, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES (217, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 12:00:00');
INSERT INTO `schedule_job_log` VALUES (218, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 12:30:00');
INSERT INTO `schedule_job_log` VALUES (219, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 13:00:00');
INSERT INTO `schedule_job_log` VALUES (220, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-26 13:30:00');
INSERT INTO `schedule_job_log` VALUES (221, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES (222, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES (223, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES (224, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES (225, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES (226, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 16:30:00');
INSERT INTO `schedule_job_log` VALUES (227, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 17:00:00');
INSERT INTO `schedule_job_log` VALUES (228, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES (229, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 18:00:00');
INSERT INTO `schedule_job_log` VALUES (230, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES (231, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 19:00:01');
INSERT INTO `schedule_job_log` VALUES (232, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES (233, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES (234, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 20:30:00');
INSERT INTO `schedule_job_log` VALUES (235, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 21:00:00');
INSERT INTO `schedule_job_log` VALUES (236, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES (237, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 22:00:00');
INSERT INTO `schedule_job_log` VALUES (238, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 22:30:00');
INSERT INTO `schedule_job_log` VALUES (239, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-26 23:00:00');
INSERT INTO `schedule_job_log` VALUES (240, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-26 23:30:00');
INSERT INTO `schedule_job_log` VALUES (241, 1, 'testTask', 'renren', 0, NULL, 9, '2022-11-27 00:00:00');
INSERT INTO `schedule_job_log` VALUES (242, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 00:30:00');
INSERT INTO `schedule_job_log` VALUES (243, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 01:00:03');
INSERT INTO `schedule_job_log` VALUES (244, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 01:30:00');
INSERT INTO `schedule_job_log` VALUES (245, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 02:00:00');
INSERT INTO `schedule_job_log` VALUES (246, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 02:30:00');
INSERT INTO `schedule_job_log` VALUES (247, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 03:00:00');
INSERT INTO `schedule_job_log` VALUES (248, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 03:30:00');
INSERT INTO `schedule_job_log` VALUES (249, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 04:00:00');
INSERT INTO `schedule_job_log` VALUES (250, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 04:30:00');
INSERT INTO `schedule_job_log` VALUES (251, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 05:00:00');
INSERT INTO `schedule_job_log` VALUES (252, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 05:30:00');
INSERT INTO `schedule_job_log` VALUES (253, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 06:00:00');
INSERT INTO `schedule_job_log` VALUES (254, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 06:30:00');
INSERT INTO `schedule_job_log` VALUES (255, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 07:00:00');
INSERT INTO `schedule_job_log` VALUES (256, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 07:30:00');
INSERT INTO `schedule_job_log` VALUES (257, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 08:00:00');
INSERT INTO `schedule_job_log` VALUES (258, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 08:30:00');
INSERT INTO `schedule_job_log` VALUES (259, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 09:00:00');
INSERT INTO `schedule_job_log` VALUES (260, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 09:30:00');
INSERT INTO `schedule_job_log` VALUES (261, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 10:00:00');
INSERT INTO `schedule_job_log` VALUES (262, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 10:30:00');
INSERT INTO `schedule_job_log` VALUES (263, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES (264, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 11:30:00');
INSERT INTO `schedule_job_log` VALUES (265, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES (266, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES (267, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES (268, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES (269, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES (270, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES (271, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES (272, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES (273, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES (274, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES (275, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-27 18:30:01');
INSERT INTO `schedule_job_log` VALUES (276, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 09:00:00');
INSERT INTO `schedule_job_log` VALUES (277, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 09:30:00');
INSERT INTO `schedule_job_log` VALUES (278, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 10:00:01');
INSERT INTO `schedule_job_log` VALUES (279, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-28 10:30:00');
INSERT INTO `schedule_job_log` VALUES (280, 1, 'testTask', 'renren', 0, NULL, 5, '2022-11-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES (281, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 11:30:03');
INSERT INTO `schedule_job_log` VALUES (282, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES (283, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 12:30:00');
INSERT INTO `schedule_job_log` VALUES (284, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES (285, 1, 'testTask', 'renren', 0, NULL, 6, '2022-11-28 13:30:00');
INSERT INTO `schedule_job_log` VALUES (286, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES (287, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES (288, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES (289, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES (290, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES (291, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES (292, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 17:00:00');
INSERT INTO `schedule_job_log` VALUES (293, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES (294, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES (295, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-28 18:30:00');
INSERT INTO `schedule_job_log` VALUES (296, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 19:00:00');
INSERT INTO `schedule_job_log` VALUES (297, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES (298, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 20:00:00');
INSERT INTO `schedule_job_log` VALUES (299, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 20:30:00');
INSERT INTO `schedule_job_log` VALUES (300, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 21:00:00');
INSERT INTO `schedule_job_log` VALUES (301, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 21:30:01');
INSERT INTO `schedule_job_log` VALUES (302, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES (303, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 22:30:01');
INSERT INTO `schedule_job_log` VALUES (304, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-28 23:00:00');
INSERT INTO `schedule_job_log` VALUES (305, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-28 23:30:00');
INSERT INTO `schedule_job_log` VALUES (306, 1, 'testTask', 'renren', 0, NULL, 4, '2022-11-29 00:00:00');
INSERT INTO `schedule_job_log` VALUES (307, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 00:30:00');
INSERT INTO `schedule_job_log` VALUES (308, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 01:00:00');
INSERT INTO `schedule_job_log` VALUES (309, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 01:30:00');
INSERT INTO `schedule_job_log` VALUES (310, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 02:00:00');
INSERT INTO `schedule_job_log` VALUES (311, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 02:30:00');
INSERT INTO `schedule_job_log` VALUES (312, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 03:00:00');
INSERT INTO `schedule_job_log` VALUES (313, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 03:30:00');
INSERT INTO `schedule_job_log` VALUES (314, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 04:00:00');
INSERT INTO `schedule_job_log` VALUES (315, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 04:30:00');
INSERT INTO `schedule_job_log` VALUES (316, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 05:00:00');
INSERT INTO `schedule_job_log` VALUES (317, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 05:30:00');
INSERT INTO `schedule_job_log` VALUES (318, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 06:00:00');
INSERT INTO `schedule_job_log` VALUES (319, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 06:30:00');
INSERT INTO `schedule_job_log` VALUES (320, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 07:00:00');
INSERT INTO `schedule_job_log` VALUES (321, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 07:30:00');
INSERT INTO `schedule_job_log` VALUES (322, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 08:00:00');
INSERT INTO `schedule_job_log` VALUES (323, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 08:30:00');
INSERT INTO `schedule_job_log` VALUES (324, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 09:00:00');
INSERT INTO `schedule_job_log` VALUES (325, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 09:30:00');
INSERT INTO `schedule_job_log` VALUES (326, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 10:00:02');
INSERT INTO `schedule_job_log` VALUES (327, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 10:30:00');
INSERT INTO `schedule_job_log` VALUES (328, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES (329, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 11:30:03');
INSERT INTO `schedule_job_log` VALUES (330, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-29 12:00:02');
INSERT INTO `schedule_job_log` VALUES (331, 1, 'testTask', 'renren', 0, NULL, 2, '2022-11-29 12:30:00');
INSERT INTO `schedule_job_log` VALUES (332, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 13:00:00');
INSERT INTO `schedule_job_log` VALUES (333, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES (334, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 14:00:01');
INSERT INTO `schedule_job_log` VALUES (335, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES (336, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 15:00:00');
INSERT INTO `schedule_job_log` VALUES (337, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 15:30:00');
INSERT INTO `schedule_job_log` VALUES (338, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 16:00:02');
INSERT INTO `schedule_job_log` VALUES (339, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 16:30:02');
INSERT INTO `schedule_job_log` VALUES (340, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 17:00:00');
INSERT INTO `schedule_job_log` VALUES (341, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 17:30:00');
INSERT INTO `schedule_job_log` VALUES (342, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 18:00:00');
INSERT INTO `schedule_job_log` VALUES (343, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 18:30:00');
INSERT INTO `schedule_job_log` VALUES (344, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 19:00:00');
INSERT INTO `schedule_job_log` VALUES (345, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 19:30:01');
INSERT INTO `schedule_job_log` VALUES (346, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 20:00:00');
INSERT INTO `schedule_job_log` VALUES (347, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 20:30:01');
INSERT INTO `schedule_job_log` VALUES (348, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 21:00:00');
INSERT INTO `schedule_job_log` VALUES (349, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 21:30:00');
INSERT INTO `schedule_job_log` VALUES (350, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 22:00:00');
INSERT INTO `schedule_job_log` VALUES (351, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 22:30:00');
INSERT INTO `schedule_job_log` VALUES (352, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-29 23:00:00');
INSERT INTO `schedule_job_log` VALUES (353, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-29 23:30:00');
INSERT INTO `schedule_job_log` VALUES (354, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-30 00:00:00');
INSERT INTO `schedule_job_log` VALUES (355, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 00:30:00');
INSERT INTO `schedule_job_log` VALUES (356, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 01:00:00');
INSERT INTO `schedule_job_log` VALUES (357, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 01:30:00');
INSERT INTO `schedule_job_log` VALUES (358, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 02:00:00');
INSERT INTO `schedule_job_log` VALUES (359, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 02:30:00');
INSERT INTO `schedule_job_log` VALUES (360, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 03:00:00');
INSERT INTO `schedule_job_log` VALUES (361, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 03:30:00');
INSERT INTO `schedule_job_log` VALUES (362, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 04:00:00');
INSERT INTO `schedule_job_log` VALUES (363, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 04:30:00');
INSERT INTO `schedule_job_log` VALUES (364, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 05:00:00');
INSERT INTO `schedule_job_log` VALUES (365, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 05:30:00');
INSERT INTO `schedule_job_log` VALUES (366, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 06:00:00');
INSERT INTO `schedule_job_log` VALUES (367, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 06:30:00');
INSERT INTO `schedule_job_log` VALUES (368, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 07:00:00');
INSERT INTO `schedule_job_log` VALUES (369, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 07:30:00');
INSERT INTO `schedule_job_log` VALUES (370, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 08:00:00');
INSERT INTO `schedule_job_log` VALUES (371, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 08:30:00');
INSERT INTO `schedule_job_log` VALUES (372, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 09:00:00');
INSERT INTO `schedule_job_log` VALUES (373, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 09:30:01');
INSERT INTO `schedule_job_log` VALUES (374, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 10:00:03');
INSERT INTO `schedule_job_log` VALUES (375, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 10:30:02');
INSERT INTO `schedule_job_log` VALUES (376, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 11:00:00');
INSERT INTO `schedule_job_log` VALUES (377, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 11:30:02');
INSERT INTO `schedule_job_log` VALUES (378, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES (379, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES (380, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 13:00:01');
INSERT INTO `schedule_job_log` VALUES (381, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 13:30:01');
INSERT INTO `schedule_job_log` VALUES (382, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 14:00:02');
INSERT INTO `schedule_job_log` VALUES (383, 1, 'testTask', 'renren', 0, NULL, 3, '2022-11-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES (384, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES (385, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES (386, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 16:00:01');
INSERT INTO `schedule_job_log` VALUES (387, 1, 'testTask', 'renren', 0, NULL, 1, '2022-11-30 18:00:02');
INSERT INTO `schedule_job_log` VALUES (388, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES (389, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 19:00:00');
INSERT INTO `schedule_job_log` VALUES (390, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 19:30:00');
INSERT INTO `schedule_job_log` VALUES (391, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 20:00:00');
INSERT INTO `schedule_job_log` VALUES (392, 1, 'testTask', 'renren', 0, NULL, 0, '2022-11-30 21:00:00');
INSERT INTO `schedule_job_log` VALUES (393, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 16:00:00');
INSERT INTO `schedule_job_log` VALUES (394, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 16:30:00');
INSERT INTO `schedule_job_log` VALUES (395, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 17:00:00');
INSERT INTO `schedule_job_log` VALUES (396, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-01 17:30:00');
INSERT INTO `schedule_job_log` VALUES (397, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-01 18:00:00');
INSERT INTO `schedule_job_log` VALUES (398, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 18:30:00');
INSERT INTO `schedule_job_log` VALUES (399, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-01 19:00:00');
INSERT INTO `schedule_job_log` VALUES (400, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 19:30:00');
INSERT INTO `schedule_job_log` VALUES (401, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-01 20:00:00');
INSERT INTO `schedule_job_log` VALUES (402, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 11:30:00');
INSERT INTO `schedule_job_log` VALUES (403, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 12:00:00');
INSERT INTO `schedule_job_log` VALUES (404, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES (405, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES (406, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES (407, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES (408, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES (409, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 15:00:00');
INSERT INTO `schedule_job_log` VALUES (410, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES (411, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 16:00:00');
INSERT INTO `schedule_job_log` VALUES (412, 1, 'testTask', 'renren', 0, NULL, 1, '2022-12-03 16:30:00');
INSERT INTO `schedule_job_log` VALUES (413, 1, 'testTask', 'renren', 0, NULL, 0, '2022-12-03 17:00:00');
INSERT INTO `schedule_job_log` VALUES (414, 1, 'testTask', 'renren', 0, NULL, 2, '2022-12-07 14:30:00');

-- ----------------------------
-- Table structure for stu_base_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_base_info`;
CREATE TABLE `stu_base_info`  (
  `stu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `academy_id` bigint(20) NULL DEFAULT NULL COMMENT '院校id',
  `school_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `stu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `id_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号码',
  `id_number_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证类型',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `nation` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `native_place` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `political_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `edu_before` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入学学历',
  `skill_before` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入学前技能水平',
  `school_before` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `residence_type` tinyint(2) NULL DEFAULT NULL COMMENT '户口性质 0非农户口 1农业户口',
  `email` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `schooling_length` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学制',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '系部id',
  `grade_id` bigint(20) NULL DEFAULT NULL COMMENT '年级id',
  `major_id` bigint(20) NULL DEFAULT NULL COMMENT '专业id',
  `class_id` bigint(20) NULL DEFAULT NULL COMMENT '班级id',
  `admission_season` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生季',
  `admission_date` datetime(0) NULL DEFAULT NULL COMMENT '入学日期',
  `school_roll_status` int(11) NULL DEFAULT NULL COMMENT '学籍状态（在册在籍、在册不在籍、在籍退学、非在册非在籍、提前入学）',
  `register_date` datetime(0) NULL DEFAULT NULL COMMENT '注册学籍日期',
  `class_type` int(11) NULL DEFAULT NULL COMMENT '班型',
  `is_admission_early` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否提前入学',
  `head_teacher` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班主任',
  `head_teacher_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班主任电话',
  `head_teacher_dept` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班主任所属部门名称',
  `study_in` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现就读学校',
  `status_school` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现学籍学校',
  `develop_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培养层次',
  `current_status` int(11) NULL DEFAULT NULL COMMENT '当前状态:0在校、1实习、2就业、3请假、4休学、5退学、6毕业',
  `dorm_num` int(11) NULL DEFAULT NULL COMMENT '宿舍楼号',
  `room_num` int(11) NULL DEFAULT NULL COMMENT '房间号',
  `bed_num` int(11) NULL DEFAULT NULL COMMENT '床位号',
  `check_in` datetime(0) NULL DEFAULT NULL COMMENT '入住日期',
  `leave_date` datetime(0) NULL DEFAULT NULL COMMENT '离宿日期',
  `first_assess` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第一学期评定',
  `second_assess` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二学期评定',
  `third_assess` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三学期评定',
  `fourth_assess` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第四学期评定',
  `fifth_assess` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第五学期评定',
  `sixth_assess` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第六学期评定',
  `is_difficulty` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否家庭困难',
  `difficulty_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '(家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、家庭经济困难残疾人子女、其他',
  `support_type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资助申请类型',
  `total_income` decimal(10, 2) NULL DEFAULT NULL COMMENT '家庭年总收入（元）',
  `ave_income` decimal(10, 2) NULL DEFAULT NULL COMMENT '家庭人均收入（元）',
  `id_card_addr` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证地址',
  `family_member_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭联系人',
  `post_code` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `family_addr` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `family_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭联系电话',
  `income_source` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭经济来源',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_base_info
-- ----------------------------
INSERT INTO `stu_base_info` VALUES (117, 383, NULL, '刘奥宇', '131023200808262000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第五中学', 1, NULL, '三年', NULL, 414, 415, NULL, '2023年秋季', NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', '2023-08-01 09:44:01', 3, 1, b'1');
INSERT INTO `stu_base_info` VALUES (118, 383, NULL, '周新奥', '131002200802142000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '三年', NULL, 414, 433, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'1');
INSERT INTO `stu_base_info` VALUES (119, 383, 'C131002200710073028', '卢欣雅', '131002200710073028', '大陆居民身份证', '2007-10-07', '女', '汉', '河北省', '群众', '15532655699', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-02-27 00:00:00', 0, '2023-02-27 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '李萍', NULL, '河北省廊坊市广阳区九州镇南顺民屯村215号', '18732673576', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (120, 383, 'C13102320070304102X', '于佳', '13102320070304102X', '大陆居民身份证', '2007-03-04', '女', '汉', '河北省', '群众', '15350709464', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 419, 420, '春招', '2023-02-28 00:00:00', 0, '2023-02-28 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '于海兴', NULL, '河北省永清县刘街乡小五间房村9142号', '18732638389', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (121, 383, 'C13100220080213182X', '陈文暄', '13100220080213182X', '大陆居民身份证', '2008-02-13', '女', '汉', '河北省', '群众', '13031818489', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-01 00:00:00', 0, '2023-03-01 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '陈德敬', NULL, '河北省廊坊市安次区杨税务乡麻儿营村28144号', '18833676799', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (122, 383, 'C130981200711145648', '杨梓灿', '130981200711145648', '大陆居民身份证', '2007-11-14', '女', '汉', '河北省', '群众', '19143349108', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-03-02 00:00:00', 0, '2023-03-02 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '冯丽丽', NULL, '河北省廊坊市固安县牛驼镇霍辛庄村038号', '17331645294', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (123, 383, 'C131022200712215056', '刘硕', '131022200712215056', '大陆居民身份证', '2007-12-21', '男', '汉', '河北省', '群众', '13011930171', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-03 00:00:00', 0, '2023-03-03 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '刘金杰', NULL, '河北省廊坊市固安县东湾乡南公由村372号', '15932600783', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (124, 383, 'C411328200707051335', '蔡方毅', '411328200707051335', '大陆居民身份证', '2007-07-05', '男', '汉', '河南省', '群众', '19844863873', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-04 00:00:00', 0, '2023-03-04 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '杨秋英', NULL, '河南省唐河县源潭镇马梗村马梗10号', '15701000768', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (125, 383, 'C131022200704241617', '张博文', '131022200704241617', '大陆居民身份证', '2007-04-24', '男', '汉', '河北省', '群众', '18131692966', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-05 00:00:00', 0, '2023-03-05 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '刘爱平', NULL, '河北省廊坊市固安县柳泉镇无为庄村1019号', '15830606535', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (126, 383, 'C131002200609132417', '浦桐鑫', '131002200609132417', '大陆居民身份证', '2006-09-13', '男', '汉', '河北省', '群众', '15383061646', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 430, 431, '春招', '2023-03-06 00:00:00', 0, '2023-03-06 00:00:00', NULL, '是', '闫秀萍', '13671331528', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '浦海波', NULL, '河北省廊坊市广阳区北旺乡北旺二村2排035号', '13784814565', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (127, 383, 'C131022200805010615', '纪增', '131022200805010615', '大陆居民身份证', '2008-05-01', '男', '汉', '河北省', '群众', '15832656171', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-07 00:00:00', 0, '2023-03-07 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '庞爱平', NULL, '河北省廊坊市固安县温泉园区纪家营村052号', '13473689900', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (128, 383, 'C13102220080603503X', '赵佳宝', '13102220080603503X', '大陆居民身份证', '2008-06-03', '男', '汉', '河北省', '群众', '17692616228', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-03-08 00:00:00', 0, '2023-03-08 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '赵刚', NULL, '河北省廊坊市固安县东湾乡大辛庄西村217号', '15531615443', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (129, 383, 'C230230200709122119', '杨佳旭', '230230200709122119', '大陆居民身份证', '2007-09-12', '男', '汉', '黑龙江省', '群众', '18131678231', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-09 00:00:00', 0, '2023-03-09 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '杨洪林', NULL, '黑龙江省齐齐哈尔市克东县玉岗镇群英村6组79号', '15333367678', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (130, 383, 'C131002200802281414', '张鹏', '131002200802281414', '大陆居民身份证', '2008-02-28', '男', '汉', '河北省', '群众', '19933461126', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-10 00:00:00', 0, '2023-03-10 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '张焕军', NULL, '河北省廊坊市安次区仇庄乡东麻各庄046号', '18903265578', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (131, 383, 'C130731200804043435', '戴伟佳', '130731200804043435', '大陆居民身份证', '2008-04-04', '男', '汉', '河北省', '群众', '19931316858', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-11 00:00:00', 0, '2023-03-11 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '刘秀叶', NULL, '河北省张家口市涿鹿县大堡镇倒拉咀村948号', '13463640228', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (132, 383, 'C131024200806031314', '李天阳', '131024200806031314', '大陆居民身份证', '2008-06-03', '男', '汉', '河北省', '群众', '15231643990', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-12 00:00:00', 0, '2023-03-12 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '李磊', NULL, '河北省廊坊市香河县刘宋镇八户村242号', '13700347121', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (133, 383, 'C131023200712210817', '刘昊天', '131023200712210817', '大陆居民身份证', '2007-12-21', '男', '汉', '河北省', '群众', '13273602061', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 427, 429, '春招', '2023-03-13 00:00:00', 0, '2023-03-13 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '刘秀臣', NULL, '河北省廊坊市永清县后奕镇李奉先村19号', '13513162635', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (134, 383, 'C131024200806050726', '周晴', '131024200806050726', '大陆居民身份证', '2008-06-05', '女', '汉', '河北省', '群众', '15231626472', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-14 00:00:00', 0, '2023-03-14 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '周志伟', NULL, '河北省廊坊市香河县渠口镇邵庄村281号', '15100669920', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (135, 383, 'C130828200904133734', '陆泓博', '130828200904133734', '大陆居民身份证', '2009-04-13', '男', '汉', '河北省', '群众', '15321403459', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-15 00:00:00', 0, '2023-03-15 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '陆广永', NULL, '河北省承德市围场县郭家湾乡旺水泉村44号', '18730695933', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (136, 383, 'C131024200805134418', '孔宪阳', '131024200805134418', '大陆居民身份证', '2008-05-13', '男', '汉', '河北省', '群众', '13231620722', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-03-16 00:00:00', 0, '2023-03-16 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '韩建国', NULL, '河北省廊坊市香河县安头屯镇铁佛堂村776号', '18633799643', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (137, 383, 'C131002200704264813', '黄宇航', '131002200704264813', '大陆居民身份证', '2007-04-26', '男', '汉', '河北省', '群众', '15369478219', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-17 00:00:00', 0, '2023-03-17 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '张术娟', NULL, '河北省廊坊市经济技术开发区韩胜营村1组22号', '15231654461', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (138, 383, 'C131023200608092814', '佟梓鹏', '131023200608092814', '大陆居民身份证', '2006-08-09', '男', '汉', '河北省', '群众', '15532683807', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 419, 420, '春招', '2023-03-18 00:00:00', 0, '2023-03-18 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '佟旭国', NULL, '河北省廊坊市永清县曹家务乡唐家营村110号', '13363627486', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (139, 383, 'C131081200807192117', '杨承昊', '131081200807192117', '大陆居民身份证', '2008-07-19', '男', '汉', '河北省', '群众', '17716582608', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-19 00:00:00', 0, '2023-03-19 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '杨建发', NULL, '河北省霸州市信安镇新立街四区新口路30号', '15831685761', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (140, 383, 'C131002200807174810', '赵梓杰', '131002200807174810', '大陆居民身份证', '2008-07-17', '男', '汉', '河北省', '群众', '17360774191', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-20 00:00:00', 0, '2023-03-20 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '王颖', NULL, '河北省廊坊市开发区大官地3组158号', '19933612526', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (141, 383, 'C131022200904104211', '刘恩廷', '131022200904104211', '大陆居民身份证', '2009-04-10', '男', '汉', '河北省', '群众', '13930673220', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-21 00:00:00', 0, '2023-03-21 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '刘铁', NULL, '河北省廊坊市固安县宫村镇西米各庄村139号', '17734450389', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (142, 383, 'C131022200803145014', '赵梓卓', '131022200803145014', '大陆居民身份证', '2008-03-14', '男', '汉', '河北省', '群众', '15100615271', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-22 00:00:00', 0, '2023-03-22 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '赵向阳', NULL, '河北省廊坊市固安县东湾乡大辛庄东村205号', '15732670512', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (143, 383, 'C131024200803180023', '张悦然', '131024200803180023', '大陆居民身份证', '2008-03-18', '女', '汉', '河北省', '群众', '15081665879', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-23 00:00:00', 0, '2023-03-23 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校机电信息系', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '张晓冬', NULL, '河北省廊坊市香河县淑阳镇河北止务村103号', '18333602240', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (144, 383, 'C131022200710235424', '米娆梦', '131022200710235424', '大陆居民身份证', '2007-10-23', '女', '汉', '河北省', '群众', '19931820774', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-03-24 00:00:00', 0, '2023-03-24 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '米宏亮', NULL, '河北省廊坊市固安县彭村乡后营村086号', '13722601005', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (145, 383, 'C131022200803035448', '于紫怡', '131022200803035448', '大陆居民身份证', '2008-03-03', '女', '汉', '河北省', '群众', '17736716112', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-03-25 00:00:00', 0, '2023-03-25 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '于亮', NULL, '河北省廊坊市固安县彭村乡李外河村001号', '18330695779', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (146, 383, 'C131002200711022046', '聂乐彤', '131002200711022046', '大陆居民身份证', '2007-11-02', '女', '汉', '河北省', '群众', '13131691938', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-03-26 00:00:00', 0, '2023-03-26 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '聂海军', NULL, '河北省廊坊市安次区落垡镇裴务村018号', '13172176243', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (147, 383, 'C131022200711223310', '许睿', '131022200711223310', '大陆居民身份证', '2007-11-22', '男', '汉', '河北省', '群众', '18631665929', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-27 00:00:00', 0, '2023-03-27 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '许殿兵', NULL, '河北省廊坊市固安县固安镇梁各庄村135号', '18631660918', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (148, 383, 'C131022200804131618', '杨禄', '131022200804131618', '大陆居民身份证', '2008-04-13', '男', '汉', '河北省', '群众', '13171838129', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-03-28 00:00:00', 0, '2023-03-28 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '杨国庆', NULL, '河北省廊坊市固安县柳泉镇北义厚村仁厚路22号', '18131698309', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (149, 383, 'C131002200806191512', '宗佳昊', '131002200806191512', '大陆居民身份证', '2008-06-19', '男', '汉', '河北省', '群众', '18531626130', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-29 00:00:00', 0, '2023-03-29 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '宗波', NULL, '河北省廊坊市安次区杨税务乡南史务村40023号', '15603166365', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (150, 383, 'C131002200710012823', '李雨萱', '131002200710012823', '大陆居民身份证', '2007-10-01', '女', '汉', '河北省', '群众', '13784820868', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-03-30 00:00:00', 0, '2023-03-30 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '李洪丽', NULL, '河北省廊坊市广阳区万庄镇武家营村2队063号', '15231610890', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (151, 383, 'C131022200805105040', '贾雨菲', '131022200805105040', '大陆居民身份证', '2008-05-10', '女', '汉', '河北省', '群众', '17731608629', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 419, 420, '春招', '2023-03-31 00:00:00', 0, '2023-03-31 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '贾玉亮', NULL, '河北省廊坊市固安县东湾乡大辛庄东村075号', '17331682946', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (152, 383, 'C131022200710135028', '王菲', '131022200710135028', '大陆居民身份证', '2007-10-13', '女', '汉', '河北省', '群众', '19565150132', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-04-01 00:00:00', 0, '2023-04-01 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '王永强', NULL, '河北省廊坊市固安县东湾乡大杜庄村183号', '18330696505', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (153, 383, 'C131002200612312419', '胡佳轩', '131002200612312419', '大陆居民身份证', '2006-12-31', '男', '汉', '河北省', '群众', '13383663206', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 430, 431, '春招', '2023-04-02 00:00:00', 0, '2023-04-02 00:00:00', NULL, '是', '闫秀萍', '13671331528', '廊坊城轨交通技工学校现代服务系', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '胡红生', NULL, '河北省廊坊市广阳区北旺乡西村2排199号', '13383663206', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (154, 383, 'C131002200708303015', '付嘉强', '131002200708303015', '大陆居民身份证', '2007-08-30', '男', '汉', '河北省', '群众', '13722632652', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 419, 420, '春招', '2023-04-03 00:00:00', 0, '2023-04-03 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '付子明', NULL, '河北省廊坊市广阳区旧州乡炊庄526号', '13623261120', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (155, 383, 'C13102420080516721X', '贺子洋', '13102420080516721X', '大陆居民身份证', '2008-05-16', '男', '汉', '河北省', '群众', '15530690381', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 423, 424, '春招', '2023-04-04 00:00:00', 0, '2023-04-04 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '贺征', NULL, '河北省廊坊市香河县钱旺乡姜吴街村298号', '15831656761', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (156, 383, 'C131002200712013221', '王楷迪', '131002200712013221', '大陆居民身份证', '2007-12-01', '女', '汉', '河北省', '群众', '13930605564', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 425, 426, '春招', '2023-04-05 00:00:00', 0, '2023-04-05 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '王一然', NULL, '河北省廊坊市广阳区南尖塔乡碾子营村763号', '18033654071', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (157, 383, 'C41172720080522758X', '李楠楠', '41172720080522758X', '大陆居民身份证', '2008-05-22', '女', '汉', '河南省', '群众', '18131652630', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 421, 422, '春招', '2023-04-06 00:00:00', 0, '2023-04-06 00:00:00', NULL, '是', '王智宇', '15754587685', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '贾景德', NULL, '山东省曹县青岗集镇贾李行政村贾李村36号', '15803163678', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (158, 383, 'C13102320080430081X', '李宇朋', '13102320080430081X', '大陆居民身份证', '2008-04-30', '男', '汉', '河北省', '群众', '18831668307', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 427, 428, '春招', '2023-04-07 00:00:00', 0, '2023-04-07 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '张素梅', NULL, '河北省廊坊市永清县后奕镇小刘庄村138号', '15133434126', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (159, 383, 'C13102320080806085X', '孙一航', '13102320080806085X', '大陆居民身份证', '2008-08-06', '男', '汉', '河北省', '群众', '18713003159', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 427, 428, '春招', '2023-04-08 00:00:00', 0, '2023-04-08 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '孙朝晖', NULL, '河北省廊坊市永清县后奕镇辛立庄村148号', '13785667827', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (160, 383, 'C131003200803172814', '高鑫格', '131003200803172814', '大陆居民身份证', '2008-03-17', '男', '汉', '河北省', '群众', '19932635353', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 417, 418, '春招', '2023-04-09 00:00:00', 0, '2023-04-09 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '高朋', NULL, '河北省廊坊市广阳区万庄镇西华营村1队037号', '15532684444', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (161, 383, 'C131002200803174813', '安弘吉', '131002200803174813', '大陆居民身份证', '2008-03-17', '男', '汉', '河北省', '群众', '15373271655', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 430, 432, '春招', '2023-04-10 00:00:00', 0, '2023-04-10 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '安克雷', NULL, '河北省廊坊市经济技术开发区桐柏村2组146号', '18031602202', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (162, 383, 'C131002200807242019', '张子滕', '131002200807242019', '大陆居民身份证', '2008-07-24', '男', '汉', '河北省', '群众', '17358715866', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 430, 432, '春招', '2023-04-11 00:00:00', 0, '2023-04-11 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '张志刚', NULL, '河北省廊坊市安次区落垡镇落垡村5组361室', '13513017732', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (163, 383, 'C131022200806292618', '赵宇航', '131022200806292618', '大陆居民身份证', '2008-06-29', '男', '汉', '河北省', '群众', '19003361943', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 415, 416, '春招', '2023-04-12 00:00:00', 0, '2023-04-12 00:00:00', NULL, '是', '吴小兵', '17601051395', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '赵集伟', NULL, '河北省廊坊市固安县固安镇金卜拉村102号', '15100693669', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (164, 383, 'C130826200807047217', '王子涵', '130826200807047217', '大陆居民身份证', '2008-07-04', '男', '汉', '河北省', '群众', '13292695097', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 433, 434, '春招', '2023-04-13 00:00:00', 0, '2023-04-13 00:00:00', NULL, '是', '吴小兵', '17601051396', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '王伟', NULL, '河北省廊坊市香河县段庄区汇展路23号京汉君庭16号楼2单元901室', '13051465777', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (165, 383, 'C131022200703156410', '张庆林', '131022200703156410', '大陆居民身份证', '2007-03-15', '男', '汉', '河北省', '群众', '18131646593', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 427, 428, '春招', '2023-04-14 00:00:00', 0, '2023-04-14 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '张运江', NULL, '河北省廊坊市固安县礼让店乡大楮林村246号', '18730693207', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (166, 383, 'C131002200807112011', '王英旭', '131002200807112011', '大陆居民身份证', '2008-07-11', '男', '汉', '河北省', '群众', '17332605169', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 427, 428, '春招', '2023-04-15 00:00:00', 0, '2023-04-15 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '王会杰', NULL, '河北省廊坊市安次区落垈镇裴务村178号', '15832656432', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (167, 383, 'C131025200711293019', '张恩政', '131025200711293019', '大陆居民身份证', '2007-11-29', '男', '汉', '河北省', '群众', '16630425669', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 427, 428, '春招', '2023-04-16 00:00:00', 0, '2023-04-16 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '张虎城', NULL, '河北省廊坊市大城县刘各庄镇王各庄街北8号', '13582648845', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (168, 383, 'C131022200801064237', '王天一', '131022200801064237', '大陆居民身份证', '2008-01-06', '男', '汉', '河北省', '群众', '13191961672', '初中', '初级', NULL, 1, NULL, '三年', 414, 414, 427, 428, '春招', '2023-04-17 00:00:00', 0, '2023-04-17 00:00:00', NULL, '是', '刘德胜', '17692346628', '廊坊城轨交通技工学校升学部', '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', '中职', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '是', '一般贫困', '贫困奖学金', NULL, NULL, NULL, '王永涛', NULL, '河北省廊坊市固安县宫村镇徐一村414号', '13931614559', NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (169, 383, NULL, '李俊衫', '131002200711071000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '三年', NULL, 414, 433, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (170, 383, NULL, '尹伊', '13102320070019122X', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '永清一中', 1, NULL, '三年', NULL, 414, 435, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (171, 383, NULL, '叶静娴', '13100220080228202X', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第五中学', 1, NULL, '三年', NULL, 414, 436, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (172, 383, NULL, '尹贵博', '131002200709112000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊三中', 1, NULL, '三年', NULL, 414, 417, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (173, 383, NULL, '王雪晴', '131002200603112000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第五中学', 1, NULL, '三年', NULL, 414, 421, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (174, 383, NULL, '霍璟旭', '131023200711251000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '永清里澜城中学', 1, NULL, '三年', NULL, 414, 423, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (175, 383, NULL, '李文超', '15232620061003789X', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '通辽市东明中学', 1, NULL, '三年', NULL, 414, 438, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (176, 383, NULL, '安家庆', '131002200710160000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '三职中', 1, NULL, '三年', NULL, 414, 417, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (177, 383, NULL, '李红硕', '13102320080131081X', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '永清县第三中学', 1, NULL, '三年', NULL, 414, 437, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (178, 383, NULL, '常赵嘉', '131023200801200000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '永清县第三中学', 1, NULL, '三年', NULL, 414, 437, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (179, 383, NULL, '杨兴昀', '131022200808264000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '固安六中', 1, NULL, '三年', NULL, 414, 436, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (180, 383, NULL, '仇雪迎', '131022200807274000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '固安六中', 1, NULL, '三年', NULL, 414, 436, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (181, 383, NULL, '米傲轩', '131002200711212000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '北旺中学', 1, NULL, '三年', NULL, 414, 427, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (182, 383, NULL, '张猛', '131022200806104000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '固安六中', 1, NULL, '三年', NULL, 414, 415, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (183, 383, NULL, '张嘉诚', '131002200709102000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '三年', NULL, 414, 433, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (184, 383, NULL, '李梦楠', '131023200607011000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第三中学', 1, NULL, '三年', NULL, 414, 430, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (185, 383, NULL, '周宏阳', '131022200805305000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '固安彭村', 1, NULL, '三年', NULL, 414, 423, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (186, 383, NULL, '蔡雪阳', '130684200704105000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '高碑店职教中心', 1, NULL, '三年', NULL, 414, 427, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (187, 383, NULL, '杨奇睿', '411729200806271000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '燕郊十一中', 1, NULL, '三年', NULL, 414, 430, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (188, 383, NULL, '张博奥', '131022200801235000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '东湾中学', 1, NULL, '三年', NULL, 414, 415, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (189, 383, NULL, '梁语恒', '13100220070126325x', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '石家庄电子科技学校', 1, NULL, '三年', NULL, 414, 423, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (190, 383, NULL, '韩志慧', '410422200803250000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '河南省南阳市拐河镇一中', 1, NULL, '三年', NULL, 414, 436, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (191, 383, NULL, '丁雅航', '131002200610202000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河南', NULL, '初中学历', '万庄中学', 1, NULL, '三年', NULL, 414, 423, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (192, 383, NULL, '邢砚喆', '131002200712024000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '新世纪中学', 1, NULL, '三年', NULL, 414, 421, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (193, 383, NULL, '葛嘉阔', '130828200702267000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第十一中学', 1, NULL, '三年', NULL, 414, 427, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (194, 383, NULL, '赵子健', '131002200708091000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '三年', NULL, 414, 427, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (195, 383, NULL, '许雨佳', '131002200803032000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '廊坊市第五中学', 1, NULL, '三年', NULL, 414, 436, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (196, 383, NULL, '许鑫睿', '131025200709122000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '大城臧屯三中', 1, NULL, '三年', NULL, 414, 439, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (197, 383, NULL, '刘馨雨', '131022200710264000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '固安六中', 1, NULL, '三年', NULL, 414, 436, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (198, 383, NULL, '任怡可毅', '140105200701250000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '香河实验中学', 1, NULL, '三年', NULL, 414, 427, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (199, 383, NULL, '魏金影', '23012100707091400', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '霸州十中', 1, NULL, '三年', NULL, 414, 436, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (200, 383, NULL, '尹天洋', '131002200612223000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '九州中学', 1, NULL, '三年', NULL, 414, 425, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (201, 383, NULL, '殷海钧', '110117200801291000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '香河十中', 1, NULL, '三年', NULL, 414, 423, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (202, 383, NULL, '王惠玉', '13102520082032100', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '大城县臧屯二中', 1, NULL, '三年', NULL, 414, 421, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (203, 383, NULL, '张一慧', '131025200709282000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '大城县臧屯二中', 1, NULL, '三年', NULL, 414, 415, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (204, 383, NULL, '梁馨予', '230223200712012000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '黑龙江省委三星镇中学', 1, NULL, '三年', NULL, 414, 425, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');
INSERT INTO `stu_base_info` VALUES (205, 383, NULL, '张佳林', '131022200804025000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '黑龙江', NULL, '初中学历', '固安渠沟中学', 1, NULL, '三年', NULL, 414, 427, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'1');
INSERT INTO `stu_base_info` VALUES (206, 383, NULL, '王力帜', '130823200803031000', '大陆居民身份证', NULL, NULL, NULL, '群众', NULL, '河北', NULL, '初中学历', '承德市平泉市七沟中学', 1, NULL, '三年', NULL, 414, 415, NULL, '2023年秋季', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, b'0');

-- ----------------------------
-- Table structure for stu_class_change_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_class_change_info`;
CREATE TABLE `stu_class_change_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `academy_id` bigint(20) NOT NULL,
  `change_date` datetime(0) NULL DEFAULT NULL,
  `dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系部',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `grade` int(11) NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级',
  `head_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班主任',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班主任电话',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stu_employ
-- ----------------------------
DROP TABLE IF EXISTS `stu_employ`;
CREATE TABLE `stu_employ`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(11) NULL DEFAULT NULL COMMENT '学生id',
  `school_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `leave_date` datetime(0) NULL DEFAULT NULL COMMENT '离校日期',
  `leave_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '离校原因\r\n',
  `employ_org` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业单位',
  `employ_post` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业岗位',
  `probation_period` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期限',
  `probation_income` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期薪酬',
  `formal_income` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转正薪酬',
  `post_leader` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位负责人',
  `post_leader_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位负责人电话',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `is_deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_employ
-- ----------------------------
INSERT INTO `stu_employ` VALUES (14, NULL, 'C131002200710073028', '2023-03-04 00:00:00', '上岗', '英兰轩', '前厅领位', NULL, '5000', '5500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (15, NULL, 'C131023200703041021', '2023-03-05 00:00:00', '上岗', '北京通州辅警', '辅警', NULL, '4000', '4000', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (16, NULL, 'C13100220080213182X', '2023-03-06 00:00:00', '上岗', '国家电网', '会服', NULL, '3200', '4500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (17, NULL, 'C130981200711145648', '2023-03-07 00:00:00', '上岗', '国家电网', '会服', NULL, '3200', '4500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (18, NULL, 'C131022200712215056', '2023-03-08 00:00:00', '上岗', '国家电网', '会服', NULL, '3200', '4500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (19, NULL, 'C411328200707051335', '2023-03-09 00:00:00', '上岗', '国家电网', '会服', NULL, '3200', '4500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (20, NULL, 'C131022200704241617', '2023-03-10 00:00:00', '上岗', '北京通州辅警', '辅警', NULL, '4000', '4000', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (21, NULL, 'C131002200609132417', '2023-03-11 00:00:00', '上岗', '英大国际大厦', '会服', NULL, '3500', '4000', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (22, NULL, 'C131022200805010615', '2023-03-12 00:00:00', '上岗', '青岛餐吧', '餐吧乘务员', NULL, '1500+绩效提成', '2000+绩效提成', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (23, NULL, 'C13102220080603503X', '2023-03-13 00:00:00', '上岗', '北京移动党校', '会服', NULL, '3000', '3500', '张欢', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (24, NULL, 'C230230200709122119', '2023-03-14 00:00:00', '上岗', '汇银佳科技股份有限公司', '点钞员', NULL, '3000', '3500', '张欢', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (25, NULL, 'C131002200802281414', '2023-03-15 00:00:00', '上岗', '国家能源', '会服', NULL, '3000', '3500', '张欢', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (26, NULL, 'C130731200804043435', '2023-03-16 00:00:00', '上岗', '国家能源', '会服', NULL, '3000', '3500', '张欢', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (27, NULL, 'C131024200806031314', '2023-03-17 00:00:00', '上岗', '青岛餐吧', '餐吧乘务员', NULL, '1500+绩效提成', '2000+绩效提成', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (28, NULL, 'C131023200712210817', '2023-03-18 00:00:00', '上岗', '青岛餐吧', '餐吧乘务员', NULL, '1500+绩效提成', '2000+绩效提成', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (29, NULL, 'C131024200806050726', '2023-03-19 00:00:00', '上岗', '北京通州辅警', '辅警', NULL, '4000', '4000', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (30, NULL, 'C130828200904133734', '2023-03-20 00:00:00', '上岗', '青岛餐吧', '餐吧乘务员', NULL, '1500+绩效提成', '2000+绩效提成', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (31, NULL, 'C131024200805134418', '2023-03-21 00:00:00', '上岗', '北京地铁', '安检', NULL, '3000', '35000', '张欢', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (32, NULL, 'C131002200704264813', '2023-03-22 00:00:00', '上岗', '英兰轩', '前厅领位', NULL, '5000', '5500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (33, NULL, 'C131023200608092814', '2023-03-23 00:00:00', '上岗', '青岛餐吧', '餐吧乘务员', NULL, '1500+绩效提成', '2000+绩效提成', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (34, NULL, 'C131081200807192117', '2023-03-24 00:00:00', '上岗', '北京通州辅警', '辅警', NULL, '4000', '4000', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (35, NULL, 'C131002200807174810', '2023-03-25 00:00:00', '上岗', '青岛餐吧', '餐吧乘务员', NULL, '1500+绩效提成', '2000+绩效提成', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (36, NULL, 'C131022200904104211', '2023-03-26 00:00:00', '上岗', '英兰轩', '前厅领位', NULL, '5000', '5500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (37, NULL, 'C131022200803145014', '2023-03-27 00:00:00', '上岗', '英大国际大厦', '会服', NULL, '3500', '4000', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (38, NULL, 'C131024200803180023', '2023-03-28 00:00:00', '上岗', '北京理工大学', '会服', NULL, '4000', '4500', '张海洋', NULL, '2023-08-01 16:17:30', '2023-08-01 16:17:30', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (39, NULL, 'C131022200710235424', '2023-03-29 00:00:00', '上岗', '英兰轩', '前厅领位', NULL, '5000', '5500', '张海洋', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (40, NULL, 'C131022200803035448', '2023-03-30 00:00:00', '上岗', '北京地铁', '安检', NULL, '3000', '35000', '张欢', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (41, NULL, 'C131002200711022046', '2023-03-31 00:00:00', '上岗', '北京市委党校', '会服', NULL, '3000', '3500', '张欢', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (42, NULL, 'C131022200711223310', '2023-04-01 00:00:00', '上岗', '北京通州辅警', '辅警', NULL, '4000', '4000', '张海洋', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (43, NULL, 'C131022200804131618', '2023-04-02 00:00:00', '上岗', '英兰轩', '前厅领位', NULL, '5000', '5500', '张海洋', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (44, NULL, 'C131002200806191512', '2023-04-03 00:00:00', '上岗', '英兰轩', '前厅领位', NULL, '5000', '5500', '张海洋', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (45, NULL, 'C131002200710012823', '2023-04-04 00:00:00', '上岗', '英兰轩', '前厅领位', NULL, '5000', '5500', '张海洋', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (46, NULL, 'C131022200805105040', '2023-04-05 00:00:00', '上岗', '北京电视台', '会服', NULL, '3000', '4000', '张欢', NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (47, NULL, 'C131022200710135028', '2023-04-06 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (48, NULL, 'C131002200612312419', '2023-04-07 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (49, NULL, 'C131002200708303015', '2023-04-08 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (50, NULL, 'C13102420080516721X', '2023-04-09 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (51, NULL, 'C131002200712013221', '2023-04-10 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (52, NULL, 'C41172720080522758X', '2023-04-11 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (53, NULL, 'C13102320080430081X', '2023-04-12 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (54, NULL, 'C13102320080806085X', '2023-04-13 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (55, NULL, 'C131003200803172814', '2023-04-14 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (56, NULL, 'C131002200803174813', '2023-04-15 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (57, NULL, 'C131002200807242019', '2023-04-16 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (58, NULL, 'C131022200806292618', '2023-04-17 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (59, NULL, 'C130826200807047217', '2023-04-18 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (60, NULL, 'C131022200703156410', '2023-04-19 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:31', '2023-08-01 16:17:31', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (61, NULL, 'C131002200807112011', '2023-04-20 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:32', '2023-08-01 16:17:32', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (62, NULL, 'C131025200711293019', '2023-04-21 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:32', '2023-08-01 16:17:32', 0, 0, b'0');
INSERT INTO `stu_employ` VALUES (63, NULL, 'C131022200801064237', '2023-04-22 00:00:00', '自主就业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-01 16:17:32', '2023-08-01 16:17:32', 0, 0, b'0');

-- ----------------------------
-- Table structure for stu_employ_visit
-- ----------------------------
DROP TABLE IF EXISTS `stu_employ_visit`;
CREATE TABLE `stu_employ_visit`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(11) NULL DEFAULT NULL COMMENT '学生id',
  `visit_date` datetime(0) NULL DEFAULT NULL COMMENT '回访日期',
  `depart_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '离职原因',
  `employ_org` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业单位',
  `employ_post` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就业岗位',
  `probation_period` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期限',
  `probation_income` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试用期薪酬',
  `formal_income` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转正薪酬',
  `work_situation` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生就业工作情况',
  `second_employ_date` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二次就业分配时间',
  `is_second_employ` tinyint(2) NULL DEFAULT NULL COMMENT '是否需要二次就业 1：是 0：不是',
  `is_post` tinyint(2) NULL DEFAULT NULL COMMENT '是否在岗 1：是 0：不是',
  `is_satisfied` tinyint(2) NULL DEFAULT NULL COMMENT '是否对岗位满意 1：满意 0 ：不满意',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `is_deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `post_leader` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位负责人',
  `post_leader_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位负责人电话',
  `school_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_employ_visit
-- ----------------------------
INSERT INTO `stu_employ_visit` VALUES (14, NULL, '2023-08-02 00:00:00', '', '阿里', NULL, '', NULL, '', '', '0', 0, 0, 0, NULL, NULL, NULL, NULL, b'0', '', NULL, 'C13102320070304102X');

-- ----------------------------
-- Table structure for stu_practice
-- ----------------------------
DROP TABLE IF EXISTS `stu_practice`;
CREATE TABLE `stu_practice`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(11) NULL DEFAULT NULL COMMENT '学生id',
  `school_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `leave_date` datetime(0) NULL DEFAULT NULL COMMENT '实习离校日期',
  `expect_end_date` datetime(0) NULL DEFAULT NULL COMMENT '预计实习结束日期',
  `real_end_date` datetime(0) NULL DEFAULT NULL COMMENT '实际实习结束日期',
  `practice_org` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习单位',
  `practice_post` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习岗位',
  `practice_income` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习报酬',
  `practice_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实习鉴定结果',
  `post_leader` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '带队教师',
  `post_leader_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '带队教师电话',
  `is_satisfied` tinyint(2) NULL DEFAULT NULL COMMENT '是否对岗位满意 1：满意 0 ：不满意',
  `practice_type` tinyint(2) NULL DEFAULT NULL COMMENT '实习类别 1：认识实习 2：岗位实习',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `is_deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_practice
-- ----------------------------
INSERT INTO `stu_practice` VALUES (7, NULL, 'C131002200710073028', '2023-07-04 00:00:00', NULL, NULL, 'aas', '', '', '', '', '', 0, 0, '2023-07-31 15:39:41', '2023-07-31 15:39:41', NULL, NULL, b'0');

-- ----------------------------
-- Table structure for stu_status_change_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_status_change_info`;
CREATE TABLE `stu_status_change_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) NOT NULL,
  `level_date` datetime(0) NULL DEFAULT NULL COMMENT '离校日期',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束日期',
  `old_school_roll_status` tinyint(2) NULL DEFAULT NULL COMMENT '变更前的学籍状态',
  `new_school_roll_status` tinyint(2) NULL DEFAULT NULL COMMENT '变更后的学籍状态',
  `old_current_status` tinyint(2) NULL DEFAULT NULL COMMENT '变更前的当前状态',
  `new_current_status` tinyint(2) NULL DEFAULT NULL COMMENT '变更后的当前状态',
  `change_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `is_deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_status_change_info
-- ----------------------------
INSERT INTO `stu_status_change_info` VALUES (9, 117, NULL, NULL, NULL, 0, NULL, 0, NULL, '2023-08-01 09:44:01', '2023-08-01 09:44:01', 1, 1, b'0');

-- ----------------------------
-- Table structure for stu_temp
-- ----------------------------
DROP TABLE IF EXISTS `stu_temp`;
CREATE TABLE `stu_temp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `id_number` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '学生身份证',
  `academy_id` bigint(20) NULL DEFAULT NULL COMMENT '报考院校id',
  `major_id` bigint(20) NULL DEFAULT NULL COMMENT '期望进入的专业',
  `grade_id` bigint(20) NULL DEFAULT NULL COMMENT '进入的年级',
  `class_type` int(11) NULL DEFAULT NULL COMMENT '班型（1就业、0升学）',
  `schooling_length` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学制（2\\3）',
  `status` int(11) NULL DEFAULT NULL COMMENT '考生状态：0未参加面试，1通过面试，2未通过面试',
  `id_number_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证类型',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `nation` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `native_place` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `political_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `edu_before` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入学学历',
  `skill_before` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入学前技能水平',
  `school_before` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `residence_type` tinyint(2) NULL DEFAULT NULL COMMENT '户口性质 0非农户口 1农业户口',
  `email` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `admission_season` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生季',
  `enroll_teacher` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生老师',
  `enroll_teacher_dept` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生老师部门',
  `enroll_teacher_phone` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招生老师电话',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '招生临时信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stu_temp
-- ----------------------------
INSERT INTO `stu_temp` VALUES (34, '刘奥宇', '131023200808262000', 383, 415, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '', '群众', NULL, NULL, '初中学历', '廊坊市第五中学', 1, NULL, '2023年秋季', '王兴华', '招就培处', '', '2023-07-31 14:59:32', '2023-07-31 16:06:29', 3, 9, 1);
INSERT INTO `stu_temp` VALUES (35, '周新奥', '131002200802142000', 383, 433, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '2023年秋季', '周秀清', '招就培处', NULL, '2023-07-31 14:59:32', '2023-07-31 15:13:48', 3, 3, 0);
INSERT INTO `stu_temp` VALUES (36, '李俊衫', '131002200711071000', 383, 433, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '2023年秋季', '周秀清', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (37, '尹伊', '13102320070019122X', 383, 435, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '永清一中', 1, NULL, '2023年秋季', '周秀清', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (38, '叶静娴', '13100220080228202X', 383, 436, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第五中学', 1, NULL, '2023年秋季', '王兴华', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (39, '尹贵博', '131002200709112000', 383, 417, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊三中', 1, NULL, '2023年秋季', '段运仁', '总务处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (40, '王雪晴', '131002200603112000', 383, 421, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第五中学', 1, NULL, '2023年秋季', '王兴华', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (41, '霍璟旭', '131023200711251000', 383, 423, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '永清里澜城中学', 1, NULL, '2023年秋季', '苏洁', '校领导', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (42, '李文超', '15232620061003789X', 383, 438, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '通辽市东明中学', 1, NULL, '2023年秋季', '王兴华', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (43, '安家庆', '131002200710160000', 383, 417, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '三职中', 1, NULL, '2023年秋季', '苏洁', '校领导', NULL, '2023-07-31 14:59:32', '2023-08-01 10:26:32', 3, 1, 0);
INSERT INTO `stu_temp` VALUES (44, '李红硕', '13102320080131081X', 383, 437, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '永清县第三中学', 1, NULL, '2023年秋季', '徐志锋', '教务处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 1);
INSERT INTO `stu_temp` VALUES (45, '常赵嘉', '131023200801200000', 383, 437, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '永清县第三中学', 1, NULL, '2023年秋季', '徐志锋', '教务处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (46, '杨兴昀', '131022200808264000', 383, 436, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '固安六中', 1, NULL, '2023年秋季', '邵秋兰', '非本校员工', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (47, '仇雪迎', '131022200807274000', 383, 436, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '固安六中', 1, NULL, '2023年秋季', '邵秋兰', '非本校员工', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (48, '米傲轩', '131002200711212000', 383, 427, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '北旺中学', 1, NULL, '2023年秋季', '杨荣朝', '学生处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (49, '张猛', '131022200806104000', 383, 415, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '固安六中', 1, NULL, '2023年秋季', '邵秋兰', '集团', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (50, '张嘉诚', '131002200709102000', 383, 433, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '2023年秋季', '周秀清', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (51, '李梦楠', '131023200607011000', 383, 430, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第三中学', 1, NULL, '2023年秋季', '郑媛', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (52, '周宏阳', '131022200805305000', 383, 423, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '固安彭村', 1, NULL, '2023年秋季', '邵秋兰', '非本校员工', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (53, '蔡雪阳', '130684200704105000', 383, 427, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '高碑店职教中心', 1, NULL, '2023年秋季', '王辛培', '廊坊校区', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (54, '杨奇睿', '411729200806271000', 383, 430, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '燕郊十一中', 1, NULL, '2023年秋季', '郑媛', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (55, '张博奥', '131022200801235000', 383, 415, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '东湾中学', 1, NULL, '2023年秋季', '邵秋兰', '非本校员工', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (56, '梁语恒', '13100220070126325x', 383, 423, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '石家庄电子科技学校', 1, NULL, '2023年秋季', '董伟', '教务处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (57, '韩志慧', '410422200803250000', 383, 436, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '河南省南阳市拐河镇一中', 1, NULL, '2023年秋季', '吴小兵', '学生处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (58, '丁雅航', '131002200610202000', 383, 423, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河南', '群众', NULL, NULL, '初中学历', '万庄中学', 1, NULL, '2023年秋季', '董伟', '教务处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (59, '邢砚喆', '131002200712024000', 383, 421, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '新世纪中学', 1, NULL, '2023年秋季', '徐杰', '学生处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (60, '葛嘉阔', '130828200702267000', 383, 427, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第十一中学', 1, NULL, '2023年秋季', '李奕霖', '学生处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (61, '赵子健', '131002200708091000', 383, 427, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第十三中学', 1, NULL, '2023年秋季', '周秀清', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (62, '许雨佳', '131002200803032000', 383, 436, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第五中学', 1, NULL, '2023年秋季', '王兴华', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (63, '许鑫睿', '131025200709122000', 383, 439, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '大城臧屯三中', 1, NULL, '2023年秋季', '段运仁', '廊坊校区', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (64, '刘馨雨', '131022200710264000', 383, 436, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '固安六中', 1, NULL, '2023年秋季', '邵秋兰', '非本校员工', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (65, '任怡可毅', '140105200701250000', 383, 427, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '香河实验中学', 1, NULL, '2023年秋季', '苏磊阳', '非本校员工', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (66, '魏金影', '23012100707091400', 383, 436, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '霸州十中', 1, NULL, '2023年秋季', '郑媛', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (67, '尹天洋', '131002200612223000', 383, 425, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '九州中学', 1, NULL, '2023年秋季', '姚俊岭', '校领导', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (68, '殷海钧', '110117200801291000', 383, 423, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '香河十中', 1, NULL, '2023年秋季', '柳苗苗', '教务处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (69, '王惠玉', '13102520082032100', 383, 421, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '大城县臧屯二中', 1, NULL, '2023年秋季', '王兴华', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (70, '张一慧', '131025200709282000', 383, 415, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '大城县臧屯二中', 1, NULL, '2023年秋季', '王兴华', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (71, '梁馨予', '230223200712012000', 383, 425, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '黑龙江省委三星镇中学', 1, NULL, '2023年秋季', '范桂梅', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (72, '张佳林', '131022200804025000', 383, 427, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '黑龙江', '群众', NULL, NULL, '初中学历', '固安渠沟中学', 1, NULL, '2023年秋季', '邵秋兰', '非本校员工', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (73, '王力帜', '130823200803031000', 383, 415, 414, 0, '三年', 1, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '承德市平泉市七沟中学', 1, NULL, '2023年秋季', '周秀清', '招就培处', NULL, '2023-07-31 14:59:32', '2023-08-01 10:28:36', 3, 6, 0);
INSERT INTO `stu_temp` VALUES (74, '王晓云', '131127200803021000', 383, 423, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '景县连镇中学', 1, NULL, '2023年秋季', '王辛培', '学生处', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (75, '王绮', '131003200808233000', 383, 436, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '尖塔中学', 1, NULL, '2023年秋季', '姚俊岭', '校领导', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (76, '辛建磊', '130927200806213000', 383, 415, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '沧州南安', 1, NULL, '2023年秋季', '苏洁', '校领导', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (77, '聂昊天', '41148120080723091X', 383, 427, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '尖塔中学', 1, NULL, '2023年秋季', '姚俊岭', '校领导', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (78, '刘徐昇', '13100220080801283X', 383, 415, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '廊坊市第十一中学', 1, NULL, '2023年秋季', '段群学', '非本校员工', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (79, '田宇晨', '131023200805222000', 383, 436, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '永清二中', 1, NULL, '2023年秋季', '范桂梅', '招就培处', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (80, '丁宇成', '131002200806151000', 383, 427, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '管道局中学', 1, NULL, '2023年秋季', '郑媛', '招就培处', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (81, '杨京原', '130324200712210000', 383, 415, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, '初中学历', '秦皇岛卢龙镇中学', 1, NULL, '2023年秋季', '苏磊阳', '非本校员工', NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (82, '潘羽瞳', '340827200804251000', 383, 421, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);
INSERT INTO `stu_temp` VALUES (83, '杨镇豪', '522729200706260000', 383, 423, 414, 0, '三年', 0, '大陆居民身份证', NULL, NULL, NULL, '河北', '群众', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2023-07-31 14:59:32', NULL, 3, NULL, 0);

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统验证码' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('0087ddb1-1c8e-4957-8cc9-28a586c94334', 'a4d5d', '2023-08-01 15:41:28');
INSERT INTO `sys_captcha` VALUES ('00a484dd-ffa1-494d-80ff-99c47164040b', 'x4b8n', '2023-07-17 10:25:44');
INSERT INTO `sys_captcha` VALUES ('00db75a7-dd7e-4ec8-8349-8257af264a7d', 'm2ddn', '2023-04-17 14:04:30');
INSERT INTO `sys_captcha` VALUES ('016c2c26-9d5c-4408-8f9d-af912f864129', '3x8n4', '2023-07-17 10:07:33');
INSERT INTO `sys_captcha` VALUES ('017c4d37-5d77-4f72-81ac-b9fd818b1b6b', 'g3byb', '2023-07-14 22:06:39');
INSERT INTO `sys_captcha` VALUES ('018fa08c-eb98-4dce-8d6c-445006b94d1c', '3p5ya', '2023-07-17 10:52:36');
INSERT INTO `sys_captcha` VALUES ('01aadd48-5c36-42c3-8271-22d6e0fd8a7d', 'n447n', '2023-03-31 09:44:03');
INSERT INTO `sys_captcha` VALUES ('01abf97b-2524-49a6-8ce8-b92c3a84fdd5', 'fyay6', '2023-07-26 01:46:44');
INSERT INTO `sys_captcha` VALUES ('027c258f-8d1f-416c-8665-1cb26c37a28a', '85ncn', '2023-03-24 12:57:00');
INSERT INTO `sys_captcha` VALUES ('02ac5200-8000-4f74-8c1b-7c5ca2c51f71', 'pmyn3', '2023-07-17 19:42:09');
INSERT INTO `sys_captcha` VALUES ('02c79f57-8120-4b53-8a28-267f085ae0eb', 'dafnd', '2023-03-04 10:44:44');
INSERT INTO `sys_captcha` VALUES ('033bffd9-6139-45d9-8a35-03a662a52ce3', 'mnwb3', '2023-03-04 16:04:43');
INSERT INTO `sys_captcha` VALUES ('038a6b57-63c1-4b7c-8df4-bffa4a85bbb3', 'mcc77', '2023-07-25 14:08:45');
INSERT INTO `sys_captcha` VALUES ('03be8309-e2f9-47cf-8a11-58738607cae0', 'nfafn', '2023-07-26 19:16:44');
INSERT INTO `sys_captcha` VALUES ('03c5d4ee-78e6-4cb2-87a8-09c2e7e4c1bb', '22868', '2023-07-27 14:42:39');
INSERT INTO `sys_captcha` VALUES ('03cc2bd1-c65a-4d78-8b26-e9b498c0e19b', 'n7g7a', '2023-07-24 15:49:20');
INSERT INTO `sys_captcha` VALUES ('0400232c-60d3-467d-8c31-6fc41b1e95ac', 'p4gnw', '2023-07-24 15:06:15');
INSERT INTO `sys_captcha` VALUES ('04065d90-0dd0-4f5b-863f-23ce5e2f291a', 'ccxnx', '2023-07-25 23:25:43');
INSERT INTO `sys_captcha` VALUES ('04d72a6b-b1b6-4b74-86d3-b49c59f3ad3a', '4mwb4', '2023-07-27 09:33:26');
INSERT INTO `sys_captcha` VALUES ('04f047d2-b756-4a72-88f6-186f5b843988', 'pwb8c', '2023-03-04 16:16:38');
INSERT INTO `sys_captcha` VALUES ('0562d740-706e-45ad-8871-f88cd15f32a7', 'a8d6x', '2023-07-25 10:31:09');
INSERT INTO `sys_captcha` VALUES ('056c5ff5-eb14-4e4b-8b72-4e7ee670c3a9', '348d4', '2023-07-21 09:52:35');
INSERT INTO `sys_captcha` VALUES ('0630aafe-39b1-4dcb-8baa-d5d92d3037ac', 'ayax2', '2023-07-15 10:22:06');
INSERT INTO `sys_captcha` VALUES ('06d74a34-ff54-4999-8437-1e9c62e14955', 'pencc', '2023-03-24 15:35:33');
INSERT INTO `sys_captcha` VALUES ('0735bfa5-cd27-4142-8851-8b6ae2d60a05', 'p42gp', '2023-07-25 14:49:26');
INSERT INTO `sys_captcha` VALUES ('0737fb20-c631-4cdc-8f64-c8d869c550fd', 'gffxn', '2023-07-17 11:42:14');
INSERT INTO `sys_captcha` VALUES ('074b7336-7123-48e4-8a51-c0f15ca0916d', 'fyenb', '2023-07-27 08:58:56');
INSERT INTO `sys_captcha` VALUES ('07624bb0-5217-4f54-805d-970095a6c70e', 'mg5nn', '2023-07-21 11:28:08');
INSERT INTO `sys_captcha` VALUES ('077db89f-70a9-45da-8b75-0e9acd68fa3d', 'dywg3', '2023-07-27 19:52:29');
INSERT INTO `sys_captcha` VALUES ('07843ea8-520f-45af-8012-535632fc7232', 'andf8', '2023-07-29 09:58:02');
INSERT INTO `sys_captcha` VALUES ('079ebbf8-a416-47e3-8336-4986185340c8', 'ypcng', '2023-07-27 14:40:15');
INSERT INTO `sys_captcha` VALUES ('07ab14d0-485e-4a82-8256-555c03b4c88e', 'n6gxy', '2023-07-21 09:10:23');
INSERT INTO `sys_captcha` VALUES ('07b9b045-8ceb-4805-896b-3a73ca3e057d', '8646n', '2023-07-27 09:59:11');
INSERT INTO `sys_captcha` VALUES ('07e920e5-a843-442d-8a53-202ced1d931c', 'm2p36', '2023-07-27 09:22:12');
INSERT INTO `sys_captcha` VALUES ('07e9a573-1748-4534-8864-104a7cd9442c', 'xw4bn', '2023-03-29 15:00:59');
INSERT INTO `sys_captcha` VALUES ('0838ec44-9eb8-4a94-8ff8-fc7074936896', 'wpwda', '2023-08-01 08:47:17');
INSERT INTO `sys_captcha` VALUES ('0876acd5-9feb-4b43-841a-d5c31f49d87d', 'ewg74', '2023-07-26 19:32:55');
INSERT INTO `sys_captcha` VALUES ('08859730-0d8a-49ad-8bc3-071c155fca0d', 'yg65d', '2023-08-02 10:53:01');
INSERT INTO `sys_captcha` VALUES ('0887ffe5-c898-4545-8bfc-58ddc64f6037', 'y5ma7', '2023-07-31 09:15:53');
INSERT INTO `sys_captcha` VALUES ('08f9b045-e91e-46cb-80b6-9bd66953d2fa', 'cwwm3', '2023-07-25 19:47:52');
INSERT INTO `sys_captcha` VALUES ('090c8382-852c-4b76-8a19-1becfb7994c3', 'ce6wa', '2023-03-31 15:11:37');
INSERT INTO `sys_captcha` VALUES ('09c5fc2e-1abd-436f-8af5-f5b87c044ce9', 'cbacb', '2023-07-15 14:34:18');
INSERT INTO `sys_captcha` VALUES ('0a112c7d-e83d-45a4-8b56-5f1b1e6d0351', 'd2enn', '2023-08-01 10:31:53');
INSERT INTO `sys_captcha` VALUES ('0a3d27f4-4cf5-439f-8c86-bcdea25537a8', 'nbbnn', '2023-07-31 13:33:58');
INSERT INTO `sys_captcha` VALUES ('0aaf4b07-024a-4657-8d0f-1a63015fb16b', 'ddn64', '2023-07-14 20:24:17');
INSERT INTO `sys_captcha` VALUES ('0abff377-4eac-4339-831a-96f6abe2d6b3', '2f27p', '2023-03-16 04:05:06');
INSERT INTO `sys_captcha` VALUES ('0adb5441-b46d-4bf3-8b98-9b45aef5bfc9', 'pnn2n', '2023-04-06 14:42:29');
INSERT INTO `sys_captcha` VALUES ('0afbe7f7-e163-4024-8731-494bfca455f9', 'xe5wx', '2023-08-01 17:18:18');
INSERT INTO `sys_captcha` VALUES ('0b0d01ad-47f0-450b-83c6-325f1eb639ca', '4837x', '2023-07-14 19:51:00');
INSERT INTO `sys_captcha` VALUES ('0b68aeb9-05e0-46a1-811b-9333d0f9a83f', '3nd3e', '2023-08-01 14:34:18');
INSERT INTO `sys_captcha` VALUES ('0b7787e3-8616-44ae-8c2c-4f5addca9d8a', 'y6e3g', '2023-07-18 11:24:59');
INSERT INTO `sys_captcha` VALUES ('0b81589b-7ede-456d-8e40-3c7d4b878cfc', 'accb4', '2023-07-25 08:46:01');
INSERT INTO `sys_captcha` VALUES ('0b8843da-f7df-423a-85ef-d1ada4030edc', 'yny3e', '2023-08-02 10:50:45');
INSERT INTO `sys_captcha` VALUES ('0bb78642-6e2c-4756-801c-00e44e330bde', 'ngx8w', '2023-07-24 10:57:41');
INSERT INTO `sys_captcha` VALUES ('0c6a119d-360a-4176-8664-e4e55af5d67a', 'xgpmw', '2023-07-27 14:49:48');
INSERT INTO `sys_captcha` VALUES ('0cb955a5-cdbc-49ba-8a1d-655f3ab06a77', '76ncp', '2023-07-24 14:51:12');
INSERT INTO `sys_captcha` VALUES ('0cbc7c07-b48d-4a9c-8893-4cd38999d754', 'dcwnw', '2023-02-17 09:47:11');
INSERT INTO `sys_captcha` VALUES ('0d1cac0c-e45d-4f1e-8560-b9487f9c8155', '65xwm', '2023-07-18 20:19:11');
INSERT INTO `sys_captcha` VALUES ('0ddca86c-b300-4dbb-80c0-575a2dc6500a', 'ed22y', '2023-07-21 09:47:41');
INSERT INTO `sys_captcha` VALUES ('0e63c23a-81b5-4f25-8d00-3e8137fa5b32', '6e63d', '2023-07-15 09:19:16');
INSERT INTO `sys_captcha` VALUES ('0ecf7432-e91d-44ea-8aa9-e4fe37acd08e', '7yf57', '2023-07-14 19:55:06');
INSERT INTO `sys_captcha` VALUES ('0f749da3-486e-46e7-8e4b-cd497cfc22b4', 'cc7fd', '2023-07-18 11:24:14');
INSERT INTO `sys_captcha` VALUES ('101f9385-0bd4-4c10-8d8e-4e7f3ce70cd2', 'bn56b', '2023-07-26 09:09:50');
INSERT INTO `sys_captcha` VALUES ('108a9cd0-d8b7-4ca0-8a63-f0cb769538f7', 'x2wx8', '2023-07-29 09:03:07');
INSERT INTO `sys_captcha` VALUES ('10a4c1fb-b30e-44c2-8ed4-bd5e855ae2ae', 'gagfx', '2023-03-23 15:40:30');
INSERT INTO `sys_captcha` VALUES ('10e02451-c30d-448a-83f2-55069516818d', 'cnwab', '2022-11-28 19:44:33');
INSERT INTO `sys_captcha` VALUES ('11039459-3602-4dc6-8e92-9ba4b27d347d', 'agcey', '2023-08-01 15:43:32');
INSERT INTO `sys_captcha` VALUES ('117267ce-4821-4478-85f8-107502ded4d6', 'e67mb', '2023-08-01 20:41:41');
INSERT INTO `sys_captcha` VALUES ('117d5f7f-853f-48e3-83f0-2382bc7d73e8', 'ppa6f', '2022-12-01 16:06:26');
INSERT INTO `sys_captcha` VALUES ('11dae408-5497-4153-847f-88b7dfc46e92', '8ca7e', '2023-07-18 21:30:44');
INSERT INTO `sys_captcha` VALUES ('1266ee89-84e1-4ff7-8367-f15d4d08910f', 'n4553', '2023-07-26 20:08:03');
INSERT INTO `sys_captcha` VALUES ('12a7552a-f40c-46df-84c7-41e1647542f3', 'ca28x', '2023-07-14 19:52:04');
INSERT INTO `sys_captcha` VALUES ('132a4409-7f0f-4637-840f-4ac4881cb787', 'bef4e', '2023-03-13 16:19:58');
INSERT INTO `sys_captcha` VALUES ('1354a7ba-90ca-4ae5-81eb-e27a2e7631ea', 'dpm8e', '2023-07-17 20:25:51');
INSERT INTO `sys_captcha` VALUES ('1384d5b4-7765-4715-8c1f-8824ed448175', '4c8gx', '2023-07-14 20:23:59');
INSERT INTO `sys_captcha` VALUES ('13e5f7b8-3867-4294-8af9-b80efcb3ead8', 'xe88w', '2023-07-27 16:37:56');
INSERT INTO `sys_captcha` VALUES ('13ee6762-33a7-4c9f-8a99-d8cd24dc8505', 'ag852', '2023-07-17 09:59:47');
INSERT INTO `sys_captcha` VALUES ('140ea24c-a055-4ceb-8b5e-2a1dcd7c9b80', '46gnp', '2023-03-24 12:58:04');
INSERT INTO `sys_captcha` VALUES ('142b4268-2085-47fc-8905-b6f7e579a46c', 'f5g8m', '2023-07-18 20:26:20');
INSERT INTO `sys_captcha` VALUES ('1493d1b2-0387-4feb-8c9a-3b44255a6c7b', 'ea7af', '2023-07-14 16:31:29');
INSERT INTO `sys_captcha` VALUES ('14a4e2e0-76ef-4dba-828e-05666ef7e751', '6nf5w', '2023-07-14 20:42:37');
INSERT INTO `sys_captcha` VALUES ('15278f97-faea-46d7-8378-6656f2cbafae', 'fby3y', '2023-08-01 10:30:11');
INSERT INTO `sys_captcha` VALUES ('157bd978-1912-443a-8a40-7f89a6a29af6', '548m8', '2023-07-14 18:40:03');
INSERT INTO `sys_captcha` VALUES ('158c4868-0c89-4018-81f8-21f65c68dafa', '2gg3b', '2023-03-11 11:40:51');
INSERT INTO `sys_captcha` VALUES ('15bf8941-d90f-4a35-892a-30692d96aa2f', 'dp27a', '2023-03-07 08:40:15');
INSERT INTO `sys_captcha` VALUES ('15f80573-648a-4927-82f2-10b905983ab2', 'gdx3b', '2023-07-28 09:14:52');
INSERT INTO `sys_captcha` VALUES ('165b41bc-1718-47d1-8980-5aebd95658cb', 'bwd5n', '2023-07-25 13:59:53');
INSERT INTO `sys_captcha` VALUES ('16616cd9-014d-43c7-831e-13dafb5108ad', 'd7cn6', '2023-07-25 16:52:32');
INSERT INTO `sys_captcha` VALUES ('166be9b5-75d4-447c-83dd-97a4bdf7be9a', 'bmb53', '2023-02-17 09:16:24');
INSERT INTO `sys_captcha` VALUES ('169be6ad-8223-471a-81ff-a925d0fd0c2a', 'yd484', '2023-07-14 16:23:21');
INSERT INTO `sys_captcha` VALUES ('16de7f02-af92-4efe-8f1c-4d7b71a2dffd', '728w4', '2023-07-21 14:50:46');
INSERT INTO `sys_captcha` VALUES ('170c38c5-1f9a-463a-8225-4c278ebfa83f', '5bydw', '2023-07-17 13:48:39');
INSERT INTO `sys_captcha` VALUES ('17427ee6-6f7d-4410-8093-0089582f44af', 'n33xd', '2022-11-28 20:39:46');
INSERT INTO `sys_captcha` VALUES ('17b0f8c2-c6b3-4399-8e47-91b3e5e0e96e', '34y44', '2023-07-20 15:28:24');
INSERT INTO `sys_captcha` VALUES ('17ca3c7c-97bc-449c-871c-e3b937fabd80', 'ew6wa', '2023-07-17 19:32:28');
INSERT INTO `sys_captcha` VALUES ('17cc1f74-349f-4911-868f-5d28db29aef9', 'ad846', '2023-03-07 19:31:38');
INSERT INTO `sys_captcha` VALUES ('180e78a4-6b58-4d6d-8f7b-f0b2ba141035', 'gxpcw', '2023-07-24 14:57:50');
INSERT INTO `sys_captcha` VALUES ('181e360d-3b22-47a4-8d00-135f026286d7', 'dcmad', '2023-03-31 15:12:08');
INSERT INTO `sys_captcha` VALUES ('18f68489-eb58-4924-8859-50201dc2bc49', '44p2e', '2023-07-20 15:59:59');
INSERT INTO `sys_captcha` VALUES ('19d5bcc7-bb56-4d27-806a-d37f49b18d85', 'e24ef', '2022-11-28 19:55:18');
INSERT INTO `sys_captcha` VALUES ('1a04dade-77bd-4fbd-8f0a-cffe2ec70a1b', 'c72p3', '2023-07-15 00:59:44');
INSERT INTO `sys_captcha` VALUES ('1a2bdf14-4b5d-44ea-8e4e-6457c5bae290', '6gnp3', '2023-07-27 10:02:02');
INSERT INTO `sys_captcha` VALUES ('1a607f2e-f524-4b81-8463-f9955bca824c', '7ymyn', '2023-03-30 16:21:04');
INSERT INTO `sys_captcha` VALUES ('1be2ec3f-a3a2-4712-8265-4e97745ced6d', '4n5nm', '2023-08-02 11:23:12');
INSERT INTO `sys_captcha` VALUES ('1c07f1ff-2f6e-4f31-86c7-b0e53e63315f', 'b2ycn', '2023-07-24 20:01:31');
INSERT INTO `sys_captcha` VALUES ('1cd1a461-2a3b-4102-8770-bfd97d4cde82', '336pa', '2023-07-25 09:32:22');
INSERT INTO `sys_captcha` VALUES ('1ce891fc-02a4-41e0-8c70-5a682b7d4edb', 'me7nm', '2023-04-04 09:33:49');
INSERT INTO `sys_captcha` VALUES ('1d2403af-ff29-463f-8a77-d425684e3c5c', '7dncn', '2023-08-01 15:35:10');
INSERT INTO `sys_captcha` VALUES ('1dfbf70a-d754-4c26-8926-3d85eadf18af', 'b6e27', '2023-03-24 12:52:14');
INSERT INTO `sys_captcha` VALUES ('1e25518f-051b-41f7-8a5e-f9ee7904109b', '8ndx7', '2023-03-31 16:38:32');
INSERT INTO `sys_captcha` VALUES ('1ec1bf95-d6f1-402e-85d0-c52430547d02', 'nm2ya', '2023-07-24 15:05:34');
INSERT INTO `sys_captcha` VALUES ('1f13ba3b-467b-4614-8490-137c4ff87410', 'fcbda', '2023-07-24 21:38:50');
INSERT INTO `sys_captcha` VALUES ('1f802b73-a3e4-49e6-87da-6a10d6f91c98', 'g8npn', '2023-08-01 21:26:20');
INSERT INTO `sys_captcha` VALUES ('208e598d-e5c0-410a-8af0-2b8f623c2686', 'p6d2e', '2023-07-19 09:53:21');
INSERT INTO `sys_captcha` VALUES ('20f6137a-0f28-4add-8bc9-c19a1ccfe699', '5caab', '2023-07-14 19:54:31');
INSERT INTO `sys_captcha` VALUES ('219f158e-92e6-4e46-88cb-6c4e36274bfb', 'cx5ey', '2023-07-29 14:17:26');
INSERT INTO `sys_captcha` VALUES ('21edcef4-1bc2-4f0c-8f46-aa413162bb9a', '64wed', '2023-07-25 08:50:31');
INSERT INTO `sys_captcha` VALUES ('220e29ed-295d-4076-846c-1cae88192202', 'xwxbb', '2023-03-07 16:08:47');
INSERT INTO `sys_captcha` VALUES ('22c90617-c224-4675-8421-f6550023c877', 'pd8yc', '2023-07-17 19:42:13');
INSERT INTO `sys_captcha` VALUES ('22d3d652-3b07-4911-8072-01553605e8e5', 'n7nb8', '2023-07-26 19:58:36');
INSERT INTO `sys_captcha` VALUES ('230946d5-e5c1-4da1-89c7-5d472373dae7', 'd6cax', '2023-03-27 09:49:29');
INSERT INTO `sys_captcha` VALUES ('2311f437-42a2-4f20-872c-b848bf018f15', 'm68b4', '2023-03-24 12:57:43');
INSERT INTO `sys_captcha` VALUES ('23717970-34e9-4887-812a-b027cb1d15ad', 'bcdmc', '2023-03-08 15:25:15');
INSERT INTO `sys_captcha` VALUES ('23d1d95b-2723-40c8-8c31-b96ee78efda5', 'nbng8', '2023-07-27 14:20:29');
INSERT INTO `sys_captcha` VALUES ('244d8240-15b9-42c1-88dd-883c3b67cdca', 'd4288', '2023-03-13 16:34:01');
INSERT INTO `sys_captcha` VALUES ('2450cd1c-0ecd-4a16-8fc1-d4e515b6836f', '4weya', '2023-08-01 10:51:43');
INSERT INTO `sys_captcha` VALUES ('2461069f-091c-4c65-8752-b8f82b06c864', '5nwcd', '2023-07-24 19:56:32');
INSERT INTO `sys_captcha` VALUES ('2473313c-05f6-4e21-8ba0-cccd3d26e3a0', 'ppn28', '2023-03-31 09:10:31');
INSERT INTO `sys_captcha` VALUES ('2494fa6c-f3ed-46ff-83e7-69ed0054ac70', '4cenn', '2023-07-14 20:21:28');
INSERT INTO `sys_captcha` VALUES ('24d5f80f-1c4e-4005-89f2-dd8960bb583f', 'nxm6m', '2023-07-27 11:41:01');
INSERT INTO `sys_captcha` VALUES ('25355c68-80f7-42b9-8eb1-1dac1e9576e6', 'a755n', '2023-07-19 10:32:32');
INSERT INTO `sys_captcha` VALUES ('253be8b9-74b2-4ff3-8366-d08c82cd8330', 'cpd78', '2023-07-27 19:52:20');
INSERT INTO `sys_captcha` VALUES ('25a0ef7e-6d39-4724-845b-dc08333dc072', 'nangn', '2023-08-01 10:31:44');
INSERT INTO `sys_captcha` VALUES ('25cbcbd4-8552-4798-8d30-f6141d756427', 'wgmxy', '2023-07-21 09:45:52');
INSERT INTO `sys_captcha` VALUES ('260963fe-16a6-4374-8517-56a8ffa3b13a', 'b378d', '2023-07-29 14:44:02');
INSERT INTO `sys_captcha` VALUES ('26305146-9369-4a67-8867-7afbc36b5731', 'xg4nn', '2023-03-30 19:21:53');
INSERT INTO `sys_captcha` VALUES ('26725289-3b12-4a3c-806b-77d64e3df816', '3w427', '2023-07-18 09:22:02');
INSERT INTO `sys_captcha` VALUES ('26df2267-b377-44af-839e-4b886c80dccd', 'debgn', '2023-07-14 19:47:19');
INSERT INTO `sys_captcha` VALUES ('271b2ad7-73fe-4517-8c64-1ed6929c3b9a', 'n83nn', '2023-07-27 10:38:14');
INSERT INTO `sys_captcha` VALUES ('2789701b-87e1-437c-8377-cd283201e634', 'y24cw', '2023-07-17 08:56:49');
INSERT INTO `sys_captcha` VALUES ('27a3ffcf-903b-4614-843b-5dd044b5b8d2', 'g476w', '2023-07-18 21:29:11');
INSERT INTO `sys_captcha` VALUES ('27f0f703-1daa-42e2-82db-2ab43a9ac475', 'y573a', '2023-08-01 20:41:59');
INSERT INTO `sys_captcha` VALUES ('284bf1c1-d0d9-4796-893b-8bf21c7438d0', 'a7nf3', '2023-07-14 10:12:09');
INSERT INTO `sys_captcha` VALUES ('28643096-7555-4a8f-85ed-4f8ff1a6d095', 'g8637', '2023-07-25 16:49:07');
INSERT INTO `sys_captcha` VALUES ('2876961c-3ca0-4240-833d-e111ea54512d', '66pwb', '2023-07-28 08:52:41');
INSERT INTO `sys_captcha` VALUES ('28b8b2ad-0c56-4f78-8871-e29085c9f4a9', 'cdx48', '2023-03-31 10:44:56');
INSERT INTO `sys_captcha` VALUES ('28fe5c78-09ac-473f-8f9d-b48ea5185579', 'n4aew', '2022-12-07 15:09:00');
INSERT INTO `sys_captcha` VALUES ('293f1b66-9236-4da2-883d-924563fdbc20', 'nyfxb', '2023-07-22 09:13:49');
INSERT INTO `sys_captcha` VALUES ('294bde9a-34d2-4042-8cc5-e2d05d08924a', 'y2xfg', '2023-07-17 19:59:24');
INSERT INTO `sys_captcha` VALUES ('296d606e-3ca3-4317-81be-20683ce4e9fd', 'caxwb', '2023-08-02 10:13:35');
INSERT INTO `sys_captcha` VALUES ('2979d9fe-74ec-47c1-852c-fe7f014f8648', 'ecanx', '2023-07-26 15:50:13');
INSERT INTO `sys_captcha` VALUES ('29863b19-26ff-4353-85ff-28cd3e3899ce', '4mn33', '2023-07-27 09:29:38');
INSERT INTO `sys_captcha` VALUES ('29bca522-0247-4ac9-84bb-147201e8ebd7', 'n2nea', '2023-07-28 20:49:41');
INSERT INTO `sys_captcha` VALUES ('29ff7cd3-ce3d-410b-85c4-25ce70514b40', 'a2ya8', '2023-03-06 09:44:44');
INSERT INTO `sys_captcha` VALUES ('2a4a7824-f897-4d38-8df7-719f2fb26552', 'pd5nx', '2023-03-28 14:33:08');
INSERT INTO `sys_captcha` VALUES ('2b03d4d7-b176-47d8-8408-12a631796e08', 'n3d7p', '2023-03-13 16:15:43');
INSERT INTO `sys_captcha` VALUES ('2ba99c05-24e5-485e-8246-b590c5a54b55', 'e2adw', '2023-07-26 09:45:02');
INSERT INTO `sys_captcha` VALUES ('2c445798-fe77-4120-8876-58d4efb10376', 'x43n7', '2023-07-21 16:06:37');
INSERT INTO `sys_captcha` VALUES ('2c94dbc0-0920-47f5-8260-7d893877696d', '78ney', '2022-11-27 15:03:52');
INSERT INTO `sys_captcha` VALUES ('2c99e5f4-4b54-4fd6-80c7-919596e81fd4', 'yma5p', '2023-07-25 18:52:09');
INSERT INTO `sys_captcha` VALUES ('2cf4eabe-c3a0-4b62-85a1-362c99f6eddf', 'nx7ep', '2023-07-28 08:46:07');
INSERT INTO `sys_captcha` VALUES ('2d1a21f5-2354-4765-89cd-59830935cef3', 'wg7x3', '2023-05-23 20:10:37');
INSERT INTO `sys_captcha` VALUES ('2d575d22-ceef-4999-8865-2de8e72d8023', 'accnn', '2023-08-02 11:02:45');
INSERT INTO `sys_captcha` VALUES ('2d9f6643-cb39-4f09-81c3-3477643edc26', 'nyf8m', '2023-05-29 11:02:30');
INSERT INTO `sys_captcha` VALUES ('2dbfe0d6-3281-404d-84a8-812754f06fe6', '25gb8', '2023-07-17 17:19:46');
INSERT INTO `sys_captcha` VALUES ('2dfbb5f2-a081-47ee-84e6-57dc2ba4b613', 'c7mn2', '2023-07-29 08:59:56');
INSERT INTO `sys_captcha` VALUES ('2e117b72-3378-4972-8ab8-28e6a13c82ad', '36abg', '2023-07-14 19:58:00');
INSERT INTO `sys_captcha` VALUES ('2e31a5c1-36e1-474d-8d57-8d1c4c6171f7', 'gccgd', '2023-07-14 20:03:44');
INSERT INTO `sys_captcha` VALUES ('2e343f0a-4586-42a6-83e0-803fede53208', 'nwe7n', '2023-07-17 19:15:41');
INSERT INTO `sys_captcha` VALUES ('2e3dae52-1698-4219-8c99-938a8510e715', 'bf5y7', '2023-02-28 10:19:31');
INSERT INTO `sys_captcha` VALUES ('2e44e843-9989-4f72-8d23-7d07f623524a', 'gcnm2', '2023-07-21 09:24:02');
INSERT INTO `sys_captcha` VALUES ('2e501791-eeec-49df-8706-e92ae273faee', 'bnx6b', '2023-07-29 10:17:53');
INSERT INTO `sys_captcha` VALUES ('2e912286-9aa1-43dd-86e6-fe65e01b681b', 'cnm6b', '2023-07-18 21:41:24');
INSERT INTO `sys_captcha` VALUES ('2ec81374-fd58-4f1d-8c30-6ba904de6f16', 'gma8a', '2023-07-14 23:55:59');
INSERT INTO `sys_captcha` VALUES ('2f367600-2370-438a-8f05-d643bf7ea18a', '87283', '2023-07-27 11:33:11');
INSERT INTO `sys_captcha` VALUES ('2f3f7ec0-6163-42c3-8a4d-2557cf479bb3', '3ndpm', '2023-06-25 11:40:55');
INSERT INTO `sys_captcha` VALUES ('2fb42acc-c4a0-4b9c-8d6f-8e0916eff665', 'afpec', '2023-07-17 10:23:42');
INSERT INTO `sys_captcha` VALUES ('2fd55e88-7375-4840-89c5-9379c8787071', 'nd7fx', '2023-07-26 19:55:05');
INSERT INTO `sys_captcha` VALUES ('2fe11c4d-e9db-4922-8e42-18241820f847', 'ndby3', '2023-07-27 09:35:01');
INSERT INTO `sys_captcha` VALUES ('3035f48d-c808-49e8-8024-f527506caf10', 'cc36f', '2023-03-13 16:30:52');
INSERT INTO `sys_captcha` VALUES ('3039ee64-d00e-4dea-87a0-04675aa753e8', 'xb55m', '2023-07-21 11:12:46');
INSERT INTO `sys_captcha` VALUES ('307fc8c5-d3c6-43b9-8f15-512d513a1460', 'y56cf', '2023-07-14 19:56:01');
INSERT INTO `sys_captcha` VALUES ('308f8981-7d78-44e9-85a1-7ba9cc0c3bd2', '77463', '2022-11-28 20:39:46');
INSERT INTO `sys_captcha` VALUES ('30ab59b8-cc6b-423b-8dd9-db274282edce', 'nma7x', '2023-07-27 14:42:39');
INSERT INTO `sys_captcha` VALUES ('30ab66ec-a281-4718-8ab1-1c8b4abdcc4d', 'dbpan', '2023-08-02 11:22:39');
INSERT INTO `sys_captcha` VALUES ('30d4aebb-db72-4a22-8aab-92ae888419d0', 'ymfcf', '2023-07-29 10:09:32');
INSERT INTO `sys_captcha` VALUES ('313143a4-15cd-4aba-8048-cf89d8b50bae', 'de6dg', '2023-07-14 20:12:41');
INSERT INTO `sys_captcha` VALUES ('32840b2c-5fc5-45c7-8a3f-14955a78126d', 'mdb2y', '2023-07-18 21:22:04');
INSERT INTO `sys_captcha` VALUES ('32bcc3ba-cd42-4089-830a-159bf43a8005', 'w2x82', '2023-05-16 10:41:19');
INSERT INTO `sys_captcha` VALUES ('33394ba3-5ede-41be-8975-c4d11417a196', 'fgn3g', '2023-08-01 17:21:32');
INSERT INTO `sys_captcha` VALUES ('333fa52f-c736-4030-8590-2cef43077092', '6mfpy', '2023-07-24 10:12:06');
INSERT INTO `sys_captcha` VALUES ('334d5152-e936-44b3-8721-50b83eb26a24', 'wn5fd', '2023-07-27 10:01:04');
INSERT INTO `sys_captcha` VALUES ('336fa766-2ab4-4752-832c-9d1a929082d5', 'b5pg2', '2023-07-27 23:56:27');
INSERT INTO `sys_captcha` VALUES ('33984aa6-fa74-4b87-886f-dc145a3b2a66', '5c54e', '2023-05-15 11:09:18');
INSERT INTO `sys_captcha` VALUES ('33e9258f-aa17-4ce7-835b-e8cb00586097', 'gaba5', '2023-03-21 09:44:12');
INSERT INTO `sys_captcha` VALUES ('33fc4e65-159b-4129-8c1d-081ece73ced7', 'mm7pd', '2023-08-01 09:34:38');
INSERT INTO `sys_captcha` VALUES ('35186c44-f8b8-43c1-8e8c-ad349dad275f', 'fpc8x', '2023-07-15 09:10:43');
INSERT INTO `sys_captcha` VALUES ('3527c522-e966-441e-8236-c27125f4f3bb', 'ywd2x', '2023-07-26 20:22:44');
INSERT INTO `sys_captcha` VALUES ('35494f65-359b-4df2-8a1c-2c53826c30ef', '2n436', '2023-07-29 09:03:07');
INSERT INTO `sys_captcha` VALUES ('35609c66-679b-4e9e-8b0b-77d79a253dc4', 'nfd54', '2023-07-15 09:08:15');
INSERT INTO `sys_captcha` VALUES ('35858f76-3f20-4938-8423-6269d30914c0', '8ccyp', '2023-07-15 09:11:10');
INSERT INTO `sys_captcha` VALUES ('359c5428-3047-4b8a-87a0-a4bd3f79ff2b', 'ybfb2', '2023-07-14 20:23:53');
INSERT INTO `sys_captcha` VALUES ('35d5a90c-e1d9-4f5b-851e-581357d03c97', 'xw4x4', '2023-07-17 19:30:46');
INSERT INTO `sys_captcha` VALUES ('35db75af-d4d9-48fe-8196-f18aa967ee4d', 'ncb53', '2023-07-27 09:37:26');
INSERT INTO `sys_captcha` VALUES ('3628291d-d727-4333-80cc-919885f62422', 'y6nna', '2023-07-26 09:09:41');
INSERT INTO `sys_captcha` VALUES ('36303440-dde8-4a8f-8a25-23ed6fe10720', 'ewdm3', '2023-06-10 19:56:05');
INSERT INTO `sys_captcha` VALUES ('36f60cbc-5861-4d0b-8b0c-7893d2b6a301', 'y2cnc', '2023-08-01 08:13:30');
INSERT INTO `sys_captcha` VALUES ('37215dc3-32e9-485a-8e3f-8b5f4081f979', '7a5d6', '2023-08-01 17:45:54');
INSERT INTO `sys_captcha` VALUES ('3721f71b-75a5-4804-8f8a-953d669523e5', 'nepcw', '2023-08-01 20:43:14');
INSERT INTO `sys_captcha` VALUES ('377e706b-7994-4ec0-898f-14e112cb2b07', 'e525e', '2023-07-17 10:20:32');
INSERT INTO `sys_captcha` VALUES ('37bb9d7f-8831-4cc9-863e-d317cbd23d3e', '6y728', '2023-03-07 10:31:46');
INSERT INTO `sys_captcha` VALUES ('38167fd1-d420-416f-875a-bcfbed24de27', 'wx46m', '2023-05-24 19:11:50');
INSERT INTO `sys_captcha` VALUES ('3845f754-9167-4676-8269-ceb928eedddf', 'mcb6m', '2023-07-28 15:04:42');
INSERT INTO `sys_captcha` VALUES ('38687418-562a-42dd-85c3-4c37266d7a6c', 'mgnyy', '2023-07-27 15:04:58');
INSERT INTO `sys_captcha` VALUES ('389fdde9-60a0-41ed-8820-7454525bd501', 'n26ac', '2023-07-26 08:48:26');
INSERT INTO `sys_captcha` VALUES ('38bcf1b0-680d-4595-868f-d4c2d284fb28', 'n8pn5', '2023-08-01 10:31:34');
INSERT INTO `sys_captcha` VALUES ('38ce327c-808d-48fb-8aea-8a02b10cbdf0', 'n6bmn', '2023-07-21 10:53:06');
INSERT INTO `sys_captcha` VALUES ('38e9664b-2adf-4a34-8b2e-da8757885a03', '3w88d', '2023-07-18 22:00:26');
INSERT INTO `sys_captcha` VALUES ('39128256-25a7-4744-8120-69f879b51d5b', 'p5npy', '2023-07-18 11:10:31');
INSERT INTO `sys_captcha` VALUES ('392b3f6e-524d-440c-8533-b5234712dce1', 'nebm8', '2022-12-06 14:16:02');
INSERT INTO `sys_captcha` VALUES ('39390690-778b-45c4-80a7-109e7d5b95bc', '8pp3a', '2023-08-01 15:42:46');
INSERT INTO `sys_captcha` VALUES ('39d80a14-336e-4e8a-8fa6-672cde26cfa8', '32eyx', '2023-07-27 16:34:31');
INSERT INTO `sys_captcha` VALUES ('39fdcc2d-d19a-4ce6-8c8b-89a651a287c3', '8n3y3', '2023-07-17 10:01:44');
INSERT INTO `sys_captcha` VALUES ('3a113312-34e0-48f9-8359-4ca058b30883', 'w87n8', '2023-08-01 11:08:13');
INSERT INTO `sys_captcha` VALUES ('3a133e0d-7e0a-4d2a-83b0-b6523afa4c8a', '2wnnf', '2023-07-17 13:45:14');
INSERT INTO `sys_captcha` VALUES ('3a16b4a6-15af-419c-8b91-4fd15a747030', '3cxyn', '2023-07-14 19:47:16');
INSERT INTO `sys_captcha` VALUES ('3ac260ce-fd9b-43b0-8644-763d6fbd2c6d', 'g37dw', '2023-07-14 20:03:25');
INSERT INTO `sys_captcha` VALUES ('3b002799-9ead-4e1a-876b-63a0821adc64', '7m2by', '2023-07-27 16:00:53');
INSERT INTO `sys_captcha` VALUES ('3b78535b-8ea4-4cea-8f3c-23955ecf0336', 'gge5x', '2022-11-24 15:36:06');
INSERT INTO `sys_captcha` VALUES ('3be6de0c-7d55-4474-801c-99cd2ae229fb', 'x6en7', '2023-07-19 10:39:30');
INSERT INTO `sys_captcha` VALUES ('3c298799-52c5-4484-852e-6bdf60da2fd8', 'a8b3e', '2022-12-08 13:10:03');
INSERT INTO `sys_captcha` VALUES ('3c6709ac-35fd-45bb-82b6-03e42eb533e1', 'x85af', '2023-07-21 11:00:40');
INSERT INTO `sys_captcha` VALUES ('3cbd8ff2-6a0d-4fde-8fa8-5d2b9b5c65ff', 'aywwd', '2023-07-20 15:28:18');
INSERT INTO `sys_captcha` VALUES ('3dabfd6f-2abf-47ee-873d-42a21309e4e3', 'bng57', '2023-07-27 10:00:50');
INSERT INTO `sys_captcha` VALUES ('3e6f378c-1504-4a3f-869c-41f96e50232d', '6fyfx', '2023-07-28 18:17:46');
INSERT INTO `sys_captcha` VALUES ('3ea8934f-06ac-4a24-8046-ad60ff3284c8', 'wawp6', '2023-07-18 21:19:08');
INSERT INTO `sys_captcha` VALUES ('3eca66b6-ca11-44a6-83cf-4278ccb6dfec', 'cwgxn', '2022-12-06 10:13:58');
INSERT INTO `sys_captcha` VALUES ('3f3a7db9-964f-4021-8d72-2874ffde1466', 'gn35n', '2023-03-16 09:05:54');
INSERT INTO `sys_captcha` VALUES ('3f759f50-c6b2-42df-8847-b4ad970fb329', 'yp5an', '2023-07-15 09:18:43');
INSERT INTO `sys_captcha` VALUES ('3fb6181a-5a24-482d-8321-cc1b2009c9f0', '6cn5x', '2023-07-19 16:52:12');
INSERT INTO `sys_captcha` VALUES ('403c3267-acc2-43e6-8522-555928a63447', '3f38m', '2023-07-21 09:23:21');
INSERT INTO `sys_captcha` VALUES ('40ae8a0e-2ce3-42fa-85b7-ec381aec481d', '4a74f', '2023-07-20 15:55:09');
INSERT INTO `sys_captcha` VALUES ('418af278-199c-4f63-8658-d6c0ef41345b', '8e8en', '2022-12-08 14:13:59');
INSERT INTO `sys_captcha` VALUES ('41cb20b0-058e-4e7a-8a88-fe8e5d9eefbb', 'd3gna', '2023-07-18 14:52:57');
INSERT INTO `sys_captcha` VALUES ('41e77685-8622-453c-8e3e-5cf431d8d52f', '686bp', '2023-07-25 10:44:40');
INSERT INTO `sys_captcha` VALUES ('4263e4c3-630a-4cda-809a-207019977f9f', '4p8bp', '2023-07-17 19:36:33');
INSERT INTO `sys_captcha` VALUES ('42a8e794-4f56-4e21-8103-c48c59557192', 'xxnba', '2023-08-02 10:32:14');
INSERT INTO `sys_captcha` VALUES ('42ed8567-8def-4183-8487-d5cb448798f1', '48ndb', '2023-07-15 14:31:16');
INSERT INTO `sys_captcha` VALUES ('4394bbc3-d940-4536-853f-5d859f6c1ee1', '442dp', '2023-07-14 18:44:47');
INSERT INTO `sys_captcha` VALUES ('43b4f80d-6e8a-4c16-8982-35f9ef4d0bd2', 'nmbm4', '2023-07-15 10:47:24');
INSERT INTO `sys_captcha` VALUES ('43eb8f4c-8be0-4d84-83a5-98f7d620ee7f', '8b6f5', '2023-07-21 09:10:12');
INSERT INTO `sys_captcha` VALUES ('4476db49-9cf7-4178-8aa4-e44fe90043b8', 'wy8an', '2023-07-15 08:34:28');
INSERT INTO `sys_captcha` VALUES ('447a6bfb-d1b8-4f47-85da-d611771ad3f5', 'w82y5', '2023-07-17 19:15:42');
INSERT INTO `sys_captcha` VALUES ('44873ee5-3217-456e-8be8-505e369c1fad', 'eemd2', '2023-07-22 09:02:51');
INSERT INTO `sys_captcha` VALUES ('44c80dd0-2dc5-49a4-872f-83cbc9e527c1', 'cff52', '2023-03-06 16:04:51');
INSERT INTO `sys_captcha` VALUES ('44e4d2fe-79fe-4778-820d-1667f786ac38', '43f8c', '2023-07-17 09:59:47');
INSERT INTO `sys_captcha` VALUES ('45497233-7814-4f7f-87cc-6bbe2db386cd', '252nc', '2023-08-01 10:31:20');
INSERT INTO `sys_captcha` VALUES ('45fa27d4-76ab-4997-8a9c-048895a63de1', '6yn2e', '2023-07-24 15:02:06');
INSERT INTO `sys_captcha` VALUES ('46112cba-596a-4691-8dd3-89968ca5684a', '7af8d', '2023-07-22 08:56:56');
INSERT INTO `sys_captcha` VALUES ('461cdc0f-b8ae-4b28-8b8b-1ef48765271f', 'e5yd7', '2023-07-14 19:08:45');
INSERT INTO `sys_captcha` VALUES ('4656afaa-768f-4400-8ebf-bd643a0d155a', '6bg28', '2023-07-26 16:11:09');
INSERT INTO `sys_captcha` VALUES ('467a1232-c736-4a7b-888f-81cc80907825', 'x558e', '2023-03-24 17:30:38');
INSERT INTO `sys_captcha` VALUES ('46e036ab-4e42-4eb4-82f6-6e498a717ea8', 'a2777', '2023-07-19 10:24:53');
INSERT INTO `sys_captcha` VALUES ('47472158-fc95-4b0c-8085-10e9ea91b533', 'xdag3', '2023-07-24 10:06:34');
INSERT INTO `sys_captcha` VALUES ('4791407b-c7af-4c8b-8161-4ca9fa9109f5', '2a54a', '2022-11-28 19:46:50');
INSERT INTO `sys_captcha` VALUES ('47b5f094-bb2f-4511-8875-eed4a59657ad', 'c3mw8', '2023-07-18 20:40:40');
INSERT INTO `sys_captcha` VALUES ('47c5ef06-f57e-4154-89df-6f88018a92db', 'ncd58', '2023-07-27 10:00:36');
INSERT INTO `sys_captcha` VALUES ('47c6cb1a-d6c8-46dd-8e68-0b0e379c2ee0', '74wfn', '2023-07-20 09:31:24');
INSERT INTO `sys_captcha` VALUES ('47cffd62-57a3-43b4-8a76-4a60187bc9d1', 'eyy8e', '2023-08-01 10:50:44');
INSERT INTO `sys_captcha` VALUES ('4800c873-3321-4020-875c-6f915b655877', 'a2pyf', '2023-07-24 19:55:32');
INSERT INTO `sys_captcha` VALUES ('480ef503-1c4a-43cd-8847-3ab4c892ef5b', '2aawy', '2023-07-14 19:55:08');
INSERT INTO `sys_captcha` VALUES ('4814c38a-f621-484d-8eb5-964ed9847b5d', '56pmn', '2023-07-17 19:19:27');
INSERT INTO `sys_captcha` VALUES ('48188a06-c188-4946-814e-f0448f8d47b4', '24gd2', '2023-03-17 23:34:50');
INSERT INTO `sys_captcha` VALUES ('48248a0c-d12e-4cb2-8485-70c1f0197cdd', '7dpp2', '2023-07-27 15:25:28');
INSERT INTO `sys_captcha` VALUES ('4850993d-9340-477c-859f-9b82d876a21d', 'm8x7a', '2023-03-16 16:01:13');
INSERT INTO `sys_captcha` VALUES ('48b7e3a8-9916-452b-8980-beced780db02', '2ef26', '2023-06-03 10:42:29');
INSERT INTO `sys_captcha` VALUES ('48ce33cb-044d-404d-84ea-1a3d6b878d79', 'bdngp', '2023-03-08 09:22:08');
INSERT INTO `sys_captcha` VALUES ('494b09fa-adee-491f-8839-94592bcf4775', '64x38', '2023-07-24 14:32:43');
INSERT INTO `sys_captcha` VALUES ('49722000-2a0f-420b-8556-f24704816830', '2b2bc', '2023-07-25 11:16:19');
INSERT INTO `sys_captcha` VALUES ('49d2308b-c52a-45e2-857d-ee7ba21aa401', 'gm77g', '2023-03-31 08:00:11');
INSERT INTO `sys_captcha` VALUES ('4a115190-09b1-4c58-8ea1-f876707a106f', 'paw75', '2023-08-02 11:01:18');
INSERT INTO `sys_captcha` VALUES ('4a4069cf-d5e8-4cd5-89db-2e9a28850e06', 'we4ma', '2023-07-30 20:09:52');
INSERT INTO `sys_captcha` VALUES ('4b0d5803-6fb9-414f-8dc6-4224db316f8e', 'yfwyf', '2023-07-27 11:02:51');
INSERT INTO `sys_captcha` VALUES ('4b129738-18d4-44d4-8b46-c1fa94205795', '4y432', '2023-07-24 14:56:43');
INSERT INTO `sys_captcha` VALUES ('4b3f3307-3e17-4748-85fc-2a414b740cdc', 'xcgea', '2023-08-01 15:41:23');
INSERT INTO `sys_captcha` VALUES ('4b5dc519-4efe-448c-8fd5-14ead1e3a2d3', '2a37b', '2023-07-27 10:54:06');
INSERT INTO `sys_captcha` VALUES ('4b6e8f9e-08c9-4cc4-8961-968ff4d53df2', 'wmpdn', '2023-08-02 10:30:40');
INSERT INTO `sys_captcha` VALUES ('4b748093-341f-4d6b-8270-053670780a1e', 'w4fn3', '2023-07-24 09:49:23');
INSERT INTO `sys_captcha` VALUES ('4b78af52-3690-4ea4-863f-6cc46e792de1', 'n7yx5', '2023-07-18 18:45:22');
INSERT INTO `sys_captcha` VALUES ('4bbddfff-5e33-4659-8e10-c48799221b3f', '74wyp', '2023-03-24 14:01:37');
INSERT INTO `sys_captcha` VALUES ('4bc929b8-b69b-485a-8cb9-4d5cd3603189', 'c5e54', '2023-03-23 15:30:08');
INSERT INTO `sys_captcha` VALUES ('4bf2d109-d7c1-4894-8057-b9d72b9a1fab', 'gng7y', '2023-03-23 14:10:46');
INSERT INTO `sys_captcha` VALUES ('4c162565-d0e7-4e47-8e1c-22e23a290f6a', 'c3mem', '2023-03-28 09:12:58');
INSERT INTO `sys_captcha` VALUES ('4c4363cb-9a0d-4179-8c14-5be8387f981e', 'p3w5b', '2023-07-29 10:12:37');
INSERT INTO `sys_captcha` VALUES ('4cbcad44-c758-49fc-85e1-d743a9e33638', 'bn8xa', '2023-08-02 09:39:01');
INSERT INTO `sys_captcha` VALUES ('4cf06f26-d364-46b3-85d2-bb0976a1affb', 'ey75g', '2023-07-18 15:17:12');
INSERT INTO `sys_captcha` VALUES ('4d0a39cb-4e9a-43e8-8e62-60dfb88d1b07', 'bdmcd', '2023-05-29 14:10:47');
INSERT INTO `sys_captcha` VALUES ('4d751d40-2280-4960-8234-23085c30e7d1', 'cp6ea', '2023-07-27 10:01:55');
INSERT INTO `sys_captcha` VALUES ('4da305f1-a729-47f4-87ea-34944294bb5d', 'yfam4', '2022-12-21 15:28:13');
INSERT INTO `sys_captcha` VALUES ('4dcf909a-1d22-4aa3-8e8f-e16dab4f286d', 'amapd', '2023-07-25 15:27:22');
INSERT INTO `sys_captcha` VALUES ('4ddbee2c-2a25-4de3-89fd-1fa47671d97f', '24fbn', '2023-07-27 09:46:56');
INSERT INTO `sys_captcha` VALUES ('4e0eb7eb-901f-4bca-86bb-58e45411f76e', 'g8c4n', '2023-07-28 20:32:41');
INSERT INTO `sys_captcha` VALUES ('4eaad86b-d2d6-4f22-8450-9f6708ef7165', '6cdg2', '2023-07-28 11:42:47');
INSERT INTO `sys_captcha` VALUES ('4ecc70dc-a5a6-4642-82af-f58c5c8f95c4', '8aa88', '2023-07-18 21:17:32');
INSERT INTO `sys_captcha` VALUES ('4ee46adb-4b66-4819-826a-d158229f1fc3', 'cgn4y', '2023-07-24 09:49:50');
INSERT INTO `sys_captcha` VALUES ('4fcca8f0-96d3-4838-89da-1b2f7de86ea9', 'appn4', '2023-07-21 16:04:00');
INSERT INTO `sys_captcha` VALUES ('501816d0-ce8f-4cf8-8984-aa3012c983c2', 'xggp5', '2023-07-15 10:51:27');
INSERT INTO `sys_captcha` VALUES ('5027713d-b2d5-4a0d-85b9-2021dc07f9c8', '43yf5', '2023-07-14 20:52:45');
INSERT INTO `sys_captcha` VALUES ('506f9966-5d22-4865-8e43-31ab4f39a5a0', '7c7m5', '2023-07-14 18:44:11');
INSERT INTO `sys_captcha` VALUES ('50838ff5-0ea2-43cb-842a-9e3588a691a8', '2ncnn', '2023-03-02 21:04:53');
INSERT INTO `sys_captcha` VALUES ('5093c36e-ee13-4b5c-8151-8a6544ca4705', '3p4ge', '2023-07-30 10:10:27');
INSERT INTO `sys_captcha` VALUES ('50ded16d-601e-4bd6-8e8f-55ff7030f04e', 'nfn3c', '2023-07-27 18:30:03');
INSERT INTO `sys_captcha` VALUES ('510c6e15-f08b-4cec-882d-6682b13beb6e', 'mmned', '2023-07-14 23:01:10');
INSERT INTO `sys_captcha` VALUES ('51516beb-b003-4cf8-87e8-1ed2230e1c0d', 'faedd', '2023-07-31 09:00:08');
INSERT INTO `sys_captcha` VALUES ('519ef87f-759c-4eeb-81c3-dd54c03b2733', 'ed28c', '2023-03-29 17:02:30');
INSERT INTO `sys_captcha` VALUES ('51aa503a-8ecc-455d-8a9d-6e7265a349b8', 'ga83d', '2023-07-27 11:03:46');
INSERT INTO `sys_captcha` VALUES ('51c39b7b-bf63-4e72-8d16-0928a1675553', '25enb', '2023-03-02 20:16:16');
INSERT INTO `sys_captcha` VALUES ('51fea2f8-f558-4537-8c1e-f02ede65ba29', 'wpce4', '2023-07-25 08:51:37');
INSERT INTO `sys_captcha` VALUES ('521b8324-e09c-4508-88f6-6ae34264aaf6', 'x4fcm', '2023-07-17 19:37:24');
INSERT INTO `sys_captcha` VALUES ('521d3bdf-b298-4308-8bea-3a0bc52d6e04', '4ne35', '2023-07-18 19:09:44');
INSERT INTO `sys_captcha` VALUES ('52521955-59f2-4485-89dd-70a0b2cabe03', '53d67', '2023-07-27 09:35:38');
INSERT INTO `sys_captcha` VALUES ('5259bf02-55c0-46fb-87ed-40db7ccef8e6', 'x5y7p', '2023-08-01 15:41:59');
INSERT INTO `sys_captcha` VALUES ('52eac878-fa3a-42ce-832f-b73da934479c', '6bx2m', '2023-07-31 23:33:54');
INSERT INTO `sys_captcha` VALUES ('5327cf6f-cfc7-4573-81b1-3e07bd6ffefd', '466pb', '2023-07-17 09:59:53');
INSERT INTO `sys_captcha` VALUES ('53725a2f-bf0d-4d61-8a21-f60c931b4321', 'wnf8d', '2023-07-17 09:45:50');
INSERT INTO `sys_captcha` VALUES ('53b10c89-b06c-47f6-8052-fa508133b8cb', 'bm3fd', '2023-03-31 08:44:08');
INSERT INTO `sys_captcha` VALUES ('53b77367-db9c-4c6d-86a0-ce5820889810', 'n44w6', '2023-07-25 11:25:35');
INSERT INTO `sys_captcha` VALUES ('5437fee2-d60a-47b7-8c5c-e3494479132a', '553cm', '2023-07-21 09:54:19');
INSERT INTO `sys_captcha` VALUES ('5475b1e8-fc02-45a6-8f66-d8b8ba6c66a9', '6egb3', '2023-07-14 18:44:45');
INSERT INTO `sys_captcha` VALUES ('5581fb2e-db0d-437b-87fc-dfb20263f4e9', '7dfc4', '2023-07-26 14:29:29');
INSERT INTO `sys_captcha` VALUES ('55885d6e-7766-44c9-8ded-1d39672db283', 'nxe6x', '2023-07-27 10:38:11');
INSERT INTO `sys_captcha` VALUES ('559dd91f-1355-465b-841f-e86d172ece67', 'gnwg3', '2022-11-08 21:13:10');
INSERT INTO `sys_captcha` VALUES ('55df6a5b-a70c-4d89-8a65-2f38030d5cf3', 'ndndd', '2023-08-01 10:50:58');
INSERT INTO `sys_captcha` VALUES ('55f3dc3f-0105-4684-8576-51755dac9599', '25n4w', '2023-07-14 19:54:34');
INSERT INTO `sys_captcha` VALUES ('564fe464-5bcf-44ef-8b5c-491bc46061d1', 'eg865', '2023-07-17 10:00:08');
INSERT INTO `sys_captcha` VALUES ('57c4cc3a-7935-4457-8536-e89132788a28', 'bbpaf', '2023-03-11 09:10:53');
INSERT INTO `sys_captcha` VALUES ('58190ff9-1c2c-413d-8f9a-b76e31bca4e2', '622x8', '2023-07-27 09:56:05');
INSERT INTO `sys_captcha` VALUES ('5821e992-61dc-4956-84cb-a1a395e9e2cc', '3wx62', '2023-04-03 10:52:03');
INSERT INTO `sys_captcha` VALUES ('584376a4-9771-4af7-8023-ca450fa17a88', '8n4an', '2023-03-07 19:12:53');
INSERT INTO `sys_captcha` VALUES ('58f2750c-6a75-4c09-8a61-ade2812232aa', 'wcnp5', '2023-07-21 09:51:16');
INSERT INTO `sys_captcha` VALUES ('592a33cb-49a8-4c77-8b7c-4f78bc8b64b1', 'nngd6', '2023-08-01 21:02:53');
INSERT INTO `sys_captcha` VALUES ('59542ca2-b647-4051-8342-9f4c61c81327', 'b6ypd', '2023-07-21 10:34:21');
INSERT INTO `sys_captcha` VALUES ('59584017-5f43-4818-8ace-058b4183f394', '7gy3d', '2023-07-28 19:53:07');
INSERT INTO `sys_captcha` VALUES ('599d0772-9088-4ebd-8f2d-858b0180f5d8', 'bpdxn', '2023-03-31 15:03:32');
INSERT INTO `sys_captcha` VALUES ('5a951116-c442-4fbe-84de-f382169f1220', '4f67g', '2023-07-17 19:35:26');
INSERT INTO `sys_captcha` VALUES ('5ac508bd-efc0-4808-8e1c-2e5d9bcc213f', 'c582y', '2023-07-18 20:43:01');
INSERT INTO `sys_captcha` VALUES ('5aed82ca-f5d4-49fc-8feb-04c128dc2bb3', 'yew2b', '2023-07-31 09:15:54');
INSERT INTO `sys_captcha` VALUES ('5b3b9ec2-9e8b-42fa-85b4-d7b6dad4070e', 'x6n34', '2023-08-01 21:26:33');
INSERT INTO `sys_captcha` VALUES ('5c04c854-35b3-44ff-8328-6f326cff7be4', 'wcgce', '2023-07-27 10:56:19');
INSERT INTO `sys_captcha` VALUES ('5c7ab43a-804e-4c39-8b2a-8c5e02ffadc0', 'ycn56', '2023-03-05 09:08:10');
INSERT INTO `sys_captcha` VALUES ('5cd32d71-2a9d-4032-8d62-34017a6ba8a7', '4ge2a', '2023-07-25 16:50:51');
INSERT INTO `sys_captcha` VALUES ('5ce47146-11b6-4648-83c7-b0a326ee60f2', '3pga3', '2023-05-31 15:17:46');
INSERT INTO `sys_captcha` VALUES ('5d05be3b-f919-47ba-8796-021aafa4aba3', 'yf5nd', '2023-07-21 19:44:56');
INSERT INTO `sys_captcha` VALUES ('5d827059-8c9a-4613-876e-b74d917b3b99', 'mcy85', '2023-03-16 13:46:30');
INSERT INTO `sys_captcha` VALUES ('5db03b56-bdfe-49da-823c-fddb7349418f', 'cencw', '2023-07-17 19:32:31');
INSERT INTO `sys_captcha` VALUES ('5dc14b46-32ff-4a3f-85e5-44c31e95ff9a', '7xp6x', '2023-07-21 09:03:31');
INSERT INTO `sys_captcha` VALUES ('5dcbf6da-408e-4fff-8e31-dfd470ad2a59', 'xnnbm', '2023-07-27 09:32:33');
INSERT INTO `sys_captcha` VALUES ('5e03a138-a937-4556-88cf-4318f1ab37c1', 'wgfng', '2023-07-18 15:16:54');
INSERT INTO `sys_captcha` VALUES ('5e085465-2ff2-4250-84a9-c19d32b16d92', 'ewymb', '2023-06-07 08:40:52');
INSERT INTO `sys_captcha` VALUES ('5e1daccc-e00d-48b2-87a6-d01020ce37da', 'epcyf', '2023-07-27 21:44:16');
INSERT INTO `sys_captcha` VALUES ('5e3ddd32-0312-46d6-80e8-2b47fa3a22fb', 'a4dac', '2023-07-26 20:26:13');
INSERT INTO `sys_captcha` VALUES ('5e4d9fe0-da91-423a-89da-7b4edd0312ac', 'm4gww', '2023-07-14 19:59:25');
INSERT INTO `sys_captcha` VALUES ('5e4e532c-470d-4e56-8e18-1050796df588', 'afcn5', '2023-08-01 20:40:51');
INSERT INTO `sys_captcha` VALUES ('5fe63633-3c17-4b38-81a0-90724c0ea4ed', '2ccd8', '2023-03-13 17:03:38');
INSERT INTO `sys_captcha` VALUES ('61001b20-e049-481c-8172-48d250d0c202', 'nmab7', '2023-07-21 09:46:09');
INSERT INTO `sys_captcha` VALUES ('61ba8635-11bf-4ea5-8c1d-46368ea98c0e', 'gn765', '2023-07-29 10:40:19');
INSERT INTO `sys_captcha` VALUES ('61c1f263-b186-42e8-8f17-214992d83b4e', 'b6bda', '2023-07-21 09:50:55');
INSERT INTO `sys_captcha` VALUES ('61e04023-33c5-4e51-8b23-ae100d253c62', '857xn', '2023-03-28 14:54:15');
INSERT INTO `sys_captcha` VALUES ('622ddea8-8d1c-4d45-8f52-44886175ae8b', 'ccmed', '2023-08-01 14:27:00');
INSERT INTO `sys_captcha` VALUES ('6252d7fb-f159-499f-8788-7e9708cc363c', 'c7a5m', '2023-07-25 10:20:05');
INSERT INTO `sys_captcha` VALUES ('627f166b-df3a-455d-89be-9565a0c1b6de', '5xx8c', '2023-07-25 16:59:31');
INSERT INTO `sys_captcha` VALUES ('6282bf58-e09f-42b5-879f-24740fee5728', 'm88x8', '2023-07-18 18:23:12');
INSERT INTO `sys_captcha` VALUES ('62dfcc4e-d48a-404a-8433-a84e87517519', '3x37n', '2023-07-17 10:00:32');
INSERT INTO `sys_captcha` VALUES ('631af38c-d496-4ee4-8802-81043744d750', 'mx3d2', '2023-03-24 14:53:56');
INSERT INTO `sys_captcha` VALUES ('63aeeb7a-eca5-4313-8b8d-4eb46ae719dc', 'exnwm', '2023-07-27 10:19:45');
INSERT INTO `sys_captcha` VALUES ('63b0ca13-025b-4c79-8504-8fe2a23f716f', 'a3enm', '2023-07-28 16:20:53');
INSERT INTO `sys_captcha` VALUES ('63eec218-c9fd-4200-8a7b-0925750f48cb', 'cy2xn', '2023-07-29 09:47:56');
INSERT INTO `sys_captcha` VALUES ('646c82b2-a836-44da-8f99-f51747f43669', '2mpdx', '2023-07-14 20:13:02');
INSERT INTO `sys_captcha` VALUES ('64e7c04d-0caf-421a-89ee-7e17e88b1b50', '8nb5a', '2023-07-21 09:53:35');
INSERT INTO `sys_captcha` VALUES ('65a38185-26a2-4397-88e3-419f2d4b084e', '2bxbx', '2023-07-19 08:52:46');
INSERT INTO `sys_captcha` VALUES ('6614e9c4-aa1b-4418-88ba-19a678d00678', '63nxn', '2023-07-27 11:44:31');
INSERT INTO `sys_captcha` VALUES ('6631ab87-a58c-4e25-8c2d-6ba20aa2d878', 'ad2ab', '2023-03-31 09:41:35');
INSERT INTO `sys_captcha` VALUES ('663e1969-a7b2-4b8f-8e1a-8eab5042696a', 'x6agf', '2023-07-25 11:22:15');
INSERT INTO `sys_captcha` VALUES ('6661bde4-78fe-4bbb-8fbc-036e0a60756f', 'a6pan', '2023-07-25 10:31:14');
INSERT INTO `sys_captcha` VALUES ('66976bf3-2c9a-4fcb-8ff3-742bdb832afd', 'm2g6g', '2023-07-24 15:15:46');
INSERT INTO `sys_captcha` VALUES ('669973b8-5ae6-40ee-8fa5-b93fbc354487', '5ban2', '2023-07-21 15:03:33');
INSERT INTO `sys_captcha` VALUES ('66a4ed59-648c-4cb9-8f34-ece63b4195b8', 'bd7cy', '2023-07-24 10:31:07');
INSERT INTO `sys_captcha` VALUES ('676ed555-d013-4700-8158-74258baf9371', 'nee45', '2023-07-27 11:42:03');
INSERT INTO `sys_captcha` VALUES ('679aaceb-bfc0-4fa1-83fc-b8ed639a8224', 'yngcg', '2023-07-31 09:39:44');
INSERT INTO `sys_captcha` VALUES ('67bcca4c-6ff3-479a-85ce-b7f14593c472', 'n3y8w', '2023-07-22 09:18:44');
INSERT INTO `sys_captcha` VALUES ('683ca2e1-7a42-4848-8b19-60cb933d35e8', 'nda4c', '2023-07-26 20:23:55');
INSERT INTO `sys_captcha` VALUES ('68575790-e7a4-4646-86de-5a309847ed4c', 'amdyp', '2023-07-21 15:44:12');
INSERT INTO `sys_captcha` VALUES ('68ace61a-4dee-4b5e-8595-c1381adb4713', 'by733', '2023-07-20 16:00:32');
INSERT INTO `sys_captcha` VALUES ('68f5ab0f-6273-4f41-8939-a4553cf3270d', 'nx4fe', '2023-07-21 09:10:10');
INSERT INTO `sys_captcha` VALUES ('690a03e9-8468-4391-83cf-7456819ec4b6', 'e8a43', '2023-07-14 10:16:55');
INSERT INTO `sys_captcha` VALUES ('697478b5-397e-4d55-811b-bcf4c2c9f289', 'e4n27', '2023-07-14 19:04:01');
INSERT INTO `sys_captcha` VALUES ('69867f87-8f41-4c90-8145-a7d5afcace9c', 'ayden', '2023-07-25 08:50:28');
INSERT INTO `sys_captcha` VALUES ('6987d6b1-edd5-4c24-83f3-544d1974655b', 'db65d', '2023-07-24 15:11:44');
INSERT INTO `sys_captcha` VALUES ('69cd41a0-6d18-4181-8bae-248a91acf13f', 'feypb', '2023-07-15 09:08:23');
INSERT INTO `sys_captcha` VALUES ('6a1b1fb4-a272-41a5-8bde-3766075e507d', 'n5e2m', '2023-08-01 10:51:01');
INSERT INTO `sys_captcha` VALUES ('6a40274f-e3b5-40cb-862c-99f5e8b71929', '6cy4x', '2023-07-21 09:49:00');
INSERT INTO `sys_captcha` VALUES ('6b0d0334-19ec-42fd-8d74-d67d1588eeb9', '2xy5y', '2023-07-21 17:15:03');
INSERT INTO `sys_captcha` VALUES ('6b13b969-d99c-4482-89e5-98db38206dd3', 'gfpw2', '2023-08-02 10:46:40');
INSERT INTO `sys_captcha` VALUES ('6b299dc8-6d92-4e13-8e77-1ac89e9f1d01', 'abnnw', '2023-03-28 15:23:10');
INSERT INTO `sys_captcha` VALUES ('6b869cf0-e3d7-4e8c-8a90-09ceaedcff9b', 'x3cwn', '2023-07-18 11:09:42');
INSERT INTO `sys_captcha` VALUES ('6bcae7c9-fb51-48c9-8559-29e5852c842a', 'mdwce', '2022-11-28 19:58:33');
INSERT INTO `sys_captcha` VALUES ('6bdd83d9-97e0-4053-84d3-774797d405ba', 'd2ebb', '2023-07-29 10:17:17');
INSERT INTO `sys_captcha` VALUES ('6c1d7a55-3bff-4df6-803c-e504cd5c52cb', 'wmpmy', '2023-03-02 20:24:29');
INSERT INTO `sys_captcha` VALUES ('6c8fabf7-eef4-48ec-8015-753feeca858c', 'ynbdw', '2023-07-17 09:59:47');
INSERT INTO `sys_captcha` VALUES ('6ca31456-8f5d-4390-8c1a-f56bc177797d', 'cf23d', '2023-07-24 15:14:34');
INSERT INTO `sys_captcha` VALUES ('6d42edf3-7269-4ba8-8099-6f4565751db5', 'e2e4c', '2022-12-05 16:33:09');
INSERT INTO `sys_captcha` VALUES ('6db3b815-a0a4-481d-8e6f-2772ac160bb8', '2dw72', '2023-07-17 19:36:32');
INSERT INTO `sys_captcha` VALUES ('6e35c1f7-59b9-414e-80e6-d86228e4b96e', 'ab735', '2023-07-26 08:47:57');
INSERT INTO `sys_captcha` VALUES ('6ecb19e1-f952-4030-83fc-4a3ce3d7b61c', 'p328d', '2023-07-29 10:40:48');
INSERT INTO `sys_captcha` VALUES ('6edeab5d-37e7-4c3e-8bd8-0e362488b2ab', 'n78ew', '2023-07-26 20:34:21');
INSERT INTO `sys_captcha` VALUES ('6ee2af56-80cf-4893-8467-307be14cb4de', 'a4xwc', '2023-07-17 19:40:46');
INSERT INTO `sys_captcha` VALUES ('6f7d88ee-a8c6-43a7-8f39-95cdc8c84dd0', 'nd83c', '2023-07-14 16:31:44');
INSERT INTO `sys_captcha` VALUES ('6f8b0c50-e55b-4721-889d-261cd3aa4588', 'n6ygc', '2023-07-14 20:17:25');
INSERT INTO `sys_captcha` VALUES ('6fc9ff24-eceb-41d1-8692-2dc4555c6fd9', '5gpxn', '2023-08-02 15:08:51');
INSERT INTO `sys_captcha` VALUES ('6fcdf08b-2402-4e3a-8b82-d17e85ef543b', '32e2b', '2023-02-24 11:19:02');
INSERT INTO `sys_captcha` VALUES ('6fd12650-69fd-4da3-88a4-d9cfea7e8110', 'fm542', '2023-07-14 20:05:29');
INSERT INTO `sys_captcha` VALUES ('707f56b4-8dc0-4cf8-865c-a752a7b30e78', 'a3gdn', '2023-08-01 14:54:30');
INSERT INTO `sys_captcha` VALUES ('7084f7cf-6149-4353-8d8d-daf856b1e31e', 'db7yb', '2023-07-21 09:50:33');
INSERT INTO `sys_captcha` VALUES ('715e2140-59bb-4719-8403-db6d22e08855', 'awb4e', '2023-07-14 19:50:41');
INSERT INTO `sys_captcha` VALUES ('71772268-b6b2-4d61-8f88-06177f2599da', '2e8dn', '2023-04-02 18:31:50');
INSERT INTO `sys_captcha` VALUES ('71a877ae-63c4-4985-8d79-e842ca4885fc', 'pcff7', '2023-07-17 17:21:24');
INSERT INTO `sys_captcha` VALUES ('71fc2039-259c-43c8-8497-27d4db7b218f', '88x8m', '2023-07-25 15:40:52');
INSERT INTO `sys_captcha` VALUES ('71ff5d18-7453-4415-82c3-25e8f09ddbb1', 'x5nfc', '2023-07-27 11:32:26');
INSERT INTO `sys_captcha` VALUES ('72180496-d118-46af-867e-f1c60a1350da', '7373y', '2023-07-28 11:18:49');
INSERT INTO `sys_captcha` VALUES ('722cc6f1-f5ff-4189-8a1d-b875617eebbc', 'wbdp4', '2023-07-27 14:42:33');
INSERT INTO `sys_captcha` VALUES ('73686898-bf78-483f-84e9-e38465482395', 'x84bd', '2023-07-24 20:34:13');
INSERT INTO `sys_captcha` VALUES ('73fce9f8-d558-4966-8f39-246df33c3259', 'cp7fe', '2023-07-21 09:23:41');
INSERT INTO `sys_captcha` VALUES ('74169f5c-49c0-4f13-879a-2956005510e3', 'n75dg', '2023-07-27 09:39:02');
INSERT INTO `sys_captcha` VALUES ('745b1401-0726-44f8-867a-23a5f0d514f1', 'bxdyd', '2023-08-01 10:32:02');
INSERT INTO `sys_captcha` VALUES ('74bd1b8c-2477-450d-80f1-1b505280c152', 'y6yw3', '2023-07-21 09:41:43');
INSERT INTO `sys_captcha` VALUES ('74fdefd9-b879-4dd4-881c-c60fc34aef51', 'anafy', '2023-07-25 01:13:54');
INSERT INTO `sys_captcha` VALUES ('751e90f5-b690-4e8c-8f60-538f3c183792', '4gmmy', '2023-03-06 08:21:18');
INSERT INTO `sys_captcha` VALUES ('7550caf0-5774-4df8-8211-6cff24970f57', 'x5yed', '2023-07-27 19:52:35');
INSERT INTO `sys_captcha` VALUES ('756f695c-cb3f-4c48-8017-38a5eb17f402', 'nxfy3', '2023-07-29 10:01:22');
INSERT INTO `sys_captcha` VALUES ('75acf123-4139-4afa-8476-fdcfcc3eb0bd', 'g68e7', '2023-07-21 09:43:54');
INSERT INTO `sys_captcha` VALUES ('75bd6b48-810e-447a-8788-ae5d53c3ac50', 'npga5', '2023-07-25 14:43:40');
INSERT INTO `sys_captcha` VALUES ('75bfd21e-51cd-4738-835f-daba9f469df1', 'd437c', '2023-07-14 20:12:20');
INSERT INTO `sys_captcha` VALUES ('75d311a1-b140-4fc3-8043-ff36da213cfa', '6e6ep', '2023-07-24 14:03:11');
INSERT INTO `sys_captcha` VALUES ('75ec4423-efa7-45a8-8245-12e398e08bdf', 'dyy3g', '2023-08-02 10:49:32');
INSERT INTO `sys_captcha` VALUES ('75edbe99-4068-4a09-82c7-aa406e34251f', '2p5ga', '2023-07-17 19:54:48');
INSERT INTO `sys_captcha` VALUES ('765cc093-994a-47d7-8f46-3523eb91a2aa', 'm5m6p', '2023-06-03 10:29:24');
INSERT INTO `sys_captcha` VALUES ('76b0012e-372a-4854-8bf4-a619796f5938', 'fde2n', '2023-07-14 20:12:24');
INSERT INTO `sys_captcha` VALUES ('76ffa0b5-bd1f-4e27-8284-7283775bd543', 'cnp8n', '2023-03-14 13:54:54');
INSERT INTO `sys_captcha` VALUES ('77402da8-e258-444e-8cc5-68fe04fb8f10', 'apd62', '2023-05-29 14:15:49');
INSERT INTO `sys_captcha` VALUES ('77522d0c-0eff-465d-89f5-24383e17c776', '72wm5', '2023-07-24 21:11:37');
INSERT INTO `sys_captcha` VALUES ('77c1ce5d-3e90-4a03-891e-e3760e15939d', 'dxdcb', '2023-07-25 15:08:14');
INSERT INTO `sys_captcha` VALUES ('78abca7a-2edb-4214-83e9-7bee7f306b35', 'y3x8c', '2023-07-26 14:30:15');
INSERT INTO `sys_captcha` VALUES ('790c0fe5-d7b4-4f4f-8242-fffef0dc7967', 'y838m', '2023-07-18 18:23:07');
INSERT INTO `sys_captcha` VALUES ('7998854c-f793-4d6e-85f2-9dc28b9d7b97', 'pecyb', '2023-08-02 15:32:31');
INSERT INTO `sys_captcha` VALUES ('79ee23bb-f90c-401b-8cbb-db2402f0e709', 'a3fee', '2023-07-18 14:21:52');
INSERT INTO `sys_captcha` VALUES ('7a2b706a-ee57-4d8f-8d15-97022dbe439b', '8n46n', '2023-07-14 20:02:06');
INSERT INTO `sys_captcha` VALUES ('7a3670dc-2ceb-4ed1-851d-d89dc859dffe', 'wmydc', '2023-07-27 14:42:45');
INSERT INTO `sys_captcha` VALUES ('7a4565e3-4a90-45c1-83a7-dcb4a83fd0fe', '2fm7x', '2023-07-14 19:49:23');
INSERT INTO `sys_captcha` VALUES ('7a71e6f6-658a-4d5f-85d4-dc1c47e29469', '8cd5d', '2023-07-27 11:01:39');
INSERT INTO `sys_captcha` VALUES ('7a9193c1-9884-4f10-8bff-be3380374f3d', '8a4en', '2023-07-31 23:33:57');
INSERT INTO `sys_captcha` VALUES ('7aac1f16-6b4c-4992-8627-2e7a318cf8f1', 'fpxex', '2023-02-13 10:06:22');
INSERT INTO `sys_captcha` VALUES ('7ac1448c-631e-4b74-898f-cf4504053187', 'dbnya', '2023-07-27 09:59:38');
INSERT INTO `sys_captcha` VALUES ('7ae79482-90db-4487-828d-86172fb2e72d', 'c672b', '2023-07-17 10:18:19');
INSERT INTO `sys_captcha` VALUES ('7b3c5bb0-0bb1-4426-8d9a-1636361646fb', 'bd7gy', '2023-08-02 10:49:56');
INSERT INTO `sys_captcha` VALUES ('7bf12dba-2c24-4a79-844c-66ea6dffa9f8', '5gnnn', '2023-07-14 20:18:47');
INSERT INTO `sys_captcha` VALUES ('7c15126a-3739-482a-8829-9907580b9b59', 'f6nex', '2022-12-06 21:16:37');
INSERT INTO `sys_captcha` VALUES ('7c4e5fde-5e9f-474c-86d6-77d2861af0c0', 'n26py', '2023-07-27 09:51:32');
INSERT INTO `sys_captcha` VALUES ('7cd4ad1f-54e6-458d-802f-513e386a7518', 'xbx45', '2023-08-01 11:04:24');
INSERT INTO `sys_captcha` VALUES ('7d3bc366-613b-471d-8ca4-1637b695971a', '5nmf8', '2023-07-18 20:50:57');
INSERT INTO `sys_captcha` VALUES ('7d3be17c-f656-4701-8e6e-0481b2a0a4b0', 'e45m6', '2023-08-01 15:39:27');
INSERT INTO `sys_captcha` VALUES ('7d43cb37-4f97-41dc-883a-7bd8103ef658', 'gmagb', '2023-07-26 20:08:57');
INSERT INTO `sys_captcha` VALUES ('7d4ca8c4-adaf-401c-8e42-f8ba4dbba5cc', 'g5wyf', '2023-07-15 09:11:14');
INSERT INTO `sys_captcha` VALUES ('7d660ae4-c1cb-4937-86fe-6ef65759726f', '7g6xy', '2023-07-24 15:11:20');
INSERT INTO `sys_captcha` VALUES ('7d700c86-1da5-42b7-853d-d4952832fd10', 'f7yw7', '2023-07-27 09:39:40');
INSERT INTO `sys_captcha` VALUES ('7da73419-5ef6-45be-8eda-2ef76b30af72', 'm57m4', '2023-07-14 18:35:02');
INSERT INTO `sys_captcha` VALUES ('7ddef8fb-30f2-477d-8122-33f5e2701bdb', 'n5wf4', '2023-08-01 10:26:18');
INSERT INTO `sys_captcha` VALUES ('7dfdf0c4-7f63-4d8d-8873-98a8db78669b', 'fg3n2', '2023-07-05 11:14:31');
INSERT INTO `sys_captcha` VALUES ('7e203bf2-4ca5-4cef-8498-2dcf8c0ec5b4', 'npdy4', '2022-12-05 16:54:02');
INSERT INTO `sys_captcha` VALUES ('7e2395bb-fedd-4088-88a1-f090bed7230c', 'dgp75', '2023-07-29 09:31:25');
INSERT INTO `sys_captcha` VALUES ('7eb339b1-d1fd-4119-8e1e-d8049fd25106', 'f324y', '2023-07-14 20:24:51');
INSERT INTO `sys_captcha` VALUES ('7f1b2b53-5fd6-46b3-854d-857cea049be6', 'nggxb', '2023-07-29 09:29:06');
INSERT INTO `sys_captcha` VALUES ('7f6ec9ae-ef3d-4915-864e-5480a0dfcedc', '2ygcd', '2023-07-18 20:40:37');
INSERT INTO `sys_captcha` VALUES ('7fb2fc0c-0a35-4dcc-804b-d17cc5784ba8', 'enpx8', '2023-07-25 17:08:19');
INSERT INTO `sys_captcha` VALUES ('8085907f-49b7-43d7-8a8b-87e4fd255dc0', '4gme7', '2023-03-21 09:38:57');
INSERT INTO `sys_captcha` VALUES ('809da09b-27a2-474e-87c1-1cc59cf00e91', 'dyd2m', '2023-07-29 10:31:54');
INSERT INTO `sys_captcha` VALUES ('8104e784-6e6f-437d-858e-2b0750ae5a4c', 'exbd7', '2023-07-25 16:53:06');
INSERT INTO `sys_captcha` VALUES ('814fafb9-dcb6-499c-8eb9-cf19421b8809', 'e7g2x', '2023-07-24 20:01:20');
INSERT INTO `sys_captcha` VALUES ('817ceda7-62fb-4672-8467-831ef0b2f8fc', 'decwa', '2023-07-17 19:36:35');
INSERT INTO `sys_captcha` VALUES ('81975207-6130-4731-8683-d8a72589aa46', '28nx8', '2023-07-15 09:12:50');
INSERT INTO `sys_captcha` VALUES ('8198fbca-48bb-4a07-8df0-160bfb438684', '57gw8', '2023-07-14 19:50:48');
INSERT INTO `sys_captcha` VALUES ('81c2cf15-82bc-4ced-8667-0400a520467e', '3n3nx', '2023-07-21 09:01:05');
INSERT INTO `sys_captcha` VALUES ('81e533b4-0446-4690-8531-cb4eac51c083', 'd5bpf', '2023-07-18 20:56:32');
INSERT INTO `sys_captcha` VALUES ('81ff2e90-94ed-42e1-868b-b1cb544967db', '6b7gp', '2023-07-25 15:24:07');
INSERT INTO `sys_captcha` VALUES ('8269fa2a-08c7-468d-80ff-670d26be06e3', 'w7ey3', '2023-07-21 15:21:52');
INSERT INTO `sys_captcha` VALUES ('8288fca6-5a69-4035-850e-6376394dc8bf', 'aan4e', '2023-07-21 09:49:26');
INSERT INTO `sys_captcha` VALUES ('8337ecd0-39ee-47c1-8701-a685d7514918', 'd5be4', '2022-12-08 11:39:28');
INSERT INTO `sys_captcha` VALUES ('838e8549-e146-455b-8177-d7b514da0d72', 'mmb8p', '2023-08-02 10:49:43');
INSERT INTO `sys_captcha` VALUES ('83f1d41c-b21d-413e-8575-2f644d2150b3', '6enfe', '2023-07-27 11:35:03');
INSERT INTO `sys_captcha` VALUES ('83f66254-4c06-4b2f-8ccb-140b672ff5dc', 'n7ae6', '2023-07-30 19:01:29');
INSERT INTO `sys_captcha` VALUES ('840fe8d4-b21d-4c14-82d0-618585422c27', 'dm3dp', '2023-07-22 09:02:50');
INSERT INTO `sys_captcha` VALUES ('8450eed7-d92e-4481-8723-bba69234a36f', 'ngpb5', '2023-07-27 09:20:33');
INSERT INTO `sys_captcha` VALUES ('84dbf6a3-5ddb-45fb-85ed-57d3e62ae834', 'g52xm', '2023-07-20 14:51:39');
INSERT INTO `sys_captcha` VALUES ('853c79fb-0b8f-4401-83e3-58498fbee268', 'fw2na', '2023-07-21 09:43:05');
INSERT INTO `sys_captcha` VALUES ('853d0c96-d9b5-4401-8316-0ce03ec98012', 'acypm', '2023-07-30 17:09:37');
INSERT INTO `sys_captcha` VALUES ('854d966a-e7cd-473f-8ea8-ed757a131641', 'nxgd3', '2023-07-27 14:42:58');
INSERT INTO `sys_captcha` VALUES ('856fe702-2ec5-41ee-8f6c-c44eefbdd5bd', '8xm8w', '2023-08-01 15:43:43');
INSERT INTO `sys_captcha` VALUES ('85bf36ef-79bc-4f6d-8790-a6e84a52e03c', '7nnep', '2022-11-28 20:39:46');
INSERT INTO `sys_captcha` VALUES ('85c6023b-0049-45f4-8fe2-c6b945129a25', '2b64g', '2023-07-27 14:56:08');
INSERT INTO `sys_captcha` VALUES ('868c0eb3-f405-4272-8e2b-fa419f1689b0', '7cwyd', '2023-07-21 09:11:01');
INSERT INTO `sys_captcha` VALUES ('868f4845-6117-4d2b-8fe6-168da9f72802', 'e26b6', '2023-07-29 10:17:38');
INSERT INTO `sys_captcha` VALUES ('86e7a76c-0143-43ac-8fe3-36a707725e7a', '3beax', '2023-06-02 09:12:22');
INSERT INTO `sys_captcha` VALUES ('871c2f9c-a8ec-4333-8d65-410fb530bcbb', 'ea6cc', '2022-11-25 22:04:35');
INSERT INTO `sys_captcha` VALUES ('873a9c98-7835-4355-86ef-abecdd236d73', 'em5fb', '2023-08-01 14:34:31');
INSERT INTO `sys_captcha` VALUES ('875299b3-e683-4c70-8fdd-7df5fc3cd92d', '5b84g', '2023-05-16 10:40:43');
INSERT INTO `sys_captcha` VALUES ('876d1432-70ad-4061-8d28-0a4f1d35be29', 'wwpg6', '2023-07-26 18:47:51');
INSERT INTO `sys_captcha` VALUES ('87a39011-f403-459a-86ea-6afc6160646f', '3payf', '2023-07-20 08:50:08');
INSERT INTO `sys_captcha` VALUES ('87a72cd5-42a4-4512-85bd-97526ea45317', '72n6b', '2023-07-15 09:27:47');
INSERT INTO `sys_captcha` VALUES ('88820624-aefa-4996-852b-3f07c58d5e6a', 'fex83', '2022-11-30 14:36:29');
INSERT INTO `sys_captcha` VALUES ('889818f6-79c4-4364-8a46-e8e5b3055b4b', 'gc4ba', '2023-07-24 19:55:23');
INSERT INTO `sys_captcha` VALUES ('8924ae22-ab85-4e39-8c8e-61db85d3396c', '78d4b', '2023-05-17 09:52:58');
INSERT INTO `sys_captcha` VALUES ('89328170-a9d1-4e96-8628-c7beb9a5fd93', 'mpngg', '2022-11-08 15:31:14');
INSERT INTO `sys_captcha` VALUES ('893eb4f4-2637-4c8c-8dd0-31950d2b905e', 'm47yp', '2023-07-24 19:06:53');
INSERT INTO `sys_captcha` VALUES ('8a0e4594-f6d6-4277-85a4-d818e220f431', '6wagp', '2023-07-27 09:51:11');
INSERT INTO `sys_captcha` VALUES ('8a712049-b04b-406f-86ff-6450744795f1', 'cmfmm', '2023-08-02 10:32:30');
INSERT INTO `sys_captcha` VALUES ('8aee1539-fba1-42dc-81f7-e6f0c59b4530', 'f6byn', '2023-07-18 20:20:18');
INSERT INTO `sys_captcha` VALUES ('8b1b6619-8b09-4695-8f53-58135796f94e', '2ay75', '2023-07-21 09:10:13');
INSERT INTO `sys_captcha` VALUES ('8b5302e7-077e-4c62-8b4d-f5bf3fed7721', 'ean3w', '2023-07-14 20:43:35');
INSERT INTO `sys_captcha` VALUES ('8b694654-cebd-4206-8768-d5ea1597901e', 'a5p53', '2023-08-02 10:50:09');
INSERT INTO `sys_captcha` VALUES ('8ba86aa8-7c88-4c91-813f-fc94d4c4c56e', 'g34gd', '2023-08-02 15:32:00');
INSERT INTO `sys_captcha` VALUES ('8bc3175a-9279-4b9e-8e6c-7ab6fdbcdcde', 'mx6na', '2023-07-19 10:28:07');
INSERT INTO `sys_captcha` VALUES ('8c61aa19-dc5b-4621-8e5d-6b742c3ee271', 'ey4wn', '2023-04-10 13:23:04');
INSERT INTO `sys_captcha` VALUES ('8c9a5aaa-9383-45fe-846c-c32bca8d4ebf', 'cx4dw', '2023-07-17 17:21:52');
INSERT INTO `sys_captcha` VALUES ('8cc0bdf5-8d66-4d78-87f9-6c75eb9d2522', '2mm43', '2023-07-27 10:00:58');
INSERT INTO `sys_captcha` VALUES ('8ce3aee1-9e21-458c-837d-ec4f155c53ad', 'pn8g3', '2023-07-27 10:25:38');
INSERT INTO `sys_captcha` VALUES ('8d0e4764-e159-4bf5-8bfe-88506145aca8', 'wp2y4', '2023-07-21 09:01:12');
INSERT INTO `sys_captcha` VALUES ('8d8aa9bb-12f1-4b47-8106-48d1d23ef3f7', '3a7ef', '2023-03-28 12:02:42');
INSERT INTO `sys_captcha` VALUES ('8d8ea60a-768b-4004-8745-e65c85b71c14', 'n5n67', '2023-07-25 11:34:47');
INSERT INTO `sys_captcha` VALUES ('8dc9c3b3-7d5e-4c2c-80cb-91eff40bb36a', '6b38w', '2023-07-25 08:43:08');
INSERT INTO `sys_captcha` VALUES ('8defe4f9-9910-4b34-8fef-25365607e3f0', '6p26n', '2023-07-14 20:24:58');
INSERT INTO `sys_captcha` VALUES ('8dfd0cd8-bf03-4c7f-813e-5428067e2441', 'n2nan', '2023-07-21 09:50:55');
INSERT INTO `sys_captcha` VALUES ('8e01141e-3ac7-4bcb-81f2-bde368b8ef7a', 'ebbbn', '2023-07-14 20:03:48');
INSERT INTO `sys_captcha` VALUES ('8e2100c9-02bb-4dfb-8f2a-55d743de9d78', 'xafb5', '2022-12-07 14:24:34');
INSERT INTO `sys_captcha` VALUES ('8e4510d1-e31e-4bdc-872f-0b2afafa9dd0', '2xn6p', '2023-03-10 03:43:37');
INSERT INTO `sys_captcha` VALUES ('8e7ea038-0bed-45d2-8113-9a85278c05a5', 'y2f74', '2022-12-06 21:52:58');
INSERT INTO `sys_captcha` VALUES ('8e9a3b36-9562-4d98-8710-7bd128bc3e0e', '2a3xy', '2023-07-18 20:51:12');
INSERT INTO `sys_captcha` VALUES ('8ea1a27d-9ea7-4600-88f1-259766acf487', 'pnbnp', '2023-06-05 08:55:49');
INSERT INTO `sys_captcha` VALUES ('8eb07067-3c21-406a-889d-6b3d4350065d', 'b5nfb', '2023-08-01 10:29:40');
INSERT INTO `sys_captcha` VALUES ('8fd23ef9-3b22-4635-8b9b-71063264e6af', '5m5ny', '2023-07-26 20:22:41');
INSERT INTO `sys_captcha` VALUES ('8feb366f-8b5a-4f82-823d-7b2c91389654', 'an2pp', '2023-03-23 16:29:45');
INSERT INTO `sys_captcha` VALUES ('8ff85f31-dced-4abf-85a1-93dd3ea2a002', 'c3mnw', '2023-07-27 14:53:23');
INSERT INTO `sys_captcha` VALUES ('90565c47-a62c-4ad5-8a0d-ccee9e01d98a', '367p4', '2023-07-26 19:54:23');
INSERT INTO `sys_captcha` VALUES ('9065c808-5407-4e26-8a1e-16db878f8839', 'b8738', '2023-07-27 09:55:39');
INSERT INTO `sys_captcha` VALUES ('9093736a-45a8-4921-8518-9fc8ca81687a', 'nb7xe', '2023-08-01 15:40:48');
INSERT INTO `sys_captcha` VALUES ('9136cec6-2470-43f7-86fc-6f143fea053e', 'mnaxf', '2023-07-18 20:42:59');
INSERT INTO `sys_captcha` VALUES ('91b8964f-79b7-4d9a-863f-7e1062ebf1b4', 'y3n5n', '2023-07-27 10:01:07');
INSERT INTO `sys_captcha` VALUES ('91eb9d77-a38c-4a34-80a7-ed2abb31e16a', '5c64n', '2023-08-01 20:43:31');
INSERT INTO `sys_captcha` VALUES ('920f7467-99bf-46d4-8b44-d96f096b77cb', 'e8eff', '2023-08-02 10:51:00');
INSERT INTO `sys_captcha` VALUES ('92408022-d6b9-4e61-84a6-27d990fb2396', 'fwn4d', '2023-07-19 10:38:37');
INSERT INTO `sys_captcha` VALUES ('92742005-aabf-4114-8a9e-dcc745a7dca7', '8x2n6', '2023-08-02 10:49:45');
INSERT INTO `sys_captcha` VALUES ('92ad3f35-d605-400d-89ef-3f35b98ced62', 'edm72', '2023-07-25 15:27:22');
INSERT INTO `sys_captcha` VALUES ('92b69034-a3d1-46c6-8e56-aed4bd593692', '5e22c', '2023-07-27 09:55:19');
INSERT INTO `sys_captcha` VALUES ('92de58e9-3c25-45db-83cf-93a045e78bad', '3c36m', '2023-07-28 11:20:46');
INSERT INTO `sys_captcha` VALUES ('93b8b8ba-8b88-431e-86ad-8f914916f2b6', 'ay325', '2023-03-04 15:58:18');
INSERT INTO `sys_captcha` VALUES ('93e8affe-5216-4ff7-8e7d-01e59a654380', '5875e', '2023-07-14 10:51:32');
INSERT INTO `sys_captcha` VALUES ('94380667-620c-4cb3-8eec-632a77596249', 'nnp2b', '2023-07-26 01:08:37');
INSERT INTO `sys_captcha` VALUES ('9463dbc3-b4fb-4df3-8394-64d8ea1f7be2', '5cxg2', '2023-07-14 21:03:41');
INSERT INTO `sys_captcha` VALUES ('94ac6e23-32c6-46ea-899b-45c106de7f0d', 'meexw', '2023-07-17 17:20:00');
INSERT INTO `sys_captcha` VALUES ('94c5b35c-a614-46bf-80f0-f29018c6593a', 'xn5xy', '2023-07-27 10:38:04');
INSERT INTO `sys_captcha` VALUES ('959b7ad5-ac47-4bd2-8f39-6836d5f49d5e', 'xda2n', '2023-07-17 10:33:44');
INSERT INTO `sys_captcha` VALUES ('967d8faf-885e-4341-8111-6a27199d1c84', 'n65g6', '2023-07-29 10:14:59');
INSERT INTO `sys_captcha` VALUES ('967ff3f5-e0ba-47b8-8142-b2708bb9c151', 'x2edg', '2023-03-27 14:40:49');
INSERT INTO `sys_captcha` VALUES ('96a78d63-523f-4bd2-848d-1773957b8eea', 'cbxbg', '2023-07-18 20:42:02');
INSERT INTO `sys_captcha` VALUES ('96c39df6-64c0-4a1c-87ac-a0ec192e8a0d', 'pdgn6', '2023-08-01 14:34:35');
INSERT INTO `sys_captcha` VALUES ('9783c96a-446b-4c95-807f-41fa5975e0d6', 'gdpfp', '2023-07-25 17:07:59');
INSERT INTO `sys_captcha` VALUES ('97946230-5379-43f5-80fe-63894113e2bc', 'npcbp', '2023-03-06 17:14:41');
INSERT INTO `sys_captcha` VALUES ('97b85568-8a81-481f-884a-e4acaba46c4d', 'gennm', '2023-08-01 10:52:04');
INSERT INTO `sys_captcha` VALUES ('97e56d44-1c1c-47c9-8f19-626e8e755d77', '7gffg', '2023-07-17 17:19:09');
INSERT INTO `sys_captcha` VALUES ('98689d78-33a9-46ee-8f09-b71117abc523', 'nmycc', '2023-03-30 18:21:05');
INSERT INTO `sys_captcha` VALUES ('98834f60-93e9-4b13-804d-3df06bfb0fe2', '6m42p', '2023-08-01 20:46:34');
INSERT INTO `sys_captcha` VALUES ('98cb8748-4d3f-463c-8a28-dcd952d21100', 'dxyay', '2023-07-20 16:02:09');
INSERT INTO `sys_captcha` VALUES ('98f12b45-bf53-483d-8813-dd63c93b3e44', '8xaw2', '2023-03-14 14:45:48');
INSERT INTO `sys_captcha` VALUES ('98f7e2c4-320a-47fb-83cf-933848a291c9', 'g7nyb', '2023-07-18 15:00:49');
INSERT INTO `sys_captcha` VALUES ('99163123-75f8-4fef-8c06-5c1495e77420', 'cw4ye', '2023-08-01 15:40:56');
INSERT INTO `sys_captcha` VALUES ('99196ee9-ca52-4139-8d86-fc8dcaa88073', 'dc6g7', '2023-07-26 20:07:07');
INSERT INTO `sys_captcha` VALUES ('99219ab0-8c1e-4a8d-89b5-a6b3ce951f40', 'cewne', '2023-03-13 13:52:39');
INSERT INTO `sys_captcha` VALUES ('997a2ab4-f72a-4a34-884f-397a095af8d8', 'ef548', '2023-07-21 19:30:18');
INSERT INTO `sys_captcha` VALUES ('9a0fe8fa-a713-4d94-8a3f-69d90f977a51', 'wexnm', '2023-07-24 14:12:34');
INSERT INTO `sys_captcha` VALUES ('9a5cd8d1-a299-470b-8eb9-a722b7a43bbd', 'pwp5n', '2023-07-17 10:18:26');
INSERT INTO `sys_captcha` VALUES ('9abb5b8d-593a-42f8-85f9-c1947e9cd4fe', '2y4n4', '2023-07-26 14:07:25');
INSERT INTO `sys_captcha` VALUES ('9afa43ce-0a2a-497f-83d1-78833f376e72', '252wc', '2023-08-01 15:41:06');
INSERT INTO `sys_captcha` VALUES ('9afa5a24-784e-4b73-8303-8b2183934990', 'fx8bd', '2023-07-28 10:11:47');
INSERT INTO `sys_captcha` VALUES ('9b3272ff-092e-4069-83dd-2fd385e0ad25', 'mde3f', '2023-07-15 09:27:43');
INSERT INTO `sys_captcha` VALUES ('9b4150f4-3c3c-48d8-88a2-b594c85f5513', '6wae2', '2023-07-24 09:50:49');
INSERT INTO `sys_captcha` VALUES ('9b7da490-68ac-49ef-80bd-7e9d2724dea5', '8ycm3', '2023-03-24 14:42:36');
INSERT INTO `sys_captcha` VALUES ('9c5d62d0-0013-4fca-890f-8ef128f356b6', '86nae', '2023-03-13 16:20:48');
INSERT INTO `sys_captcha` VALUES ('9c77669b-824a-4e25-873e-055f6f983483', '3e6ng', '2023-07-17 09:49:39');
INSERT INTO `sys_captcha` VALUES ('9c8fdbbd-2bb0-4f40-8009-2d9badfa98cc', 'yg824', '2023-07-27 14:54:43');
INSERT INTO `sys_captcha` VALUES ('9c9d46f4-c545-4ef9-8911-7d39ad56b252', '752w5', '2023-07-21 09:41:03');
INSERT INTO `sys_captcha` VALUES ('9cb3b456-9971-45b9-82a1-3a2e15a5d914', '3w5a3', '2023-07-15 10:47:39');
INSERT INTO `sys_captcha` VALUES ('9d0e958d-9396-43b1-8cc2-a91639569cc3', 'mncan', '2023-07-27 09:53:29');
INSERT INTO `sys_captcha` VALUES ('9d7fa2fc-cf6b-4b46-8502-52eb39b576dd', 'ma7x3', '2023-07-24 15:16:19');
INSERT INTO `sys_captcha` VALUES ('9dce70e8-3dd4-42c8-861b-0ebb873188df', '48de7', '2023-07-14 20:24:32');
INSERT INTO `sys_captcha` VALUES ('9ddd4b35-a8b3-4997-8da1-a5562fa3e465', 'w7yxc', '2023-07-18 10:59:17');
INSERT INTO `sys_captcha` VALUES ('9de84f54-b927-47ec-8edc-af92249ed27a', 'p6g2m', '2023-03-03 14:54:47');
INSERT INTO `sys_captcha` VALUES ('9ec77654-4ee0-4ef8-89e8-4d74be84db71', 'y4ywd', '2023-07-30 17:09:38');
INSERT INTO `sys_captcha` VALUES ('9f9a8fc6-a603-4181-811b-c999fa5589f2', 'n35a7', '2023-07-21 09:40:04');
INSERT INTO `sys_captcha` VALUES ('a09862e1-5a8e-4fd6-817f-b6acc88e6a57', '88xbf', '2023-08-02 09:28:31');
INSERT INTO `sys_captcha` VALUES ('a0ca2107-3438-4c5c-8f2e-611357e778f9', '33gdb', '2023-07-31 09:18:14');
INSERT INTO `sys_captcha` VALUES ('a0df1c48-ea5c-41d0-8308-a3ba4e517643', '52eg8', '2023-03-04 16:24:48');
INSERT INTO `sys_captcha` VALUES ('a0e85eba-03b4-44e3-8ca8-81e702d49c17', 'nnw73', '2023-07-20 16:01:25');
INSERT INTO `sys_captcha` VALUES ('a1214b53-1b2d-4aa2-8c15-c0ae64ca90fe', '5bfwn', '2023-07-25 17:00:30');
INSERT INTO `sys_captcha` VALUES ('a1961e45-61fd-4442-89e0-d354443868bc', '2mbyn', '2023-03-14 18:15:00');
INSERT INTO `sys_captcha` VALUES ('a1a0b3ac-2e26-41a9-8959-9adefd59814b', 'apxd4', '2023-08-01 10:31:36');
INSERT INTO `sys_captcha` VALUES ('a20107a6-476c-4c9b-861f-dfb1e399876e', 'xxx5m', '2023-07-14 18:35:28');
INSERT INTO `sys_captcha` VALUES ('a2dcf873-df3a-4563-8a20-3c1b210ae9dc', 'g7fyx', '2023-08-02 15:43:49');
INSERT INTO `sys_captcha` VALUES ('a3324ff9-751a-41d0-85f0-ad7b1cc6e7bd', '73ne5', '2023-07-27 15:01:08');
INSERT INTO `sys_captcha` VALUES ('a3457f39-fd99-42d4-8744-ea21a0f48351', 'yndpf', '2022-12-07 08:44:04');
INSERT INTO `sys_captcha` VALUES ('a3507cab-7c13-4433-8850-925abfa27d17', '8en3y', '2023-07-17 10:42:04');
INSERT INTO `sys_captcha` VALUES ('a375a9de-9c5b-4ea6-8a59-fe3653ab34eb', 'ywcfe', '2022-12-21 15:29:29');
INSERT INTO `sys_captcha` VALUES ('a4523b30-cc9a-487b-87f7-6b7e5c77cb5b', 'mgcwd', '2023-07-19 09:53:23');
INSERT INTO `sys_captcha` VALUES ('a48bcc85-64f2-40ba-853a-1c2296b76683', '5mf6f', '2023-07-14 10:16:49');
INSERT INTO `sys_captcha` VALUES ('a4afe34e-bdbd-4333-8694-01f4bf8f83c1', 'ffxx2', '2023-07-26 20:16:04');
INSERT INTO `sys_captcha` VALUES ('a4c1fd33-23f2-46b5-8197-ef38fc3bfcd2', 'gw3d7', '2023-07-20 09:23:50');
INSERT INTO `sys_captcha` VALUES ('a50f4622-20de-47b4-827a-8b8efed69c40', 'wncwx', '2023-07-21 09:23:38');
INSERT INTO `sys_captcha` VALUES ('a55bedcb-e59f-4ba3-8d45-3607d780eeee', 'y5f33', '2023-07-21 11:18:43');
INSERT INTO `sys_captcha` VALUES ('a56a837b-b229-4beb-85ac-316d4b0fec39', '6ccwe', '2023-07-14 18:34:58');
INSERT INTO `sys_captcha` VALUES ('a56cec95-3a40-40ce-84a6-0cbaf20f732f', 'myxn2', '2023-07-14 19:56:35');
INSERT INTO `sys_captcha` VALUES ('a5ff89d3-1012-40a7-800a-ee5e4f4c1dfb', 'wdx5a', '2023-07-27 09:44:35');
INSERT INTO `sys_captcha` VALUES ('a6f61316-bb80-4b52-8cd3-8e87f53cc47f', 'b4d88', '2023-08-01 16:38:32');
INSERT INTO `sys_captcha` VALUES ('a7205255-43c8-4bf5-8d96-aec7833f48c4', 'xd2bx', '2023-07-17 10:00:23');
INSERT INTO `sys_captcha` VALUES ('a74f7882-26f7-4b71-8bfa-69b297c5f6c1', 'nbnwd', '2023-07-25 15:12:27');
INSERT INTO `sys_captcha` VALUES ('a758ad6c-fdc9-4e0e-8c02-938715255547', 'by3ex', '2023-03-31 20:03:16');
INSERT INTO `sys_captcha` VALUES ('a75bf054-1006-4e6a-824b-5035f7a352b7', '7f73n', '2023-07-21 10:52:57');
INSERT INTO `sys_captcha` VALUES ('a78846c1-0921-444f-85ca-5cc4fad6515a', 'npd3c', '2023-07-27 10:01:01');
INSERT INTO `sys_captcha` VALUES ('a79d0f2f-8898-4dd8-8a75-b99c06d8bad1', 'n666p', '2023-07-29 10:11:48');
INSERT INTO `sys_captcha` VALUES ('a7c6f86e-8708-4926-87ce-338a1d4c9c9e', '76fma', '2023-07-15 10:47:13');
INSERT INTO `sys_captcha` VALUES ('a876b100-112a-4478-8dec-dd92eb753e62', '25p36', '2023-07-21 09:01:23');
INSERT INTO `sys_captcha` VALUES ('a8891234-9c64-441d-8874-075682072788', '2ppgb', '2023-08-02 10:30:44');
INSERT INTO `sys_captcha` VALUES ('a8d6954a-7076-4a5f-8a98-777884537cfe', '724ny', '2023-07-20 14:51:29');
INSERT INTO `sys_captcha` VALUES ('a8d73d7f-7a0b-42eb-8ed6-d05d000a7717', '42cxc', '2023-08-01 17:18:31');
INSERT INTO `sys_captcha` VALUES ('a8fcb76b-2d18-4db1-8a03-ea321bf26062', 'p788x', '2023-08-02 10:50:04');
INSERT INTO `sys_captcha` VALUES ('a9abe0da-e9d5-4837-8cd7-fddb4bc5c53d', 'axa36', '2022-12-06 14:50:21');
INSERT INTO `sys_captcha` VALUES ('a9b94086-c89f-4682-8b44-521656f402d8', 'y5g38', '2023-03-04 08:40:51');
INSERT INTO `sys_captcha` VALUES ('a9cdd713-84d5-4adb-8e9f-ea72a34388ff', 'pgn55', '2023-07-25 16:57:58');
INSERT INTO `sys_captcha` VALUES ('aa305b3c-4294-44c7-8809-a4f394962332', '2ngxc', '2023-07-19 11:07:12');
INSERT INTO `sys_captcha` VALUES ('aa406a19-84f0-4760-8cfc-6eb3caf3ec81', 'n5wgm', '2023-07-28 11:15:59');
INSERT INTO `sys_captcha` VALUES ('aa53de1f-1c18-4550-872e-01de678e2ca4', 'a4d44', '2023-03-07 16:08:56');
INSERT INTO `sys_captcha` VALUES ('ab2b9a05-de32-405b-831b-8b4d59347b8b', '446ee', '2023-07-28 11:19:55');
INSERT INTO `sys_captcha` VALUES ('ab683d97-7cba-4708-8de6-0997e77735c5', 'ndnan', '2023-07-26 14:14:35');
INSERT INTO `sys_captcha` VALUES ('ab6899d0-6655-4361-8f87-031f1bfe7ceb', 'wbd4w', '2023-07-24 15:09:54');
INSERT INTO `sys_captcha` VALUES ('abfbef53-0927-469c-8b25-b2ff73ebdfcc', 'f652x', '2023-07-18 14:02:36');
INSERT INTO `sys_captcha` VALUES ('ad21144e-be57-430a-8461-dfa23af6620d', 'np3gy', '2023-07-27 14:57:19');
INSERT INTO `sys_captcha` VALUES ('ad2a684c-85dc-4f85-880c-55ea7b992adc', 'mxy3b', '2023-08-02 10:49:22');
INSERT INTO `sys_captcha` VALUES ('ad4779f6-27de-42d1-8fac-866305dbf027', '2cn4b', '2023-04-09 18:00:11');
INSERT INTO `sys_captcha` VALUES ('ad546582-d1d7-40b3-8f13-eafbcf43b30d', 'c5bwn', '2023-07-18 21:08:10');
INSERT INTO `sys_captcha` VALUES ('adb991aa-d2e0-4d07-8e46-83ea0c4f1143', 'ppaca', '2023-07-18 20:50:57');
INSERT INTO `sys_captcha` VALUES ('add689b5-1bf3-488d-8ebf-7c8c2b128ce1', 'n66b8', '2023-07-27 16:39:57');
INSERT INTO `sys_captcha` VALUES ('aea63725-3859-4fca-8343-ccfc94afe625', 'macdb', '2023-08-01 13:37:13');
INSERT INTO `sys_captcha` VALUES ('aeaf097c-00b7-4d38-85e7-e39fcbf33320', 'f87bb', '2023-07-21 10:07:28');
INSERT INTO `sys_captcha` VALUES ('aede3aee-36e9-4251-81d5-d6588f22e6a2', 'faddb', '2023-07-29 14:23:45');
INSERT INTO `sys_captcha` VALUES ('aefd233e-a452-4492-83b4-1f781bd8a431', 'bwdfg', '2023-07-31 15:20:14');
INSERT INTO `sys_captcha` VALUES ('af2351bb-f737-482a-877e-d413df8e7956', 'y4d63', '2023-03-07 19:23:25');
INSERT INTO `sys_captcha` VALUES ('afc1b05c-d694-47a4-869f-c113cefe1e66', 'nnw2n', '2022-12-21 15:28:06');
INSERT INTO `sys_captcha` VALUES ('afce036f-5618-466b-815d-1fc1becd8c15', 'n2nex', '2023-07-21 14:51:25');
INSERT INTO `sys_captcha` VALUES ('afdcdf2e-2bb6-42d0-8561-ce0f20fa2fbc', '7b6fa', '2023-07-27 11:29:42');
INSERT INTO `sys_captcha` VALUES ('aff24b19-6f4d-4d60-8a79-de7e00ff1d02', 'nfg35', '2022-11-28 20:39:46');
INSERT INTO `sys_captcha` VALUES ('b0cf23c2-69a3-46b7-8b80-d27012e8a14e', 'way45', '2023-07-27 08:59:43');
INSERT INTO `sys_captcha` VALUES ('b1811bd3-c044-4a67-84fa-20792cb0751c', 'dcn5x', '2023-03-23 17:10:52');
INSERT INTO `sys_captcha` VALUES ('b25a896e-2539-4d8b-8bec-f0ff5182522c', 'gp4yw', '2023-07-24 10:28:08');
INSERT INTO `sys_captcha` VALUES ('b2a20115-8c43-4099-84e0-805d78cf1190', '647yb', '2023-07-24 19:55:26');
INSERT INTO `sys_captcha` VALUES ('b3670ff0-b12b-4159-8808-0db521767e63', '2m7cx', '2023-07-28 15:04:08');
INSERT INTO `sys_captcha` VALUES ('b3aa27c9-bf0a-4f84-8225-a7f9ae3e7620', 'xdf4x', '2023-04-07 08:30:11');
INSERT INTO `sys_captcha` VALUES ('b3b9635b-3b26-4b4c-83e7-30cae4411358', 'xagc4', '2023-07-27 09:36:29');
INSERT INTO `sys_captcha` VALUES ('b3d45de5-26c7-4a7a-82ed-8f8bfd4322b9', '6ga36', '2023-07-15 10:53:41');
INSERT INTO `sys_captcha` VALUES ('b3dd4e15-4b09-45a9-8331-090fd6a949f4', 'fngga', '2022-12-05 17:07:53');
INSERT INTO `sys_captcha` VALUES ('b4015600-ce93-4e58-8961-4c6cacc4f1ce', '4gna6', '2023-07-17 16:45:44');
INSERT INTO `sys_captcha` VALUES ('b419b895-25c8-4c31-8e1d-4f1b5393c8f9', 'fndg6', '2023-07-25 11:19:15');
INSERT INTO `sys_captcha` VALUES ('b42936ec-03a6-4177-81a9-d18cb0e7acae', 'emm8x', '2023-05-01 22:50:09');
INSERT INTO `sys_captcha` VALUES ('b48d67d5-7f4b-4580-86d3-cfce79d73bbd', 'p7pa2', '2023-07-28 15:26:09');
INSERT INTO `sys_captcha` VALUES ('b4b6c1da-c2e5-42dd-84d1-34b12d375d8b', 'pfgpm', '2023-07-24 10:46:42');
INSERT INTO `sys_captcha` VALUES ('b4e1a517-cd70-46f6-87fd-6845ac4c7e03', 'w8262', '2023-04-13 16:00:33');
INSERT INTO `sys_captcha` VALUES ('b50440c9-910c-493c-816a-629f88bd194a', 'na25a', '2023-08-02 11:24:42');
INSERT INTO `sys_captcha` VALUES ('b57f04d2-ce34-4180-8129-d840cb419f5c', 'dxaxp', '2023-07-19 13:59:24');
INSERT INTO `sys_captcha` VALUES ('b5a09e13-9aca-4109-8834-c428d72ba927', 'c5625', '2023-08-02 10:15:42');
INSERT INTO `sys_captcha` VALUES ('b5beb92a-dd70-4a94-8e16-ab3f74e341ad', '6w46a', '2023-08-01 11:10:29');
INSERT INTO `sys_captcha` VALUES ('b5e31923-0523-4472-8b24-ca6e70ea5e4c', 'cde56', '2023-07-18 14:09:35');
INSERT INTO `sys_captcha` VALUES ('b6096bdc-8399-4ffc-89a0-946d4ad26d4c', '3d7b5', '2023-03-11 18:34:41');
INSERT INTO `sys_captcha` VALUES ('b63d15f4-21d2-4f5f-8d19-d47861e61c9a', 'fycm4', '2023-07-19 19:03:16');
INSERT INTO `sys_captcha` VALUES ('b693ec4a-6871-4909-81f0-5c4bcba2749b', 'ncx6f', '2023-07-27 10:00:51');
INSERT INTO `sys_captcha` VALUES ('b6f187fd-8d2d-42b6-8c95-d12bc25fd70a', 'a6wda', '2023-07-21 09:23:53');
INSERT INTO `sys_captcha` VALUES ('b807f2dd-35b9-490b-8c8e-e7bf2a8e25f4', 'dbmyw', '2023-07-14 16:17:10');
INSERT INTO `sys_captcha` VALUES ('b8353713-5299-4bd9-83e8-04d3b334f26b', '5dgce', '2023-07-27 10:46:10');
INSERT INTO `sys_captcha` VALUES ('b835cb71-9bf6-4d9b-8cec-0f0c0b56be0f', 'bn3nw', '2023-07-14 16:16:53');
INSERT INTO `sys_captcha` VALUES ('b8898284-7dea-4597-8197-356c447ebf4c', 'w647g', '2023-07-18 18:22:40');
INSERT INTO `sys_captcha` VALUES ('b88ce54c-8af2-4502-8b42-bf1d9c1bfb12', '6ngd8', '2023-07-17 19:39:44');
INSERT INTO `sys_captcha` VALUES ('b9b87dd9-46cc-4a1e-8f09-1e872e972dc4', 'n25cg', '2023-07-20 14:51:32');
INSERT INTO `sys_captcha` VALUES ('ba1c1888-5498-406c-8361-d19dee59f951', 'mpf7y', '2022-11-29 15:28:39');
INSERT INTO `sys_captcha` VALUES ('ba780062-2f54-4007-8f5f-13ca33b5c410', 'n4274', '2023-07-26 13:53:12');
INSERT INTO `sys_captcha` VALUES ('ba9e4b08-81be-4a96-8c01-16bab31b54a1', '8ewff', '2023-07-31 15:53:30');
INSERT INTO `sys_captcha` VALUES ('bb92530a-0d92-41b3-8563-26914e90d7b9', 'ngp7g', '2023-07-25 20:15:06');
INSERT INTO `sys_captcha` VALUES ('bbd93426-0a04-4544-8dc7-e3263dd9a00f', 'wdfnn', '2023-07-03 10:34:25');
INSERT INTO `sys_captcha` VALUES ('bc750279-a035-42cc-81f4-7486f11ef862', 'nxwgn', '2023-03-08 15:03:55');
INSERT INTO `sys_captcha` VALUES ('bc8fdb5b-24c4-4d9b-815f-c4b4473d2bb1', '5dn55', '2023-03-23 15:20:21');
INSERT INTO `sys_captcha` VALUES ('bc995d86-f1f3-4300-84dd-3a172af0e0ff', '8373d', '2023-07-25 16:53:12');
INSERT INTO `sys_captcha` VALUES ('bcaf5a97-f1c7-45bf-8af2-070afbbcdcac', 'cx8ge', '2023-07-24 09:53:01');
INSERT INTO `sys_captcha` VALUES ('bcc8ca7c-422d-4a98-8287-350478b8af2a', '8agbg', '2023-07-17 10:13:03');
INSERT INTO `sys_captcha` VALUES ('bd05f50f-245a-4269-8cf6-9c4efb466d72', '66med', '2023-07-24 15:48:02');
INSERT INTO `sys_captcha` VALUES ('bd24f795-86e7-41f6-8899-15daf151cec1', 'wmcwp', '2023-03-07 10:20:08');
INSERT INTO `sys_captcha` VALUES ('bd521dd0-50cb-4d89-8f90-b2558399c980', '5e4c2', '2023-07-20 19:58:06');
INSERT INTO `sys_captcha` VALUES ('bd66ed3c-d93d-4eb8-8b3b-f7550e012c67', 'nb4gg', '2023-03-13 16:40:13');
INSERT INTO `sys_captcha` VALUES ('bd726c4c-c592-4fd9-8cee-5a227e74b786', 'e7gxa', '2023-08-02 10:16:57');
INSERT INTO `sys_captcha` VALUES ('bd88c75b-d22a-42d0-8a0f-ea8520f694c7', 'dng6a', '2023-07-27 11:00:09');
INSERT INTO `sys_captcha` VALUES ('be0918b2-d0f5-42a9-887e-d3a67dea4821', 'gdb5x', '2023-07-14 20:46:05');
INSERT INTO `sys_captcha` VALUES ('be7b5cd1-0be6-4788-85cf-79dd86bc7b3c', 'xcpww', '2023-07-27 09:51:17');
INSERT INTO `sys_captcha` VALUES ('bedfedab-ac59-44b5-8878-daffedfcb0be', 'eax4e', '2023-07-27 16:00:59');
INSERT INTO `sys_captcha` VALUES ('bee5c99b-71ee-40f7-8b08-d505ad795d82', '5m4xc', '2023-07-17 18:57:58');
INSERT INTO `sys_captcha` VALUES ('bf92d60a-33d0-49c4-8f8f-9501c60766b4', '6825n', '2023-07-21 09:23:47');
INSERT INTO `sys_captcha` VALUES ('bfba2a23-6195-48a2-85b7-8a529d5c206c', 'p2ygc', '2023-03-07 10:41:01');
INSERT INTO `sys_captcha` VALUES ('bfed112d-fa8a-431a-8acc-5e47e8b543b9', '7e3gy', '2023-07-24 10:27:37');
INSERT INTO `sys_captcha` VALUES ('c078ef99-b37c-4592-8bf0-138a77e77efa', 'eaegg', '2023-07-20 19:02:54');
INSERT INTO `sys_captcha` VALUES ('c0813e88-f669-4957-868a-e7ba8d31c43a', 'x68x5', '2023-08-01 10:31:47');
INSERT INTO `sys_captcha` VALUES ('c0c3e15c-871e-42be-81ac-baffc3451109', '4gdyb', '2023-07-27 11:14:08');
INSERT INTO `sys_captcha` VALUES ('c0d78db5-c7e4-443f-86a9-5f2b312ac40d', '2cg5w', '2023-08-01 17:45:46');
INSERT INTO `sys_captcha` VALUES ('c10dc5de-ffbe-4159-8927-c3818a7eea81', 'ppgne', '2023-08-01 20:40:59');
INSERT INTO `sys_captcha` VALUES ('c121c77c-052f-4a42-80ec-fad22d128c67', 'x6x3m', '2023-07-25 14:46:47');
INSERT INTO `sys_captcha` VALUES ('c12b095f-ca36-4e2e-8949-9cc83090c309', 'dcdyy', '2023-07-24 15:48:29');
INSERT INTO `sys_captcha` VALUES ('c137822d-9bcd-4fd1-824b-6cc4c6b97dd0', '3pmfg', '2023-07-28 16:20:59');
INSERT INTO `sys_captcha` VALUES ('c1407fa0-dcae-4d1b-8381-60d4b8140667', 'dayd8', '2023-07-17 10:21:47');
INSERT INTO `sys_captcha` VALUES ('c25e31f1-d964-4162-8767-bbe145e71992', 'dp562', '2023-07-25 08:45:47');
INSERT INTO `sys_captcha` VALUES ('c2a3fd42-8dd6-4dca-8efc-de49853d2b5c', '6empm', '2023-07-28 11:28:03');
INSERT INTO `sys_captcha` VALUES ('c309ed07-4f33-4530-8dd6-d2389a4dcde9', 'nw3g2', '2023-08-01 15:35:18');
INSERT INTO `sys_captcha` VALUES ('c33b9116-fba6-4870-8446-4cfc0f211612', 'xben2', '2023-07-20 09:31:27');
INSERT INTO `sys_captcha` VALUES ('c360f332-262f-4e3a-8f44-6598f66c4b8c', 'wfn7w', '2022-12-06 20:40:05');
INSERT INTO `sys_captcha` VALUES ('c3a6e10b-7415-466f-89ab-fc135e56c3d1', '7dn7m', '2023-07-20 19:58:06');
INSERT INTO `sys_captcha` VALUES ('c3e3cd12-1baf-44dc-85f0-ba8fd73fed84', '85x2p', '2023-05-29 17:20:31');
INSERT INTO `sys_captcha` VALUES ('c3f4b3d0-9af7-449a-821a-96f437f7f860', 'n4byn', '2023-07-25 11:31:52');
INSERT INTO `sys_captcha` VALUES ('c406201d-c45a-4638-871d-7016b5799589', 'a4xan', '2023-07-17 19:39:47');
INSERT INTO `sys_captcha` VALUES ('c40d994e-5ec1-4182-81c3-ccd6199d1670', 'fp6fd', '2023-07-20 15:59:51');
INSERT INTO `sys_captcha` VALUES ('c4684097-74c2-436b-8ed7-d6c76ece17f5', '7xnee', '2023-07-18 14:48:06');
INSERT INTO `sys_captcha` VALUES ('c46eaf58-85d0-49a2-8790-e267e4975c1c', 'eg4a6', '2023-07-18 10:41:37');
INSERT INTO `sys_captcha` VALUES ('c4a260f0-cb69-430c-89de-2557e2411b3b', '3e35d', '2023-07-24 10:10:12');
INSERT INTO `sys_captcha` VALUES ('c5473930-77f5-462e-8959-2c82e4b0f4f8', '4exb5', '2023-07-17 10:00:07');
INSERT INTO `sys_captcha` VALUES ('c624de63-5d5b-4985-8d31-79e4bb1f75c4', 'pwgx4', '2023-07-15 09:05:34');
INSERT INTO `sys_captcha` VALUES ('c628b159-89d0-44c5-8e4c-3a7a8847e14b', 'e45y7', '2023-07-17 10:34:53');
INSERT INTO `sys_captcha` VALUES ('c653d778-bc86-45e6-86a8-6ac2ebcc45e8', 'bmcm4', '2023-07-19 10:27:30');
INSERT INTO `sys_captcha` VALUES ('c703b485-648d-44cc-82e7-2e4f81f706a0', 'yc7m4', '2023-07-17 17:16:41');
INSERT INTO `sys_captcha` VALUES ('c7c454d4-434c-4011-8375-62c1dc539242', 'agey2', '2023-07-29 10:38:52');
INSERT INTO `sys_captcha` VALUES ('c7d9a4bd-a65b-4b1e-8da5-864aed77c8a7', 'mpxm7', '2023-07-27 09:37:07');
INSERT INTO `sys_captcha` VALUES ('c834a5c2-58e7-4b9d-80e1-cc33a64cd081', 'abbe3', '2023-07-24 10:31:48');
INSERT INTO `sys_captcha` VALUES ('c8706074-db2b-4d1d-8229-7f7f52c38fdd', '6wbpg', '2023-08-01 10:52:11');
INSERT INTO `sys_captcha` VALUES ('c901da98-e68a-4acd-875d-719bfb8e69b9', 'gdn26', '2023-07-17 10:01:31');
INSERT INTO `sys_captcha` VALUES ('c949312b-56ec-4a1a-8407-c88641e5945b', 'dgmc5', '2023-08-02 10:51:28');
INSERT INTO `sys_captcha` VALUES ('ca3930d0-c6bd-4398-84a4-5dcd4e556de8', 'dme76', '2022-12-06 17:01:29');
INSERT INTO `sys_captcha` VALUES ('ca64b837-99bc-40c5-8538-7aa6823c4aed', 'mmy5w', '2023-07-26 19:25:17');
INSERT INTO `sys_captcha` VALUES ('ca67ea52-8b9f-4367-81e2-ecdfbbcc440b', 'pg456', '2023-07-29 10:40:41');
INSERT INTO `sys_captcha` VALUES ('ca7d404c-0443-43e6-834f-fa77cc450918', 'yxnab', '2023-03-03 15:04:46');
INSERT INTO `sys_captcha` VALUES ('caa75d91-7bdf-4e50-8aae-94b61f38ed58', '4wx4n', '2023-07-22 09:02:39');
INSERT INTO `sys_captcha` VALUES ('cac9d2fc-2fc0-4e38-82ee-b02d9de0a9af', '8xmc7', '2023-07-25 11:18:32');
INSERT INTO `sys_captcha` VALUES ('cafefa87-bfb5-4559-8660-a1a64814d327', 'y3nyb', '2023-07-26 20:30:49');
INSERT INTO `sys_captcha` VALUES ('cb3efc3e-9003-46d5-86b2-6a3368d971b3', 'gfgnn', '2023-08-01 14:28:25');
INSERT INTO `sys_captcha` VALUES ('cb61be3f-6c50-4324-8cdb-b56cca631e00', 'ebg7n', '2023-07-20 10:36:06');
INSERT INTO `sys_captcha` VALUES ('cb6939de-c600-4e45-8771-eefa8fc53a7c', 'pnw27', '2023-07-18 21:22:01');
INSERT INTO `sys_captcha` VALUES ('cb88098a-9a28-4705-8fc3-87d97fe0b874', 'n52yc', '2023-02-24 11:19:02');
INSERT INTO `sys_captcha` VALUES ('cbb74d3c-792a-4ed9-83e4-1beedb534543', 'e3xad', '2023-07-29 10:12:56');
INSERT INTO `sys_captcha` VALUES ('cbe3c4b2-2d1f-44ad-825c-2ca9fb4b1087', '2x2ed', '2023-07-18 20:51:12');
INSERT INTO `sys_captcha` VALUES ('cc52b4c9-a64b-43bd-8f06-ce9673eea9a7', 'bd386', '2023-07-20 15:55:09');
INSERT INTO `sys_captcha` VALUES ('cc8e917d-26b4-4846-8c6a-fbaf18b04739', 'cbp3e', '2022-12-05 16:32:39');
INSERT INTO `sys_captcha` VALUES ('cc9a1d01-70ed-4259-8ca1-f404f792db1a', '36n2e', '2022-11-29 11:21:46');
INSERT INTO `sys_captcha` VALUES ('cc9d99d9-31f0-4a4f-8ce5-c20b7d415650', '864b4', '2023-07-14 19:08:36');
INSERT INTO `sys_captcha` VALUES ('ccb19f28-e0bf-4938-87a4-20d01b2f02c1', 'ncec6', '2023-08-01 10:52:04');
INSERT INTO `sys_captcha` VALUES ('cd6fe399-5847-422a-84ec-397cfd653d6b', 'dbp8w', '2023-07-24 09:50:44');
INSERT INTO `sys_captcha` VALUES ('ce5a13b5-ebd4-4092-858d-682e33a75a9c', 'nn2d4', '2023-08-01 22:07:31');
INSERT INTO `sys_captcha` VALUES ('ce8e4fab-c22f-414b-8897-9be420f8e13f', 'mb38d', '2023-07-29 09:45:54');
INSERT INTO `sys_captcha` VALUES ('ce95f7dd-b02b-43b4-86e0-44ad15145e25', 'nx2wx', '2023-05-10 10:12:49');
INSERT INTO `sys_captcha` VALUES ('ced78b3e-763a-487f-8f66-8b02fe6290d9', 'nnyd3', '2022-11-26 09:38:14');
INSERT INTO `sys_captcha` VALUES ('cefc4146-5c05-45f8-8826-f78b3151e7c9', 'xbbny', '2023-03-31 08:50:15');
INSERT INTO `sys_captcha` VALUES ('cf368ca0-c600-4846-8782-cbfff2b0b9a3', 'ncedw', '2023-03-17 23:34:46');
INSERT INTO `sys_captcha` VALUES ('cf8d0a94-31f5-4b08-84d3-7a46dbe1de94', 'aecw7', '2023-07-31 16:05:25');
INSERT INTO `sys_captcha` VALUES ('cfabcfc3-31ea-45b0-808d-2149309e6d44', 'ncdc2', '2023-08-01 15:43:11');
INSERT INTO `sys_captcha` VALUES ('d088545c-f9e4-4898-862b-30e886d3ff1f', 'g7mnf', '2023-07-25 14:43:08');
INSERT INTO `sys_captcha` VALUES ('d18b9080-df8d-4334-8e8e-33f1479aad67', 'ygxm6', '2023-07-18 09:21:45');
INSERT INTO `sys_captcha` VALUES ('d19bfe36-ce33-495c-8271-0ec0fc498665', '244wd', '2023-07-25 10:47:54');
INSERT INTO `sys_captcha` VALUES ('d1b067c2-e625-463b-8ea5-e7292768f6dc', 'yp2m8', '2023-07-17 13:45:25');
INSERT INTO `sys_captcha` VALUES ('d2140fe8-740b-4f9c-8f19-13dc2fd68d6a', 'mcn2c', '2023-07-17 17:17:17');
INSERT INTO `sys_captcha` VALUES ('d2c8c8cc-3818-419c-8aed-c947fa9484ef', 'n564x', '2023-07-29 10:57:22');
INSERT INTO `sys_captcha` VALUES ('d2f29492-2fe3-43aa-8a79-0317c0ea2936', 'd2gmx', '2023-03-08 10:10:25');
INSERT INTO `sys_captcha` VALUES ('d3325ea5-18ab-4105-8c68-70a4c77b2d19', 'afenp', '2023-07-21 09:52:12');
INSERT INTO `sys_captcha` VALUES ('d37414a2-1a86-4710-8bea-4f5cd6042852', '4ngan', '2023-07-18 14:11:24');
INSERT INTO `sys_captcha` VALUES ('d3772098-ab0d-4c98-85ea-6fdc3007ef7e', '445f2', '2023-07-15 01:19:23');
INSERT INTO `sys_captcha` VALUES ('d3cd2126-60be-4353-87ee-8d6fc36164be', 'n5bng', '2023-08-01 10:30:27');
INSERT INTO `sys_captcha` VALUES ('d3d3d989-88a2-4b72-89f4-2f5b3b5130ff', 'xaacm', '2023-07-25 09:42:19');
INSERT INTO `sys_captcha` VALUES ('d4708fb2-b93b-4805-871e-e98a6b5c1685', '2pfa8', '2023-08-01 15:42:10');
INSERT INTO `sys_captcha` VALUES ('d4abba7e-b232-4beb-8d5f-78f8b8e44b34', 'd7deb', '2023-03-06 16:54:42');
INSERT INTO `sys_captcha` VALUES ('d4bcce88-035d-4bac-834a-a19c9f3edb48', 'nw5aa', '2023-07-31 09:15:53');
INSERT INTO `sys_captcha` VALUES ('d50a03fa-bf7f-4954-8654-ed7f02d40dc3', '7eanx', '2023-07-27 09:15:31');
INSERT INTO `sys_captcha` VALUES ('d64c526b-75a6-48bc-86b2-b13d8992f86f', 'wp2pw', '2023-05-24 19:13:09');
INSERT INTO `sys_captcha` VALUES ('d681ca02-0ad3-4f86-8bbd-157bdb1f8407', '3fw5a', '2022-12-05 17:07:43');
INSERT INTO `sys_captcha` VALUES ('d6cf833f-f388-4192-8e44-76aa9e76d552', 'mdn3n', '2023-08-01 11:19:29');
INSERT INTO `sys_captcha` VALUES ('d7c52cb0-0064-481b-8d2e-1a2f0bf2ccc6', 'c5xnx', '2023-07-24 14:56:54');
INSERT INTO `sys_captcha` VALUES ('d81c17bb-dbb0-481f-814b-3eb0dbff568f', '4n72d', '2022-11-28 11:36:54');
INSERT INTO `sys_captcha` VALUES ('d86bef0a-3e07-40b9-899f-c6debf79e33d', '83ewe', '2022-11-28 20:41:42');
INSERT INTO `sys_captcha` VALUES ('d88127c2-a256-4740-8c36-4b8fcc47a2a0', '8c755', '2023-08-02 10:11:35');
INSERT INTO `sys_captcha` VALUES ('d8ad0323-b35c-413f-8659-a657db00ba74', '655d7', '2023-03-30 16:07:04');
INSERT INTO `sys_captcha` VALUES ('d94074fb-0c92-4a91-8ae2-2c20e174667b', '53ffa', '2023-07-25 11:10:52');
INSERT INTO `sys_captcha` VALUES ('d978fed3-cf68-4330-83f1-a7145f7cea1f', 'x5g3w', '2023-07-29 09:47:56');
INSERT INTO `sys_captcha` VALUES ('d98db857-0320-47b9-817d-6955cdc6d982', 'n6nx7', '2023-03-31 15:11:12');
INSERT INTO `sys_captcha` VALUES ('da4839f0-0c36-4c2e-836a-dbf78892d8a1', '25by3', '2023-07-27 14:43:05');
INSERT INTO `sys_captcha` VALUES ('da6565ee-475f-4c31-8180-847d46cf4902', '32e53', '2023-07-24 14:24:52');
INSERT INTO `sys_captcha` VALUES ('da6f4f87-441e-40ca-869f-72e9d78d66fc', 'nnfnb', '2023-07-14 21:13:24');
INSERT INTO `sys_captcha` VALUES ('dab53bf7-4dce-4548-85a0-fc4e1cff7221', 'n4555', '2023-07-27 11:15:12');
INSERT INTO `sys_captcha` VALUES ('dab876fa-6656-4c2a-858f-ef6824be4f14', 'nyyye', '2023-05-16 10:50:40');
INSERT INTO `sys_captcha` VALUES ('db1e0376-112c-46c5-82d9-17cbaad9bdab', 'ncwy3', '2023-07-17 10:25:45');
INSERT INTO `sys_captcha` VALUES ('db2ef03d-9e9d-40b1-8746-4187e81fe3f5', 'm6bpg', '2023-07-19 08:52:54');
INSERT INTO `sys_captcha` VALUES ('dbdb3c6a-5278-4a4c-8e05-63d2f2fd6f72', 'pnwyd', '2023-07-27 10:00:44');
INSERT INTO `sys_captcha` VALUES ('dc15aa24-d38d-4960-82e1-f6307f956140', 'nwgne', '2023-07-28 22:43:22');
INSERT INTO `sys_captcha` VALUES ('dc3c15c5-8acf-4b69-8ba3-d75c394dad6f', 'b7p8x', '2023-07-20 18:55:12');
INSERT INTO `sys_captcha` VALUES ('dc672ba9-cae4-49a8-8179-45121e2a8ee5', 'm678x', '2023-07-21 09:10:02');
INSERT INTO `sys_captcha` VALUES ('dcda9777-1538-47b7-8bde-2560902c2bf7', '73yg6', '2023-07-18 14:39:52');
INSERT INTO `sys_captcha` VALUES ('dcde986d-69dc-4072-8edc-3b517a51e145', 'y766a', '2023-07-14 19:51:10');
INSERT INTO `sys_captcha` VALUES ('dd7ef98c-5d28-4756-8643-5e367a188b0b', '32pnp', '2023-07-17 14:14:26');
INSERT INTO `sys_captcha` VALUES ('ddf067cf-b4e8-4e7e-8843-48d5bedbad05', 'anwna', '2023-07-27 10:51:16');
INSERT INTO `sys_captcha` VALUES ('de034f29-1791-4f84-8fc4-2aab275ff44c', '4bx7d', '2022-12-06 14:49:55');
INSERT INTO `sys_captcha` VALUES ('defbb6b9-17c0-48f7-8f1d-6354709c7342', '7fpn2', '2023-02-20 12:35:04');
INSERT INTO `sys_captcha` VALUES ('df1f0129-23cb-4bbd-8af8-c7791bd66652', 'wm5cm', '2023-07-27 10:43:27');
INSERT INTO `sys_captcha` VALUES ('df30682e-cdab-4ba1-8d9b-76504160a234', 'gd4w8', '2023-04-06 16:40:37');
INSERT INTO `sys_captcha` VALUES ('df569ee2-6e34-4428-8b2e-e7e152e36e94', 'nn28n', '2023-07-27 10:00:40');
INSERT INTO `sys_captcha` VALUES ('df7c08db-0420-4107-833d-4d5d5c69997f', 'fepw3', '2022-12-05 16:54:05');
INSERT INTO `sys_captcha` VALUES ('df85e803-5e25-413a-80a2-d346f75f7f19', '3a64b', '2023-03-07 04:53:49');
INSERT INTO `sys_captcha` VALUES ('dff84e8f-e25b-4eec-8ff1-4f0c05626237', 'epmgx', '2023-07-25 10:18:01');
INSERT INTO `sys_captcha` VALUES ('e0b91716-378f-40f9-83da-41741563b9e3', 'wnfnx', '2023-07-18 20:50:35');
INSERT INTO `sys_captcha` VALUES ('e0ecf592-635e-47b9-8e5c-594dec1aaf4e', 'cf445', '2023-07-14 18:33:18');
INSERT INTO `sys_captcha` VALUES ('e0edff9c-d9ce-4d8e-8d15-b45e7231d148', 'npgnx', '2023-07-24 15:12:06');
INSERT INTO `sys_captcha` VALUES ('e16633d7-6cf8-4353-8b59-68df44c3e0ed', 'bf5cf', '2023-07-26 14:31:49');
INSERT INTO `sys_captcha` VALUES ('e185fd5e-f35a-4561-8aaf-04cca78ced23', 'effpd', '2023-07-15 01:18:31');
INSERT INTO `sys_captcha` VALUES ('e1fdd5db-356e-425e-8071-e048f24a45e8', 'dme65', '2023-07-17 17:22:42');
INSERT INTO `sys_captcha` VALUES ('e228d0ef-fd6e-4c8f-8ff7-7d476f8a859b', 'y6x87', '2023-07-20 21:55:39');
INSERT INTO `sys_captcha` VALUES ('e2399435-8837-45be-8269-d1a39b589a1b', '22m22', '2023-03-27 11:17:22');
INSERT INTO `sys_captcha` VALUES ('e2aa0784-66e0-4d78-8d2e-a69df4d7fbdf', 'f76x3', '2023-07-28 11:00:12');
INSERT INTO `sys_captcha` VALUES ('e2ead74a-07dc-4c15-8a98-7944657e47d7', '8nnne', '2023-08-02 10:51:04');
INSERT INTO `sys_captcha` VALUES ('e2efb893-4c07-4adc-8150-c2fe21ff572b', '7x45f', '2023-03-05 17:54:55');
INSERT INTO `sys_captcha` VALUES ('e42988e5-02a3-44a9-8bf8-f5a7c3382161', '3p8bg', '2023-08-02 10:53:23');
INSERT INTO `sys_captcha` VALUES ('e440615f-0fa9-43e5-84e9-0ae0e3668bb4', 'nb3nn', '2023-07-17 19:48:22');
INSERT INTO `sys_captcha` VALUES ('e455bb87-1f18-4345-8216-49d022fce745', 'fefba', '2023-07-21 09:24:36');
INSERT INTO `sys_captcha` VALUES ('e458ffb3-5a22-4c7f-817e-3d1125231304', 'x24y4', '2023-07-26 15:38:39');
INSERT INTO `sys_captcha` VALUES ('e45fba78-2820-4da3-8946-acbd89429988', '78bxn', '2023-03-13 16:50:06');
INSERT INTO `sys_captcha` VALUES ('e48c64d4-2dfd-4f8a-86c3-3037d26449a8', 'ww346', '2023-07-31 17:14:10');
INSERT INTO `sys_captcha` VALUES ('e499bd2e-b84b-437e-8ae6-28e83e53354e', 'p6ex4', '2023-07-21 10:07:35');
INSERT INTO `sys_captcha` VALUES ('e4adc7ee-330b-468d-8232-cc309d6bcb04', 'f777g', '2023-07-21 09:53:18');
INSERT INTO `sys_captcha` VALUES ('e4f27885-c868-4ffc-89b2-9585b607c8d2', 'aawy4', '2023-07-18 10:47:43');
INSERT INTO `sys_captcha` VALUES ('e502a044-69d9-4e61-8ebc-22d397b6832c', 'ennm3', '2023-07-18 15:13:25');
INSERT INTO `sys_captcha` VALUES ('e5663f06-94c5-488f-8538-b2063bb4d1dc', 'nxe2x', '2023-07-21 10:00:28');
INSERT INTO `sys_captcha` VALUES ('e5757a12-7e2b-4b91-866f-12316800d76a', 'w43yw', '2023-08-02 15:07:55');
INSERT INTO `sys_captcha` VALUES ('e61238b2-b7a2-4c6b-8840-015a7950b30a', '45e5d', '2023-07-24 11:22:42');
INSERT INTO `sys_captcha` VALUES ('e68218cf-f41a-4cb0-8407-d76e7abe6834', 'd6fbw', '2023-07-27 09:42:33');
INSERT INTO `sys_captcha` VALUES ('e705f02f-c8f7-4ab3-89b6-19b965cba2ab', '22b7f', '2023-07-26 20:23:39');
INSERT INTO `sys_captcha` VALUES ('e728ecfb-fedc-40ab-8f17-855befbc0802', 'nf258', '2023-03-24 14:43:13');
INSERT INTO `sys_captcha` VALUES ('e7a06eb1-bd6f-4dfd-8e1a-6476a3d004d4', 'gpm7e', '2023-07-14 18:34:36');
INSERT INTO `sys_captcha` VALUES ('e7e05396-01a3-44f1-85af-743617e52aa6', 'd6nyn', '2023-07-18 21:40:31');
INSERT INTO `sys_captcha` VALUES ('e84e1226-340f-41ba-813a-688b2260fdd0', '2px2e', '2023-07-25 10:31:21');
INSERT INTO `sys_captcha` VALUES ('e90108ee-8512-47e0-8022-78f7c98cfb5f', 'ewyeg', '2023-07-17 09:49:44');
INSERT INTO `sys_captcha` VALUES ('e9335fb8-8f25-43f5-8e5d-628e794eec55', 'b3wnd', '2023-07-14 18:35:19');
INSERT INTO `sys_captcha` VALUES ('e9535c53-617f-4bc5-8a56-2b6e169bc936', '8n3ny', '2023-07-27 16:01:04');
INSERT INTO `sys_captcha` VALUES ('e9701a6a-04c1-4402-83a7-3c6b6137678b', 'nxgdn', '2023-03-14 08:40:31');
INSERT INTO `sys_captcha` VALUES ('e9a1b79b-c449-473b-8a5c-027c9599821f', 'ncmmx', '2023-07-27 10:56:24');
INSERT INTO `sys_captcha` VALUES ('e9afc2fc-e845-4965-8d7d-6c43500001b0', '5e5np', '2023-07-18 15:19:50');
INSERT INTO `sys_captcha` VALUES ('e9bede2f-49fa-4f4c-80cf-adf176e5110f', 'nn5a4', '2023-07-21 09:43:14');
INSERT INTO `sys_captcha` VALUES ('ea46b1a0-3d14-4f08-83a8-148c0ed761f9', 'nanyc', '2023-04-03 19:51:42');
INSERT INTO `sys_captcha` VALUES ('ea6127ee-bb3f-4f4b-80c1-29ddc31445e7', 'f2n2g', '2023-07-14 20:09:50');
INSERT INTO `sys_captcha` VALUES ('eabd47c8-5fb3-450b-827e-abd5e9c80fea', 'nw2en', '2023-03-27 08:51:59');
INSERT INTO `sys_captcha` VALUES ('eb5403f3-231c-4a18-80d8-218a8b560ecf', '7y67e', '2023-08-01 10:53:56');
INSERT INTO `sys_captcha` VALUES ('eb67935c-3b01-4254-899e-2e8e7a43d2c9', 'bfnbn', '2023-03-11 08:30:28');
INSERT INTO `sys_captcha` VALUES ('eb8c5956-da27-4def-8e0e-9d31e0fc6823', 'nwd52', '2023-07-27 09:33:32');
INSERT INTO `sys_captcha` VALUES ('ebdab205-f708-4841-8253-8ac46e7e78b6', 'f5md8', '2023-07-14 18:44:43');
INSERT INTO `sys_captcha` VALUES ('ebec9956-af36-402a-845f-eaead9ca692e', 'wmegg', '2023-07-14 20:18:23');
INSERT INTO `sys_captcha` VALUES ('ebfdb2f6-e796-488b-856b-71594e94f83e', '2fw35', '2023-03-06 16:25:07');
INSERT INTO `sys_captcha` VALUES ('ec72d4b0-78bd-4f3b-8790-6945efc9d0b4', 'm3px6', '2023-07-21 09:41:20');
INSERT INTO `sys_captcha` VALUES ('ecec53ab-38e1-4f6e-883e-ae05c82d1315', '2awme', '2023-07-17 13:46:51');
INSERT INTO `sys_captcha` VALUES ('ed78b3eb-7d9d-448e-8268-13c88ceeb618', 'abnxa', '2023-07-17 09:59:47');
INSERT INTO `sys_captcha` VALUES ('ed9fe180-107d-4e2a-88a0-17c3144a6314', 'cdb3n', '2023-07-27 11:40:09');
INSERT INTO `sys_captcha` VALUES ('ee03ed94-a5ac-4b2c-8f2e-56df12566ca5', 'mnpny', '2023-07-25 15:39:05');
INSERT INTO `sys_captcha` VALUES ('ee2145ed-8645-4a0e-82ab-f68a75f409c5', 'yn7e5', '2023-05-17 10:41:03');
INSERT INTO `sys_captcha` VALUES ('ee9bcea7-f92e-4c5e-8da6-219ae17f026c', 'x746x', '2023-07-18 15:05:31');
INSERT INTO `sys_captcha` VALUES ('eec5230e-0ad0-48ca-813d-4426b232cf14', 'mgbyn', '2022-12-08 15:15:04');
INSERT INTO `sys_captcha` VALUES ('eeff556f-2bbc-492b-860e-e0cc834c0104', 'bf4d2', '2023-07-17 10:04:20');
INSERT INTO `sys_captcha` VALUES ('ef2c9399-fbbc-447c-8311-c67657fe5f53', 'cdgg3', '2023-07-17 09:59:47');
INSERT INTO `sys_captcha` VALUES ('ef2f1ad6-cf31-4e5f-8edd-3636e0cfde5c', 'wm7m2', '2023-03-05 13:54:26');
INSERT INTO `sys_captcha` VALUES ('ef562538-c857-49a9-8bb4-696e59bdff7a', 'y27n5', '2023-07-26 20:19:58');
INSERT INTO `sys_captcha` VALUES ('ef6d774e-4a93-4327-8220-f2028dd17ea5', '6dab6', '2023-03-27 08:12:37');
INSERT INTO `sys_captcha` VALUES ('efd9a151-417a-4fb2-84b1-af0b4e756388', 'nnm73', '2023-07-20 09:23:48');
INSERT INTO `sys_captcha` VALUES ('efeb4e0f-69af-43d9-8943-e9bdff5277a1', '4efdg', '2023-05-10 10:14:01');
INSERT INTO `sys_captcha` VALUES ('eff41b80-abe8-4da5-8d8e-07f1454f27d0', 'gx6gg', '2023-07-27 14:42:45');
INSERT INTO `sys_captcha` VALUES ('f04f7948-a23c-494c-8cab-916b2a57d188', 'xcy4a', '2023-08-01 09:42:12');
INSERT INTO `sys_captcha` VALUES ('f07c8916-c45f-4c33-8a0d-1007827e5351', 'nyfx2', '2023-07-26 20:02:26');
INSERT INTO `sys_captcha` VALUES ('f10f55d2-fdb3-435a-84ba-ea7c834016d5', '6wned', '2023-07-21 18:53:06');
INSERT INTO `sys_captcha` VALUES ('f13983da-999f-45b1-8d09-be9db69c1686', 'bnf3a', '2023-07-28 09:15:21');
INSERT INTO `sys_captcha` VALUES ('f1a23a5b-190b-4863-8b0d-95079956f230', 'bd3nn', '2023-07-21 09:51:25');
INSERT INTO `sys_captcha` VALUES ('f1c94a67-ada3-44e5-8f0e-3b94a457fa84', 'weben', '2023-08-01 09:34:07');
INSERT INTO `sys_captcha` VALUES ('f1d4fc83-e6ec-4150-8eba-e2df1fcc478a', 'y3mfx', '2023-07-24 10:37:33');
INSERT INTO `sys_captcha` VALUES ('f203a9cd-f648-4d66-867a-150ace54c026', 'mfpxn', '2023-07-14 19:47:42');
INSERT INTO `sys_captcha` VALUES ('f2774ff9-d861-40f2-8263-cc67d6198405', 'bmm47', '2023-07-29 10:15:36');
INSERT INTO `sys_captcha` VALUES ('f2e3af1b-04a2-47c1-8bf9-745fd1014092', 'wcbeb', '2023-07-30 19:04:26');
INSERT INTO `sys_captcha` VALUES ('f3d7b586-a3a4-4f25-839c-bb89ff055284', 'xea6c', '2023-03-03 09:54:25');
INSERT INTO `sys_captcha` VALUES ('f3fb14c6-05bf-4b9a-85d4-590e908e3b49', '3fpnn', '2023-07-25 16:53:15');
INSERT INTO `sys_captcha` VALUES ('f3ff2796-020e-463a-8d14-e0ecfb49f177', 'aedxp', '2023-03-28 14:32:57');
INSERT INTO `sys_captcha` VALUES ('f43fed38-9ea7-4df8-8c82-06ba56560582', '8max8', '2023-03-14 14:50:48');
INSERT INTO `sys_captcha` VALUES ('f442fc07-82b0-458d-8fa0-6992c25f56d7', '7dfna', '2023-07-21 18:53:42');
INSERT INTO `sys_captcha` VALUES ('f4b008f7-f7e1-4ccf-8072-958e66c59a1e', 'gm6fw', '2023-07-17 10:18:23');
INSERT INTO `sys_captcha` VALUES ('f4f64dc9-157d-4b06-8dd9-008b99ff5465', 'w7nxf', '2023-03-11 18:34:38');
INSERT INTO `sys_captcha` VALUES ('f54099c1-418e-4f27-8c7c-2fd1f9f96924', 'fb36n', '2023-08-02 15:40:33');
INSERT INTO `sys_captcha` VALUES ('f5469c73-e73e-486c-85d2-2ab6d544f7ab', 'fngf3', '2023-03-04 15:54:35');
INSERT INTO `sys_captcha` VALUES ('f57786fb-6b30-47f4-8933-2fa32fe73647', 'nmd8a', '2023-08-01 10:31:29');
INSERT INTO `sys_captcha` VALUES ('f5bedd25-c65c-4fd2-8c2e-ccc00954ccce', '25nxx', '2023-07-26 20:35:47');
INSERT INTO `sys_captcha` VALUES ('f630af67-5a72-403c-82ce-cb9923dd9dea', 'weddm', '2023-07-24 10:10:51');
INSERT INTO `sys_captcha` VALUES ('f63c4660-f6be-47a6-8669-6fff636e45ab', '87c4e', '2023-07-27 11:41:44');
INSERT INTO `sys_captcha` VALUES ('f64498d6-a023-405f-8e7b-ffbadb18679f', '67g3w', '2023-06-02 08:58:18');
INSERT INTO `sys_captcha` VALUES ('f652e2b5-ad56-463c-86f5-fb7b0c88d724', 'wxcnn', '2023-07-17 08:56:30');
INSERT INTO `sys_captcha` VALUES ('f72be0b4-b677-40ed-88e5-47742cbf12b7', 'nf552', '2023-03-04 22:57:28');
INSERT INTO `sys_captcha` VALUES ('f7539579-3884-4d71-8467-475bf3ed8128', 'en3nd', '2023-07-24 14:36:03');
INSERT INTO `sys_captcha` VALUES ('f76d9fbd-12ea-4075-80df-b2f99499420d', 'ndc3g', '2023-08-01 10:53:47');
INSERT INTO `sys_captcha` VALUES ('f7c8f89c-28b6-4ae8-8755-4208b87e282a', 'a2ee3', '2023-07-27 09:35:54');
INSERT INTO `sys_captcha` VALUES ('f7d3c4b0-4cf1-4d99-8666-1ccee18c0c44', 'n6nf3', '2023-07-25 16:53:02');
INSERT INTO `sys_captcha` VALUES ('f7e97775-cd4a-4612-8407-9a5ee526216b', '57fw4', '2023-07-19 20:30:20');
INSERT INTO `sys_captcha` VALUES ('f950213b-2e76-4292-8254-fb4de9b881ff', 'e4wee', '2023-08-01 10:51:32');
INSERT INTO `sys_captcha` VALUES ('f957653d-f459-413d-8d30-654def50fc84', 'debg5', '2023-07-25 14:25:50');
INSERT INTO `sys_captcha` VALUES ('f98e24c3-1cb7-4ae9-880e-ecb56a45e860', '76pem', '2023-07-14 10:10:40');
INSERT INTO `sys_captcha` VALUES ('f9aac6e0-ee70-4011-8603-58f2d2e3d15b', 'c7dcw', '2022-11-28 19:58:28');
INSERT INTO `sys_captcha` VALUES ('fa4d1367-c16e-4b6f-89f7-208e217f860f', 'geg54', '2023-07-14 19:49:51');
INSERT INTO `sys_captcha` VALUES ('fa81ae39-377a-4bba-81ef-b1dd6176215c', 'y7e4p', '2023-07-18 15:10:12');
INSERT INTO `sys_captcha` VALUES ('faa704a4-fed9-4f53-8997-7f1ab1ddc499', 'ffb6x', '2023-07-27 14:43:19');
INSERT INTO `sys_captcha` VALUES ('faaaaa54-ece9-468c-8c0f-e0d713c07e10', '7n33g', '2023-07-27 11:04:28');
INSERT INTO `sys_captcha` VALUES ('fabe7aeb-12c4-4c06-8615-307d94115f3e', 'bnnwn', '2023-07-15 09:29:01');
INSERT INTO `sys_captcha` VALUES ('faf2c76b-e602-4c9f-8dfc-c7e7080d35d9', 'ba5g2', '2023-07-14 20:22:44');
INSERT INTO `sys_captcha` VALUES ('fb28f5c3-fe4d-4303-81eb-50d99134f0e0', 'cecf4', '2023-07-24 10:33:58');
INSERT INTO `sys_captcha` VALUES ('fb44c4eb-cd14-4e95-8fe9-924d9b2caf6a', 'e4446', '2023-07-15 09:39:04');
INSERT INTO `sys_captcha` VALUES ('fc3edd43-57f0-4bfc-8a91-64f63517db55', 'w4fyn', '2023-07-14 16:19:28');
INSERT INTO `sys_captcha` VALUES ('fc443a36-9b25-42cf-84ae-fd196098c5c0', 'afcxp', '2023-07-25 15:29:49');
INSERT INTO `sys_captcha` VALUES ('fc8c65d0-25a7-406c-8ca4-bea44abb3426', 'xx8bx', '2023-07-29 10:06:20');
INSERT INTO `sys_captcha` VALUES ('fc8d5c12-0122-4636-86a5-c6e81d14de43', 'fyg32', '2023-07-18 09:29:14');
INSERT INTO `sys_captcha` VALUES ('fcac5743-2423-44f6-8517-6551452b9e1a', 'ppxwy', '2023-07-27 14:34:55');
INSERT INTO `sys_captcha` VALUES ('fd061e16-476c-422d-82a9-fab0b4ea55e9', 'ynyen', '2023-07-24 08:59:32');
INSERT INTO `sys_captcha` VALUES ('fd179eba-c999-4bbc-8056-c0ecf77a6099', 'byc27', '2023-07-21 16:06:44');
INSERT INTO `sys_captcha` VALUES ('fd442ac1-5e23-4b9b-8af1-8927fd7cc494', '5427d', '2023-07-29 09:03:07');
INSERT INTO `sys_captcha` VALUES ('fe4781fe-9f79-48f5-8977-d11a4ffb3c03', '8can4', '2023-08-01 10:32:04');
INSERT INTO `sys_captcha` VALUES ('fe6eb6f9-bd04-4a21-858b-1b5ccd932fe7', 'wn2n3', '2023-07-14 19:16:26');
INSERT INTO `sys_captcha` VALUES ('fe89ecdf-0038-4e0d-86ae-e8b04d8eaabe', '4x6ma', '2023-07-29 09:47:56');
INSERT INTO `sys_captcha` VALUES ('fee69409-4c96-438d-840a-586f377905ce', 'ndnd4', '2023-03-07 16:30:45');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级部门',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系专业详细信息',
  `dept_type` int(5) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `inx_pid`(`pid`) USING BTREE,
  INDEX `idx_dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 448 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (383, -1, '廊坊市城轨交通技工学校', '廊坊市城轨交通技工学校', 0, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (414, 383, '2023', '廊坊市城轨交通技工学校2023', 2, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (415, 414, '3D打印技术应用', '廊坊市城轨交通技工学校20233D打印技术应用', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (416, 415, '升学2303班', '廊坊市城轨交通技工学校20233D打印技术应用升学2303班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (417, 414, '城市轨道交通运输与管理', '廊坊市城轨交通技工学校2023城市轨道交通运输与管理', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (418, 417, '升学2301班', '廊坊市城轨交通技工学校2023城市轨道交通运输与管理升学2301班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (419, 414, '电子商务', '廊坊市城轨交通技工学校2023电子商务', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (420, 419, '升学2302班', '廊坊市城轨交通技工学校2023电子商务升学2302班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (421, 414, '护理', '廊坊市城轨交通技工学校2023护理', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (422, 421, '升学2302班', '廊坊市城轨交通技工学校2023护理升学2302班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (423, 414, '计算机应用与维修', '廊坊市城轨交通技工学校2023计算机应用与维修', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (424, 423, '升学2302班', '廊坊市城轨交通技工学校2023计算机应用与维修升学2302班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (425, 414, '平面设计', '廊坊市城轨交通技工学校2023平面设计', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (426, 425, '升学2302班', '廊坊市城轨交通技工学校2023平面设计升学2302班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (427, 414, '汽车维修', '廊坊市城轨交通技工学校2023汽车维修', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (428, 427, '升学2301班', '廊坊市城轨交通技工学校2023汽车维修升学2301班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (429, 427, '升学2302班', '廊坊市城轨交通技工学校2023汽车维修升学2302班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (430, 414, '铁路客运服务', '廊坊市城轨交通技工学校2023铁路客运服务', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (431, 430, '综合2301班', '廊坊市城轨交通技工学校2023铁路客运服务综合2301班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (432, 430, '升学2301班', '廊坊市城轨交通技工学校2023铁路客运服务升学2301班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (433, 414, '无人机应用技术', '廊坊市城轨交通技工学校2023无人机应用技术', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (434, 433, '升学2303班', '廊坊市城轨交通技工学校2023无人机应用技术升学2303班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (435, 414, '高铁服务与管理', '廊坊市城轨交通技工学校2023高铁服务与管理', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (436, 414, '幼儿教育', '廊坊市城轨交通技工学校2023幼儿教育', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (437, 414, '新能源汽车', '廊坊市城轨交通技工学校2023新能源汽车', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (438, 414, '新能源汽修', '廊坊市城轨交通技工学校2023新能源汽修', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (439, 414, '新能源', '廊坊市城轨交通技工学校2023新能源', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (442, -1, '浙江理工小学', '浙江理工小学', 0, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (443, 442, '2022', '浙江理工小学2022', 2, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (444, 443, '计算机', '浙江理工小学2022计算机', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (445, 443, '电子', '浙江理工小学2022电子', 1, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (446, 444, '计算机1班', '浙江理工小学2022计算机计算机1班', 3, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dept` VALUES (447, 443, '金融', '浙江理工小学2022金融', 1, NULL, NULL, NULL, NULL, b'0');

-- ----------------------------
-- Table structure for sys_dept_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_type`;
CREATE TABLE `sys_dept_type`  (
  `type_id` bigint(20) NOT NULL,
  `type_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept_type
-- ----------------------------
INSERT INTO `sys_dept_type` VALUES (0, '院校/学校');
INSERT INTO `sys_dept_type` VALUES (1, '专业/系部');
INSERT INTO `sys_dept_type` VALUES (2, '年级');
INSERT INTO `sys_dept_type` VALUES (3, '班级');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 280 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"学员管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":1,\"list\":[]}]', 51, '0:0:0:0:0:0:0:1', '2022-11-17 09:00:42');
INSERT INTO `sys_log` VALUES (2, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"学院管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":1,\"list\":[]}]', 44, '0:0:0:0:0:0:0:1', '2022-11-17 09:01:02');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"管理学院\",\"url\":\"/academy/academy-add-or-update\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 193, '0:0:0:0:0:0:0:1', '2022-11-17 09:04:21');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"管理学院\",\"url\":\"/academy/academy\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 591, '0:0:0:0:0:0:0:1', '2022-11-17 09:07:04');
INSERT INTO `sys_log` VALUES (5, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"管理学院\",\"url\":\"/academy/academy\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 329, '0:0:0:0:0:0:0:1', '2022-11-17 09:07:06');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"管理学院\",\"url\":\"/academy/academy\",\"perms\":\"generator:academy:all\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 36, '0:0:0:0:0:0:0:1', '2022-11-17 09:11:04');
INSERT INTO `sys_log` VALUES (7, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"管理学院\",\"url\":\"/academy/academy\",\"perms\":\"generator:academy:save,generator:academy:delete,generator:academy:list,generator:academy:update\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 49, '0:0:0:0:0:0:0:1', '2022-11-17 09:14:16');
INSERT INTO `sys_log` VALUES (8, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,-666666],\"createTime\":\"Nov 17, 2022 9:15:05 AM\"}]', 1477, '0:0:0:0:0:0:0:1', '2022-11-17 09:15:06');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"查看\",\"url\":\"\",\"perms\":\"generator:academy:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 50, '0:0:0:0:0:0:0:1', '2022-11-17 09:20:46');
INSERT INTO `sys_log` VALUES (10, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"管理学院\",\"url\":\"/academy/academy\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 69, '0:0:0:0:0:0:0:1', '2022-11-17 09:20:56');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"generator:academy:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 83, '0:0:0:0:0:0:0:1', '2022-11-17 09:22:14');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":32,\"name\":\"修改\",\"url\":\"\",\"perms\":\"generator:academy:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 396, '0:0:0:0:0:0:0:1', '2022-11-17 09:40:12');
INSERT INTO `sys_log` VALUES (13, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":32,\"name\":\"删除\",\"url\":\"\",\"perms\":\"generator:academy:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 153, '0:0:0:0:0:0:0:1', '2022-11-17 09:40:34');
INSERT INTO `sys_log` VALUES (14, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"finance\",\"password\":\"198bc01c03b9d29498fabacf015c956b4bb88db836dbbd9897629eb7ff064910\",\"salt\":\"TReNOlIc2p40ONJOrfQp\",\"email\":\"123123123@qq.com\",\"mobile\":\"17877772232\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Nov 17, 2022 10:15:16 AM\"}]', 287, '0:0:0:0:0:0:0:1', '2022-11-17 10:15:17');
INSERT INTO `sys_log` VALUES (15, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"com_finance\",\"remark\":\"集团财务管理\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Nov 17, 2022 10:16:18 AM\"}]', 729, '0:0:0:0:0:0:0:1', '2022-11-17 10:16:20');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"finance\",\"salt\":\"TReNOlIc2p40ONJOrfQp\",\"email\":\"123123123@qq.com\",\"mobile\":\"17877772232\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 755, '0:0:0:0:0:0:0:1', '2022-11-17 10:16:37');
INSERT INTO `sys_log` VALUES (17, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":0,\"name\":\"考生管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"geren\",\"orderNum\":2,\"list\":[]}]', 27, '0:0:0:0:0:0:0:1', '2022-11-21 14:01:50');
INSERT INTO `sys_log` VALUES (18, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"考生列表\",\"url\":\"stutemp/stutemp\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 34, '0:0:0:0:0:0:0:1', '2022-11-21 14:03:10');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":38,\"name\":\"新增\",\"url\":\"\",\"perms\":\"stutemp:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 42, '0:0:0:0:0:0:0:1', '2022-11-21 14:06:41');
INSERT INTO `sys_log` VALUES (20, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":38,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stutemp:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 33, '0:0:0:0:0:0:0:1', '2022-11-21 14:07:01');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"查看\",\"url\":\"\",\"perms\":\"academy:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 39, '0:0:0:0:0:0:0:1', '2022-11-21 14:07:55');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"新增\",\"url\":\"\",\"perms\":\"academy:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 42, '0:0:0:0:0:0:0:1', '2022-11-21 14:08:04');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":32,\"name\":\"修改\",\"url\":\"\",\"perms\":\"academy:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 33, '0:0:0:0:0:0:0:1', '2022-11-21 14:08:13');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":32,\"name\":\"删除\",\"url\":\"\",\"perms\":\"academy:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 43, '0:0:0:0:0:0:0:1', '2022-11-21 14:08:21');
INSERT INTO `sys_log` VALUES (25, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":38,\"name\":\"查询\",\"url\":\"\",\"perms\":\"stutemp:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 35, '0:0:0:0:0:0:0:1', '2022-11-21 14:14:00');
INSERT INTO `sys_log` VALUES (26, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":38,\"name\":\"查看\",\"url\":\"\",\"perms\":\"stutemp:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 39, '0:0:0:0:0:0:0:1', '2022-11-21 14:15:34');
INSERT INTO `sys_log` VALUES (27, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":38,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stutemp:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 38, '0:0:0:0:0:0:0:1', '2022-11-21 14:21:51');
INSERT INTO `sys_log` VALUES (28, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":38,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stutemp:info,stutemp:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 37, '0:0:0:0:0:0:0:1', '2022-11-21 15:33:04');
INSERT INTO `sys_log` VALUES (29, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":31,\"name\":\"部门管理\",\"url\":\"dept/sysdept\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 57, '0:0:0:0:0:0:0:1', '2022-11-22 14:51:46');
INSERT INTO `sys_log` VALUES (30, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":31,\"name\":\"部门管理\",\"url\":\"/dept/sysdept\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 46, '0:0:0:0:0:0:0:1', '2022-11-22 14:52:36');
INSERT INTO `sys_log` VALUES (31, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学院列表\",\"url\":\"/academy/academy\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 37, '0:0:0:0:0:0:0:1', '2022-11-22 14:54:15');
INSERT INTO `sys_log` VALUES (32, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":38,\"name\":\"删除\",\"url\":\"\",\"perms\":\"stutemp:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 43, '0:0:0:0:0:0:0:1', '2022-11-23 19:43:24');
INSERT INTO `sys_log` VALUES (33, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":0,\"name\":\"教务管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"bianji\",\"orderNum\":3,\"list\":[]}]', 29, '0:0:0:0:0:0:0:1', '2022-11-24 14:40:10');
INSERT INTO `sys_log` VALUES (34, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":0,\"name\":\"招生管理\",\"url\":\"/views/modules/recruit\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":4,\"list\":[]}]', 384, '0:0:0:0:0:0:0:1', '2022-11-27 15:32:55');
INSERT INTO `sys_log` VALUES (35, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":0,\"name\":\"招生管理\",\"url\":\"/views/modules/recruit\",\"perms\":\"\",\"type\":0,\"icon\":\"geren\",\"orderNum\":4,\"list\":[]}]', 20, '0:0:0:0:0:0:0:1', '2022-11-27 15:33:07');
INSERT INTO `sys_log` VALUES (36, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":0,\"name\":\"招生管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"geren\",\"orderNum\":4,\"list\":[]}]', 19, '0:0:0:0:0:0:0:1', '2022-11-27 15:33:17');
INSERT INTO `sys_log` VALUES (37, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":45,\"name\":\"招生计划\",\"url\":\"recruit/recruitplansettings\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1,\"list\":[]}]', 29, '0:0:0:0:0:0:0:1', '2022-11-27 15:35:02');
INSERT INTO `sys_log` VALUES (38, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":45,\"name\":\"学生录取缴费信息\",\"url\":\"recruit/recruitadmissionpaymentuseless\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":2,\"list\":[]}]', 29, '0:0:0:0:0:0:0:1', '2022-11-27 15:36:17');
INSERT INTO `sys_log` VALUES (39, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,37,38,39,40,41,43,44,45,46,47,-666666]}]', 1448, '0:0:0:0:0:0:0:1', '2022-11-27 15:37:59');
INSERT INTO `sys_log` VALUES (40, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,37,38,39,40,41,43,44,45,46,47,-666666]}]', 889, '0:0:0:0:0:0:0:1', '2022-11-27 15:38:01');
INSERT INTO `sys_log` VALUES (41, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,37,38,39,40,41,43,44,45,46,47,-666666]}]', 1002, '0:0:0:0:0:0:0:1', '2022-11-27 15:38:21');
INSERT INTO `sys_log` VALUES (42, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":45,\"name\":\"招生计划\",\"url\":\"recruitplan/recruitplansettings\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1,\"list\":[]}]', 28, '0:0:0:0:0:0:0:1', '2022-11-27 15:39:50');
INSERT INTO `sys_log` VALUES (43, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":37,\"name\":\"招生计划\",\"url\":\"recruitplan/recruitplansettings.vue\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2022-11-27 15:42:04');
INSERT INTO `sys_log` VALUES (44, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[48]', 49, '0:0:0:0:0:0:0:1', '2022-11-27 15:42:20');
INSERT INTO `sys_log` VALUES (45, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":46,\"name\":\"新增\",\"url\":\"\",\"perms\":\"recruitplan:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 30, '0:0:0:0:0:0:0:1', '2022-11-27 15:44:40');
INSERT INTO `sys_log` VALUES (46, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":46,\"name\":\"修改\",\"url\":\"\",\"perms\":\"recruitplan:info,recruitplan:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 32, '0:0:0:0:0:0:0:1', '2022-11-27 15:46:36');
INSERT INTO `sys_log` VALUES (47, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":46,\"name\":\"查看\",\"url\":\"\",\"perms\":\"recruitplansettings:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 243, '0:0:0:0:0:0:0:1', '2022-11-27 15:48:22');
INSERT INTO `sys_log` VALUES (48, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":46,\"name\":\"删除\",\"url\":\"\",\"perms\":\"recruitplansettings:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 28, '0:0:0:0:0:0:0:1', '2022-11-27 15:49:02');
INSERT INTO `sys_log` VALUES (49, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,37,38,39,40,41,43,44,45,46,49,50,51,52,47,-666666]}]', 1393, '0:0:0:0:0:0:0:1', '2022-11-27 15:49:57');
INSERT INTO `sys_log` VALUES (50, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":46,\"name\":\"新增\",\"url\":\"\",\"perms\":\"recruitplansettings:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2022-11-27 15:54:53');
INSERT INTO `sys_log` VALUES (51, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":52,\"parentId\":46,\"name\":\"删除\",\"url\":\"\",\"perms\":\"recruitplansettings:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2022-11-27 15:55:12');
INSERT INTO `sys_log` VALUES (52, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":50,\"parentId\":46,\"name\":\"修改\",\"url\":\"\",\"perms\":\"recruitplansrttings:info,recruitplansrttings:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 27, '0:0:0:0:0:0:0:1', '2022-11-27 16:00:15');
INSERT INTO `sys_log` VALUES (53, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":0,\"name\":\"招生管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":4,\"list\":[]}]', 17, '0:0:0:0:0:0:0:1', '2022-11-27 16:00:44');
INSERT INTO `sys_log` VALUES (54, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":45,\"name\":\"招生计划\",\"url\":\"recruitplan/recruitplansettings\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":1,\"list\":[]}]', 25, '0:0:0:0:0:0:0:1', '2022-11-27 16:00:59');
INSERT INTO `sys_log` VALUES (55, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":47,\"name\":\"新增\",\"url\":\"\",\"perms\":\"recruitadmissionpaymentuseless:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 77, '0:0:0:0:0:0:0:1', '2022-11-27 16:29:06');
INSERT INTO `sys_log` VALUES (56, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":47,\"name\":\"修改\",\"url\":\"\",\"perms\":\"recruitadmissionpaymentuseless:info,recruitadmissionpaymentuseless:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2022-11-27 16:29:47');
INSERT INTO `sys_log` VALUES (57, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":47,\"name\":\"查看\",\"url\":\"\",\"perms\":\"recruitadmissionpaymentuseless:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2022-11-27 16:30:07');
INSERT INTO `sys_log` VALUES (58, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":47,\"name\":\"删除\",\"url\":\"\",\"perms\":\"recruitadmissionpaymentuseless:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2022-11-27 16:30:25');
INSERT INTO `sys_log` VALUES (59, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":50,\"parentId\":46,\"name\":\"修改\",\"url\":\"\",\"perms\":\"recruitplansettings:info,recruitplansettings:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 35, '0:0:0:0:0:0:0:1', '2022-11-27 16:45:40');
INSERT INTO `sys_log` VALUES (60, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":42,\"name\":\"新增\",\"url\":\"\",\"perms\":\"sysdept:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 52, '0:0:0:0:0:0:0:1', '2022-11-28 10:22:01');
INSERT INTO `sys_log` VALUES (61, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":44,\"name\":\"班级分配\",\"url\":\"stuclassinfo/getStuClassList\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 31, '0:0:0:0:0:0:0:1', '2022-11-28 14:07:25');
INSERT INTO `sys_log` VALUES (62, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":58,\"parentId\":44,\"name\":\"班级分配\",\"url\":\"assignclass/stubaseinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 45, '0:0:0:0:0:0:0:1', '2022-11-28 14:37:46');
INSERT INTO `sys_log` VALUES (63, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":58,\"name\":\"新增\",\"url\":\"\",\"perms\":\"stubaseinfo:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 28, '0:0:0:0:0:0:0:1', '2022-11-28 15:14:29');
INSERT INTO `sys_log` VALUES (64, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":59,\"parentId\":58,\"name\":\"新增\",\"url\":\"\",\"perms\":\"stubaseinfo:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 243, '0:0:0:0:0:0:0:1', '2022-11-28 15:14:46');
INSERT INTO `sys_log` VALUES (65, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":60,\"parentId\":58,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stubaseinfo:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 25, '0:0:0:0:0:0:0:1', '2022-11-28 15:15:11');
INSERT INTO `sys_log` VALUES (66, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":61,\"parentId\":46,\"name\":\"查看\",\"url\":\"\",\"perms\":\"stubaseinfo:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 26, '0:0:0:0:0:0:0:1', '2022-11-28 15:15:39');
INSERT INTO `sys_log` VALUES (67, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":62,\"parentId\":58,\"name\":\"删除\",\"url\":\"\",\"perms\":\"stubaseinfo:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 463, '0:0:0:0:0:0:0:1', '2022-11-28 15:16:02');
INSERT INTO `sys_log` VALUES (68, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":61,\"parentId\":58,\"name\":\"查看\",\"url\":\"\",\"perms\":\"stubaseinfo:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 28, '0:0:0:0:0:0:0:1', '2022-11-28 15:16:15');
INSERT INTO `sys_log` VALUES (69, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":61,\"parentId\":58,\"name\":\"查看\",\"url\":\"\",\"perms\":\"stubaseinfo:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 28, '0:0:0:0:0:0:0:1', '2022-11-28 15:16:15');
INSERT INTO `sys_log` VALUES (70, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":59,\"parentId\":58,\"name\":\"新增\",\"url\":\"\",\"perms\":\"stuclassinfo:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 168, '0:0:0:0:0:0:0:1', '2022-11-29 09:43:16');
INSERT INTO `sys_log` VALUES (71, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":60,\"parentId\":58,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stuclassinfo:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 88, '0:0:0:0:0:0:0:1', '2022-11-29 09:43:26');
INSERT INTO `sys_log` VALUES (72, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":61,\"parentId\":58,\"name\":\"查看\",\"url\":\"\",\"perms\":\"stuclassinfo:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 164, '0:0:0:0:0:0:0:1', '2022-11-29 09:43:34');
INSERT INTO `sys_log` VALUES (73, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":62,\"parentId\":58,\"name\":\"删除\",\"url\":\"\",\"perms\":\"stuclassinfo:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 125, '0:0:0:0:0:0:0:1', '2022-11-29 09:43:43');
INSERT INTO `sys_log` VALUES (74, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":63,\"parentId\":45,\"name\":\"学生导批量入\",\"url\":\"stuimport/stuimport\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 567, '0:0:0:0:0:0:0:1', '2022-11-29 11:14:39');
INSERT INTO `sys_log` VALUES (75, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":64,\"parentId\":63,\"name\":\"导入学生信息\",\"url\":\"\",\"perms\":\"studentimport:import\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 727, '0:0:0:0:0:0:0:1', '2022-11-29 11:18:53');
INSERT INTO `sys_log` VALUES (76, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,45,46,49,50,51,52,47,53,54,55,56,63,64,-666666]}]', 10869, '0:0:0:0:0:0:0:1', '2022-11-30 14:31:13');
INSERT INTO `sys_log` VALUES (77, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,45,46,49,50,51,52,47,53,54,55,56,63,64,-666666]}]', 10199, '0:0:0:0:0:0:0:1', '2022-11-30 14:31:15');
INSERT INTO `sys_log` VALUES (78, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":63,\"parentId\":45,\"name\":\"学生导批量入\",\"url\":\"stuimport/stuimport\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 347, '0:0:0:0:0:0:0:1', '2022-11-30 18:36:32');
INSERT INTO `sys_log` VALUES (79, 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[[1]]', 125, '0:0:0:0:0:0:0:1', '2022-12-05 14:49:58');
INSERT INTO `sys_log` VALUES (80, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":65,\"parentId\":0,\"name\":\"财务管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"sql\",\"orderNum\":2,\"list\":[]}]', 30, '0:0:0:0:0:0:0:1', '2022-12-05 16:11:14');
INSERT INTO `sys_log` VALUES (81, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":66,\"parentId\":65,\"name\":\"贫困减免标准设置\",\"url\":\"/finance/reduce_set\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 45, '0:0:0:0:0:0:0:1', '2022-12-05 16:12:46');
INSERT INTO `sys_log` VALUES (82, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":66,\"parentId\":65,\"name\":\"贫困减免标准设置\",\"url\":\"/finance/reduce_set/reducelisteco\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 43, '0:0:0:0:0:0:0:1', '2022-12-05 16:13:20');
INSERT INTO `sys_log` VALUES (83, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":60,\"parentId\":58,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stuclassinfo:update;stuclassinfo:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 645, '0:0:0:0:0:0:0:1', '2022-12-05 20:04:06');
INSERT INTO `sys_log` VALUES (84, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":60,\"parentId\":58,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stuclassinfo:update;stuclassinfo:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 363, '0:0:0:0:0:0:0:1', '2022-12-05 20:04:07');
INSERT INTO `sys_log` VALUES (85, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":60,\"parentId\":58,\"name\":\"修改\",\"url\":\"\",\"perms\":\"stuclassinfo:update,stuclassinfo:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 225, '0:0:0:0:0:0:0:1', '2022-12-05 20:16:44');
INSERT INTO `sys_log` VALUES (86, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"zhw\",\"password\":\"9ba03c48265743d070f68a3a6b3d6b2c8445f7c121233029e86b3797f068799e\",\"salt\":\"T2LZwusXtr9Q0OVgsVD7\",\"email\":\"1478@qq.com\",\"mobile\":\"15757575757\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 6, 2022 2:18:31 PM\"}]', 134, '0:0:0:0:0:0:0:1', '2022-12-06 14:18:32');
INSERT INTO `sys_log` VALUES (87, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,-666666]}]', 1528, '0:0:0:0:0:0:0:1', '2022-12-06 14:19:18');
INSERT INTO `sys_log` VALUES (88, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"com_finance\",\"remark\":\"集团财务管理\",\"createUserId\":1,\"menuIdList\":[65,66,-666666]}]', 136, '0:0:0:0:0:0:0:1', '2022-12-06 14:23:52');
INSERT INTO `sys_log` VALUES (89, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":66,\"parentId\":65,\"name\":\"贫困减免标准设置\",\"url\":\"/finance/reduce_set/reducelisteco\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":1,\"list\":[]}]', 47, '0:0:0:0:0:0:0:1', '2022-12-06 15:38:53');
INSERT INTO `sys_log` VALUES (90, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":67,\"parentId\":65,\"name\":\"收费标准设置\",\"url\":\"/finance/fee_standard/feestandard\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 51, '0:0:0:0:0:0:0:1', '2022-12-06 15:39:59');
INSERT INTO `sys_log` VALUES (91, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":65,\"name\":\"免学费减免标准设置\",\"url\":\"/finance-reduce_set\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 102, '0:0:0:0:0:0:0:1', '2022-12-06 16:52:57');
INSERT INTO `sys_log` VALUES (92, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":65,\"name\":\"免学费减免标准设置\",\"url\":\"/finance/reduce_set\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 50, '0:0:0:0:0:0:0:1', '2022-12-06 16:53:07');
INSERT INTO `sys_log` VALUES (93, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":65,\"name\":\"免学费减免标准设置\",\"url\":\"/finance/reduce_set/reduceliststipend\",\"perms\":\"\",\"type\":1,\"icon\":\"shezhi\",\"orderNum\":0,\"list\":[]}]', 48, '0:0:0:0:0:0:0:1', '2022-12-06 16:53:58');
INSERT INTO `sys_log` VALUES (94, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":65,\"name\":\"免学费减免标准设置\",\"url\":\"/finance/reduce_set/reduceliststipend\",\"perms\":\"\",\"type\":1,\"icon\":\"sql\",\"orderNum\":0,\"list\":[]}]', 133, '0:0:0:0:0:0:0:1', '2022-12-06 16:54:12');
INSERT INTO `sys_log` VALUES (95, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"zsf\",\"password\":\"419f3b93cb39864e0eb97317f53b76e5023538c32366b55e434835fd51aabb60\",\"salt\":\"ebhWbMQZwfIpxXhGMuiv\",\"email\":\"123456@qq.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 6, 2022 4:57:29 PM\"}]', 285, '0:0:0:0:0:0:0:1', '2022-12-06 16:57:30');
INSERT INTO `sys_log` VALUES (96, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,-666666]}]', 2574, '0:0:0:0:0:0:0:1', '2022-12-06 16:58:17');
INSERT INTO `sys_log` VALUES (97, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":5,\"username\":\"lzq\",\"password\":\"87cce442be069535e5a051fcff0b2efd4765fc3f239f7a3fb33421292ea58c3d\",\"salt\":\"zEPnHREpsWhrOcClNIzQ\",\"email\":\"11@qq.com\",\"mobile\":\"18555555555\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 6, 2022 9:12:30 PM\"}]', 152, '0:0:0:0:0:0:0:1', '2022-12-06 21:12:31');
INSERT INTO `sys_log` VALUES (98, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":69,\"parentId\":65,\"name\":\"学杂费收支管理\",\"url\":\"/finance/fee_school_sundry/feeschoolsundry\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 42, '0:0:0:0:0:0:0:1', '2022-12-08 14:02:56');
INSERT INTO `sys_log` VALUES (99, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":70,\"parentId\":65,\"name\":\"培训费收支管理\",\"url\":\"/finance/fee_train_in_out/feetraininout\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 306, '0:0:0:0:0:0:0:1', '2022-12-08 14:14:00');
INSERT INTO `sys_log` VALUES (100, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":6,\"username\":\"zbl\",\"password\":\"3c97d150baa004f160bfe0fd716620e33a7fa8af8d47c38b543bd20191da8270\",\"salt\":\"0zd5xTpMdtCoXhGdtJRA\",\"email\":\"123123@qq.com\",\"mobile\":\"15757289944\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 8, 2022 2:22:26 PM\"}]', 371, '0:0:0:0:0:0:0:1', '2022-12-08 14:22:27');
INSERT INTO `sys_log` VALUES (101, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,-666666]}]', 1663, '0:0:0:0:0:0:0:1', '2022-12-08 14:22:45');
INSERT INTO `sys_log` VALUES (102, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,-666666]}]', 1979, '0:0:0:0:0:0:0:1', '2022-12-08 14:22:47');
INSERT INTO `sys_log` VALUES (103, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":7,\"username\":\"ac\",\"password\":\"0574abd197c809f52b06d1c6fe56e0d1f4901fa85a9570f62305390d2aca4dad\",\"salt\":\"xSIuXZgrWt6C8A9K9z1j\",\"email\":\"123456@qq.com\",\"mobile\":\"13561111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 8, 2022 3:11:09 PM\"}]', 211, '0:0:0:0:0:0:0:1', '2022-12-08 15:11:10');
INSERT INTO `sys_log` VALUES (104, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":8,\"username\":\"xra\",\"password\":\"bbf5612f67c4f88fdf0a4eb5b00a06d6c5f18f2196ba50f750447169b14b3664\",\"salt\":\"krB2lMyaiV54LtIFNnhW\",\"email\":\"123123@qq.com\",\"mobile\":\"13588888888\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 8, 2022 3:13:58 PM\"}]', 218, '0:0:0:0:0:0:0:1', '2022-12-08 15:13:58');
INSERT INTO `sys_log` VALUES (105, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":9,\"username\":\"cel\",\"password\":\"f0b3363352397948747081c47c556972f9efedc99453f70914311ea4f648902f\",\"salt\":\"fYL6UHDolql9kDv8DbdR\",\"email\":\"123123@qq.com\",\"mobile\":\"15757222222\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 8, 2022 3:14:40 PM\"}]', 106, '0:0:0:0:0:0:0:1', '2022-12-08 15:14:41');
INSERT INTO `sys_log` VALUES (106, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"academy1_finance\",\"remark\":\"测试院校1_财务管理\",\"createUserId\":1,\"menuIdList\":[65,66,67,68,69,70,-666666]}]', 550, '0:0:0:0:0:0:0:1', '2022-12-12 10:58:19');
INSERT INTO `sys_log` VALUES (107, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"finance\",\"salt\":\"TReNOlIc2p40ONJOrfQp\",\"email\":\"123123123@qq.com\",\"mobile\":\"17877772232\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 144, '0:0:0:0:0:0:0:1', '2022-12-12 10:58:31');
INSERT INTO `sys_log` VALUES (108, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":10,\"username\":\"school02\",\"password\":\"796d74b77579dd578595180616cf24a93cdc7e094c42e7136dc72cd20c66e360\",\"salt\":\"oi5RUQNV2P1KX45RAh12\",\"email\":\"123@qq.com\",\"mobile\":\"18444444444\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 12, 2022 7:27:51 PM\"}]', 426, '0:0:0:0:0:0:0:1', '2022-12-12 19:27:52');
INSERT INTO `sys_log` VALUES (109, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":11,\"username\":\"test\",\"password\":\"b494996fd18fe76a062054c0ec0867f0e5369564043678bf1d845ed630361eb6\",\"salt\":\"dHx0tBoBeHz8B5yeEXhN\",\"email\":\"123123@qq.com\",\"mobile\":\"15757277777\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 12, 2022 7:32:15 PM\"}]', 17068, '0:0:0:0:0:0:0:1', '2022-12-12 19:32:15');
INSERT INTO `sys_log` VALUES (110, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[11]]', 29, '0:0:0:0:0:0:0:1', '2022-12-12 19:32:31');
INSERT INTO `sys_log` VALUES (111, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":12,\"username\":\"aaa\",\"password\":\"59c0630027fe79b392c29fd33923ae7b954913caf36bdf93dab0652651f0a936\",\"salt\":\"aQWUJO8NdItv75T5wNog\",\"email\":\"132132@qq.com\",\"mobile\":\"13131313131\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 12, 2022 7:34:19 PM\",\"academyId\":4}]', 10517, '0:0:0:0:0:0:0:1', '2022-12-12 19:34:21');
INSERT INTO `sys_log` VALUES (112, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[12]]', 23, '0:0:0:0:0:0:0:1', '2022-12-12 19:34:29');
INSERT INTO `sys_log` VALUES (113, 'xra', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":72,\"parentId\":0,\"name\":\"创美伟业子公司\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":3,\"list\":[]}]', 99, '0:0:0:0:0:0:0:1', '2023-01-06 19:16:45');
INSERT INTO `sys_log` VALUES (114, 'xra', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":72,\"parentId\":0,\"name\":\"创美伟业子公司\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":5,\"list\":[]}]', 95, '0:0:0:0:0:0:0:1', '2023-01-06 19:17:23');
INSERT INTO `sys_log` VALUES (115, 'xra', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":73,\"parentId\":72,\"name\":\"实习情况查询\",\"url\":\"/stuwork/inemstuinternship\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0,\"list\":[]}]', 129, '0:0:0:0:0:0:0:1', '2023-01-06 19:19:17');
INSERT INTO `sys_log` VALUES (116, 'xra', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":74,\"parentId\":72,\"name\":\"就业情况查询\",\"url\":\"/stuwork/inememployedsturecord\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0,\"list\":[]}]', 142, '0:0:0:0:0:0:0:1', '2023-01-06 19:20:18');
INSERT INTO `sys_log` VALUES (117, 'xra', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":75,\"parentId\":65,\"name\":\"111\",\"url\":\"/11\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 129, '0:0:0:0:0:0:0:1', '2023-01-06 19:23:01');
INSERT INTO `sys_log` VALUES (118, 'xra', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[75]', 223, '0:0:0:0:0:0:0:1', '2023-01-06 19:23:19');
INSERT INTO `sys_log` VALUES (119, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":76,\"parentId\":58,\"name\":\"批量分配\",\"url\":\"\",\"perms\":\"stuclassinfo:batchsave\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 108, '0:0:0:0:0:0:0:1', '2023-01-07 10:12:31');
INSERT INTO `sys_log` VALUES (120, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":58,\"parentId\":44,\"name\":\"班级分配\",\"url\":\"assignclass/stuclassinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 110, '0:0:0:0:0:0:0:1', '2023-01-13 16:48:12');
INSERT INTO `sys_log` VALUES (121, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":62,\"parentId\":58,\"name\":\"删除\",\"url\":\"\",\"perms\":\"\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 102, '0:0:0:0:0:0:0:1', '2023-01-13 16:50:23');
INSERT INTO `sys_log` VALUES (122, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":62,\"parentId\":58,\"name\":\"删除\",\"url\":\"\",\"perms\":\"stuclassinfo:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 100, '0:0:0:0:0:0:0:1', '2023-01-13 16:50:58');
INSERT INTO `sys_log` VALUES (123, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":62,\"parentId\":58,\"name\":\"删除\",\"url\":\"\",\"perms\":\"\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 109, '0:0:0:0:0:0:0:1', '2023-01-13 17:09:55');
INSERT INTO `sys_log` VALUES (124, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":62,\"parentId\":58,\"name\":\"删除\",\"url\":\"\",\"perms\":\"stuclassinfo:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 113, '0:0:0:0:0:0:0:1', '2023-01-13 17:22:07');
INSERT INTO `sys_log` VALUES (125, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":77,\"parentId\":65,\"name\":\"招生回扣项设置\",\"url\":\"/fee_enroll_teacher/entertypelist\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0,\"list\":[]}]', 311, '0:0:0:0:0:0:0:1', '2023-01-17 13:43:24');
INSERT INTO `sys_log` VALUES (126, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":77,\"parentId\":65,\"name\":\"招生回扣项设置\",\"url\":\"/finance/fee_enroll_teacher/entertypelist\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0,\"list\":[]}]', 328, '0:0:0:0:0:0:0:1', '2023-01-17 13:46:23');
INSERT INTO `sys_log` VALUES (127, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":78,\"parentId\":0,\"name\":\"学生管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 48, '0:0:0:0:0:0:0:1', '2023-01-17 14:11:29');
INSERT INTO `sys_log` VALUES (128, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":79,\"parentId\":78,\"name\":\"学生列表\",\"url\":\"/student/stubaseinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 79, '0:0:0:0:0:0:0:1', '2023-01-17 14:12:39');
INSERT INTO `sys_log` VALUES (129, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,72,73,74,78,79,-666666]}]', 3619, '0:0:0:0:0:0:0:1', '2023-02-17 09:13:03');
INSERT INTO `sys_log` VALUES (130, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,72,73,74,78,79,-666666]}]', 2655, '0:0:0:0:0:0:0:1', '2023-02-17 09:13:05');
INSERT INTO `sys_log` VALUES (131, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,72,73,74,78,79,-666666]}]', 5421, '0:0:0:0:0:0:0:1', '2023-02-17 09:13:08');
INSERT INTO `sys_log` VALUES (132, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,72,73,74,78,79,-666666]}]', 6526, '0:0:0:0:0:0:0:1', '2023-02-17 09:13:11');
INSERT INTO `sys_log` VALUES (133, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,72,73,74,78,79,-666666]}]', 9043, '0:0:0:0:0:0:0:1', '2023-02-17 09:13:14');
INSERT INTO `sys_log` VALUES (134, 'zhw', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":80,\"parentId\":65,\"name\":\"生成支付列表\",\"url\":\"/finance/fee_stu_needpay/fee_stu_needpay\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":7,\"list\":[]}]', 169, '0:0:0:0:0:0:0:1', '2023-02-28 14:42:54');
INSERT INTO `sys_log` VALUES (135, 'zhw', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":80,\"parentId\":65,\"name\":\"生成支付列表\",\"url\":\"/finance/fee_stu_needpay/fee_stu_needpay\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0,\"list\":[]}]', 139, '0:0:0:0:0:0:0:1', '2023-02-28 14:43:26');
INSERT INTO `sys_log` VALUES (136, 'zhw', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":80,\"parentId\":65,\"name\":\"生成支付列表\",\"url\":\"/finance/fee_stu_needpay/feestuneedpay\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0,\"list\":[]}]', 610, '0:0:0:0:0:0:0:1', '2023-02-28 14:45:40');
INSERT INTO `sys_log` VALUES (137, 'zhw', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[80]', 1189, '0:0:0:0:0:0:0:1', '2023-02-28 14:49:00');
INSERT INTO `sys_log` VALUES (138, 'zhw', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":81,\"parentId\":65,\"name\":\"生成支付列表\",\"url\":\"/finance/fee_stu_needpay/feestuneedpay\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0,\"list\":[]}]', 809, '0:0:0:0:0:0:0:1', '2023-02-28 14:50:00');
INSERT INTO `sys_log` VALUES (139, 'zhw', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":81,\"parentId\":65,\"name\":\"生成支付列表\",\"url\":\"/finance/fee_stu_needpay/feestuneedpay\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 75, '0:0:0:0:0:0:0:1', '2023-02-28 14:51:42');
INSERT INTO `sys_log` VALUES (140, 'zhw', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":81,\"parentId\":65,\"name\":\"生成支付列表\",\"url\":\"/finance/fee_stu_needpay/feestuneedpay\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]', 70, '0:0:0:0:0:0:0:1', '2023-02-28 14:51:43');
INSERT INTO `sys_log` VALUES (141, 'zhw', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":81,\"parentId\":65,\"name\":\"生成支付列表\",\"url\":\"/finance/fee_stu_needpay/feestuneedpay\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 55, '0:0:0:0:0:0:0:1', '2023-02-28 14:54:28');
INSERT INTO `sys_log` VALUES (142, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"zhw\",\"salt\":\"T2LZwusXtr9Q0OVgsVD7\",\"email\":\"1478@qq.com\",\"mobile\":\"15757575757\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"academyId\":-1}]', 376, '0:0:0:0:0:0:0:1', '2023-02-28 14:55:53');
INSERT INTO `sys_log` VALUES (143, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,81,72,73,74,78,79,-666666]}]', 3044, '0:0:0:0:0:0:0:1', '2023-03-01 09:34:11');
INSERT INTO `sys_log` VALUES (144, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"academy1_finance\",\"remark\":\"测试院校1_财务管理\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,57,65,66,67,68,69,70,71,77,81,-666666]}]', 107, '112.10.129.172', '2023-03-06 16:43:55');
INSERT INTO `sys_log` VALUES (145, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":11,\"username\":\"testaca1\",\"password\":\"c4a282af0200b1d445b2974a0c6f348ad99f614eab9b127c606f0f04248e714f\",\"salt\":\"vSDmxo5ev4ALYAMo4PQP\",\"email\":\"123232323@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Mar 8, 2023 3:14:34 PM\",\"academyId\":1}]', 484, '0:0:0:0:0:0:0:1', '2023-03-08 15:14:35');
INSERT INTO `sys_log` VALUES (146, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"password\":\"31abdee2bfd78897c4c009931a42d72b6deba64e7b41ff1777a4bb20641dc330\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"academyId\":-1}]', 92, '112.10.129.127', '2023-03-13 16:12:23');
INSERT INTO `sys_log` VALUES (147, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":12,\"username\":\"liboyu\",\"password\":\"133e1ebd006816b52d32ab99e8d58ca775fb12c35d9e2da189d05e44c4c0122f\",\"salt\":\"Yy4mHQYvcBYKNny2kaOm\",\"email\":\"570766467@qq.com\",\"mobile\":\"18010109690\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Mar 13, 2023 4:30:43 PM\",\"academyId\":-1}]', 8, '123.123.200.186', '2023-03-13 16:30:44');
INSERT INTO `sys_log` VALUES (148, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"liboyu\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,81,72,73,74,78,79,-666666],\"createTime\":\"Mar 13, 2023 4:40:55 PM\"}]', 43, '123.123.200.186', '2023-03-13 16:40:55');
INSERT INTO `sys_log` VALUES (149, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":12,\"username\":\"liboyu\",\"password\":\"133e1ebd006816b52d32ab99e8d58ca775fb12c35d9e2da189d05e44c4c0122f\",\"salt\":\"Yy4mHQYvcBYKNny2kaOm\",\"email\":\"570766467@qq.com\",\"mobile\":\"18010109690\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"academyId\":-1}]', 7, '123.123.200.186', '2023-03-13 16:45:29');
INSERT INTO `sys_log` VALUES (150, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":4,\"roleName\":\"张树喜\",\"remark\":\"廊坊校区总管理员\",\"createUserId\":1,\"menuIdList\":[15,16,17,19,20,21,23,24,25,33,34,42,57,39,41,59,61,49,51,53,55,63,64,72,73,74,78,79,-666666,1,2,3,4,31,32,37,38,44,58,45,46,47],\"createTime\":\"Mar 23, 2023 3:15:50 PM\"}]', 192, '123.123.200.186', '2023-03-23 15:15:51');
INSERT INTO `sys_log` VALUES (151, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":13,\"username\":\"zhangshuxi\",\"password\":\"656dceb55f6e08fb5257cd5b236bd209403071e53cadc7a1bd3c59113b75ed55\",\"salt\":\"9oHJzIqh1gY4zqi4fuGj\",\"email\":\"jaewonleez@163.com\",\"mobile\":\"13403163805\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Mar 23, 2023 3:22:45 PM\",\"academyId\":24}]', 39, '123.123.200.186', '2023-03-23 15:22:46');
INSERT INTO `sys_log` VALUES (152, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"张树喜\",\"remark\":\"廊坊校区总管理员\",\"createUserId\":1,\"menuIdList\":[15,16,17,19,20,21,23,24,25,33,34,35,42,57,39,59,49,53,63,64,78,79,-666666,1,2,3,4,31,32,37,38,44,58,45,46,47]}]', 27, '123.123.200.186', '2023-03-23 15:28:05');
INSERT INTO `sys_log` VALUES (153, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"张树喜\",\"remark\":\"廊坊校区总管理员\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,81,78,79,-666666,1]}]', 38, '123.123.200.186', '2023-03-24 10:19:14');
INSERT INTO `sys_log` VALUES (154, 'zhangshuxi', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,41,61,51,55,-666666,31,32,37,38,44,58,45,46,47],\"createTime\":\"Mar 24, 2023 12:36:50 PM\"}]', 15, '110.251.43.78', '2023-03-24 12:36:51');
INSERT INTO `sys_log` VALUES (155, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,41,61,51,55,81,78,79,-666666,31,32,37,38,44,58,45,46,47,65]}]', 14, '101.75.211.51', '2023-03-24 12:37:10');
INSERT INTO `sys_log` VALUES (156, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,41,61,51,55,71,81,78,79,-666666,31,32,37,38,44,58,45,46,47,65]}]', 14, '110.251.43.78', '2023-03-24 12:37:42');
INSERT INTO `sys_log` VALUES (157, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[19,23,33,41,61,51,55,71,81,78,79,-666666,1,3,4,31,32,37,38,44,58,45,46,47,65]}]', 17, '101.75.211.51', '2023-03-24 12:37:57');
INSERT INTO `sys_log` VALUES (158, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[19,33,41,61,51,55,71,81,78,79,-666666,1,3,31,32,37,38,44,58,45,46,47,65]}]', 19, '101.75.211.51', '2023-03-24 12:38:47');
INSERT INTO `sys_log` VALUES (159, 'zhangshuxi', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":22,\"roleName\":\"中层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,34,35,42,57,37,38,39,40,41,43,49,50,51,53,54,55,63,64,78,79,-666666,31,32,45,46,47],\"createTime\":\"Mar 24, 2023 12:40:36 PM\"}]', 17, '101.75.211.51', '2023-03-24 12:40:36');
INSERT INTO `sys_log` VALUES (160, 'zhangshuxi', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":23,\"roleName\":\"财务\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,42,57,41,61,51,53,54,55,65,66,67,68,69,70,71,77,81,78,79,-666666,31,32,37,38,44,58,45,46,47],\"createTime\":\"Mar 24, 2023 12:41:26 PM\"}]', 18, '101.75.211.51', '2023-03-24 12:41:26');
INSERT INTO `sys_log` VALUES (161, 'zhangshuxi', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":24,\"roleName\":\"班主任\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,39,40,41,51,53,54,55,63,64,78,79,-666666,31,32,37,38,45,46,47],\"createTime\":\"Mar 24, 2023 12:42:13 PM\"}]', 15, '110.251.43.78', '2023-03-24 12:42:13');
INSERT INTO `sys_log` VALUES (162, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":22,\"roleName\":\"中层学管领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,34,35,42,57,37,38,39,40,41,43,49,50,51,53,54,55,63,64,78,79,-666666,31,32,45,46,47]}]', 18, '101.75.211.51', '2023-03-24 12:42:41');
INSERT INTO `sys_log` VALUES (163, 'zhangshuxi', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":25,\"roleName\":\"中层教务领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,51,55,71,81,78,79,-666666,45,46,47,65],\"createTime\":\"Mar 24, 2023 12:43:59 PM\"}]', 20, '110.251.43.78', '2023-03-24 12:44:00');
INSERT INTO `sys_log` VALUES (164, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":14,\"username\":\"xujingwen\",\"password\":\"30e099ec6055ceb9ce1b52474cc17d56ff8a8f558efdfcbbedab5632270a63d0\",\"salt\":\"JoPEaUtiXmVrFnyuvpqs\",\"email\":\"1051477010@qq.com\",\"mobile\":\"18811484558\",\"status\":1,\"roleIdList\":[25],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 12:45:26 PM\",\"academyId\":-1}]', 6, '101.75.211.51', '2023-03-24 12:45:26');
INSERT INTO `sys_log` VALUES (165, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":14,\"username\":\"许瀞文\",\"salt\":\"JoPEaUtiXmVrFnyuvpqs\",\"email\":\"1051477010@qq.com\",\"mobile\":\"18811484558\",\"status\":1,\"roleIdList\":[25],\"createUserId\":13,\"academyId\":-1}]', 8, '101.75.211.51', '2023-03-24 12:49:30');
INSERT INTO `sys_log` VALUES (166, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":15,\"username\":\"齐玉海\",\"password\":\"f7f09de19ff7a69ad76b931f604ae2bfedc2f240ffb870bb47232f85e4c59644\",\"salt\":\"f4V0P65EAbgBS651x8h6\",\"email\":\"1@1.com\",\"mobile\":\"18946066995\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 1:52:05 PM\",\"academyId\":-1}]', 5, '110.251.43.244', '2023-03-24 13:52:05');
INSERT INTO `sys_log` VALUES (167, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":16,\"username\":\"孙其刚\",\"password\":\"0e9ea4e124f7531c7a92ec1d9915b4fa761d1d826ea62c8691dea1c86c143f8b\",\"salt\":\"RbkyV1qowlR2Q6CBxJHd\",\"email\":\"1@1.com\",\"mobile\":\"13903375758\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 1:52:35 PM\",\"academyId\":-1}]', 6, '110.251.43.244', '2023-03-24 13:52:35');
INSERT INTO `sys_log` VALUES (168, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":17,\"username\":\"李艳光\",\"password\":\"605391866ac02aebfe23e4d1f4bb849bac600adb73f24e39a0af4e1d806dc203\",\"salt\":\"EvSxJUjlXLFJvPefZGE4\",\"email\":\"1@1.com\",\"mobile\":\"15810150906\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 1:53:09 PM\",\"academyId\":-1}]', 6, '110.251.43.244', '2023-03-24 13:53:10');
INSERT INTO `sys_log` VALUES (169, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":18,\"username\":\"姚俊岭\",\"password\":\"4850dfe04dd0edc78c1f943c63970fcf8db1c67eb771a33d29ef4e16c6b9534b\",\"salt\":\"kgqViKjtYqBYqsfsoYai\",\"email\":\"1@1.com\",\"mobile\":\"18533606909\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 1:53:32 PM\",\"academyId\":-1}]', 5, '110.251.43.244', '2023-03-24 13:53:32');
INSERT INTO `sys_log` VALUES (170, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":19,\"username\":\"常亮\",\"password\":\"96dbe181147492214c443b4bb2e9de835939d705e3b6ec74ffecc382d72bb2ac\",\"salt\":\"BV9kVxlJoNFnCOHDucIV\",\"email\":\"1@1.com\",\"mobile\":\"13811313202\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 1:54:00 PM\",\"academyId\":-1}]', 7, '110.251.43.244', '2023-03-24 13:54:01');
INSERT INTO `sys_log` VALUES (171, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":20,\"username\":\"明月阳\",\"password\":\"ee5152215ffbdc297bbc3ce0199f4598067e114dad24a57b2f6ae5e98ef7a397\",\"salt\":\"8ZPu5mKwHyDW1T5wi0H6\",\"email\":\"1@1.com\",\"mobile\":\"17611656611\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 1:54:55 PM\",\"academyId\":-1}]', 6, '110.251.43.244', '2023-03-24 13:54:56');
INSERT INTO `sys_log` VALUES (172, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":21,\"username\":\"苏洁\",\"password\":\"4d45efbb731b212c61bbffa467df5b4bdd1140987ebb808b19de0745a2f0d909\",\"salt\":\"JCzJal87gDhQMsaVkEdd\",\"email\":\"1@1.com\",\"mobile\":\"13521160994\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 1:55:22 PM\",\"academyId\":-1}]', 5, '110.251.43.244', '2023-03-24 13:55:23');
INSERT INTO `sys_log` VALUES (173, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":14,\"username\":\"许瀞文\",\"salt\":\"JoPEaUtiXmVrFnyuvpqs\",\"email\":\"1051477010@qq.com\",\"mobile\":\"18811484558\",\"status\":1,\"roleIdList\":[25],\"createUserId\":13,\"academyId\":-1}]', 7, '110.251.43.244', '2023-03-24 14:14:47');
INSERT INTO `sys_log` VALUES (174, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":14,\"username\":\"许瀞文\",\"salt\":\"JoPEaUtiXmVrFnyuvpqs\",\"email\":\"1051477010@qq.com\",\"mobile\":\"18811484558\",\"status\":1,\"roleIdList\":[25],\"createUserId\":13,\"academyId\":34}]', 115, '110.251.43.78', '2023-03-24 16:03:39');
INSERT INTO `sys_log` VALUES (175, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"username\":\"齐玉海\",\"salt\":\"f4V0P65EAbgBS651x8h6\",\"email\":\"1@1.com\",\"mobile\":\"18946066995\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"academyId\":34}]', 7, '110.251.43.78', '2023-03-24 16:03:44');
INSERT INTO `sys_log` VALUES (176, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":16,\"username\":\"孙其刚\",\"salt\":\"RbkyV1qowlR2Q6CBxJHd\",\"email\":\"1@1.com\",\"mobile\":\"13903375758\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"academyId\":34}]', 6, '110.251.43.78', '2023-03-24 16:03:49');
INSERT INTO `sys_log` VALUES (177, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":17,\"username\":\"李艳光\",\"salt\":\"EvSxJUjlXLFJvPefZGE4\",\"email\":\"1@1.com\",\"mobile\":\"15810150906\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"academyId\":34}]', 7, '110.251.43.78', '2023-03-24 16:03:55');
INSERT INTO `sys_log` VALUES (178, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":18,\"username\":\"姚俊岭\",\"salt\":\"kgqViKjtYqBYqsfsoYai\",\"email\":\"1@1.com\",\"mobile\":\"18533606909\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"academyId\":34}]', 7, '101.75.211.51', '2023-03-24 16:04:20');
INSERT INTO `sys_log` VALUES (179, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":19,\"username\":\"常亮\",\"salt\":\"BV9kVxlJoNFnCOHDucIV\",\"email\":\"1@1.com\",\"mobile\":\"13811313202\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"academyId\":34}]', 7, '101.75.211.51', '2023-03-24 16:04:25');
INSERT INTO `sys_log` VALUES (180, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":21,\"username\":\"苏洁\",\"salt\":\"JCzJal87gDhQMsaVkEdd\",\"email\":\"1@1.com\",\"mobile\":\"13521160994\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"academyId\":34}]', 6, '101.75.211.51', '2023-03-24 16:04:30');
INSERT INTO `sys_log` VALUES (181, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":20,\"username\":\"明月阳\",\"salt\":\"8ZPu5mKwHyDW1T5wi0H6\",\"email\":\"1@1.com\",\"mobile\":\"17611656611\",\"status\":1,\"roleIdList\":[21],\"createUserId\":13,\"academyId\":34}]', 7, '101.75.211.51', '2023-03-24 16:04:35');
INSERT INTO `sys_log` VALUES (182, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":22,\"username\":\"于寒茹\",\"password\":\"d7a9f9d861c412e89e63960824f5596488c76ae2ca33594084e84d701d39c092\",\"salt\":\"6DIEhZ8KV9JCKEO3oInn\",\"email\":\"1@1.com\",\"mobile\":\"18833687866\",\"status\":1,\"roleIdList\":[23],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 4:18:29 PM\",\"academyId\":34}]', 8, '110.251.43.78', '2023-03-24 16:18:30');
INSERT INTO `sys_log` VALUES (183, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":23,\"username\":\"孟丽坤\",\"password\":\"8aa6ff164e81cb4fc00c43a0faba55640ad52a942baca977ff7025ea9e7a1c5a\",\"salt\":\"IDyYKUP9l1aPjojaQcAj\",\"email\":\"1@1.com\",\"mobile\":\"17695453772\",\"status\":1,\"roleIdList\":[23],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 4:18:56 PM\",\"academyId\":34}]', 6, '110.251.43.78', '2023-03-24 16:18:57');
INSERT INTO `sys_log` VALUES (184, 'zhangshuxi', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":26,\"roleName\":\"招生处\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[41,61,46,49,50,51,52,55,78,79,-666666,37,38,44,58,45,47],\"createTime\":\"Mar 24, 2023 4:21:30 PM\"}]', 30, '110.251.43.78', '2023-03-24 16:21:30');
INSERT INTO `sys_log` VALUES (185, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":24,\"username\":\"张子怡\",\"password\":\"804d4cb2eedf70a11e87607b2df480f6ef1996ebcab473bacf17e7edb093be6e\",\"salt\":\"94V81YYgMehJBT1409ys\",\"email\":\"1@1.com\",\"mobile\":\"17610303193\",\"status\":1,\"roleIdList\":[26],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 4:21:58 PM\",\"academyId\":34}]', 7, '101.75.211.51', '2023-03-24 16:21:59');
INSERT INTO `sys_log` VALUES (186, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":25,\"username\":\"周秀清\",\"password\":\"975794e5fb2f8c0c96ec8b46069baeefec0cd08c4528de9f20d19595d5e82536\",\"salt\":\"JijfkEecKDmzp0RvFuHx\",\"email\":\"1@1.com\",\"mobile\":\"13363166511\",\"status\":1,\"roleIdList\":[26],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 4:22:22 PM\",\"academyId\":-1}]', 6, '110.251.43.78', '2023-03-24 16:22:22');
INSERT INTO `sys_log` VALUES (187, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":26,\"username\":\"郑媛\",\"password\":\"75bd178f201b8b1e3e55bad30976eb1828a45fd179185bfd3b56a564168838da\",\"salt\":\"8Ox4dfmZGukRZugJl53b\",\"email\":\"1@1.com\",\"mobile\":\"15731621164\",\"status\":1,\"roleIdList\":[26],\"createUserId\":13,\"createTime\":\"Mar 24, 2023 4:22:43 PM\",\"academyId\":-1}]', 6, '101.75.211.51', '2023-03-24 16:22:43');
INSERT INTO `sys_log` VALUES (188, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":26,\"username\":\"王兴华\",\"salt\":\"8Ox4dfmZGukRZugJl53b\",\"email\":\"1@1.com\",\"mobile\":\"15383960303\",\"status\":1,\"roleIdList\":[26],\"createUserId\":13,\"academyId\":-1}]', 7, '101.75.211.51', '2023-03-27 08:05:33');
INSERT INTO `sys_log` VALUES (189, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":12,\"username\":\"liboyu\",\"salt\":\"Yy4mHQYvcBYKNny2kaOm\",\"email\":\"570766467@qq.com\",\"mobile\":\"18010109690\",\"status\":1,\"roleIdList\":[3,24],\"createUserId\":1,\"academyId\":34}]', 6, '123.123.200.186', '2023-03-27 08:39:02');
INSERT INTO `sys_log` VALUES (190, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":12,\"username\":\"liboyu\",\"salt\":\"Yy4mHQYvcBYKNny2kaOm\",\"email\":\"570766467@qq.com\",\"mobile\":\"18010109690\",\"status\":1,\"roleIdList\":[24],\"createUserId\":1,\"academyId\":34}]', 6, '123.123.200.186', '2023-03-27 08:41:35');
INSERT INTO `sys_log` VALUES (191, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":27,\"username\":\"赵攀越\",\"password\":\"6680bc56695fa859c84a495b99e9416032b2559958aa81f7cbb7b4372d209d1b\",\"salt\":\"oa1ej0qERukV9zD9Hswx\",\"email\":\"1@1.com\",\"mobile\":\"15931663411\",\"status\":1,\"roleIdList\":[],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:37:13 AM\",\"academyId\":-1}]', 5, '101.75.210.4', '2023-03-27 09:37:14');
INSERT INTO `sys_log` VALUES (192, 'zhangshuxi', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":28,\"roleName\":\"管理\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[31,32,33,34,35,36,42,57,37,38,39,40,41,43,44,58,59,60,61,62,76,45,46,49,50,51,52,47,53,54,55,56,63,64,65,66,67,68,69,70,71,77,81,78,79,-666666],\"createTime\":\"Mar 27, 2023 9:37:41 AM\"}]', 28, '101.75.210.4', '2023-03-27 09:37:41');
INSERT INTO `sys_log` VALUES (193, 'zhangshuxi', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":27,\"username\":\"赵攀越\",\"salt\":\"oa1ej0qERukV9zD9Hswx\",\"email\":\"1@1.com\",\"mobile\":\"15931663411\",\"status\":1,\"roleIdList\":[28],\"createUserId\":13,\"academyId\":-1}]', 5, '101.75.210.4', '2023-03-27 09:38:05');
INSERT INTO `sys_log` VALUES (194, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":28,\"username\":\"孙晨\",\"password\":\"835262977fdb43be829650214849fd8ac4b51378a99f19e4e22aff2eaf9623ec\",\"salt\":\"HBamTke3SXePXvb1Ppt6\",\"email\":\"1@1.com\",\"mobile\":\"15530607203\",\"status\":1,\"roleIdList\":[23],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:55:48 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 09:55:48');
INSERT INTO `sys_log` VALUES (195, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":29,\"username\":\"邙达\",\"password\":\"0dc6e054ae5d88b9be05349395ce93931105e928b3916f26a8734edadb4da165\",\"salt\":\"4lsfrfCsmmzPMjD4otLQ\",\"email\":\"1@1.com\",\"mobile\":\"17631711157\",\"status\":1,\"roleIdList\":[22],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:56:56 AM\",\"academyId\":-1}]', 7, '110.251.43.244', '2023-03-27 09:56:56');
INSERT INTO `sys_log` VALUES (196, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":30,\"username\":\"姚晨旭\",\"password\":\"948f0c38295ba976a48e63f646671020564ea69c2bd33fad52ed7ff35d649350\",\"salt\":\"CPikFiXgxLzZsYyK0P1I\",\"email\":\"1@1.com\",\"mobile\":\"17695533021\",\"status\":1,\"roleIdList\":[22],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:57:24 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 09:57:25');
INSERT INTO `sys_log` VALUES (197, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":31,\"username\":\"张佳琳\",\"password\":\"50fbfc43ae42dd20ae62f7e982d825e605ea0fd8e2d015f00cbbeb6eb2abd168\",\"salt\":\"d8RYdDqF6vUxv95oi0rf\",\"email\":\"1@1.com\",\"mobile\":\"18733678000\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:58:04 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 09:58:04');
INSERT INTO `sys_log` VALUES (198, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":32,\"username\":\"李奕霖\",\"password\":\"f5e12a7f93316bde8f88eb3106e1903475721abaca0698c2955f7f783ec7f1e3\",\"salt\":\"Z25dPkqVDbVi1QChKF4m\",\"email\":\"1@1.com\",\"mobile\":\"13831695066\",\"status\":1,\"roleIdList\":[22],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:58:36 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 09:58:36');
INSERT INTO `sys_log` VALUES (199, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":33,\"username\":\"王峥尧\",\"password\":\"fb89ed17f8f6377e09594fd94fdd83146268f6dc3c6f15611e174fbe15bdb851\",\"salt\":\"WqEfnYswJ3xgQ1BHqman\",\"email\":\"1@1.com\",\"mobile\":\"15103363043\",\"status\":1,\"roleIdList\":[22],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:59:05 AM\",\"academyId\":34}]', 7, '110.251.43.244', '2023-03-27 09:59:05');
INSERT INTO `sys_log` VALUES (200, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":34,\"username\":\"刘德胜\",\"password\":\"aa24ea123fc2e122f675c38a8fd1162aa43a1386b6d5d09b1cd5580464a88ba5\",\"salt\":\"7uARuLbmTZ3pxCEc4DUP\",\"email\":\"1@1.com\",\"mobile\":\"17692346628\",\"status\":1,\"roleIdList\":[22],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:59:26 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 09:59:27');
INSERT INTO `sys_log` VALUES (201, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":35,\"username\":\"杨荣朝\",\"password\":\"78171e2935d7020f5926f39d6eac236e60a9b9504cfc22b62c54198a2566d1b5\",\"salt\":\"8c9xHmobkmjKaf3TtvHp\",\"email\":\"1@1.com\",\"mobile\":\"18332598638\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 9:59:56 AM\",\"academyId\":34}]', 7, '110.251.43.244', '2023-03-27 09:59:56');
INSERT INTO `sys_log` VALUES (202, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":36,\"username\":\"杨慧\",\"password\":\"48b4fe0e0da4d41d1a012418b92e5dba35424529de153deae41e756899cd7c82\",\"salt\":\"Zi3XxmZkuoMj59TCz2Ch\",\"email\":\"1@1.com\",\"mobile\":\"18846131976\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:00:37 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 10:00:37');
INSERT INTO `sys_log` VALUES (203, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":37,\"username\":\"闫秀萍\",\"password\":\"d5a4e64ca85ef3015a2c9af255927b3aac6e9d1ae3df39d16bf969d874a275b1\",\"salt\":\"SReuCztdBE6nXHaBMChm\",\"email\":\"1@1.com\",\"mobile\":\"13671331528\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:01:10 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 10:01:10');
INSERT INTO `sys_log` VALUES (204, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":38,\"username\":\"朱金凤\",\"password\":\"b5034cf3c943015f40a7ab68535ec4dbe167643d4aa20299a27790538e8b34fd\",\"salt\":\"FmZAvYZ86oHTz9B1MJQ2\",\"email\":\"1@1.com\",\"mobile\":\"16604345148\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:01:51 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:01:51');
INSERT INTO `sys_log` VALUES (205, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":39,\"username\":\"王志民\",\"password\":\"297bfb00cc3e61dc95603165abd7fc1b7cee16147defdca8288d7b048be79e91\",\"salt\":\"4yIg5mUwq6RyrgwhtmrI\",\"email\":\"1@1.com\",\"mobile\":\"13130945621\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:02:11 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:02:11');
INSERT INTO `sys_log` VALUES (206, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":40,\"username\":\"赵婉辰\",\"password\":\"d4198aefb671b79b1065d7c711b9cff037f2b484a9edc96cd24ea2c4efb148f5\",\"salt\":\"JXxObbzAznF7YKd38OHf\",\"email\":\"1@1.com\",\"mobile\":\"18104108346\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:03:01 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:03:02');
INSERT INTO `sys_log` VALUES (207, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":41,\"username\":\"王丽萍\",\"password\":\"ba1cc712a08d5aab16378609766dbb3337839aecd2c60e7e8517f4656f82b61a\",\"salt\":\"81T1W60TnI9GY5lmP2S4\",\"email\":\"1@1.com\",\"mobile\":\"15075693300\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:03:38 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 10:03:38');
INSERT INTO `sys_log` VALUES (208, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":42,\"username\":\"朱新宇\",\"password\":\"c077876f15122d3142994306b5ea979135d4dd7262111c2926c4dc219331511c\",\"salt\":\"rCxI8fxZhRmvDv6ioeYb\",\"email\":\"1@1.com\",\"mobile\":\"18153534034\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:04:42 AM\",\"academyId\":34}]', 7, '110.251.43.244', '2023-03-27 10:04:42');
INSERT INTO `sys_log` VALUES (209, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":43,\"username\":\"盛朝强\",\"password\":\"3950f48612764eb99e45ece14c93b906fdc6db7d0903ddb4d6443565f3260a91\",\"salt\":\"sn62Jl46mBofjjClGeCz\",\"email\":\"1@1.com\",\"mobile\":\"18531665566\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:05:30 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 10:05:30');
INSERT INTO `sys_log` VALUES (210, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":44,\"username\":\"李立民\",\"password\":\"ee17df4d5a864ba83a59dc2bff0bd5cdd99e14e2f3956892438536c3187873db\",\"salt\":\"VZbuNC1Y33VSyQ5sF7ix\",\"email\":\"1@1.com\",\"mobile\":\"13933920221\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:06:25 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:06:25');
INSERT INTO `sys_log` VALUES (211, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":45,\"username\":\"徐诗涵\",\"password\":\"91ae0e428f8d9e3504f841356ab4a839903c20f317eaea935f3d24a85dee1332\",\"salt\":\"RiHMnYPy6JxVR0pRzW3A\",\"email\":\"1@1.com\",\"mobile\":\"15632625186\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:06:57 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 10:06:57');
INSERT INTO `sys_log` VALUES (212, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":46,\"username\":\"苏鹏\",\"password\":\"be16d17fdc9d9c1b1e410fb550e120a28842e41e5317fe1ab92b77d820ef2649\",\"salt\":\"fJZvliZn47HhDU4Myqs8\",\"email\":\"1@1.com\",\"mobile\":\"13102258657\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:07:24 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 10:07:24');
INSERT INTO `sys_log` VALUES (213, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":47,\"username\":\"安晶晶\",\"password\":\"8f09f2ffec54083dfa67ad257f1c154550866f8a798d3add24e2d431fc5a8533\",\"salt\":\"r8R34hK1YNFh0S4Cc0cQ\",\"email\":\"1@1.com\",\"mobile\":\"17695557632\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:07:53 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:07:53');
INSERT INTO `sys_log` VALUES (214, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":48,\"username\":\"付骞\",\"password\":\"63bac3ea422606c0ce3ac1239d38ae4e1c2b4c0669d3aeef573dfa77d4bca943\",\"salt\":\"kt9ucjZ2LhPrzaWlZgvo\",\"email\":\"1@1.com\",\"mobile\":\"17631624712\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:08:39 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:08:39');
INSERT INTO `sys_log` VALUES (215, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":49,\"username\":\"张旭聪\",\"password\":\"7e4b7f88bd958150b348d0318a57770caf2c3f78c01673e3a16222a62a0ca3a4\",\"salt\":\"qTTcnfbOtAOWK8iGVKXL\",\"email\":\"1@1.com\",\"mobile\":\"15232926695\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:11:48 AM\",\"academyId\":34}]', 5, '101.30.126.29', '2023-03-27 10:11:49');
INSERT INTO `sys_log` VALUES (216, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":50,\"username\":\"史同书\",\"password\":\"72c9f6106176e8446116cbc6b8f8e4cc491dd48397e86844c2b6176529f37941\",\"salt\":\"MjEh3rI9bjRnbJwoGYR5\",\"email\":\"1@1.com\",\"mobile\":\"17610231707\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:12:16 AM\",\"academyId\":34}]', 6, '101.30.126.29', '2023-03-27 10:12:16');
INSERT INTO `sys_log` VALUES (217, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":51,\"username\":\"丁天媛\",\"password\":\"c254885d91855f6b507345da25d9af6a27efe79dba92163585f259d8a8e4c33b\",\"salt\":\"iKY7p3EBKtpGQhMEsIjj\",\"email\":\"1@1.com\",\"mobile\":\"16621122161\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:12:45 AM\",\"academyId\":34}]', 7, '101.30.126.29', '2023-03-27 10:12:45');
INSERT INTO `sys_log` VALUES (218, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":52,\"username\":\"赵晶莹\",\"password\":\"409c4ac401024eaed4d3dcf6a25672c87dce3c63c44bb794dcba947402f6c320\",\"salt\":\"rDoh8RiaLT3tpmtulu1i\",\"email\":\"1@1.com\",\"mobile\":\"15112694901\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:13:11 AM\",\"academyId\":34}]', 7, '101.30.126.29', '2023-03-27 10:13:12');
INSERT INTO `sys_log` VALUES (219, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":53,\"username\":\" 刘晓杰\",\"password\":\"9fe6e3ec6e14d365c883f5dcf69c9ee5187d6f222ac2af33ffd5b5e0a8abd96b\",\"salt\":\"tCnvxFUbXB4pTtB7bF7Z\",\"email\":\"1@1.com\",\"mobile\":\"13503269825\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:13:51 AM\",\"academyId\":34}]', 7, '101.30.126.29', '2023-03-27 10:13:52');
INSERT INTO `sys_log` VALUES (220, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":54,\"username\":\"刘文诗\",\"password\":\"179a93019e9ab53c8a603db393811b1b1b5f1aca4dc5b6681bd1c77ad08604f6\",\"salt\":\"8DI07VQiyQZLIcy3zZKL\",\"email\":\"1@1.com\",\"mobile\":\"15369094991\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:14:14 AM\",\"academyId\":34}]', 6, '101.30.126.29', '2023-03-27 10:14:15');
INSERT INTO `sys_log` VALUES (221, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":55,\"username\":\"李群\",\"password\":\"366f3ea82382646ec39d4667fb4c5f4100f5f673d1cc6eac0dd5fea593c91723\",\"salt\":\"Fs4U6WzVrQKj0alwrSOV\",\"email\":\"1@1.com\",\"mobile\":\"13120138213\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:15:24 AM\",\"academyId\":34}]', 5, '101.30.126.29', '2023-03-27 10:15:25');
INSERT INTO `sys_log` VALUES (222, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":56,\"username\":\"徐志锋\",\"password\":\"1e10667f25a36074c54abfcdcbf6d3e1f611cfe0c2741733282be7abfa3764f9\",\"salt\":\"4HiyeK7NAnQbiefn2XHC\",\"email\":\"1@1.com\",\"mobile\":\"13623261587\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:15:59 AM\",\"academyId\":34}]', 5, '101.30.126.29', '2023-03-27 10:16:00');
INSERT INTO `sys_log` VALUES (223, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":57,\"username\":\"吴小兵\",\"password\":\"4f3ddda86b54402b7b808be8103306e804679f307ee88e84f100a0ef6ce3df84\",\"salt\":\"Fc7u19QhJRaZY6Je4nbo\",\"email\":\"1@1.com\",\"mobile\":\"17601051396\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:16:25 AM\",\"academyId\":34}]', 6, '101.30.126.29', '2023-03-27 10:16:26');
INSERT INTO `sys_log` VALUES (224, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":58,\"username\":\"王辛培\",\"password\":\"a8b769ef9322149786ef539cb11c930fb3cff36d84c3fec382d8192c47a76a0e\",\"salt\":\"KlM7D1UsWILOabVBoYMe\",\"email\":\"1@1.com\",\"mobile\":\"15031642524\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:16:47 AM\",\"academyId\":34}]', 6, '101.30.126.29', '2023-03-27 10:16:48');
INSERT INTO `sys_log` VALUES (225, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":59,\"username\":\"刘志成\",\"password\":\"8b0beedbe64eca1307da47eeb5998640baaa9a123d1e0832a9012d8a7cc787c0\",\"salt\":\"Xax1UHzhtEbo9dvmt1Lh\",\"email\":\"1@1.com\",\"mobile\":\"13171777313\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:17:22 AM\",\"academyId\":34}]', 7, '101.30.126.29', '2023-03-27 10:17:23');
INSERT INTO `sys_log` VALUES (226, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":60,\"username\":\"徐艳红\",\"password\":\"d159eb63dc06ea4ce6abdf6c42bfb44d7e9eb36ad56f905444128b7ef370792b\",\"salt\":\"dEOQwcXsUW3rXScXj7mY\",\"email\":\"1@1.com\",\"mobile\":\"13832668829\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:18:09 AM\",\"academyId\":34}]', 10, '110.251.43.244', '2023-03-27 10:18:09');
INSERT INTO `sys_log` VALUES (227, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":61,\"username\":\"郭建强\",\"password\":\"a4ee34e38e4c5c4db1a9c7ad953eb16b9ef7ea24f6205138f3504f1a6b4bfc78\",\"salt\":\"IXaNpbaSDtdALVPzYdeg\",\"email\":\"1@1.com\",\"mobile\":\"15735276360\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:18:40 AM\",\"academyId\":34}]', 5, '110.251.43.244', '2023-03-27 10:18:41');
INSERT INTO `sys_log` VALUES (228, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":62,\"username\":\"黄腾达\",\"password\":\"b82493613c387de3ca58e4d91e883a7b41825ab80664849fec2b753a2f8705fe\",\"salt\":\"eL8SZr5BsqLHY1fhDVz2\",\"email\":\"1@1.com\",\"mobile\":\"13331282507\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:19:08 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:19:08');
INSERT INTO `sys_log` VALUES (229, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":63,\"username\":\"石义飞\",\"password\":\"0402c90b3e74450ca138415b1e8166ab150113e8e6f5ea6136cc9eb7186d8830\",\"salt\":\"ivEQqNgshGJtY1VfrUNy\",\"email\":\"1@1.com\",\"mobile\":\"13126958668\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:19:39 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:19:40');
INSERT INTO `sys_log` VALUES (230, 'zhangshuxi', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":64,\"username\":\"徐杰\",\"password\":\"d016961491084c58bd3dee7fd5b6fc887e741ae8ce4b8cb2c7cb6cce122183d6\",\"salt\":\"98kIpVJd2azLaDMMRwWH\",\"email\":\"1@1.com\",\"mobile\":\"18554655293\",\"status\":1,\"roleIdList\":[24],\"createUserId\":13,\"createTime\":\"Mar 27, 2023 10:20:18 AM\",\"academyId\":34}]', 6, '110.251.43.244', '2023-03-27 10:20:19');
INSERT INTO `sys_log` VALUES (231, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,41,61,51,55,71,81,78,79,-666666,31,32,37,38,44,58,45,46,47,65]}]', 19, '101.30.126.29', '2023-03-27 15:58:46');
INSERT INTO `sys_log` VALUES (232, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,41,61,46,49,50,51,52,55,71,81,78,79,-666666,31,32,37,38,44,58,45,47,65]}]', 16, '110.251.43.244', '2023-03-27 16:07:28');
INSERT INTO `sys_log` VALUES (233, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":22,\"roleName\":\"中层学管领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[37,38,39,40,41,43,51,53,54,55,63,64,71,78,79,-666666,45,46,47,65]}]', 12, '110.251.43.244', '2023-03-27 16:08:23');
INSERT INTO `sys_log` VALUES (234, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":23,\"roleName\":\"财务\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,41,61,51,47,53,54,55,56,65,66,67,68,69,70,71,77,81,78,79,-666666,31,32,37,38,44,58,45,46]}]', 21, '110.251.43.244', '2023-03-27 16:08:57');
INSERT INTO `sys_log` VALUES (235, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":24,\"roleName\":\"班主任\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[39,40,41,51,53,54,55,63,64,78,79,-666666,37,38,45,46,47]}]', 12, '110.251.43.244', '2023-03-27 16:09:27');
INSERT INTO `sys_log` VALUES (236, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":26,\"roleName\":\"招生处\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[41,61,49,50,51,53,54,55,78,79,-666666,37,38,44,58,45,46,47]}]', 13, '110.251.43.244', '2023-03-27 16:09:59');
INSERT INTO `sys_log` VALUES (237, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,41,61,46,49,50,51,52,53,54,55,71,81,78,79,-666666,31,32,37,38,44,58,45,47,65]}]', 15, '110.251.43.244', '2023-03-27 16:10:18');
INSERT INTO `sys_log` VALUES (238, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":25,\"roleName\":\"中层教务领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[37,38,39,40,41,43,44,58,59,60,61,62,76,51,53,54,55,71,81,78,79,-666666,45,46,47,65]}]', 16, '110.251.43.244', '2023-03-27 16:10:48');
INSERT INTO `sys_log` VALUES (239, 'zhangshuxi', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":21,\"roleName\":\"高层领导\",\"remark\":\"\",\"createUserId\":13,\"menuIdList\":[33,39,40,41,61,46,49,50,51,52,53,54,55,71,77,81,78,79,-666666,31,32,37,38,44,58,45,47,65]}]', 100, '101.75.212.117', '2023-03-31 12:46:15');
INSERT INTO `sys_log` VALUES (240, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":4,\"list\":[]}]', 79, '0:0:0:0:0:0:0:1', '2023-07-14 15:53:18');
INSERT INTO `sys_log` VALUES (241, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":4,\"list\":[]}]', 54, '0:0:0:0:0:0:0:1', '2023-07-14 15:53:18');
INSERT INTO `sys_log` VALUES (242, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,93,94,95,96,97,90,-666666]}]', 14737, '0:0:0:0:0:0:0:1', '2023-07-21 09:15:16');
INSERT INTO `sys_log` VALUES (243, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,93,94,95,96,97,90,-666666]}]', 25657, '0:0:0:0:0:0:0:1', '2023-07-21 09:15:30');
INSERT INTO `sys_log` VALUES (244, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,93,94,95,96,97,90,-666666]}]', 28831, '0:0:0:0:0:0:0:1', '2023-07-21 09:15:42');
INSERT INTO `sys_log` VALUES (245, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"academyId\":-1}]', 876, '0:0:0:0:0:0:0:1', '2023-07-21 09:15:49');
INSERT INTO `sys_log` VALUES (246, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"lzq\",\"password\":\"bac7d970fa3a6a6be44890ddbea89fe9bf889ad654cfbcbbd013746727fa25ab\",\"salt\":\"zEPnHREpsWhrOcClNIzQ\",\"email\":\"11@qq.com\",\"mobile\":\"18555555555\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"academyId\":-1}]', 1161, '0:0:0:0:0:0:0:1', '2023-07-21 09:16:58');
INSERT INTO `sys_log` VALUES (247, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,93,94,95,96,97,90,-666666]}]', 1760, '0:0:0:0:0:0:0:1', '2023-07-21 09:22:20');
INSERT INTO `sys_log` VALUES (248, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[95]', 80, '0:0:0:0:0:0:0:1', '2023-07-21 09:24:37');
INSERT INTO `sys_log` VALUES (249, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":93,\"parentId\":89,\"name\":\"查看\",\"perms\":\"stutemp:list\",\"type\":2,\"orderNum\":0,\"list\":[]}]', 43, '0:0:0:0:0:0:0:1', '2023-07-21 09:28:41');
INSERT INTO `sys_log` VALUES (250, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":9,\"username\":\"cel\",\"salt\":\"fYL6UHDolql9kDv8DbdR\",\"email\":\"123123@qq.com\",\"mobile\":\"15757222222\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"academyId\":-1}]', 302, '0:0:0:0:0:0:0:1', '2023-07-21 09:48:58');
INSERT INTO `sys_log` VALUES (251, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,90,-666666]}]', 1917, '192.168.1.103', '2023-07-29 15:14:14');
INSERT INTO `sys_log` VALUES (252, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"超级管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,90,-666666]}]', 3010, '192.168.1.103', '2023-07-29 15:14:16');
INSERT INTO `sys_log` VALUES (253, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[4]]', 28, '192.168.1.103', '2023-08-01 10:26:09');
INSERT INTO `sys_log` VALUES (254, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[1]]', 155, '192.168.1.103', '2023-08-01 10:27:34');
INSERT INTO `sys_log` VALUES (255, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":28,\"roleName\":\"管理\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,90,-666666,1]}]', 1989, '192.168.1.118', '2023-08-01 11:00:51');
INSERT INTO `sys_log` VALUES (256, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"zhw\",\"salt\":\"T2LZwusXtr9Q0OVgsVD7\",\"email\":\"1478@qq.com\",\"mobile\":\"15757575757\",\"status\":1,\"roleIdList\":[28],\"createUserId\":1,\"academyId\":-1}]', 285, '192.168.1.118', '2023-08-01 11:00:59');
INSERT INTO `sys_log` VALUES (257, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"lzq\",\"salt\":\"zEPnHREpsWhrOcClNIzQ\",\"email\":\"11@qq.com\",\"mobile\":\"18555555555\",\"status\":1,\"roleIdList\":[28],\"createUserId\":1,\"academyId\":-1}]', 151, '192.168.1.118', '2023-08-01 11:01:06');
INSERT INTO `sys_log` VALUES (258, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":6,\"username\":\"zbl\",\"salt\":\"0zd5xTpMdtCoXhGdtJRA\",\"email\":\"123123@qq.com\",\"mobile\":\"15757289944\",\"status\":1,\"roleIdList\":[28],\"createUserId\":1,\"academyId\":-1}]', 175, '192.168.1.118', '2023-08-01 11:01:12');
INSERT INTO `sys_log` VALUES (259, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":7,\"username\":\"ac\",\"salt\":\"xSIuXZgrWt6C8A9K9z1j\",\"email\":\"123456@qq.com\",\"mobile\":\"13561111111\",\"status\":1,\"roleIdList\":[28],\"createUserId\":1,\"academyId\":-1}]', 137, '192.168.1.118', '2023-08-01 11:01:21');
INSERT INTO `sys_log` VALUES (260, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[2]]', 151, '192.168.1.118', '2023-08-01 20:43:18');
INSERT INTO `sys_log` VALUES (261, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[3]]', 98, '192.168.1.118', '2023-08-01 20:43:22');
INSERT INTO `sys_log` VALUES (262, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[3]]', 136, '192.168.1.118', '2023-08-01 20:43:24');
INSERT INTO `sys_log` VALUES (263, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[4]]', 138, '192.168.1.118', '2023-08-01 20:43:27');
INSERT INTO `sys_log` VALUES (264, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[21]]', 349, '192.168.1.118', '2023-08-01 20:43:31');
INSERT INTO `sys_log` VALUES (265, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[22]]', 135, '192.168.1.118', '2023-08-01 20:43:35');
INSERT INTO `sys_log` VALUES (266, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[24]]', 135, '192.168.1.118', '2023-08-01 20:43:42');
INSERT INTO `sys_log` VALUES (267, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[[25]]', 129, '192.168.1.118', '2023-08-01 20:43:46');
INSERT INTO `sys_log` VALUES (268, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":28,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[19,23,25,29,31,32,33,34,35,36,42,57,44,91,92,59,60,61,62,65,69,87,88,76,78,79,82,83,89,90,-666666,1,3,4]}]', 1230, '192.168.1.118', '2023-08-01 20:46:24');
INSERT INTO `sys_log` VALUES (269, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":26,\"roleName\":\"招生管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[79,89,-666666,78]}]', 502, '192.168.1.118', '2023-08-01 20:49:22');
INSERT INTO `sys_log` VALUES (270, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":23,\"roleName\":\"财务管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[65,69,87,88,-666666]}]', 255, '192.168.1.118', '2023-08-01 20:49:58');
INSERT INTO `sys_log` VALUES (271, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":29,\"roleName\":\"学籍管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[78,79,82,83,89,90,-666666],\"createTime\":\"Aug 1, 2023 8:53:41 PM\"}]', 396, '192.168.1.118', '2023-08-01 20:53:42');
INSERT INTO `sys_log` VALUES (272, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":30,\"roleName\":\"教务管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[44,92,-666666],\"createTime\":\"Aug 1, 2023 8:53:56 PM\"}]', 191, '192.168.1.118', '2023-08-01 20:53:57');
INSERT INTO `sys_log` VALUES (273, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"zhw\",\"salt\":\"T2LZwusXtr9Q0OVgsVD7\",\"email\":\"1478@qq.com\",\"mobile\":\"15757575757\",\"status\":1,\"roleIdList\":[28],\"createUserId\":1,\"academyId\":383}]', 136, '192.168.1.118', '2023-08-01 20:55:52');
INSERT INTO `sys_log` VALUES (274, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":5,\"username\":\"lzq\",\"salt\":\"zEPnHREpsWhrOcClNIzQ\",\"email\":\"11@qq.com\",\"mobile\":\"18555555555\",\"status\":1,\"roleIdList\":[28],\"createUserId\":1,\"academyId\":442}]', 125, '192.168.1.118', '2023-08-01 20:56:07');
INSERT INTO `sys_log` VALUES (275, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":6,\"username\":\"zbl\",\"salt\":\"0zd5xTpMdtCoXhGdtJRA\",\"email\":\"123123@qq.com\",\"mobile\":\"15757289944\",\"status\":1,\"roleIdList\":[29],\"createUserId\":1,\"academyId\":-1}]', 95, '192.168.1.118', '2023-08-01 20:56:18');
INSERT INTO `sys_log` VALUES (276, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[7]]', 31, '192.168.1.118', '2023-08-01 20:56:30');
INSERT INTO `sys_log` VALUES (277, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[8]]', 26, '192.168.1.118', '2023-08-01 20:57:00');
INSERT INTO `sys_log` VALUES (278, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":6,\"username\":\"zbl\",\"salt\":\"0zd5xTpMdtCoXhGdtJRA\",\"email\":\"123123@qq.com\",\"mobile\":\"15757289944\",\"status\":1,\"roleIdList\":[29],\"createUserId\":1,\"academyId\":383}]', 106, '192.168.1.118', '2023-08-01 20:57:11');
INSERT INTO `sys_log` VALUES (279, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":9,\"username\":\"cel\",\"salt\":\"fYL6UHDolql9kDv8DbdR\",\"email\":\"123123@qq.com\",\"mobile\":\"15757222222\",\"status\":1,\"roleIdList\":[23],\"createUserId\":1,\"academyId\":383}]', 94, '192.168.1.118', '2023-08-01 20:57:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_valid` tinyint(2) NULL DEFAULT NULL COMMENT '0：无效 1：有效',
  `is_show` tinyint(2) NULL DEFAULT NULL COMMENT '0：隐藏 1：展示',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 4, 1, 1);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2, 1, 1);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 4, 1, 1);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 3, 0, 1);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5, 1, 1);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6, 0, 1);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7, 1, 1);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6, 0, 1);
INSERT INTO `sys_menu` VALUES (31, 0, '学院管理', '', '', 0, 'shouye', 3, 1, 1);
INSERT INTO `sys_menu` VALUES (32, 31, '学院列表', '/academy/academy', '', 1, 'shezhi', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (33, 32, '查看', '', 'academy:list', 2, '', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (34, 32, '新增', '', 'academy:save', 2, '', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (35, 32, '修改', '', 'academy:update', 2, '', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (36, 32, '删除', '', 'academy:delete', 2, '', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (42, 31, '部门管理', '/dept/sysdept', '', 1, 'menu', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (44, 0, '教务管理', '', '', 0, 'bianji', 2, 1, 1);
INSERT INTO `sys_menu` VALUES (57, 42, '新增', '', 'sysdept:save', 2, '', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (65, 0, '财务管理', '', '', 0, 'sql', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (69, 65, '学杂费收支管理', '/finance/feeschoolsundry', '', 1, 'zhedie', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (78, 0, '学生管理', '', '', 0, 'admin', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (79, 78, '学生列表', '/student/studentList', '', 1, 'menu', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (82, 78, '就业管理', '/student/employList', NULL, 1, 'zhedie', 2, 1, 1);
INSERT INTO `sys_menu` VALUES (83, 78, '实习管理', '/student/workList', NULL, 1, 'zhedie', 3, 1, 1);
INSERT INTO `sys_menu` VALUES (87, 65, '退费管理', '/finance/feereturn', NULL, 1, 'zhedie', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (88, 65, '欠费管理', '/finance/feearrearage', NULL, 1, 'zhedie', 0, 1, 1);
INSERT INTO `sys_menu` VALUES (89, 78, '招生管理', '/student/enrollStuList', NULL, 1, 'zhedie', 1, 1, 1);
INSERT INTO `sys_menu` VALUES (90, 78, '学籍变更', '/student/stuStatusList', NULL, 1, 'zhedie', 4, 1, 1);
INSERT INTO `sys_menu` VALUES (92, 44, '考证管理', '/edu/certificateList', NULL, 1, 'zhedie', 0, 1, 1);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (23, '财务管理员', '', 1, '2023-03-24 12:41:26');
INSERT INTO `sys_role` VALUES (26, '招生管理员', '', 1, '2023-03-24 16:21:30');
INSERT INTO `sys_role` VALUES (28, '系统管理员', '', 1, '2023-03-27 09:37:41');
INSERT INTO `sys_role` VALUES (29, '学籍管理员', '', 1, '2023-08-01 20:53:42');
INSERT INTO `sys_role` VALUES (30, '教务管理员', '', 1, '2023-08-01 20:53:57');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2318 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2093, 5, 99);
INSERT INTO `sys_role_menu` VALUES (2265, 28, 19);
INSERT INTO `sys_role_menu` VALUES (2266, 28, 23);
INSERT INTO `sys_role_menu` VALUES (2267, 28, 25);
INSERT INTO `sys_role_menu` VALUES (2268, 28, 29);
INSERT INTO `sys_role_menu` VALUES (2269, 28, 31);
INSERT INTO `sys_role_menu` VALUES (2270, 28, 32);
INSERT INTO `sys_role_menu` VALUES (2271, 28, 33);
INSERT INTO `sys_role_menu` VALUES (2272, 28, 34);
INSERT INTO `sys_role_menu` VALUES (2273, 28, 35);
INSERT INTO `sys_role_menu` VALUES (2274, 28, 36);
INSERT INTO `sys_role_menu` VALUES (2275, 28, 42);
INSERT INTO `sys_role_menu` VALUES (2276, 28, 57);
INSERT INTO `sys_role_menu` VALUES (2277, 28, 44);
INSERT INTO `sys_role_menu` VALUES (2278, 28, 91);
INSERT INTO `sys_role_menu` VALUES (2279, 28, 92);
INSERT INTO `sys_role_menu` VALUES (2280, 28, 59);
INSERT INTO `sys_role_menu` VALUES (2281, 28, 60);
INSERT INTO `sys_role_menu` VALUES (2282, 28, 61);
INSERT INTO `sys_role_menu` VALUES (2283, 28, 62);
INSERT INTO `sys_role_menu` VALUES (2284, 28, 65);
INSERT INTO `sys_role_menu` VALUES (2285, 28, 69);
INSERT INTO `sys_role_menu` VALUES (2286, 28, 87);
INSERT INTO `sys_role_menu` VALUES (2287, 28, 88);
INSERT INTO `sys_role_menu` VALUES (2288, 28, 76);
INSERT INTO `sys_role_menu` VALUES (2289, 28, 78);
INSERT INTO `sys_role_menu` VALUES (2290, 28, 79);
INSERT INTO `sys_role_menu` VALUES (2291, 28, 82);
INSERT INTO `sys_role_menu` VALUES (2292, 28, 83);
INSERT INTO `sys_role_menu` VALUES (2293, 28, 89);
INSERT INTO `sys_role_menu` VALUES (2294, 28, 90);
INSERT INTO `sys_role_menu` VALUES (2295, 28, -666666);
INSERT INTO `sys_role_menu` VALUES (2296, 28, 1);
INSERT INTO `sys_role_menu` VALUES (2297, 28, 3);
INSERT INTO `sys_role_menu` VALUES (2298, 28, 4);
INSERT INTO `sys_role_menu` VALUES (2299, 26, 79);
INSERT INTO `sys_role_menu` VALUES (2300, 26, 89);
INSERT INTO `sys_role_menu` VALUES (2301, 26, -666666);
INSERT INTO `sys_role_menu` VALUES (2302, 26, 78);
INSERT INTO `sys_role_menu` VALUES (2303, 23, 65);
INSERT INTO `sys_role_menu` VALUES (2304, 23, 69);
INSERT INTO `sys_role_menu` VALUES (2305, 23, 87);
INSERT INTO `sys_role_menu` VALUES (2306, 23, 88);
INSERT INTO `sys_role_menu` VALUES (2307, 23, -666666);
INSERT INTO `sys_role_menu` VALUES (2308, 29, 78);
INSERT INTO `sys_role_menu` VALUES (2309, 29, 79);
INSERT INTO `sys_role_menu` VALUES (2310, 29, 82);
INSERT INTO `sys_role_menu` VALUES (2311, 29, 83);
INSERT INTO `sys_role_menu` VALUES (2312, 29, 89);
INSERT INTO `sys_role_menu` VALUES (2313, 29, 90);
INSERT INTO `sys_role_menu` VALUES (2314, 29, -666666);
INSERT INTO `sys_role_menu` VALUES (2315, 30, 44);
INSERT INTO `sys_role_menu` VALUES (2316, 30, 92);
INSERT INTO `sys_role_menu` VALUES (2317, 30, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `academy_id` bigint(20) NOT NULL DEFAULT -1,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, -1, 'admin', '31abdee2bfd78897c4c009931a42d72b6deba64e7b41ff1777a4bb20641dc330', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (3, 383, 'zhw', '9ba03c48265743d070f68a3a6b3d6b2c8445f7c121233029e86b3797f068799e', 'T2LZwusXtr9Q0OVgsVD7', '1478@qq.com', '15757575757', 1, 1, '2022-12-06 14:18:32');
INSERT INTO `sys_user` VALUES (5, 442, 'lzq', 'bac7d970fa3a6a6be44890ddbea89fe9bf889ad654cfbcbbd013746727fa25ab', 'zEPnHREpsWhrOcClNIzQ', '11@qq.com', '18555555555', 1, 1, '2022-12-06 21:12:31');
INSERT INTO `sys_user` VALUES (6, 383, 'zbl', '3c97d150baa004f160bfe0fd716620e33a7fa8af8d47c38b543bd20191da8270', '0zd5xTpMdtCoXhGdtJRA', '123123@qq.com', '15757289944', 1, 1, '2022-12-08 14:22:26');
INSERT INTO `sys_user` VALUES (9, 383, 'cel', 'f0b3363352397948747081c47c556972f9efedc99453f70914311ea4f648902f', 'fYL6UHDolql9kDv8DbdR', '123123@qq.com', '15757222222', 1, 1, '2022-12-08 15:14:41');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (89, 7, 28);
INSERT INTO `sys_user_role` VALUES (90, 3, 28);
INSERT INTO `sys_user_role` VALUES (91, 5, 28);
INSERT INTO `sys_user_role` VALUES (93, 6, 29);
INSERT INTO `sys_user_role` VALUES (94, 9, 23);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'e2f69ebb6737b679fb75cd57ca64782a', '2023-08-03 03:39:17', '2023-08-02 15:39:17');
INSERT INTO `sys_user_token` VALUES (2, '7e9e95b3d5aad563bc045a7fce206801', '2023-03-07 04:44:06', '2023-03-06 16:44:06');
INSERT INTO `sys_user_token` VALUES (3, '3661709066cf574b14d46f4915dc61fd', '2023-08-02 23:19:47', '2023-08-02 11:19:47');
INSERT INTO `sys_user_token` VALUES (4, 'f96fb9698b8070fa03954d846314919e', '2023-01-14 04:41:32', '2023-01-13 16:41:32');
INSERT INTO `sys_user_token` VALUES (5, 'aa332ea6609972fca626a9a132b52997', '2023-08-02 23:18:18', '2023-08-02 11:18:18');
INSERT INTO `sys_user_token` VALUES (6, '819c14a0aca570f8e4ceca369aa9a655', '2023-08-02 22:48:06', '2023-08-02 10:48:06');
INSERT INTO `sys_user_token` VALUES (7, '5a1ec5b26860d976caa3a419b3edafce', '2023-03-09 03:27:48', '2023-03-08 15:27:48');
INSERT INTO `sys_user_token` VALUES (8, '634710d93020135598b0f1cb7dbd1f26', '2023-05-05 22:02:42', '2023-05-05 10:02:42');
INSERT INTO `sys_user_token` VALUES (9, 'cf8893f398d2cbf2c82fb3ef4c94ed40', '2023-08-02 23:17:48', '2023-08-02 11:17:48');
INSERT INTO `sys_user_token` VALUES (10, '10ee73133d9240085176e3fc327ba82f', '2022-12-13 21:01:40', '2022-12-13 09:01:40');
INSERT INTO `sys_user_token` VALUES (11, '9f286559940d4c363e5212a2d133b588', '2023-03-09 03:36:40', '2023-03-08 15:36:40');
INSERT INTO `sys_user_token` VALUES (12, '1fd89ba46c6180a8c077342f35015f36', '2023-03-27 20:41:54', '2023-03-27 08:41:54');
INSERT INTO `sys_user_token` VALUES (13, '19f13a3a7a3b6a9b529901cc25b269fe', '2023-05-30 04:49:41', '2023-05-29 16:49:41');
INSERT INTO `sys_user_token` VALUES (14, 'b56faf33d6342319d2381026586cd403', '2023-03-28 23:57:01', '2023-03-28 11:57:01');
INSERT INTO `sys_user_token` VALUES (15, '5d8458356920555569bec6f5640cfd88', '2023-03-29 06:28:07', '2023-03-28 18:28:07');
INSERT INTO `sys_user_token` VALUES (16, 'e257468876961252326f5c1ce4598aa8', '2023-03-29 02:38:39', '2023-03-28 14:38:39');
INSERT INTO `sys_user_token` VALUES (19, '0dd2bad6c5ba3ea131f75e6863b04e3a', '2023-03-29 02:28:21', '2023-03-28 14:28:21');
INSERT INTO `sys_user_token` VALUES (20, 'e4106c325cc8f48f25b7a771145f5800', '2023-05-16 22:37:03', '2023-05-16 10:37:03');
INSERT INTO `sys_user_token` VALUES (23, '21f0ef2056860f3615dfeb600cf8febd', '2023-03-27 20:12:10', '2023-03-27 08:12:10');
INSERT INTO `sys_user_token` VALUES (26, '4d7648dfdc643f754bfc16b24976b21b', '2023-04-01 03:34:26', '2023-03-31 15:34:26');
INSERT INTO `sys_user_token` VALUES (27, '2656006b12426700ba1f0f5ea1145c94', '2023-04-03 20:59:53', '2023-04-03 08:59:53');
INSERT INTO `sys_user_token` VALUES (32, '4f449ccdf164282309ed620ed6b3f4bc', '2023-03-31 06:08:49', '2023-03-30 18:08:49');
INSERT INTO `sys_user_token` VALUES (34, '4cebcb528eaa13063204dd99475518fe', '2023-03-31 04:09:39', '2023-03-30 16:09:39');
INSERT INTO `sys_user_token` VALUES (40, '1e3b5cd668e229f2b38b74030d76ce2d', '2023-04-03 22:42:42', '2023-04-03 10:42:42');
INSERT INTO `sys_user_token` VALUES (41, '6dda2aa8b6e55444cdabeab50d1722d3', '2023-03-31 05:37:04', '2023-03-30 17:37:04');
INSERT INTO `sys_user_token` VALUES (45, '226e5d50ae6e359af23ccb3c057abcbc', '2023-04-03 21:17:52', '2023-04-03 09:17:52');
INSERT INTO `sys_user_token` VALUES (46, '81c7d1e3808792c681e837c418d56bf3', '2023-04-07 22:26:36', '2023-04-07 10:26:36');
INSERT INTO `sys_user_token` VALUES (50, '4fbe8977909bbc95b223f41d5245b0c0', '2023-04-14 03:45:10', '2023-04-13 15:45:10');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
