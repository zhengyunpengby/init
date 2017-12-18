DROP DATABASE DB_3D;
CREATE DATABASE DB_3D;
USE DB_3D;

CREATE TABLE CUSTOMER(
	CUSTOMER_ID VARCHAR(32) NOT NULL COMMENT '客户ID',
	CERT_ID VARCHAR(21) COMMENT '证件ID',
	USERNAME VARCHAR(10) COMMENT '用户名',
	CUSTNAME VARCHAR(10) COMMENT '备用名',
	PASSWORD VARCHAR(32) COMMENT '密码',
	ROLE VARCHAR(10) COMMENT '角色',
	TEL VARCHAR(11) COMMENT '联系方式',
	HOME_ADDRESS VARCHAR(100) COMMENT '家庭住址',
	WORK_TYPE VARCHAR(100) COMMENT '工作类型',
	LOAD_STAT VARCHAR(2) COMMENT '登录状态（Y：是；N：否）',
	REMARK VARCHAR(200) COMMENT '备注',
	LOAD_STAT VARCHAR(2)  COMMENT '登录状态',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (CUSTOMER_ID,LOAD_DATE)
);

ALTER TABLE CUSTOMER COMMENT = '客户信息表';

CREATE TABLE HOUSE(
	HOUSE_ID VARCHAR(32) NOT NULL COMMENT '房屋ID',
	CUSTOMER_ID VARCHAR(32) COMMENT '客户ID',
	ADDRESS VARCHAR(100) COMMENT '地址',
	FLOOR VARCHAR(20) COMMENT '单元楼层',
	STRUCT VARCHAR(20) COMMENT '住房结构',
	PHOTO_NUM INT COMMENT '住房图片数量',
	PHOTO_PATH VARCHAR(50) COMMENT '住房图片路径',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (HOUSE_ID,LOAD_DATE)
);

ALTER TABLE HOUSE COMMENT = '房屋信息表';

CREATE TABLE DOOR(
	DOOR_ID VARCHAR(32) NOT NULL COMMENT '门ID',
	HOUSE_ID VARCHAR(32) COMMENT '房屋ID',
	PRODUCT_TYPE VARCHAR(20) COMMENT '预计类型',
	HEIGHT DECIMAL(10,4) COMMENT '高度',
	WIDTH DECIMAL(10,4) COMMENT '宽度',
	THICK DECIMAL(10,4) COMMENT '厚度',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (DOOR_ID,LOAD_DATE)
);

ALTER TABLE DOOR COMMENT = '门信息表';

CREATE TABLE PRODUCT(
	PRODUCT_ID VARCHAR(32) NOT NULL COMMENT '产品ID',
	PRODUCT_NO VARCHAR(20) COMMENT '产品编码',
	PRODUCT_NAME VARCHAR(20) COMMENT '产品名称',
	PRODUCT_DESC TEXT COMMENT '产品介绍',
	PRODUCT_TYPE VARCHAR(20) COMMENT '产品类型',
	TEXTURE VARCHAR(20) COMMENT '产品材质',
	HEIGHT DECIMAL(10,4) COMMENT '样板高度',
	WIDTH DECIMAL(10,4) COMMENT '样板宽度',
	THICK DECIMAL(10,4) COMMENT '样板厚度',
	HEIGHT_L DECIMAL(10,4) COMMENT '高度下限',
	HEIGHT_H DECIMAL(10,4) COMMENT '高度上限',
	WIDTH_L DECIMAL(10,4) COMMENT '宽度上限',
	WIDTH_H DECIMAL(10,4) COMMENT '宽度下限',
	THICK_L DECIMAL(10,4) COMMENT '厚度上限',
	THICK_H DECIMAL(10,4) COMMENT '厚度下限',
	CHECK_FLAG VARCHAR(1) COMMENT '是否校验（Y：是，N：否）',
	PRE_PRICE DECIMAL(12,4) COMMENT '进价',
	NOW_PRICE DECIMAL(12,4) COMMENT '售价',
	DISCOUNT DECIMAL(10,4) COMMENT '折扣',
	DISCOUNT_TYPE VARCHAR(10) COMMENT '折扣类型',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (PRODUCT_ID,LOAD_DATE)
);

ALTER TABLE PRODUCT COMMENT = '产品信息表';

