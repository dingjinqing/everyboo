/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : everyboo

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-12-07 10:21:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL COMMENT '审核标记(多余、未使用)',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '逻辑删除',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `content` longtext COMMENT '文章内容',
  `cover_image_url` varchar(128) DEFAULT NULL COMMENT '封面图片url',
  `href` varchar(128) DEFAULT NULL COMMENT '文章链接',
  `order_no` int(11) DEFAULT NULL COMMENT '文章排序编号',
  `publisher` varchar(64) DEFAULT NULL COMMENT '发布者',
  `source_from` varchar(64) DEFAULT NULL COMMENT '文章来源',
  `summary` varchar(512) DEFAULT NULL COMMENT '文章摘要',
  `title` varchar(256) DEFAULT NULL COMMENT '文章标题',
  `column_info_id` varchar(32) DEFAULT NULL COMMENT '所属栏目id',
  `is_audit` bit(1) DEFAULT NULL COMMENT '是否审核（1为是，0为否）',
  `is_top` bit(1) DEFAULT NULL COMMENT '是否置顶（1为是，0为否）',
  `view_count` int(11) DEFAULT NULL COMMENT '阅读次数',
  `root_column_info_id` varchar(32) DEFAULT NULL COMMENT '跟栏目id',
  `type` int(11) DEFAULT NULL COMMENT '类型（0位普通文章，1为外链文章，2为广告文章',
  PRIMARY KEY (`id`),
  KEY `FK_bcwrpr0ji2q3en1mrahtqkjwn` (`column_info_id`),
  KEY `FK_20m4l0vy20mnqtq74gs0nd8xo` (`root_column_info_id`),
  CONSTRAINT `FK_20m4l0vy20mnqtq74gs0nd8xo` FOREIGN KEY (`root_column_info_id`) REFERENCES `cms_column_info` (`id`),
  CONSTRAINT `FK_bcwrpr0ji2q3en1mrahtqkjwn` FOREIGN KEY (`column_info_id`) REFERENCES `cms_column_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('2c92d3966730716d01673191163c0000', null, '2018-11-20 22:40:51', '0', '2018-11-28 10:24:28', null, '/uploads/attach/c56c5ce2-34be-4d0f-8767-a876dbbd89a9.jpg', '', null, '康哥', null, null, '健康', '8a2a08425b7a0b7b015b7a2b0f060006', '', null, '0', '4028821e5b7a0971015b7a0a1cbf0000', '2');
INSERT INTO `cms_article` VALUES ('2c92d3966730716d01673191d1a90001', null, '2018-11-20 22:41:39', '0', '2018-11-28 10:24:46', null, '/uploads/attach/01ed0f7f-e047-4939-a00b-2e29958cb614.jpg', '', null, '', null, null, '1', '8a2a08425b7a0b7b015b7a2b0f060006', '', null, '0', '4028821e5b7a0971015b7a0a1cbf0000', '2');
INSERT INTO `cms_article` VALUES ('2c92d3966730716d0167349536fc0002', null, '2018-11-21 12:44:13', '1', '2018-11-27 17:55:44', '<p><span style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px;\">有人很怕<a href=\"http://www.baidu.com/s?wd=%E5%87%BA%E6%B1%97%E7%9A%84%E5%A5%BD%E5%A4%84&ie=utf-8\" target=\"_blank\" style=\"color: rgb(7, 81, 154); text-decoration-line: none;\">出汗</a>，却不知道<a href=\"http://www.baidu.com/s?wd=%E5%87%BA%E6%B1%97%E7%9A%84%E5%A5%BD%E5%A4%84&ie=utf-8\" target=\"_blank\" style=\"color: rgb(7, 81, 154); text-decoration-line: none;\"><span style=\"color: rgb(51, 51, 51);\">夏天出汗</span></a>是上天赋予我们天然的保健方式，该出汗时就要出汗，下面是<a href=\"http://51jkgl.com/\" target=\"_blank\" style=\"color: rgb(7, 81, 154); text-decoration-line: none;\">健康</a>专家告诉你的“</span><span style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px;\">1</span><span style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px;\">0大</span><span style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px;\">出汗的好处”<br/></span><span style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 14px;\"></span></p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://www.51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 12px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/2a25da95-442b-4b33-9487-884835fd5e71.gif\" alt=\"出汗排毒防癌\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a><span style=\"font-size: 14px;\">出汗排毒防癌</span></h3><p>研究数据显示，汗液是体内砷、镉、铅、汞等有害物质的排出途径之一，在汗液中可以检测到与尿液中浓度相当的重金属成分，有时浓度甚至会比尿液更高。</p><p><img src=\"http://www.51jkgl.com/UserFiles/58ab7657-4b4e-4b34-8402-30ea9784d70c.gif\" width=\"150\" height=\"150\" alt=\"出汗的好处 出汗排毒防癌润肤 如何才能正确出汗\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/><br/></p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://www.51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 13px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/20c2c23c-221f-4d0e-82d9-74db2b132ff6.gif\" alt=\"出汗润肤护肤\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a><span style=\"font-size: 14px;\">出汗润肤护肤</span>&nbsp;</h3><p>夏天人之所以容易大汗淋漓，就是因为外界温度高，人体为了保持恒温，就不断地排汗散热。而由于出汗的过程是从毛孔中排出汗水，人体表面分泌的油脂和杂物也会一同排出。因此，夏天多流汗也有助于保护体表皮肤的干净，滋润皮肤。</p><p>汗液能去除堵塞毛孔的毒素，消除皮肤上的粉刺和痘痘。很多人经常冒痘痘，部分原因是由于皮肤毛孔不干净，堵塞毛孔造成的。夏天不如多运动运动，出一些汗，你立马会感觉皮肤变得紧实细腻，有光泽，痘痘也会自然减少。</p><p>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 12px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/aa2b2a64-bf6c-44dc-b297-8a8a6f2dea6f.gif\" alt=\"出汗减肥、预防慢性病\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a><span style=\"font-size: 14px;\">出汗减肥、预防慢性病</span></h3><p>出汗能消耗身体多余能量，有助于促进脂肪的分解，有一定的减肥作用。身体内、血管内的脂肪少了，自然高血压、高血脂等慢性病及心血管疾病也会减少、好转。</p><p>夏天本身细胞就会比较活跃，此时加强运动，科学排汗，效果是平时的好几倍，更有利于减肥，改善身体状况，预防“三高”等慢性疾病。</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://www.51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 13px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/4a3b1b31-019c-45e2-b18f-bf0f68253462.gif\" alt=\"出汗提高免疫力\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a><span style=\"font-size: 14px;\">出汗提高免疫力</span></h3><p>夏天多出汗还有另一个惊人的好处，那就是提高身体免疫力。很多人为了提高免疫力经常会吃保健品，一些保健品中所含成分不明，有些保健品含激素，反而抑制免疫系统。</p><p>最好的方式就是通过科学的出汗。研究发现，汗液中含有的抗菌肽能有效地抵御病毒、细菌和真菌；出汗能有效地增强自身免疫力，提高抗菌抗病毒的能力。比如，每天运动30-45分钟，身体微微出汗，每周5天，长期坚持，免疫力就会增强。<br/><img src=\"http://www.51jkgl.com/UserFiles/a606456c-32d1-447e-a35b-1e510982c7ea.gif\" width=\"150\" height=\"150\" alt=\"出汗的好处 出汗排毒防癌润肤 如何才能正确出汗\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></p><p>&nbsp;<br/>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://www.51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 12px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/ea53242b-3844-4044-97e2-fb9c3cc3c659.gif\" alt=\"出汗促进消化\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a><span style=\"font-size: 14px;\">出汗促进消化</span></h3><p>夏天往往会没食欲，不消化，这时促进消化最好的手段就是通过运动出汗。因为出汗时会加快整个身体的代谢，有助肠道蠕动，改善消化。</p><p>特别是对于有便秘的人来说，通过运动出汗，对缓解便秘也有很大帮助。</p><p>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><img alt=\"出汗增强记忆力\" width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/7de431d9-6913-4de5-bf7e-3700c534ddb5.gif\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: 12px;\"/><span style=\"font-size: 14px;\">出汗增强记忆力</span></h3><p>出汗也会让人体细胞处于旺盛的状态，保持精神集中，增强记忆力，让大脑更有活力。</p><p>另外也有研究证实，运动流汗对大脑会产生积极正面的效果，能让人的记忆力、专注力都能得到大幅度提升。<br/>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 12px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/63159ca0-c87f-49bd-abf5-9ebcd98a3faf.gif\" alt=\"出汗稳定血压\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a><span style=\"font-size: 14px;\">出汗稳定血压</span></h3><p>运动出汗有助于扩张毛细血管，加速血液循环，增加血管壁弹性，从而达到降低血压的目的。同时，运动出汗加快了血液的循环，有助于消化系统和神经系统调节。所以，预防高血压除了<a href=\"http://www.51jkgl.com/cn/default.aspx?page=ysjkgl.html\" target=\"_blank\" style=\"color: rgb(7, 81, 154); text-decoration-line: none;\"><span style=\"color: rgb(51, 51, 51);\">饮食</span></a>控制，出汗就是最佳的<a href=\"http://www.51jkgl.com/cn/default.aspx?page=ysjkgl-list.html&cid=61\" target=\"_blank\" style=\"color: rgb(7, 81, 154); text-decoration-line: none;\">疗养</a>方式。</p><p>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://www.51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 12px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/3f3cf336-251c-45d6-9a51-c1382208c390.gif\" alt=\"出汗稳定血压\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a>出汗保护骨骼</h3><p>我们都知道很多人一上了年纪都容易得骨质疏松症，是因为体内钙质流失。出汗有利于钙质的有效保留，防止体内的钙质随尿液排出，预防骨质疏松。</p><p>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><a target=\"_blank\" href=\"http://51jkgl.com/\" style=\"color: rgb(7, 81, 154); text-decoration-line: none; font-size: 12px;\"><img width=\"15\" height=\"15\" src=\"http://www.51jkgl.com/UserFiles/e77ed6ea-f542-4b89-b183-0b4bab3df2b3.gif\" alt=\"出汗防止结石\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a><span style=\"font-size: 14px;\">出汗防止结石</span></h3><p>结石的形成主要是体内的磷酸镁等无机盐类在体内结晶沉积形成。而出汗能有效排出体内盐分并保留骨骼中的钙质。这一生理过程能限制盐和钙在肾脏和尿液中堆积起来，而这正是结石的来源。出汗较多的人会喝更多的水，从而也防止了结石的形成。</p><p>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><strong><span style=\"color: rgb(0, 0, 255);\"><span style=\"font-size: 14px;\">10</span></span></strong><span style=\"font-size: 14px;\">出汗预防感冒</span></h3><p>出汗实际上有助于抵抗结核病菌和其他危险的病原体。汗液中含有的抗菌肽能有效地抵御病毒、细菌和真菌；它能进入细菌的细胞膜，对其进行分解。2013年发表在《美国国家科学院院刊》上的研究成果表明：皮离蛋白能够非常有效地对抗结核病菌和其他细菌。这种天然物质比抗生素更为有效，皮离蛋白这种天然的抗生素在微酸性的汗液中能够自然地被激活。</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><span style=\"font-size: 14px;\">如何才能正确出汗？</span></h3><p>人的出汗方式分为两种：主动出汗和被动出汗。<br/></p><p><span style=\"color: rgb(0, 0, 255);\">主动出汗</span>：<br/>主动出汗主要依靠运动来实现，会加速人体的新陈代谢，促进能量的消耗。比如，健步走、慢跑等。<br/></p><p><br/><span style=\"color: rgb(0, 0, 255);\">被动出汗：</span><br/>被动出汗是通过热环境，促进人体出汗，这种出汗的方式消耗量更小，适合身体不适宜运动的人。如，泡脚、汗蒸、桑拿等。</p><p><br/></p>', '/uploads/attach/76936581-6929-48d3-963d-18abb9d2e048.png', '', null, '', null, null, '出汗的好处 出汗排毒防癌润肤 如何才能正确出汗', '2c92d39667356dfc016739d0ca110004', '', null, '6', '8a2a08425b7a0b7b015b7a2a82ab0005', '0');
INSERT INTO `cms_article` VALUES ('2c92d3966730716d016734979ce20003', null, '2018-11-21 12:46:50', '1', '2018-11-27 17:55:47', '<h2 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><span style=\"font-size: 14px;\">什么是微循环？</span></h2><p>微循环是微动脉与微静脉之间毛细血管中的血液循环，是循环系统中最基层的结构和功能单位。它包括微动脉、微静脉、毛细淋巴管和组织管道内的体液循环。人体每个器官，每个组织细胞均要由微循环提供氧气、养料，传递能量，交流信息，排除二氧化碳及代谢废物。</p><p>&nbsp;</p><h2 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><span style=\"font-size: 14px;\">微循环的功能</span></h2><p>供给组织细胞氧气和养料，同时带走组织细胞代谢产生的产物保障物质代谢、信息交换的顺利进行，维持人体内环境稳定控制血流和血压。</p><p>&nbsp;</p><h2 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><span style=\"font-size: 14px;\">微循环的四个特点：</span></h2><p>长：拉直其总长度有10万-13万公里，可绕地球两圈</p><p>细：微动脉及微静脉管径很细，只有头发丝的1∕20，只允许1-2个红血球通过。</p><p>薄：微动脉及微静脉管壁很薄，只有一张纸的1∕100</p><p>慢：微动脉及微静脉中的血流速度很慢，流速1毫米∕秒。当血液粘稠度增高时，血流速度更慢。血液内容物容易沉积于血管壁，形成栓塞，阻塞血管生病（亚健康各种难受不舒服、三高四高五高、心梗脑梗中风肿瘤癌症等等）。&nbsp;<br/>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><span style=\"font-size: 14px;\">什么是微循环障碍？</span></h3><p>微循环障碍是血液理化性质的改变，使管腔狭窄，血液流速或减慢或血栓形成，使局部组织缺血缺氧甚至坏死，引起一系列临床症状，微循环畅通百病不生，微循环障碍是百病之源。健全的微循环功能是保证体内重要脏器执行正常功能的首要前提，医学已证明：人体的衰老，肿瘤的发生，高血压、糖尿病及许多心脑血管等疾病、主要是微循环障碍所致，因此微循环正常与否，是人体是否健康的重要标志。</p><p>&nbsp;</p><p>现今的生活方式、饮食、压力、污染等都是造成微循环障碍的主要外部原因。随着年龄的增长，人体的细胞和血液会逐渐衰老，功能也自然随之退化，这是造成微循环障碍内部原因。微循环发生障碍会使很多人处于亚健康状态，严重时会导致心梗或中风等其他重大疾病。</p><p>&nbsp;</p><h3 style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: 宋体; white-space: normal;\"><span style=\"font-size: 14px;\">微循环障碍会造成哪些疾病？</span><span style=\"font-size: 14px;\"><br/></span></h3><p>一旦人体的微循环发生障碍，其相应的组织系统或内脏器官就会受到影响而不能发挥正常功能，就容易导致人体的衰老、免疫功能的紊乱以及疾病的发生。正常情况下，微循环血流量与人体组织、器官代谢水平适应，使人体内各器官生理功能得以正常运行。因为人的毛细血管极细极长，而且其中的血液流速极慢，每秒只能流动0.41毫米。在这么长的血管中，经常有杂质混浊在血液中，如胆固醇、酒精、尼古丁、药物残渣、化学残留物等，它们不但使血管壁变厚，有时经常堵塞血管，造成血液运行不畅。因此，人体如果不注意调理保养保健预防，微循环很容易发生堵塞障碍，产生淤滞，新陈代谢不能正常进行，轻则造成机体功能退化，严重时就导致疾病的发生。</p><p>目前医学研究，人的衰老、生病都与微循环功能障碍有关这是比较公认的学说。那么微循环障碍会起哪些疾病呢？</p><p>&nbsp;</p><p>神经系统：<br/>脑部发生供血不足，脑细胞得不到充足的氧气、养料，代谢产物不能充分顺利排除，而导致头晕、头痛、失眠、多梦、记忆力下降、神经衰弱、重者会发生脑梗塞、中风等症。</p><p>心血管系统：<br/>心脏发生微循环障碍，引起心肌供血不足，产生胸闷、心慌、心律不齐、心绞痛等冠心病的症状，甚至发生心肌梗死。</p><p>呼吸系统发生微循环障碍时，则会发生胸闷、气短、咳嗽、哮喘、支气管炎等.....</p><p><br/></p>', null, '', null, '', null, null, '什么是微循环 微循环的功能 微循环的四个特点', '2c92d39667356dfc016739d1217f0005', '', null, '10', '8a2a08425b7a0b7b015b7a2a82ab0005', '0');
INSERT INTO `cms_article` VALUES ('2c92d3966730716d016734a960700004', null, '2018-11-21 13:06:14', '1', '2018-11-27 17:13:44', '<p>资讯内容姐哈VBGXJGB东西JHVD就好三个SXGH就好序号VSXJH&nbsp;&nbsp;&nbsp;&nbsp;GD UYTE67215~^~%^~#@!#$$%%^&amp;*(((^%HXHG UJAGDBJK B会比较好吧大健康会比较打车吧进口国VB阿布按时哈是抚养权问题富豪区两部分就看个够去跟复购过桥费局过去行擦拭个VB擦好的㔿方便名字，甲AIHBC J132</p><p>1564897<img src=\"http://47.106.142.171:8080/everyboo-module-admin/uploads/image/20181127/1543283970578031941.jpg\" title=\"1543283970578031941.jpg\" alt=\"制茶.jpg\"/></p>', '/uploads/attach/495ce41a-ede9-4d56-8adc-ecee67ae9f14.jpg', '', null, 'AA', null, null, '资讯标题', '2c92d39667356dfc016739d186cc0006', '', null, '68', '4028821e5b7a9cbf015b7a9f79e00000', '0');
INSERT INTO `cms_article` VALUES ('2c92d396674e69d201674f4e4d020001', null, '2018-11-26 17:16:30', '1', '2018-11-27 17:55:54', '<p>大家开会DOI的回报AJHDU安徽的KADAGioDJK鬼回到家看更好AJKDGAJKDHU的HD JK鬼回到家看个KJDGK极高的KG DKJ更好打开J&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GDKJ更好的健康HDKJ好的就kGHJKDG看大哥KJHDKJ好打卡机DJK好的JHD JK</p><p><img title=\"1543223776252075294.jpg\" alt=\"卡片2.jpg\" src=\"http://47.106.142.171:8080/everyboo-module-admin/uploads/image/20181126/1543223776252075294.jpg\"/></p>', null, '', null, '康哥', null, null, '爱心', '2c92d39667356dfc016739ce465b0001', '', '', '0', '2c92d3966726e03001672eafcb4f0000', '0');
INSERT INTO `cms_article` VALUES ('2c92d396674e69d201674f537f3d0003', null, '2018-11-26 17:22:11', '1', '2018-11-27 17:56:10', '<p>&nbsp;大桥未久大健康请我百度金矿钱不多全聚合物并对其聚合物GV的NQIODUY&nbsp; DHQWBD QKBJ D ,MNABN&nbsp;&nbsp; DKSANDJK AJK还能和哦度然后点击不积跬步会计法八节课 fkjqbjkfqbnioruq97ru09q8ur093</p><p>就哦企划就去吧**（）（）&amp;……%￥￥</p><p style=\"TEXT-ALIGN: center\"><img title=\"1543224099416073197.png\" alt=\"食用菌饮料.png\" src=\"http://47.106.142.171:8080/everyboo-module-admin/uploads/image/20181126/1543224099416073197.png\"/></p><p></p>', null, '', null, '嫁得好', null, null, '记得去跟', '2c92d39667356dfc016739d186cc0006', '', '', '1', '4028821e5b7a9cbf015b7a9f79e00000', '0');
INSERT INTO `cms_article` VALUES ('2c92d396675465d00167550411f80000', null, '2018-11-27 19:53:09', '0', '2018-12-02 14:33:29', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">康生缘（厦门）生物科技有限公司是一家集生物科技研发、种植、养殖、生产、运营、旅游、度假、疗养等于一体的多元化创新企业，公司成立于2016年，总部位于福建省厦门市杏林湾商务营运中心。厦门康生缘坚持以品质、创新、服务、共赢作为运营基础，定位于移动互联网+大健康领域，线上线下一体化运营，注重提高顾客体验，全方位拓展全渠道营销模式。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">厦门康生缘着力开发健康产业高品质产品，致力于全民大健康产业的发展与推广，专注于针对危害人类健康最大的亚健康和肿瘤、三高等慢性病族群、以及中老年人等特殊群体，与国内外多个著名医疗机构的专家及科研院所合作，利用国际前沿的研发技术和生产工艺，深度开发具有中国特色的健康产品。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">公司甄选福建闽西风景优美、无污染的高山林区，联合数家公司和合作单位，投资建设多个千亩级天然生态旅游度假疗养基地、种植养殖基地，产品包括野生石斛、野生蜂蜜、野生灵芝、蔬果、生态鱼、生态鸭、走地鸡、闽西土特产等农副产品，远销国内外。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\"><br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">公司资质齐全、实力雄厚，拥有一支经验丰富、责任心强、为顾客着想的优秀团队，能为消费者提供便捷和专业的服务，公司多年来通过不断努力和创新，得到行业内外的肯定和好评。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">企业文化：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">公司理念：分享健康，共创财富</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">公司宗旨：品质为本，客户至上</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">公司使命：大健康，大平台，大事业</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 15px; font-variant-numeric: normal; font-variant-east-asian: normal; letter-spacing: 2px; line-height: 30px; text-align: justify; white-space: normal; widows: 1; background-color: rgb(255, 255, 255); overflow-wrap: break-word !important;\">公司愿景：绿色纯生态，健康每个人</p>', '/uploads/attach/5d164750-846e-4d18-9902-eb2e9b02d9fd.jpg', '', null, '康哥', null, null, '康生缘（厦门）生物科技有限公司', '2c92d396674e69d201674f520dbe0002', '', null, '66', '4028821e5b7a9cbf015b7a9f79e00000', '0');
INSERT INTO `cms_article` VALUES ('4028abe16716c408016716d008710000', null, '2018-11-15 17:59:51', '0', '2018-11-28 10:25:33', '<p>额恩恩</p>', '/uploads/attach/aa03626d-5781-42b8-858a-442c3eeb0f27.jpg', '', null, '康哥', null, null, '1', '8a2a08425b7a0b7b015b7a2b0f060006', '', null, '0', '4028821e5b7a0971015b7a0a1cbf0000', '2');

-- ----------------------------
-- Table structure for `cms_column_info`
-- ----------------------------
DROP TABLE IF EXISTS `cms_column_info`;
CREATE TABLE `cms_column_info` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL COMMENT '审核标记(多余、未使用)',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `delete_flag` varchar(1) DEFAULT NULL COMMENT '逻辑删除(1删除  0正常)',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `code` varchar(20) DEFAULT NULL COMMENT '栏目编码（具有唯一性）',
  `level` int(11) DEFAULT NULL COMMENT '栏目层级(0是一级，1是二级)',
  `name` varchar(32) DEFAULT NULL COMMENT '栏目名称',
  `order_no` int(11) DEFAULT NULL COMMENT '栏目排序',
  `path` varchar(512) DEFAULT NULL COMMENT '栏目路径，从顶到自己的路径用当前表的id拼接表示',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父节点id',
  `icon` varchar(128) DEFAULT NULL COMMENT '栏目图标',
  `channel` int(11) DEFAULT NULL COMMENT '类型（0位pc，1为wap',
  PRIMARY KEY (`id`),
  KEY `FK_8pcbm05c14nhwr1bu0ui96d85` (`parent_id`),
  CONSTRAINT `FK_8pcbm05c14nhwr1bu0ui96d85` FOREIGN KEY (`parent_id`) REFERENCES `cms_column_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_column_info
