/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50718 (5.7.18)
 Source Host           : localhost:3306
 Source Schema         : gameframex

 Target Server Type    : MySQL
 Target Server Version : 50718 (5.7.18)
 File Encoding         : 65001

 Date: 10/09/2024 15:09:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ClientAppVersion
-- ----------------------------
DROP TABLE IF EXISTS `ClientAppVersion`;
CREATE TABLE `ClientAppVersion`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Channel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Platform` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台',
  `Version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本',
  `Package` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包名',
  `Language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言',
  `OldVersion` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旧版本',
  `DownloadUrl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下载链接',
  `IsForce` tinyint(1) NOT NULL COMMENT '是否强制更新',
  `Announcement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端程序版本配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientAppVersion
-- ----------------------------
INSERT INTO `ClientAppVersion` VALUES (31858839149637, 'default', 'default', 'default', 'default', 'default', 'default', 'http://127.0.0.1/game.apk', 0, '11', '111', '2024-09-10 11:58:27', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ClientAssetPackage
-- ----------------------------
DROP TABLE IF EXISTS `ClientAssetPackage`;
CREATE TABLE `ClientAssetPackage`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端资源包' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientAssetPackage
-- ----------------------------
INSERT INTO `ClientAssetPackage` VALUES (31858697374789, 'DefaultPackage', '默认资源包', '2024-09-10 15:05:30', '2024-09-10 15:05:33', 1300000000101, '超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ClientAssetPackageVersion
-- ----------------------------
DROP TABLE IF EXISTS `ClientAssetPackageVersion`;
CREATE TABLE `ClientAssetPackageVersion`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Channel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道名称',
  `Platform` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台',
  `AppVersion` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游戏版本',
  `Package` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包名',
  `Language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言',
  `AssetPackageName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源包名称',
  `RootPath` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源下载根路径',
  `Version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源版本',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端资源包版本' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientAssetPackageVersion
