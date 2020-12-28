-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 27 déc. 2020 à 23:31
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dwertydatabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id_address_address` int(11) NOT NULL,
  `ville_address` varchar(50) DEFAULT NULL,
  `quartier_address` varchar(50) DEFAULT NULL,
  `province_address` varchar(50) DEFAULT NULL,
  `rue_address` varchar(100) DEFAULT NULL,
  `postale_address` varchar(10) DEFAULT NULL,
  `proprietaire_cin_prop_proprietaire` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id_chambre_chambre` int(11) NOT NULL,
  `type_chambre_chambre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `CIN_client_client` varchar(30) NOT NULL,
  `nom_client_client` varchar(50) DEFAULT NULL,
  `prenom_client_client` varchar(50) DEFAULT NULL,
  `tele_client_client` varchar(10) DEFAULT NULL,
  `email_client_client` varchar(150) DEFAULT NULL,
  `password_client_client` varchar(150) DEFAULT NULL,
  `valide_email_client` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compose`
--

CREATE TABLE `compose` (
  `id_log_logement` int(11) NOT NULL,
  `id_chambre_chambre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `evaluer`
--

CREATE TABLE `evaluer` (
  `id_log_logement` int(11) NOT NULL,
  `CIN_client_client` varchar(30) NOT NULL,
  `etoiles_evaluer` int(11) DEFAULT NULL,
  `commentaire_evaluer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id_image_Image` int(11) NOT NULL,
  `url_img_Image` varchar(200) DEFAULT NULL,
  `legende_Image` varchar(200) DEFAULT NULL,
  `id_log_logement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

CREATE TABLE `lit` (
  `id_lit_lit` int(11) NOT NULL,
  `double_lit_lit` tinyint(1) DEFAULT NULL,
  `id_chambre_chambre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id_loca_location` int(11) NOT NULL,
  `date_deb_location` date DEFAULT NULL,
  `date_fin_location` date DEFAULT NULL,
  `CIN_client_client` varchar(30) DEFAULT NULL,
  `id_log_logement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `logement`
--

CREATE TABLE `logement` (
  `id_log_logement` int(11) NOT NULL,
  `titre_log_logement` varchar(150) DEFAULT NULL,
  `prix_log_logement` float DEFAULT NULL,
  `disponibilite_log_logement` tinyint(1) DEFAULT NULL,
  `is_hotel_logement` tinyint(1) DEFAULT NULL,
  `persone_capacite_logement` int(11) DEFAULT NULL,
  `descr_general_logement` varchar(500) DEFAULT NULL,
  `CIN_prop_proprietaire` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `CIN_prop_proprietaire` varchar(30) NOT NULL,
  `nom_prop_proprietaire` varchar(50) DEFAULT NULL,
  `prenom_prop_proprietaire` varchar(50) DEFAULT NULL,
  `tele_prop_proprietaire` varchar(20) DEFAULT NULL,
  `email_prop_proprietaire` varchar(150) DEFAULT NULL,
  `password_prop_proprietaire` varchar(150) DEFAULT NULL,
  `valide_email_proprietaire` tinyint(1) DEFAULT NULL,
  `imgId_prop_proprietaire` varchar(200) DEFAULT NULL,
  `address_id_address_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address_address`),
  ADD KEY `FK_address_proprietaire_cin_prop_proprietaire` (`proprietaire_cin_prop_proprietaire`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id_chambre_chambre`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CIN_client_client`);

--
-- Index pour la table `compose`
--
ALTER TABLE `compose`
  ADD PRIMARY KEY (`id_log_logement`,`id_chambre_chambre`),
  ADD KEY `FK_compose_id_chambre_chambre` (`id_chambre_chambre`);

--
-- Index pour la table `evaluer`
--
ALTER TABLE `evaluer`
  ADD PRIMARY KEY (`id_log_logement`,`CIN_client_client`),
  ADD KEY `FK_evaluer_CIN_client_client` (`CIN_client_client`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image_Image`),
  ADD KEY `FK_Image_id_log_logement` (`id_log_logement`);

--
-- Index pour la table `lit`
--
ALTER TABLE `lit`
  ADD PRIMARY KEY (`id_lit_lit`),
  ADD KEY `FK_lit_id_chambre_chambre` (`id_chambre_chambre`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_loca_location`),
  ADD KEY `FK_locatio_CIN_client_client` (`CIN_client_client`),
  ADD KEY `FK_location_id_log_logement` (`id_log_logement`);

--
-- Index pour la table `logement`
--
ALTER TABLE `logement`
  ADD PRIMARY KEY (`id_log_logement`),
  ADD KEY `FK_logement_CIN_prop_proprietaire` (`CIN_prop_proprietaire`);

--
-- Index pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`CIN_prop_proprietaire`),
  ADD KEY `FK_proprietaire_address_id_address_address` (`address_id_address_address`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id_address_address` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id_chambre_chambre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compose`
--
ALTER TABLE `compose`
  MODIFY `id_log_logement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evaluer`
--
ALTER TABLE `evaluer`
  MODIFY `id_log_logement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id_image_Image` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lit`
--
ALTER TABLE `lit`
  MODIFY `id_lit_lit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `id_loca_location` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `logement`
--
ALTER TABLE `logement`
  MODIFY `id_log_logement` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_address_proprietaire_cin_prop_proprietaire` FOREIGN KEY (`proprietaire_cin_prop_proprietaire`) REFERENCES `proprietaire` (`CIN_prop_proprietaire`);

--
-- Contraintes pour la table `compose`
--
ALTER TABLE `compose`
  ADD CONSTRAINT `FK_compose_id_chambre_chambre` FOREIGN KEY (`id_chambre_chambre`) REFERENCES `chambre` (`id_chambre_chambre`),
  ADD CONSTRAINT `FK_compose_id_log_logement` FOREIGN KEY (`id_log_logement`) REFERENCES `logement` (`id_log_logement`);

--
-- Contraintes pour la table `evaluer`
--
ALTER TABLE `evaluer`
  ADD CONSTRAINT `FK_evaluer_CIN_client_client` FOREIGN KEY (`CIN_client_client`) REFERENCES `client` (`CIN_client_client`),
  ADD CONSTRAINT `FK_evaluer_id_log_logement` FOREIGN KEY (`id_log_logement`) REFERENCES `logement` (`id_log_logement`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_Image_id_log_logement` FOREIGN KEY (`id_log_logement`) REFERENCES `logement` (`id_log_logement`);

--
-- Contraintes pour la table `lit`
--
ALTER TABLE `lit`
  ADD CONSTRAINT `FK_lit_id_chambre_chambre` FOREIGN KEY (`id_chambre_chambre`) REFERENCES `chambre` (`id_chambre_chambre`);

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `FK_locatio_CIN_client_client` FOREIGN KEY (`CIN_client_client`) REFERENCES `client` (`CIN_client_client`),
  ADD CONSTRAINT `FK_location_CIN_client_client` FOREIGN KEY (`CIN_client_client`) REFERENCES `client` (`CIN_client_client`),
  ADD CONSTRAINT `FK_location_id_log_logement` FOREIGN KEY (`id_log_logement`) REFERENCES `logement` (`id_log_logement`);

--
-- Contraintes pour la table `logement`
--
ALTER TABLE `logement`
  ADD CONSTRAINT `FK_logement_CIN_prop_proprietaire` FOREIGN KEY (`CIN_prop_proprietaire`) REFERENCES `proprietaire` (`CIN_prop_proprietaire`);

--
-- Contraintes pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD CONSTRAINT `FK_proprietaire_address_id_address_address` FOREIGN KEY (`address_id_address_address`) REFERENCES `address` (`id_address_address`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