-- ----------------------------
INSERT INTO `cms_column_info` VALUES ('2c92d3966726e03001672eafcb4f0000', null, '2018-11-20 09:15:32', '0', '2018-11-20 11:32:30', 'aixin', '0', '爱心公益', null, '2c92d3966726e03001672eafcb4f0000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d39667356dfc016739ce465b0001', null, '2018-11-22 13:04:39', '0', '2018-11-22 13:04:39', '001', '1', '爱心活动', null, '2c92d3966726e03001672eafcb4f0000/2c92d39667356dfc016739ce465b0001', '2c92d3966726e03001672eafcb4f0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d39667356dfc016739cf74d40002', null, '2018-11-22 13:05:56', '0', '2018-11-22 13:05:56', '002', '1', '贫苦户信息', null, '2c92d3966726e03001672eafcb4f0000/2c92d39667356dfc016739cf74d40002', '2c92d3966726e03001672eafcb4f0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d39667356dfc016739d0ca110004', null, '2018-11-22 13:07:23', '0', '2018-11-22 13:07:23', '001', '1', '医师信息', null, '8a2a08425b7a0b7b015b7a2a82ab0005/2c92d39667356dfc016739d0ca110004', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d39667356dfc016739d1217f0005', null, '2018-11-22 13:07:46', '0', '2018-11-22 13:07:46', '002', '1', '民间偏方', null, '8a2a08425b7a0b7b015b7a2a82ab0005/2c92d39667356dfc016739d1217f0005', '8a2a08425b7a0b7b015b7a2a82ab0005', null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d39667356dfc016739d186cc0006', null, '2018-11-22 13:08:12', '0', '2018-11-22 13:08:12', '001', '1', '企业介绍', null, '4028821e5b7a9cbf015b7a9f79e00000/2c92d39667356dfc016739d186cc0006', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d39667356dfc016739d1afac0007', null, '2018-11-22 13:08:22', '0', '2018-11-22 13:08:22', '002', '1', '产品介绍', null, '4028821e5b7a9cbf015b7a9f79e00000/2c92d39667356dfc016739d1afac0007', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d396674e69d201674f4a04af0000', null, '2018-11-26 17:11:50', '0', '2018-11-26 17:11:50', '003', '1', '爱心爱心', null, '2c92d3966726e03001672eafcb4f0000/2c92d396674e69d201674f4a04af0000', '2c92d3966726e03001672eafcb4f0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('2c92d396674e69d201674f520dbe0002', null, '2018-11-26 17:20:36', '0', '2018-11-26 17:20:36', '003', '1', '公司简介', null, '4028821e5b7a9cbf015b7a9f79e00000/2c92d396674e69d201674f520dbe0002', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('4028821e5b7a0971015b7a0a1cbf0000', null, '2017-04-17 11:52:14', '0', '2018-11-09 14:36:15', 'shouye', '0', '首页', '1', '4028821e5b7a0971015b7a0a1cbf0000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('4028821e5b7a9cbf015b7a9f79e00000', null, '2017-04-17 14:35:23', '0', '2018-11-09 14:53:09', 'zixun', '0', '资讯', '3', '4028821e5b7a9cbf015b7a9f79e00000', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a0cf4440000', null, '2017-04-17 11:55:21', '0', '2018-11-09 14:44:02', 'chanping', '1', '产品介绍', '11', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a0cf4440000', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a105a640003', null, '2017-04-17 11:59:03', '0', '2018-11-09 14:36:15', 'sy_tzgg', '1', '通知公告', '14', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a105a640003', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a2a82ab0005', null, '2017-04-17 12:27:38', '0', '2018-11-09 14:47:45', 'jiankang', '0', '健康管理', '2', '8a2a08425b7a0b7b015b7a2a82ab0005', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7a0b7b015b7a2b0f060006', null, '2017-04-17 12:28:13', '0', '2018-11-09 14:43:47', 'sy_ad', '1', '广告位(图片)', '10', '4028821e5b7a0971015b7a0a1cbf0000/8a2a08425b7a0b7b015b7a2b0f060006', '4028821e5b7a0971015b7a0a1cbf0000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7aa9a1ad0004', null, '2017-04-17 14:46:29', '1', '2018-11-22 13:07:56', 'zixun', '1', '资讯', '1', '4028821e5b7a9cbf015b7a9f79e00000/8a2a08425b7aa230015b7aa9a1ad0004', '4028821e5b7a9cbf015b7a9f79e00000', null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab7f0ae001d', null, '2017-04-17 15:02:06', '0', '2018-11-09 14:35:15', 'lxwm', '0', '联系我们', '8', '8a2a08425b7aa230015b7ab7f0ae001d', null, null, '0');
INSERT INTO `cms_column_info` VALUES ('8a2a08425b7aa230015b7ab849e6001e', null, '2017-04-17 15:02:29', '0', '2018-11-09 14:35:15', 'lxwm_lxwm', '1', '联系我们', '1', '8a2a08425b7aa230015b7ab7f0ae001d/8a2a08425b7aa230015b7ab849e6001e', '8a2a08425b7aa230015b7ab7f0ae001d', null, '0');

-- ----------------------------
-- Table structure for `ins_institution`
-- ----------------------------
DROP TABLE IF EXISTS `ins_institution`;
CREATE TABLE `ins_institution` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `contact` varchar(64) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `ins_type` int(11) DEFAULT NULL,
  `introduction` longtext,
  `logo` varchar(128) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ins_institution
-- ----------------------------

-- ----------------------------
-- Table structure for `org_resource`
-- ----------------------------
DROP TABLE IF EXISTS `org_resource`;
CREATE TABLE `org_resource` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `icon` varchar(512) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2qoscu42yxypno5iv9w9raj2n` (`parent_id`),
  CONSTRAINT `FK_2qoscu42yxypno5iv9w9raj2n` FOREIGN KEY (`parent_id`) REFERENCES `org_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_resource
-- ----------------------------
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb2e74b90000', null, '2017-03-17 15:32:19', '0', '2017-03-17 15:32:19', '', '修改密码', '90', 'module', '/user/update_pwd', null);
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb32ffb90001', null, '2017-03-17 15:37:16', '0', '2017-03-17 15:37:16', '', '内容管理', '30', 'module', '', null);
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb36bac60002', null, '2017-03-17 15:41:21', '0', '2017-03-17 16:17:12', '', '栏目列表', '31', 'page', '/cms/column/list', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb37ccd50003', null, '2017-03-17 15:42:31', '0', '2017-03-17 16:17:21', '', '文章列表', '32', 'page', '/cms/article/list', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_resource` VALUES ('2c9025ab5b140c22015b140fbbd30000', null, '2017-03-28 16:37:07', '0', '2017-03-28 16:37:07', '', '换肤管理', '20', 'module', '/user/skin/list', null);
INSERT INTO `org_resource` VALUES ('2c92a7066774174a0167741a74e40000', null, '2018-12-03 20:45:50', '0', '2018-12-03 20:45:50', '', '复购规则', '19', 'page', '/traderule/list', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('402887d866f717ea0166f71fd6320000', null, '2018-11-09 14:19:10', '0', '2018-11-30 23:22:18', '', '商城收入', '12', 'page', '/shoptrade/list', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe166e90efe0166e915b3e60000', null, '2018-11-06 20:53:25', '0', '2018-11-08 10:40:52', '', '商城管理', '10', 'module', '', null);
INSERT INTO `org_resource` VALUES ('4028abe166e90efe0166e91ded670001', null, '2018-11-06 21:02:24', '0', '2018-11-08 10:41:18', '', '奖励规则', '16', 'page', '/shoprule/list', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe166edabdd0166edadb7590000', null, '2018-11-07 18:17:56', '0', '2018-11-08 10:41:03', '', '商城用户', '11', 'page', '/shopuser/list', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe166fb769e0166fb785dcc0000', null, '2018-11-10 10:34:21', '0', '2018-11-10 10:34:21', '', '商品管理', '13', 'page', '/shopproduct/list', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe16707d853016707dabd7b0000', null, '2018-11-12 20:17:15', '0', '2018-11-12 20:17:15', '', '健康值管理', '14', 'page', '/shopbilltrade/list', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe1672bd3dd01672bd790e40000', null, '2018-11-19 20:00:06', '0', '2018-11-19 20:00:06', '', '商城参数设置', '15', 'page', '/sysParam/list', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe1676535a80167653ffe3a0000', null, '2018-11-30 23:32:31', '0', '2018-11-30 23:34:12', '', '财务管理', '17', 'page', '/shoptrade/listf', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe1676535a801676542e3e10001', null, '2018-11-30 23:35:41', '0', '2018-11-30 23:35:41', '', '商城支出', '18', 'page', '/shoptrade/listo', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('4028abe167790ab701677910d6d30000', null, '2018-12-04 19:53:25', '0', '2018-12-04 21:00:45', '', '收支汇总', '1', 'page', '/shopuser/total', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_resource` VALUES ('70', null, '2016-08-17 17:06:19', '0', '2018-11-08 10:40:18', '', '权限管理', '70', 'module', '/user/list', null);
INSERT INTO `org_resource` VALUES ('71', null, '2016-09-07 15:15:58', '0', '2018-11-08 10:40:26', '', '用户列表', '71', 'page', '/user/list', '70');
INSERT INTO `org_resource` VALUES ('72', null, '2016-09-07 15:17:37', '0', '2018-11-08 10:40:33', '', '角色列表', '72', 'page', '/user/role_list', '70');
INSERT INTO `org_resource` VALUES ('73', null, '2016-09-18 16:34:14', '0', '2018-11-08 10:40:41', '', '菜单列表', '73', 'page', '/user/menu_list', '70');

-- ----------------------------
-- Table structure for `org_role`
-- ----------------------------
DROP TABLE IF EXISTS `org_role`;
CREATE TABLE `org_role` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `role_name` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_role
-- ----------------------------
INSERT INTO `org_role` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', null, '2017-02-24 16:11:40', '0', '2018-11-27 09:51:21', null, '可以看到商品交易记录', '仓库管理员', null, '', null);
INSERT INTO `org_role` VALUES ('402881e457f075530157f0791e2f0000', null, '2016-10-23 15:37:31', '0', '2017-02-24 16:11:20', null, '拥有所有的权限', '超级管理员', null, 'role_admin', null);

-- ----------------------------
-- Table structure for `org_role_resource_rel`
-- ----------------------------
DROP TABLE IF EXISTS `org_role_resource_rel`;
CREATE TABLE `org_role_resource_rel` (
  `role_id` varchar(32) NOT NULL,
  `resources_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`resources_id`),
  KEY `FK_hpsdqtxbypycwcdrw23na40bp` (`resources_id`),
  CONSTRAINT `FK_ew2x71wsjwd939pdgqdsvnnsd` FOREIGN KEY (`role_id`) REFERENCES `org_role` (`id`),
  CONSTRAINT `FK_hpsdqtxbypycwcdrw23na40bp` FOREIGN KEY (`resources_id`) REFERENCES `org_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_role_resource_rel
-- ----------------------------
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5ada5755015ada59461d0000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb36bac60002');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb37ccd50003');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5b140c22015b140fbbd30000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c92a7066774174a0167741a74e40000');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '402887d866f717ea0166f71fd6320000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '402887d866f717ea0166f71fd6320000');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe166e90efe0166e915b3e60000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe166e90efe0166e91ded670001');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe166edabdd0166edadb7590000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe166fb769e0166fb785dcc0000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe16707d853016707dabd7b0000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe1672bd3dd01672bd790e40000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe1676535a80167653ffe3a0000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe1676535a801676542e3e10001');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '4028abe167790ab701677910d6d30000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '70');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '71');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '72');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '73');

