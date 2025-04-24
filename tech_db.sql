-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 24 avr. 2025 à 21:06
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tech_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250423202843', '2025-04-23 20:29:15', 20);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Smartphone Samsung Galaxy S23', 'Smartphone haut de gamme avec écran AMOLED 6.1 pouces, 8 Go de RAM, 128 Go de stockage', 999.99, 'https://maalejaudio.tn/14648-large_default/smartphone-samsung-s23-8go256go.jpg'),
(2, 'Apple MacBook Air M2', 'Ordinateur portable léger avec puce M2, 8 Go de RAM, 256 Go de stockage SSD', 1299.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdJGoR6YSERp6d0v1nWKSzsob2JFMxg50KcQ&s'),
(3, 'Sony WH-1000XM5', 'Casque audio sans fil à réduction de bruit, 30 heures d’autonomie', 349.99, 'https://d1ncau8tqf99kp.cloudfront.net/converted/103364_original_local_1200x1050_v3_converted.webp'),
(4, 'iPad Pro 11\" 2023', 'Tablette puissante avec puce M2, 8 Go de RAM, écran Liquid Retina', 799.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRICN8mem_gSsL_NSKIJikFgWYp7G9fbeBYvg&s'),
(5, 'Apple Watch Series 8', 'Montre connectée avec suivi de la santé, GPS, et notifications', 399.99, 'https://www.scoop.com.tn/41253-large_default/montre-connectee-apple-watch-serie-8-gps-45mm-aluminium-midnight-sport-band.jpg'),
(6, 'Google Nest Thermostat', 'Thermostat intelligent, commande vocale via Google Assistant', 129.99, 'https://m.media-amazon.com/images/I/71ng+LtYZvL._AC_SL1500_.jpg'),
(7, 'Xbox Series X', 'Console de jeu nouvelle génération avec 1 To de stockage et ray tracing', 499.99, 'https://gameszone.tn/490-large_default/xbox-series-x-1tb-console-de-jeux-tunisie.jpg'),
(8, 'PlayStation 5', 'Console de jeu de Sony avec un SSD ultra-rapide et une manette DualSense', 499.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR918byrXJ6xXgAV8TntS-rr-lyIOjdcAyxQw&s'),
(9, 'Nvidia GeForce RTX 4080', 'Carte graphique pour gaming 4K et VR avec 16 Go de mémoire vidéo', 1199.99, 'https://www.ubuy.tn/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNzFtOUZKQ3ViWEwuX0FDX1NMMTUwMF8uanBn.jpg'),
(10, 'Canon EOS R5', 'Appareil photo hybride plein format avec 45 MP et vidéo 8K', 3899.99, 'https://hollywood.tn/wp-content/uploads/2022/05/0c2a146b-eos-r5__1200_630__overflow.jpeg'),
(11, 'Dyson V15 Detect', 'Aspirateur sans fil avec détection de poussière laser et autonomie de 60 minutes', 699.99, 'https://dysontunisie.tn/wp-content/uploads/2022/08/Aspirateur-Dyson-V15-Detect-Absolute-1.jpg'),
(12, 'Amazon Echo Show 10', 'Écran intelligent avec Alexa, caméra et son premium', 249.99, 'https://softechtunisie.tn/2219-medium_default/assistant-vocal-amazon-echo-show-10-blanc.jpg'),
(13, 'Oculus Quest 2', 'Casque de réalité virtuelle autonome avec écran 1832 x 1920, 6 Go de RAM', 299.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA8k6-xv9bfL4zRYTVfgoDjrIDiJpToK01EQ&s'),
(14, 'GoPro HERO11 Black', 'Caméra d’action étanche avec vidéo 5.3K et 23 MP de photo', 499.99, 'https://softechtunisie.tn/686-large_default/camera-sport-gopro-hero11-black-creator-edition.jpg'),
(15, 'Samsung 65\" Neo QLED TV', 'Télévision 4K avec écran Quantum Matrix et son Dolby Atmos', 1999.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3DjGkWICL-uNB3WFEfQ9Y0tC8X-5FsHBY-A&s'),
(16, 'Logitech MX Master 3', 'Souris sans fil avec molette de défilement et 7 boutons personnalisables', 99.99, 'https://www.tunisianet.com.tn/237963-large/souris-sans-fil-logitech-mx-master-3-graphite.jpg'),
(17, 'Dell UltraSharp U2720Q', 'Moniteur 4K de 27 pouces avec couleurs précises et connectivité USB-C', 549.99, 'https://m.media-amazon.com/images/I/810ocpczsiL._AC_SL1500_.jpg'),
(18, 'Razer Blade 15', 'Ordinateur portable de gaming avec processeur Intel i7, 16 Go de RAM, 512 Go SSD', 1799.99, 'https://images-cdn.ubuy.co.in/64172d9d324369741f162fbd-razer-blade-15-gaming-laptop-nvidia.jpg'),
(19, 'Bose QuietComfort 45', 'Casque Bluetooth avec réduction de bruit active et autonomie de 24 heures', 329.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScyK-hvZ2mil7BPwhGUTTk0uRN6FuWe8TgMA&s'),
(20, 'JBL Charge 5', 'Enceinte Bluetooth portable avec 20 heures d’autonomie et étanchéité IP67', 179.99, 'https://tunisiatech.tn/9841-large_default/enceinte-jbl-charge-5.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roles`) VALUES
(1, 'ghofranmejaouel@gmail.com', '$2y$13$9Wj1Qj855GvqaVvg1VsteezUzuTQuYiZPMzmobzyMsQTDoWlC9T2m', '[]'),
(2, 'aa@gmail.com', '$2y$13$YZufXmWEO1BkLtvlsTYNhOT9ZMtHnpXd.PyDQ4gBwjbbvzNEg4YNy', '[]');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
