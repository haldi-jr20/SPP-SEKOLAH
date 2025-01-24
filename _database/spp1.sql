-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2025 at 09:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks_all`
--

CREATE TABLE `banks_all` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('general','wali','sekolah') NOT NULL,
  `kode_bank` varchar(50) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `nomor_rekening` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `banks_all`
--

INSERT INTO `banks_all` (`id`, `type`, `kode_bank`, `nama_bank`, `nama_pemilik`, `nomor_rekening`, `created_at`, `updated_at`) VALUES
(1, 'general', '002', 'BANK BRI', NULL, NULL, '2025-01-17 03:34:56', '2025-01-17 03:34:56'),
(2, 'general', '014', 'BANK BCA', NULL, NULL, '2025-01-17 03:34:56', '2025-01-17 03:34:56'),
(3, 'general', '008', 'BANK MANDIRI', NULL, NULL, '2025-01-17 03:34:56', '2025-01-17 03:34:56'),
(4, 'general', '028', 'BANK BNI', NULL, NULL, '2025-01-17 03:34:56', '2025-01-17 03:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` bigint UNSIGNED NOT NULL,
  `tagihan_id` bigint UNSIGNED NOT NULL,
  `wali_id` bigint UNSIGNED NOT NULL,
  `bank_sekolah_id` bigint UNSIGNED DEFAULT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `tanggal_konfirmasi` datetime DEFAULT NULL,
  `jumlah_dibayar` double NOT NULL,
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `val` text,
  `group` varchar(255) NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `group`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'SMA CERDAS BERIMAN', 'default', '2025-01-17 03:34:56', '2025-01-17 03:34:56'),
(2, 'app_email', 'info@info.com', 'default', '2025-01-17 03:34:56', '2025-01-17 03:34:56'),
(3, 'app_phone', '0254-3922222', 'default', '2025-01-17 03:34:56', '2025-01-17 03:34:56'),
(4, 'app_address', 'Jl. Raya Cilegon Banten', 'default', '2025-01-17 03:34:56', '2025-01-17 03:34:56'),
(5, 'app_pagination', '5', 'default', '2025-01-17 03:34:56', '2025-01-17 03:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint UNSIGNED NOT NULL,
  `wali_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nisn` varchar(255) NOT NULL,
  `jurusan` varchar(255) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `angkatan` int NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'aktif',
  `reason` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagihans`
--

CREATE TABLE `tagihans` (
  `id` bigint UNSIGNED NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `tanggal_tagihan` date NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `keterangan` text,
  `denda` double DEFAULT NULL,
  `status` enum('baru','angsur','lunas') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_details`
--

CREATE TABLE `tagihan_details` (
  `id` bigint UNSIGNED NOT NULL,
  `tagihan_id` bigint UNSIGNED NOT NULL,
  `nama_biaya` varchar(255) NOT NULL,
  `jumlah_biaya` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `akses` enum('wali','operator') NOT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `wali_bank_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `akses`, `nohp`, `email`, `password`, `wali_bank_id`, `created_at`, `updated_at`) VALUES
(1, 'Haldi Alwijais', 'operator', '081234534586', 'haldi@admin.com', '123456778', NULL, '2025-01-02 19:12:30', '2025-01-02 19:12:30'),
(3, 'HAFA TARMIZI', 'wali', '081786777666', 'hafa@gmail.com', 'hafa', NULL, '2025-08-02 19:13:20', '2025-01-02 19:14:02'),
(4, 'MIFTAH KURNIAWAN', 'wali', '081677766555', 'miftah@gmail.com', 'miftah', NULL, '2025-01-02 19:15:45', '2025-01-02 19:15:45'),
(5, 'DONI SETIAWAN', 'wali', '08678887777', 'doni@gmail.com', 'doni', NULL, '2025-01-02 19:16:23', '2025-01-02 19:16:23'),
(6, 'ZUNAENI', 'wali', '0812536363636', 'zunaeni@gmail.com', 'zunaeni', NULL, '2025-01-02 19:17:00', '2025-01-02 19:17:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks_all`
--
ALTER TABLE `banks_all`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagihan_id` (`tagihan_id`),
  ADD KEY `wali_id` (`wali_id`),
  ADD KEY `bank_sekolah_id` (`bank_sekolah_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wali_id` (`wali_id`);

--
-- Indexes for table `tagihans`
--
ALTER TABLE `tagihans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tagihan_details`
--
ALTER TABLE `tagihan_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagihan_id` (`tagihan_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wali_bank_id` (`wali_bank_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks_all`
--
ALTER TABLE `banks_all`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tagihans`
--
ALTER TABLE `tagihans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tagihan_details`
--
ALTER TABLE `tagihan_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD CONSTRAINT `pembayarans_ibfk_1` FOREIGN KEY (`tagihan_id`) REFERENCES `tagihans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayarans_ibfk_2` FOREIGN KEY (`wali_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayarans_ibfk_3` FOREIGN KEY (`bank_sekolah_id`) REFERENCES `banks_all` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `siswas`
--
ALTER TABLE `siswas`
  ADD CONSTRAINT `siswas_ibfk_1` FOREIGN KEY (`wali_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tagihans`
--
ALTER TABLE `tagihans`
  ADD CONSTRAINT `tagihans_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tagihans_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tagihan_details`
--
ALTER TABLE `tagihan_details`
  ADD CONSTRAINT `tagihan_details_ibfk_1` FOREIGN KEY (`tagihan_id`) REFERENCES `tagihans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`wali_bank_id`) REFERENCES `banks_all` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