-- ----------------------------
-- Table structure for `org_user`
-- ----------------------------
DROP TABLE IF EXISTS `org_user`;
CREATE TABLE `org_user` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `current_skin` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_user
-- ----------------------------
INSERT INTO `org_user` VALUES ('2c92d39667510333016752ddcd870000', null, '2018-11-27 09:52:07', '0', '2018-11-27 09:52:07', null, '', '25D55AD283AA400AF464C76D713C07AD', '彭静', '1', 'KSYcangku', '0', null);
INSERT INTO `org_user` VALUES ('4028821e5b7a6947015b7a6ebacf0000', null, '2016-08-17 15:17:02', '0', '2018-08-24 16:49:12', null, '13798369750', 'E10ADC3949BA59ABBE56E057F20F883E', '超级管理员', '1', 'admin', '0', 'skin_blue');

-- ----------------------------
-- Table structure for `org_user_role_rel`
-- ----------------------------
DROP TABLE IF EXISTS `org_user_role_rel`;
CREATE TABLE `org_user_role_rel` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_ikyyd9vv4u7y3m3yqvqo1vwdd` (`role_id`),
  CONSTRAINT `FK_92837trmh851io1pb73qjakvf` FOREIGN KEY (`user_id`) REFERENCES `org_user` (`id`),
  CONSTRAINT `FK_ikyyd9vv4u7y3m3yqvqo1vwdd` FOREIGN KEY (`role_id`) REFERENCES `org_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_user_role_rel
