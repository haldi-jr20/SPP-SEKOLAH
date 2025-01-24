-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2025 at 05:25 AM
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
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `sandi_bank` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `sandi_bank`, `nama_bank`) VALUES
(1, '002', 'BANK BRI'),
(2, '008', 'BANK MANDIRI'),
(3, '014', 'BANK BCA'),
(4, '009', 'BANK BNI');





-- --------------------------------------------------------

--
-- Table structure for table `bank_sekolahs`
--

CREATE TABLE `bank_sekolahs` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_sekolahs`
--

INSERT INTO `bank_sekolahs` (`id`, `kode`, `nama_bank`, `nama_rekening`, `nomor_rekening`, `created_at`, `updated_at`) VALUES
(3, '008', 'BANK BNI', 'SMA UNAMIN', '90878887776665', '2025-01-03 07:05:54', '2025-01-03 04:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `biayas`
--

CREATE TABLE `biayas` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `biayas`
--

INSERT INTO `biayas` (`id`, `parent_id`, `nama`, `jumlah`, `user_id`, `created_at`, `updated_at`) VALUES
(9, NULL, 'SPP', 500000, 1, '2023-08-07 07:09:52', '2023-08-07 07:09:52'),
(10, 9, 'Biaya Akademik', 300000, 1, '2023-08-07 07:10:13', '2023-08-07 07:10:13'),
(11, 9, 'Ekskul dan lain-lain', 200000, 1, '2023-08-07 07:10:34', '2023-08-07 07:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_00_000000_create_settings_table', 1),
(2, '2014_10_00_000001_add_group_column_on_settings_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2021_08_08_100000_create_banks_tables', 1),
(8, '2023_06_01_151751_create_siswas_table', 1),
(9, '2023_06_01_155116_add_foto_to_siswas_table', 1),
(10, '2023_06_09_193323_create_biayas_table', 1),
(11, '2023_06_10_213633_create_tagihans_table', 1),
(12, '2023_06_11_142008_create_tagihan_details_table', 1),
(13, '2023_06_11_165138_create_pembayarans_table', 1),
(14, '2023_06_12_161126_create_bank_sekolahs_table', 1),
(15, '2023_06_14_102111_create_wali_banks_table', 1),
(16, '2023_06_14_155515_add_wali_bank_id_and_sekolah_bank_id_to_pembayarans_table', 1),
(17, '2023_06_15_103134_create_notifications_table', 1),
(18, '2023_06_16_101535_add_tanggal_konfirmasi_to_pembayarans_table', 1),
(19, '2023_06_17_101642_drop_status_konfirmasi_to_pembayaran_table', 1),
(20, '2023_06_17_212037_add_parent_id_to_biayas_table', 1),
(21, '2023_06_17_225911_add_biaya_id_to_siswas_table', 1),
(22, '2023_06_17_234850_create_statuses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('062da0bf-a807-4be2-ae48-fa3c812531d4', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 6, '{\"tagihan_id\":9,\"title\":\"Tagihan SPP NAIZAR ZUNAENI\",\"messages\":\"Tagihan SPP Bulan September 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/9\"}', NULL, '2023-08-07 07:21:28', '2023-08-07 07:21:28'),
('1124c590-79cb-4130-9895-2a2af4071468', 'App\\Notifications\\PembayaranNotification', 'App\\Models\\User', 1, '{\"tagihan_id\":\"1\",\"wali_id\":2,\"pembayaran_id\":1,\"title\":\"Pembayaran Tagihan\",\"messages\":\"Hafa Tarmizi telah melakukan pembayaran tagihan.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/operator\\/pembayaran\\/1\"}', '2023-08-07 05:32:19', '2023-08-07 05:31:05', '2023-08-07 05:32:19'),
('12224db9-5bf7-48d6-8ffa-276f10ac813b', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 4, '{\"tagihan_id\":5,\"title\":\"Tagihan SPP HANUM PUTRI MIFTAH\",\"messages\":\"Tagihan SPP Bulan September 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/5\"}', NULL, '2023-08-07 07:18:30', '2023-08-07 07:18:30'),
('162b3b47-1b86-4352-a2ea-c64192c31a4e', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 5, '{\"tagihan_id\":12,\"title\":\"Tagihan SPP INDAH SARI\",\"messages\":\"Tagihan SPP Bulan Januari 2025\",\"url\":\"http:\\/\\/localhost\\/Aplikasi%20SPP%20Online\\/public\\/wali\\/tagihan\\/12\"}', NULL, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
('18a3b9d3-efaa-4f9d-bc8c-0f7cb7db07d2', 'App\\Notifications\\PembayaranKonfirmasiNotification', 'App\\Models\\User', 2, '{\"pembayaran_id\":1,\"title\":\"Konfirmasi Pembayaran\",\"messages\":\"Pembayran tagihan spp atas nama AGUNG TARMIZI telah dikonfirmasi.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/pembayaran\\/1\"}', NULL, '2023-08-07 05:32:33', '2023-08-07 05:32:33'),
('18ae2485-0cb2-42c6-be68-2778b9268a83', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 3, '{\"tagihan_id\":10,\"title\":\"Tagihan SPP AGUNG TARMIZI\",\"messages\":\"Tagihan SPP Bulan Januari 2025\",\"url\":\"http:\\/\\/localhost\\/Aplikasi%20SPP%20Online\\/public\\/wali\\/tagihan\\/10\"}', NULL, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
('32ab20f1-b91f-4efc-aae9-a967d8508672', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 3, '{\"tagihan_id\":2,\"title\":\"Tagihan SPP AGUNG TARMIZI\",\"messages\":\"Tagihan SPP Bulan Agustus 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/2\"}', NULL, '2023-08-07 07:12:37', '2023-08-07 07:12:37'),
('42042d71-95dd-4798-aeab-44e7adcde630', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 2, '{\"tagihan_id\":1,\"title\":\"Tagihan SPP AGUNG TARMIZI\",\"messages\":\"Tagihan SPP Bulan Agustus 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/1\"}', '2023-08-07 05:31:11', '2023-08-07 05:26:45', '2023-08-07 05:31:11'),
('4c968269-63eb-4a8a-bd94-c7c0212376d4', 'App\\Notifications\\PembayaranNotification', 'App\\Models\\User', 1, '{\"tagihan_id\":\"6\",\"wali_id\":5,\"pembayaran_id\":3,\"title\":\"Pembayaran Tagihan\",\"messages\":\"DONI SETIAWAN telah melakukan pembayaran tagihan.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/operator\\/pembayaran\\/3\"}', '2023-08-07 07:23:27', '2023-08-07 07:23:03', '2023-08-07 07:23:27'),
('64d25990-2b53-470c-9c5e-43e1bc0380ea', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 4, '{\"tagihan_id\":11,\"title\":\"Tagihan SPP HANUM PUTRI MIFTAH\",\"messages\":\"Tagihan SPP Bulan Januari 2025\",\"url\":\"http:\\/\\/localhost\\/Aplikasi%20SPP%20Online\\/public\\/wali\\/tagihan\\/11\"}', NULL, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
('65d2ce85-c635-4f28-9214-28dd94a80e5b', 'App\\Notifications\\PembayaranNotification', 'App\\Models\\User', 1, '{\"tagihan_id\":\"3\",\"wali_id\":3,\"pembayaran_id\":2,\"title\":\"Pembayaran Tagihan\",\"messages\":\"HAFA TARMIZI telah melakukan pembayaran tagihan.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/operator\\/pembayaran\\/2\"}', '2023-08-07 07:15:38', '2023-08-07 07:15:02', '2023-08-07 07:15:38'),
('6dfe70cd-aec7-4173-9119-b8ba15718806', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 5, '{\"tagihan_id\":8,\"title\":\"Tagihan SPP INDAH SARI\",\"messages\":\"Tagihan SPP Bulan September 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/8\"}', NULL, '2023-08-07 07:21:27', '2023-08-07 07:21:27'),
('8dcb7ca9-9fa8-474d-8c97-9025a97846ea', 'App\\Notifications\\PembayaranKonfirmasiNotification', 'App\\Models\\User', 3, '{\"pembayaran_id\":2,\"title\":\"Konfirmasi Pembayaran\",\"messages\":\"Pembayran tagihan spp atas nama AGUNG TARMIZI telah dikonfirmasi.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/pembayaran\\/2\"}', NULL, '2023-08-07 07:15:53', '2023-08-07 07:15:53'),
('90760265-5765-4140-82e9-2f031b0f22a5', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 5, '{\"tagihan_id\":6,\"title\":\"Tagihan SPP INDAH SARI\",\"messages\":\"Tagihan SPP Bulan Agustus 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/6\"}', NULL, '2023-08-07 07:20:59', '2023-08-07 07:20:59'),
('b3f33632-eed0-4fd2-9324-a97f0927f45b', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 4, '{\"tagihan_id\":4,\"title\":\"Tagihan SPP HANUM PUTRI MIFTAH\",\"messages\":\"Tagihan SPP Bulan Agustus 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/4\"}', NULL, '2023-08-07 07:18:03', '2023-08-07 07:18:03'),
('c54858bd-bf3d-49c2-af34-ce38d130aa77', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 6, '{\"tagihan_id\":13,\"title\":\"Tagihan SPP NAIZAR ZUNAENI\",\"messages\":\"Tagihan SPP Bulan Januari 2025\",\"url\":\"http:\\/\\/localhost\\/Aplikasi%20SPP%20Online\\/public\\/wali\\/tagihan\\/13\"}', NULL, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
('c974c3c0-291f-4173-bf58-ffd2e80bbdea', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 6, '{\"tagihan_id\":7,\"title\":\"Tagihan SPP NAIZAR ZUNAENI\",\"messages\":\"Tagihan SPP Bulan Agustus 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/7\"}', NULL, '2023-08-07 07:20:59', '2023-08-07 07:20:59'),
('cc82c291-8a37-40ca-bb49-2678ca995e64', 'App\\Notifications\\TagihanNotification', 'App\\Models\\User', 3, '{\"tagihan_id\":3,\"title\":\"Tagihan SPP AGUNG TARMIZI\",\"messages\":\"Tagihan SPP Bulan September 2023\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/tagihan\\/3\"}', '2023-08-07 07:14:23', '2023-08-07 07:13:14', '2023-08-07 07:14:23'),
('e7913dc4-f829-42fe-8517-532bb929a278', 'App\\Notifications\\PembayaranKonfirmasiNotification', 'App\\Models\\User', 5, '{\"pembayaran_id\":3,\"title\":\"Konfirmasi Pembayaran\",\"messages\":\"Pembayran tagihan spp atas nama INDAH SARI telah dikonfirmasi.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/wali\\/pembayaran\\/3\"}', NULL, '2023-08-07 07:23:35', '2023-08-07 07:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` bigint UNSIGNED NOT NULL,
  `bank_sekolah_id` bigint UNSIGNED DEFAULT NULL,
  `wali_bank_id` bigint UNSIGNED DEFAULT NULL,
  `tagihan_id` bigint UNSIGNED NOT NULL,
  `wali_id` bigint UNSIGNED NOT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `tanggal_konfirmasi` datetime DEFAULT NULL,
  `jumlah_dibayar` double NOT NULL,
  `bukti_bayar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metode_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayarans`
