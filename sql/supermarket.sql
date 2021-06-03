/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : supermarket

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 03/06/2021 14:25:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 't_goods', '商品表', NULL, NULL, 'TGoods', 'crud', 'com.ruoyi.system', 'system', 'goods', '商品', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-09 08:59:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 't_goods_type', '商品类型表', NULL, NULL, 'TGoodsType', 'crud', 'com.ruoyi.system', 'system', 'type', '商品类型', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-09 08:59:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 't_inbound_detail', '入库单明细表', NULL, NULL, 'TInboundDetail', 'crud', 'com.ruoyi.system', 'system', 'detail', '入库单明细', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-09 08:59:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 't_outbound_detail', '出库单明细表', NULL, NULL, 'TOutboundDetail', 'crud', 'com.ruoyi.system', 'system', 'detail', '出库单明细', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-09 08:59:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 't_supplier', '供货商表', NULL, NULL, 'TSupplier', 'crud', 'com.ruoyi.system', 'system', 'supplier', '供货商', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-09 08:59:57', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 't_inventory_record', '盘点记录表', NULL, NULL, 'TInventoryRecord', 'crud', 'com.ruoyi.system', 'system', 'record', '盘点记录', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-10 07:05:18', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 't_inbound', '入库单表', NULL, NULL, 'TInbound', 'crud', 'com.ruoyi.system', 'system', 'inbound', '入库单', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-11 05:14:49', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 't_outbound', '出库单表', NULL, NULL, 'TOutbound', 'crud', 'com.ruoyi.system', 'system', 'outbound', '出库单', 'ruoyi', '0', '/', NULL, 'admin', '2020-12-11 05:14:49', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'worker_node', 'DB WorkerID Assigner for UID Generator', NULL, NULL, 'WorkerNode', 'crud', 'com.ruoyi.system', 'system', 'node', 'DB WorkerID Assigner for UID Generator', 'ruoyi', '0', '/', NULL, 'admin', '2021-06-01 20:12:32', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (8, '3', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '3', 'name', '名称', 'varchar(50)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '3', 'type_id', '类型ID', 'bigint(20)', 'Long', 'typeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '3', 'num', '库存', 'decimal(9,2)', 'BigDecimal', 'num', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '3', 'price', '价格', 'decimal(9,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '3', 'unit', '单位', 'varchar(9)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '4', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '4', 'type_name', '类型名称', 'varchar(50)', 'String', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '6', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '6', 'inbound_code', '入库单号', 'varchar(50)', 'String', 'inboundCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '6', 'goods_id', '商品ID', 'bigint(20)', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '6', 'num', '数量', 'decimal(10,0)', 'Long', 'num', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '8', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '8', 'outbound_code', '出库单号', 'varchar(50)', 'String', 'outboundCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-09 08:59:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '8', 'goods_id', '商品ID', 'bigint(20)', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '8', 'num', '数量', 'decimal(10,0)', 'Long', 'num', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '9', 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '9', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '9', 'supplier_name', '名称', 'varchar(50)', 'String', 'supplierName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '9', 'phone', '电话', 'varchar(20)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '9', 'wechat', '微信', 'varchar(20)', 'String', 'wechat', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '9', 'address', '地址', 'varchar(100)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-09 08:59:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '12', 'id', 'ID', 'bigint(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-10 07:05:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-10 07:05:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-10 07:05:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '12', 'goods_id', '商品ID', 'bigint(11)', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-10 07:05:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '12', 'old_num', '原库存', 'decimal(9,2)', 'BigDecimal', 'oldNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-10 07:05:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '12', 'new_num', '新库存', 'decimal(9,2)', 'BigDecimal', 'newNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-10 07:05:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '13', 'id', 'ID', 'bigint(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, '13', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, '13', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, '13', 'inbound_code', '入库单号', 'varchar(50)', 'String', 'inboundCode', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, '13', 'status', '单据状态', 'varchar(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, '14', 'id', 'ID', 'bigint(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, '14', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, '14', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, '14', 'outbound_code', '出库单号', 'varchar(50)', 'String', 'outboundCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, '14', 'status', '单据状态', 'varchar(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2020-12-11 05:14:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, '15', 'ID', 'auto increment id', 'bigint(20)', 'Long', 'ID', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-06-01 20:12:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, '15', 'HOST_NAME', 'host name', 'varchar(64)', 'String', 'hostName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-06-01 20:12:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, '15', 'PORT', 'port', 'varchar(64)', 'String', 'PORT', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-06-01 20:12:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '15', 'TYPE', 'node type: ACTUAL or CONTAINER', 'int(11)', 'Long', 'TYPE', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2021-06-01 20:12:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '15', 'LAUNCH_DATE', 'launch date', 'date', 'Date', 'launchDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2021-06-01 20:12:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '15', 'MODIFIED', 'modified time', 'timestamp', 'Date', 'MODIFIED', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-06-01 20:12:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '15', 'CREATED', 'created time', 'timestamp', 'Date', 'CREATED', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-06-01 20:12:32', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2021-01-01 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2021-01-01 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2021-01-01 11:33:00', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2021-01-01 11:33:00', '是否开启注册用户功能');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2021-01-01 11:33:00', '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数组和特殊字符（密码必须包含字母，数字，特殊字符-_）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '超市管理系统', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-14 01:39:34');
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '财务部', 1, '', '', '', '0', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-14 01:39:34');
INSERT INTO `sys_dept` VALUES (111, 100, '0,100', '仓库部', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-12-14 01:39:27', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '件', '1', 'sys_unit', NULL, 'info', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '个', '2', 'sys_unit', NULL, 'info', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 3, 'kg', '3', 'sys_unit', NULL, 'info', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 4, '箱', '4', 'sys_unit', NULL, 'info', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 5, '瓶', '5', 'sys_unit', '', 'info', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES (35, 6, '桶', '6', 'sys_unit', NULL, 'info', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', NULL);
INSERT INTO `sys_dict_data` VALUES (36, 1, '新建', '1', 'sys_bound_status', '', 'warning', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '');
INSERT INTO `sys_dict_data` VALUES (37, 2, '完成', '2', 'sys_bound_status', '', 'primary', 'Y', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '单位', 'sys_unit', '0', 'admin', '2021-01-01 11:33:00', '', '2021-01-01 11:33:00', NULL);
INSERT INTO `sys_dict_type` VALUES (12, '单据状态', 'sys_bound_status', '0', 'admin', '2021-01-01 11:33:00', '', '2021-01-01 11:33:00', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2934 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (2866, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 01:38:53');
INSERT INTO `sys_logininfor` VALUES (2867, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 01:38:57');
INSERT INTO `sys_logininfor` VALUES (2868, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 01:43:20');
INSERT INTO `sys_logininfor` VALUES (2869, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-12-14 01:43:29');
INSERT INTO `sys_logininfor` VALUES (2870, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2020-12-14 01:43:35');
INSERT INTO `sys_logininfor` VALUES (2871, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-12-14 01:43:40');
INSERT INTO `sys_logininfor` VALUES (2872, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 01:43:48');
INSERT INTO `sys_logininfor` VALUES (2873, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2020-12-14 01:43:55');
INSERT INTO `sys_logininfor` VALUES (2874, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误4次', '2020-12-14 01:44:00');
INSERT INTO `sys_logininfor` VALUES (2875, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 01:44:27');
INSERT INTO `sys_logininfor` VALUES (2876, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 01:44:29');
INSERT INTO `sys_logininfor` VALUES (2877, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 01:44:58');
INSERT INTO `sys_logininfor` VALUES (2878, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误5次', '2020-12-14 01:45:06');
INSERT INTO `sys_logininfor` VALUES (2879, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 01:45:22');
INSERT INTO `sys_logininfor` VALUES (2880, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2020-12-14 01:45:25');
INSERT INTO `sys_logininfor` VALUES (2881, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 01:45:52');
INSERT INTO `sys_logininfor` VALUES (2882, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-12-14 01:46:53');
INSERT INTO `sys_logininfor` VALUES (2883, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 01:47:04');
INSERT INTO `sys_logininfor` VALUES (2884, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 01:47:53');
INSERT INTO `sys_logininfor` VALUES (2885, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 01:47:57');
INSERT INTO `sys_logininfor` VALUES (2886, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 01:57:24');
INSERT INTO `sys_logininfor` VALUES (2887, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 01:57:38');
INSERT INTO `sys_logininfor` VALUES (2888, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 02:00:36');
INSERT INTO `sys_logininfor` VALUES (2889, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-12-14 02:00:46');
INSERT INTO `sys_logininfor` VALUES (2890, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2020-12-14 02:01:26');
INSERT INTO `sys_logininfor` VALUES (2891, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 02:01:29');
INSERT INTO `sys_logininfor` VALUES (2892, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 02:03:01');
INSERT INTO `sys_logininfor` VALUES (2893, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 02:03:04');
INSERT INTO `sys_logininfor` VALUES (2894, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 02:03:07');
INSERT INTO `sys_logininfor` VALUES (2895, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 02:45:10');
INSERT INTO `sys_logininfor` VALUES (2896, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-12-14 02:45:18');
INSERT INTO `sys_logininfor` VALUES (2897, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 02:45:26');
INSERT INTO `sys_logininfor` VALUES (2898, 'lisi', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 02:45:35');
INSERT INTO `sys_logininfor` VALUES (2899, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 02:45:40');
INSERT INTO `sys_logininfor` VALUES (2900, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 02:45:44');
INSERT INTO `sys_logininfor` VALUES (2901, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 02:45:49');
INSERT INTO `sys_logininfor` VALUES (2902, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 02:45:52');
INSERT INTO `sys_logininfor` VALUES (2903, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 05:04:37');
INSERT INTO `sys_logininfor` VALUES (2904, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 05:05:56');
INSERT INTO `sys_logininfor` VALUES (2905, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 05:06:10');
INSERT INTO `sys_logininfor` VALUES (2906, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-14 05:06:15');
INSERT INTO `sys_logininfor` VALUES (2907, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 05:06:18');
INSERT INTO `sys_logininfor` VALUES (2908, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 05:25:04');
INSERT INTO `sys_logininfor` VALUES (2909, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 05:25:09');
INSERT INTO `sys_logininfor` VALUES (2910, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 05:26:15');
INSERT INTO `sys_logininfor` VALUES (2911, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 05:26:20');
INSERT INTO `sys_logininfor` VALUES (2912, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-14 05:27:07');
INSERT INTO `sys_logininfor` VALUES (2913, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 05:27:11');
INSERT INTO `sys_logininfor` VALUES (2914, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-14 06:28:29');
INSERT INTO `sys_logininfor` VALUES (2915, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-15 01:00:33');
INSERT INTO `sys_logininfor` VALUES (2916, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-15 02:07:12');
INSERT INTO `sys_logininfor` VALUES (2917, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-15 02:07:16');
INSERT INTO `sys_logininfor` VALUES (2918, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-15 02:07:41');
INSERT INTO `sys_logininfor` VALUES (2919, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-15 02:07:44');
INSERT INTO `sys_logininfor` VALUES (2920, 'admin', '112.64.6.102', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-15 02:24:14');
INSERT INTO `sys_logininfor` VALUES (2921, 'admin', '112.64.6.102', 'XX XX', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-12-15 02:24:45');
INSERT INTO `sys_logininfor` VALUES (2922, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-06-01 19:44:17');
INSERT INTO `sys_logininfor` VALUES (2923, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-06-01 19:44:29');
INSERT INTO `sys_logininfor` VALUES (2924, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2021-06-01 19:44:36');
INSERT INTO `sys_logininfor` VALUES (2925, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误4次', '2021-06-01 19:44:40');
INSERT INTO `sys_logininfor` VALUES (2926, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误5次', '2021-06-01 19:46:01');
INSERT INTO `sys_logininfor` VALUES (2927, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2021-06-01 19:47:32');
INSERT INTO `sys_logininfor` VALUES (2928, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误6次', '2021-06-01 19:50:15');
INSERT INTO `sys_logininfor` VALUES (2929, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-01 19:50:22');
INSERT INTO `sys_logininfor` VALUES (2930, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-06-01 20:12:14');
INSERT INTO `sys_logininfor` VALUES (2931, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-01 20:12:18');
INSERT INTO `sys_logininfor` VALUES (2932, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-02 13:59:47');
INSERT INTO `sys_logininfor` VALUES (2933, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-06-03 14:20:22');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2058 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 11, '#', 'menuItem', 'M', '0', '', 'fa fa-gear', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 13, '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 14, '#', 'menuItem', 'M', '0', '', 'fa fa-bars', 'admin', '2021-01-01 11:33:00', 'admin', '2021-06-01 20:12:11', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '出库管理', 0, 3, '#', 'menuItem', 'M', '0', '', 'fa fa-car', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2003, '出库单明细', 2000, 1, '/system/outboundDetail', 'menuItem', 'C', '0', 'system:detail:view', '#', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '出库单明细菜单');
INSERT INTO `sys_menu` VALUES (2004, '出库单明细查询', 2003, 1, '#', '', 'F', '0', 'system:detail:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2005, '出库单明细新增', 2003, 2, '#', '', 'F', '0', 'system:detail:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2006, '出库单明细修改', 2003, 3, '#', '', 'F', '0', 'system:detail:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2007, '出库单明细删除', 2003, 4, '#', '', 'F', '0', 'system:detail:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2008, '出库单明细导出', 2003, 5, '#', '', 'F', '0', 'system:detail:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2009, '商品信息', 2052, 3, '/system/goods', 'menuItem', 'C', '0', 'system:goods:view', '#', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-15 02:07:40', '商品菜单');
INSERT INTO `sys_menu` VALUES (2010, '商品查询', 2009, 1, '#', '', 'F', '0', 'system:goods:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2011, '商品新增', 2009, 2, '#', '', 'F', '0', 'system:goods:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2012, '商品修改', 2009, 3, '#', '', 'F', '0', 'system:goods:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2013, '商品删除', 2009, 4, '#', '', 'F', '0', 'system:goods:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2014, '商品导出', 2009, 5, '#', '', 'F', '0', 'system:goods:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2015, '入库单', 2051, 1, '/system/inbound', '', 'C', '0', 'system:inbound:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '入库单菜单');
INSERT INTO `sys_menu` VALUES (2016, '入库单查询', 2015, 1, '#', '', 'F', '0', 'system:inbound:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2017, '入库单新增', 2015, 2, '#', '', 'F', '0', 'system:inbound:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2018, '入库单修改', 2015, 3, '#', '', 'F', '0', 'system:inbound:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2019, '入库单删除', 2015, 4, '#', '', 'F', '0', 'system:inbound:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2020, '入库单导出', 2015, 5, '#', '', 'F', '0', 'system:inbound:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2021, '出库单', 2000, 2, '/system/outbound', 'menuItem', 'C', '0', 'system:outbound:view', '#', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '出库单菜单');
INSERT INTO `sys_menu` VALUES (2022, '出库单查询', 2021, 1, '#', '', 'F', '0', 'system:outbound:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2023, '出库单新增', 2021, 2, '#', '', 'F', '0', 'system:outbound:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2024, '出库单修改', 2021, 3, '#', '', 'F', '0', 'system:outbound:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2025, '出库单删除', 2021, 4, '#', '', 'F', '0', 'system:outbound:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2026, '出库单导出', 2021, 5, '#', '', 'F', '0', 'system:outbound:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2027, '盘点记录', 2053, 2, '/system/record', 'menuItem', 'C', '0', 'system:record:view', '#', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '盘点记录菜单');
INSERT INTO `sys_menu` VALUES (2028, '盘点记录查询', 2027, 1, '#', '', 'F', '0', 'system:record:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2029, '盘点记录新增', 2027, 2, '#', '', 'F', '0', 'system:record:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2030, '盘点记录修改', 2027, 3, '#', '', 'F', '0', 'system:record:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2031, '盘点记录删除', 2027, 4, '#', '', 'F', '0', 'system:record:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2032, '盘点记录导出', 2027, 5, '#', '', 'F', '0', 'system:record:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2033, '供货商', 2052, 1, '/system/supplier', '', 'C', '0', 'system:supplier:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '供货商菜单');
INSERT INTO `sys_menu` VALUES (2034, '供货商查询', 2033, 1, '#', '', 'F', '0', 'system:supplier:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2035, '供货商新增', 2033, 2, '#', '', 'F', '0', 'system:supplier:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2036, '供货商修改', 2033, 3, '#', '', 'F', '0', 'system:supplier:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2037, '供货商删除', 2033, 4, '#', '', 'F', '0', 'system:supplier:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2038, '供货商导出', 2033, 5, '#', '', 'F', '0', 'system:supplier:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2039, '商品类型', 2052, 2, '/system/type', 'menuItem', 'C', '0', 'system:type:view', '#', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-15 02:07:34', '商品类型菜单');
INSERT INTO `sys_menu` VALUES (2040, '商品类型查询', 2039, 1, '#', '', 'F', '0', 'system:type:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2041, '商品类型新增', 2039, 2, '#', '', 'F', '0', 'system:type:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2042, '商品类型修改', 2039, 3, '#', '', 'F', '0', 'system:type:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2043, '商品类型删除', 2039, 4, '#', '', 'F', '0', 'system:type:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2044, '商品类型导出', 2039, 5, '#', '', 'F', '0', 'system:type:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2045, '入库单明细', 2051, 2, '/system/inboundDetail', 'menuItem', 'C', '0', 'system:detail:view', '#', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '入库单明细菜单');
INSERT INTO `sys_menu` VALUES (2046, '入库单明细查询', 2045, 1, '#', '', 'F', '0', 'system:detail:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2047, '入库单明细新增', 2045, 2, '#', '', 'F', '0', 'system:detail:add', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2048, '入库单明细修改', 2045, 3, '#', '', 'F', '0', 'system:detail:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2049, '入库单明细删除', 2045, 4, '#', '', 'F', '0', 'system:detail:remove', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2050, '入库单明细导出', 2045, 5, '#', '', 'F', '0', 'system:detail:export', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2051, '入库管理', 0, 2, '#', 'menuItem', 'M', '0', NULL, 'fa fa-truck', 'admin', '2021-01-01 11:33:00', '', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2052, '商品管理', 0, 1, '#', 'menuItem', 'M', '0', NULL, 'fa fa-male', 'admin', '2021-01-01 11:33:00', '', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2053, '盘点管理', 0, 4, '#', 'menuItem', 'M', '0', NULL, 'fa fa-balance-scale', 'admin', '2021-01-01 11:33:00', '', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2054, '库存盘点', 2053, 1, '/system/inventory', '', 'C', '0', 'system:inventory:view', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '商品菜单');
INSERT INTO `sys_menu` VALUES (2055, '商品查询', 2054, 1, '#', '', 'F', '0', 'system:inventory:list', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2057, '商品修改', 2054, 3, '#', '', 'F', '0', 'system:inventory:edit', '#', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3530 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (3105, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '开发部门', '/system/menu/remove/111', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:26:49');
INSERT INTO `sys_oper_log` VALUES (3106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '开发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"110\" ],\r\n  \"parentId\" : [ \"2\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"定时任务\" ],\r\n  \"url\" : [ \"/monitor/job\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"monitor:job:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:27:07');
INSERT INTO `sys_oper_log` VALUES (3107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '开发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"111\" ],\r\n  \"parentId\" : [ \"2\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"数据监控\" ],\r\n  \"url\" : [ \"/monitor/data\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"monitor:data:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:27:22');
INSERT INTO `sys_oper_log` VALUES (3108, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/110', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"存在子菜单,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:27:37');
INSERT INTO `sys_oper_log` VALUES (3109, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1056', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:27:52');
INSERT INTO `sys_oper_log` VALUES (3110, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1056', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:29:10');
INSERT INTO `sys_oper_log` VALUES (3111, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1056', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:30:03');
INSERT INTO `sys_oper_log` VALUES (3112, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:30:32');
INSERT INTO `sys_oper_log` VALUES (3113, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1056', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:30:46');
INSERT INTO `sys_oper_log` VALUES (3114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/110', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"存在子菜单,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:30:58');
INSERT INTO `sys_oper_log` VALUES (3115, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1055', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:04');
INSERT INTO `sys_oper_log` VALUES (3116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1054', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:15');
INSERT INTO `sys_oper_log` VALUES (3117, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1053', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:21');
INSERT INTO `sys_oper_log` VALUES (3118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1052', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:26');
INSERT INTO `sys_oper_log` VALUES (3119, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1051', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:32');
INSERT INTO `sys_oper_log` VALUES (3120, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1050', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:36');
INSERT INTO `sys_oper_log` VALUES (3121, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/110', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:40');
INSERT INTO `sys_oper_log` VALUES (3122, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/111', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:31:45');
INSERT INTO `sys_oper_log` VALUES (3123, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,112\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:33:48');
INSERT INTO `sys_oper_log` VALUES (3124, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"deptName\" : [ \"售货部\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:37:28');
INSERT INTO `sys_oper_log` VALUES (3125, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"售货部\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@163.com\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"1\" ]\r\n}', 'null', 1, '不允许操作超级管理员用户', '2020-12-09 08:37:39');
INSERT INTO `sys_oper_log` VALUES (3126, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"售货部\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:37:53');
INSERT INTO `sys_oper_log` VALUES (3127, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/101', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"存在下级部门,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:38:50');
INSERT INTO `sys_oper_log` VALUES (3128, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:38:55');
INSERT INTO `sys_oper_log` VALUES (3129, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/104', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:38:57');
INSERT INTO `sys_oper_log` VALUES (3130, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:38:59');
INSERT INTO `sys_oper_log` VALUES (3131, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:39:01');
INSERT INTO `sys_oper_log` VALUES (3132, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/105', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:39:02');
INSERT INTO `sys_oper_log` VALUES (3133, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/110', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-12-09 08:39:08');
INSERT INTO `sys_oper_log` VALUES (3134, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/101', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:39:11');
INSERT INTO `sys_oper_log` VALUES (3135, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:39:13');
INSERT INTO `sys_oper_log` VALUES (3136, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:39:14');
INSERT INTO `sys_oper_log` VALUES (3137, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/102', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:39:16');
INSERT INTO `sys_oper_log` VALUES (3138, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '售货部', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1,2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:59:20');
INSERT INTO `sys_oper_log` VALUES (3139, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '售货部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_supplier,t_outbound_detail,t_inbound,t_inbound_detail,t_goods,t_goods_type,t_outbound\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 08:59:57');
INSERT INTO `sys_oper_log` VALUES (3140, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '售货部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_goods_type\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 09:00:07');
INSERT INTO `sys_oper_log` VALUES (3141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '售货部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_goods_type,t_supplier,t_goods,t_inbound,t_inbound_detail,t_outbound,t_outbound_detail\" ]\r\n}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2020-12-09 09:00:14');
INSERT INTO `sys_oper_log` VALUES (3142, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '售货部', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 09:01:34');
INSERT INTO `sys_oper_log` VALUES (3143, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '售货部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_inventory_record\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-09 09:02:18');
INSERT INTO `sys_oper_log` VALUES (3144, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '售货部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_inventory_record,t_supplier,t_goods,t_goods_type,t_inbound,t_inbound_detail,t_outbound,t_outbound_detail\" ]\r\n}', 'null', 0, NULL, '2020-12-09 09:02:31');
INSERT INTO `sys_oper_log` VALUES (3145, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '售货部', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"4,3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 01:53:31');
INSERT INTO `sys_oper_log` VALUES (3146, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '售货部', '/tool/gen/download/t_outbound_detail', '127.0.0.1', '内网IP', '{ }', 'null', 0, NULL, '2020-12-10 01:54:57');
INSERT INTO `sys_oper_log` VALUES (3147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '售货部', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:04:50');
INSERT INTO `sys_oper_log` VALUES (3148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"出库管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-car\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:05:32');
INSERT INTO `sys_oper_log` VALUES (3149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"出库管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-car\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:05:53');
INSERT INTO `sys_oper_log` VALUES (3150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"出库管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-car\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:05:59');
INSERT INTO `sys_oper_log` VALUES (3151, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '售货部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"入库管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"fa fa-truck\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:06:42');
INSERT INTO `sys_oper_log` VALUES (3152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"出库管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-car\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:07:08');
INSERT INTO `sys_oper_log` VALUES (3153, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '售货部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"商品管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"fa fa-male\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:07:43');
INSERT INTO `sys_oper_log` VALUES (3154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2000\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"出库管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-car\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:08:14');
INSERT INTO `sys_oper_log` VALUES (3155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"11\" ],\r\n  \"icon\" : [ \"fa fa-gear\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:08:25');
INSERT INTO `sys_oper_log` VALUES (3156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"4\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"若依官网\" ],\r\n  \"url\" : [ \"http://ruoyi.vip\" ],\r\n  \"target\" : [ \"menuBlank\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"14\" ],\r\n  \"icon\" : [ \"fa fa-location-arrow\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:08:38');
INSERT INTO `sys_oper_log` VALUES (3157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '售货部', '/system/menu/remove/4', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:08:43');
INSERT INTO `sys_oper_log` VALUES (3158, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统监控\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"12\" ],\r\n  \"icon\" : [ \"fa fa-video-camera\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:08:53');
INSERT INTO `sys_oper_log` VALUES (3159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统监控\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"13\" ],\r\n  \"icon\" : [ \"fa fa-video-camera\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:09:00');
INSERT INTO `sys_oper_log` VALUES (3160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"3\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统工具\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"14\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:09:21');
INSERT INTO `sys_oper_log` VALUES (3161, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '售货部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"盘点管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-balance-scale\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:09:46');
INSERT INTO `sys_oper_log` VALUES (3162, '供货商', 1, 'com.ruoyi.market.controller.TSupplierController.addSave()', 'POST', 1, 'admin', '售货部', '/system/supplier/add', '127.0.0.1', '内网IP', '{\r\n  \"supplierName\" : [ \"上海供货商\" ],\r\n  \"phone\" : [ \"123465\" ],\r\n  \"wechat\" : [ \"12346\" ],\r\n  \"address\" : [ \"上海\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:13:21');
INSERT INTO `sys_oper_log` VALUES (3163, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"食品类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:14:05');
INSERT INTO `sys_oper_log` VALUES (3164, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"饮料类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:14:11');
INSERT INTO `sys_oper_log` VALUES (3165, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"白酒类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:14:15');
INSERT INTO `sys_oper_log` VALUES (3166, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"啤酒类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:14:22');
INSERT INTO `sys_oper_log` VALUES (3167, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"工具类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:14:33');
INSERT INTO `sys_oper_log` VALUES (3168, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"牛奶类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:14:38');
INSERT INTO `sys_oper_log` VALUES (3169, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 02:57:24');
INSERT INTO `sys_oper_log` VALUES (3170, '商品', 1, 'com.ruoyi.market.controller.TGoodsController.addSave()', 'POST', 1, 'admin', '售货部', '/system/goods/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"1\" ],\r\n  \"num\" : [ \"10\" ],\r\n  \"price\" : [ \"10\" ],\r\n  \"unit\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 03:11:33');
INSERT INTO `sys_oper_log` VALUES (3171, '商品', 1, 'com.ruoyi.market.controller.TGoodsController.addSave()', 'POST', 1, 'admin', '售货部', '/system/goods/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"1\" ],\r\n  \"typeId\" : [ \"1\" ],\r\n  \"num\" : [ \"1\" ],\r\n  \"price\" : [ \"1\" ],\r\n  \"unit\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 03:18:52');
INSERT INTO `sys_oper_log` VALUES (3172, '商品', 3, 'com.ruoyi.market.controller.TGoodsController.remove()', 'POST', 1, 'admin', '售货部', '/system/goods/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2856\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 03:18:59');
INSERT INTO `sys_oper_log` VALUES (3173, '商品', 1, 'com.ruoyi.market.controller.TGoodsController.addSave()', 'POST', 1, 'admin', '售货部', '/system/goods/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"水电费\" ],\r\n  \"typeId\" : [ \"3\" ],\r\n  \"num\" : [ \"1\" ],\r\n  \"price\" : [ \"1\" ],\r\n  \"unit\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 03:19:11');
INSERT INTO `sys_oper_log` VALUES (3174, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '售货部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ],\r\n  \"name\" : [ \"水电费\" ],\r\n  \"typeId\" : [ \"6\" ],\r\n  \"num\" : [ \"1.00\" ],\r\n  \"price\" : [ \"1.00\" ],\r\n  \"unit\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:50:09');
INSERT INTO `sys_oper_log` VALUES (3175, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"单位\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:50:57');
INSERT INTO `sys_oper_log` VALUES (3176, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"件\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"info\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:52:50');
INSERT INTO `sys_oper_log` VALUES (3177, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"个\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"info\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:53:12');
INSERT INTO `sys_oper_log` VALUES (3178, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"kg\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"info\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:53:23');
INSERT INTO `sys_oper_log` VALUES (3179, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"箱\" ],\r\n  \"dictValue\" : [ \"4\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"4\" ],\r\n  \"listClass\" : [ \"info\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:53:53');
INSERT INTO `sys_oper_log` VALUES (3180, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"瓶\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:54:17');
INSERT INTO `sys_oper_log` VALUES (3181, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"34\" ],\r\n  \"dictLabel\" : [ \"瓶\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"info\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:54:23');
INSERT INTO `sys_oper_log` VALUES (3182, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"桶\" ],\r\n  \"dictValue\" : [ \"6\" ],\r\n  \"dictType\" : [ \"sys_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"6\" ],\r\n  \"listClass\" : [ \"info\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 05:54:45');
INSERT INTO `sys_oper_log` VALUES (3183, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"水果类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 06:08:50');
INSERT INTO `sys_oper_log` VALUES (3184, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '售货部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ],\r\n  \"name\" : [ \"苹果\" ],\r\n  \"typeId\" : [ \"2862\" ],\r\n  \"num\" : [ \"100\" ],\r\n  \"price\" : [ \"25\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 06:09:11');
INSERT INTO `sys_oper_log` VALUES (3185, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '售货部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ],\r\n  \"name\" : [ \"苹果\" ],\r\n  \"typeId\" : [ \"2862\" ],\r\n  \"num\" : [ \"100.00\" ],\r\n  \"price\" : [ \"30\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 06:09:41');
INSERT INTO `sys_oper_log` VALUES (3186, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '售货部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"2\" ],\r\n  \"num\" : [ \"100\" ],\r\n  \"price\" : [ \"14\" ],\r\n  \"unit\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 06:09:57');
INSERT INTO `sys_oper_log` VALUES (3187, '商品', 1, 'com.ruoyi.market.controller.TGoodsController.addSave()', 'POST', 1, 'admin', '售货部', '/system/goods/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"53度酱香型飞天茅台\" ],\r\n  \"typeId\" : [ \"3\" ],\r\n  \"num\" : [ \"100\" ],\r\n  \"price\" : [ \"6000\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 06:36:52');
INSERT INTO `sys_oper_log` VALUES (3188, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '售货部', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 07:05:09');
INSERT INTO `sys_oper_log` VALUES (3189, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '售货部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_inventory_record\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 07:05:18');
INSERT INTO `sys_oper_log` VALUES (3190, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '售货部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_inventory_record\" ]\r\n}', 'null', 0, NULL, '2020-12-10 07:05:57');
INSERT INTO `sys_oper_log` VALUES (3191, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"11\" ],\r\n  \"price\" : [ \"14.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 08:49:26');
INSERT INTO `sys_oper_log` VALUES (3192, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ],\r\n  \"name\" : [ \"苹果\" ],\r\n  \"typeName\" : [ \"水果类\" ],\r\n  \"num\" : [ \"120\" ],\r\n  \"price\" : [ \"30.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 08:52:57');
INSERT INTO `sys_oper_log` VALUES (3193, '盘点记录', 5, 'com.ruoyi.market.controller.TInventoryRecordController.export()', 'POST', 1, 'admin', '售货部', '/system/record/export', '127.0.0.1', '内网IP', '{\r\n  \"goodsId\" : [ \"\" ],\r\n  \"oldNum\" : [ \"\" ],\r\n  \"newNum\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"6e9ed4ac-e1e9-41d1-9daf-32b714051b58_record.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 09:04:47');
INSERT INTO `sys_oper_log` VALUES (3194, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2858\" ],\r\n  \"name\" : [ \"53度酱香型飞天茅台\" ],\r\n  \"typeName\" : [ \"白酒类\" ],\r\n  \"num\" : [ \"90\" ],\r\n  \"price\" : [ \"6000.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 01:08:39');
INSERT INTO `sys_oper_log` VALUES (3195, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"22\" ],\r\n  \"price\" : [ \"14.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 01:18:16');
INSERT INTO `sys_oper_log` VALUES (3196, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"1\" ],\r\n  \"price\" : [ \"14.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 01:23:53');
INSERT INTO `sys_oper_log` VALUES (3197, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"2\" ],\r\n  \"price\" : [ \"14.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 01:23:57');
INSERT INTO `sys_oper_log` VALUES (3198, '盘点记录', 5, 'com.ruoyi.market.controller.TInventoryRecordController.export()', 'POST', 1, 'admin', '售货部', '/system/record/export', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"9d01c7cf-0884-4347-a14a-30c6520e37cb_record.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 01:31:29');
INSERT INTO `sys_oper_log` VALUES (3199, '盘点记录', 5, 'com.ruoyi.market.controller.TInventoryRecordController.export()', 'POST', 1, 'admin', '售货部', '/system/record/export', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"94fe1ac0-0576-4b04-b7f1-45af20910c2d_record.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 01:39:59');
INSERT INTO `sys_oper_log` VALUES (3200, '盘点记录', 5, 'com.ruoyi.market.controller.TInventoryRecordController.export()', 'POST', 1, 'admin', '售货部', '/system/record/export', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"name\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"7337309a-0732-467b-bb8d-9bb6de3d554d_record.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 01:40:36');
INSERT INTO `sys_oper_log` VALUES (3201, '商品', 1, 'com.ruoyi.market.controller.TGoodsController.addSave()', 'POST', 1, 'admin', '售货部', '/system/goods/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"1\" ],\r\n  \"typeId\" : [ \"1\" ],\r\n  \"num\" : [ \"0\" ],\r\n  \"price\" : [ \"1\" ],\r\n  \"unit\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:15:36');
INSERT INTO `sys_oper_log` VALUES (3202, '商品', 1, 'com.ruoyi.market.controller.TGoodsController.addSave()', 'POST', 1, 'admin', '售货部', '/system/goods/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"1\" ],\r\n  \"typeId\" : [ \"1\" ],\r\n  \"num\" : [ \"0\" ],\r\n  \"price\" : [ \"1\" ],\r\n  \"unit\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:16:38');
INSERT INTO `sys_oper_log` VALUES (3203, '商品', 3, 'com.ruoyi.market.controller.TGoodsController.remove()', 'POST', 1, 'admin', '售货部', '/system/goods/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2859,2860\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:20:01');
INSERT INTO `sys_oper_log` VALUES (3204, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"3\" ],\r\n  \"price\" : [ \"14.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:20:11');
INSERT INTO `sys_oper_log` VALUES (3205, '商品', 3, 'com.ruoyi.market.controller.TGoodsController.remove()', 'POST', 1, 'admin', '售货部', '/system/goods/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2855\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:21:21');
INSERT INTO `sys_oper_log` VALUES (3206, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{\r\n  \"callback\" : [ \"hello\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:56:21');
INSERT INTO `sys_oper_log` VALUES (3207, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{\r\n  \"callback\" : [ \"hello\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:56:47');
INSERT INTO `sys_oper_log` VALUES (3208, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{\r\n  \"callback\" : [ \"hello\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:56:56');
INSERT INTO `sys_oper_log` VALUES (3209, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{\r\n  \"callback\" : [ \"hello\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:56:58');
INSERT INTO `sys_oper_log` VALUES (3210, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:58:52');
INSERT INTO `sys_oper_log` VALUES (3211, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:58:55');
INSERT INTO `sys_oper_log` VALUES (3212, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 02:58:57');
INSERT INTO `sys_oper_log` VALUES (3213, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{\r\n  \"callback\" : [ \"hello\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:00:43');
INSERT INTO `sys_oper_log` VALUES (3214, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{\r\n  \"callback\" : [ \"hello\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:03:30');
INSERT INTO `sys_oper_log` VALUES (3215, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{\r\n  \"callback\" : [ \"hello\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:05:44');
INSERT INTO `sys_oper_log` VALUES (3216, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2855,2856,2857,2858,2859,2860,2861,2862,2863,2864\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:07:58');
INSERT INTO `sys_oper_log` VALUES (3217, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:07:59');
INSERT INTO `sys_oper_log` VALUES (3218, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:08:03');
INSERT INTO `sys_oper_log` VALUES (3219, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:08:11');
INSERT INTO `sys_oper_log` VALUES (3220, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:06');
INSERT INTO `sys_oper_log` VALUES (3221, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:41');
INSERT INTO `sys_oper_log` VALUES (3222, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:42');
INSERT INTO `sys_oper_log` VALUES (3223, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:44');
INSERT INTO `sys_oper_log` VALUES (3224, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:45');
INSERT INTO `sys_oper_log` VALUES (3225, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:46');
INSERT INTO `sys_oper_log` VALUES (3226, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:47');
INSERT INTO `sys_oper_log` VALUES (3227, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:09:59');
INSERT INTO `sys_oper_log` VALUES (3228, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:11:00');
INSERT INTO `sys_oper_log` VALUES (3229, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:11:02');
INSERT INTO `sys_oper_log` VALUES (3230, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:11:03');
INSERT INTO `sys_oper_log` VALUES (3231, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:11:04');
INSERT INTO `sys_oper_log` VALUES (3232, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:11:05');
INSERT INTO `sys_oper_log` VALUES (3233, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:11:10');
INSERT INTO `sys_oper_log` VALUES (3234, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:11:50');
INSERT INTO `sys_oper_log` VALUES (3235, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:12:21');
INSERT INTO `sys_oper_log` VALUES (3236, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:13:26');
INSERT INTO `sys_oper_log` VALUES (3237, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:36:31');
INSERT INTO `sys_oper_log` VALUES (3238, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:36:58');
INSERT INTO `sys_oper_log` VALUES (3239, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:36:59');
INSERT INTO `sys_oper_log` VALUES (3240, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:00');
INSERT INTO `sys_oper_log` VALUES (3241, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:18');
INSERT INTO `sys_oper_log` VALUES (3242, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:19');
INSERT INTO `sys_oper_log` VALUES (3243, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:24');
INSERT INTO `sys_oper_log` VALUES (3244, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:25');
INSERT INTO `sys_oper_log` VALUES (3245, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:26');
INSERT INTO `sys_oper_log` VALUES (3246, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:27');
INSERT INTO `sys_oper_log` VALUES (3247, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2894,2893,2892,2891,2890,2889,2888,2887,2886\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:42');
INSERT INTO `sys_oper_log` VALUES (3248, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:43');
INSERT INTO `sys_oper_log` VALUES (3249, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:44');
INSERT INTO `sys_oper_log` VALUES (3250, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:45');
INSERT INTO `sys_oper_log` VALUES (3251, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:46');
INSERT INTO `sys_oper_log` VALUES (3252, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:47');
INSERT INTO `sys_oper_log` VALUES (3253, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2899,2898,2897,2896,2895\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:37:50');
INSERT INTO `sys_oper_log` VALUES (3254, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:03');
INSERT INTO `sys_oper_log` VALUES (3255, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:04');
INSERT INTO `sys_oper_log` VALUES (3256, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:19');
INSERT INTO `sys_oper_log` VALUES (3257, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:20');
INSERT INTO `sys_oper_log` VALUES (3258, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:21');
INSERT INTO `sys_oper_log` VALUES (3259, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:22');
INSERT INTO `sys_oper_log` VALUES (3260, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:23');
INSERT INTO `sys_oper_log` VALUES (3261, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:24');
INSERT INTO `sys_oper_log` VALUES (3262, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:25');
INSERT INTO `sys_oper_log` VALUES (3263, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:26');
INSERT INTO `sys_oper_log` VALUES (3264, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:27');
INSERT INTO `sys_oper_log` VALUES (3265, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:28');
INSERT INTO `sys_oper_log` VALUES (3266, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:29');
INSERT INTO `sys_oper_log` VALUES (3267, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:29');
INSERT INTO `sys_oper_log` VALUES (3268, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:30');
INSERT INTO `sys_oper_log` VALUES (3269, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:31');
INSERT INTO `sys_oper_log` VALUES (3270, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:32');
INSERT INTO `sys_oper_log` VALUES (3271, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:32');
INSERT INTO `sys_oper_log` VALUES (3272, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:33');
INSERT INTO `sys_oper_log` VALUES (3273, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:34');
INSERT INTO `sys_oper_log` VALUES (3274, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:35');
INSERT INTO `sys_oper_log` VALUES (3275, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:35');
INSERT INTO `sys_oper_log` VALUES (3276, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:38:36');
INSERT INTO `sys_oper_log` VALUES (3277, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121123\" ],\r\n  \"goodsId\" : [ \"1\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 03:39:00');
INSERT INTO `sys_oper_log` VALUES (3278, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '售货部', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"5,7\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:14:03');
INSERT INTO `sys_oper_log` VALUES (3279, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '售货部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_outbound,t_inbound\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:14:49');
INSERT INTO `sys_oper_log` VALUES (3280, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '售货部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_inbound\" ]\r\n}', 'null', 0, NULL, '2020-12-11 05:15:02');
INSERT INTO `sys_oper_log` VALUES (3281, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '售货部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"t_inbound,t_outbound\" ]\r\n}', 'null', 0, NULL, '2020-12-11 05:15:10');
INSERT INTO `sys_oper_log` VALUES (3282, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2855\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:27:12');
INSERT INTO `sys_oper_log` VALUES (3283, '出库单', 3, 'com.ruoyi.market.controller.TOutboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/outbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2855\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:27:16');
INSERT INTO `sys_oper_log` VALUES (3284, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"单据状态\" ],\r\n  \"dictType\" : [ \"sys_bound_status\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:28:04');
INSERT INTO `sys_oper_log` VALUES (3285, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"新建\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"sys_bound_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:29:21');
INSERT INTO `sys_oper_log` VALUES (3286, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"完成\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"sys_bound_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"primary\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:29:39');
INSERT INTO `sys_oper_log` VALUES (3287, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"36\" ],\r\n  \"dictLabel\" : [ \"新建\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"sys_bound_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"warning\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:29:44');
INSERT INTO `sys_oper_log` VALUES (3288, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"37\" ],\r\n  \"dictLabel\" : [ \"完成\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"sys_bound_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"info\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:29:51');
INSERT INTO `sys_oper_log` VALUES (3289, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '售货部', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"37\" ],\r\n  \"dictLabel\" : [ \"完成\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"sys_bound_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"primary\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:29:55');
INSERT INTO `sys_oper_log` VALUES (3290, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2922,2921,2920,2919,2917,2918,2916,2914,2915,2913\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:32:07');
INSERT INTO `sys_oper_log` VALUES (3291, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2912,2911,2910,2909,2908,2907,2906,2905,2903,2904\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:32:11');
INSERT INTO `sys_oper_log` VALUES (3292, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2902,2901,2900\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:32:14');
INSERT INTO `sys_oper_log` VALUES (3293, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:36:28');
INSERT INTO `sys_oper_log` VALUES (3294, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:36:37');
INSERT INTO `sys_oper_log` VALUES (3295, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:37:57');
INSERT INTO `sys_oper_log` VALUES (3296, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:37:59');
INSERT INTO `sys_oper_log` VALUES (3297, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:38:05');
INSERT INTO `sys_oper_log` VALUES (3298, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:38:06');
INSERT INTO `sys_oper_log` VALUES (3299, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:38:06');
INSERT INTO `sys_oper_log` VALUES (3300, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:39:27');
INSERT INTO `sys_oper_log` VALUES (3301, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:40:04');
INSERT INTO `sys_oper_log` VALUES (3302, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2923\" ]\r\n}', 'null', 1, '11', '2020-12-11 05:41:33');
INSERT INTO `sys_oper_log` VALUES (3303, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2923\" ]\r\n}', 'null', 1, '11', '2020-12-11 05:41:54');
INSERT INTO `sys_oper_log` VALUES (3304, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:45:18');
INSERT INTO `sys_oper_log` VALUES (3305, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:45:24');
INSERT INTO `sys_oper_log` VALUES (3306, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:45:25');
INSERT INTO `sys_oper_log` VALUES (3307, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2925,2924,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:45:28');
INSERT INTO `sys_oper_log` VALUES (3308, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2925,2924\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:45:31');
INSERT INTO `sys_oper_log` VALUES (3309, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:45:47');
INSERT INTO `sys_oper_log` VALUES (3310, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2926\" ]\r\n}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:46:02');
INSERT INTO `sys_oper_log` VALUES (3311, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:50:04');
INSERT INTO `sys_oper_log` VALUES (3312, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:50:05');
INSERT INTO `sys_oper_log` VALUES (3313, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2928\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:50:13');
INSERT INTO `sys_oper_log` VALUES (3314, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:50:17');
INSERT INTO `sys_oper_log` VALUES (3315, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2923,2927\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:50:20');
INSERT INTO `sys_oper_log` VALUES (3316, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:53:36');
INSERT INTO `sys_oper_log` VALUES (3317, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:53:37');
INSERT INTO `sys_oper_log` VALUES (3318, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2930,2929,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:53:40');
INSERT INTO `sys_oper_log` VALUES (3319, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2930\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:53:49');
INSERT INTO `sys_oper_log` VALUES (3320, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2929,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:53:51');
INSERT INTO `sys_oper_log` VALUES (3321, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2929,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 05:53:55');
INSERT INTO `sys_oper_log` VALUES (3322, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2929\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:54:03');
INSERT INTO `sys_oper_log` VALUES (3323, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2929\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 05:54:10');
INSERT INTO `sys_oper_log` VALUES (3324, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2929\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:01:06');
INSERT INTO `sys_oper_log` VALUES (3325, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2929\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:01:08');
INSERT INTO `sys_oper_log` VALUES (3326, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2929\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:01:49');
INSERT INTO `sys_oper_log` VALUES (3327, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:01:57');
INSERT INTO `sys_oper_log` VALUES (3328, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2931\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:02:04');
INSERT INTO `sys_oper_log` VALUES (3329, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:02:08');
INSERT INTO `sys_oper_log` VALUES (3330, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:02:12');
INSERT INTO `sys_oper_log` VALUES (3331, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2933,2932,2931\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:02:21');
INSERT INTO `sys_oper_log` VALUES (3332, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2931\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:02:29');
INSERT INTO `sys_oper_log` VALUES (3333, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2931\" ]\r\n}', '{\r\n  \"msg\" : \"请勿重复入库\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:18');
INSERT INTO `sys_oper_log` VALUES (3334, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2931\" ]\r\n}', '{\r\n  \"msg\" : \"请勿重复入库\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:20');
INSERT INTO `sys_oper_log` VALUES (3335, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2933,2932,2931,2929,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:28');
INSERT INTO `sys_oper_log` VALUES (3336, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2931\" ]\r\n}', '{\r\n  \"msg\" : \"请勿重复入库\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:32');
INSERT INTO `sys_oper_log` VALUES (3337, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2933,2932,2931,2929,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:35');
INSERT INTO `sys_oper_log` VALUES (3338, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2933\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:04:41');
INSERT INTO `sys_oper_log` VALUES (3339, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2932,2931,2929,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:44');
INSERT INTO `sys_oper_log` VALUES (3340, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2932,2931,2929,2923\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:50');
INSERT INTO `sys_oper_log` VALUES (3341, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2931,2929,2923,2932\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:04:57');
INSERT INTO `sys_oper_log` VALUES (3342, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2931,2929,2923,2932\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:05:09');
INSERT INTO `sys_oper_log` VALUES (3343, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2932,2931\" ]\r\n}', '{\r\n  \"msg\" : \"单据已经完成，无法删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:05:31');
INSERT INTO `sys_oper_log` VALUES (3344, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2932\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:05:36');
INSERT INTO `sys_oper_log` VALUES (3345, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2923\" ]\r\n}', '{\r\n  \"msg\" : \"请勿重复入库\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:05:47');
INSERT INTO `sys_oper_log` VALUES (3346, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2931\" ]\r\n}', '{\r\n  \"msg\" : \"请勿重复入库\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:05:52');
INSERT INTO `sys_oper_log` VALUES (3347, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2931\" ]\r\n}', '{\r\n  \"msg\" : \"请勿重复入库\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:06:48');
INSERT INTO `sys_oper_log` VALUES (3348, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:22:07');
INSERT INTO `sys_oper_log` VALUES (3349, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121104\" ],\r\n  \"goodsId\" : [ \"1\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:22:21');
INSERT INTO `sys_oper_log` VALUES (3350, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2856\" ],\r\n  \"inboundCode\" : [ \"2020121104\" ],\r\n  \"goodsId\" : [ \"2\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:23:44');
INSERT INTO `sys_oper_log` VALUES (3351, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2856\" ],\r\n  \"inboundCode\" : [ \"2020121104\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:26:14');
INSERT INTO `sys_oper_log` VALUES (3352, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121104\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:26:25');
INSERT INTO `sys_oper_log` VALUES (3353, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"num\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"name\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"26713d6b-d940-4256-b59e-133807c30495_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:30:35');
INSERT INTO `sys_oper_log` VALUES (3354, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121103\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:38:51');
INSERT INTO `sys_oper_log` VALUES (3355, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121103\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:38:52');
INSERT INTO `sys_oper_log` VALUES (3356, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121103\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:38:54');
INSERT INTO `sys_oper_log` VALUES (3357, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121104\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:38:57');
INSERT INTO `sys_oper_log` VALUES (3358, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:43:08');
INSERT INTO `sys_oper_log` VALUES (3359, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121105\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:43:13');
INSERT INTO `sys_oper_log` VALUES (3360, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2935\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:43:18');
INSERT INTO `sys_oper_log` VALUES (3361, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2858,2856,2859\" ]\r\n}', '{\r\n  \"msg\" : \"\\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'t1\\n        left join t_inbound t2 on t1.inbound_code = t2.inbound_code\\n        w\' at line 1\\r\\n### The error may involve com.ruoyi.market.mapper.TInboundDetailMapper.deleteTInboundDetailByIds-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: delete from t_inbound_detail  t1         left join t_inbound t2 on t1.inbound_code = t2.inbound_code         where t2.status = \\\"1\\\" and id in          (               ?          ,              ?          ,              ?          )\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'t1\\n        left join t_inbound t2 on t1.inbound_code = t2.inbound_code\\n        w\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'t1\\n        left join t_inbound t2 on t1.inbound_code = t2.inbound_code\\n        w\' at line 1\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:43:26');
INSERT INTO `sys_oper_log` VALUES (3362, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2856,2859\" ]\r\n}', '{\r\n  \"msg\" : \"\\r\\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'t1\\n        left join t_inbound t2 on t1.inbound_code = t2.inbound_code\\n        w\' at line 1\\r\\n### The error may involve com.ruoyi.market.mapper.TInboundDetailMapper.deleteTInboundDetailByIds-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: delete from t_inbound_detail  t1         left join t_inbound t2 on t1.inbound_code = t2.inbound_code         where t2.status = \\\"1\\\" and t1.id in          (               ?          ,              ?          )\\r\\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'t1\\n        left join t_inbound t2 on t1.inbound_code = t2.inbound_code\\n        w\' at line 1\\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'t1\\n        left join t_inbound t2 on t1.inbound_code = t2.inbound_code\\n        w\' at line 1\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:45:28');
INSERT INTO `sys_oper_log` VALUES (3363, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2858,2856,2859\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:51:26');
INSERT INTO `sys_oper_log` VALUES (3364, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2858,2856\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:51:37');
INSERT INTO `sys_oper_log` VALUES (3365, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2859\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:51:40');
INSERT INTO `sys_oper_log` VALUES (3366, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2859\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:52:01');
INSERT INTO `sys_oper_log` VALUES (3367, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2859\" ],\r\n  \"inboundCode\" : [ \"2020121105\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"num\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:52:18');
INSERT INTO `sys_oper_log` VALUES (3368, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2859\" ],\r\n  \"inboundCode\" : [ \"2020121105\" ],\r\n  \"goodsId\" : [ \"2858\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"修改失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 06:55:21');
INSERT INTO `sys_oper_log` VALUES (3369, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ],\r\n  \"inboundCode\" : [ \"2020121104\" ],\r\n  \"goodsId\" : [ \"2858\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:55:29');
INSERT INTO `sys_oper_log` VALUES (3370, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 06:59:30');
INSERT INTO `sys_oper_log` VALUES (3371, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2857\" ]\r\n}', '{\r\n  \"msg\" : null,\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:01:22');
INSERT INTO `sys_oper_log` VALUES (3372, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2857\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，入库单未找到！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:02:30');
INSERT INTO `sys_oper_log` VALUES (3373, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ],\r\n  \"inboundCode\" : [ \"2020121104\" ],\r\n  \"goodsId\" : [ \"2858\" ],\r\n  \"num\" : [ \"111\" ]\r\n}', '{\r\n  \"msg\" : \"修改失败，入库单未找到！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:02:36');
INSERT INTO `sys_oper_log` VALUES (3374, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2857\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，入库单未找到！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:04:02');
INSERT INTO `sys_oper_log` VALUES (3375, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121105\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"111\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:04:15');
INSERT INTO `sys_oper_log` VALUES (3376, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2857\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:04:29');
INSERT INTO `sys_oper_log` VALUES (3377, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2934\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:04:39');
INSERT INTO `sys_oper_log` VALUES (3378, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121106\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:04:49');
INSERT INTO `sys_oper_log` VALUES (3379, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2935\" ]\r\n}', '{\r\n  \"msg\" : \"入库失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:30:21');
INSERT INTO `sys_oper_log` VALUES (3380, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121106\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:30:36');
INSERT INTO `sys_oper_log` VALUES (3381, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"0\" ],\r\n  \"price\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:30:52');
INSERT INTO `sys_oper_log` VALUES (3382, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ],\r\n  \"name\" : [ \"苹果\" ],\r\n  \"typeName\" : [ \"水果类\" ],\r\n  \"num\" : [ \"0\" ],\r\n  \"price\" : [ \"30.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:30:56');
INSERT INTO `sys_oper_log` VALUES (3383, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2935\" ]\r\n}', '{\r\n  \"msg\" : \"入库失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:32:08');
INSERT INTO `sys_oper_log` VALUES (3384, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2936\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:32:12');
INSERT INTO `sys_oper_log` VALUES (3385, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2003\" ],\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"出库单明细\" ],\r\n  \"url\" : [ \"/system/outboundDetail\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:detail:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:33:43');
INSERT INTO `sys_oper_log` VALUES (3386, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:37:29');
INSERT INTO `sys_oper_log` VALUES (3387, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\\t2020121107\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:37:43');
INSERT INTO `sys_oper_log` VALUES (3388, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121106\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:37:49');
INSERT INTO `sys_oper_log` VALUES (3389, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121107\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:37:57');
INSERT INTO `sys_oper_log` VALUES (3390, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2937\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:39:14');
INSERT INTO `sys_oper_log` VALUES (3391, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2937\" ]\r\n}', '{\r\n  \"msg\" : \"入库失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:39:19');
INSERT INTO `sys_oper_log` VALUES (3392, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2863\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:39:27');
INSERT INTO `sys_oper_log` VALUES (3393, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2863\" ],\r\n  \"inboundCode\" : [ \"2020121107\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"修改失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:39:34');
INSERT INTO `sys_oper_log` VALUES (3394, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121107\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:53:36');
INSERT INTO `sys_oper_log` VALUES (3395, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121107\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:53:39');
INSERT INTO `sys_oper_log` VALUES (3396, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:53:44');
INSERT INTO `sys_oper_log` VALUES (3397, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121108\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:53:49');
INSERT INTO `sys_oper_log` VALUES (3398, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121108\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"21\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:53:54');
INSERT INTO `sys_oper_log` VALUES (3399, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:54:01');
INSERT INTO `sys_oper_log` VALUES (3400, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2865\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:54:14');
INSERT INTO `sys_oper_log` VALUES (3401, '入库单明细', 3, 'com.ruoyi.market.controller.TInboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2864\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:54:19');
INSERT INTO `sys_oper_log` VALUES (3402, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121108\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:54:24');
INSERT INTO `sys_oper_log` VALUES (3403, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121109\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:56:36');
INSERT INTO `sys_oper_log` VALUES (3404, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2939\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:56:56');
INSERT INTO `sys_oper_log` VALUES (3405, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121108\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"42ccda59-19ab-403b-8d5d-2da33fe38334_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:57:42');
INSERT INTO `sys_oper_log` VALUES (3406, '入库单明细', 2, 'com.ruoyi.market.controller.TInboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2867\" ],\r\n  \"inboundCode\" : [ \"2020121109\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"2.00\" ]\r\n}', '{\r\n  \"msg\" : \"修改失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:58:29');
INSERT INTO `sys_oper_log` VALUES (3407, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2938\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:59:24');
INSERT INTO `sys_oper_log` VALUES (3408, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121108\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单未找到！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 07:59:34');
INSERT INTO `sys_oper_log` VALUES (3409, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:01:03');
INSERT INTO `sys_oper_log` VALUES (3410, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:01:18');
INSERT INTO `sys_oper_log` VALUES (3411, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2941\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:02:16');
INSERT INTO `sys_oper_log` VALUES (3412, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '售货部', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"普通角色\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2051,2015,2016,2017,2018,2019,2020,2045,2046,2047,2048,2049,2050\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:06:16');
INSERT INTO `sys_oper_log` VALUES (3413, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'ry', '售货部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:07:53');
INSERT INTO `sys_oper_log` VALUES (3414, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'ry', '售货部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121112\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:07:58');
INSERT INTO `sys_oper_log` VALUES (3415, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2045\" ],\r\n  \"parentId\" : [ \"2051\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"入库单明细\" ],\r\n  \"url\" : [ \"/system/inboundDetail\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:detail:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:08:29');
INSERT INTO `sys_oper_log` VALUES (3416, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2021\" ],\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"出库单\" ],\r\n  \"url\" : [ \"/system/outbound\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:outbound:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:08:35');
INSERT INTO `sys_oper_log` VALUES (3417, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2027\" ],\r\n  \"parentId\" : [ \"2053\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"盘点记录\" ],\r\n  \"url\" : [ \"/system/record\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:record:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:08:40');
INSERT INTO `sys_oper_log` VALUES (3418, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2009\" ],\r\n  \"parentId\" : [ \"2052\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商品信息\" ],\r\n  \"url\" : [ \"/system/goods\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:goods:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:09:11');
INSERT INTO `sys_oper_log` VALUES (3419, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2009\" ],\r\n  \"parentId\" : [ \"2052\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商品信息\" ],\r\n  \"url\" : [ \"/system/goods\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:goods:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:09:18');
INSERT INTO `sys_oper_log` VALUES (3420, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:44:19');
INSERT INTO `sys_oper_log` VALUES (3421, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:44:21');
INSERT INTO `sys_oper_log` VALUES (3422, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:44:21');
INSERT INTO `sys_oper_log` VALUES (3423, '出库单', 2, 'com.ruoyi.market.controller.TOutboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:45:04');
INSERT INTO `sys_oper_log` VALUES (3424, '出库单', 2, 'com.ruoyi.market.controller.TOutboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2857\" ]\r\n}', '{\r\n  \"msg\" : \"出库失败，出库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 08:45:12');
INSERT INTO `sys_oper_log` VALUES (3425, '出库单', 3, 'com.ruoyi.market.controller.TOutboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/outbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2857\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:45:17');
INSERT INTO `sys_oper_log` VALUES (3426, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:46:19');
INSERT INTO `sys_oper_log` VALUES (3427, '出库单', 2, 'com.ruoyi.market.controller.TOutboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2859\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:46:21');
INSERT INTO `sys_oper_log` VALUES (3428, '出库单', 3, 'com.ruoyi.market.controller.TOutboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/outbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2859\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，出库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 08:46:24');
INSERT INTO `sys_oper_log` VALUES (3429, '出库单', 3, 'com.ruoyi.market.controller.TOutboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/outbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2859,2858,2856\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，出库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 08:46:31');
INSERT INTO `sys_oper_log` VALUES (3430, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:48:20');
INSERT INTO `sys_oper_log` VALUES (3431, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:48:23');
INSERT INTO `sys_oper_log` VALUES (3432, '出库单', 3, 'com.ruoyi.market.controller.TOutboundController.remove()', 'POST', 1, 'admin', '售货部', '/system/outbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2861,2860,2859\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，出库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-11 08:48:27');
INSERT INTO `sys_oper_log` VALUES (3433, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:48:34');
INSERT INTO `sys_oper_log` VALUES (3434, '出库单明细', 1, 'com.ruoyi.market.controller.TOutboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"2020121105\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:53:13');
INSERT INTO `sys_oper_log` VALUES (3435, '出库单明细', 1, 'com.ruoyi.market.controller.TOutboundDetailController.addSave()', 'POST', 1, 'admin', '售货部', '/system/outboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"2020121105\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"5\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 08:53:32');
INSERT INTO `sys_oper_log` VALUES (3436, '出库单明细', 2, 'com.ruoyi.market.controller.TOutboundDetailController.editSave()', 'POST', 1, 'admin', '售货部', '/system/outboundDetail/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"outboundCode\" : [ \"2020121105\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"11.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 09:00:13');
INSERT INTO `sys_oper_log` VALUES (3437, '出库单明细', 3, 'com.ruoyi.market.controller.TOutboundDetailController.remove()', 'POST', 1, 'admin', '售货部', '/system/outboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2856\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 09:00:20');
INSERT INTO `sys_oper_log` VALUES (3438, '出库单', 2, 'com.ruoyi.market.controller.TOutboundController.editSave()', 'POST', 1, 'admin', '售货部', '/system/outbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2862\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 09:00:25');
INSERT INTO `sys_oper_log` VALUES (3439, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '售货部', '/system/role/add', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"出入库管理员\" ],\r\n  \"roleKey\" : [ \"warehouse\" ],\r\n  \"roleSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2051,2015,2016,2017,2018,2019,2020,2045,2046,2047,2048,2049,2050,2000,2003,2004,2005,2006,2007,2008,2021,2022,2023,2024,2025,2026\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:18:37');
INSERT INTO `sys_oper_log` VALUES (3440, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '售货部', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"3\" ],\r\n  \"roleName\" : [ \"仓库管理员\" ],\r\n  \"roleKey\" : [ \"warehouse\" ],\r\n  \"roleSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2051,2015,2016,2017,2018,2019,2020,2045,2046,2047,2048,2049,2050,2000,2003,2004,2005,2006,2007,2008,2021,2022,2023,2024,2025,2026\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:19:14');
INSERT INTO `sys_oper_log` VALUES (3441, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '售货部', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2052,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2009,2010,2011,2012,2013,2014,2051,2015,2016,2017,2018,2019,2020,2045,2046,2047,2048,2049,2050,2000,2003,2004,2005,2006,2007,2008,2021,2022,2023,2024,2025,2026,2053,2054,2055,2057,2027,2028,2029,2030,2031,2032,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:20:09');
INSERT INTO `sys_oper_log` VALUES (3442, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '售货部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"3\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统工具\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"14\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:23:16');
INSERT INTO `sys_oper_log` VALUES (3443, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '售货部', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"超级管理员\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"admin@163.com\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:27:49');
INSERT INTO `sys_oper_log` VALUES (3444, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '售货部', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"普通角色\" ],\r\n  \"menuIds\" : [ \"2052,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2009,2010,2011,2012,2013,2014,2051,2015,2016,2017,2018,2019,2020,2045,2046,2047,2048,2049,2050,2000,2003,2004,2005,2006,2007,2008,2021,2022,2023,2024,2025,2026,2053,2054,2055,2057,2027,2028,2029,2030,2031,2032,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:38:51');
INSERT INTO `sys_oper_log` VALUES (3445, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '售货部', '/system/dept/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"deptName\" : [ \"仓库部\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:39:27');
INSERT INTO `sys_oper_log` VALUES (3446, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '售货部', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"110\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"超市管理系统\" ],\r\n  \"deptName\" : [ \"财务部\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"\" ],\r\n  \"phone\" : [ \"\" ],\r\n  \"email\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:39:34');
INSERT INTO `sys_oper_log` VALUES (3447, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '售货部', '/system/post/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2,3\" ]\r\n}', '{\r\n  \"msg\" : \"项目经理已分配,不能删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 01:40:49');
INSERT INTO `sys_oper_log` VALUES (3448, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '售货部', '/system/post/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:40:55');
INSERT INTO `sys_oper_log` VALUES (3449, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '售货部', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"111\" ],\r\n  \"userName\" : [ \"张三\" ],\r\n  \"deptName\" : [ \"仓库部\" ],\r\n  \"phonenumber\" : [ \"15999999999\" ],\r\n  \"email\" : [ \"15999999999@163.com\" ],\r\n  \"loginName\" : [ \"zhangsan\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"3\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:42:20');
INSERT INTO `sys_oper_log` VALUES (3450, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '售货部', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"李四\" ],\r\n  \"deptName\" : [ \"财务部\" ],\r\n  \"phonenumber\" : [ \"15877777777\" ],\r\n  \"email\" : [ \"15877777777@qq.com\" ],\r\n  \"loginName\" : [ \"lisi\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:43:17');
INSERT INTO `sys_oper_log` VALUES (3451, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '财务部', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"王五\" ],\r\n  \"deptName\" : [ \"财务部\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"15555555555@qq.com\" ],\r\n  \"loginName\" : [ \"wangwu\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:56:37');
INSERT INTO `sys_oper_log` VALUES (3452, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '财务部', '/system/role/add', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"财务管理员\" ],\r\n  \"roleKey\" : [ \"finance\" ],\r\n  \"roleSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2052,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2009,2010,2011,2012,2013,2014,2053,2054,2055,2057,2027,2028,2029,2030,2031,2032\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:57:13');
INSERT INTO `sys_oper_log` VALUES (3453, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '财务部', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"7\" ],\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"王五\" ],\r\n  \"dept.deptName\" : [ \"财务部\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"15555555555@qq.com\" ],\r\n  \"loginName\" : [ \"wangwu\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"4\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"4\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:57:21');
INSERT INTO `sys_oper_log` VALUES (3454, '商品类型', 2, 'com.ruoyi.market.controller.TGoodsTypeController.editSave()', 'POST', 1, 'wangwu', '财务部', '/system/type/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"1\" ],\r\n  \"typeName\" : [ \"食品类\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:57:53');
INSERT INTO `sys_oper_log` VALUES (3455, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'wangwu', '财务部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"食品类1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:58:09');
INSERT INTO `sys_oper_log` VALUES (3456, '商品类型', 3, 'com.ruoyi.market.controller.TGoodsTypeController.remove()', 'POST', 1, 'wangwu', '财务部', '/system/type/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2863\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:58:13');
INSERT INTO `sys_oper_log` VALUES (3457, '商品类型', 1, 'com.ruoyi.market.controller.TGoodsTypeController.addSave()', 'POST', 1, 'wangwu', '财务部', '/system/type/add', '127.0.0.1', '内网IP', '{\r\n  \"typeName\" : [ \"11\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 01:59:37');
INSERT INTO `sys_oper_log` VALUES (3458, '商品类型', 3, 'com.ruoyi.market.controller.TGoodsTypeController.remove()', 'POST', 1, 'wangwu', '财务部', '/system/type/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2864\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:00:00');
INSERT INTO `sys_oper_log` VALUES (3459, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'wangwu', '财务部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"40\" ],\r\n  \"price\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:00:07');
INSERT INTO `sys_oper_log` VALUES (3460, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:03:51');
INSERT INTO `sys_oper_log` VALUES (3461, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121401\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:04:06');
INSERT INTO `sys_oper_log` VALUES (3462, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121401\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:04:10');
INSERT INTO `sys_oper_log` VALUES (3463, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"d792c8f6-bf01-4827-841c-6afcc7ed36d4_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:06:55');
INSERT INTO `sys_oper_log` VALUES (3464, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121401\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"a3f79c27-ea57-4b73-b986-334fbe694f91_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:07:14');
INSERT INTO `sys_oper_log` VALUES (3465, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:07:38');
INSERT INTO `sys_oper_log` VALUES (3466, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121402\" ],\r\n  \"goodsId\" : [ \"2858\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:07:45');
INSERT INTO `sys_oper_log` VALUES (3467, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121401\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"ed2412eb-7f39-437d-8ba2-775ba1c3467b_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:07:58');
INSERT INTO `sys_oper_log` VALUES (3468, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"41a9b8bb-3461-4344-bceb-90e8b9ab0fdb_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:08:02');
INSERT INTO `sys_oper_log` VALUES (3469, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121402\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"69172ea2-e81a-4eea-9368-69b005a0109f_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:08:50');
INSERT INTO `sys_oper_log` VALUES (3470, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2943\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:09:41');
INSERT INTO `sys_oper_log` VALUES (3471, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121401\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 02:09:49');
INSERT INTO `sys_oper_log` VALUES (3472, '入库单', 2, 'com.ruoyi.market.controller.TInboundController.editSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2944\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:18:42');
INSERT INTO `sys_oper_log` VALUES (3473, '入库单明细', 1, 'com.ruoyi.market.controller.TInboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121402\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"新增失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 02:18:46');
INSERT INTO `sys_oper_log` VALUES (3474, '入库单', 5, 'com.ruoyi.market.controller.TInboundController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"c499ef67-dac9-4f18-babf-0d36fd4142ee_inbound.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:19:08');
INSERT INTO `sys_oper_log` VALUES (3475, '入库单', 3, 'com.ruoyi.market.controller.TInboundController.remove()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2944\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，入库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 02:19:16');
INSERT INTO `sys_oper_log` VALUES (3476, '入库单', 5, 'com.ruoyi.market.controller.TInboundController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"e01727c8-c98a-4389-92f8-457d577a4991_inbound.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:26:32');
INSERT INTO `sys_oper_log` VALUES (3477, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"0a39906d-d2a2-461d-af60-72900960d337_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:27:57');
INSERT INTO `sys_oper_log` VALUES (3478, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"ea3f10eb-ec93-4d47-ad3d-01748eb1a264_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:28:28');
INSERT INTO `sys_oper_log` VALUES (3479, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"04da435e-ab79-4d1e-abbf-454a0d9b8a83_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:29:40');
INSERT INTO `sys_oper_log` VALUES (3480, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"647c2744-656f-4ec1-8d8a-8ff519c7b916_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:32:21');
INSERT INTO `sys_oper_log` VALUES (3481, '入库单明细', 5, 'com.ruoyi.market.controller.TInboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/inboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"inboundCode\" : [ \"2020121401\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"inboundCode\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"5e315b73-ebb5-41b3-bb23-1402735b57a8_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:33:03');
INSERT INTO `sys_oper_log` VALUES (3482, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:39:07');
INSERT INTO `sys_oper_log` VALUES (3483, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:39:17');
INSERT INTO `sys_oper_log` VALUES (3484, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:39:51');
INSERT INTO `sys_oper_log` VALUES (3485, '入库单', 1, 'com.ruoyi.market.controller.TInboundController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/inbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:39:53');
INSERT INTO `sys_oper_log` VALUES (3486, '出库单明细', 1, 'com.ruoyi.market.controller.TOutboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"O2020121401\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:40:11');
INSERT INTO `sys_oper_log` VALUES (3487, '出库单明细', 1, 'com.ruoyi.market.controller.TOutboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"O2020121401\" ],\r\n  \"goodsId\" : [ \"2857\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:40:16');
INSERT INTO `sys_oper_log` VALUES (3488, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:40:23');
INSERT INTO `sys_oper_log` VALUES (3489, '出库单明细', 1, 'com.ruoyi.market.controller.TOutboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"O2020121402\" ],\r\n  \"goodsId\" : [ \"2858\" ],\r\n  \"num\" : [ \"10\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:40:29');
INSERT INTO `sys_oper_log` VALUES (3490, '出库单', 2, 'com.ruoyi.market.controller.TOutboundController.editSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outbound/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2864\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:40:56');
INSERT INTO `sys_oper_log` VALUES (3491, '出库单明细', 5, 'com.ruoyi.market.controller.TOutboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"O2020121401\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"f798dee4-f6cd-4f2e-ba31-a26856cd7d24_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:41:17');
INSERT INTO `sys_oper_log` VALUES (3492, '出库单明细', 5, 'com.ruoyi.market.controller.TOutboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"O2020121402\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"b7f2bccb-db77-4c64-9de3-83f6e14a08b5_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:42:43');
INSERT INTO `sys_oper_log` VALUES (3493, '出库单明细', 5, 'com.ruoyi.market.controller.TOutboundDetailController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/export', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"\" ],\r\n  \"goodsId\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"f6c6a439-dc6a-4f18-b2f9-83e8276ce2c1_detail.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:43:18');
INSERT INTO `sys_oper_log` VALUES (3494, '出库单', 5, 'com.ruoyi.market.controller.TOutboundController.export()', 'POST', 1, 'zhangsan', '仓库部', '/system/outbound/export', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"createTime\" ],\r\n  \"isAsc\" : [ \"desc\" ]\r\n}', '{\r\n  \"msg\" : \"de80f38f-a2eb-4eb6-8b10-1a4a1bbb4ef6_outbound.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:44:18');
INSERT INTO `sys_oper_log` VALUES (3495, '出库单', 3, 'com.ruoyi.market.controller.TOutboundController.remove()', 'POST', 1, 'zhangsan', '仓库部', '/system/outbound/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2864\" ]\r\n}', '{\r\n  \"msg\" : \"删除失败，出库单已经完成！\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 02:44:26');
INSERT INTO `sys_oper_log` VALUES (3496, '出库单明细', 1, 'com.ruoyi.market.controller.TOutboundDetailController.addSave()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/add', '127.0.0.1', '内网IP', '{\r\n  \"outboundCode\" : [ \"O2020121402\" ],\r\n  \"goodsId\" : [ \"2855\" ],\r\n  \"num\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:44:45');
INSERT INTO `sys_oper_log` VALUES (3497, '出库单明细', 3, 'com.ruoyi.market.controller.TOutboundDetailController.remove()', 'POST', 1, 'zhangsan', '仓库部', '/system/outboundDetail/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2860\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:44:49');
INSERT INTO `sys_oper_log` VALUES (3498, '商品', 5, 'com.ruoyi.market.controller.TGoodsController.export()', 'POST', 1, 'wangwu', '财务部', '/system/goods/export', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"45393e5b-6ef0-4478-8f26-d63e212eb908_goods.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:49:07');
INSERT INTO `sys_oper_log` VALUES (3499, '商品', 1, 'com.ruoyi.market.controller.TGoodsController.addSave()', 'POST', 1, 'wangwu', '财务部', '/system/goods/add', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"大米\" ],\r\n  \"typeId\" : [ \"1\" ],\r\n  \"num\" : [ \"0\" ],\r\n  \"price\" : [ \"20\" ],\r\n  \"unit\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 02:50:20');
INSERT INTO `sys_oper_log` VALUES (3500, '商品', 5, 'com.ruoyi.market.controller.TGoodsController.export()', 'POST', 1, 'wangwu', '财务部', '/system/goods/export', '127.0.0.1', '内网IP', '{\r\n  \"name\" : [ \"\" ],\r\n  \"typeId\" : [ \"\" ],\r\n  \"orderByColumn\" : [ \"\" ],\r\n  \"isAsc\" : [ \"asc\" ]\r\n}', '{\r\n  \"msg\" : \"6291a179-1b37-4744-aefb-53ec54daf116_goods.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:04:45');
INSERT INTO `sys_oper_log` VALUES (3501, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '财务部', '/system/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:06:36');
INSERT INTO `sys_oper_log` VALUES (3502, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '财务部', '/system/post/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"项目经理已分配,不能删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 05:12:27');
INSERT INTO `sys_oper_log` VALUES (3503, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '财务部', '/system/post/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"项目经理已分配,不能删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 05:13:03');
INSERT INTO `sys_oper_log` VALUES (3504, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '财务部', '/system/post/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"项目经理已分配,不能删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 05:13:38');
INSERT INTO `sys_oper_log` VALUES (3505, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '财务部', '/system/post/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"项目经理已分配,不能删除\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-12-14 05:14:55');
INSERT INTO `sys_oper_log` VALUES (3506, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '财务部', '/system/post/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:16:53');
INSERT INTO `sys_oper_log` VALUES (3507, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '财务部', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"5\" ],\r\n  \"deptId\" : [ \"111\" ],\r\n  \"userName\" : [ \"张三\" ],\r\n  \"dept.deptName\" : [ \"仓库部\" ],\r\n  \"phonenumber\" : [ \"15999999999\" ],\r\n  \"email\" : [ \"15999999999@163.com\" ],\r\n  \"loginName\" : [ \"zhangsan\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:24:19');
INSERT INTO `sys_oper_log` VALUES (3508, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '财务部', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"6\" ],\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"李四\" ],\r\n  \"dept.deptName\" : [ \"财务部\" ],\r\n  \"phonenumber\" : [ \"15877777777\" ],\r\n  \"email\" : [ \"15877777777@qq.com\" ],\r\n  \"loginName\" : [ \"lisi\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"4\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"4\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:24:28');
INSERT INTO `sys_oper_log` VALUES (3509, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '财务部', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"7\" ],\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"王五\" ],\r\n  \"dept.deptName\" : [ \"财务部\" ],\r\n  \"phonenumber\" : [ \"15555555555\" ],\r\n  \"email\" : [ \"15555555555@qq.com\" ],\r\n  \"loginName\" : [ \"wangwu\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"3\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"3\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:24:31');
INSERT INTO `sys_oper_log` VALUES (3510, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '财务部', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"5\" ],\r\n  \"deptId\" : [ \"110\" ],\r\n  \"userName\" : [ \"张三\" ],\r\n  \"dept.deptName\" : [ \"财务部\" ],\r\n  \"phonenumber\" : [ \"15999999999\" ],\r\n  \"email\" : [ \"15999999999@163.com\" ],\r\n  \"loginName\" : [ \"zhangsan\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:24:41');
INSERT INTO `sys_oper_log` VALUES (3511, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '财务部', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"common\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"menuIds\" : [ \"2052,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2009,2010,2011,2012,2013,2014,2051,2015,2016,2017,2018,2019,2020,2045,2046,2047,2048,2049,2050,2000,2003,2004,2005,2006,2007,2008,2021,2022,2023,2024,2025,2026,2053,2054,2055,2057,2027,2028,2029,2030,2031,2032,1,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-14 05:26:39');
INSERT INTO `sys_oper_log` VALUES (3512, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'zhangsan', '财务部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2861\" ],\r\n  \"name\" : [ \"大米\" ],\r\n  \"typeName\" : [ \"食品类\" ],\r\n  \"num\" : [ \"99\" ],\r\n  \"price\" : [ \"20.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 01:08:51');
INSERT INTO `sys_oper_log` VALUES (3513, '出库单', 1, 'com.ruoyi.market.controller.TOutboundController.addSave()', 'POST', 1, 'zhangsan', '财务部', '/system/outbound/add', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 01:48:19');
INSERT INTO `sys_oper_log` VALUES (3514, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'zhangsan', '财务部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"10.2222222222\" ],\r\n  \"price\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 02:00:55');
INSERT INTO `sys_oper_log` VALUES (3515, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'zhangsan', '财务部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"10.26\" ],\r\n  \"price\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 02:01:02');
INSERT INTO `sys_oper_log` VALUES (3516, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'zhangsan', '财务部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"10.2666666\" ],\r\n  \"price\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 02:01:07');
INSERT INTO `sys_oper_log` VALUES (3517, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'zhangsan', '财务部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"-10\" ],\r\n  \"price\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 02:01:34');
INSERT INTO `sys_oper_log` VALUES (3518, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '财务部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2039\" ],\r\n  \"parentId\" : [ \"2052\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商品类型\" ],\r\n  \"url\" : [ \"/system/type\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:type:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 02:07:34');
INSERT INTO `sys_oper_log` VALUES (3519, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '财务部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2009\" ],\r\n  \"parentId\" : [ \"2052\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"商品信息\" ],\r\n  \"url\" : [ \"/system/goods\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"system:goods:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 02:07:40');
INSERT INTO `sys_oper_log` VALUES (3520, '商品', 2, 'com.ruoyi.market.controller.TInventoryController.editSave()', 'POST', 1, 'admin', '财务部', '/system/inventory/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeName\" : [ \"饮料类\" ],\r\n  \"num\" : [ \"20\" ],\r\n  \"price\" : [ \"10.00\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-15 02:08:27');
INSERT INTO `sys_oper_log` VALUES (3521, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '财务部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"3\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统工具\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"14\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-01 20:12:11');
INSERT INTO `sys_oper_log` VALUES (3522, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '财务部', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"worker_node\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-01 20:12:32');
INSERT INTO `sys_oper_log` VALUES (3523, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '财务部', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"worker_node\" ]\r\n}', 'null', 0, NULL, '2021-06-01 20:12:38');
INSERT INTO `sys_oper_log` VALUES (3524, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '财务部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"2\" ],\r\n  \"num\" : [ \"20.00\" ],\r\n  \"price\" : [ \"10.00\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-02 14:41:37');
INSERT INTO `sys_oper_log` VALUES (3525, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '财务部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"2\" ],\r\n  \"num\" : [ \"20.00\" ],\r\n  \"price\" : [ \"10.00\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-02 14:42:09');
INSERT INTO `sys_oper_log` VALUES (3526, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '财务部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"2\" ],\r\n  \"num\" : [ \"20.00\" ],\r\n  \"price\" : [ \"10.00\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-02 14:56:36');
INSERT INTO `sys_oper_log` VALUES (3527, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '财务部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"2\" ],\r\n  \"num\" : [ \"20.00\" ],\r\n  \"price\" : [ \"10.00\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-02 14:56:52');
INSERT INTO `sys_oper_log` VALUES (3528, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '财务部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"2\" ],\r\n  \"num\" : [ \"20.00\" ],\r\n  \"price\" : [ \"10.00\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-02 14:57:55');
INSERT INTO `sys_oper_log` VALUES (3529, '商品', 2, 'com.ruoyi.market.controller.TGoodsController.editSave()', 'POST', 1, 'admin', '财务部', '/system/goods/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"2855\" ],\r\n  \"name\" : [ \"可乐\" ],\r\n  \"typeId\" : [ \"2\" ],\r\n  \"num\" : [ \"20.00\" ],\r\n  \"price\" : [ \"10.00\" ],\r\n  \"unit\" : [ \"4\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-06-02 14:59:35');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-01-01 11:33:00', 'ry', '2021-01-01 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'common', 2, '2', '0', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-14 05:26:38', '');
INSERT INTO `sys_role` VALUES (3, '仓库管理员', 'warehouse', 3, '1', '0', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '');
INSERT INTO `sys_role` VALUES (4, '财务管理员', 'finance', 4, '1', '0', '0', 'admin', '2021-01-01 11:33:00', 'admin', '2021-01-01 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (2, 2054);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2057);
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2003);
INSERT INTO `sys_role_menu` VALUES (3, 2004);
INSERT INTO `sys_role_menu` VALUES (3, 2005);
INSERT INTO `sys_role_menu` VALUES (3, 2006);
INSERT INTO `sys_role_menu` VALUES (3, 2007);
INSERT INTO `sys_role_menu` VALUES (3, 2008);
INSERT INTO `sys_role_menu` VALUES (3, 2015);
INSERT INTO `sys_role_menu` VALUES (3, 2016);
INSERT INTO `sys_role_menu` VALUES (3, 2017);
INSERT INTO `sys_role_menu` VALUES (3, 2018);
INSERT INTO `sys_role_menu` VALUES (3, 2019);
INSERT INTO `sys_role_menu` VALUES (3, 2020);
INSERT INTO `sys_role_menu` VALUES (3, 2021);
INSERT INTO `sys_role_menu` VALUES (3, 2022);
INSERT INTO `sys_role_menu` VALUES (3, 2023);
INSERT INTO `sys_role_menu` VALUES (3, 2024);
INSERT INTO `sys_role_menu` VALUES (3, 2025);
INSERT INTO `sys_role_menu` VALUES (3, 2026);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (3, 2046);
INSERT INTO `sys_role_menu` VALUES (3, 2047);
INSERT INTO `sys_role_menu` VALUES (3, 2048);
INSERT INTO `sys_role_menu` VALUES (3, 2049);
INSERT INTO `sys_role_menu` VALUES (3, 2050);
INSERT INTO `sys_role_menu` VALUES (3, 2051);
INSERT INTO `sys_role_menu` VALUES (4, 2009);
INSERT INTO `sys_role_menu` VALUES (4, 2010);
INSERT INTO `sys_role_menu` VALUES (4, 2011);
INSERT INTO `sys_role_menu` VALUES (4, 2012);
INSERT INTO `sys_role_menu` VALUES (4, 2013);
INSERT INTO `sys_role_menu` VALUES (4, 2014);
INSERT INTO `sys_role_menu` VALUES (4, 2027);
INSERT INTO `sys_role_menu` VALUES (4, 2028);
INSERT INTO `sys_role_menu` VALUES (4, 2029);
INSERT INTO `sys_role_menu` VALUES (4, 2030);
INSERT INTO `sys_role_menu` VALUES (4, 2031);
INSERT INTO `sys_role_menu` VALUES (4, 2032);
INSERT INTO `sys_role_menu` VALUES (4, 2033);
INSERT INTO `sys_role_menu` VALUES (4, 2034);
INSERT INTO `sys_role_menu` VALUES (4, 2035);
INSERT INTO `sys_role_menu` VALUES (4, 2036);
INSERT INTO `sys_role_menu` VALUES (4, 2037);
INSERT INTO `sys_role_menu` VALUES (4, 2038);
INSERT INTO `sys_role_menu` VALUES (4, 2039);
INSERT INTO `sys_role_menu` VALUES (4, 2040);
INSERT INTO `sys_role_menu` VALUES (4, 2041);
INSERT INTO `sys_role_menu` VALUES (4, 2042);
INSERT INTO `sys_role_menu` VALUES (4, 2043);
INSERT INTO `sys_role_menu` VALUES (4, 2044);
INSERT INTO `sys_role_menu` VALUES (4, 2052);
INSERT INTO `sys_role_menu` VALUES (4, 2053);
INSERT INTO `sys_role_menu` VALUES (4, 2054);
INSERT INTO `sys_role_menu` VALUES (4, 2055);
INSERT INTO `sys_role_menu` VALUES (4, 2057);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 110, 'admin', '超级管理员', '00', 'admin@163.com', '15888888888', '0', '', 'f60fe75ad46673101f14acecb2fcc699', '111111', '0', '0', '127.0.0.1', '2021-06-03 14:20:22', 'admin', '2021-01-01 11:33:00', 'admin', '2021-06-03 14:20:22', NULL);
INSERT INTO `sys_user` VALUES (5, 110, 'zhangsan', '张三', '00', '15999999999@163.com', '15999999999', '0', '', 'd065810ee8608dec932f9b50c1e70ea7', 'c8b5ee', '0', '0', '127.0.0.1', '2020-12-15 01:00:32', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-15 01:00:32', '');
INSERT INTO `sys_user` VALUES (6, 110, 'lisi', '李四', '00', '15877777777@qq.com', '15877777777', '0', '', '7a95de986c253798f30dbf7cb5b14382', 'ee79db', '0', '0', '127.0.0.1', '2020-12-14 02:45:26', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-14 05:24:27', '');
INSERT INTO `sys_user` VALUES (7, 110, 'wangwu', '王五', '00', '15555555555@qq.com', '15555555555', '0', '', '62902792dabdfce30ce9972a12bc7c2d', '83d3ee', '0', '0', '127.0.0.1', '2020-12-14 05:04:37', 'admin', '2021-01-01 11:33:00', 'admin', '2020-12-14 05:24:31', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('3e037c1a-a6d1-49fa-a275-53375310474e', 'admin', '财务部', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2021-06-03 14:20:10', '2021-06-03 14:22:10', 3600000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (5, 4);
INSERT INTO `sys_user_post` VALUES (6, 4);
INSERT INTO `sys_user_post` VALUES (7, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (5, 2);
INSERT INTO `sys_user_role` VALUES (6, 4);
INSERT INTO `sys_user_role` VALUES (7, 3);

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '名称',
  `type_id` bigint(11) NULL DEFAULT NULL COMMENT '类型ID',
  `num` decimal(9, 2) NULL DEFAULT NULL COMMENT '库存',
  `price` decimal(9, 2) NULL DEFAULT NULL COMMENT '价格',
  `unit` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2862 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES (2855, 'admin', '2021-01-01 11:33:00', '可乐', 2, 20.00, 10.00, '4');
INSERT INTO `t_goods` VALUES (2857, 'admin', '2021-01-01 11:33:00', '苹果', 2862, 10.00, 30.00, '4');
INSERT INTO `t_goods` VALUES (2858, 'admin', '2021-01-01 11:33:00', '53度酱香型飞天茅台', 3, 100.00, 6000.00, '4');
INSERT INTO `t_goods` VALUES (2861, '王五', '2020-12-14 02:50:20', '大米', 1, 99.00, 20.00, '3');

-- ----------------------------
-- Table structure for t_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_type`;
CREATE TABLE `t_goods_type`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2863 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '商品类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_goods_type
-- ----------------------------
INSERT INTO `t_goods_type` VALUES (1, 'admin', '2021-01-01 11:33:00', '食品类');
INSERT INTO `t_goods_type` VALUES (2, 'admin', '2021-01-01 11:33:00', '饮料类');
INSERT INTO `t_goods_type` VALUES (3, 'admin', '2021-01-01 11:33:00', '白酒类');
INSERT INTO `t_goods_type` VALUES (4, 'admin', '2021-01-01 11:33:00', '啤酒类');
INSERT INTO `t_goods_type` VALUES (5, 'admin', '2021-01-01 11:33:00', '工具类');
INSERT INTO `t_goods_type` VALUES (6, 'admin', '2021-01-01 11:33:00', '牛奶类');
INSERT INTO `t_goods_type` VALUES (2862, 'admin', '2021-01-01 11:33:00', '水果类');

-- ----------------------------
-- Table structure for t_inbound
-- ----------------------------
DROP TABLE IF EXISTS `t_inbound`;
CREATE TABLE `t_inbound`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `inbound_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '入库单号',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '单据状态',
  PRIMARY KEY (`id`, `inbound_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2947 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '入库单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_inbound
-- ----------------------------
INSERT INTO `t_inbound` VALUES (2943, '张三', '2020-12-15 02:03:52', '2020121401', '2');
INSERT INTO `t_inbound` VALUES (2944, '张三', '2020-12-14 02:07:38', '2020121402', '2');
INSERT INTO `t_inbound` VALUES (2945, '张三', '2020-12-14 02:39:51', 'I2020121401', '1');
INSERT INTO `t_inbound` VALUES (2946, '张三', '2020-12-14 02:39:54', 'I2020121402', '1');

-- ----------------------------
-- Table structure for t_inbound_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_inbound_detail`;
CREATE TABLE `t_inbound_detail`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `inbound_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '入库单号',
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  `num` decimal(9, 2) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2872 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '入库单明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_inbound_detail
-- ----------------------------
INSERT INTO `t_inbound_detail` VALUES (2869, '张三', '2020-12-14 02:04:06', '2020121401', 2855, 10.00);
INSERT INTO `t_inbound_detail` VALUES (2870, '张三', '2020-12-14 02:04:10', '2020121401', 2857, 10.00);
INSERT INTO `t_inbound_detail` VALUES (2871, '张三', '2020-12-14 02:07:46', '2020121402', 2858, 10.00);

-- ----------------------------
-- Table structure for t_inventory_record
-- ----------------------------
DROP TABLE IF EXISTS `t_inventory_record`;
CREATE TABLE `t_inventory_record`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `goods_id` bigint(11) NULL DEFAULT NULL COMMENT '商品ID',
  `old_num` decimal(9, 2) NULL DEFAULT NULL COMMENT '原库存',
  `new_num` decimal(9, 2) NULL DEFAULT NULL COMMENT '新库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '盘点记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_outbound
-- ----------------------------
DROP TABLE IF EXISTS `t_outbound`;
CREATE TABLE `t_outbound`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `outbound_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '出库单号',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '单据状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2867 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '出库单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_outbound
-- ----------------------------
INSERT INTO `t_outbound` VALUES (2864, '张三', '2020-12-14 02:39:17', 'O2020121401', '2');
INSERT INTO `t_outbound` VALUES (2865, '张三', '2020-12-14 02:40:24', 'O2020121402', '1');
INSERT INTO `t_outbound` VALUES (2866, '张三', '2020-12-15 01:48:19', 'O2020121501', '1');

-- ----------------------------
-- Table structure for t_outbound_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_outbound_detail`;
CREATE TABLE `t_outbound_detail`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `outbound_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '出库单号',
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  `num` decimal(9, 2) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2860 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '出库单明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_outbound_detail
-- ----------------------------
INSERT INTO `t_outbound_detail` VALUES (2857, '张三', '2020-12-14 02:40:11', 'O2020121401', 2855, 10.00);
INSERT INTO `t_outbound_detail` VALUES (2858, '张三', '2020-12-14 02:40:16', 'O2020121401', 2857, 10.00);
INSERT INTO `t_outbound_detail` VALUES (2859, '张三', '2020-12-14 02:40:30', 'O2020121402', 2858, 10.00);

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `supplier_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '名称',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '微信',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2856 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '供货商表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES (2855, 'admin', '2020-12-10 02:13:20', '上海供货商', '123465', '12346', '上海');

-- ----------------------------
-- Table structure for worker_node
-- ----------------------------
DROP TABLE IF EXISTS `worker_node`;
CREATE TABLE `worker_node`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'auto increment id',
  `HOST_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'host name',
  `PORT` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'port',
  `TYPE` int(11) NOT NULL COMMENT 'node type: ACTUAL or CONTAINER',
  `LAUNCH_DATE` date NOT NULL COMMENT 'launch date',
  `MODIFIED` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'modified time',
  `CREATED` timestamp(0) NOT NULL COMMENT 'created time',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'DB WorkerID Assigner for UID Generator' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