-- ----------------------------
INSERT INTO `org_user_role_rel` VALUES ('2c92d39667510333016752ddcd870000', '2c9025ab5a6f2b85015a6f2cef950000');
INSERT INTO `org_user_role_rel` VALUES ('4028821e5b7a6947015b7a6ebacf0000', '402881e457f075530157f0791e2f0000');

-- ----------------------------
-- Table structure for `shop_bill_trade`
-- ----------------------------
DROP TABLE IF EXISTS `shop_bill_trade`;
CREATE TABLE `shop_bill_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '申请提现或转让用户id',
  `type` tinyint(1) NOT NULL COMMENT '操作类型"1、提现  2、转让 3.捐赠',
  `trade_phone` varchar(16) DEFAULT NULL COMMENT '受让人手机号',
  `count` int(8) NOT NULL COMMENT '提现或者转让个数',
  `trade_status` tinyint(1) DEFAULT NULL COMMENT '1、待审/2、完成（转让直接完成，提现需要后台审核，通过后减少健康链，增加余额）',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_bill_trade
-- ----------------------------
INSERT INTO `shop_bill_trade` VALUES ('1', '6', '1', null, '1', '1', '2018-11-28 17:37:31', null);
INSERT INTO `shop_bill_trade` VALUES ('2', '6', '1', null, '10', '1', '2018-11-28 20:17:38', null);

-- ----------------------------
-- Table structure for `shop_product`
-- ----------------------------
DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE `shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(128) NOT NULL COMMENT '商品名称',
  `pro_logo_img` varchar(64) NOT NULL COMMENT '商品logo图片',
  `introduction` varchar(256) DEFAULT NULL COMMENT '商品简介',
  `detail` longtext COMMENT '商品详情',
  `pro_count` varchar(8) DEFAULT NULL COMMENT '商品库存数量',
  `income_credits` varchar(8) DEFAULT '0' COMMENT '购买商品赠送积分',
  `vip_level` varchar(2) DEFAULT NULL COMMENT 'v1普通会员、v2个人vip、v3初级代理、v4高级代理、v5核心代理、v6运营中心、v7公司股东',
  `type` varchar(1) DEFAULT '2' COMMENT '商品类型：1.会员大礼包 2.平台产品 3.项目合作',
  `status` varchar(1) DEFAULT '1' COMMENT '1 上架 2下架',
  `consume_credits` varchar(8) DEFAULT '0' COMMENT '购买商品最高抵扣积分',
  `price1` varchar(8) DEFAULT NULL COMMENT '商品价格1(个人vip 初级代理的价格，会员大礼包直接使用价格1)',
  `price2` varchar(8) DEFAULT NULL COMMENT '商品价格2(高级代理、核心代理价格)',
  `price3` varchar(8) DEFAULT NULL COMMENT '商品价格3(运营中心、公司股东价格)',
  `picture1` varchar(64) DEFAULT NULL COMMENT '商品展示图片1',
  `picture2` varchar(64) DEFAULT NULL COMMENT '商品展示图片2',
  `picture3` varchar(64) DEFAULT NULL COMMENT '商品展示图片3',
  `picture4` varchar(64) DEFAULT NULL COMMENT '商品展示图片4',
  `picture5` varchar(64) DEFAULT NULL COMMENT '商品展示图片5',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `old_price` varchar(8) DEFAULT '0' COMMENT '原价格',
  `hot` tinyint(2) DEFAULT '2' COMMENT '热门（1爆款热门 2普通商品）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_product
-- ----------------------------
INSERT INTO `shop_product` VALUES ('1', '菌苷肽（30瓶装）', '/uploads/attach/3b883a1e-1d74-4849-b80e-8bb7d7771da2.jpg', '菌苷肽是一种结合现代生物技术与传统中医药配方原理，选用修复细胞、防癌抗癌和调高免疫力等功效强劲的纯天然生物原料，精致提取和浓缩功效成分，按各成分人体调养需求黄金比例科学组方研制而成的口服液。            ', '<p style=\"text-indent: 28px\"><span style=\"font-size: 19px;font-family: 微软雅黑, sans-serif;background: white\">产品配方</span><span style=\"font-size: 19px;font-family: 微软雅黑, sans-serif\">从修复受损细胞、激活免疫应答、防止正常细胞变异、改善细胞微环境等方面入手，全方位、多层次、多靶点发挥作用，从点到面，从局部到全身，全面调节免疫、改善恢复身体各器官功能，从而实现正常体魄的恢复。</span></p><p style=\"text-indent: 28px\"><span style=\"font-size: 19px;font-family: 微软雅黑, sans-serif;background: white\">菌苷肽是需要免疫调节的亚健康人群，手术、放化疗等治疗期、康复期调理的</span><span style=\"font-size: 19px;font-family: 微软雅黑, sans-serif;background: white\">肿瘤病人</span><span style=\"font-size: 19px;font-family: 微软雅黑, sans-serif;background: white\">、需要抗病毒抗感染和精神、食欲、睡眠、肠胃功能不佳等调理调节人群的首选调养珍品。</span></p><p><br/></p>', '997', '0', 'v1', '2', '1', '500', '2058', '2058', '2058', '', '', '', '', '', '2018-11-10 15:02:55', '', '0', '1');
INSERT INTO `shop_product` VALUES ('2', '个人VIP大礼包', '/uploads/attach/6ff6a035-45fb-4d12-890a-59f388de4b06.jpg', '        内含产品1套，赠送4000积分可用于商城商品抵扣~    ', '<p>商品描述详情，可能包含图片和文字等。后台添加详情，可以为文字图片</p>', '996', '4000', 'v2', '1', '1', '0', '4000', '4000', '4000', '', '', '', '', '', '2018-11-15 17:52:39', '', '0', '2');
INSERT INTO `shop_product` VALUES ('3', '初级代理大礼包', '/uploads/attach/46de5bf5-f055-4fce-8129-2d0e2d42dc11.jpg', '          内含产品3套，赠送10000积分可用于商城商品抵扣~  ', null, '998', '10000', 'v3', '1', '1', '0', '10000', '10000', '10000', '', '', '', '', '', '2018-11-10 15:02:55', '', '0', '2');
INSERT INTO `shop_product` VALUES ('4', '高级代理大礼包', '/uploads/attach/a48b6c0c-1b45-4678-ade6-cbeab7095eca.jpg', '           内含产品10套，赠送30000积分可用于商城商品抵扣~  ', null, '999', '30000', 'v4', '1', '1', '0', '30000', '30000', '30000', '', '', '', '', '', '2018-11-10 15:02:55', '', '0', '2');
INSERT INTO `shop_product` VALUES ('5', '核心代理大礼包', '/uploads/attach/0c025b6c-bfeb-4a5b-9edc-0e2f73c1ca4a.jpg', '         内含产品30套，赠送90000积分可用于商城商品抵扣~  ', null, '10000', '90000', 'v5', '1', '1', '0', '90000', '90000', '90000', '', '', '', '', '', '2018-11-10 15:02:55', '', '0', '2');
INSERT INTO `shop_product` VALUES ('6', '运营中心大礼包', '/uploads/attach/e6f5e0d4-f908-4c99-b3ea-4dc6d4720074.jpg', '         内含产品50套，赠送150000积分可用于商城商品抵扣~  ', null, '9999', '150000', 'v6', '1', '1', '0', '150000', '150000', '150000', '', '', '', '', '', '2018-11-10 15:02:55', '', '0', '2');
INSERT INTO `shop_product` VALUES ('7', '公司合伙人大礼包', '/uploads/attach/b23dd126-af13-4c3e-8813-13a8d9af76b7.jpg', '        内含产品100套，赠送300000积分可用于商城商品抵扣~  ', null, '7', '300000', 'v7', '1', '1', '0', '300000', '300000', '300000', '', '', '', '', '', '2018-11-10 15:02:55', '', '0', '2');
INSERT INTO `shop_product` VALUES ('8', '666', '/uploads/attach/c27cbf75-2bd9-4d22-a4a0-4df0d38e6bb2.jpg', '项目合作商品，后台管理添加     ', '<p>商品描述详情，可能包含图片和文字等。后台添加详情，可以为文字图片</p>', '100', '2', 'v1', '3', '1', '0', '188', '166', '155', '', '', '', '', '', null, '', '200', '1');