--

INSERT INTO `pembayarans` (`id`, `bank_sekolah_id`, `wali_bank_id`, `tagihan_id`, `wali_id`, `tanggal_bayar`, `tanggal_konfirmasi`, `jumlah_dibayar`, `bukti_bayar`, `metode_pembayaran`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 3, 3, '2023-08-07 00:00:00', '2023-08-07 14:15:53', 500000, 'public/qJoNTADNSvekOLiFIaPoxWtASX48Sv6O2Md9f1Io.jpg', 'transfer', 1, '2023-08-07 07:15:02', '2023-08-07 07:15:53'),
(3, 3, 3, 6, 5, '2023-08-07 00:00:00', '2023-08-07 14:23:35', 500000, 'public/xh7vmkqWNid98cA5BkzDeL42pehrmZg84tFNbQvJ.jpg', 'transfer', 1, '2023-08-07 07:23:02', '2023-08-07 07:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `val` text COLLATE utf8mb4_unicode_ci,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `group`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'SMA CERDAS BERIMAN', 'default', '2023-08-07 05:02:53', '2023-08-07 05:02:53'),
(2, 'app_email', 'info@info.com', 'default', '2023-08-07 05:02:54', '2023-08-07 05:02:54'),
(3, 'app_phone', '0254-3922222', 'default', '2023-08-07 05:02:54', '2023-08-07 05:02:54'),
(4, 'app_address', 'Jl. Raya Cilegon Banten', 'default', '2023-08-07 05:02:54', '2023-08-07 05:02:54'),
(5, 'app_pagination', '5', 'default', '2023-08-07 05:02:54', '2023-08-07 05:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint UNSIGNED NOT NULL,
  `wali_id` int DEFAULT NULL,
  `biaya_id` bigint UNSIGNED NOT NULL,
  `wali_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `wali_id`, `biaya_id`, `wali_status`, `nama`, `nisn`, `foto`, `jurusan`, `kelas`, `angkatan`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 3, 9, 'ok', 'AGUNG TARMIZI', '20231000001', 'public/3ru9GDVWlosEWWuo1MsQwXJFGGBVJuIM9lWO2DNZ.png', 'REGULER', '10', 2023, 1, '2025-01-03 04:30:09', '2025-01-03 04:30:09'),
(3, 4, 9, 'ok', 'HANUM PUTRI MIFTAH', '20231000002', 'public/J1OnduvkrJLC8Qw0GfbKASbRU1Of6NBxM3tanCkZ.png', 'REGULER', '10', 2023, 1, '2025-01-03 04:31:12', '2025-01-03 04:31:12'),
(4, 5, 9, 'ok', 'INDAH SARI', '202310000003', 'public/2IVt5zHwHGlykmTOf5Lc2siV2rVdDqyBuH6Fj1DU.png', 'REGULER', '10', 2023, 1, '2025-01-03 07:20:12', '2025-01-03 04:31:48'),
(5, 6, 9, 'ok', 'NAIZAR ZUNAENI', '202310000004', 'public/HtcsL9VyCMMUu7UYrgV60x6THHFnK4DXc80xPO4O.png', 'REGULER', '10', 2023, 1, '2025-01-03 04:32:16', '2025-01-03 04:32:16');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `reason`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 'aktif', NULL, 'App\\Models\\Siswa', 1, '2025-01-03 04:32:52', '2025-01-03 04:32:52'),
(2, 'aktif', NULL, 'App\\Models\\Siswa', 2, '2025-01-03 07:11:28', '2025-01-03 04:33:15'),
(3, 'aktif', NULL, 'App\\Models\\Siswa', 3, '2025-01-03 04:33:38', '2025-01-03 04:33:38'),
(4, 'aktif', NULL, 'App\\Models\\Siswa', 4, '2025-01-03 07:20:12', '2025-01-03 04:34:09'),
(5, 'aktif', NULL, 'App\\Models\\Siswa', 5, '2025-01-03 04:34:30', '2025-01-03 04:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `tagihans`
--

CREATE TABLE `tagihans` (
  `id` bigint UNSIGNED NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `angkatan` int DEFAULT NULL,
  `kelas` int DEFAULT NULL,
  `tanggal_tagihan` date NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denda` double DEFAULT NULL,
  `status` enum('baru','angsur','lunas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tagihans`
--

INSERT INTO `tagihans` (`id`, `siswa_id`, `user_id`, `angkatan`, `kelas`, `tanggal_tagihan`, `tanggal_jatuh_tempo`, `keterangan`, `denda`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'baru', '2025-01-03 07:12:35', '2025-01-03 07:12:35'),
(3, 2, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'lunas', '2025-01-03 07:13:14', '2025-01-03 07:15:54'),
(4, 3, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'baru', '2025-01-03 04:22:13', '2025-01-03 04:22:13'),
(5, 3, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'baru', '2025-01-03 04:25:26', '2025-01-03 04:25:26'),
(6, 4, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'lunas', '2025-01-03 04:26:42', '2025-01-03 04:26:42'),
(7, 5, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'baru', '2025-01-03 04:27:27', '2025-01-03 04:27:27'),
(8, 4, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'baru', '2025-01-03 04:28:09', '2025-01-03 04:28:09'),
(9, 5, 1, NULL, NULL, '2025-01-03', '2025-01-03', 'SPP', NULL, 'baru', '2025-01-03 04:28:56', '2025-01-03 04:28:56');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_details`
--

CREATE TABLE `tagihan_details` (
  `id` bigint UNSIGNED NOT NULL,
  `tagihan_id` bigint UNSIGNED NOT NULL,
  `nama_biaya` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_biaya` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tagihan_details`
--

INSERT INTO `tagihan_details` (`id`, `tagihan_id`, `nama_biaya`, `jumlah_biaya`, `created_at`, `updated_at`) VALUES
(2, 2, 'Biaya Akademik', 300000, '2023-08-07 07:12:37', '2023-08-07 07:12:37'),
(3, 2, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:12:37', '2023-08-07 07:12:37'),
(4, 3, 'Biaya Akademik', 300000, '2023-08-07 07:13:14', '2023-08-07 07:13:14'),
(5, 3, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:13:14', '2023-08-07 07:13:14'),
(6, 4, 'Biaya Akademik', 300000, '2023-08-07 07:18:03', '2023-08-07 07:18:03'),
(7, 4, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:18:03', '2023-08-07 07:18:03'),
(8, 5, 'Biaya Akademik', 300000, '2023-08-07 07:18:30', '2023-08-07 07:18:30'),
(9, 5, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:18:30', '2023-08-07 07:18:30'),
(10, 6, 'Biaya Akademik', 300000, '2023-08-07 07:20:59', '2023-08-07 07:20:59'),
(11, 6, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:20:59', '2023-08-07 07:20:59'),
(12, 7, 'Biaya Akademik', 300000, '2023-08-07 07:20:59', '2023-08-07 07:20:59'),
(13, 7, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:20:59', '2023-08-07 07:20:59'),
(14, 8, 'Biaya Akademik', 300000, '2023-08-07 07:21:28', '2023-08-07 07:21:28'),
(15, 8, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:21:28', '2023-08-07 07:21:28'),
(16, 9, 'Biaya Akademik', 300000, '2023-08-07 07:21:28', '2023-08-07 07:21:28'),
(17, 9, 'Ekskul dan lain-lain', 200000, '2023-08-07 07:21:28', '2023-08-07 07:21:28'),
(18, 10, 'Biaya Akademik', 300000, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
(19, 10, 'Ekskul dan lain-lain', 200000, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
(20, 11, 'Biaya Akademik', 300000, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
(21, 11, 'Ekskul dan lain-lain', 200000, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
(22, 12, 'Biaya Akademik', 300000, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
(23, 12, 'Ekskul dan lain-lain', 200000, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
(24, 13, 'Biaya Akademik', 300000, '2025-01-03 00:21:40', '2025-01-03 00:21:40'),
(25, 13, 'Ekskul dan lain-lain', 200000, '2025-01-03 00:21:40', '2025-01-03 00:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `akses` enum('wali','operator','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp_verified_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `akses`, `nohp`, `nohp_verified_at`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Haldi Alwijais', 'operator', '081234534586', NULL, 'haldi@admin.com', NULL, '$2y$10$ewVuhiFNH3H8pBeLPKkXtOqjS5rmgjb6Tq7guyFyk1B2m5dWYKc7i', NULL, '2025-01-03 04:12:30', '2025-01-03 04:12:30'),
(3, 'HAFA TARMIZI', 'wali', '081786777666', NULL, 'hafa@gmail.com', NULL, '$2y$10$7uQfuGx3oD5OaplW48Ihte8A2tY4eeJxOkGEEKoTthdUYIzKHgGJa', NULL, '2025-08-03 04:13:20', '2025-01-03 04:14:02'),
(4, 'MIFTAH KURNIAWAN', 'wali', '081677766555', NULL, 'miftah@gmail.com', NULL, '$2y$10$XF0334MIiQpS5uT5fvnGlOMDFLDdozT44XREYvAEDtOZ2GTzip3sC', NULL, '2025-01-03 04:15:45', '2025-01-03 04:15:45'),
(5, 'DONI SETIAWAN', 'wali', '08678887777', NULL, 'doni@gmail.com', NULL, '$2y$10$uOMShtVZc3IUspNgOEBtJev5TaGkSTkFoDsnucVNqqvEthPlxs4MS', NULL, '2025-01-03 04:16:23', '2025-01-03 04:16:23'),
(6, 'ZUNAENI', 'wali', '0812536363636', NULL, 'zunaeni@gmail.com', NULL, '$2y$10$jYhq3tBJ6QT3aDepz5LYleJhfate/nrx0cD9YPiQ53aNLCsiMmBZ2', NULL, '2025-01-03 04:17:00', '2025-01-03 04:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `wali_banks`
--

CREATE TABLE `wali_banks` (
  `id` bigint UNSIGNED NOT NULL,
  `wali_id` bigint UNSIGNED NOT NULL COMMENT 'wali_id adalah primary key di user_id',
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wali_banks`
--

INSERT INTO `wali_banks` (`id`, `wali_id`, `kode`, `nama_bank`, `nama_rekening`, `nomor_rekening`, `created_at`, `updated_at`) VALUES
(1, 2, '1', 'BANK BRI', 'HAFA TARMIZI', '2333331111', '2025-01-03 04:17:40', '2025-01-03 04:17:40'),
(2, 3, '014', 'BANK BCA', 'HAFA TARMIZI', '9022233', '2025-01-03 04:18:09', '2025-01-03 04:18:09'),
(3, 5, '028', 'BANK OCBC NISP', 'DONI SETIAWAN', '909393939', '2023-08-07 07:23:02', '2023-08-07 07:23:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_sekolahs`
--
ALTER TABLE `bank_sekolahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `biayas`
--
ALTER TABLE `biayas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayarans_tagihan_id_index` (`tagihan_id`),
  ADD KEY `pembayarans_wali_id_index` (`wali_id`),
  ADD KEY `pembayarans_user_id_index` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
  ADD UNIQUE KEY `siswas_nisn_unique` (`nisn`),
  ADD KEY `siswas_wali_id_index` (`wali_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `statuses_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `tagihans`
--
ALTER TABLE `tagihans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagihans_siswa_id_index` (`siswa_id`),
  ADD KEY `tagihans_user_id_index` (`user_id`);

--
-- Indexes for table `tagihan_details`
--
ALTER TABLE `tagihan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nohp_unique` (`nohp`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wali_banks`
--
ALTER TABLE `wali_banks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `bank_sekolahs`
--
ALTER TABLE `bank_sekolahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `biayas`
--
ALTER TABLE `biayas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tagihans`
--
ALTER TABLE `tagihans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tagihan_details`
--
ALTER TABLE `tagihan_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wali_banks`
--
ALTER TABLE `wali_banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
