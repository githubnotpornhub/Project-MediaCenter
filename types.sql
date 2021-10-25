/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50703
 Source Host           : localhost:3306
 Source Schema         : medias

 Target Server Type    : MySQL
 Target Server Version : 50703
 File Encoding         : 65001

 Date: 24/10/2021 16:43:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `builddate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`typeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, '国风', '国风相关', '/images/photo/sy.jpg', '2021-10-06 12:31:42');
INSERT INTO `types` VALUES (2, '虚拟', '游戏动漫相关', '/images/photo/你的名字.jpg', '2021-10-07 08:35:56');
INSERT INTO `types` VALUES (3, '风景', '摄影作品', '/images/photo/11.jpg', '2021-10-07 12:35:59');
INSERT INTO `types` VALUES (4, '壁纸', '壁纸相关', '/images/photo/star2.jpg', '2021-10-15 12:31:42');
INSERT INTO `types` VALUES (5, '日常', '其他分类', '/images/photo/秦岚写真.jpg', '2019-10-16 12:35:48');

SET FOREIGN_KEY_CHECKS = 1;
