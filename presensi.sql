-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2025 at 09:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `kode_cabang` char(3) NOT NULL,
  `nama_cabang` varchar(50) NOT NULL,
  `lokasi_cabang` varchar(255) NOT NULL,
  `radius_cabang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`kode_cabang`, `nama_cabang`, `lokasi_cabang`, `radius_cabang`) VALUES
('CPG', 'CEPOGO', '77', 77),
('MGU', 'MANGU', '-7.5072599,110.7401767', 5000),
('PST', 'PUSAT', '-7.5417965,110.5923654', 700),
('SMO', 'SIMO', '77', 77);

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `kode_dept` char(3) NOT NULL,
  `nama_dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`kode_dept`, `nama_dept`) VALUES
('HRD', 'Human Resource Development '),
('IT', 'Information Technology'),
('KEU', 'Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harilibur`
--

CREATE TABLE `harilibur` (
  `kode_libur` char(7) NOT NULL,
  `tanggal_libur` date NOT NULL,
  `kode_cabang` char(3) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `harilibur`
--

INSERT INTO `harilibur` (`kode_libur`, `tanggal_libur`, `kode_cabang`, `keterangan`) VALUES
('LB24002', '2024-02-14', 'BDG', 'Pemilu 2024'),
('LB24003', '2024-02-21', 'BDG', 'Cuti Bersama');

-- --------------------------------------------------------

--
-- Table structure for table `harilibur_detail`
--

CREATE TABLE `harilibur_detail` (
  `kode_libur` char(7) DEFAULT NULL,
  `nik` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `harilibur_detail`
--

INSERT INTO `harilibur_detail` (`kode_libur`, `nik`) VALUES
('LB24002', '3636'),
('LB24002', '22-01'),
('LB24002', '99-99'),
('LB24002', '12349'),
('LB24003', '12345'),
('LB24003', '3636');

-- --------------------------------------------------------

--
-- Table structure for table `jam_kerja`
--

CREATE TABLE `jam_kerja` (
  `kode_jam_kerja` char(4) NOT NULL,
  `nama_jam_kerja` varchar(15) NOT NULL,
  `awal_jam_masuk` time NOT NULL,
  `jam_masuk` time NOT NULL,
  `akhir_jam_masuk` time NOT NULL,
  `awal_jam_istirahat` time DEFAULT NULL,
  `akhir_jam_istirahat` time DEFAULT NULL,
  `status_istirahat` char(1) DEFAULT NULL,
  `jam_pulang` time NOT NULL,
  `total_jam` smallint(6) NOT NULL,
  `lintashari` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jam_kerja`
--

INSERT INTO `jam_kerja` (`kode_jam_kerja`, `nama_jam_kerja`, `awal_jam_masuk`, `jam_masuk`, `akhir_jam_masuk`, `awal_jam_istirahat`, `akhir_jam_istirahat`, `status_istirahat`, `jam_pulang`, `total_jam`, `lintashari`) VALUES
('JK02', 'JAM KERJA', '06:00:00', '08:00:00', '09:00:00', NULL, NULL, '0', '18:00:00', 8, '0');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` char(18) NOT NULL DEFAULT '0',
  `nama_lengkap` varchar(100) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(30) DEFAULT NULL,
  `kode_dept` char(3) NOT NULL,
  `kode_cabang` char(3) DEFAULT NULL,
  `status_location` char(1) NOT NULL DEFAULT '1',
  `status_jam_kerja` char(1) NOT NULL DEFAULT '1',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `no_hp`, `foto`, `kode_dept`, `kode_cabang`, `status_location`, `status_jam_kerja`, `password`, `remember_token`) VALUES
('110501', 'Slamet Riyadi', 'Remedial', '81548655818', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('130901', 'Junaidi Adinata', 'Komisaris Utama', '8161993202', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('130902', 'Tatang Sigit Mugiono', 'Komisaris', '8123189088', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('151102', 'Ariyati Bisono', 'Apprasial', '81295413700', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('161103', 'M Aris Wibowo', 'Kepala Kantor Kas Ma', '85743282645', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('161109', 'Ayunita Yonanda Dewati', 'AO Funding Kas Mangu', '85725404848', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('171202', 'Intan Retnosari', 'Teller Kantor Pusat', '87836753289', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('180203', 'Ika Setina Damayanti', 'AO Funding Kas Simo', '85741391597', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('180502', 'Yulianto', 'Accounting', '87737846326', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('180602', 'Eka Listyani', 'Kabag Operasional', '85741816989', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('180702', 'Rifta Nur Rahmadani', 'AO Funding Kas Cepog', '87731960847', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('180706', 'Prihatiningtyas', 'Direktur Utama', '81226030808', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('190801', 'Pritty Atika Choirina', 'Teller Kantor Kas Ma', '85801511336', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('190901', 'Desi Catur Wulandari', 'Admin Loan', '81281152132', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('191001', 'Vistri Puspita Arum', 'Legal', '0895631009643', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('220502', 'Ditiya Wardani', 'Customer Service', '8,95367E+11', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('220705', 'Waryadi Suprapto', 'Remedial', '81328414314', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('220802', 'Anisa Rahmawati Putri', 'Teller Kantor Kas Ce', '87764760849', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('221101', 'I Wayan Eka Prawita Utama', 'PE Kepatuhan dan Man', '85643430067', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('221202', 'Sohibul Afan', 'Staf umum/ Driver', '85280859541', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('230302', 'Samuri', 'Staf umum/ Driver', '82138432750', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('230502', 'Nur Choirotun', 'Kepala Bagian Dana', '82220736565', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('230601', 'Anang Syaiful Wibowo Bakti', 'Kepala Bagian Kredit', '81901296857', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('230801', 'Iktiar Isna Fikri', 'AO Funding Kantor Pu', '85816324891', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('231003', 'Ebenhard Kartika Panjaitan', 'Remedial', '85875120108', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('240602', 'Wiwit Supriyanti', 'AO Funding Kantor Pu', '85879034664', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('240701', 'Putrie Wahyu Handayani', 'AO Lending Kantor Ka', '85786116415', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('240702', 'Tatriana Haryani', 'Audit Internal', '85879277029', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('240801', 'Tri Sulistianto', 'AO Lending Kantor Pu', '85786606466', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('241002', 'Norbertus Deutz Yuniyanta Tinitih', 'IT', '82281557766', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('241201', 'Wahid Budi Santoso', 'Kepala Bagian Penyel', '87780835146', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('250101', 'Silvani Adiningtyas', 'Teller Kantor Kas Si', '87872012589', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('250202', 'Ria Susanti', 'Legal', '85729131707', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('250302', 'Bambang Supriyanto', 'Kepala Kantor Kas Si', '8562821828', NULL, 'HRD', 'PST', '1', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('250303', 'Windarto', 'Remedial', '85727456321', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('250701', 'Jumali', 'Kepala Kantor Kas Ce', '85640406375', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL),
('970201', 'Wahyudi Usodo', 'Diektur YMFK', '85647331246', NULL, 'HRD', 'PST', '0', '0', '$2y$10$z51HxclNac5Fvmc1WSE5p.sg10GzqIVDanHMfRGW7HYEp5sCJw4zK', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jamkerja`
--

CREATE TABLE `konfigurasi_jamkerja` (
  `nik` char(18) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jamkerja`
--

INSERT INTO `konfigurasi_jamkerja` (`nik`, `hari`, `kode_jam_kerja`) VALUES
('191001', 'Senin', 'JK02'),
('191001', 'Selasa', 'JK02'),
('191001', 'Rabu', 'JK02'),
('191001', 'Kamis', 'JK02'),
('191001', 'Jumat', 'JK02'),
('191001', 'Sabtu', NULL),
('191001', 'Minggu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jamkerja_by_date`
--

CREATE TABLE `konfigurasi_jamkerja_by_date` (
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jk_dept`
--

CREATE TABLE `konfigurasi_jk_dept` (
  `kode_jk_dept` char(7) NOT NULL,
  `kode_cabang` char(3) DEFAULT NULL,
  `kode_dept` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jk_dept`
--

INSERT INTO `konfigurasi_jk_dept` (`kode_jk_dept`, `kode_cabang`, `kode_dept`) VALUES
('JPSTHRD', 'PST', 'HRD');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jk_dept_detail`
--

CREATE TABLE `konfigurasi_jk_dept_detail` (
  `kode_jk_dept` char(7) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jk_dept_detail`
--

INSERT INTO `konfigurasi_jk_dept_detail` (`kode_jk_dept`, `hari`, `kode_jam_kerja`) VALUES
('JPSTHRD', 'Senin', 'JK02'),
('JPSTHRD', 'Selasa', 'JK02'),
('JPSTHRD', 'Rabu', 'JK02'),
('JPSTHRD', 'Kamis', 'JK02'),
('JPSTHRD', 'Jumat', 'JK02'),
('JPSTHRD', 'Sabtu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_cuti`
--

CREATE TABLE `master_cuti` (
  `kode_cuti` char(3) NOT NULL,
  `nama_cuti` varchar(30) DEFAULT NULL,
  `jml_hari` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `master_cuti`
--

INSERT INTO `master_cuti` (`kode_cuti`, `nama_cuti`, `jml_hari`) VALUES
('C01', 'Tahunan', 12),
('C02', 'Cuti Melahirkan', 90),
('C04', 'Cuti Menikah', 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_12_14_233749_create_permission_tables', 1),
(5, '2023_12_15_002819_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_izin`
--

CREATE TABLE `pengajuan_izin` (
  `kode_izin` char(9) NOT NULL,
  `nik` char(18) DEFAULT NULL,
  `tgl_izin_dari` date DEFAULT NULL,
  `tgl_izin_sampai` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT 'i : izin s : sakit',
  `kode_cuti` char(3) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `doc_sid` varchar(255) DEFAULT NULL,
  `status_approved` char(1) DEFAULT '0' COMMENT '0 : Pending 1: Disetuji 2: Ditolak'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view-karyawan', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28'),
(2, 'view-departemen', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id` int(11) NOT NULL,
  `nik` char(18) NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time DEFAULT NULL,
  `jam_out` time DEFAULT NULL,
  `foto_in` varchar(255) DEFAULT NULL,
  `foto_out` varchar(255) DEFAULT NULL,
  `lokasi_in` text DEFAULT NULL,
  `lokasi_out` text DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `kode_izin` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id`, `nik`, `tgl_presensi`, `jam_in`, `jam_out`, `foto_in`, `foto_out`, `lokasi_in`, `lokasi_out`, `kode_jam_kerja`, `status`, `kode_izin`) VALUES
(47, '191001', '2025-03-23', '07:29:31', NULL, '191001-2025-03-23-in.png', NULL, '-7.5180082,110.596295', NULL, 'JK02', 'h', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q_rekappresensi`
-- (See below for the actual view)
--
CREATE TABLE `q_rekappresensi` (
`nik` char(18)
,`nama_lengkap` varchar(100)
,`jabatan` varchar(20)
,`tgl_1` varchar(329)
,`tgl_2` varchar(329)
,`tgl_3` varchar(329)
,`tgl_4` varchar(329)
,`tgl_5` varchar(329)
,`tgl_6` varchar(329)
,`tgl_7` varchar(329)
,`tgl_8` varchar(329)
,`tgl_9` varchar(329)
,`tgl_10` varchar(329)
,`tgl_11` varchar(329)
,`tgl_12` varchar(329)
,`tgl_13` varchar(329)
,`tgl_14` varchar(329)
,`tgl_15` varchar(329)
,`tgl_16` varchar(329)
,`tgl_17` varchar(329)
,`tgl_18` varchar(329)
,`tgl_19` varchar(329)
,`tgl_20` varchar(329)
,`tgl_21` varchar(329)
,`tgl_22` varchar(329)
,`tgl_23` varchar(329)
,`tgl_24` varchar(329)
,`tgl_25` varchar(329)
,`tgl_26` varchar(329)
,`tgl_27` varchar(329)
,`tgl_28` varchar(329)
,`tgl_29` varchar(329)
,`tgl_30` varchar(329)
,`tgl_31` varchar(329)
);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2023-12-14 17:36:28', '2023-12-14 17:36:28'),
(2, 'admin departemen', 'web', '2023-12-17 17:22:14', '2023-12-17 17:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `kode_dept` char(3) DEFAULT NULL,
  `kode_cabang` char(3) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `kode_dept`, `kode_cabang`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'Vistri', 'vistri@gmail.com', NULL, '$2y$10$xfzFFM8JkRXBw9L566NJ6.SKhIWyhMLbgzXRhfA/rXg7ORTMxb1Je', 'HRD', 'CPG', NULL, '2023-12-18 15:45:36', '2023-12-18 15:45:36');

-- --------------------------------------------------------

--
-- Structure for view `q_rekappresensi`
--
DROP TABLE IF EXISTS `q_rekappresensi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q_rekappresensi`  AS SELECT `karyawan`.`nik` AS `nik`, `karyawan`.`nama_lengkap` AS `nama_lengkap`, `karyawan`.`jabatan` AS `jabatan`, `tgl_1` AS `tgl_1`, `tgl_2` AS `tgl_2`, `tgl_3` AS `tgl_3`, `tgl_4` AS `tgl_4`, `tgl_5` AS `tgl_5`, `tgl_6` AS `tgl_6`, `tgl_7` AS `tgl_7`, `tgl_8` AS `tgl_8`, `tgl_9` AS `tgl_9`, `tgl_10` AS `tgl_10`, `tgl_11` AS `tgl_11`, `tgl_12` AS `tgl_12`, `tgl_13` AS `tgl_13`, `tgl_14` AS `tgl_14`, `tgl_15` AS `tgl_15`, `tgl_16` AS `tgl_16`, `tgl_17` AS `tgl_17`, `tgl_18` AS `tgl_18`, `tgl_19` AS `tgl_19`, `tgl_20` AS `tgl_20`, `tgl_21` AS `tgl_21`, `tgl_22` AS `tgl_22`, `tgl_23` AS `tgl_23`, `tgl_24` AS `tgl_24`, `tgl_25` AS `tgl_25`, `tgl_26` AS `tgl_26`, `tgl_27` AS `tgl_27`, `tgl_28` AS `tgl_28`, `tgl_29` AS `tgl_29`, `tgl_30` AS `tgl_30`, `tgl_31` AS `tgl_31` FROM (`karyawan` left join (select `nik` AS `nik`,max(if(`tgl_presensi` = '2023-11-01',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_1`,max(if(`tgl_presensi` = '2023-11-02',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_2`,max(if(`tgl_presensi` = '2023-11-03',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_3`,max(if(`tgl_presensi` = '2023-11-04',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_4`,max(if(`tgl_presensi` = '2023-11-05',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_5`,max(if(`tgl_presensi` = '2023-11-06',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_6`,max(if(`tgl_presensi` = '2023-11-07',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_7`,max(if(`tgl_presensi` = '2023-11-08',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_8`,max(if(`tgl_presensi` = '2023-11-09',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_9`,max(if(`tgl_presensi` = '2023-11-10',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_10`,max(if(`tgl_presensi` = '2023-11-11',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_11`,max(if(`tgl_presensi` = '2023-11-12',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_12`,max(if(`tgl_presensi` = '2023-11-13',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_13`,max(if(`tgl_presensi` = '2023-11-14',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_14`,max(if(`tgl_presensi` = '2023-11-15',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_15`,max(if(`tgl_presensi` = '2023-11-16',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_16`,max(if(`tgl_presensi` = '2023-11-17',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_17`,max(if(`tgl_presensi` = '2023-11-18',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_18`,max(if(`tgl_presensi` = '2023-11-19',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_19`,max(if(`tgl_presensi` = '2023-11-20',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_20`,max(if(`tgl_presensi` = '2023-11-21',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_21`,max(if(`tgl_presensi` = '2023-11-22',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_22`,max(if(`tgl_presensi` = '2023-11-23',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_23`,max(if(`tgl_presensi` = '2023-11-24',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_24`,max(if(`tgl_presensi` = '2023-11-25',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_25`,max(if(`tgl_presensi` = '2023-11-26',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_26`,max(if(`tgl_presensi` = '2023-11-27',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_27`,max(if(`tgl_presensi` = '2023-11-28',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_28`,max(if(`tgl_presensi` = '2023-11-29',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_29`,max(if(`tgl_presensi` = '2023-11-30',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_30`,max(if(`tgl_presensi` = '2023-11-31',concat(convert(ifnull(`jam_in`,'NA') using latin1),'|',convert(ifnull(`jam_out`,'NA') using latin1),'|',ifnull(`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_31` from ((`presensi` left join `jam_kerja` on(`kode_jam_kerja` = `jam_kerja`.`kode_jam_kerja`)) left join `pengajuan_izin` on(`kode_izin` = `pengajuan_izin`.`kode_izin`)) group by `nik`) `presensi` on(`karyawan`.`nik` = `nik`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`kode_cabang`) USING BTREE;

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`kode_dept`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `harilibur`
--
ALTER TABLE `harilibur`
  ADD PRIMARY KEY (`kode_libur`) USING BTREE;

--
-- Indexes for table `jam_kerja`
--
ALTER TABLE `jam_kerja`
  ADD PRIMARY KEY (`kode_jam_kerja`) USING BTREE;

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`) USING BTREE,
  ADD KEY `fk_karyawan_cabang` (`kode_cabang`) USING BTREE,
  ADD KEY `fk_karyawan_dept` (`kode_dept`) USING BTREE;

--
-- Indexes for table `konfigurasi_jamkerja`
--
ALTER TABLE `konfigurasi_jamkerja`
  ADD KEY `fk_kj_jk` (`kode_jam_kerja`) USING BTREE,
  ADD KEY `fk_kj_karyawan` (`nik`) USING BTREE;

--
-- Indexes for table `konfigurasi_jamkerja_by_date`
--
ALTER TABLE `konfigurasi_jamkerja_by_date`
  ADD KEY `fk_kjbydate_karyawan` (`nik`) USING BTREE;

--
-- Indexes for table `konfigurasi_jk_dept`
--
ALTER TABLE `konfigurasi_jk_dept`
  ADD PRIMARY KEY (`kode_jk_dept`) USING BTREE,
  ADD KEY `fk_kjd_cabang` (`kode_cabang`) USING BTREE,
  ADD KEY `fk_kjd_dept` (`kode_dept`) USING BTREE;

--
-- Indexes for table `konfigurasi_jk_dept_detail`
--
ALTER TABLE `konfigurasi_jk_dept_detail`
  ADD KEY `fk_jkdept` (`kode_jk_dept`) USING BTREE;

--
-- Indexes for table `master_cuti`
--
ALTER TABLE `master_cuti`
  ADD PRIMARY KEY (`kode_cuti`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD PRIMARY KEY (`kode_izin`) USING BTREE,
  ADD KEY `fk_pengajuan_cuti` (`kode_cuti`) USING BTREE,
  ADD KEY `fk_pengajuan_karyawan` (`nik`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_prensesi_pengajuan_izin` (`kode_izin`) USING BTREE,
  ADD KEY `fk_presensi_jk` (`kode_jam_kerja`) USING BTREE,
  ADD KEY `fk_presensi_karyawan` (`nik`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_karyawan_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jamkerja`
--
ALTER TABLE `konfigurasi_jamkerja`
  ADD CONSTRAINT `fk_kj_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kj_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jamkerja_by_date`
--
ALTER TABLE `konfigurasi_jamkerja_by_date`
  ADD CONSTRAINT `fk_kjbydate_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jk_dept`
--
ALTER TABLE `konfigurasi_jk_dept`
  ADD CONSTRAINT `fk_kjd_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kjd_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfigurasi_jk_dept_detail`
--
ALTER TABLE `konfigurasi_jk_dept_detail`
  ADD CONSTRAINT `fk_jkdept` FOREIGN KEY (`kode_jk_dept`) REFERENCES `konfigurasi_jk_dept` (`kode_jk_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`model_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD CONSTRAINT `fk_pengajuan_cuti` FOREIGN KEY (`kode_cuti`) REFERENCES `master_cuti` (`kode_cuti`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pengajuan_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `fk_prensesi_pengajuan_izin` FOREIGN KEY (`kode_izin`) REFERENCES `pengajuan_izin` (`kode_izin`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_presensi_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_presensi_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
