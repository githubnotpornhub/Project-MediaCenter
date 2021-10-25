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

 Date: 24/10/2021 16:43:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for medias
-- ----------------------------
DROP TABLE IF EXISTS `medias`;
CREATE TABLE `medias`  (
  `mediaid` int(6) NOT NULL AUTO_INCREMENT,
  `mediatitle` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeid` int(2) NULL DEFAULT NULL,
  `uploaddate` datetime NULL DEFAULT NULL,
  `description` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Mediatype` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mediaurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mediaid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of medias
-- ----------------------------
INSERT INTO `medias` VALUES (60, 'ocean.jpg', 3, '2021-10-20 05:21:52', '海天一色', 'P', '/images/photo/ocean.jpg');
INSERT INTO `medias` VALUES (61, 'sy.jpg', 1, '2021-10-20 05:24:32', '四月', 'P', '/images/photo/sy.jpg');
INSERT INTO `medias` VALUES (62, '晨晨1.jpg', 1, '2021-10-20 05:24:32', '四月', 'P', '/images/photo/晨晨1.jpg');
INSERT INTO `medias` VALUES (63, '晨晨2.jpg', 1, '2021-10-20 05:24:32', '四月', 'P', '/images/photo/晨晨2.jpg');
INSERT INTO `medias` VALUES (64, '晨晨3.jpg', 1, '2021-10-20 05:24:32', '四月', 'P', '/images/photo/晨晨3.jpg');
INSERT INTO `medias` VALUES (73, '暗星丽桑卓.jpg', 2, '2021-10-20 05:25:12', '', 'P', '/images/photo/暗星丽桑卓.jpg');
INSERT INTO `medias` VALUES (74, '寒冰.jpg', 2, '2021-10-20 05:25:12', '', 'P', '/images/photo/寒冰.jpg');
INSERT INTO `medias` VALUES (75, '玫瑰莫甘娜.jpg', 2, '2021-10-20 05:25:12', '', 'P', '/images/photo/玫瑰莫甘娜.jpg');
INSERT INTO `medias` VALUES (76, '玫瑰辛德拉.jpg', 2, '2021-10-20 05:25:12', '', 'P', '/images/photo/玫瑰辛德拉.jpg');
INSERT INTO `medias` VALUES (77, '你的名字.jpg', 2, '2021-10-20 05:25:12', '', 'P', '/images/photo/你的名字.jpg');
INSERT INTO `medias` VALUES (79, '1.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/1.jpg');
INSERT INTO `medias` VALUES (80, '2.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/2.jpg');
INSERT INTO `medias` VALUES (81, '3.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/3.jpg');
INSERT INTO `medias` VALUES (82, '4.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/4.jpg');
INSERT INTO `medias` VALUES (83, '5.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/5.jpg');
INSERT INTO `medias` VALUES (84, '6.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/6.jpg');
INSERT INTO `medias` VALUES (85, '7.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/7.jpg');
INSERT INTO `medias` VALUES (86, '8.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/8.jpg');
INSERT INTO `medias` VALUES (87, '9.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/9.jpg');
INSERT INTO `medias` VALUES (88, '10.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/10.jpg');
INSERT INTO `medias` VALUES (89, '11.jpg', 3, '2021-10-20 05:26:25', '', 'P', '/images/photo/11.jpg');
INSERT INTO `medias` VALUES (90, 'bluesky.jpg', 3, '2021-10-20 05:26:47', '', 'P', '/images/photo/bluesky.jpg');
INSERT INTO `medias` VALUES (91, 'ocean.jpg', 3, '2021-10-20 05:26:47', '', 'P', '/images/photo/ocean.jpg');
INSERT INTO `medias` VALUES (92, 'star1.jpg', 3, '2021-10-20 05:27:00', '星空', 'P', '/images/photo/star1.jpg');
INSERT INTO `medias` VALUES (93, 'star2.jpg', 3, '2021-10-20 05:27:00', '星空', 'P', '/images/photo/star2.jpg');
INSERT INTO `medias` VALUES (94, 'starsky.jpg', 3, '2021-10-20 05:27:00', '星空', 'P', '/images/photo/starsky.jpg');
INSERT INTO `medias` VALUES (95, 'starsky2.jpg', 3, '2021-10-20 05:27:00', '星空', 'P', '/images/photo/starsky2.jpg');
INSERT INTO `medias` VALUES (96, '1eae511b3b.jpg', 5, '2021-10-20 05:27:53', '延禧攻略', 'P', '/images/photo/1eae511b3b.jpg');
INSERT INTO `medias` VALUES (97, '3f30c84f0f11.jpg', 5, '2021-10-20 05:27:53', '延禧攻略', 'P', '/images/photo/3f30c84f0f11.jpg');
INSERT INTO `medias` VALUES (98, '5b568a9bf2d58.jpg', 5, '2021-10-20 05:27:53', '延禧攻略', 'P', '/images/photo/5b568a9bf2d58.jpg');
INSERT INTO `medias` VALUES (102, 'yxgl3.jpg', 5, '2021-10-20 05:27:53', '延禧攻略', 'P', '/images/photo/yxgl3.jpg');
INSERT INTO `medias` VALUES (103, 'yxgl4.jpg', 5, '2021-10-20 05:27:53', '延禧攻略', 'P', '/images/photo/yxgl4.jpg');
INSERT INTO `medias` VALUES (111, 'yanxi_gonglue-009.jpg', 5, '2021-10-20 15:35:49', '延禧攻略', 'P', '/images/photo/yanxi_gonglue-009.jpg');
INSERT INTO `medias` VALUES (114, '1020054 - 副本.png', 2, '2021-10-20 16:32:30', '唐三小舞', 'P', '/images/photo/1020054 - 副本.png');
INSERT INTO `medias` VALUES (116, '210221130114.png', 2, '2021-10-20 17:04:24', '唐三小舞', 'P', '/images/photo/210221130114.png');
INSERT INTO `medias` VALUES (117, '秦岚', 5, '2021-10-20 17:30:56', '', 'P', '/images/photo/c6cc9e5a89a5.jpg');
INSERT INTO `medias` VALUES (118, '秦岚呀', 5, '2021-10-20 18:11:00', '秦岚', 'P', '/images/photo/秦岚写真.jpg');
INSERT INTO `medias` VALUES (124, '秦岚写真', 3, '2021-10-20 18:23:09', '', 'P', '/images/photo/c6cc9e470761.jpg');
INSERT INTO `medias` VALUES (125, '四月', 1, '2021-10-20 18:50:26', '四月地铁视频', 'V', '/images/video/211020184853.mp4');
INSERT INTO `medias` VALUES (127, '四月', 1, '2021-10-20 20:12:00', '可爱四月', 'V', '/images/video/211020184916.mp4');
INSERT INTO `medias` VALUES (128, '四月', 1, '2021-10-20 20:24:49', '', 'V', '/images/video/211020184906.mp4');
INSERT INTO `medias` VALUES (129, '四月', 1, '2021-10-20 20:25:24', '', 'V', '/images/video/211020184927.mp4');
INSERT INTO `medias` VALUES (130, '210225225203.png', 2, '2021-10-20 20:35:39', '', 'P', '/images/photo/210225225203.png');
INSERT INTO `medias` VALUES (131, 'bluesky.jpg', 3, '2021-10-21 00:30:25', '', 'P', '/images/photo/bluesky.jpg');
INSERT INTO `medias` VALUES (132, 'ocean.jpg', 3, '2021-10-21 00:30:26', '', 'P', '/images/photo/ocean.jpg');
INSERT INTO `medias` VALUES (133, 'star1.jpg', 3, '2021-10-21 00:30:26', '', 'P', '/images/photo/star1.jpg');
INSERT INTO `medias` VALUES (134, 'star2.jpg', 3, '2021-10-21 00:30:26', '', 'P', '/images/photo/star2.jpg');
INSERT INTO `medias` VALUES (135, 'starsky.jpg', 3, '2021-10-21 00:30:26', '', 'P', '/images/photo/starsky.jpg');
INSERT INTO `medias` VALUES (136, 'starsky2.jpg', 3, '2021-10-21 00:30:26', '', 'P', '/images/photo/starsky2.jpg');
INSERT INTO `medias` VALUES (138, 'simple1.jpg', 3, '2021-10-21 00:41:37', '', 'P', '/images/photo/simple1.jpg');
INSERT INTO `medias` VALUES (139, 'star2.jpg', 4, '2021-10-21 00:42:57', '', 'P', '/images/photo/star2.jpg');
INSERT INTO `medias` VALUES (140, '秦岚写真', 5, '2021-10-21 16:48:00', '', 'P', '/images/photo/c81c61e3dcfb.jpg');
INSERT INTO `medias` VALUES (141, '四月', 1, '2021-10-22 18:50:09', '', 'V', '/images/video/211022184619.mp4');
INSERT INTO `medias` VALUES (142, '四月', 1, '2021-10-22 18:50:09', '', 'V', '/images/video/211022184708.mp4');
INSERT INTO `medias` VALUES (143, '四月', 1, '2021-10-22 18:50:09', '', 'V', '/images/video/211022184726.mp4');
INSERT INTO `medias` VALUES (144, '四月', 1, '2021-10-22 18:50:09', '', 'V', '/images/video/211022184733.mp4');
INSERT INTO `medias` VALUES (145, '四月', 1, '2021-10-22 18:50:09', '', 'V', '/images/video/211022184744.mp4');
INSERT INTO `medias` VALUES (146, '四月', 1, '2021-10-22 18:50:09', '', 'V', '/images/video/211022184755.mp4');
INSERT INTO `medias` VALUES (147, '四月', 1, '2021-10-22 18:50:10', '', 'V', '/images/video/211022184816.mp4');
INSERT INTO `medias` VALUES (148, '四月', 1, '2021-10-22 18:50:10', '', 'V', '/images/video/211022184823.mp4');
INSERT INTO `medias` VALUES (149, '四月', 1, '2021-10-22 18:50:10', '', 'V', '/images/video/211022184830.mp4');
INSERT INTO `medias` VALUES (150, '四月', 1, '2021-10-22 18:50:10', '', 'V', '/images/video/211022184848.mp4');
INSERT INTO `medias` VALUES (152, '锦超', 1, '2021-10-22 18:50:53', '', 'V', '/images/video/211022184633.mp4');
INSERT INTO `medias` VALUES (153, '抽象', 5, '2021-10-22 18:51:11', '', 'V', '/images/video/211022184803.mp4');
INSERT INTO `medias` VALUES (154, '四月', 1, '2021-10-22 19:07:13', '', 'V', '/images/video/211022184900.mp4');
INSERT INTO `medias` VALUES (155, '国风大典节选', 1, '2021-10-22 19:27:04', '', 'V', '/images/video/211020001018.mp4');
INSERT INTO `medias` VALUES (162, '四月', 1, '2021-10-23 14:27:54', '四月司南阁18年', 'P', '/images/photo/211023142342.jpg');

SET FOREIGN_KEY_CHECKS = 1;
