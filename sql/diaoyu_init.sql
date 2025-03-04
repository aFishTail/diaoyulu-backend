-- ----------------------------
-- Table structure for fishing_spot
-- ----------------------------
DROP TABLE IF EXISTS `fishing_spot`;
CREATE TABLE fishing_spot (
    spot_id bigint(20) AUTO_INCREMENT PRIMARY KEY COMMENT '钓点唯一标识',
    spot_name VARCHAR(100) NOT NULL COMMENT '钓点名称',
    location POINT NOT NULL COMMENT '地理坐标',
    address VARCHAR(255) NOT NULL COMMENT '详细地址',
    water_depth DECIMAL(5,2) COMMENT '平均水深（米）',
    fish_species VARCHAR(200) NOT NULL COMMENT '常见鱼种',
    spot_type ENUM('淡水', '海水', '溪流') DEFAULT '淡水' COMMENT '水域类型',
    creator_id INT NOT NULL COMMENT '创建者ID',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    description TEXT COMMENT '详细描述',
    status TINYINT DEFAULT 1 COMMENT '状态：0->禁用；1->启用',
    
    INDEX idx_location (location(25)),
    UNIQUE KEY uniq_spot_name (spot_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='钓点信息表';

-- ----------------------------
-- Table structure for ums_admin_fishing_spot_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_fishing_spot_relation`;
CREATE TABLE `ums_admin_fishing_spot_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `fishing_spot_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='用户与钓点关系表';

-- ----------------------------
-- Table structure for fish_type
-- ----------------------------
DROP TABLE IF EXISTS `fish_type`;
CREATE TABLE `ums_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='鱼种类表';

-- ----------------------------
-- Table structure for fishing_spot_fish_type_relation
-- ----------------------------
DROP TABLE IF EXISTS `fishing_spot_fish_type_relation`;
CREATE TABLE `fishing_spot_fish_type_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fishing_spot_id` bigint(20) DEFAULT NULL,
  `fish_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='钓点与鱼种关系表';