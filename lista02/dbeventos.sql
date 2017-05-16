/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.7.14 : Database - dbeventos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbeventos` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dbeventos`;

/*Table structure for table `evento` */

DROP TABLE IF EXISTS `evento`;

CREATE TABLE `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `descricao` text NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `ano` smallint(4) NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `evento` */

insert  into `evento`(`id`,`nome`,`descricao`,`inicio`,`fim`,`ano`,`ativo`) values 
(1,'ENCOSIS','Encontro Regional de Computação e Sistemas de Informação','2016-06-02 08:00:00','2016-06-04 17:00:00',2016,1),
(2,'COMPUTANDO','Competições Integradas de Computação','2016-10-03 18:00:00','2016-10-07 22:00:00',2016,1);

/*Table structure for table `inscricao_status` */

DROP TABLE IF EXISTS `inscricao_status`;

CREATE TABLE `inscricao_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `inscricao_status` */

insert  into `inscricao_status`(`id`,`nome`,`descricao`) values 
(1,'Registrada','Registrada'),
(2,'Aguardando Pagamento','Aguardando Pagamento'),
(3,'Pagamento Confirmado','Pagamento Confirmado'),
(4,'Cancelada','Cancelada');

/*Table structure for table `minicurso` */

DROP TABLE IF EXISTS `minicurso`;