-- ----------------------------
-- Table structure for `shop_register_rule`
-- ----------------------------
DROP TABLE IF EXISTS `shop_register_rule`;
CREATE TABLE `shop_register_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vip_level` varchar(8) NOT NULL COMMENT '会员等级',
  `ztjkljhs` int(8) NOT NULL COMMENT '健康链激活数（直推）',
  `jtjkljhs` int(8) NOT NULL COMMENT '健康链激活数（间推）',
  `ztj` varchar(8) DEFAULT NULL COMMENT '直推奖',
  `jtj` varchar(8) DEFAULT NULL COMMENT '间推奖',
  `glj` varchar(8) DEFAULT NULL COMMENT '管理奖',
  `gufen` varchar(8) DEFAULT NULL COMMENT '股份',
  `bill` varchar(8) DEFAULT NULL COMMENT '健康链',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(20) DEFAULT NULL,
  `fugoufd` varchar(8) DEFAULT NULL COMMENT '会员购买产品返点',
  `fugouztfd` varchar(8) DEFAULT NULL COMMENT '邀请用户复购的直推返点',
  `fugoujtfd` varchar(8) DEFAULT NULL COMMENT '邀请复购用户的间推返点',
  `fenhong` varchar(8) DEFAULT NULL COMMENT '分红积分，用于每日平台分红',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_register_rule
