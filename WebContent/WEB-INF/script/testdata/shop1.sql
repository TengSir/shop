/*
MySQL Data Transfer
Source Host: localhost
Source Database: shop
Target Host: localhost
Target Database: shop
Date: 2017-04-15 10:01:37
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for address
-- ----------------------------
CREATE TABLE `address` (
  `ADDRESSID` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `PROVINCE` varchar(20) NOT NULL COMMENT '省份',
  `CITY` varchar(20) NOT NULL COMMENT '城市',
  `AREA` varchar(20) NOT NULL COMMENT '区域',
  `STREET` varchar(200) DEFAULT NULL COMMENT '街道',
  `DETAIL` varchar(200) DEFAULT NULL COMMENT '详细',
  `TEL` varchar(11) NOT NULL COMMENT '电话',
  `USER` varchar(20) DEFAULT NULL COMMENT '联系人',
  `USERID` int(11) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`ADDRESSID`),
  UNIQUE KEY `PROVINCE` (`PROVINCE`),
  KEY `USERID` (`USERID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='收货地址表 : 收货地址表';

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
CREATE TABLE `orderitems` (
  `ORDERITEMID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `COUNT` int(11) NOT NULL COMMENT '数量',
  `DISCOUNT` float NOT NULL COMMENT '折扣',
  `ORDERID` int(11) NOT NULL COMMENT '订单编号',
  `PRODUCTID` int(11) NOT NULL COMMENT '商品编号',
  PRIMARY KEY (`ORDERITEMID`),
  KEY `ORDERID` (`ORDERID`),
  KEY `PRODUCTID` (`PRODUCTID`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ORDERID`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`PRODUCTID`) REFERENCES `product` (`PRODUCTID`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='订单详情表 : 订单详情信息表';

-- ----------------------------
-- Table structure for orders
-- ----------------------------
CREATE TABLE `orders` (
  `ORDERID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `TIME` datetime NOT NULL COMMENT '时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `USERID` int(11) NOT NULL COMMENT '用户编号',
  `ADDRESSID` int(11) NOT NULL COMMENT '地址编号',
  PRIMARY KEY (`ORDERID`),
  UNIQUE KEY `ORDERID_INDEX` (`ORDERID`) USING BTREE,
  KEY `ADDRESSID` (`ADDRESSID`),
  KEY `USERID` (`USERID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ADDRESSID`) REFERENCES `address` (`ADDRESSID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='订单表 : 存储订单信息的表';

-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE `product` (
  `PRODUCTID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `NAME` varchar(100) NOT NULL COMMENT '商品名字',
  `BRAND` varchar(20) NOT NULL COMMENT '品牌',
  `TYPE` varchar(10) NOT NULL COMMENT '适合人群',
  `SERIS` varchar(20) NOT NULL COMMENT '分类',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '描述',
  `BASICPRICE` float NOT NULL COMMENT '价格',
  `TYPEID` int(11) NOT NULL COMMENT '类型编号',
  PRIMARY KEY (`PRODUCTID`),
  UNIQUE KEY `PRODUCTID_INDEX` (`PRODUCTID`) USING BTREE,
  KEY `TYPEID` (`TYPEID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`TYPEID`) REFERENCES `producttype` (`PRODUCTTYPEID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='商品表 : 商品详情表';

-- ----------------------------
-- Table structure for productimage
-- ----------------------------
CREATE TABLE `productimage` (
  `PRODUCTIMAGEID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `PATH` varchar(20) NOT NULL COMMENT '图片路径',
  `ENABLE` bit(1) NOT NULL COMMENT '是否可用',
  `PRODUCTID` int(11) NOT NULL COMMENT '商品编号',
  PRIMARY KEY (`PRODUCTIMAGEID`),
  KEY `PRODUCTID` (`PRODUCTID`),
  CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`PRODUCTID`) REFERENCES `product` (`PRODUCTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片表 : 存储图片路径的表';

-- ----------------------------
-- Table structure for productmodeltype
-- ----------------------------
CREATE TABLE `productmodeltype` (
  `MODELTYPEID` int(11) NOT NULL AUTO_INCREMENT COMMENT '型号编号',
  `SIZE` varchar(20) NOT NULL COMMENT '尺寸',
  `COLOR` varchar(20) NOT NULL COMMENT '颜色',
  `PRICE` float NOT NULL COMMENT '价格',
  `COUNTS` int(11) DEFAULT NULL COMMENT '库存',
  `PRODUCTID` int(11) NOT NULL COMMENT '商品编号',
  PRIMARY KEY (`MODELTYPEID`),
  KEY `PRODUCTID` (`PRODUCTID`),
  CONSTRAINT `productmodeltype_ibfk_1` FOREIGN KEY (`PRODUCTID`) REFERENCES `product` (`PRODUCTID`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='商品型号详情表 : 存储商品不同型号信息的表';

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
CREATE TABLE `producttype` (
  `PRODUCTTYPEID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `TYPENAME` varchar(20) NOT NULL COMMENT '类型名',
  PRIMARY KEY (`PRODUCTTYPEID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商品类型表 : 存储商品类型的表';

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `USERNAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `REALNAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `SEX` bit(1) DEFAULT NULL COMMENT '性别',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `IMAGE` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `STATUS` bit(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`USERID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `INDEX_ID` (`USERID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表 : 这是存储用户信息的表';

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `address` VALUES ('1', '省份_1', '城市_1', '区域_1', '街道_1', '详细_1', '电话_1', '联系人_1', '1');
INSERT INTO `address` VALUES ('2', '省份_2', '城市_2', '区域_2', '街道_2', '详细_2', '电话_2', '联系人_2', '2');
INSERT INTO `address` VALUES ('3', '省份_3', '城市_3', '区域_3', '街道_3', '详细_3', '电话_3', '联系人_3', '3');
INSERT INTO `address` VALUES ('4', '省份_4', '城市_4', '区域_4', '街道_4', '详细_4', '电话_4', '联系人_4', '4');
INSERT INTO `address` VALUES ('5', '省份_5', '城市_5', '区域_5', '街道_5', '详细_5', '电话_5', '联系人_5', '5');
INSERT INTO `address` VALUES ('6', '省份_6', '城市_6', '区域_6', '街道_6', '详细_6', '电话_6', '联系人_6', '6');
INSERT INTO `address` VALUES ('7', '省份_7', '城市_7', '区域_7', '街道_7', '详细_7', '电话_7', '联系人_7', '7');
INSERT INTO `address` VALUES ('8', '省份_8', '城市_8', '区域_8', '街道_8', '详细_8', '电话_8', '联系人_8', '8');
INSERT INTO `address` VALUES ('9', '省份_9', '城市_9', '区域_9', '街道_9', '详细_9', '电话_9', '联系人_9', '9');
INSERT INTO `address` VALUES ('10', '省份_10', '城市_10', '区域_10', '街道_10', '详细_10', '电话_10', '联系人_10', '10');
INSERT INTO `address` VALUES ('11', '省份_11', '城市_11', '区域_11', '街道_11', '详细_11', '电话_11', '联系人_11', '1');
INSERT INTO `address` VALUES ('12', '省份_12', '城市_12', '区域_12', '街道_12', '详细_12', '电话_12', '联系人_12', '2');
INSERT INTO `address` VALUES ('13', '省份_13', '城市_13', '区域_13', '街道_13', '详细_13', '电话_13', '联系人_13', '3');
INSERT INTO `address` VALUES ('14', '省份_14', '城市_14', '区域_14', '街道_14', '详细_14', '电话_14', '联系人_14', '4');
INSERT INTO `address` VALUES ('15', '省份_15', '城市_15', '区域_15', '街道_15', '详细_15', '电话_15', '联系人_15', '5');
INSERT INTO `address` VALUES ('16', '省份_16', '城市_16', '区域_16', '街道_16', '详细_16', '电话_16', '联系人_16', '6');
INSERT INTO `address` VALUES ('17', '省份_17', '城市_17', '区域_17', '街道_17', '详细_17', '电话_17', '联系人_17', '7');
INSERT INTO `address` VALUES ('18', '省份_18', '城市_18', '区域_18', '街道_18', '详细_18', '电话_18', '联系人_18', '8');
INSERT INTO `address` VALUES ('19', '省份_19', '城市_19', '区域_19', '街道_19', '详细_19', '电话_19', '联系人_19', '9');
INSERT INTO `address` VALUES ('20', '省份_20', '城市_20', '区域_20', '街道_20', '详细_20', '电话_20', '联系人_20', '10');
INSERT INTO `address` VALUES ('21', '省份_21', '城市_21', '区域_21', '街道_21', '详细_21', '电话_21', '联系人_21', '1');
INSERT INTO `address` VALUES ('22', '省份_22', '城市_22', '区域_22', '街道_22', '详细_22', '电话_22', '联系人_22', '2');
INSERT INTO `address` VALUES ('23', '省份_23', '城市_23', '区域_23', '街道_23', '详细_23', '电话_23', '联系人_23', '3');
INSERT INTO `address` VALUES ('24', '省份_24', '城市_24', '区域_24', '街道_24', '详细_24', '电话_24', '联系人_24', '4');
INSERT INTO `address` VALUES ('25', '省份_25', '城市_25', '区域_25', '街道_25', '详细_25', '电话_25', '联系人_25', '5');
INSERT INTO `address` VALUES ('26', '省份_26', '城市_26', '区域_26', '街道_26', '详细_26', '电话_26', '联系人_26', '6');
INSERT INTO `address` VALUES ('27', '省份_27', '城市_27', '区域_27', '街道_27', '详细_27', '电话_27', '联系人_27', '7');
INSERT INTO `address` VALUES ('28', '省份_28', '城市_28', '区域_28', '街道_28', '详细_28', '电话_28', '联系人_28', '8');
INSERT INTO `address` VALUES ('29', '省份_29', '城市_29', '区域_29', '街道_29', '详细_29', '电话_29', '联系人_29', '9');
INSERT INTO `address` VALUES ('30', '省份_30', '城市_30', '区域_30', '街道_30', '详细_30', '电话_30', '联系人_30', '10');
INSERT INTO `orderitems` VALUES ('1', '1', '0', '1', '1');
INSERT INTO `orderitems` VALUES ('2', '2', '0.5', '2', '2');
INSERT INTO `orderitems` VALUES ('3', '3', '1', '3', '3');
INSERT INTO `orderitems` VALUES ('4', '4', '1.5', '4', '4');
INSERT INTO `orderitems` VALUES ('5', '5', '2', '5', '5');
INSERT INTO `orderitems` VALUES ('6', '6', '2.5', '6', '6');
INSERT INTO `orderitems` VALUES ('7', '7', '3', '7', '7');
INSERT INTO `orderitems` VALUES ('8', '8', '3.5', '8', '8');
INSERT INTO `orderitems` VALUES ('9', '9', '4', '9', '9');
INSERT INTO `orderitems` VALUES ('10', '10', '4.5', '10', '10');
INSERT INTO `orderitems` VALUES ('11', '1', '5', '11', '11');
INSERT INTO `orderitems` VALUES ('12', '2', '5.5', '12', '12');
INSERT INTO `orderitems` VALUES ('13', '3', '6', '13', '13');
INSERT INTO `orderitems` VALUES ('14', '4', '6.5', '14', '14');
INSERT INTO `orderitems` VALUES ('15', '5', '7', '15', '15');
INSERT INTO `orderitems` VALUES ('16', '6', '7.5', '16', '16');
INSERT INTO `orderitems` VALUES ('17', '7', '8', '17', '17');
INSERT INTO `orderitems` VALUES ('18', '8', '8.5', '18', '18');
INSERT INTO `orderitems` VALUES ('19', '9', '9', '19', '19');
INSERT INTO `orderitems` VALUES ('20', '10', '9.5', '20', '20');
INSERT INTO `orderitems` VALUES ('21', '1', '10', '21', '21');
INSERT INTO `orderitems` VALUES ('22', '2', '10.5', '22', '22');
INSERT INTO `orderitems` VALUES ('23', '3', '11', '23', '23');
INSERT INTO `orderitems` VALUES ('24', '4', '11.5', '24', '24');
INSERT INTO `orderitems` VALUES ('25', '5', '12', '25', '25');
INSERT INTO `orderitems` VALUES ('26', '6', '12.5', '26', '26');
INSERT INTO `orderitems` VALUES ('27', '7', '13', '27', '27');
INSERT INTO `orderitems` VALUES ('28', '8', '13.5', '28', '28');
INSERT INTO `orderitems` VALUES ('29', '9', '14', '29', '29');
INSERT INTO `orderitems` VALUES ('30', '10', '14.5', '30', '30');
INSERT INTO `orderitems` VALUES ('31', '1', '15', '1', '31');
INSERT INTO `orderitems` VALUES ('32', '2', '15.5', '2', '32');
INSERT INTO `orderitems` VALUES ('33', '3', '16', '3', '33');
INSERT INTO `orderitems` VALUES ('34', '4', '16.5', '4', '34');
INSERT INTO `orderitems` VALUES ('35', '5', '17', '5', '35');
INSERT INTO `orderitems` VALUES ('36', '6', '17.5', '6', '36');
INSERT INTO `orderitems` VALUES ('37', '7', '18', '7', '37');
INSERT INTO `orderitems` VALUES ('38', '8', '18.5', '8', '38');
INSERT INTO `orderitems` VALUES ('39', '9', '19', '9', '39');
INSERT INTO `orderitems` VALUES ('40', '10', '19.5', '10', '40');
INSERT INTO `orderitems` VALUES ('41', '1', '20', '11', '41');
INSERT INTO `orderitems` VALUES ('42', '2', '20.5', '12', '42');
INSERT INTO `orderitems` VALUES ('43', '3', '21', '13', '43');
INSERT INTO `orderitems` VALUES ('44', '4', '21.5', '14', '44');
INSERT INTO `orderitems` VALUES ('45', '5', '22', '15', '45');
INSERT INTO `orderitems` VALUES ('46', '6', '22.5', '16', '46');
INSERT INTO `orderitems` VALUES ('47', '7', '23', '17', '47');
INSERT INTO `orderitems` VALUES ('48', '8', '23.5', '18', '48');
INSERT INTO `orderitems` VALUES ('49', '9', '24', '19', '49');
INSERT INTO `orderitems` VALUES ('50', '10', '24.5', '20', '50');
INSERT INTO `orderitems` VALUES ('51', '1', '25', '21', '1');
INSERT INTO `orderitems` VALUES ('52', '2', '25.5', '22', '2');
INSERT INTO `orderitems` VALUES ('53', '3', '26', '23', '3');
INSERT INTO `orderitems` VALUES ('54', '4', '26.5', '24', '4');
INSERT INTO `orderitems` VALUES ('55', '5', '27', '25', '5');
INSERT INTO `orderitems` VALUES ('56', '6', '27.5', '26', '6');
INSERT INTO `orderitems` VALUES ('57', '7', '28', '27', '7');
INSERT INTO `orderitems` VALUES ('58', '8', '28.5', '28', '8');
INSERT INTO `orderitems` VALUES ('59', '9', '29', '29', '9');
INSERT INTO `orderitems` VALUES ('60', '10', '29.5', '30', '10');
INSERT INTO `orderitems` VALUES ('61', '1', '30', '1', '11');
INSERT INTO `orderitems` VALUES ('62', '2', '0.4', '2', '12');
INSERT INTO `orderitems` VALUES ('63', '3', '0.9', '3', '13');
INSERT INTO `orderitems` VALUES ('64', '4', '1.4', '4', '14');
INSERT INTO `orderitems` VALUES ('65', '5', '1.9', '5', '15');
INSERT INTO `orderitems` VALUES ('66', '6', '2.4', '6', '16');
INSERT INTO `orderitems` VALUES ('67', '7', '2.9', '7', '17');
INSERT INTO `orderitems` VALUES ('68', '8', '3.4', '8', '18');
INSERT INTO `orderitems` VALUES ('69', '9', '3.9', '9', '19');
INSERT INTO `orderitems` VALUES ('70', '10', '4.4', '10', '20');
INSERT INTO `orderitems` VALUES ('71', '1', '4.9', '11', '21');
INSERT INTO `orderitems` VALUES ('72', '2', '5.4', '12', '22');
INSERT INTO `orderitems` VALUES ('73', '3', '5.9', '13', '23');
INSERT INTO `orderitems` VALUES ('74', '4', '6.4', '14', '24');
INSERT INTO `orderitems` VALUES ('75', '5', '6.9', '15', '25');
INSERT INTO `orderitems` VALUES ('76', '6', '7.4', '16', '26');
INSERT INTO `orderitems` VALUES ('77', '7', '7.9', '17', '27');
INSERT INTO `orderitems` VALUES ('78', '8', '8.4', '18', '28');
INSERT INTO `orderitems` VALUES ('79', '9', '8.9', '19', '29');
INSERT INTO `orderitems` VALUES ('80', '10', '9.4', '20', '30');
INSERT INTO `orderitems` VALUES ('81', '1', '9.9', '21', '31');
INSERT INTO `orderitems` VALUES ('82', '2', '10.4', '22', '32');
INSERT INTO `orderitems` VALUES ('83', '3', '10.9', '23', '33');
INSERT INTO `orderitems` VALUES ('84', '4', '11.4', '24', '34');
INSERT INTO `orderitems` VALUES ('85', '5', '11.9', '25', '35');
INSERT INTO `orderitems` VALUES ('86', '6', '12.4', '26', '36');
INSERT INTO `orderitems` VALUES ('87', '7', '12.9', '27', '37');
INSERT INTO `orderitems` VALUES ('88', '8', '13.4', '28', '38');
INSERT INTO `orderitems` VALUES ('89', '9', '13.9', '29', '39');
INSERT INTO `orderitems` VALUES ('90', '10', '14.4', '30', '40');
INSERT INTO `orders` VALUES ('1', '2000-01-01 12:00:00', '1', '1', '1');
INSERT INTO `orders` VALUES ('2', '2000-01-02 12:00:00', '2', '2', '2');
INSERT INTO `orders` VALUES ('3', '2000-01-03 12:00:00', '3', '3', '3');
INSERT INTO `orders` VALUES ('4', '2000-01-04 12:00:00', '4', '4', '1');
INSERT INTO `orders` VALUES ('5', '2000-01-05 12:00:00', '5', '5', '2');
INSERT INTO `orders` VALUES ('6', '2000-01-06 12:00:00', '1', '6', '3');
INSERT INTO `orders` VALUES ('7', '2000-01-07 12:00:00', '2', '7', '1');
INSERT INTO `orders` VALUES ('8', '2000-01-08 12:00:00', '3', '8', '2');
INSERT INTO `orders` VALUES ('9', '2000-01-09 12:00:00', '4', '9', '3');
INSERT INTO `orders` VALUES ('10', '2000-01-10 12:00:00', '5', '10', '1');
INSERT INTO `orders` VALUES ('11', '2000-01-11 12:00:00', '1', '1', '2');
INSERT INTO `orders` VALUES ('12', '2000-01-12 12:00:00', '2', '2', '3');
INSERT INTO `orders` VALUES ('13', '2000-01-13 12:00:00', '3', '3', '1');
INSERT INTO `orders` VALUES ('14', '2000-01-14 12:00:00', '4', '4', '2');
INSERT INTO `orders` VALUES ('15', '2000-01-15 12:00:00', '5', '5', '3');
INSERT INTO `orders` VALUES ('16', '2000-01-16 12:00:00', '1', '6', '1');
INSERT INTO `orders` VALUES ('17', '2000-01-17 12:00:00', '2', '7', '2');
INSERT INTO `orders` VALUES ('18', '2000-01-18 12:00:00', '3', '8', '3');
INSERT INTO `orders` VALUES ('19', '2000-01-19 12:00:00', '4', '9', '1');
INSERT INTO `orders` VALUES ('20', '2000-01-20 12:00:00', '5', '10', '2');
INSERT INTO `orders` VALUES ('21', '2000-01-21 12:00:00', '1', '1', '3');
INSERT INTO `orders` VALUES ('22', '2000-01-22 12:00:00', '2', '2', '1');
INSERT INTO `orders` VALUES ('23', '2000-01-23 12:00:00', '3', '3', '2');
INSERT INTO `orders` VALUES ('24', '2000-01-24 12:00:00', '4', '4', '3');
INSERT INTO `orders` VALUES ('25', '2000-01-25 12:00:00', '5', '5', '1');
INSERT INTO `orders` VALUES ('26', '2000-01-26 12:00:00', '1', '6', '2');
INSERT INTO `orders` VALUES ('27', '2000-01-27 12:00:00', '2', '7', '3');
INSERT INTO `orders` VALUES ('28', '2000-01-28 12:00:00', '3', '8', '1');
INSERT INTO `orders` VALUES ('29', '2000-01-29 12:00:00', '4', '9', '2');
INSERT INTO `orders` VALUES ('30', '2000-01-30 12:00:00', '5', '10', '3');
INSERT INTO `orders` VALUES ('31', '2000-01-31 12:00:00', '1', '1', '1');
INSERT INTO `orders` VALUES ('32', '2000-02-01 12:00:00', '2', '2', '2');
INSERT INTO `orders` VALUES ('33', '2000-02-02 12:00:00', '3', '3', '3');
INSERT INTO `orders` VALUES ('34', '2000-02-03 12:00:00', '4', '4', '1');
INSERT INTO `orders` VALUES ('35', '2000-02-04 12:00:00', '5', '5', '2');
INSERT INTO `orders` VALUES ('36', '2000-02-05 12:00:00', '1', '6', '3');
INSERT INTO `orders` VALUES ('37', '2000-02-06 12:00:00', '2', '7', '1');
INSERT INTO `orders` VALUES ('38', '2000-02-07 12:00:00', '3', '8', '2');
INSERT INTO `orders` VALUES ('39', '2000-02-08 12:00:00', '4', '9', '3');
INSERT INTO `orders` VALUES ('40', '2000-02-09 12:00:00', '5', '10', '1');
INSERT INTO `orders` VALUES ('41', '2000-02-10 12:00:00', '1', '1', '2');
INSERT INTO `orders` VALUES ('42', '2000-02-11 12:00:00', '2', '2', '3');
INSERT INTO `orders` VALUES ('43', '2000-02-12 12:00:00', '3', '3', '1');
INSERT INTO `orders` VALUES ('44', '2000-02-13 12:00:00', '4', '4', '2');
INSERT INTO `orders` VALUES ('45', '2000-02-14 12:00:00', '5', '5', '3');
INSERT INTO `orders` VALUES ('46', '2000-02-15 12:00:00', '1', '6', '1');
INSERT INTO `orders` VALUES ('47', '2000-02-16 12:00:00', '2', '7', '2');
INSERT INTO `orders` VALUES ('48', '2000-02-17 12:00:00', '3', '8', '3');
INSERT INTO `orders` VALUES ('49', '2000-02-18 12:00:00', '4', '9', '1');
INSERT INTO `orders` VALUES ('50', '2000-02-19 12:00:00', '5', '10', '2');
INSERT INTO `product` VALUES ('1', '商品名字_1', '阿玛尼', '男装', '上衣', '描述_1', '10', '1');
INSERT INTO `product` VALUES ('2', '商品名字_2', 'LV', '女装', '裤子', '描述_2', '20', '2');
INSERT INTO `product` VALUES ('3', '商品名字_3', '阿玛尼', '童装', '鞋子', '描述_3', '30', '3');
INSERT INTO `product` VALUES ('4', '商品名字_4', 'LV', '男装', '配饰', '描述_4', '40', '4');
INSERT INTO `product` VALUES ('5', '商品名字_5', '阿玛尼', '女装', '上衣', '描述_5', '50', '5');
INSERT INTO `product` VALUES ('6', '商品名字_6', 'LV', '童装', '裤子', '描述_6', '60', '6');
INSERT INTO `product` VALUES ('7', '商品名字_7', '阿玛尼', '男装', '鞋子', '描述_7', '70', '7');
INSERT INTO `product` VALUES ('8', '商品名字_8', 'LV', '女装', '配饰', '描述_8', '80', '8');
INSERT INTO `product` VALUES ('9', '商品名字_9', '阿玛尼', '童装', '上衣', '描述_9', '90', '9');
INSERT INTO `product` VALUES ('10', '商品名字_10', 'LV', '男装', '裤子', '描述_10', '100', '10');
INSERT INTO `product` VALUES ('11', '商品名字_11', '阿玛尼', '女装', '鞋子', '描述_11', '110', '11');
INSERT INTO `product` VALUES ('12', '商品名字_12', 'LV', '童装', '配饰', '描述_12', '120', '12');
INSERT INTO `product` VALUES ('13', '商品名字_13', '阿玛尼', '男装', '上衣', '描述_13', '130', '13');
INSERT INTO `product` VALUES ('14', '商品名字_14', 'LV', '女装', '裤子', '描述_14', '140', '14');
INSERT INTO `product` VALUES ('15', '商品名字_15', '阿玛尼', '童装', '鞋子', '描述_15', '150', '15');
INSERT INTO `product` VALUES ('16', '商品名字_16', 'LV', '男装', '配饰', '描述_16', '160', '16');
INSERT INTO `product` VALUES ('17', '商品名字_17', '阿玛尼', '女装', '上衣', '描述_17', '170', '17');
INSERT INTO `product` VALUES ('18', '商品名字_18', 'LV', '童装', '裤子', '描述_18', '180', '18');
INSERT INTO `product` VALUES ('19', '商品名字_19', '阿玛尼', '男装', '鞋子', '描述_19', '190', '19');
INSERT INTO `product` VALUES ('20', '商品名字_20', 'LV', '女装', '配饰', '描述_20', '200', '20');
INSERT INTO `product` VALUES ('21', '商品名字_21', '阿玛尼', '童装', '上衣', '描述_21', '210', '1');
INSERT INTO `product` VALUES ('22', '商品名字_22', 'LV', '男装', '裤子', '描述_22', '220', '2');
INSERT INTO `product` VALUES ('23', '商品名字_23', '阿玛尼', '女装', '鞋子', '描述_23', '230', '3');
INSERT INTO `product` VALUES ('24', '商品名字_24', 'LV', '童装', '配饰', '描述_24', '240', '4');
INSERT INTO `product` VALUES ('25', '商品名字_25', '阿玛尼', '男装', '上衣', '描述_25', '250', '5');
INSERT INTO `product` VALUES ('26', '商品名字_26', 'LV', '女装', '裤子', '描述_26', '260', '6');
INSERT INTO `product` VALUES ('27', '商品名字_27', '阿玛尼', '童装', '鞋子', '描述_27', '270', '7');
INSERT INTO `product` VALUES ('28', '商品名字_28', 'LV', '男装', '配饰', '描述_28', '280', '8');
INSERT INTO `product` VALUES ('29', '商品名字_29', '阿玛尼', '女装', '上衣', '描述_29', '290', '9');
INSERT INTO `product` VALUES ('30', '商品名字_30', 'LV', '童装', '裤子', '描述_30', '300', '10');
INSERT INTO `product` VALUES ('31', '商品名字_31', '阿玛尼', '男装', '鞋子', '描述_31', '310', '11');
INSERT INTO `product` VALUES ('32', '商品名字_32', 'LV', '女装', '配饰', '描述_32', '320', '12');
INSERT INTO `product` VALUES ('33', '商品名字_33', '阿玛尼', '童装', '上衣', '描述_33', '330', '13');
INSERT INTO `product` VALUES ('34', '商品名字_34', 'LV', '男装', '裤子', '描述_34', '340', '14');
INSERT INTO `product` VALUES ('35', '商品名字_35', '阿玛尼', '女装', '鞋子', '描述_35', '350', '15');
INSERT INTO `product` VALUES ('36', '商品名字_36', 'LV', '童装', '配饰', '描述_36', '360', '16');
INSERT INTO `product` VALUES ('37', '商品名字_37', '阿玛尼', '男装', '上衣', '描述_37', '370', '17');
INSERT INTO `product` VALUES ('38', '商品名字_38', 'LV', '女装', '裤子', '描述_38', '380', '18');
INSERT INTO `product` VALUES ('39', '商品名字_39', '阿玛尼', '童装', '鞋子', '描述_39', '390', '19');
INSERT INTO `product` VALUES ('40', '商品名字_40', 'LV', '男装', '配饰', '描述_40', '400', '20');
INSERT INTO `product` VALUES ('41', '商品名字_41', '阿玛尼', '女装', '上衣', '描述_41', '410', '1');
INSERT INTO `product` VALUES ('42', '商品名字_42', 'LV', '童装', '裤子', '描述_42', '420', '2');
INSERT INTO `product` VALUES ('43', '商品名字_43', '阿玛尼', '男装', '鞋子', '描述_43', '430', '3');
INSERT INTO `product` VALUES ('44', '商品名字_44', 'LV', '女装', '配饰', '描述_44', '440', '4');
INSERT INTO `product` VALUES ('45', '商品名字_45', '阿玛尼', '童装', '上衣', '描述_45', '450', '5');
INSERT INTO `product` VALUES ('46', '商品名字_46', 'LV', '男装', '裤子', '描述_46', '460', '6');
INSERT INTO `product` VALUES ('47', '商品名字_47', '阿玛尼', '女装', '鞋子', '描述_47', '470', '7');
INSERT INTO `product` VALUES ('48', '商品名字_48', 'LV', '童装', '配饰', '描述_48', '480', '8');
INSERT INTO `product` VALUES ('49', '商品名字_49', '阿玛尼', '男装', '上衣', '描述_49', '490', '9');
INSERT INTO `product` VALUES ('50', '商品名字_50', 'LV', '女装', '裤子', '描述_50', '500', '10');
INSERT INTO `productmodeltype` VALUES ('1', 's', 'black', '55', null, '1');
INSERT INTO `productmodeltype` VALUES ('2', 'm', 'red', '60', null, '2');
INSERT INTO `productmodeltype` VALUES ('3', 'l', 'green', '65', null, '3');
INSERT INTO `productmodeltype` VALUES ('4', 'xl', 'orange', '70', null, '4');
INSERT INTO `productmodeltype` VALUES ('5', 'xxl', 'purple', '75', null, '5');
INSERT INTO `productmodeltype` VALUES ('6', 'xxxl', 'blue', '80', null, '6');
INSERT INTO `productmodeltype` VALUES ('7', 's', 'gray', '85', null, '7');
INSERT INTO `productmodeltype` VALUES ('8', 'm', 'white', '90', null, '8');
INSERT INTO `productmodeltype` VALUES ('9', 'l', 'black', '95', null, '9');
INSERT INTO `productmodeltype` VALUES ('10', 'xl', 'red', '100', null, '10');
INSERT INTO `productmodeltype` VALUES ('11', 'xxl', 'green', '105', null, '11');
INSERT INTO `productmodeltype` VALUES ('12', 'xxxl', 'orange', '110', null, '12');
INSERT INTO `productmodeltype` VALUES ('13', 's', 'purple', '115', null, '13');
INSERT INTO `productmodeltype` VALUES ('14', 'm', 'blue', '120', null, '14');
INSERT INTO `productmodeltype` VALUES ('15', 'l', 'gray', '125', null, '15');
INSERT INTO `productmodeltype` VALUES ('16', 'xl', 'white', '130', null, '16');
INSERT INTO `productmodeltype` VALUES ('17', 'xxl', 'black', '135', null, '17');
INSERT INTO `productmodeltype` VALUES ('18', 'xxxl', 'red', '140', null, '18');
INSERT INTO `productmodeltype` VALUES ('19', 's', 'green', '145', null, '19');
INSERT INTO `productmodeltype` VALUES ('20', 'm', 'orange', '150', null, '20');
INSERT INTO `productmodeltype` VALUES ('21', 'l', 'purple', '155', null, '21');
INSERT INTO `productmodeltype` VALUES ('22', 'xl', 'blue', '160', null, '22');
INSERT INTO `productmodeltype` VALUES ('23', 'xxl', 'gray', '165', null, '23');
INSERT INTO `productmodeltype` VALUES ('24', 'xxxl', 'white', '170', null, '24');
INSERT INTO `productmodeltype` VALUES ('25', 's', 'black', '175', null, '25');
INSERT INTO `productmodeltype` VALUES ('26', 'm', 'red', '180', null, '26');
INSERT INTO `productmodeltype` VALUES ('27', 'l', 'green', '185', null, '27');
INSERT INTO `productmodeltype` VALUES ('28', 'xl', 'orange', '190', null, '28');
INSERT INTO `productmodeltype` VALUES ('29', 'xxl', 'purple', '195', null, '29');
INSERT INTO `productmodeltype` VALUES ('30', 'xxxl', 'blue', '200', null, '30');
INSERT INTO `productmodeltype` VALUES ('31', 's', 'gray', '205', null, '31');
INSERT INTO `productmodeltype` VALUES ('32', 'm', 'white', '210', null, '32');
INSERT INTO `productmodeltype` VALUES ('33', 'l', 'black', '215', null, '33');
INSERT INTO `productmodeltype` VALUES ('34', 'xl', 'red', '220', null, '34');
INSERT INTO `productmodeltype` VALUES ('35', 'xxl', 'green', '225', null, '35');
INSERT INTO `productmodeltype` VALUES ('36', 'xxxl', 'orange', '230', null, '36');
INSERT INTO `productmodeltype` VALUES ('37', 's', 'purple', '235', null, '37');
INSERT INTO `productmodeltype` VALUES ('38', 'm', 'blue', '240', null, '38');
INSERT INTO `productmodeltype` VALUES ('39', 'l', 'gray', '245', null, '39');
INSERT INTO `productmodeltype` VALUES ('40', 'xl', 'white', '250', null, '40');
INSERT INTO `productmodeltype` VALUES ('41', 'xxl', 'black', '255', null, '41');
INSERT INTO `productmodeltype` VALUES ('42', 'xxxl', 'red', '260', null, '42');
INSERT INTO `productmodeltype` VALUES ('43', 's', 'green', '265', null, '43');
INSERT INTO `productmodeltype` VALUES ('44', 'm', 'orange', '270', null, '44');
INSERT INTO `productmodeltype` VALUES ('45', 'l', 'purple', '275', null, '45');
INSERT INTO `productmodeltype` VALUES ('46', 'xl', 'blue', '280', null, '46');
INSERT INTO `productmodeltype` VALUES ('47', 'xxl', 'gray', '285', null, '47');
INSERT INTO `productmodeltype` VALUES ('48', 'xxxl', 'white', '290', null, '48');
INSERT INTO `productmodeltype` VALUES ('49', 's', 'black', '295', null, '49');
INSERT INTO `productmodeltype` VALUES ('50', 'm', 'red', '300', null, '50');
INSERT INTO `productmodeltype` VALUES ('51', 'l', 'green', '305', null, '1');
INSERT INTO `productmodeltype` VALUES ('52', 'xl', 'orange', '310', null, '2');
INSERT INTO `productmodeltype` VALUES ('53', 'xxl', 'purple', '315', null, '3');
INSERT INTO `productmodeltype` VALUES ('54', 'xxxl', 'blue', '320', null, '4');
INSERT INTO `productmodeltype` VALUES ('55', 's', 'gray', '325', null, '5');
INSERT INTO `productmodeltype` VALUES ('56', 'm', 'white', '330', null, '6');
INSERT INTO `productmodeltype` VALUES ('57', 'l', 'black', '335', null, '7');
INSERT INTO `productmodeltype` VALUES ('58', 'xl', 'red', '340', null, '8');
INSERT INTO `productmodeltype` VALUES ('59', 'xxl', 'green', '345', null, '9');
INSERT INTO `productmodeltype` VALUES ('60', 'xxxl', 'orange', '350', null, '10');
INSERT INTO `productmodeltype` VALUES ('61', 's', 'purple', '355', null, '11');
INSERT INTO `productmodeltype` VALUES ('62', 'm', 'blue', '360', null, '12');
INSERT INTO `productmodeltype` VALUES ('63', 'l', 'gray', '365', null, '13');
INSERT INTO `productmodeltype` VALUES ('64', 'xl', 'white', '370', null, '14');
INSERT INTO `productmodeltype` VALUES ('65', 'xxl', 'black', '375', null, '15');
INSERT INTO `productmodeltype` VALUES ('66', 'xxxl', 'red', '380', null, '16');
INSERT INTO `productmodeltype` VALUES ('67', 's', 'green', '385', null, '17');
INSERT INTO `productmodeltype` VALUES ('68', 'm', 'orange', '390', null, '18');
INSERT INTO `productmodeltype` VALUES ('69', 'l', 'purple', '395', null, '19');
INSERT INTO `productmodeltype` VALUES ('70', 'xl', 'blue', '400', null, '20');
INSERT INTO `productmodeltype` VALUES ('71', 'xxl', 'gray', '405', null, '21');
INSERT INTO `productmodeltype` VALUES ('72', 'xxxl', 'white', '410', null, '22');
INSERT INTO `productmodeltype` VALUES ('73', 's', 'black', '415', null, '23');
INSERT INTO `productmodeltype` VALUES ('74', 'm', 'red', '420', null, '24');
INSERT INTO `productmodeltype` VALUES ('75', 'l', 'green', '425', null, '25');
INSERT INTO `productmodeltype` VALUES ('76', 'xl', 'orange', '430', null, '26');
INSERT INTO `productmodeltype` VALUES ('77', 'xxl', 'purple', '435', null, '27');
INSERT INTO `productmodeltype` VALUES ('78', 'xxxl', 'blue', '440', null, '28');
INSERT INTO `productmodeltype` VALUES ('79', 's', 'gray', '445', null, '29');
INSERT INTO `productmodeltype` VALUES ('80', 'm', 'white', '450', null, '30');
INSERT INTO `productmodeltype` VALUES ('81', 'l', 'black', '455', null, '31');
INSERT INTO `productmodeltype` VALUES ('82', 'xl', 'red', '460', null, '32');
INSERT INTO `productmodeltype` VALUES ('83', 'xxl', 'green', '465', null, '33');
INSERT INTO `productmodeltype` VALUES ('84', 'xxxl', 'orange', '470', null, '34');
INSERT INTO `productmodeltype` VALUES ('85', 's', 'purple', '475', null, '35');
INSERT INTO `productmodeltype` VALUES ('86', 'm', 'blue', '480', null, '36');
INSERT INTO `productmodeltype` VALUES ('87', 'l', 'gray', '485', null, '37');
INSERT INTO `productmodeltype` VALUES ('88', 'xl', 'white', '490', null, '38');
INSERT INTO `productmodeltype` VALUES ('89', 'xxl', 'black', '495', null, '39');
INSERT INTO `productmodeltype` VALUES ('90', 'xxxl', 'red', '500', null, '40');
INSERT INTO `productmodeltype` VALUES ('91', 's', 'green', '59', null, '41');
INSERT INTO `productmodeltype` VALUES ('92', 'm', 'orange', '64', null, '42');
INSERT INTO `productmodeltype` VALUES ('93', 'l', 'purple', '69', null, '43');
INSERT INTO `productmodeltype` VALUES ('94', 'xl', 'blue', '74', null, '44');
INSERT INTO `productmodeltype` VALUES ('95', 'xxl', 'gray', '79', null, '45');
INSERT INTO `productmodeltype` VALUES ('96', 'xxxl', 'white', '84', null, '46');
INSERT INTO `productmodeltype` VALUES ('97', 's', 'black', '89', null, '47');
INSERT INTO `productmodeltype` VALUES ('98', 'm', 'red', '94', null, '48');
INSERT INTO `productmodeltype` VALUES ('99', 'l', 'green', '99', null, '49');
INSERT INTO `productmodeltype` VALUES ('100', 'xl', 'orange', '104', null, '50');
INSERT INTO `productmodeltype` VALUES ('101', 'xxl', 'purple', '109', null, '1');
INSERT INTO `productmodeltype` VALUES ('102', 'xxxl', 'blue', '114', null, '2');
INSERT INTO `productmodeltype` VALUES ('103', 's', 'gray', '119', null, '3');
INSERT INTO `productmodeltype` VALUES ('104', 'm', 'white', '124', null, '4');
INSERT INTO `productmodeltype` VALUES ('105', 'l', 'black', '129', null, '5');
INSERT INTO `productmodeltype` VALUES ('106', 'xl', 'red', '134', null, '6');
INSERT INTO `productmodeltype` VALUES ('107', 'xxl', 'green', '139', null, '7');
INSERT INTO `productmodeltype` VALUES ('108', 'xxxl', 'orange', '144', null, '8');
INSERT INTO `productmodeltype` VALUES ('109', 's', 'purple', '149', null, '9');
INSERT INTO `productmodeltype` VALUES ('110', 'm', 'blue', '154', null, '10');
INSERT INTO `productmodeltype` VALUES ('111', 'l', 'gray', '159', null, '11');
INSERT INTO `productmodeltype` VALUES ('112', 'xl', 'white', '164', null, '12');
INSERT INTO `productmodeltype` VALUES ('113', 'xxl', 'black', '169', null, '13');
INSERT INTO `productmodeltype` VALUES ('114', 'xxxl', 'red', '174', null, '14');
INSERT INTO `productmodeltype` VALUES ('115', 's', 'green', '179', null, '15');
INSERT INTO `productmodeltype` VALUES ('116', 'm', 'orange', '184', null, '16');
INSERT INTO `productmodeltype` VALUES ('117', 'l', 'purple', '189', null, '17');
INSERT INTO `productmodeltype` VALUES ('118', 'xl', 'blue', '194', null, '18');
INSERT INTO `productmodeltype` VALUES ('119', 'xxl', 'gray', '199', null, '19');
INSERT INTO `productmodeltype` VALUES ('120', 'xxxl', 'white', '204', null, '20');
INSERT INTO `productmodeltype` VALUES ('121', 's', 'black', '209', null, '21');
INSERT INTO `productmodeltype` VALUES ('122', 'm', 'red', '214', null, '22');
INSERT INTO `productmodeltype` VALUES ('123', 'l', 'green', '219', null, '23');
INSERT INTO `productmodeltype` VALUES ('124', 'xl', 'orange', '224', null, '24');
INSERT INTO `productmodeltype` VALUES ('125', 'xxl', 'purple', '229', null, '25');
INSERT INTO `productmodeltype` VALUES ('126', 'xxxl', 'blue', '234', null, '26');
INSERT INTO `productmodeltype` VALUES ('127', 's', 'gray', '239', null, '27');
INSERT INTO `productmodeltype` VALUES ('128', 'm', 'white', '244', null, '28');
INSERT INTO `productmodeltype` VALUES ('129', 'l', 'black', '249', null, '29');
INSERT INTO `productmodeltype` VALUES ('130', 'xl', 'red', '254', null, '30');
INSERT INTO `productmodeltype` VALUES ('131', 'xxl', 'green', '259', null, '31');
INSERT INTO `productmodeltype` VALUES ('132', 'xxxl', 'orange', '264', null, '32');
INSERT INTO `productmodeltype` VALUES ('133', 's', 'purple', '269', null, '33');
INSERT INTO `productmodeltype` VALUES ('134', 'm', 'blue', '274', null, '34');
INSERT INTO `productmodeltype` VALUES ('135', 'l', 'gray', '279', null, '35');
INSERT INTO `productmodeltype` VALUES ('136', 'xl', 'white', '284', null, '36');
INSERT INTO `productmodeltype` VALUES ('137', 'xxl', 'black', '289', null, '37');
INSERT INTO `productmodeltype` VALUES ('138', 'xxxl', 'red', '294', null, '38');
INSERT INTO `productmodeltype` VALUES ('139', 's', 'green', '299', null, '39');
INSERT INTO `productmodeltype` VALUES ('140', 'm', 'orange', '304', null, '40');
INSERT INTO `productmodeltype` VALUES ('141', 'l', 'purple', '309', null, '41');
INSERT INTO `productmodeltype` VALUES ('142', 'xl', 'blue', '314', null, '42');
INSERT INTO `productmodeltype` VALUES ('143', 'xxl', 'gray', '319', null, '43');
INSERT INTO `productmodeltype` VALUES ('144', 'xxxl', 'white', '324', null, '44');
INSERT INTO `productmodeltype` VALUES ('145', 's', 'black', '329', null, '45');
INSERT INTO `productmodeltype` VALUES ('146', 'm', 'red', '334', null, '46');
INSERT INTO `productmodeltype` VALUES ('147', 'l', 'green', '339', null, '47');
INSERT INTO `productmodeltype` VALUES ('148', 'xl', 'orange', '344', null, '48');
INSERT INTO `productmodeltype` VALUES ('149', 'xxl', 'purple', '349', null, '49');
INSERT INTO `productmodeltype` VALUES ('150', 'xxxl', 'blue', '354', null, '50');
INSERT INTO `productmodeltype` VALUES ('151', 's', 'gray', '359', null, '1');
INSERT INTO `productmodeltype` VALUES ('152', 'm', 'white', '364', null, '2');
INSERT INTO `productmodeltype` VALUES ('153', 'l', 'black', '369', null, '3');
INSERT INTO `productmodeltype` VALUES ('154', 'xl', 'red', '374', null, '4');
INSERT INTO `productmodeltype` VALUES ('155', 'xxl', 'green', '379', null, '5');
INSERT INTO `productmodeltype` VALUES ('156', 'xxxl', 'orange', '384', null, '6');
INSERT INTO `productmodeltype` VALUES ('157', 's', 'purple', '389', null, '7');
INSERT INTO `productmodeltype` VALUES ('158', 'm', 'blue', '394', null, '8');
INSERT INTO `productmodeltype` VALUES ('159', 'l', 'gray', '399', null, '9');
INSERT INTO `productmodeltype` VALUES ('160', 'xl', 'white', '404', null, '10');
INSERT INTO `productmodeltype` VALUES ('161', 'xxl', 'black', '409', null, '11');
INSERT INTO `productmodeltype` VALUES ('162', 'xxxl', 'red', '414', null, '12');
INSERT INTO `productmodeltype` VALUES ('163', 's', 'green', '419', null, '13');
INSERT INTO `productmodeltype` VALUES ('164', 'm', 'orange', '424', null, '14');
INSERT INTO `productmodeltype` VALUES ('165', 'l', 'purple', '429', null, '15');
INSERT INTO `productmodeltype` VALUES ('166', 'xl', 'blue', '434', null, '16');
INSERT INTO `productmodeltype` VALUES ('167', 'xxl', 'gray', '439', null, '17');
INSERT INTO `productmodeltype` VALUES ('168', 'xxxl', 'white', '444', null, '18');
INSERT INTO `productmodeltype` VALUES ('169', 's', 'black', '449', null, '19');
INSERT INTO `productmodeltype` VALUES ('170', 'm', 'red', '454', null, '20');
INSERT INTO `productmodeltype` VALUES ('171', 'l', 'green', '459', null, '21');
INSERT INTO `productmodeltype` VALUES ('172', 'xl', 'orange', '464', null, '22');
INSERT INTO `productmodeltype` VALUES ('173', 'xxl', 'purple', '469', null, '23');
INSERT INTO `productmodeltype` VALUES ('174', 'xxxl', 'blue', '474', null, '24');
INSERT INTO `productmodeltype` VALUES ('175', 's', 'gray', '479', null, '25');
INSERT INTO `productmodeltype` VALUES ('176', 'm', 'white', '484', null, '26');
INSERT INTO `productmodeltype` VALUES ('177', 'l', 'black', '489', null, '27');
INSERT INTO `productmodeltype` VALUES ('178', 'xl', 'red', '494', null, '28');
INSERT INTO `productmodeltype` VALUES ('179', 'xxl', 'green', '499', null, '29');
INSERT INTO `productmodeltype` VALUES ('180', 'xxxl', 'orange', '58', null, '30');
INSERT INTO `productmodeltype` VALUES ('181', 's', 'purple', '63', null, '31');
INSERT INTO `productmodeltype` VALUES ('182', 'm', 'blue', '68', null, '32');
INSERT INTO `productmodeltype` VALUES ('183', 'l', 'gray', '73', null, '33');
INSERT INTO `productmodeltype` VALUES ('184', 'xl', 'white', '78', null, '34');
INSERT INTO `productmodeltype` VALUES ('185', 'xxl', 'black', '83', null, '35');
INSERT INTO `productmodeltype` VALUES ('186', 'xxxl', 'red', '88', null, '36');
INSERT INTO `productmodeltype` VALUES ('187', 's', 'green', '93', null, '37');
INSERT INTO `productmodeltype` VALUES ('188', 'm', 'orange', '98', null, '38');
INSERT INTO `productmodeltype` VALUES ('189', 'l', 'purple', '103', null, '39');
INSERT INTO `productmodeltype` VALUES ('190', 'xl', 'blue', '108', null, '40');
INSERT INTO `productmodeltype` VALUES ('191', 'xxl', 'gray', '113', null, '41');
INSERT INTO `productmodeltype` VALUES ('192', 'xxxl', 'white', '118', null, '42');
INSERT INTO `productmodeltype` VALUES ('193', 's', 'black', '123', null, '43');
INSERT INTO `productmodeltype` VALUES ('194', 'm', 'red', '128', null, '44');
INSERT INTO `productmodeltype` VALUES ('195', 'l', 'green', '133', null, '45');
INSERT INTO `productmodeltype` VALUES ('196', 'xl', 'orange', '138', null, '46');
INSERT INTO `productmodeltype` VALUES ('197', 'xxl', 'purple', '143', null, '47');
INSERT INTO `productmodeltype` VALUES ('198', 'xxxl', 'blue', '148', null, '48');
INSERT INTO `productmodeltype` VALUES ('199', 's', 'gray', '153', null, '49');
INSERT INTO `productmodeltype` VALUES ('200', 'm', 'white', '158', null, '50');
INSERT INTO `productmodeltype` VALUES ('201', 'l', 'black', '163', null, '1');
INSERT INTO `productmodeltype` VALUES ('202', 'xl', 'red', '168', null, '2');
INSERT INTO `productmodeltype` VALUES ('203', 'xxl', 'green', '173', null, '3');
INSERT INTO `productmodeltype` VALUES ('204', 'xxxl', 'orange', '178', null, '4');
INSERT INTO `productmodeltype` VALUES ('205', 's', 'purple', '183', null, '5');
INSERT INTO `productmodeltype` VALUES ('206', 'm', 'blue', '188', null, '6');
INSERT INTO `productmodeltype` VALUES ('207', 'l', 'gray', '193', null, '7');
INSERT INTO `productmodeltype` VALUES ('208', 'xl', 'white', '198', null, '8');
INSERT INTO `productmodeltype` VALUES ('209', 'xxl', 'black', '203', null, '9');
INSERT INTO `productmodeltype` VALUES ('210', 'xxxl', 'red', '208', null, '10');
INSERT INTO `productmodeltype` VALUES ('211', 's', 'green', '213', null, '11');
INSERT INTO `productmodeltype` VALUES ('212', 'm', 'orange', '218', null, '12');
INSERT INTO `productmodeltype` VALUES ('213', 'l', 'purple', '223', null, '13');
INSERT INTO `productmodeltype` VALUES ('214', 'xl', 'blue', '228', null, '14');
INSERT INTO `productmodeltype` VALUES ('215', 'xxl', 'gray', '233', null, '15');
INSERT INTO `productmodeltype` VALUES ('216', 'xxxl', 'white', '238', null, '16');
INSERT INTO `productmodeltype` VALUES ('217', 's', 'black', '243', null, '17');
INSERT INTO `productmodeltype` VALUES ('218', 'm', 'red', '248', null, '18');
INSERT INTO `productmodeltype` VALUES ('219', 'l', 'green', '253', null, '19');
INSERT INTO `productmodeltype` VALUES ('220', 'xl', 'orange', '258', null, '20');
INSERT INTO `producttype` VALUES ('1', '类型名_1');
INSERT INTO `producttype` VALUES ('2', '类型名_2');
INSERT INTO `producttype` VALUES ('3', '类型名_3');
INSERT INTO `producttype` VALUES ('4', '类型名_4');
INSERT INTO `producttype` VALUES ('5', '类型名_5');
INSERT INTO `producttype` VALUES ('6', '类型名_6');
INSERT INTO `producttype` VALUES ('7', '类型名_7');
INSERT INTO `producttype` VALUES ('8', '类型名_8');
INSERT INTO `producttype` VALUES ('9', '类型名_9');
INSERT INTO `producttype` VALUES ('10', '类型名_10');
INSERT INTO `producttype` VALUES ('11', '类型名_11');
INSERT INTO `producttype` VALUES ('12', '类型名_12');
INSERT INTO `producttype` VALUES ('13', '类型名_13');
INSERT INTO `producttype` VALUES ('14', '类型名_14');
INSERT INTO `producttype` VALUES ('15', '类型名_15');
INSERT INTO `producttype` VALUES ('16', '类型名_16');
INSERT INTO `producttype` VALUES ('17', '类型名_17');
INSERT INTO `producttype` VALUES ('18', '类型名_18');
INSERT INTO `producttype` VALUES ('19', '类型名_19');
INSERT INTO `producttype` VALUES ('20', '类型名_20');
INSERT INTO `users` VALUES ('1', 'username_1', 'pass_1', '真实姓名_1', '', '1', 'i_1', '');
INSERT INTO `users` VALUES ('2', 'username_2', 'pass_2', '真实姓名_2', '', '2', 'i_2', '');
INSERT INTO `users` VALUES ('3', 'username_3', 'pass_3', '真实姓名_3', '', '3', 'i_3', '');
INSERT INTO `users` VALUES ('4', 'username_4', 'pass_4', '真实姓名_4', '', '4', 'i_4', '');
INSERT INTO `users` VALUES ('5', 'username_5', 'pass_5', '真实姓名_5', '', '5', 'i_5', '');
INSERT INTO `users` VALUES ('6', 'username_6', 'pass_6', '真实姓名_6', '', '6', 'i_6', '');
INSERT INTO `users` VALUES ('7', 'username_7', 'pass_7', '真实姓名_7', '', '7', 'i_7', '');
INSERT INTO `users` VALUES ('8', 'username_8', 'pass_8', '真实姓名_8', '', '8', 'i_8', '');
INSERT INTO `users` VALUES ('9', 'username_9', 'pass_9', '真实姓名_9', '', '9', 'i_9', '');
INSERT INTO `users` VALUES ('10', 'username_10', 'pass_10', '真实姓名_10', '', '10', 'i_10', '');
INSERT INTO `users` VALUES ('11', 'username_11', 'pass_11', '真实姓名_11', '', '11', 'image_11', '');
INSERT INTO `users` VALUES ('12', 'username_12', 'pass_12', '真实姓名_12', '', '12', 'image_12', '');
INSERT INTO `users` VALUES ('13', 'username_13', 'pass_13', '真实姓名_13', '', '13', 'image_13', '');
INSERT INTO `users` VALUES ('14', 'username_14', 'pass_14', '真实姓名_14', '', '14', 'image_14', '');
INSERT INTO `users` VALUES ('15', 'username_15', 'pass_15', '真实姓名_15', '', '15', 'image_15', '');
INSERT INTO `users` VALUES ('16', 'username_16', 'pass_16', '真实姓名_16', '', '16', 'image_16', '');
INSERT INTO `users` VALUES ('17', 'username_17', 'pass_17', '真实姓名_17', '', '17', 'image_17', '');
INSERT INTO `users` VALUES ('18', 'username_18', 'pass_18', '真实姓名_18', '', '18', 'image_18', '');
INSERT INTO `users` VALUES ('19', 'username_19', 'pass_19', '真实姓名_19', '', '19', 'image_19', '');
INSERT INTO `users` VALUES ('20', 'username_20', 'pass_20', '真实姓名_20', '', '20', 'image_20', '');