-- ----------------------------
INSERT INTO `ClientAssetPackageVersion` VALUES (31850206682437, 'default', 'default', 'default', 'default', 'default', 'DefaultPackage', 'http://127.0.0.1/', '20240910153025', '默认包', '2024-09-10 15:08:47', NULL, 1300000000101, '	\r\n超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ClientAssetPackageVersionHistory
-- ----------------------------
DROP TABLE IF EXISTS `ClientAssetPackageVersionHistory`;
CREATE TABLE `ClientAssetPackageVersionHistory`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `VersionId` bigint(20) NOT NULL COMMENT '资源包版本Id',
  `OldVersion` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旧资源版本',
  `Version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新资源版本',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端资源包版本记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientAssetPackageVersionHistory
-- ----------------------------

-- ----------------------------
-- Table structure for ClientChannel
-- ----------------------------
DROP TABLE IF EXISTS `ClientChannel`;
CREATE TABLE `ClientChannel`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端渠道配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientChannel
-- ----------------------------
INSERT INTO `ClientChannel` VALUES (31850206682437, 'default', '默认缺省渠道', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ClientGlobalInfo
-- ----------------------------
DROP TABLE IF EXISTS `ClientGlobalInfo`;
CREATE TABLE `ClientGlobalInfo`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Channel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Platform` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台',
  `Version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本',
  `Package` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包名',
  `Language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言',
  `CheckResourceUrl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检测资源更新地址',
  `CheckAppVersionUrl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检测APP更新地址',
  `Content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  `AotCodeList` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'AOT代码列表',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端全局信息配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientGlobalInfo
-- ----------------------------
INSERT INTO `ClientGlobalInfo` VALUES (31858697374789, 'default', 'default', 'default', 'default', 'default', 'http://127.0.0.1:20808/api/GameAssetPackageVersion/GetInfo', 'http://127.0.0.1:20808/api/GameAppVersion/GetInfo', '{}', '默认', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0, '');

-- ----------------------------
-- Table structure for ClientLanguage
-- ----------------------------
DROP TABLE IF EXISTS `ClientLanguage`;
CREATE TABLE `ClientLanguage`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端语言配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientLanguage
-- ----------------------------
INSERT INTO `ClientLanguage` VALUES (31699178000000, 'default', '默认缺省语言', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000000, 'ChineseSimplified', '简体中文', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000001, 'ChineseTraditional', '繁体中文', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000002, 'English', '英语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000003, 'Afrikaans', '南非荷兰语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000004, 'Albanian', '阿尔巴尼亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000005, 'Arabic', '阿拉伯语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000006, 'Basque', '巴斯克语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000007, 'Belarusian', '白俄罗斯语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000008, 'Bulgarian', '保加利亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000009, 'Catalan', '加泰罗尼亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000010, 'German', '德语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000011, 'Croatian', '克罗地亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000012, 'Czech', '捷克语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000013, 'Danish', '丹麦语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000014, 'Dutch', '荷兰语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000015, 'Estonian', '爱沙尼亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000016, 'Faroese', '法罗语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000017, 'Finnish', '芬兰语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000018, 'French', '法语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000019, 'Georgian', '格鲁吉亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000020, 'Greek', '希腊语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000021, 'Hebrew', '希伯来语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000022, 'Hungarian', '匈牙利语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000023, 'Icelandic', '冰岛语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000024, 'Indonesian', '印尼语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000025, 'Italian', '意大利语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000026, 'Japanese', '日语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000027, 'Korean', '韩语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000028, 'Latvian', '拉脱维亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000029, 'Lithuanian', '立陶宛语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000030, 'Macedonian', '马其顿语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000031, 'Malayalam', '马拉雅拉姆语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000032, 'Norwegian', '挪威语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000033, 'Persian', '波斯语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000034, 'Polish', '波兰语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000035, 'PortugueseBrazil', '巴西葡萄牙语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000036, 'PortuguesePortugal', '葡萄牙语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000037, 'Romanian', '罗马尼亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000038, 'Russian', '俄语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000039, 'SerboCroatian', '塞尔维亚克罗地亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000040, 'SerbianCyrillic', '塞尔维亚西里尔语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000041, 'SerbianLatin', '塞尔维亚拉丁语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000042, 'Slovak', '斯洛伐克语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000043, 'Slovenian', '斯洛文尼亚语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000044, 'Spanish', '西班牙语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000045, 'Swedish', '瑞典语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000046, 'Thai', '泰语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000047, 'Turkish', '土耳其语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000048, 'Ukrainian', '乌克兰语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientLanguage` VALUES (31699179000049, 'Vietnamese', '越南语', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ClientPackage
-- ----------------------------
DROP TABLE IF EXISTS `ClientPackage`;
CREATE TABLE `ClientPackage`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端包配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientPackage
-- ----------------------------
INSERT INTO `ClientPackage` VALUES (31850214795589, 'default', '默认缺省包', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ClientPlatform
-- ----------------------------
DROP TABLE IF EXISTS `ClientPlatform`;
CREATE TABLE `ClientPlatform`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端平台配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientPlatform
-- ----------------------------
INSERT INTO `ClientPlatform` VALUES (31850202486597, 'default', '默认缺省平台', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientPlatform` VALUES (31850577223493, 'Android', '安卓平台', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientPlatform` VALUES (31850582821957, 'iOS', 'IPhone或Ipad', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientPlatform` VALUES (31850585613125, 'Windows', 'PC平台', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientPlatform` VALUES (31850590968133, 'MacOs', 'MacOs平台', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientPlatform` VALUES (31850599172933, 'WebGL', 'Web网页平台', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for ClientVersion
-- ----------------------------
DROP TABLE IF EXISTS `ClientVersion`;
CREATE TABLE `ClientVersion`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `Name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端程序版本配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ClientVersion
-- ----------------------------
INSERT INTO `ClientVersion` VALUES (31699111322949, '1.0.0', '初始版本', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);
INSERT INTO `ClientVersion` VALUES (31699111322950, 'default', '默认缺省版本', '2024-09-10 11:58:28', '2024-09-10 11:58:28', 1300000000101, '超级管理员', NULL, NULL, 0);

-- ----------------------------
-- Table structure for GameAnnouncementEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameAnnouncementEntity`;
CREATE TABLE `GameAnnouncementEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `AreaId` bigint(20) NOT NULL COMMENT '区服ID',
  `Title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `Content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `Priority` int(11) NOT NULL COMMENT '优先级',
  `IsActive` tinyint(1) NOT NULL COMMENT '是否激活',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏内公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameAnnouncementEntity
-- ----------------------------

-- ----------------------------
-- Table structure for GameAreaEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameAreaEntity`;
CREATE TABLE `GameAreaEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `IsDefault` int(11) NOT NULL COMMENT '是否是默认',
  `IsEnable` int(11) NOT NULL COMMENT '是否启用',
  `ServerStatus` int(11) NOT NULL COMMENT '状态',
  `Region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域',
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `Port` int(11) NOT NULL COMMENT '端口号',
  `Capacity` int(11) NOT NULL COMMENT '最大玩家数量',
  `CurrentLoad` int(11) NULL DEFAULT NULL COMMENT '目前的玩家数量',
  `CreationDate` datetime NOT NULL COMMENT '启用的日期',
  `LastMaintenanceDate` datetime NULL DEFAULT NULL COMMENT '服务器最后一次维护或更新的日期',
  `Version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游戏版本号',
  `ServerType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器的游戏模式类型',
  `Language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言',
  `TimeZone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时区',
  `AllowedPlayerProfile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定可以加入此服务器的玩家类型',
  `ServerEvents` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特定服务器举行的事件或活动信息',
  `AccessControls` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问权限设置，控制哪些玩家可以访问服务器',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏区服' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameAreaEntity
-- ----------------------------

-- ----------------------------
-- Table structure for GameBannerAnnouncementEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameBannerAnnouncementEntity`;
CREATE TABLE `GameBannerAnnouncementEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `AreaId` bigint(20) NOT NULL COMMENT '区服ID',
  `Content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `Priority` int(11) NOT NULL COMMENT '优先级',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `Interval` int(11) NOT NULL COMMENT '间隔时间',
  `IsActive` tinyint(1) NOT NULL COMMENT '是否激活',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏横幅公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameBannerAnnouncementEntity
-- ----------------------------

-- ----------------------------
-- Table structure for GameMailAttachmentEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameMailAttachmentEntity`;
CREATE TABLE `GameMailAttachmentEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `MailId` bigint(20) NOT NULL COMMENT '邮件Id',
  `ItemId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '道具Id',
  `ItemCount` bigint(20) NOT NULL COMMENT '道具数量',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏邮件附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameMailAttachmentEntity
-- ----------------------------

-- ----------------------------
-- Table structure for GameMailEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameMailEntity`;
CREATE TABLE `GameMailEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `AreaIdList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区服列表',
  `RecipientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收者',
  `SendDate` datetime NOT NULL COMMENT '发送的时间',
  `Subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `Body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细内容',
  `Attachments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件列表',
  `Status` int(11) NOT NULL COMMENT '邮件状态',
  `ExpirationDate` datetime NULL DEFAULT NULL COMMENT '邮件的过期日期',
  `MailType` int(11) NOT NULL COMMENT '邮件类型，例如个人邮件、系统邮件等。',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏邮件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameMailEntity
-- ----------------------------

-- ----------------------------
-- Table structure for GameRedeemCodeEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameRedeemCodeEntity`;
CREATE TABLE `GameRedeemCodeEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `AreaId` bigint(20) NOT NULL COMMENT '区服ID',
  `Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换码',
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `IsActive` tinyint(1) NOT NULL COMMENT '是否激活',
  `UsageLimit` int(11) NOT NULL COMMENT '可使用次数',
  `UsedCount` int(11) NOT NULL COMMENT '已使用次数',
  `StartTime` datetime NOT NULL COMMENT '有效开始时间',
  `EndTime` datetime NOT NULL COMMENT '失效时间',
  `Contents` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼包内容',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏兑换码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameRedeemCodeEntity
-- ----------------------------

-- ----------------------------
-- Table structure for GameRoleEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameRoleEntity`;
CREATE TABLE `GameRoleEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `AreaId` bigint(20) NOT NULL COMMENT '区服Id',
  `Level` int(11) NOT NULL COMMENT '等级',
  `LastLoginTime` datetime NOT NULL COMMENT '最后一次登录时间',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameRoleEntity
-- ----------------------------

-- ----------------------------
-- Table structure for GameUserEntity
-- ----------------------------
DROP TABLE IF EXISTS `GameUserEntity`;
CREATE TABLE `GameUserEntity`  (
  `Id` bigint(20) NOT NULL COMMENT '主键Id',
  `UserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `Status` int(11) NOT NULL COMMENT '账号状态',
  `Name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Description` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `CreateTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建者Id',
  `CreateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `UpdateUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改者Id',
  `UpdateUserName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者姓名',
  `IsDelete` tinyint(1) NOT NULL COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏玩家账号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GameUserEntity
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
