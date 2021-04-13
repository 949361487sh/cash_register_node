/*
 Navicat Premium Data Transfer

 Source Server         : cash_system
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : cash

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 13/04/2021 13:53:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for commoditytype
-- ----------------------------
DROP TABLE IF EXISTS `commoditytype`;
CREATE TABLE `commoditytype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类',
  `value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品码值',
  `className` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '判断商品类别和单位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of commoditytype
-- ----------------------------
INSERT INTO `commoditytype` VALUES (2, '生鲜果蔬', '2', '商品类别');
INSERT INTO `commoditytype` VALUES (3, '休闲食品', '3', '商品类别');
INSERT INTO `commoditytype` VALUES (4, '粮油调味', '4', '商品类别');
INSERT INTO `commoditytype` VALUES (5, '酒水饮料', '5', '商品类别');
INSERT INTO `commoditytype` VALUES (6, '烟品茶饮', '6', '商品类别');
INSERT INTO `commoditytype` VALUES (7, '方便速食', '7', '商品类别');
INSERT INTO `commoditytype` VALUES (8, '散装食品', '8', '商品类别');
INSERT INTO `commoditytype` VALUES (9, '熟食烘培', '9', '商品类别');
INSERT INTO `commoditytype` VALUES (10, '日化用品', '10', '商品类别');
INSERT INTO `commoditytype` VALUES (11, '家庭用品', '11', '商品类别');
INSERT INTO `commoditytype` VALUES (12, '五金电器', '12', '商品类别');
INSERT INTO `commoditytype` VALUES (13, 'Kg\n', '13', '商品单位');
INSERT INTO `commoditytype` VALUES (14, 'g', '14', '商品单位');
INSERT INTO `commoditytype` VALUES (15, '斤', '15', '商品单位');
INSERT INTO `commoditytype` VALUES (16, '罐', '16', '商品单位');
INSERT INTO `commoditytype` VALUES (17, '个', '17', '商品单位');
INSERT INTO `commoditytype` VALUES (18, '盒', '18', '商品单位');
INSERT INTO `commoditytype` VALUES (19, '包', '19', '商品单位');
INSERT INTO `commoditytype` VALUES (20, '件', '20', '商品单位');
INSERT INTO `commoditytype` VALUES (21, '瓶', '21', '商品单位');
INSERT INTO `commoditytype` VALUES (22, '袋', '22', '商品单位');
INSERT INTO `commoditytype` VALUES (23, '箱', '23', '商品单位');
INSERT INTO `commoditytype` VALUES (24, '听', '24', '商品单位');
INSERT INTO `commoditytype` VALUES (25, '片', '25', '商品单位');
INSERT INTO `commoditytype` VALUES (26, '中华牙膏', '26', '商品品牌');
INSERT INTO `commoditytype` VALUES (27, '中华烟', '27', '商品品牌');
INSERT INTO `commoditytype` VALUES (28, '蛋糕西点', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (29, '小胖', NULL, '商品单位');
INSERT INTO `commoditytype` VALUES (30, '啤机', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (31, '曲奇饼干', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (32, '111', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (33, '222', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (34, '雨晴', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (35, '哇哈哈', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (36, '黑人牙膏', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (37, '雪花', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (38, '喜之郎', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (39, '晨光', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (40, '学习用品', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (41, '罗技', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (42, '计算机', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (43, '茶叶', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (44, '电风扇', NULL, '商品品牌');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `card` int(11) NOT NULL COMMENT '会员卡号',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年纪',
  `tel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `integral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '积分',
  `balance` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (110, '2021-3-34', '小胖', '1', '18', '13301685003', '90', '120');
INSERT INTO `member` VALUES (220, '', '无敌', '2', '29', '18355017897', '188', '200');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodityTitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `retailPrice` int(10) NULL DEFAULT NULL COMMENT '零售价',
  `memberPic` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员价',
  `buyingPrice` int(10) NULL DEFAULT NULL COMMENT '进货价',
  `isDiscount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许打折',
  `isIntegral` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有积分',
  `supplier` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供货商',
  `termOfValidity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保质期',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条形码',
  `ShoppingVoucher` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购物券',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `grossProfitRate` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毛利率',
  `commoditySpecifications` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `commodityBrand` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `commodityType` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类',
  `commodityUnit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `salesMethods` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售方式',
  `supplierTel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商电话',
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  `isDelete` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否被删除 1是删除 空或0是启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (3, '哇哈哈', 100, 2, '1.3', 1, '参与', '是', '十字镇', '360', '111111', NULL, '', '25', '500ml', '哇哈哈', '酒水饮料', '瓶', '普通', NULL, NULL, NULL, NULL, '0');
INSERT INTO `stock` VALUES (4, '黑人牙膏', 100, 8, '7', 6, '参与', '是', '全椒', '420', '222222', NULL, '你猜', '14.29', '250ml', '黑人牙膏', '日化用品', '盒', '普通', NULL, NULL, NULL, NULL, '0');
INSERT INTO `stock` VALUES (5, '雪花啤酒', 100, 3, '2.5', 2, '参与', '是', '', '720', '333333', NULL, '', '20.00', '500ml', '雪花', '酒水饮料', '件', '普通', NULL, NULL, NULL, NULL, '0');
INSERT INTO `stock` VALUES (6, '哇哈哈桃酥', 10, 10, '8', 5, '参与', '是', '', '2', '123456', NULL, '', '25.00', '', '雨晴', '熟食烘培', '斤', '普通', NULL, NULL, NULL, NULL, '0');
INSERT INTO `stock` VALUES (7, '喜之郎-家庭装', 35, 20, '18.88', 15, '不参与', '否', '本地', '180', '949361487', NULL, '改了积分和名称--改了', '5.93', '80ml', '喜之郎', '散装食品', '斤', '称重销售', NULL, NULL, NULL, NULL, '0');
INSERT INTO `stock` VALUES (8, '中华烟', 10, 45, '0', 41, '不参与', '否', '本地', '1000', '000000', NULL, '', '8.89', '1', '中华烟', '烟品茶饮', '盒', '普通', NULL, '1617869642000_微信图片_20200810112059.jpg', NULL, '2021-04-08 16:14:02', '0');
INSERT INTO `stock` VALUES (9, '试试图片上传', 100, 22, '21', 18, '参与', '是', '', '2222', '121212', NULL, '', '4.76', '', '中华牙膏', '生鲜果蔬', '斤', '普通', NULL, NULL, '2021-04-08 17:21:10', NULL, '0');
INSERT INTO `stock` VALUES (10, '笔记本', 1000, 3, '2.5', 2, '参与', '是', '', '', '', NULL, '', '20.00', '', '晨光', '学习用品', '个', '普通', NULL, NULL, '2021-04-08 17:25:19', NULL, '0');
INSERT INTO `stock` VALUES (11, '鼠标', 100, 50, '45', 35, '参与', '是', '', '', '', NULL, '', '11.11', '', '罗技', '计算机', '个', '普通', NULL, NULL, '2021-04-09 10:40:02', NULL, '0');
INSERT INTO `stock` VALUES (12, '鼠标', 100, 50, '45', 35, '参与', '是', '', '', '', NULL, '', '11.11', '', '罗技', '计算机', '个', '普通', NULL, NULL, '2021-04-09 10:40:11', NULL, '1');
INSERT INTO `stock` VALUES (13, '台式机', 10, 1000, '900', 500, '参与', '是', '', '2000', '', NULL, '', '11.11', '', '罗技', '计算机', '个', '普通', NULL, NULL, '2021-04-09 10:43:00', NULL, '0');
INSERT INTO `stock` VALUES (14, '手机', 10, 3500, '2900', 2500, '参与', '是', '', '2000', '', NULL, '', '20.69', '', '罗技', '计算机', '个', '普通', NULL, '1617937103000_u=1803479964,4124264728&fm=26&gp=0.jpg', '2021-04-09 10:55:27', '2021-04-09 10:58:23', '0');
INSERT INTO `stock` VALUES (15, '手机', 10, 3000, '2900', 2500, '参与', '是', '', '2000', '', NULL, '', '3.45', '', '罗技', '计算机', '个', '普通', NULL, '1617937002000_下载_(1).jpg', '2021-04-09 10:56:40', '2021-04-09 10:56:42', '0');
INSERT INTO `stock` VALUES (16, '施及茶叶', 1000, 60, '55', 40, '参与', '是', '', '720', '', NULL, '', '9.09', '', '茶叶', '烟品茶饮', '斤', '普通', NULL, '1617938066000_part-00699-529.jpg', '2021-04-09 11:13:56', '2021-04-09 11:14:26', '0');
INSERT INTO `stock` VALUES (17, '电风扇', 20, 45, '40', 35, '参与', '是', '', '1000', '', NULL, '', '12.50', '', '电风扇', '五金电器', '个', '普通', NULL, '1617938344000_u=1818661197,1772272692&fm=26&gp=0.jpg', '2021-04-09 11:19:04', '2021-04-09 11:19:04', '0');
INSERT INTO `stock` VALUES (18, '扑克', 100, 3, '0', 2, '参与', '是', '', '', '101010101', NULL, '', '33.33', '', '曲奇饼干', '五金电器', '盒', '普通', NULL, '1618189942000_xuetielong.png', '2021-04-12 09:12:00', '2021-04-12 09:12:38', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '管理员');
INSERT INTO `user` VALUES (2, 'yuqing', '123456', '雨晴');

SET FOREIGN_KEY_CHECKS = 1;
