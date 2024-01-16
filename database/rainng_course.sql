SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 表結構 for rc_admin
-- ----------------------------
DROP TABLE IF EXISTS `rc_admin`;
CREATE TABLE `rc_admin`  (
  `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理員Id',
  `admin_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用戶名',
  `admin_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密碼',
  `admin_privilege` int(11) NOT NULL COMMENT '角色\r\n二進制表示權限\r\n1-系管理\r\n2-專業管理\r\n4-班級管理\r\n8-學生管理\r\n16-教師管理\r\n32-課程管理\r\n64-選課管理\r\n128-管理員管理',
  PRIMARY KEY (`admin_id`) USING BTREE,
  UNIQUE INDEX `idx_admin_username`(`admin_username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- 記錄 of rc_admin
-- ----------------------------
INSERT INTO `rc_admin` VALUES (1, 'admin', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', 255);
INSERT INTO `rc_admin` VALUES (2, 'azure99', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', 96);

-- ----------------------------
-- 表結構 for rc_class
-- ----------------------------
DROP TABLE IF EXISTS `rc_class`;
CREATE TABLE `rc_class`  (
  `class_id`
 int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '班级Id',
  `class_major_id` int(10) UNSIGNED NOT NULL COMMENT '專業Id',
  `class_grade` int(10) UNSIGNED NOT NULL COMMENT '年级',
  `class_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `fk_major_id`(`class_major_id`) USING BTREE,
  INDEX `idx_class_name`(`class_name`) USING BTREE,
  CONSTRAINT `fk_major_id` FOREIGN KEY (`class_major_id`) REFERENCES `rc_major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_class
-- ----------------------------
INSERT INTO `rc_class` VALUES (1, 1, 2017, '計信1班');
INSERT INTO `rc_class` VALUES (2, 1, 2019, '計信1班');
INSERT INTO `rc_class` VALUES (3, 4, 2017, '数学1班');
INSERT INTO `rc_class` VALUES (4, 5, 2017, '測試班级1');
INSERT INTO `rc_class` VALUES (5, 5, 2017, '測試班级2');
INSERT INTO `rc_class` VALUES (6, 5, 2017, '測試班级3');
INSERT INTO `rc_class` VALUES (7, 5, 2017, '測試班级4');
INSERT INTO `rc_class` VALUES (8, 5, 2017, '測試班级5');
INSERT INTO `rc_class` VALUES (9, 5, 2017, '測試班级6');
INSERT INTO `rc_class` VALUES (10, 5, 2017, '測試班级7');
INSERT INTO `rc_class` VALUES (11, 5, 2017, '測試班级8');
INSERT INTO `rc_class` VALUES (12, 5, 2017, '測試班级9');
INSERT INTO `rc_class` VALUES (13, 5, 2017, '測試班级10');
INSERT INTO `rc_class` VALUES (14, 5, 2019, '演示班级1');
INSERT INTO `rc_class` VALUES (15, 5, 2019, '演示班级2');
INSERT INTO `rc_class` VALUES (16, 5, 2019, '演示班级3');
INSERT INTO `rc_class` VALUES (17, 5, 2019, '演示班级4');
INSERT INTO `rc_class` VALUES (18, 5, 2019, '演示班级5');
INSERT INTO `rc_class` VALUES (19, 5, 2019, '演示班级6');
INSERT INTO `rc_class` VALUES (20, 5, 2019, '演示班级7');
INSERT INTO `rc_class` VALUES (21, 5, 2019, '演示班级8');
INSERT INTO `rc_class` VALUES (22, 5, 2019, '演示班级9');
INSERT INTO `rc_class` VALUES (23, 5, 2019, '演示班级10');

-- ----------------------------
-- Table structure for rc_course
-- ----------------------------
DROP TABLE IF EXISTS `rc_course`;
CREATE TABLE `rc_course`  (
  `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程Id',
  `course_teacher_id` int(10) UNSIGNED NOT NULL COMMENT '授课教师Id',
  `course_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `course_grade` int(10) UNSIGNED NOT NULL COMMENT '授课年级',
  `course_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上课时间 星期几-第几节-几节课',
  `course_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上课地址',
  `course_credit` int(10) UNSIGNED NOT NULL COMMENT '学分',
  `course_selected_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已选人数',
  `course_max_size` int(10) UNSIGNED NOT NULL COMMENT '最大容量',
  `course_exam_date` datetime(0) NULL DEFAULT NULL COMMENT '考试时间',
  `course_exam_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考试地点',
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `fk_course_teacher_id`(`course_teacher_id`) USING BTREE,
  INDEX `idx_course_name`(`course_name`) USING BTREE,
  CONSTRAINT `fk_course_teacher_id` FOREIGN KEY (`course_teacher_id`) REFERENCES `rc_teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_course
-- ----------------------------
INSERT INTO `rc_course` VALUES (1, 1, 'C语言程序设計', 2017, '1-1-2', '信工楼107', 5, 18, 50, NULL, NULL);
INSERT INTO `rc_course` VALUES (2, 1, 'Java程序设計', 2019, '1-3-2', '信工楼106', 4, 0, 30, NULL, NULL);
INSERT INTO `rc_course` VALUES (3, 1, '数据库实用技术', 2017, '2-3-2', 'C区202', 2, 1, 50, NULL, NULL);
INSERT INTO `rc_course` VALUES (4, 1, 'ASP.Net开发', 2017, '5-5-3', 'E区315', 2, 0, 1, NULL, NULL);
INSERT INTO `rc_course` VALUES (5, 1, 'Spring企业级开发', 2017, '3-9-2', '信工楼101', 3, 0, 10, NULL, NULL);
INSERT INTO `rc_course` VALUES (6, 3, '数据库概论', 2017, '3-1-2', 'C区106', 5, 0, 40, NULL, NULL);
INSERT INTO `rc_course` VALUES (7, 3, 'Photoshop', 2017, '2-3-2', 'C区222', 2, 0, 20, NULL, NULL);
INSERT INTO `rc_course` VALUES (8, 4, '計算机网络', 2017, '4-1-3', '信工楼109', 5, 0, 20, NULL, NULL);

-- ----------------------------
-- Table structure for rc_department
-- ----------------------------
DROP TABLE IF EXISTS `rc_department`;
CREATE TABLE `rc_department`  (
  `department_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '系Id',
  `department_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系名称',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_department
-- ----------------------------
INSERT INTO `rc_department` VALUES (1, '計算机系');
INSERT INTO `rc_department` VALUES (2, '数学系');
INSERT INTO `rc_department` VALUES (3, '物理系');
INSERT INTO `rc_department` VALUES (4, '化学系');
INSERT INTO `rc_department` VALUES (5, '測試系1');
INSERT INTO `rc_department` VALUES (6, '測試系2');
INSERT INTO `rc_department` VALUES (7, '測試系3');
INSERT INTO `rc_department` VALUES (8, '測試系4');
INSERT INTO `rc_department` VALUES (9, '測試系5');
INSERT INTO `rc_department` VALUES (10, '測試系6');
INSERT INTO `rc_department` VALUES (11, '測試系7');
INSERT INTO `rc_department` VALUES (12, '測試系8');
INSERT INTO `rc_department` VALUES (13, '測試系9');
INSERT INTO `rc_department` VALUES (14, '測試系10');
INSERT INTO `rc_department` VALUES (15, '臨時系1');
INSERT INTO `rc_department` VALUES (16, '臨時系2');
INSERT INTO `rc_department` VALUES (17, '臨時系3');
INSERT INTO `rc_department` VALUES (18, '臨時系4');
INSERT INTO `rc_department` VALUES (19, '臨時系5');
INSERT INTO `rc_department` VALUES (20, '臨時系6');
INSERT INTO `rc_department` VALUES (21, '臨時系7');
INSERT INTO `rc_department` VALUES (22, '臨時系8');
INSERT INTO `rc_department` VALUES (23, '臨時系9');
INSERT INTO `rc_department` VALUES (24, '臨時系10');
INSERT INTO `rc_department` VALUES (25, '演示系1');
INSERT INTO `rc_department` VALUES (26, '演示系2');
INSERT INTO `rc_department` VALUES (27, '演示系3');
INSERT INTO `rc_department` VALUES (28, '演示系4');
INSERT INTO `rc_department` VALUES (29, '演示系5');
INSERT INTO `rc_department` VALUES (30, '演示系6');
INSERT INTO `rc_department` VALUES (31, '演示系7');
INSERT INTO `rc_department` VALUES (32, '演示系8');
INSERT INTO `rc_department` VALUES (33, '演示系9');
INSERT INTO `rc_department` VALUES (34, '演示系10');
INSERT INTO `rc_department` VALUES (35, '演示系11');
INSERT INTO `rc_department` VALUES (36, '演示系12');
INSERT INTO `rc_department` VALUES (37, '演示系13');
INSERT INTO `rc_department` VALUES (38, '演示系14');
INSERT INTO `rc_department` VALUES (39, '演示系15');
INSERT INTO `rc_department` VALUES (40, '演示系16');
INSERT INTO `rc_department` VALUES (41, '演示系17');
INSERT INTO `rc_department` VALUES (42, '演示系18');
INSERT INTO `rc_department` VALUES (43, '演示系19');
INSERT INTO `rc_department` VALUES (44, '演示系20');

-- ----------------------------
-- Table structure for rc_major
-- ----------------------------
DROP TABLE IF EXISTS `rc_major`;
CREATE TABLE `rc_major`  (
  `major_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '專業Id',
  `major_department_id` int(10) UNSIGNED NOT NULL COMMENT '系Id',
  `major_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '專業名称',
  PRIMARY KEY (`major_id`) USING BTREE,
  INDEX `fk_major_department_id`(`major_department_id`) USING BTREE,
  INDEX `idx_major_name`(`major_name`) USING BTREE,
  CONSTRAINT `fk_major_department_id` FOREIGN KEY (`major_department_id`) REFERENCES `rc_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_major
-- ----------------------------
INSERT INTO `rc_major` VALUES (1, 1, '計算机科学与技术');
INSERT INTO `rc_major` VALUES (2, 1, '软件工程');
INSERT INTO `rc_major` VALUES (3, 1, '信息工程');
INSERT INTO `rc_major` VALUES (4, 2, '应用数学');
INSERT INTO `rc_major` VALUES (5, 2, '数学师范');
INSERT INTO `rc_major` VALUES (6, 5, '測試專業1');
INSERT INTO `rc_major` VALUES (7, 5, '測試專業2');
INSERT INTO `rc_major` VALUES (8, 5, '測試專業3');
INSERT INTO `rc_major` VALUES (9, 5, '測試專業4');
INSERT INTO `rc_major` VALUES (10, 5, '測試專業5');
INSERT INTO `rc_major` VALUES (11, 5, '測試專業6');
INSERT INTO `rc_major` VALUES (12, 5, '測試專業7');
INSERT INTO `rc_major` VALUES (13, 5, '測試專業8');
INSERT INTO `rc_major` VALUES (14, 5, '測試專業9');
INSERT INTO `rc_major` VALUES (15, 5, '測試專業10');
INSERT INTO `rc_major` VALUES (16, 6, '臨時專業1');
INSERT INTO `rc_major` VALUES (17, 6, '臨時專業2');
INSERT INTO `rc_major` VALUES (18, 6, '臨時專業3');
INSERT INTO `rc_major` VALUES (19, 6, '臨時專業4');
INSERT INTO `rc_major` VALUES (20, 6, '臨時專業5');
INSERT INTO `rc_major` VALUES (21, 6, '臨時專業6');
INSERT INTO `rc_major` VALUES (22, 6, '臨時專業7');
INSERT INTO `rc_major` VALUES (23, 6, '臨時專業8');
INSERT INTO `rc_major` VALUES (24, 6, '臨時專業9');
INSERT INTO `rc_major` VALUES (25, 6, '臨時專業10');
INSERT INTO `rc_major` VALUES (26, 7, '演示專業1');
INSERT INTO `rc_major` VALUES (27, 7, '演示專業2');
INSERT INTO `rc_major` VALUES (28, 7, '演示專業3');
INSERT INTO `rc_major` VALUES (29, 7, '演示專業4');
INSERT INTO `rc_major` VALUES (30, 7, '演示專業5');
INSERT INTO `rc_major` VALUES (31, 7, '演示專業6');
INSERT INTO `rc_major` VALUES (32, 7, '演示專業7');
INSERT INTO `rc_major` VALUES (33, 7, '演示專業8');
INSERT INTO `rc_major` VALUES (34, 7, '演示專業9');
INSERT INTO `rc_major` VALUES (35, 7, '演示專業10');
INSERT INTO `rc_major` VALUES (36, 7, '演示專業11');
INSERT INTO `rc_major` VALUES (37, 7, '演示專業12');
INSERT INTO `rc_major` VALUES (38, 7, '演示專業13');
INSERT INTO `rc_major` VALUES (39, 7, '演示專業14');
INSERT INTO `rc_major` VALUES (40, 7, '演示專業15');
INSERT INTO `rc_major` VALUES (41, 7, '演示專業16');
INSERT INTO `rc_major` VALUES (42, 7, '演示專業17');
INSERT INTO `rc_major` VALUES (43, 7, '演示專業18');
INSERT INTO `rc_major` VALUES (44, 7, '演示專業19');
INSERT INTO `rc_major` VALUES (45, 7, '演示專業20');

-- ----------------------------
-- Table structure for rc_student
-- ----------------------------
DROP TABLE IF EXISTS `rc_student`;
CREATE TABLE `rc_student`  (
  `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生Id',
  `student_class_id` int(10) UNSIGNED NOT NULL COMMENT '班级Id',
  `student_number` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `student_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `student_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `student_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `student_birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `student_sex` tinyint(1) UNSIGNED NOT NULL COMMENT '性别',
  `student_last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `fk_student_class_id`(`student_class_id`) USING BTREE,
  UNIQUE INDEX `idx_student_number`(`student_number`) USING BTREE,
  INDEX `idx_student_name`(`student_name`) USING BTREE,
  CONSTRAINT `fk_student_class_id` FOREIGN KEY (`student_class_id`) REFERENCES `rc_class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_student
-- ----------------------------
INSERT INTO `rc_student` VALUES (1, 1, '201711010001', '李雨轩', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', '961523404@qq.com', '1998-08-19 16:09:47', 1, '2019-12-16 17:16:47');
INSERT INTO `rc_student` VALUES (2, 1, '201711010002', '宋健', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (3, 1, '201711010003', '李同学1', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (4, 1, '201711010004', '李同学2', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (5, 1, '201711010005', '李同学3', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (6, 1, '201711010006', '李同学4', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (7, 1, '201711010007', '李同学5', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (8, 1, '201711010008', '李同学6', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (9, 1, '201711010009', '李同学7', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (10, 1, '201711010010', '李同学8', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (11, 1, '201711010011', '李同学9', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (12, 1, '201711010012', '张同学1', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (13, 1, '201711010013', '张同学2', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (14, 1, '201711010014', '张同学3', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (15, 1, '201711010015', '张同学4', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (16, 1, '201711010016', '张同学5', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (17, 1, '201711010017', '张同学6', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (18, 1, '201711010018', '张同学7', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (19, 3, '201711020001', '王同学1', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (20, 3, '201711020002', '王同学2', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (21, 3, '201711020003', '王同学3', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (22, 3, '201711020004', '王同学4', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (23, 3, '201711020005', '王同学5', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (24, 3, '201711020006', '王同学6', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (25, 3, '201711020007', '王同学7', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (26, 3, '201711020008', '王同学8', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (27, 3, '201711020009', '王同学9', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (28, 3, '201711020010', '王同学10', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for rc_student_course
-- ----------------------------
DROP TABLE IF EXISTS `rc_student_course`;
CREATE TABLE `rc_student_course`  (
  `sc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '选课Id',
  `sc_student_id` int(10) UNSIGNED NOT NULL COMMENT '学生Id',
  `sc_course_id` int(10) UNSIGNED NOT NULL COMMENT '课程Id',
  `sc_daily_score` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '日常表现分',
  `sc_exam_score` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '期末測試分',
  `sc_score` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '总成绩',
  PRIMARY KEY (`sc_id`) USING BTREE,
  INDEX `fk_sc_course_id`(`sc_course_id`) USING BTREE,
  INDEX `fk_sc_student_id`(`sc_student_id`) USING BTREE,
  CONSTRAINT `fk_sc_course_id` FOREIGN KEY (`sc_course_id`) REFERENCES `rc_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sc_student_id` FOREIGN KEY (`sc_student_id`) REFERENCES `rc_student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_student_course
-- ----------------------------
INSERT INTO `rc_student_course` VALUES (1, 1, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (2, 2, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (3, 3, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (4, 4, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (5, 5, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (6, 6, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (7, 7, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (8, 8, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (9, 9, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (10, 10, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (11, 11, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (12, 12, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (13, 13, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (14, 14, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (15, 15, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (16, 16, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (17, 17, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (18, 18, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (19, 1, 3, 98, 100, 99);

-- ----------------------------
-- Table structure for rc_teacher
-- ----------------------------
DROP TABLE IF EXISTS `rc_teacher`;
CREATE TABLE `rc_teacher`  (
  `teacher_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '教师Id',
  `teacher_department_id` int(10) UNSIGNED NOT NULL COMMENT '系Id',
  `teacher_number` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '教师姓名',
  `teacher_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`teacher_id`) USING BTREE,
  INDEX `fk_teacher_department_id`(`teacher_department_id`) USING BTREE,
  UNIQUE INDEX `idx_teacher_number`(`teacher_number`) USING BTREE,
  CONSTRAINT `fk_teacher_department_id` FOREIGN KEY (`teacher_department_id`) REFERENCES `rc_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_teacher
-- ----------------------------
INSERT INTO `rc_teacher` VALUES (1, 1, '201711010001', '张三', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (2, 3, '201711020001', '宋老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (3, 1, '201711010002', '宋老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (4, 1, '201711010003', '张老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (5, 1, '201711010004', '吕老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (6, 1, '201711010005', '王老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (7, 1, '201711010006', '丁老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (8, 1, '201711010007', '高老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (9, 1, '201711010008', '赵老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');

SET FOREIGN_KEY_CHECKS = 1;
