/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t083`;
CREATE DATABASE IF NOT EXISTS `t083` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t083`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/springbootsu39z/upload/picture1.jpg'),
	(2, 'picture2', 'http://localhost:8080/springbootsu39z/upload/picture2.jpg'),
	(3, 'picture3', 'http://localhost:8080/springbootsu39z/upload/picture3.jpg'),
	(6, 'homepage', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1707741119260 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `addtime`, `name`, `time`, `status`) VALUES
	(1707740825169, '2024-02-12 12:27:04', '测试试卷', 60, 1),
	(1707741119259, '2024-02-12 12:31:58', '试卷2', 20, 1);

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1707741151131 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `addtime`, `paperid`, `papername`, `questionname`, `options`, `score`, `answer`, `analysis`, `type`, `sequence`) VALUES
	(1707740860457, '2024-02-12 12:27:40', 1707740825169, '测试试卷', '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 2, 'B', '1+1=2', 0, 1),
	(1707741151130, '2024-02-12 12:32:30', 1707740825169, '测试试卷', '1+2=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 2, 'C', '000', 0, 2);

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1707741178386 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `addtime`, `userid`, `username`, `paperid`, `papername`, `questionid`, `questionname`, `options`, `score`, `answer`, `analysis`, `myscore`, `myanswer`) VALUES
	(1707741174672, '2024-02-12 12:32:54', 11, NULL, 1707740825169, '测试试卷', 1707740860457, '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 2, 'B', '1+1=2', 2, 'B'),
	(1707741178385, '2024-02-12 12:32:57', 11, NULL, 1707740825169, '测试试卷', 1707741151130, '1+2=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 2, 'C', '000', 2, 'C');

DROP TABLE IF EXISTS `kaoshiguize`;
CREATE TABLE IF NOT EXISTS `kaoshiguize` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `guize` longtext COMMENT '规则',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COMMENT='考试规则';

DELETE FROM `kaoshiguize`;
INSERT INTO `kaoshiguize` (`id`, `addtime`, `guize`, `tupian`) VALUES
	(51, '2021-04-24 13:59:09', '规则1', 'http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian1.jpg'),
	(52, '2021-04-24 13:59:09', '规则2', 'http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian2.jpg'),
	(53, '2021-04-24 13:59:09', '规则3', 'http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian3.jpg'),
	(54, '2021-04-24 13:59:09', '规则4', 'http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian4.jpg'),
	(55, '2021-04-24 13:59:09', '规则5', 'http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian5.jpg'),
	(56, '2021-04-24 13:59:09', '规则6', 'http://localhost:8080/springbootsu39z/upload/kaoshiguize_tupian6.jpg');

DROP TABLE IF EXISTS `kaoshipingfen`;
CREATE TABLE IF NOT EXISTS `kaoshipingfen` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `shijuan` varchar(200) DEFAULT NULL COMMENT '试卷',
  `pingfen` int DEFAULT NULL COMMENT '评分',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 COMMENT='考试评分';

DELETE FROM `kaoshipingfen`;
INSERT INTO `kaoshipingfen` (`id`, `addtime`, `kemu`, `shijuan`, `pingfen`, `xuehao`, `xingming`, `banji`) VALUES
	(71, '2021-04-24 13:59:09', '科目1', '试卷1', 1, '学号1', '姓名1', '班级1'),
	(72, '2021-04-24 13:59:09', '科目2', '试卷2', 2, '学号2', '姓名2', '班级2'),
	(73, '2021-04-24 13:59:09', '科目3', '试卷3', 3, '学号3', '姓名3', '班级3'),
	(74, '2021-04-24 13:59:09', '科目4', '试卷4', 4, '学号4', '姓名4', '班级4'),
	(75, '2021-04-24 13:59:09', '科目5', '试卷5', 5, '学号5', '姓名5', '班级5'),
	(76, '2021-04-24 13:59:09', '科目6', '试卷6', 6, '学号6', '姓名6', '班级6');

DROP TABLE IF EXISTS `kaoshitongji`;
CREATE TABLE IF NOT EXISTS `kaoshitongji` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `shijuan` varchar(200) DEFAULT NULL COMMENT '试卷',
  `timu` varchar(200) DEFAULT NULL COMMENT '题目',
  `kaoshitongguolv` varchar(200) DEFAULT NULL COMMENT '考试通过率',
  `kaoshikemucishu` varchar(200) DEFAULT NULL COMMENT '考试科目次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='考试统计';

DELETE FROM `kaoshitongji`;
INSERT INTO `kaoshitongji` (`id`, `addtime`, `kemu`, `shijuan`, `timu`, `kaoshitongguolv`, `kaoshikemucishu`) VALUES
	(21, '2021-04-24 13:59:09', '科目1', '试卷1', '题目1', '考试通过率1', '考试科目次数1'),
	(22, '2021-04-24 13:59:09', '科目2', '试卷2', '题目2', '考试通过率2', '考试科目次数2'),
	(23, '2021-04-24 13:59:09', '科目3', '试卷3', '题目3', '考试通过率3', '考试科目次数3'),
	(24, '2021-04-24 13:59:09', '科目4', '试卷4', '题目4', '考试通过率4', '考试科目次数4'),
	(25, '2021-04-24 13:59:09', '科目5', '试卷5', '题目5', '考试通过率5', '考试科目次数5'),
	(26, '2021-04-24 13:59:09', '科目6', '试卷6', '题目6', '考试通过率6', '考试科目次数6');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3 COMMENT='考试资讯';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`) VALUES
	(111, '2021-04-24 13:59:09', '标题1', '简介1', 'http://localhost:8080/springbootsu39z/upload/news_picture1.jpg', '内容1'),
	(112, '2021-04-24 13:59:09', '标题2', '简介2', 'http://localhost:8080/springbootsu39z/upload/news_picture2.jpg', '内容2'),
	(113, '2021-04-24 13:59:09', '标题3', '简介3', 'http://localhost:8080/springbootsu39z/upload/news_picture3.jpg', '内容3'),
	(114, '2021-04-24 13:59:09', '标题4', '简介4', 'http://localhost:8080/springbootsu39z/upload/news_picture4.jpg', '内容4'),
	(115, '2021-04-24 13:59:09', '标题5', '简介5', 'http://localhost:8080/springbootsu39z/upload/news_picture5.jpg', '内容5'),
	(116, '2021-04-24 13:59:09', '标题6', '简介6', 'http://localhost:8080/springbootsu39z/upload/news_picture6.jpg', '内容6');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', 'wrwex79zdvq2vv47hlkkmghqjsvtvwe9', '2024-02-12 12:21:34', '2024-02-12 13:31:15'),
	(2, 11, '用户1', 'yonghu', '用户', 'wmoywe3uorh42pc9nrhdagmixyjj9hnw', '2024-02-12 12:28:13', '2024-02-12 13:28:14');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-04-24 13:59:09');

DROP TABLE IF EXISTS `wangjimimarenyuandengji`;
CREATE TABLE IF NOT EXISTS `wangjimimarenyuandengji` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `xueyuan` varchar(200) DEFAULT NULL COMMENT '学院',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `xinmima` varchar(200) DEFAULT NULL COMMENT '新密码',
  `xiugaishijian` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COMMENT='忘记密码人员登记';

DELETE FROM `wangjimimarenyuandengji`;
INSERT INTO `wangjimimarenyuandengji` (`id`, `addtime`, `xuehao`, `xingming`, `banji`, `xueyuan`, `zhuanye`, `shouji`, `xinmima`, `xiugaishijian`) VALUES
	(61, '2021-04-24 13:59:09', '学号1', '姓名1', '班级1', '学院1', '专业1', '手机1', '新密码1', '2021-04-24 21:59:09'),
	(62, '2021-04-24 13:59:09', '学号2', '姓名2', '班级2', '学院2', '专业2', '手机2', '新密码2', '2021-04-24 21:59:09'),
	(63, '2021-04-24 13:59:09', '学号3', '姓名3', '班级3', '学院3', '专业3', '手机3', '新密码3', '2021-04-24 21:59:09'),
	(64, '2021-04-24 13:59:09', '学号4', '姓名4', '班级4', '学院4', '专业4', '手机4', '新密码4', '2021-04-24 21:59:09'),
	(65, '2021-04-24 13:59:09', '学号5', '姓名5', '班级5', '学院5', '专业5', '手机5', '新密码5', '2021-04-24 21:59:09'),
	(66, '2021-04-24 13:59:09', '学号6', '姓名6', '班级6', '学院6', '专业6', '手机6', '新密码6', '2021-04-24 21:59:09');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `xueyuan` varchar(200) DEFAULT NULL COMMENT '学院',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `addtime`, `xuehao`, `mima`, `xingming`, `xingbie`, `xueyuan`, `zhuanye`, `banji`, `shouji`, `shenfenzheng`, `zhaopian`) VALUES
	(11, '2021-04-24 13:59:09', '用户1', '123456', '姓名1', '男', '学院1', '专业1', '班级1', '13823888881', '440300199101010001', 'http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian1.jpg'),
	(12, '2021-04-24 13:59:09', '用户2', '123456', '姓名2', '男', '学院2', '专业2', '班级2', '13823888882', '440300199202020002', 'http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian2.jpg'),
	(13, '2021-04-24 13:59:09', '用户3', '123456', '姓名3', '男', '学院3', '专业3', '班级3', '13823888883', '440300199303030003', 'http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian3.jpg'),
	(14, '2021-04-24 13:59:09', '用户4', '123456', '姓名4', '男', '学院4', '专业4', '班级4', '13823888884', '440300199404040004', 'http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian4.jpg'),
	(15, '2021-04-24 13:59:09', '用户5', '123456', '姓名5', '男', '学院5', '专业5', '班级5', '13823888885', '440300199505050005', 'http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian5.jpg'),
	(16, '2021-04-24 13:59:09', '用户6', '123456', '姓名6', '男', '学院6', '专业6', '班级6', '13823888886', '440300199606060006', 'http://localhost:8080/springbootsu39z/upload/yonghu_zhaopian6.jpg');

DROP TABLE IF EXISTS `zhuanyeleixing`;
CREATE TABLE IF NOT EXISTS `zhuanyeleixing` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COMMENT='专业类型';

DELETE FROM `zhuanyeleixing`;
INSERT INTO `zhuanyeleixing` (`id`, `addtime`, `leixing`) VALUES
	(41, '2021-04-24 13:59:09', '类型1'),
	(42, '2021-04-24 13:59:09', '类型2'),
	(43, '2021-04-24 13:59:09', '类型3'),
	(44, '2021-04-24 13:59:09', '类型4'),
	(45, '2021-04-24 13:59:09', '类型5'),
	(46, '2021-04-24 13:59:09', '类型6');

DROP TABLE IF EXISTS `zhuanyeliebiao`;
CREATE TABLE IF NOT EXISTS `zhuanyeliebiao` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhuanyemingcheng` varchar(200) DEFAULT NULL COMMENT '专业名称',
  `zhuanyexiangqing` longtext COMMENT '专业详情',
  `zhuanyeleixing` varchar(200) DEFAULT NULL COMMENT '专业类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COMMENT='专业列表';

DELETE FROM `zhuanyeliebiao`;
INSERT INTO `zhuanyeliebiao` (`id`, `addtime`, `zhuanyemingcheng`, `zhuanyexiangqing`, `zhuanyeleixing`) VALUES
	(31, '2021-04-24 13:59:09', '专业名称1', '专业详情1', '专业类型1'),
	(32, '2021-04-24 13:59:09', '专业名称2', '专业详情2', '专业类型2'),
	(33, '2021-04-24 13:59:09', '专业名称3', '专业详情3', '专业类型3'),
	(34, '2021-04-24 13:59:09', '专业名称4', '专业详情4', '专业类型4'),
	(35, '2021-04-24 13:59:09', '专业名称5', '专业详情5', '专业类型5'),
	(36, '2021-04-24 13:59:09', '专业名称6', '专业详情6', '专业类型6');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