-- ----------------------------
INSERT INTO `shop_register_rule` VALUES ('1', 'v2', '1', '1', '0.1', '0.05', '0', '0', '30', '2018-11-04 20:24:44', null, '2018-11-27 17:11:15', null, '0.08', '0.02', '0.01', '4000');
INSERT INTO `shop_register_rule` VALUES ('2', 'v3', '5', '1', '0.1', '0.05', '0', '0', '100', '2018-11-04 20:27:00', null, '2018-11-27 17:11:06', null, '0.12', '0.03', '0.02', '10000');
INSERT INTO `shop_register_rule` VALUES ('3', 'v4', '10', '2', '0.1', '0.05', '0.03', '0', '300', '2018-11-04 20:27:00', null, '2018-11-27 17:11:31', null, '0.15', '0.04', '0.03', '30000');
INSERT INTO `shop_register_rule` VALUES ('4', 'v5', '30', '5', '0.1', '0.1', '0.04', '0', '900', '2018-11-04 20:27:00', null, '2018-11-27 17:11:52', null, '0.18', '0.05', '0.04', '90000');
INSERT INTO `shop_register_rule` VALUES ('5', 'v6', '50', '10', '0.15', '0.1', '0.05', '0', '1500', '2018-11-04 20:27:00', null, '2018-11-27 17:12:09', null, '0.22', '0.06', '0.05', '150000');
INSERT INTO `shop_register_rule` VALUES ('6', 'v7', '100', '20', '0.15', '0.1', '0.08', '0.01', '3000', '2018-11-07 16:18:20', null, '2018-11-27 17:12:27', null, '0.25', '0.07', '0.06', '300000');
INSERT INTO `shop_register_rule` VALUES ('7', 'v1', '0', '0', '0.02', '0.01', '0', '0', '0', '2018-11-18 12:05:26', null, '2018-11-27 09:29:14', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `shop_sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `shop_sys_param`;
CREATE TABLE `shop_sys_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(12) NOT NULL COMMENT '系统参数编码',
  `sys_type` varchar(4) NOT NULL COMMENT '系统参数类型',
  `sys_value` varchar(24) NOT NULL COMMENT '参数值',
  `update_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `sys_desc` varchar(64) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shop_sys_param
-- ----------------------------
INSERT INTO `shop_sys_param` VALUES ('1', 'SY_CHENGBEN', '1', '5000000', '2018-11-28 16:47:42', '2018-11-19 20:07:04', '平台每日成本，用于平台分红计算');
INSERT INTO `shop_sys_param` VALUES ('2', 'SY_LIRUN', '1', '12000.00', '2018-12-01 01:00:00', '2018-11-22 23:23:46', '平台昨日利润，每日凌晨一点更新');
INSERT INTO `shop_sys_param` VALUES ('3', 'SY_FENBFB', '1', '0.1', '2018-11-24 18:44:24', '2018-11-22 23:37:57', '平台分红比例，每日平台分红使用，范围是小于1的数字');
INSERT INTO `shop_sys_param` VALUES ('4', 'SY_GUQUANBFB', '1', '0.01', '2018-11-24 18:44:51', '2018-11-22 23:43:55', '股权分红比例');
INSERT INTO `shop_sys_param` VALUES ('5', 'SYS_TIXIAN', '1', '200', '2018-11-24 18:43:07', '2018-11-23 13:39:18', '健康链提现兑换为余额比例');
INSERT INTO `shop_sys_param` VALUES ('6', 'SY_YUEBEN', '1', '15000', '2018-11-27 09:42:51', '2018-11-23 22:18:15', '月成本，股权分红使用');

-- ----------------------------
-- Table structure for `shop_trade`
-- ----------------------------
DROP TABLE IF EXISTS `shop_trade`;
CREATE TABLE `shop_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(32) NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '交易用户id',
  `type` tinyint(2) NOT NULL COMMENT '1.购买会员大礼包2.复购产品3.直推4.间推5.管理奖6.股份收益7.平台分红8.捐赠9购买返点10直推购买返点11间推购买返点12提现健康值13项目合作14提现余额15充值',
  `price` decimal(8,2) NOT NULL COMMENT '从用户角度考虑，付款是-，收益是+',
  `status` tinyint(2) DEFAULT '3' COMMENT '1.订单提交（待发货） 2.后台发货（已发货） 3.确认收货  购买商品流程',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `credits` int(8) NOT NULL COMMENT '使用积分总数',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_trade
-- ----------------------------
INSERT INTO `shop_trade` VALUES ('1', 'NO201811281411931317', '2', '1', '-4000.00', '3', null, '0', '2018-11-28 14:11:36', null, null);
INSERT INTO `shop_trade` VALUES ('2', 'NO2018112814136444', '3', '1', '-300000.00', '3', null, '0', '2018-11-28 14:13:55', null, null);
INSERT INTO `shop_trade` VALUES ('3', 'NO201811281415665192', '4', '1', '-300000.00', '3', null, '0', '2018-11-28 14:15:22', null, null);
INSERT INTO `shop_trade` VALUES ('4', 'NO201811281418953677', '5', '1', '-150000.00', '3', null, '0', '2018-11-28 14:18:24', null, null);
INSERT INTO `shop_trade` VALUES ('5', 'NO201811281426828139', '6', '1', '-10000.00', '3', null, '0', '2018-11-28 14:26:41', null, null);
INSERT INTO `shop_trade` VALUES ('6', 'NO20181128143184862', '7', '1', '-90000.00', '3', null, '0', '2018-11-28 14:31:44', null, null);
INSERT INTO `shop_trade` VALUES ('7', 'NO201811281440237488', '8', '1', '-300000.00', '3', null, '0', '2018-11-28 14:40:59', null, null);
INSERT INTO `shop_trade` VALUES ('8', 'NO201811281737730025', '6', '12', '200.00', '3', null, '0', '2018-11-28 17:37:31', null, null);
INSERT INTO `shop_trade` VALUES ('9', 'NO201811281908601405', '9', '1', '-10000.00', '3', null, '0', '2018-11-28 19:08:31', null, null);
INSERT INTO `shop_trade` VALUES ('10', 'NO201811281954182928', '8', '3', '1500.00', '3', null, '0', '2018-11-28 19:54:18', null, null);
INSERT INTO `shop_trade` VALUES ('11', 'NO201811281954415180', '8', '5', '800.00', '3', null, '0', '2018-11-28 19:54:18', null, null);
INSERT INTO `shop_trade` VALUES ('12', 'NO201811281954898665', '6', '4', '500.00', '3', null, '0', '2018-11-28 19:54:18', null, null);
INSERT INTO `shop_trade` VALUES ('13', 'NO201811281954163249', '6', '5', '300.00', '3', null, '0', '2018-11-28 19:54:18', null, null);
INSERT INTO `shop_trade` VALUES ('14', 'NO201811282017201913', '6', '12', '2000.00', '3', null, '0', '2018-11-28 20:17:38', null, null);
INSERT INTO `shop_trade` VALUES ('15', 'NO201811291413464652', '3', '2', '-1558.00', '3', null, '500', '2018-11-29 14:13:26', null, null);
INSERT INTO `shop_trade` VALUES ('16', 'NO201811291414725746', '3', '9', '489.56', '3', null, '0', '2018-11-29 14:14:00', null, null);
INSERT INTO `shop_trade` VALUES ('17', 'NO201811291414490209', '2', '10', '31.16', '3', null, '0', '2018-11-29 14:14:00', null, null);
INSERT INTO `shop_trade` VALUES ('18', 'NO201811291639476091', '3', '1', '-30000.00', '1', null, '0', '2018-11-29 16:39:11', null, null);
INSERT INTO `shop_trade` VALUES ('19', 'NO201811291639819989', '3', '1', '-30000.00', '1', null, '0', '2018-11-29 16:39:13', null, null);
INSERT INTO `shop_trade` VALUES ('20', 'NO201811291640660139', '3', '2', '-2056.00', '1', null, '0', '2018-11-29 16:40:04', null, null);
INSERT INTO `shop_trade` VALUES ('21', 'NO201811292216577590', '11', '1', '-30000.00', '3', null, '0', '2018-11-29 22:16:25', null, null);
INSERT INTO `shop_trade` VALUES ('22', 'NO201811301327907915', '8', '3', '4500.00', '3', null, '0', '2018-11-30 13:27:45', null, null);
INSERT INTO `shop_trade` VALUES ('23', 'NO201811301327736094', '8', '5', '2400.00', '3', null, '0', '2018-11-30 13:27:45', null, null);
INSERT INTO `shop_trade` VALUES ('24', 'NO201811301327286211', '6', '4', '1500.00', '3', null, '0', '2018-11-30 13:27:45', null, null);
INSERT INTO `shop_trade` VALUES ('25', 'NO201811301327440729', '6', '5', '900.00', '3', null, '0', '2018-11-30 13:27:45', null, null);
INSERT INTO `shop_trade` VALUES ('26', 'NO201811301807134931', '20', '1', '-4000.00', '3', null, '0', '2018-11-30 18:07:14', null, null);
INSERT INTO `shop_trade` VALUES ('27', 'NO20181130180835552', '15', '3', '400.00', '3', null, '0', '2018-11-30 18:08:05', null, null);
INSERT INTO `shop_trade` VALUES ('28', 'NO20181130180863379', '6', '4', '200.00', '3', null, '0', '2018-11-30 18:08:05', null, null);
INSERT INTO `shop_trade` VALUES ('29', 'NO201811301808806734', '6', '5', '120.00', '3', null, '0', '2018-11-30 18:08:05', null, null);
INSERT INTO `shop_trade` VALUES ('30', 'NO201811301850137139', '21', '1', '-4000.00', '3', 'nihao 你好 你好', '0', '2018-11-30 18:50:19', null, '2018-12-04 22:57:42');
INSERT INTO `shop_trade` VALUES ('31', 'NO201811301855990104', '7', '3', '400.00', '3', null, '0', '2018-11-30 18:55:30', null, null);
INSERT INTO `shop_trade` VALUES ('32', 'NO201811301855846745', '7', '5', '160.00', '3', null, '0', '2018-11-30 18:55:30', null, null);
INSERT INTO `shop_trade` VALUES ('33', 'NO201811301855178789', '6', '4', '200.00', '3', null, '0', '2018-11-30 18:55:30', null, null);
INSERT INTO `shop_trade` VALUES ('34', 'NO201811301855705246', '6', '5', '120.00', '3', null, '0', '2018-11-30 18:55:30', null, null);
INSERT INTO `shop_trade` VALUES ('35', 'NO201811301958416254', '22', '1', '-4000.00', '3', null, '0', '2018-11-30 19:58:49', null, null);
INSERT INTO `shop_trade` VALUES ('36', 'NO201811302250580961', '7', '3', '400.00', '3', null, '0', '2018-11-30 19:58:49', null, null);
INSERT INTO `shop_trade` VALUES ('37', 'NO201811302250794144', '7', '5', '160.00', '3', null, '0', '2018-11-30 19:58:49', null, null);
INSERT INTO `shop_trade` VALUES ('38', 'NO201811302250890282', '6', '4', '200.00', '3', null, '0', '2018-11-30 19:58:49', null, null);
INSERT INTO `shop_trade` VALUES ('39', 'NO201811302250429892', '6', '5', '120.00', '3', null, '0', '2018-11-30 19:58:49', null, null);
INSERT INTO `shop_trade` VALUES ('40', 'NO201812010130433279', '3', '6', '12546.14', '3', null, '0', '2018-12-01 01:30:00', null, null);
INSERT INTO `shop_trade` VALUES ('41', 'NO201812010130152048', '4', '6', '12546.14', '3', null, '0', '2018-12-01 01:30:00', null, null);
INSERT INTO `shop_trade` VALUES ('42', 'NO201812010130260402', '8', '6', '0.00', '3', null, '0', '2018-12-01 01:30:00', null, null);
INSERT INTO `shop_trade` VALUES ('43', 'NO20181201155168316', '15', '14', '-400.00', '1', null, '0', '2018-12-01 15:51:19', null, null);
INSERT INTO `shop_trade` VALUES ('44', 'NO201812031001390749', '25', '1', '-4000.00', '3', null, '0', '2018-12-03 10:01:56', null, '2018-12-03 23:09:38');
INSERT INTO `shop_trade` VALUES ('45', 'NO201812031721944384', '26', '1', '-4000.00', '3', null, '0', '2018-12-03 17:21:24', null, '2018-12-03 23:10:45');
INSERT INTO `shop_trade` VALUES ('46', 'NO201812032309130071', '6', '3', '400.00', '3', null, '0', '2018-12-03 23:09:39', null, null);
INSERT INTO `shop_trade` VALUES ('47', 'NO201812032309496635', '6', '5', '120.00', '3', null, '0', '2018-12-03 23:09:39', null, null);
INSERT INTO `shop_trade` VALUES ('48', 'NO201812032310944012', '7', '3', '400.00', '3', null, '0', '2018-12-03 23:10:46', null, null);
INSERT INTO `shop_trade` VALUES ('49', 'NO201812032310687824', '7', '5', '160.00', '3', null, '0', '2018-12-03 23:10:46', null, null);
INSERT INTO `shop_trade` VALUES ('50', 'NO201812032310764133', '6', '4', '200.00', '3', null, '0', '2018-12-03 23:10:46', null, null);
INSERT INTO `shop_trade` VALUES ('51', 'NO20181203231020742', '6', '5', '120.00', '3', null, '0', '2018-12-03 23:10:46', null, null);

-- ----------------------------
-- Table structure for `shop_trade_detail`
-- ----------------------------
DROP TABLE IF EXISTS `shop_trade_detail`;
CREATE TABLE `shop_trade_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) DEFAULT NULL COMMENT '订单表shop_trade主键id',
  `pro_id` int(11) DEFAULT NULL COMMENT '订单表shop_trade主键id',
  `count` tinyint(4) DEFAULT NULL COMMENT '商品个数',
  `price` decimal(8,2) DEFAULT NULL COMMENT '实际付款价格',
  `credits` int(11) DEFAULT NULL COMMENT '使用积分',
  `pro_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `pro_logo_img` varchar(64) DEFAULT NULL COMMENT '商品logo图片',
  PRIMARY KEY (`id`),
  KEY `pk_trade_id` (`trade_id`),
  CONSTRAINT `fk_trade_id` FOREIGN KEY (`trade_id`) REFERENCES `shop_trade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_trade_detail
-- ----------------------------
INSERT INTO `shop_trade_detail` VALUES ('1', '1', '2', '1', '4000.00', '0', '个人VIP大礼包', '/uploads/attach/6ff6a035-45fb-4d12-890a-59f388de4b06.jpg');
INSERT INTO `shop_trade_detail` VALUES ('2', '2', '7', '1', '300000.00', '0', '公司合伙人大礼包', '/uploads/attach/b23dd126-af13-4c3e-8813-13a8d9af76b7.jpg');
INSERT INTO `shop_trade_detail` VALUES ('3', '3', '7', '1', '300000.00', '0', '公司合伙人大礼包', '/uploads/attach/b23dd126-af13-4c3e-8813-13a8d9af76b7.jpg');
INSERT INTO `shop_trade_detail` VALUES ('4', '4', '6', '1', '150000.00', '0', '运营中心大礼包', '/uploads/attach/e6f5e0d4-f908-4c99-b3ea-4dc6d4720074.jpg');
INSERT INTO `shop_trade_detail` VALUES ('5', '5', '3', '1', '10000.00', '0', '初级代理大礼包', '/uploads/attach/46de5bf5-f055-4fce-8129-2d0e2d42dc11.jpg');
INSERT INTO `shop_trade_detail` VALUES ('6', '6', '5', '1', '90000.00', '0', '核心代理大礼包', '/uploads/attach/0c025b6c-bfeb-4a5b-9edc-0e2f73c1ca4a.jpg');
INSERT INTO `shop_trade_detail` VALUES ('7', '7', '7', '1', '300000.00', '0', '公司合伙人大礼包', '/uploads/attach/b23dd126-af13-4c3e-8813-13a8d9af76b7.jpg');
INSERT INTO `shop_trade_detail` VALUES ('8', '9', '3', '1', '10000.00', '0', '初级代理大礼包', '/uploads/attach/46de5bf5-f055-4fce-8129-2d0e2d42dc11.jpg');
INSERT INTO `shop_trade_detail` VALUES ('9', '15', '1', '1', '2058.00', '0', '菌苷肽（30瓶装）', '/uploads/attach/3b883a1e-1d74-4849-b80e-8bb7d7771da2.jpg');
INSERT INTO `shop_trade_detail` VALUES ('10', '18', '4', '1', '30000.00', '0', '高级代理大礼包', '/uploads/attach/a48b6c0c-1b45-4678-ade6-cbeab7095eca.jpg');
INSERT INTO `shop_trade_detail` VALUES ('11', '19', '4', '1', '30000.00', '0', '高级代理大礼包', '/uploads/attach/a48b6c0c-1b45-4678-ade6-cbeab7095eca.jpg');
INSERT INTO `shop_trade_detail` VALUES ('12', '20', '1', '1', '2056.00', '0', '菌苷肽（30瓶装）', '/uploads/attach/3b883a1e-1d74-4849-b80e-8bb7d7771da2.jpg');
INSERT INTO `shop_trade_detail` VALUES ('13', '21', '4', '1', '30000.00', '0', '高级代理大礼包', '/uploads/attach/a48b6c0c-1b45-4678-ade6-cbeab7095eca.jpg');
INSERT INTO `shop_trade_detail` VALUES ('14', '26', '2', '1', '4000.00', '0', '个人VIP大礼包', '/uploads/attach/6ff6a035-45fb-4d12-890a-59f388de4b06.jpg');
INSERT INTO `shop_trade_detail` VALUES ('15', '30', '2', '1', '4000.00', '0', '个人VIP大礼包', '/uploads/attach/6ff6a035-45fb-4d12-890a-59f388de4b06.jpg');
INSERT INTO `shop_trade_detail` VALUES ('16', '35', '2', '1', '4000.00', '0', '个人VIP大礼包', '/uploads/attach/6ff6a035-45fb-4d12-890a-59f388de4b06.jpg');
INSERT INTO `shop_trade_detail` VALUES ('17', '44', '2', '1', '4000.00', '0', '个人VIP大礼包', '/uploads/attach/6ff6a035-45fb-4d12-890a-59f388de4b06.jpg');
INSERT INTO `shop_trade_detail` VALUES ('18', '45', '2', '1', '4000.00', '0', '个人VIP大礼包', '59f388de4b06.jpg');

-- ----------------------------
-- Table structure for `shop_trade_rule`
-- ----------------------------
DROP TABLE IF EXISTS `shop_trade_rule`;
CREATE TABLE `shop_trade_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL COMMENT '订单表shop_trade主键id',
  `pro_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `vip_level` varchar(8) NOT NULL COMMENT '会员等级',
  `fugoufd` varchar(8) DEFAULT NULL COMMENT '会员购买产品返点',
  `fugouztfd` varchar(8) DEFAULT NULL COMMENT '邀请用户复购的直推返点',
  `fugoujtfd` varchar(8) DEFAULT NULL COMMENT '邀请复购用户的间推返点',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of shop_trade_rule
-- ----------------------------
INSERT INTO `shop_trade_rule` VALUES ('1', '1', null, 'v2', '0.08', '0.02', '0.01', '2018-11-18 12:05:26', '2018-12-03 22:34:28');
INSERT INTO `shop_trade_rule` VALUES ('2', '1', '菌苷肽（30瓶装）', 'v3', '0.12', '0.03', '0.02', '2018-11-07 16:18:20', null);
INSERT INTO `shop_trade_rule` VALUES ('3', '1', '菌苷肽（30瓶装）', 'v4', '0.15', '0.04', '0.03', '2018-11-04 20:27:00', null);
INSERT INTO `shop_trade_rule` VALUES ('4', '1', '菌苷肽（30瓶装）', 'v5', '0.18', '0.05', '0.04', '2018-11-04 20:27:00', null);
INSERT INTO `shop_trade_rule` VALUES ('5', '1', '菌苷肽（30瓶装）', 'v6', '0.22', '0.06', '0.05', '2018-11-04 20:27:00', null);
INSERT INTO `shop_trade_rule` VALUES ('6', '1', '菌苷肽（30瓶装）', 'v7', '0.25', '0.07', '0.06', '2018-11-04 20:27:00', null);
INSERT INTO `shop_trade_rule` VALUES ('7', '1', '菌苷肽（30瓶装）', 'v1', '0', '0', '0', '2018-11-04 20:24:44', null);

-- ----------------------------
-- Table structure for `shop_user`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL COMMENT '账户名',
  `phone` varchar(12) NOT NULL COMMENT '手机号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `ref_phone` varchar(20) DEFAULT NULL COMMENT '推荐人手机号',
  `vip_level` varchar(2) DEFAULT NULL COMMENT 'v1普通会员、v2个人vip、v3初级代理、v4高级代理、v5核心代理、v6运营中心、v7公司股东',
  `address` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1有效 2无效',
  `nick_name` varchar(48) DEFAULT NULL COMMENT '昵称',
  `jiaoyimima` varchar(32) DEFAULT NULL COMMENT '交易密码',
  PRIMARY KEY (`id`),
  KEY `idx_phone` (`phone`) USING BTREE,
  KEY `idx_ref_phone` (`ref_phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user
-- ----------------------------
INSERT INTO `shop_user` VALUES ('1', '丁清', '19979458414', 'E10ADC3949BA59ABBE56E057F20F883E', '13798369750', 'v1', '江西赣州于都', '2018-11-28 10:10:44', null, '2018-11-28 20:17:39', null, '1', null, 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `shop_user` VALUES ('2', '测试3', '13375088398', 'A5C06CE58D0EDF809E5DBA2E34BB9BE2', '', 'v2', '厦门杏林湾商务营运中心', '2018-11-28 10:14:23', null, '2018-11-28 14:10:16', null, '1', '', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `shop_user` VALUES ('3', '测试1', '15606098858', 'E10ADC3949BA59ABBE56E057F20F883E', '13375088398', 'v7', '集美区', '2018-11-28 10:16:58', null, '2018-11-29 14:13:05', null, '1', '', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `shop_user` VALUES ('4', '测试2', '13682327500', '25D55AD283AA400AF464C76D713C07AD', '15606098858', 'v7', '杏林湾', '2018-11-28 14:07:11', null, '2018-11-28 14:12:36', null, '1', '', 'C33367701511B4F6020EC61DED352059');
INSERT INTO `shop_user` VALUES ('5', '测试4', '15159010107', 'A5C06CE58D0EDF809E5DBA2E34BB9BE2', '13375088398', 'v1', '', '2018-11-28 14:15:51', null, '2018-11-28 14:19:52', null, '1', '测试4', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `shop_user` VALUES ('6', '李总', '15059010313', 'E1619760A3F4DE31FE0F613AB82A2229', '', 'v4', '', '2018-11-28 14:23:41', null, '2018-12-01 11:13:05', null, '1', '', 'E1619760A3F4DE31FE0F613AB82A2229');
INSERT INTO `shop_user` VALUES ('7', '邱银华', '15759083123', '9A66FB871B231D471F85945E7C5B9160', '15059010313', 'v5', '福建省三明市宁化县上进路304号', '2018-11-28 14:29:39', null, '2018-12-01 11:12:28', null, '1', '', '');
INSERT INTO `shop_user` VALUES ('8', '上官红', '13559537189', '2CAD9198BED07F4F0210471073B79DDF', '15059010313', 'v7', '', '2018-11-28 14:38:16', null, '2018-12-01 16:48:31', null, '1', '', 'FF89DB0F6D9A5B769B58048556A8358A');
INSERT INTO `shop_user` VALUES ('9', '黄惠萍', '13505021759', '760E16F1AA7C7684270B44A2E5D02E9F', '13559537189', 'v3', '重庆市南岸区南坪辅仁路8号康德国会山5-22-7', '2018-11-28 15:37:18', null, '2018-12-01 11:08:16', null, '1', '123456', '9CC4CEF2A8315050828F1FF8FBB284C6');
INSERT INTO `shop_user` VALUES ('10', '陈总', '15889688877', 'D96C9DA23A88D661E9E1147589338289', '15059010313', 'v2', '', '2018-11-29 09:31:14', null, '2018-12-01 11:07:02', null, '1', '', '');
INSERT INTO `shop_user` VALUES ('11', '刘晓梅', '13489422866', '2CCBCBDDA04B608923A7C7E39A613194', '13559537189', 'v4', '安溪县永安路148号', '2018-11-29 10:47:56', null, '2018-12-01 11:06:54', null, '1', '', '2CCBCBDDA04B608923A7C7E39A613194');
INSERT INTO `shop_user` VALUES ('12', '', '13798369750', 'E10ADC3949BA59ABBE56E057F20F883E', '13798369750', 'v1', '', '2018-11-29 11:12:23', null, '2018-11-29 11:28:14', null, '1', '', '');
INSERT INTO `shop_user` VALUES ('13', '木子李', '17605005494', 'E10ADC3949BA59ABBE56E057F20F883E', null, 'v1', '！', '2018-11-29 13:03:35', null, '2018-11-29 13:05:16', null, '1', null, null);
INSERT INTO `shop_user` VALUES ('14', null, '18259568666', 'E3B3B8B60E733A12C001D2215F1AED29', '13636967890', 'v1', null, '2018-11-29 13:35:24', null, '2018-11-29 13:40:21', null, '1', null, null);
INSERT INTO `shop_user` VALUES ('15', '陈家铭', '13806965557', 'F4A70B2B188684479ADC01917ADCA7A1', '15059010313', 'v2', '福建省厦门市园博苑杏林村菜鸟驿站38号', '2018-11-29 16:18:39', null, '2018-12-01 15:50:53', null, '1', '', 'FC08B210C8C68475B4143477B914753F');
INSERT INTO `shop_user` VALUES ('16', null, '13559513536', '96E79218965EB72C92A549DD5A330112', '15889688877', 'v1', null, '2018-11-29 22:25:42', null, null, null, '1', null, null);
INSERT INTO `shop_user` VALUES ('17', null, '13030999888', 'F4DA8985E42FF57C9C870414F06174F3', '13559537189', 'v1', null, '2018-11-30 08:57:36', null, null, null, '1', null, null);
INSERT INTO `shop_user` VALUES ('18', '陈勇强', '13599991010', 'AF6077B6BF16BEEBDFF786C93151A3B9', '15889688877', 'v1', '', '2018-11-30 09:34:58', null, '2018-11-30 09:40:56', null, '1', '', '');
INSERT INTO `shop_user` VALUES ('19', null, '15759880098', '04D569DF9F827486A466CB4720B06861', '13559537189', 'v1', null, '2018-11-30 15:11:09', null, null, null, '1', null, null);
INSERT INTO `shop_user` VALUES ('20', '祝馨怡', '15695928932', 'C05510B5B93CA945A7612B28850ED518', '13806965557', 'v2', '', '2018-11-30 18:00:03', null, '2018-12-01 11:06:08', null, '1', '', '06C7035A6248A670BDF1B3620D0B15B7');
INSERT INTO `shop_user` VALUES ('21', '张海平', '18750858859', 'A2E3D55EE09D3463106EB76A95F85574', '15759083123', 'v2', '福建省三明市宁化县翠江滨江一号10栋801', '2018-11-30 18:32:36', null, '2018-12-01 11:06:01', null, '1', '', 'A2E3D55EE09D3463106EB76A95F85574');
INSERT INTO `shop_user` VALUES ('22', '吴伟强', '17605053030', 'AF40606AB1EE7AE2D009FA8118942005', '15759083123', 'v2', '福建省三明市宁化县上进路304号', '2018-11-30 19:54:28', null, '2018-12-01 11:05:52', null, '1', '', 'AF40606AB1EE7AE2D009FA8118942005');
INSERT INTO `shop_user` VALUES ('23', null, '13489497311', '2CAD9198BED07F4F0210471073B79DDF', null, 'v1', null, '2018-12-01 16:59:29', null, null, null, '1', null, null);
INSERT INTO `shop_user` VALUES ('24', null, '18016701258', '05A3699379B0A4F50CC0BB28E888BA52', '13559537189', 'v1', null, '2018-12-02 20:09:07', null, null, null, '1', null, null);
INSERT INTO `shop_user` VALUES ('25', '陈萍', '15080563077', 'E10ADC3949BA59ABBE56E057F20F883E', '15059010313', 'v2', '东方花园二栋403', '2018-12-03 09:55:27', null, '2018-12-03 10:05:36', null, '1', '', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `shop_user` VALUES ('26', '邱恒明', '13799795339', 'E10ADC3949BA59ABBE56E057F20F883E', '15759083123', 'v2', '福建省三明市宁化县上进路304号', '2018-12-03 16:52:51', null, '2018-12-03 17:25:23', null, '1', '', 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for `shop_user_ext`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user_ext`;
CREATE TABLE `shop_user_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户表主键',
  `credits` varchar(20) DEFAULT '0' COMMENT '账户积分',
  `bill` varchar(8) DEFAULT '0' COMMENT '总健康链',
  `active_bill` varchar(8) DEFAULT '0' COMMENT '激活的健康链',
  `trade_bill` varchar(8) DEFAULT '0' COMMENT '转让获得的健康链',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额',
  `bank_deposit` varchar(48) DEFAULT NULL COMMENT '开户行',
  `bank_ower` varchar(24) DEFAULT NULL COMMENT '银行卡对应姓名',
  `bank_card` varchar(20) DEFAULT NULL COMMENT '银行卡号',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user_ext
-- ----------------------------
INSERT INTO `shop_user_ext` VALUES ('1', '1', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-28 10:10:45', null, '2018-11-28 20:17:39', null);
INSERT INTO `shop_user_ext` VALUES ('2', '2', '4000', '30', '0', '0', '31.16', null, null, null, '2018-11-28 10:14:23', null, '2018-11-28 14:10:16', null);
INSERT INTO `shop_user_ext` VALUES ('3', '3', '299500', '3000', '100', '0', '15987.64', null, null, null, '2018-11-28 10:16:58', null, '2018-12-01 01:30:00', null);
INSERT INTO `shop_user_ext` VALUES ('4', '4', '300000', '3000', '0', '0', '12546.14', null, null, null, '2018-11-28 14:07:11', null, '2018-12-01 01:30:00', null);
INSERT INTO `shop_user_ext` VALUES ('5', '5', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-28 14:15:51', null, '2018-11-28 14:19:52', null);
INSERT INTO `shop_user_ext` VALUES ('6', '6', '30000', '100', '127', '0', '47009.41', '', '', '', '2018-11-28 14:23:41', null, '2018-12-01 11:13:05', null);
INSERT INTO `shop_user_ext` VALUES ('7', '7', '90000', '900', '3', '0', '3468.16', '', '', '', '2018-11-28 14:29:39', null, '2018-12-01 11:12:28', null);
INSERT INTO `shop_user_ext` VALUES ('8', '8', '300000', '3000', '15', '0', '15293.89', '中国建设银行', '上官小红', '6217001830003600239', '2018-11-28 14:38:16', null, '2018-12-01 16:48:31', null);
INSERT INTO `shop_user_ext` VALUES ('9', '9', '10000', '100', '0', '0', '203.12', '', '', '', '2018-11-28 15:37:18', null, '2018-12-01 11:08:16', null);
INSERT INTO `shop_user_ext` VALUES ('10', '10', '4000', '30', '0', '0', '6.83', '', '', '', '2018-11-29 09:31:14', null, '2018-12-01 11:07:02', null);
INSERT INTO `shop_user_ext` VALUES ('11', '11', '30000', '300', '0', '0', '51.25', '', '', '', '2018-11-29 10:47:56', null, '2018-12-01 11:06:54', null);
INSERT INTO `shop_user_ext` VALUES ('12', '12', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-29 11:12:23', null, '2018-11-29 11:28:14', null);
INSERT INTO `shop_user_ext` VALUES ('13', '13', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-29 13:03:35', null, '2018-11-29 13:05:16', null);
INSERT INTO `shop_user_ext` VALUES ('14', '14', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-29 13:35:24', null, '2018-11-29 13:40:21', null);
INSERT INTO `shop_user_ext` VALUES ('15', '15', '4000', '30', '1', '0', '406.83', '中国建设银行', '陈家铭', '6217001930028543081', '2018-11-29 16:18:39', null, '2018-12-01 15:50:53', null);
INSERT INTO `shop_user_ext` VALUES ('16', '16', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-29 22:25:42', null, null, null);
INSERT INTO `shop_user_ext` VALUES ('17', '17', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-30 08:57:36', null, null, null);
INSERT INTO `shop_user_ext` VALUES ('18', '18', '0', '0', '0', '0', '10000.00', null, null, null, '2018-11-30 09:34:58', null, '2018-11-30 09:40:56', null);
INSERT INTO `shop_user_ext` VALUES ('19', '19', '0', '0', '0', '0', '0.00', null, null, null, '2018-11-30 15:11:09', null, null, null);
INSERT INTO `shop_user_ext` VALUES ('20', '20', '4000', '30', '0', '0', '6.83', '', '', '', '2018-11-30 18:00:03', null, '2018-12-01 11:06:08', null);
INSERT INTO `shop_user_ext` VALUES ('21', '21', '4000', '30', '0', '0', '6.83', '', '', '', '2018-11-30 18:32:36', null, '2018-12-01 11:06:01', null);
INSERT INTO `shop_user_ext` VALUES ('22', '22', '4000', '30', '0', '0', '6.83', '', '', '', '2018-11-30 19:54:28', null, '2018-12-01 11:05:52', null);
INSERT INTO `shop_user_ext` VALUES ('23', '23', '0', '0', '0', '0', '0.00', null, null, null, '2018-12-01 16:59:29', null, null, null);
INSERT INTO `shop_user_ext` VALUES ('24', '24', '0', '0', '0', '0', '0.00', null, null, null, '2018-12-02 20:09:07', null, null, null);
INSERT INTO `shop_user_ext` VALUES ('25', '25', '4000', '30', '0', '0', '0.00', '', '', '', '2018-12-03 09:55:27', null, '2018-12-03 10:05:36', null);
INSERT INTO `shop_user_ext` VALUES ('26', '26', '4000', '30', '0', '0', '0.00', '', '', '', '2018-12-03 16:52:51', null, '2018-12-03 17:25:23', null);

-- ----------------------------
-- Procedure structure for `proc_guquanfenhong`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_guquanfenhong`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_guquanfenhong`(in yesterday date)
BEGIN
-- 股权分红，只有股东有    股权分红=(营业额-手动输入的成本)*x%
    declare uuser_id int(11); -- 用户id
		declare ubalance decimal(10,2) DEFAULT 0; -- 用户余额
		declare total_yinli decimal(10,2) DEFAULT 0; -- 平台上个月盈利
		declare sys_yuechenben decimal(10,2) DEFAULT 0; -- 平台上个月成本
		declare sys_bili decimal(8,2) DEFAULT 0; -- 分红比例
		DECLARE done INT DEFAULT FALSE; -- 自定义控制游标循环变量,默认false  

		DECLARE My_Cursor CURSOR FOR ( SELECT t2.user_id,t2.balance FROM  shop_user t1 LEFT JOIN  shop_user_ext t2 on t1.id = t2.user_id LEFT JOIN shop_register_rule t3 on t1.vip_level=t3.vip_level where t1.vip_level='v7' ); -- 定义游标并输入结果集  
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- 绑定控制变量到游标,游标循环结束自动转true  

		-- 平台上个月盈利(营业额)
		select SUM(ABS(t.price)) into total_yinli from shop_trade t where  t.type in (1,2) and t.status=3 and  t.update_date >DATE_ADD(DATE_SUB(yesterday,INTERVAL 1 MONTH),INTERVAL 1 HOUR) and t.update_date <DATE_ADD(yesterday,INTERVAL 1 HOUR);

		-- 平台成本
		SELECT CONVERT(sys_value, DECIMAL(10,2)) into  sys_yuechenben  from shop_sys_param where sys_code='SY_YUEBEN';
		-- X%
		select CONVERT(gufen, DECIMAL(8,2)) into  sys_bili from shop_register_rule where vip_level='v7';
		

		OPEN My_Cursor; -- 打开游标  
			myLoop: LOOP -- 开始循环体,myLoop为自定义循环名,结束循环时用到  
			FETCH My_Cursor into uuser_id, ubalance; -- 将游标当前读取行的数据顺序赋予自定义变量12  
			IF done THEN -- 判断是否继续循环  
				LEAVE myLoop; -- 结束循环  
			END IF;  
    -- 修改账户余额  并插入到明细
			if (total_yinli-sys_yuechenben)>0 THEN
				update shop_user_ext set balance=balance+(total_yinli-sys_yuechenben)*sys_bili,update_date=NOW()  where user_id=uuser_id;
				insert into shop_trade (trade_no,user_id,type,price,status,credits,create_date) 
				VALUES (CONCAT('NO',DATE_FORMAT(NOW(),'%Y%m%d%H%i'), FLOOR(100000 + (RAND() * 900000))),
				uuser_id,6,(total_yinli-sys_yuechenben)*sys_bili,3,0,NOW());
		end if;
  
    COMMIT; -- 提交事务  
  END LOOP myLoop; -- 结束自定义循环体  
  CLOSE My_Cursor; -- 关闭游标  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `proc_pingtaifenhong`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_pingtaifenhong`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_pingtaifenhong`(in yesterday date)
BEGIN
    declare uuser_id int(11); -- 用户id
		declare ubalance decimal(10,2) DEFAULT 0; -- 用户余额
		declare ufenghong decimal(10,2) DEFAULT 0; -- 用户对应分红积分
		declare total_jifen decimal(18,2) DEFAULT 0; -- 积分总数
		declare total_yinli decimal(10,2) DEFAULT 0; -- 平台昨日盈利
		declare sys_chenben decimal(10,2) DEFAULT 0; -- 平台成本
		declare sys_bili decimal(8,2) DEFAULT 0; -- 分红比例
		DECLARE done INT DEFAULT FALSE; -- 自定义控制游标循环变量,默认false  

		DECLARE My_Cursor CURSOR FOR ( SELECT t2.user_id,t2.balance,CONVERT(t3.fenhong, DECIMAL(8,2)) FROM  shop_user t1 LEFT JOIN  shop_user_ext t2 on t1.id = t2.user_id LEFT JOIN shop_register_rule t3 on t1.vip_level=t3.vip_level ); -- 定义游标并输入结果集  
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- 绑定控制变量到游标,游标循环结束自动转true  
		-- 积分总数查找
		select SUM(t3.fenhong) into total_jifen   from shop_user t1  LEFT JOIN shop_register_rule t3 on t1.vip_level=t3.vip_level;
		-- 平台当天盈利(营业额)
		select SUM(ABS(t.price)) into total_yinli from shop_trade t where  t.type in (1,2) and t.status=3 and  t.update_date >DATE_ADD(DATE_SUB(yesterday,INTERVAL 1 DAY),INTERVAL 1 HOUR) and t.update_date <DATE_ADD(yesterday,INTERVAL 1 HOUR);

		-- 平台成本
		SELECT CONVERT(sys_value, DECIMAL(10,2)) into  sys_chenben  from shop_sys_param where sys_code='SY_CHENGBEN';
		-- X%
		select CONVERT(sys_value, DECIMAL(8,2)) into  sys_bili from shop_sys_param where sys_code='SY_FENBFB';
		--  凌晨一点更改昨日利润
		update shop_sys_param set sys_value=total_yinli,update_date=NOW() where sys_code='SY_LIRUN';
		OPEN My_Cursor; -- 打开游标  
			myLoop: LOOP -- 开始循环体,myLoop为自定义循环名,结束循环时用到  
			FETCH My_Cursor into uuser_id, ubalance,ufenghong; -- 将游标当前读取行的数据顺序赋予自定义变量12  
			IF done THEN -- 判断是否继续循环  
				LEAVE myLoop; -- 结束循环  
			END IF;  
    -- 修改账户余额  并插入到明细
			if (total_yinli-sys_chenben)*sys_bili/total_jifen*ufenghong >0 THEN
				update shop_user_ext set balance=balance+(total_yinli-sys_chenben)*sys_bili/total_jifen*ufenghong,update_date=NOW()  where user_id=uuser_id;
				insert into shop_trade (trade_no,user_id,type,price,status,credits,create_date) 
				VALUES (CONCAT('NO',DATE_FORMAT(NOW(),'%Y%m%d%H%i'), FLOOR(100000 + (RAND() * 900000))),
				uuser_id,7,(total_yinli-sys_chenben)*sys_bili/total_jifen*ufenghong,3,0,NOW());
		end if;
  
    COMMIT; -- 提交事务  
  END LOOP myLoop; -- 结束自定义循环体  
  CLOSE My_Cursor; -- 关闭游标  
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_gufen`
-- ----------------------------
DROP EVENT IF EXISTS `event_gufen`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_gufen` ON SCHEDULE EVERY 1 MONTH STARTS '2018-11-01 01:30:00' ON COMPLETION PRESERVE ENABLE DO call proc_guquanfenhong(CURDATE())
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `even_fenhong`
-- ----------------------------
DROP EVENT IF EXISTS `even_fenhong`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `even_fenhong` ON SCHEDULE EVERY 1 DAY STARTS '2018-11-23 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO call proc_pingtaifenhong(CURDATE())
;;
DELIMITER ;
