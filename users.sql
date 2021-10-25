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

 Date: 24/10/2021 16:43:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `level` int(1) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `information` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (NULL, '101315533', 'qq1013155332', NULL);
INSERT INTO `users` VALUES (NULL, '101332@qq.com', 'qq1013155332', NULL);
INSERT INTO `users` VALUES (NULL, '135250', 'cnm555555', NULL);
INSERT INTO `users` VALUES (NULL, '18588515035', 'sb123456', NULL);
INSERT INTO `users` VALUES (NULL, '2021ASDF', '2021ASDF', NULL);
INSERT INTO `users` VALUES (NULL, '202589403', '2050china', NULL);
INSERT INTO `users` VALUES (NULL, '2025898asgg', '2050china', NULL);
INSERT INTO `users` VALUES (NULL, '34342022', 'AMG20502', NULL);
INSERT INTO `users` VALUES (NULL, '3434202211', 'QWERQWER1', NULL);
INSERT INTO `users` VALUES (NULL, '454454', 'ab12345', NULL);
INSERT INTO `users` VALUES (NULL, '45445455', 'aab123456', NULL);
INSERT INTO `users` VALUES (NULL, 'abuser005', 'simple011', NULL);
INSERT INTO `users` VALUES (NULL, 'ABUSER025', 'QQQQQ333', NULL);
INSERT INTO `users` VALUES (3, 'admin', '11', '最高权限管理员');
INSERT INTO `users` VALUES (NULL, 'admin0000445az', 'asdf1234', NULL);
INSERT INTO `users` VALUES (NULL, 'admin2123', '11AAAAAA', NULL);
INSERT INTO `users` VALUES (NULL, 'admin2321A', '1111111A', NULL);
INSERT INTO `users` VALUES (NULL, 'admin8989855', 'ASDEASDE1', NULL);
INSERT INTO `users` VALUES (NULL, 'adminASSDF', '11202020a', NULL);
INSERT INTO `users` VALUES (NULL, 'adminhjhjhj', '2021LLLL', NULL);
INSERT INTO `users` VALUES (NULL, 'admiP', '2021LLLL', NULL);
INSERT INTO `users` VALUES (NULL, 'AJSADSA', '20082008A', NULL);
INSERT INTO `users` VALUES (NULL, 'asdhksajhdkjhask', 'qwer6666', NULL);
INSERT INTO `users` VALUES (NULL, 'asjkda00', 'aaaa1111', NULL);
INSERT INTO `users` VALUES (NULL, 'C3P0', 'datasource2', NULL);
INSERT INTO `users` VALUES (NULL, 'google07staff', 'googlenb6', NULL);
INSERT INTO `users` VALUES (NULL, 'Googleuser', '789gmail', NULL);
INSERT INTO `users` VALUES (NULL, 'gopooss', '1314520sy', NULL);
INSERT INTO `users` VALUES (NULL, 'JIJDSAD56', 'ASDF2222', NULL);
INSERT INTO `users` VALUES (NULL, 'laskdlasjlk', '2021abac', NULL);
INSERT INTO `users` VALUES (NULL, 'OFFER02020', '2020ASDF', NULL);
INSERT INTO `users` VALUES (NULL, 'root', 'abababc1', NULL);
INSERT INTO `users` VALUES (NULL, 'root858585', 'ASDF2021', NULL);
INSERT INTO `users` VALUES (NULL, 'sb_-?!@163.com', '!@_-.?com', NULL);
INSERT INTO `users` VALUES (NULL, 'sd3343432', '2020as', NULL);
INSERT INTO `users` VALUES (NULL, 'sdljaslkjdkas', '520520sy', NULL);
INSERT INTO `users` VALUES (NULL, 'SLKDSLASLDALS', '2020COCRA', NULL);
INSERT INTO `users` VALUES (NULL, 'STEVENCH', '20202020a', NULL);
INSERT INTO `users` VALUES (NULL, 'sysadmin', '118118sb', NULL);
INSERT INTO `users` VALUES (2, 'user', '11', '管理员');
INSERT INTO `users` VALUES (NULL, 'user-_@.com', 'sa2020sa', NULL);
INSERT INTO `users` VALUES (NULL, 'user001', '12121234', NULL);
INSERT INTO `users` VALUES (NULL, 'user002', '123456abc', NULL);
INSERT INTO `users` VALUES (NULL, 'user1997', 'sycc2001', NULL);
INSERT INTO `users` VALUES (NULL, 'user2021', '20211014a', NULL);
INSERT INTO `users` VALUES (NULL, 'user202110', '202110AA', NULL);
INSERT INTO `users` VALUES (NULL, 'user898565', 'userpass0', NULL);
INSERT INTO `users` VALUES (NULL, 'userasss', '88888888a', NULL);

SET FOREIGN_KEY_CHECKS = 1;
