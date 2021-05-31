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

 Date: 31/05/2021 15:11:40
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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `commoditytype` VALUES (30, '啤机', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (31, '曲奇饼干', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (35, '哇哈哈', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (36, '黑人牙膏', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (37, '雪花', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (38, '喜之郎', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (40, '学习用品', NULL, '商品类别');
INSERT INTO `commoditytype` VALUES (43, '茶叶', NULL, '商品品牌');
INSERT INTO `commoditytype` VALUES (44, '电风扇', NULL, '商品品牌');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `createTime` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `memberName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `integral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '积分',
  `balance` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '余额',
  `birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新日期',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否禁用  0 正常 1 禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for neworders
-- ----------------------------
DROP TABLE IF EXISTS `neworders`;
CREATE TABLE `neworders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `addReceivablePic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应收金额',
  `receiptsPic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实收金额',
  `giveChange` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找零',
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  `discount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠',
  `allPic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品总金额',
  `commodityIds` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `memberName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名称',
  `refund` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款  1退款',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newworderId` int(11) NULL DEFAULT NULL,
  `stockId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
