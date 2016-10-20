-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: booking_my_working
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL AUTO_INCREMENT,
  `nom_etudiant` varchar(25) NOT NULL,
  `prenom_etudiant` varchar(25) NOT NULL,
  `adresse_etudiant` varchar(255) NOT NULL,
  `cp_etudiant` varchar(25) NOT NULL,
  `ville_etudiant` varchar(50) NOT NULL,
  `pays_etudiant` varchar(25) NOT NULL,
  `datenaiss_etudiant` date NOT NULL,
  `mail_etudiant` varchar(100) NOT NULL,
  `mdp_etudiant` varchar(255) NOT NULL,
  `path_rqth` varchar(255) NOT NULL,
  PRIMARY KEY (`id_etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
INSERT INTO `etudiant` VALUES (1,'Tisserant','Mathias','123 avenue gorge de loup','69009','lyon','France','2010-06-06','mathias.tisserant@gmail.com','ramba2016','test'),(2,'test','test','test','59520','test','test','1992-06-06','test@gmail.com','ramba2016','tetete'),(3,'Diot','Benjamin','4 place du gouvernement','69005','Lyon','France','1995-07-07','diot@gmail.com','ramba2016','zuiebz');
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entreprise` (
  `id_entreprise` int(11) NOT NULL AUTO_INCREMENT,
  `site_entreprise` varchar(255) DEFAULT NULL,
  `siege_social_entreprise` varchar(255) NOT NULL,
  `raison_sociale_entreprise` varchar(50) DEFAULT NULL,
  `siret_entreprise` varchar(25) NOT NULL,
  `description_entreprise` longtext,
  `nb_salarie_entreprise` int(11) NOT NULL,
  `management_social_entreprise` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_entreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entreprise`
--

LOCK TABLES `entreprise` WRITE;
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
INSERT INTO `entreprise` VALUES (1,'total.com','Paris','Total','000000000','Grand groupe dans le secteur pétrollier',20000,1),(2,'edf.fr','Paris','EDF','000000001','Entreprise dans le secteur de l\'énergie',15000,0);
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `commente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commente` (
  `note_commentaire` int(11) NOT NULL,
  `contenu` varchar(250) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  PRIMARY KEY (`id_etudiant`,`id_entreprise`),
  KEY `FK_commente_id_entreprise` (`id_entreprise`),
  CONSTRAINT `FK_commente_id_entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`),
  CONSTRAINT `FK_commente_id_etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commente`
--

LOCK TABLES `commente` WRITE;
/*!40000 ALTER TABLE `commente` DISABLE KEYS */;
/*!40000 ALTER TABLE `commente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convention`
--

DROP TABLE IF EXISTS `convention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convention` (
  `id_convention` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut_convention` date NOT NULL,
  `date_fin_convention` date NOT NULL,
  `mission_convention` varchar(255) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  PRIMARY KEY (`id_convention`),
  KEY `FK_convention_id_etudiant` (`id_etudiant`),
  KEY `FK_convention_id_entreprise` (`id_entreprise`),
  CONSTRAINT `FK_convention_id_entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`),
  CONSTRAINT `FK_convention_id_etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convention`
--

LOCK TABLES `convention` WRITE;
/*!40000 ALTER TABLE `convention` DISABLE KEYS */;
/*!40000 ALTER TABLE `convention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv` (
  `id_cv` int(11) NOT NULL AUTO_INCREMENT,
  `titre_cv` varchar(25) NOT NULL,
  `path_cv` varchar(255) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_cv`),
  KEY `FK_cv_id_etudiant` (`id_etudiant`),
  CONSTRAINT `FK_cv_id_etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domaine` (
  `id_domaine` int(11) NOT NULL AUTO_INCREMENT,
  `nom_domaine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_domaine`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domaine`
--

LOCK TABLES `domaine` WRITE;
/*!40000 ALTER TABLE `domaine` DISABLE KEYS */;
INSERT INTO `domaine` VALUES (1,'Informatique'),(2,'commercial'),(3,'Graphisme'),(4,'RH');
/*!40000 ALTER TABLE `domaine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entreprise`
--



DROP TABLE IF EXISTS `maitrise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maitrise` (
  `id_etudiant` int(11) NOT NULL,
  `id_domaine` int(11) NOT NULL,
  PRIMARY KEY (`id_etudiant`,`id_domaine`),
  KEY `FK_maitrise_id_domaine` (`id_domaine`),
  CONSTRAINT `FK_maitrise_id_domaine` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`),
  CONSTRAINT `FK_maitrise_id_etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maitrise`
--

LOCK TABLES `maitrise` WRITE;
/*!40000 ALTER TABLE `maitrise` DISABLE KEYS */;
INSERT INTO `maitrise` VALUES (1,1),(2,3);
/*!40000 ALTER TABLE `maitrise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offre`
--

DROP TABLE IF EXISTS `offre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offre` (
  `id_offre` int(11) NOT NULL AUTO_INCREMENT,
  `date_publication_offre` date NOT NULL,
  `duree_offre` varchar(25) NOT NULL,
  `descriptif_offre` longtext NOT NULL,
  `titre_offre` varchar(255) NOT NULL,
  `localisation_offre` varchar(255) NOT NULL,
  `critere_offre` varchar(255) DEFAULT NULL,
  `prime_stage_offre` tinyint(1) NOT NULL,
  `montant_prime_offre` int(11) DEFAULT NULL,
  `id_domaine` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  PRIMARY KEY (`id_offre`),
  KEY `FK_offre_id_domaine` (`id_domaine`),
  KEY `FK_offre_id_entreprise` (`id_entreprise`),
  CONSTRAINT `FK_offre_id_domaine` FOREIGN KEY (`id_domaine`) REFERENCES `domaine` (`id_domaine`),
  CONSTRAINT `FK_offre_id_entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (1,'2016-10-19','3 mois','Nous recherchons un développeur php pour notre entreprise de lyon afin de mettre en place et déployer un nouveau site','Développeur php','Lyon','Bac+3',1,456,1,1),(2,'2016-10-20','5 mois','Nous recherchons pour notre pôle principale un(e) RH afin de palier à une augmentation d\'activité. Possibilité d\'évolution et d\'embauche ','Stage RH','Paris','Bac+5',1,500,3,2);
/*!40000 ALTER TABLE `offre` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `date_candidature` date NOT NULL,
  `id_offre` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_offre`,`id_etudiant`),
  KEY `FK_candidate_id_etudiant` (`id_etudiant`),
  CONSTRAINT `FK_candidate_id_etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  CONSTRAINT `FK_candidate_id_offre` FOREIGN KEY (`id_offre`) REFERENCES `offre` (`id_offre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;