CREATE TABLE `minicurso` (
  `id` int(10) unsigned NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `total_vagas` int(11) NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `instrutor_id` int(11) NOT NULL,
  `minicurso_status_id` int(11) NOT NULL,
  `minicurso_tipo_id` int(11) NOT NULL,
  `minicurso_turno_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_minicurso_participante1_idx` (`instrutor_id`),
  KEY `fk_minicurso_minicurso_status1_idx` (`minicurso_status_id`),
  KEY `fk_minicurso_minicurso_tipo1_idx` (`minicurso_tipo_id`),
  KEY `fk_minicurso_minicurso_turno1_idx` (`minicurso_turno_id`),
  CONSTRAINT `fk_minicurso_minicurso_status1` FOREIGN KEY (`minicurso_status_id`) REFERENCES `minicurso_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_minicurso_minicurso_tipo1` FOREIGN KEY (`minicurso_tipo_id`) REFERENCES `minicurso_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_minicurso_minicurso_turno1` FOREIGN KEY (`minicurso_turno_id`) REFERENCES `minicurso_turno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_minicurso_participante1` FOREIGN KEY (`instrutor_id`) REFERENCES `participante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `minicurso` */

insert  into `minicurso`(`id`,`titulo`,`descricao`,`data_cadastro`,`total_vagas`,`ativo`,`instrutor_id`,`minicurso_status_id`,`minicurso_tipo_id`,`minicurso_turno_id`) values 
(1,'Python','Python\r\n','2017-05-10 17:43:49',5,1,16,1,1,1),
(2,'PHP','PHP\r\n','2017-05-10 17:44:19',5,1,3,1,1,2),
(3,'Aprenda a ficar rico programando','Aprenda a ficar rico programando','2017-05-10 17:44:47',5,1,5,1,3,2),
(4,'Computação na nuvem','Computação na nuvem','2017-05-10 17:45:21',5,1,3,1,1,1),
(5,'Informática Básica','Informática Básica, para a comunidade em geral.','2017-05-10 17:45:59',5,1,7,1,2,3),
(6,'Android','Android','2017-05-10 17:46:40',5,1,4,1,1,3),
(7,'Javascript e outras coisas chibatas','Javascript e outras coisas chibatas','2017-05-10 17:47:23',5,1,16,1,1,3);

/*Table structure for table `minicurso_inscricao` */

DROP TABLE IF EXISTS `minicurso_inscricao`;

CREATE TABLE `minicurso_inscricao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `presenca_confirmada` tinyint(4) NOT NULL DEFAULT '0',
  `participante_id` int(11) NOT NULL,
  `minicurso_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_minicurso_inscricao_participante1_idx` (`participante_id`),
  KEY `fk_minicurso_inscricao_minicurso1_idx` (`minicurso_id`),
  CONSTRAINT `fk_minicurso_inscricao_minicurso1` FOREIGN KEY (`minicurso_id`) REFERENCES `minicurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_minicurso_inscricao_participante1` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `minicurso_inscricao` */

insert  into `minicurso_inscricao`(`id`,`data`,`presenca_confirmada`,`participante_id`,`minicurso_id`) values 
(1,'2017-05-10 18:00:44',0,1,1),
(2,'2017-05-10 18:00:53',0,1,2),
(3,'2017-05-10 18:01:00',0,1,3),
(4,'2017-05-17 18:01:08',0,2,1),
(5,'2017-05-11 18:01:15',0,2,2),
(6,'2017-05-10 18:01:26',0,2,3),
(7,'2017-05-10 18:01:33',0,2,4),
(8,'2017-05-10 18:01:42',0,3,5),
(9,'2017-05-10 18:01:48',0,4,6),
(10,'2017-05-11 18:01:55',0,4,7),
(11,'2017-05-10 18:02:00',0,5,7),
(12,'2017-05-10 18:02:09',0,6,7),
(13,'2017-05-10 18:02:14',0,7,7),
(14,'2017-05-10 18:02:25',0,8,1),
(16,'2017-05-10 18:02:28',0,9,6),
(17,'2017-05-10 18:02:39',0,9,5),
(18,'2017-05-10 18:02:44',0,15,5),
(19,'2017-05-10 18:02:51',0,15,6),
(20,'2017-05-10 18:02:59',0,13,5);

/*Table structure for table `minicurso_status` */

DROP TABLE IF EXISTS `minicurso_status`;

CREATE TABLE `minicurso_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `minicurso_status` */

insert  into `minicurso_status`(`id`,`nome`,`descricao`) values 
(1,'Ativo','Ativo'),
(2,'Cancelado','Cancelado'),
(3,'Inscrições Encerradas','Inscrições Encerradas'),
(4,'Aguardando Confirmação','Aguardando Confirmação');

/*Table structure for table `minicurso_tipo` */

DROP TABLE IF EXISTS `minicurso_tipo`;

CREATE TABLE `minicurso_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `minicurso_tipo` */

insert  into `minicurso_tipo`(`id`,`nome`,`descricao`) values 
(1,'Convencional','Convencional'),
(2,'Especial ','Minicurso oferecido em horário especial ou carga horária diferenciada'),
(3,'Gratuito','Minicursos Gratuitos');

/*Table structure for table `minicurso_turno` */

DROP TABLE IF EXISTS `minicurso_turno`;

CREATE TABLE `minicurso_turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL DEFAULT 'Manhã, Tarde, Noite',
  `descricao` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `minicurso_turno` */

insert  into `minicurso_turno`(`id`,`nome`,`descricao`) values 
(1,'Manhã','8h às 12h'),
(2,'Tarde','14h às 17h'),
(3,'Noite','18h às 22h');

/*Table structure for table `participante` */

DROP TABLE IF EXISTS `participante`;

CREATE TABLE `participante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `cidade` varchar(150) NOT NULL,
  `uf` char(2) NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `instituicao_representada` varchar(150) NOT NULL,
  `mini_cv` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `participante` */

insert  into `participante`(`id`,`nome`,`email`,`cpf`,`ativo`,`cidade`,`uf`,`sexo`,`telefone`,`data_cadastro`,`instituicao_representada`,`mini_cv`) values 
(1,'José Benevides','jbene@fake.com','332.757.345-04',1,'Manaus','AM','M','99999999999','2016-01-04 17:25:19','FUCAPI',NULL),
(2,'Mailson Correia','marilson@fake.com','573.523.787-07',1,'Manaus','AM','M','99999999999','2016-01-04 17:25:19','FUCAPI',NULL),
(3,'Alexandre Amoreira','amoreira@fake.com','117.258.524-54',1,'Acre','AC','M','99999999999','2017-05-03 17:28:07','AGILE MASTERS',NULL),
(4,'Senhor Pedroca','pedrocasenior@fake.com','511.616.972-33',1,'Ceará','CE','M','99999999999','2017-05-10 17:29:08','GRUPO PEDROCA',NULL),
(5,'Arlindo Souza','asouza@fake.com','284.876.814-25',1,'Manaus','AM','M','99999999999','2017-05-25 17:31:17','FUCAPI',NULL),
(6,'Pedro de Lara','plara@fake.com','513.131.668-55',1,'Manaus','AM','M','99999999999','2017-05-10 17:31:43','FACE BOOKS',NULL),
(7,'Capee Rotto','capets@fake.com','791.393.739-40',1,'Porto Velho','RO','M','99999999999','2016-01-04 17:25:19','HELLBOYS',NULL),
(8,'Carlos Drumond','cd@fake.com','235.307.832-00',1,'Manaus','AM','M','99999999999','2017-05-10 17:33:29','TI TECH',NULL),
(9,'Alberto Roberto','ar@fake.com','588.017.872-27',1,'Manaus','AM','M','99999999999','2017-05-10 17:34:14','TI TECH',NULL),
(10,'Juliana Samba','juju@fake.com','971.653.131-17',1,'Manaus','AM','F','99999999999','2017-05-10 17:34:40','TI TECH',NULL),
(11,'Amaro Barroso','barroso@fake.com','313.363.442-96',1,'Manuas','AM','M','99999999999','2016-01-04 17:25:19','TI TECH',NULL),
(12,'Larissa Costa','larika@fake.com','684.025.728-20',1,'Manausa','AM','F','88888888888','2017-02-10 17:35:51','LARIKA TOTAL',NULL),
(13,'Albertina Moraes','tina@fake.com','529.545.669-22',1,'Manaus','AM','F','99999999999','2017-05-10 17:36:25','LARIKA TOTAL',NULL),
(14,'Cláudia Costa','costac@fake.com','418.573.010-13',1,'Manaus','AM','F','99999999999','2016-01-04 17:25:19','FACE BOOKS',NULL),
(15,'Alexandra Karian','ak@fake.com','114.974.221-67',1,'Manaus','AM','F','99999999999','2017-05-10 17:37:26','FACE BOOKS',NULL),
(16,'Pablo Castro','pc@fake.com','000.000.000-00',1,'Cuba','NA','M','99999999999','2017-04-10 17:39:18','LOS CABRAS BUENOS',NULL);

/*Table structure for table `participante_inscricao` */

DROP TABLE IF EXISTS `participante_inscricao`;

CREATE TABLE `participante_inscricao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `data` datetime NOT NULL,
  `atualizacao` datetime DEFAULT NULL,
  `observacoes` text,
  `cortesia` tinyint(4) NOT NULL DEFAULT '0',
  `presenca_confirmada` tinyint(4) NOT NULL DEFAULT '0',
  `inscricao_status_id` int(11) NOT NULL,
  `tipo_inscricao_id` int(11) NOT NULL,
  `participante_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participante_inscricao_inscricao_status1_idx` (`inscricao_status_id`),
  KEY `fk_participante_inscricao_tipo_inscricao1_idx` (`tipo_inscricao_id`),
  KEY `fk_participante_inscricao_participante1_idx` (`participante_id`),
  CONSTRAINT `fk_participante_inscricao_inscricao_status1` FOREIGN KEY (`inscricao_status_id`) REFERENCES `inscricao_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participante_inscricao_participante1` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participante_inscricao_tipo_inscricao1` FOREIGN KEY (`tipo_inscricao_id`) REFERENCES `tipo_inscricao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `participante_inscricao` */

insert  into `participante_inscricao`(`id`,`codigo`,`data`,`atualizacao`,`observacoes`,`cortesia`,`presenca_confirmada`,`inscricao_status_id`,`tipo_inscricao_id`,`participante_id`) values 
(1,'1','2017-05-10 17:52:51',NULL,NULL,0,0,1,1,1),
(2,'2','2017-04-03 17:53:16',NULL,NULL,0,0,2,1,2),
(3,'3','2017-05-17 17:53:44',NULL,NULL,0,0,3,2,3),
(4,'4','2017-03-07 17:54:09',NULL,NULL,0,0,3,2,4),
(5,'5','2017-05-10 17:54:38',NULL,NULL,0,0,3,2,5),
(6,'6','2017-05-10 17:54:38',NULL,NULL,0,0,3,2,6),
(7,'7','2017-05-10 17:54:38',NULL,NULL,0,0,1,1,7),
(8,'8','2017-05-10 17:54:38',NULL,NULL,0,0,3,5,8),
(10,'9','2017-05-10 17:54:38',NULL,NULL,0,0,2,6,9),
(11,'10','2017-05-10 17:54:38',NULL,NULL,0,0,3,6,10),
(12,'11','2017-05-10 17:54:38',NULL,NULL,0,0,1,4,11),
(13,'12','2017-05-10 17:54:38',NULL,NULL,0,0,3,4,12),
(14,'13','2017-05-10 17:54:38',NULL,NULL,0,0,1,2,13),
(15,'14','2017-05-10 17:54:38',NULL,NULL,0,0,3,2,14),
(16,'15','2017-05-10 17:54:38',NULL,NULL,0,0,3,2,15),
(17,'16','2017-05-10 17:54:38',NULL,NULL,0,0,3,2,16),
(20,'17','2017-05-10 17:54:38',NULL,NULL,0,0,3,6,2),
(21,'18','2017-05-10 17:54:38',NULL,NULL,0,0,3,4,4);

/*Table structure for table `tipo_inscricao` */

DROP TABLE IF EXISTS `tipo_inscricao`;

CREATE TABLE `tipo_inscricao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `valor` float NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT '1',
  `evento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_inscricao_evento_idx` (`evento_id`),
  CONSTRAINT `fk_tipo_inscricao_evento` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tipo_inscricao` */

insert  into `tipo_inscricao`(`id`,`titulo`,`descricao`,`valor`,`ativo`,`evento_id`) values 
(1,'Estudante ','Estudante ',25,1,1),
(2,'Profissional','Profissional',50,1,1),
(3,'Associados','Associados',50,1,2),
(4,'Estudantes','Estudantes',25,1,2),
(5,'Pesquisadores','Pesquisadores',70,1,2),
(6,'Imprensa','Imprensa',10,1,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