CREATE TABLE IMAGE(
	IMAGE_ID VARCHAR(32) NOT NULL COMMENT '图片ID',
	PRODUCT_ID VARCHAR(32) NOT NULL COMMENT '产品ID',
	IMAGE_NAME VARCHAR(100) NOT NULL COMMENT '图片名',
	MAIN_FLAG VARCHAR(1) COMMENT '主图片标志',
	IMAGE_DATA MediumBlob COMMENT '数据',
	REMARK VARCHAR(200) COMMENT '备注',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (IMAGE_ID,LOAD_DATE)
);

ALTER TABLE IMAGE COMMENT = '产品图片表';

CREATE TABLE SHOP(
	SHOP_ID VARCHAR(32) NOT NULL COMMENT '购物车ID',
	CUSTOMER_ID VARCHAR(32) COMMENT '客户ID',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (SHOP_ID,LOAD_DATE)
);

ALTER TABLE SHOP COMMENT = '购物车信息表';

CREATE TABLE SHOPLIST(
	SHOPLIST_ID VARCHAR(32) NOT NULL COMMENT '购物车列表ID',
	SHOP_ID VARCHAR(32) COMMENT '购物车ID',
	PRODUCT_ID VARCHAR(32) COMMENT '产品ID',
	DOOR_ID VARCHAR(32) COMMENT '门ID',
	NOW_PRICE DECIMAL(12,4) COMMENT '售价',
	DISCOUNT DECIMAL(10,4) COMMENT '折扣',
	DISCOUNT_TYPE VARCHAR(10) COMMENT '折扣类型',
	REAL_PRICE DECIMAL(12,4) COMMENT '现价',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (SHOPLIST_ID,LOAD_DATE)
);

ALTER TABLE SHOPLIST COMMENT = '购物车详细信息表';

CREATE TABLE SHOPTMP(
	SHOPTMP_ID VARCHAR(32) NOT NULL COMMENT '购物车ID',
	SESSION_ID VARCHAR(32) COMMENT '会话ID',
	IP VARCHAR(16) COMMENT 'IP',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (SHOPTMP_ID,LOAD_DATE)
);

ALTER TABLE SHOPTMP COMMENT = '临时购物车信息表';

CREATE TABLE ORDERS(
	ORDERS_ID VARCHAR(32) NOT NULL COMMENT '订单ID',
	CUSTOMER_ID VARCHAR(32) COMMENT '客户ID',
	TOTAL_PRICE DECIMAL(12,4) COMMENT '总价ID',
	DISCOUNT DECIMAL(10,4) COMMENT '折扣',
	DISCOUNT_TYPE VARCHAR(10) COMMENT '折扣类型',
	REAL_PRICE DECIMAL(12,4) COMMENT '现价',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (ORDERS_ID,LOAD_DATE)
);

ALTER TABLE ORDERS COMMENT = '订单信息表';

CREATE TABLE ORDERSLIST(
	ORDERSLIST_ID VARCHAR(32) NOT NULL COMMENT '订单详情ID',
	ORDERS_ID VARCHAR(32) NOT NULL COMMENT '订单ID',
	PRODUCT_ID VARCHAR(32) COMMENT '产品ID',
	COUNTS INT COMMENT '数量',
	TOTAL_PRICE DECIMAL(12,4) COMMENT '总价ID',
	DISCOUNT DECIMAL(10,4) COMMENT '折扣',
	DISCOUNT_TYPE VARCHAR(10) COMMENT '折扣类型',
	REAL_PRICE DECIMAL(12,4) COMMENT '现价',
	REMARK VARCHAR(200) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (ORDERSLIST_ID,LOAD_DATE)
);

ALTER TABLE ORDERSLIST COMMENT = '订单详细信息表';

CREATE TABLE TRANLIST(
	TRANLIST_ID VARCHAR(32) NOT NULL COMMENT '交易流水ID',
	TRAN_CUSTOMER_ID VARCHAR(32) COMMENT '交易客户',
	TRAN_TYPE VARCHAR(50) COMMENT '交易类型',
	TRAN_CODE VARCHAR(50) COMMENT '交易说明',
	PRICE DECIMAL(12,4) COMMENT '金额',
	REMARK VARCHAR(50) COMMENT '备注',
	STAT VARCHAR(1) COMMENT '状态（N：正常；D：废弃）',
	LOAD_DATE DATETIME NOT NULL COMMENT '加载日期',
	PRIMARY KEY (TRANLIST_ID,LOAD_DATE)
);

ALTER TABLE TRANLIST COMMENT = '交易流水信息表';