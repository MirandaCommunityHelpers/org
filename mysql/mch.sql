-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2025 a las 00:23:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mch`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(191) NOT NULL,
  `direccion` varchar(191) NOT NULL,
  `telefono` varchar(191) NOT NULL,
  `correo` varchar(191) NOT NULL,
  `logo` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`id`, `nombre`, `direccion`, `telefono`, `correo`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Clinica Hilari', 'ZONA MIRAFLORES AV 5 CALLE MEJILLOS NRO 200', '47748744 - 3773663773', 'infoclinicahilari@gmail.com', 'logos/BAaMiuyHHGWAjfaWLlWaEhnZcRANInuUmCMnk7TD.jpg', '2025-03-25 06:15:44', '2025-03-25 06:15:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(191) NOT NULL,
  `ubicacion` varchar(191) NOT NULL,
  `capacidad` varchar(191) NOT NULL,
  `telefono` varchar(191) DEFAULT NULL,
  `especialidad` varchar(191) NOT NULL,
  `estado` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consultorios`
--

INSERT INTO `consultorios` (`id`, `nombre`, `ubicacion`, `capacidad`, `telefono`, `especialidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'PEDIATRIA', '1-1A', '10', '', 'PEDIATRIA', 'ACTIVO', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(2, 'FISIOTERAPIA', '3-1A', '20', '3773663', 'FISIOTERAPIA', 'ACTIVO', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(3, 'ODONTOLOGIA', '2-1A', '5', '83773883', 'ODONTOLOGIA', 'ACTIVO', '2025-03-25 06:15:42', '2025-03-25 06:15:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(191) NOT NULL,
  `apellidos` varchar(191) NOT NULL,
  `telefono` varchar(191) NOT NULL,
  `licencia_medica` varchar(191) NOT NULL,
  `especialidad` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `doctors`
--

INSERT INTO `doctors` (`id`, `nombres`, `apellidos`, `telefono`, `licencia_medica`, `especialidad`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Doctor1', 'Swift', '74774634', '8874734', 'PEDIATRIA', 3, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(2, 'Doctor2', 'Barrientos', '747732323', '22222222', 'ODONTOLOGIA', 4, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(3, 'Doctor3', 'Valdez', '733333333', '3333333333', 'FISIOTERAPIA', 5, '2025-03-25 06:15:42', '2025-03-25 06:15:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `color` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `consultorio_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historials`
--

CREATE TABLE `historials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `detalle` text NOT NULL,
  `fecha_visita` date NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dia` varchar(191) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `consultorio_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `dia`, `hora_inicio`, `hora_fin`, `doctor_id`, `consultorio_id`, `created_at`, `updated_at`) VALUES
(1, 'LUNES', '08:00:00', '14:00:00', 1, 1, '2025-03-25 06:15:44', '2025-03-25 06:15:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_05_24_202920_create_secretarias_table', 1),
(7, '2024_05_29_193902_create_pacientes_table', 1),
(8, '2024_06_07_010252_create_consultorios_table', 1),
(9, '2024_06_07_014038_create_doctors_table', 1),
(10, '2024_06_07_014126_create_horarios_table', 1),
(11, '2024_06_28_000829_create_permission_tables', 1),
(12, '2024_07_03_193531_create_events_table', 1),
(13, '2024_07_09_142625_create_configuraciones_table', 1),
(14, '2024_07_16_134112_create_historials_table', 1),
(15, '2024_07_18_145637_create_pagos_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(4, 'App\\Models\\Paciente', 1),
(4, 'App\\Models\\Paciente', 2),
(4, 'App\\Models\\Paciente', 3),
(4, 'App\\Models\\Paciente', 4),
(4, 'App\\Models\\Paciente', 5),
(4, 'App\\Models\\Paciente', 6),
(4, 'App\\Models\\User', 6),
(4, 'App\\Models\\Paciente', 7),
(4, 'App\\Models\\Paciente', 8),
(4, 'App\\Models\\Paciente', 9),
(4, 'App\\Models\\Paciente', 10),
(4, 'App\\Models\\Paciente', 11),
(4, 'App\\Models\\Paciente', 12),
(4, 'App\\Models\\Paciente', 13),
(4, 'App\\Models\\Paciente', 14),
(4, 'App\\Models\\Paciente', 15),
(4, 'App\\Models\\Paciente', 16),
(4, 'App\\Models\\Paciente', 17),
(4, 'App\\Models\\Paciente', 18),
(4, 'App\\Models\\Paciente', 19),
(4, 'App\\Models\\Paciente', 20),
(4, 'App\\Models\\Paciente', 21),
(4, 'App\\Models\\Paciente', 22),
(4, 'App\\Models\\Paciente', 23),
(4, 'App\\Models\\Paciente', 24),
(4, 'App\\Models\\Paciente', 25),
(4, 'App\\Models\\Paciente', 26),
(4, 'App\\Models\\Paciente', 27),
(4, 'App\\Models\\Paciente', 28),
(4, 'App\\Models\\Paciente', 29),
(4, 'App\\Models\\Paciente', 30),
(4, 'App\\Models\\Paciente', 31),
(4, 'App\\Models\\Paciente', 32),
(4, 'App\\Models\\Paciente', 33),
(4, 'App\\Models\\Paciente', 34),
(4, 'App\\Models\\Paciente', 35),
(4, 'App\\Models\\Paciente', 36),
(4, 'App\\Models\\Paciente', 37),
(4, 'App\\Models\\Paciente', 38),
(4, 'App\\Models\\Paciente', 39),
(4, 'App\\Models\\Paciente', 40),
(4, 'App\\Models\\Paciente', 41),
(4, 'App\\Models\\Paciente', 42),
(4, 'App\\Models\\Paciente', 43),
(4, 'App\\Models\\Paciente', 44),
(4, 'App\\Models\\Paciente', 45),
(4, 'App\\Models\\Paciente', 46),
(4, 'App\\Models\\Paciente', 47),
(4, 'App\\Models\\Paciente', 48),
(4, 'App\\Models\\Paciente', 49),
(4, 'App\\Models\\Paciente', 50),
(4, 'App\\Models\\Paciente', 51),
(4, 'App\\Models\\Paciente', 52),
(4, 'App\\Models\\Paciente', 53),
(4, 'App\\Models\\Paciente', 54),
(4, 'App\\Models\\Paciente', 55),
(4, 'App\\Models\\Paciente', 56),
(4, 'App\\Models\\Paciente', 57),
(4, 'App\\Models\\Paciente', 58),
(4, 'App\\Models\\Paciente', 59),
(4, 'App\\Models\\Paciente', 60),
(4, 'App\\Models\\Paciente', 61),
(4, 'App\\Models\\Paciente', 62),
(4, 'App\\Models\\Paciente', 63),
(4, 'App\\Models\\Paciente', 64),
(4, 'App\\Models\\Paciente', 65),
(4, 'App\\Models\\Paciente', 66),
(4, 'App\\Models\\Paciente', 67),
(4, 'App\\Models\\Paciente', 68),
(4, 'App\\Models\\Paciente', 69),
(4, 'App\\Models\\Paciente', 70),
(4, 'App\\Models\\Paciente', 71),
(4, 'App\\Models\\Paciente', 72),
(4, 'App\\Models\\Paciente', 73),
(4, 'App\\Models\\Paciente', 74),
(4, 'App\\Models\\Paciente', 75),
(4, 'App\\Models\\Paciente', 76),
(4, 'App\\Models\\Paciente', 77),
(4, 'App\\Models\\Paciente', 78),
(4, 'App\\Models\\Paciente', 79),
(4, 'App\\Models\\Paciente', 80),
(4, 'App\\Models\\Paciente', 81),
(4, 'App\\Models\\Paciente', 82),
(4, 'App\\Models\\Paciente', 83),
(4, 'App\\Models\\Paciente', 84),
(4, 'App\\Models\\Paciente', 85),
(4, 'App\\Models\\Paciente', 86),
(4, 'App\\Models\\Paciente', 87),
(4, 'App\\Models\\Paciente', 88),
(4, 'App\\Models\\Paciente', 89),
(4, 'App\\Models\\Paciente', 90),
(4, 'App\\Models\\Paciente', 91),
(4, 'App\\Models\\Paciente', 92),
(4, 'App\\Models\\Paciente', 93),
(4, 'App\\Models\\Paciente', 94),
(4, 'App\\Models\\Paciente', 95),
(4, 'App\\Models\\Paciente', 96),
(4, 'App\\Models\\Paciente', 97),
(4, 'App\\Models\\Paciente', 98),
(4, 'App\\Models\\Paciente', 99),
(4, 'App\\Models\\Paciente', 100),
(4, 'App\\Models\\Paciente', 101),
(4, 'App\\Models\\Paciente', 102),
(4, 'App\\Models\\Paciente', 103),
(4, 'App\\Models\\Paciente', 104),
(4, 'App\\Models\\Paciente', 105),
(4, 'App\\Models\\Paciente', 106),
(4, 'App\\Models\\Paciente', 107),
(4, 'App\\Models\\Paciente', 108),
(4, 'App\\Models\\Paciente', 109),
(4, 'App\\Models\\Paciente', 110),
(4, 'App\\Models\\Paciente', 111),
(4, 'App\\Models\\Paciente', 112),
(4, 'App\\Models\\Paciente', 113),
(4, 'App\\Models\\Paciente', 114),
(4, 'App\\Models\\Paciente', 115),
(4, 'App\\Models\\Paciente', 116),
(4, 'App\\Models\\Paciente', 117),
(4, 'App\\Models\\Paciente', 118),
(4, 'App\\Models\\Paciente', 119),
(4, 'App\\Models\\Paciente', 120),
(4, 'App\\Models\\Paciente', 121),
(4, 'App\\Models\\Paciente', 122),
(4, 'App\\Models\\Paciente', 123),
(4, 'App\\Models\\Paciente', 124),
(4, 'App\\Models\\Paciente', 125),
(4, 'App\\Models\\Paciente', 126),
(4, 'App\\Models\\Paciente', 127),
(4, 'App\\Models\\Paciente', 128),
(4, 'App\\Models\\Paciente', 129),
(4, 'App\\Models\\Paciente', 130),
(4, 'App\\Models\\Paciente', 131),
(4, 'App\\Models\\Paciente', 132),
(4, 'App\\Models\\Paciente', 133),
(4, 'App\\Models\\Paciente', 134),
(4, 'App\\Models\\Paciente', 135),
(4, 'App\\Models\\Paciente', 136),
(4, 'App\\Models\\Paciente', 137),
(4, 'App\\Models\\Paciente', 138),
(4, 'App\\Models\\Paciente', 139),
(4, 'App\\Models\\Paciente', 140),
(4, 'App\\Models\\Paciente', 141),
(4, 'App\\Models\\Paciente', 142),
(4, 'App\\Models\\Paciente', 143),
(4, 'App\\Models\\Paciente', 144),
(4, 'App\\Models\\Paciente', 145),
(4, 'App\\Models\\Paciente', 146),
(4, 'App\\Models\\Paciente', 147),
(4, 'App\\Models\\Paciente', 148),
(4, 'App\\Models\\Paciente', 149),
(4, 'App\\Models\\Paciente', 150),
(4, 'App\\Models\\Paciente', 151),
(4, 'App\\Models\\Paciente', 152),
(4, 'App\\Models\\Paciente', 153),
(4, 'App\\Models\\Paciente', 154),
(4, 'App\\Models\\Paciente', 155),
(4, 'App\\Models\\Paciente', 156),
(4, 'App\\Models\\Paciente', 157),
(4, 'App\\Models\\Paciente', 158),
(4, 'App\\Models\\Paciente', 159),
(4, 'App\\Models\\Paciente', 160),
(4, 'App\\Models\\Paciente', 161),
(4, 'App\\Models\\Paciente', 162),
(4, 'App\\Models\\Paciente', 163),
(4, 'App\\Models\\Paciente', 164),
(4, 'App\\Models\\Paciente', 165),
(4, 'App\\Models\\Paciente', 166),
(4, 'App\\Models\\Paciente', 167),
(4, 'App\\Models\\Paciente', 168),
(4, 'App\\Models\\Paciente', 169),
(4, 'App\\Models\\Paciente', 170),
(4, 'App\\Models\\Paciente', 171),
(4, 'App\\Models\\Paciente', 172),
(4, 'App\\Models\\Paciente', 173),
(4, 'App\\Models\\Paciente', 174),
(4, 'App\\Models\\Paciente', 175),
(4, 'App\\Models\\Paciente', 176),
(4, 'App\\Models\\Paciente', 177),
(4, 'App\\Models\\Paciente', 178),
(4, 'App\\Models\\Paciente', 179),
(4, 'App\\Models\\Paciente', 180),
(4, 'App\\Models\\Paciente', 181),
(4, 'App\\Models\\Paciente', 182),
(4, 'App\\Models\\Paciente', 183),
(4, 'App\\Models\\Paciente', 184),
(4, 'App\\Models\\Paciente', 185),
(4, 'App\\Models\\Paciente', 186),
(4, 'App\\Models\\Paciente', 187),
(4, 'App\\Models\\Paciente', 188),
(4, 'App\\Models\\Paciente', 189),
(4, 'App\\Models\\Paciente', 190),
(4, 'App\\Models\\Paciente', 191),
(4, 'App\\Models\\Paciente', 192),
(4, 'App\\Models\\Paciente', 193),
(4, 'App\\Models\\Paciente', 194),
(4, 'App\\Models\\Paciente', 195),
(4, 'App\\Models\\Paciente', 196),
(4, 'App\\Models\\Paciente', 197),
(4, 'App\\Models\\Paciente', 198),
(4, 'App\\Models\\Paciente', 199),
(4, 'App\\Models\\Paciente', 200),
(5, 'App\\Models\\User', 7),
(5, 'App\\Models\\User', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `ci` varchar(100) NOT NULL,
  `nro_seguro` varchar(100) NOT NULL,
  `fecha_nacimiento` varchar(100) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `grupo_sanguineo` varchar(255) NOT NULL,
  `alergias` varchar(255) NOT NULL,
  `contacto_emergencia` varchar(255) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombres`, `apellidos`, `ci`, `nro_seguro`, `fecha_nacimiento`, `genero`, `celular`, `correo`, `direccion`, `grupo_sanguineo`, `alergias`, `contacto_emergencia`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 'Jacques Mosciski', 'Fadel', '19574708', '21655731', '2011-10-16', 'M', '+19205028684', 'hintz.tabitha@example.org', '294 Conroy Fords Suite 506\nDaniellebury, DC 00878-8495', 'O-', 'quam cum doloribus', '605-320-5438', 'totam sint tempora', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(2, 'Cole Sipes', 'Reynolds', '95044121', '41369293', '1996-10-21', 'M', '+1-623-947-4956', 'ghill@example.com', '74721 Rosenbaum Inlet\nLaurinehaven, WY 45604-6614', 'O+', 'ipsam repellat quia', '681.846.9310', 'sunt est molestiae', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(3, 'Dorian Wilderman', 'Bednar', '25345980', '02511272', '1980-12-12', 'M', '650.518.5282', 'keaton.lakin@example.net', '946 Price Union Apt. 190\nNorth Lue, OK 97227', 'O-', 'ut est nihil', '1-567-689-1602', 'omnis esse est', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(4, 'Dr. Isabella Hintz', 'Mayert', '37970002', '84941298', '1972-02-24', 'F', '+16465589932', 'prau@example.com', '7640 Grant Village Suite 786\nWest Riverbury, PA 83836-0123', 'A+', 'ad mollitia cumque', '+1-216-746-9055', 'eligendi et pariatur', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(5, 'Anabel Lemke', 'Bruen', '13212385', '96240365', '2009-09-28', 'F', '615.912.5943', 'susie95@example.com', '268 Corkery Expressway\nLake Ivahland, WA 06067', 'O-', 'non quia quia', '283-478-0398', 'ad voluptas suscipit', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(6, 'Shaina Collier Sr.', 'Schulist', '76769291', '88138286', '2013-11-11', 'M', '+1-361-894-2491', 'cruickshank.johan@example.net', '364 Murazik Plaza\nDonport, MS 46659-6418', 'A+', 'qui sapiente odit', '618.441.3178', 'numquam labore dolor', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(7, 'Mrs. Rachael Boyer', 'Kshlerin', '04794370', '50759753', '1999-05-23', 'M', '934-710-6013', 'ahegmann@example.com', '202 D\'Amore Ville Suite 297\nWest Josh, OR 22314', 'B+', 'dignissimos sit nostrum', '+1-956-863-7930', 'et voluptas rerum', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(8, 'Giovanna Torp Jr.', 'Hyatt', '26565126', '40732670', '2014-09-08', 'F', '(657) 348-8629', 'mara73@example.org', '34822 Pfannerstill Parks Suite 603\nTamaraside, MN 29231-4157', 'B+', 'numquam aut fugit', '+1-754-717-7393', 'assumenda soluta ut', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(9, 'Reece Kuphal', 'Fisher', '75482090', '66552956', '1983-07-28', 'M', '806.826.5844', 'ima94@example.org', '71763 Karina Via\nNew Ellisburgh, AL 66480-7130', 'B-', 'voluptatibus quia consequuntur', '+1-706-819-7695', 'impedit est cupiditate', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(10, 'Bryce Auer PhD', 'Little', '01733719', '83745228', '1985-12-12', 'M', '863.512.6685', 'jayne66@example.com', '71607 Maggio Summit\nShadburgh, KS 15929', 'O-', 'soluta ipsum inventore', '+1-918-790-6984', 'voluptates veniam minima', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(11, 'Yasmeen Bosco', 'D\'Amore', '35977021', '59157308', '1995-01-05', 'M', '(220) 254-8444', 'wintheiser.gregoria@example.net', '973 Bernard Vista Suite 487\nRobertsfurt, OK 79492', 'O-', 'recusandae quam vitae', '1-551-345-5421', 'nisi sit est', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(12, 'Kaia Osinski DDS', 'Hettinger', '92023245', '35800918', '1993-06-13', 'F', '1-281-378-5096', 'mheidenreich@example.com', '228 Zakary Valley Apt. 308\nNew Miloview, VT 21930-5149', 'A+', 'et facilis sed', '442-358-8623', 'explicabo saepe possimus', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(13, 'Sherwood Kunze', 'Reichel', '76114874', '81352859', '2014-03-29', 'F', '(281) 938-8567', 'donnelly.paul@example.net', '14217 Walker Lodge Suite 992\nEast Braxton, AL 15785', 'B-', 'voluptas expedita vitae', '1-650-344-3498', 'et voluptas consequatur', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(14, 'Rylan Quigley', 'Ratke', '77282243', '51673572', '1977-08-17', 'F', '+1 (607) 835-1737', 'maxine27@example.org', '74261 Hobart Village\nNorth Estel, IA 49234-8670', 'O-', 'animi eum error', '+1-814-625-6059', 'ea vero autem', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(15, 'Oran Douglas', 'Fisher', '94690653', '79648076', '2014-02-28', 'F', '901.862.2624', 'nitzsche.chadd@example.net', '819 Evelyn Roads\nTorphytown, RI 57326', 'B+', 'minus consequatur aut', '(502) 630-7842', 'tempora harum magni', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(16, 'Loraine O\'Kon Sr.', 'Olson', '97633976', '79025048', '1970-01-01', 'M', '(240) 587-5639', 'bernhard.schoen@example.com', '82230 Ferry Freeway Suite 652\nGavinland, AR 40250-6017', 'O+', 'aut dicta omnis', '+18565886815', 'delectus sit quos', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(17, 'Claudie Barrows', 'Dooley', '23287897', '75363896', '1985-03-15', 'M', '445-526-0731', 'tabshire@example.net', '705 Antonietta Summit\nNorth Hildegardfort, IA 66243-8511', 'A-', 'ut tempore officiis', '(870) 533-7649', 'consequuntur aliquid amet', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(18, 'Hayden Howell', 'Murphy', '81244148', '23685238', '2001-09-13', 'M', '+1.380.681.8040', 'zframi@example.com', '20607 Olson Walks\nSouth Santa, NM 57251-6066', 'A+', 'vitae dolores veniam', '539.858.4547', 'qui magnam ut', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(19, 'Esmeralda McClure II', 'Hettinger', '90219407', '05230974', '1973-02-19', 'M', '1-224-693-0225', 'mcdermott.bernard@example.net', '953 Irving Ville\nLambertmouth, NV 65615', 'O+', 'et et qui', '1-949-922-3859', 'saepe quam in', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(20, 'Miss Felipa Haag', 'Cruickshank', '32583274', '25662965', '1999-05-17', 'M', '1-325-254-8967', 'ledner.ulises@example.org', '28329 Aracely Courts\nEleonoreland, DE 01897-7852', 'B+', 'magni itaque autem', '+1 (406) 697-7556', 'aut commodi et', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(21, 'Prof. Amelia Hickle', 'Beahan', '04885712', '90057675', '2005-10-11', 'F', '+1-802-845-9604', 'hschaefer@example.net', '316 Shanie Greens Suite 564\nMoorestad, UT 99728-8865', 'A-', 'deleniti et sequi', '757.207.9992', 'hic sit ut', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(22, 'Westley Turner', 'Lemke', '52004849', '24768689', '1983-03-21', 'M', '(848) 242-5138', 'mwatsica@example.org', '52795 Jacobi Mill\nBernhardborough, IL 03963', 'A+', 'ad dolor sed', '1-469-201-8303', 'minus omnis sit', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(23, 'Crystal Zboncak', 'Spinka', '91863357', '86551713', '1987-08-15', 'F', '+1-520-305-3579', 'konopelski.itzel@example.net', '21190 Oren Park Apt. 883\nAngeltown, SC 62720-8495', 'A+', 'ad sunt dolorem', '+1.540.378.0056', 'suscipit et rerum', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(24, 'Myrtle Goldner IV', 'Ziemann', '63093826', '09377087', '1977-08-20', 'M', '+1-469-945-3219', 'upton.tina@example.com', '3180 Anabel Street\nMurphybury, SD 32242-2964', 'B+', 'est ad laudantium', '1-651-496-7146', 'magni alias excepturi', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(25, 'Brandyn Kassulke DDS', 'Baumbach', '99642870', '73832967', '1970-07-06', 'M', '240.933.6700', 'ewell97@example.org', '672 Lang Field Suite 827\nMillsfort, VT 26722', 'O+', 'temporibus impedit praesentium', '+1.813.254.1842', 'magni et molestiae', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(26, 'Prof. Marguerite Wiza', 'Renner', '12848484', '50962918', '2008-08-01', 'M', '+1 (276) 849-5966', 'pmraz@example.net', '6233 Noe Squares Apt. 825\nPort Terrence, AR 85967-0780', 'O-', 'deleniti eveniet cum', '+14435086730', 'corporis nemo culpa', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(27, 'Laney Gerlach Jr.', 'Ryan', '23455600', '12756823', '2006-04-16', 'M', '+1-469-748-2636', 'muller.dedric@example.com', '6071 Halvorson Rest\nWest Felix, NY 23481-5471', 'A+', 'libero fuga voluptatem', '270-853-9504', 'fuga deleniti natus', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(28, 'Aditya Reichert', 'Stamm', '61123223', '61988490', '1993-12-19', 'F', '283.421.1035', 'vernie.emmerich@example.org', '293 Gulgowski Grove Apt. 925\nPort Janistown, MI 73433', 'B-', 'placeat aut est', '339-405-3416', 'dolores necessitatibus doloribus', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(29, 'Dr. Dwight Jacobson', 'Thiel', '61217929', '91362494', '1986-05-31', 'F', '+18184361402', 'soledad.muller@example.net', '30591 Zboncak Via\nLavernstad, PA 19487-9195', 'B+', 'asperiores magni dolor', '+1.217.318.2226', 'id animi voluptatibus', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(30, 'Sonny Ortiz', 'Beatty', '93711646', '75495345', '1989-09-25', 'F', '+14799547742', 'ernser.casandra@example.com', '227 Mitchell Shoal\nTrudieburgh, CO 10164', 'B+', 'omnis voluptas vero', '+1.564.805.2535', 'tempore autem recusandae', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(31, 'Stephon Farrell', 'Howell', '73440880', '71258082', '2016-06-17', 'F', '+1.754.749.0344', 'dominique.schmidt@example.com', '7369 Beatty Drive\nDuBuqueburgh, AR 67771-9238', 'O-', 'soluta omnis neque', '1-463-808-7569', 'quia quos iste', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(32, 'Aletha Prohaska', 'Ratke', '63814640', '63617621', '2018-11-29', 'M', '1-985-288-4209', 'pbailey@example.net', '6819 Tyrese Prairie\nJaymemouth, MI 38890', 'O-', 'reiciendis iusto voluptate', '916-847-6305', 'corrupti dolores tempora', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(33, 'Celine Luettgen IV', 'Blick', '49059407', '58113926', '2011-06-29', 'F', '(406) 569-9546', 'goldner.isai@example.org', '524 Wintheiser Union\nNorth Brook, IN 71763', 'A-', 'facere aut ea', '(425) 490-9957', 'aut asperiores incidunt', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(34, 'Judson Cartwright', 'Orn', '87378659', '78648657', '1993-11-29', 'M', '+16017077888', 'queenie55@example.com', '38575 Marisol Common\nNorth Judy, ME 96207-1957', 'B+', 'natus consequatur et', '+1 (586) 918-3266', 'tempora ullam repellendus', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(35, 'Rosemarie Feeney PhD', 'Koepp', '52009121', '41199388', '2007-05-16', 'M', '+1.845.528.1605', 'kautzer.lilla@example.org', '920 Conn Fields\nNew Dawsontown, WI 49044', 'A+', 'perferendis aut molestiae', '+1-305-843-3466', 'nobis ea quo', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(36, 'Maximus Morissette', 'Weissnat', '95240080', '99069101', '2002-06-14', 'M', '931.391.8066', 'remington88@example.com', '152 Abdul Springs\nNew Chandlerport, WI 04871-1059', 'B+', 'esse sequi voluptatum', '1-820-232-6884', 'saepe deleniti enim', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(37, 'Brennon Lakin', 'Erdman', '84947217', '63359869', '1984-02-04', 'F', '323.527.6721', 'dusty.russel@example.org', '44807 Heath Roads\nEast Gregoriachester, AK 71251-5869', 'O+', 'quasi aut laudantium', '330.424.1780', 'ut quisquam labore', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(38, 'Dax Gerhold', 'Mann', '29180550', '60097908', '1995-10-27', 'M', '(907) 728-1741', 'ecremin@example.org', '769 McKenzie Parkway\nPort Lynn, NV 62697-8855', 'B-', 'aliquam iusto et', '346.734.7611', 'officia nobis consequatur', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(39, 'Amparo Wiegand', 'Roberts', '40646024', '84711193', '1989-11-06', 'F', '+1.973.250.2588', 'sydnee.becker@example.com', '5670 Larkin Ports Apt. 953\nDietrichstad, MD 19693-0752', 'B-', 'et officia cum', '651-310-1436', 'ad rerum praesentium', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(40, 'Celestino Miller', 'Keebler', '54888230', '17399930', '2018-10-20', 'M', '+1.941.696.8650', 'lakin.robin@example.net', '5317 Sebastian Port Apt. 382\nNorth Hobart, MT 77298', 'A-', 'provident dicta nam', '+1.805.716.9170', 'ab nihil voluptatem', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(41, 'Mr. Dexter Moen I', 'Hudson', '38065422', '00266474', '1972-09-16', 'F', '+1-660-888-5792', 'juliet37@example.net', '73786 Sanford Run Suite 277\nWest Sigridland, NV 52376', 'O+', 'omnis rerum aut', '(662) 201-9085', 'aspernatur atque et', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(42, 'Dr. Austin Zboncak', 'Schaefer', '62485866', '56280846', '2001-05-18', 'M', '+16816655231', 'ncruickshank@example.com', '727 Barton Skyway\nLake Treviontown, CO 31018-5888', 'B-', 'iusto debitis laudantium', '+1-240-497-7502', 'laboriosam quibusdam dolor', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(43, 'Jane Monahan', 'Barrows', '48363028', '20236251', '1989-05-18', 'M', '878.327.7059', 'vreichel@example.com', '623 White Estates\nWest Darrell, AL 83673', 'B-', 'labore corrupti eligendi', '207-384-5213', 'aut sed eaque', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(44, 'Marcella Davis', 'Rohan', '39202901', '43373527', '2007-02-28', 'M', '1-951-886-4514', 'ohara.martina@example.com', '260 Heloise Corner\nNew Jocelyn, NV 02392-6275', 'A-', 'non aperiam ullam', '318-680-8454', 'tempore nihil hic', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(45, 'Trystan Kreiger I', 'Schmitt', '84684990', '94547634', '1983-10-31', 'F', '+1-562-321-2330', 'augustine.kozey@example.com', '6372 Cathy Summit\nEast Jaiden, MT 65199', 'A-', 'cupiditate aut est', '661-468-3270', 'consectetur temporibus aperiam', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(46, 'Brandy Crist', 'Collier', '68192469', '99652647', '2018-06-14', 'M', '1-820-230-3165', 'medhurst.kameron@example.net', '81046 Bins Well\nKassulkechester, AZ 08108', 'A-', 'ea est aut', '769.409.1544', 'ut eaque veritatis', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(47, 'Aliyah Senger', 'Howell', '28983546', '18961008', '2018-11-08', 'M', '(641) 301-7238', 'emmitt59@example.org', '12827 Elinor Point Suite 235\nWest Lilla, TN 95834', 'B+', 'vero aut perspiciatis', '1-979-453-6901', 'eius inventore distinctio', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(48, 'Shanny Hayes MD', 'Kirlin', '43031399', '31815217', '1985-06-20', 'F', '+1-740-791-0286', 'schoen.myah@example.net', '960 Hintz Well Suite 858\nEast Westleyberg, LA 65357-7958', 'O+', 'doloribus harum delectus', '270.931.2220', 'sed perspiciatis voluptatibus', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(49, 'Bethel Rodriguez', 'Heidenreich', '73672086', '58984817', '2003-06-13', 'M', '+1 (270) 760-6770', 'ernest48@example.net', '80052 Russel Drive Suite 885\nRempelborough, AL 26357', 'B-', 'quam dicta nihil', '(208) 268-6810', 'alias voluptas alias', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(50, 'Kathryn Koch DVM', 'Waters', '76018975', '63200184', '1987-12-25', 'F', '+1 (678) 278-2883', 'bschulist@example.org', '468 Goyette Mountain Suite 497\nSherwoodton, NY 82423-6905', 'B-', 'consequatur quidem dolores', '+1-216-801-5693', 'alias reprehenderit itaque', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(51, 'Ardella Frami', 'Weissnat', '21415003', '26512695', '1970-05-09', 'F', '(352) 405-5405', 'ava73@example.com', '2342 Cara Shoal Apt. 327\nVilmaview, AR 85011', 'O-', 'ut molestias tempora', '+1 (205) 627-5789', 'quisquam non ut', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(52, 'Eulah Schaefer', 'Pfannerstill', '44006029', '44533163', '2017-03-03', 'F', '575-646-1637', 'weffertz@example.com', '67187 Shanny Pine Apt. 031\nDaughertyberg, PA 68217-1825', 'B+', 'repellat et beatae', '681-302-1893', 'beatae sequi eum', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(53, 'Ms. Jalyn Kautzer DDS', 'Murphy', '27101468', '60497430', '2012-12-13', 'M', '+1-541-847-9064', 'hailie41@example.org', '412 Johnson Rest\nNorth Agustin, OK 23318', 'B-', 'magnam et minima', '+1 (830) 580-9244', 'ut ut et', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(54, 'Paolo Donnelly', 'Hintz', '86793588', '06204396', '1978-06-18', 'M', '351.785.7503', 'crunolfsdottir@example.org', '348 Wintheiser Mount\nRowetown, NJ 70783', 'O-', 'ipsam consequuntur earum', '+1.319.216.3194', 'omnis voluptas quis', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(55, 'Ariane Hand', 'Bogan', '83812000', '56441005', '1978-03-15', 'M', '1-262-996-4728', 'rebeka74@example.org', '642 Bednar Loop Apt. 856\nSouth Koby, OK 40837-7022', 'B+', 'inventore neque velit', '+1.540.447.0099', 'delectus expedita dolores', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(56, 'Miracle Harris', 'Pollich', '57421043', '36304913', '1974-04-29', 'M', '814.200.5781', 'mills.jonatan@example.com', '736 Josefa Route Apt. 334\nEzekielview, IN 24915-0304', 'A+', 'dolorem laudantium modi', '820-309-7091', 'et cum sunt', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(57, 'Lennie Gleason', 'Dietrich', '96469905', '39851163', '1999-10-04', 'M', '1-770-874-8902', 'sasha75@example.net', '25277 Raquel Rapid\nErdmanhaven, FL 29885', 'A-', 'asperiores reiciendis est', '+1 (575) 281-7837', 'temporibus dolorum dicta', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(58, 'Cary Bayer Jr.', 'Schmeler', '56333834', '24683868', '1988-06-13', 'F', '+1-530-948-6095', 'verla74@example.net', '75085 Glen Trace Suite 491\nCurttown, DE 16320', 'O+', 'ipsa consequatur culpa', '(608) 322-9741', 'ut quia qui', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(59, 'Tate Schoen DDS', 'O\'Reilly', '87967032', '24310543', '1972-04-13', 'M', '+1-620-509-1900', 'toni23@example.org', '17876 Corkery Vista\nNew Pablo, GA 58637-1281', 'B-', 'repudiandae impedit aspernatur', '1-361-430-9757', 'non cupiditate laborum', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(60, 'Reginald Conroy', 'Blick', '77379159', '23408410', '1973-12-20', 'M', '443-669-8956', 'gblick@example.org', '90237 Ryan Mission Suite 816\nGorczanytown, ME 14170-3295', 'B+', 'natus ullam quo', '(951) 320-7484', 'ut ut et', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(61, 'Dr. Jesse Connelly', 'Ziemann', '58551508', '04095653', '1991-01-07', 'M', '1-737-351-0874', 'rolfson.ciara@example.net', '326 Chester Unions Apt. 966\nXavierhaven, WA 80970', 'B-', 'sunt et blanditiis', '(607) 741-6786', 'atque quasi deleniti', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(62, 'Dr. Noemi Schimmel', 'Orn', '59014249', '41312109', '1970-08-25', 'M', '731-259-9910', 'beatrice.swift@example.net', '44373 Ciara Street Suite 680\nRosieville, NH 37605-6673', 'A+', 'assumenda voluptas facere', '806-460-6699', 'quod qui voluptas', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(63, 'Glennie Rau', 'Wyman', '41383941', '50950535', '1986-11-24', 'M', '(901) 543-7317', 'wbode@example.org', '7137 Jakubowski Neck Apt. 758\nMollyfurt, NY 35794-6902', 'B-', 'omnis fugiat odit', '+15408575264', 'aspernatur suscipit aut', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(64, 'Shana Borer', 'Koelpin', '77950702', '19662205', '1974-01-30', 'M', '619.239.0811', 'katherine.stokes@example.org', '26014 Mills Heights Apt. 385\nWest Orrin, VT 32209', 'A-', 'ullam est rem', '+1-689-568-8611', 'ut iste unde', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(65, 'Gene McDermott', 'Nolan', '52184645', '94030077', '2017-12-05', 'F', '1-541-467-4804', 'jaunita.wisoky@example.org', '49938 Christiana Cape Apt. 948\nWest Darrionfurt, IL 99298-4877', 'O-', 'suscipit amet et', '+1 (630) 546-9438', 'ut ut non', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(66, 'Leonard Runte MD', 'Feest', '80698090', '13391893', '2017-03-23', 'M', '1-979-730-3867', 'mcglynn.abbey@example.net', '89352 Cathy Ridge Suite 628\nJordanefort, NY 60000', 'B-', 'consequatur cupiditate molestias', '+1.629.644.1645', 'quae aspernatur molestias', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(67, 'Loyal Champlin', 'Feil', '67186252', '62120447', '1985-02-21', 'M', '+1.361.607.3878', 'norbert.mills@example.net', '69382 Grady Estate Suite 844\nGleasonbury, NY 03383', 'O+', 'ratione id voluptas', '313-531-1605', 'minima vitae quia', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(68, 'Mrs. Marlene Keeling Sr.', 'Flatley', '10223166', '59716724', '1979-02-14', 'M', '1-847-897-3968', 'oabernathy@example.org', '22684 Laurence Street Suite 209\nKuphalstad, TX 29008-9499', 'B-', 'a omnis minus', '620-833-8201', 'ut dolor eveniet', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(69, 'Tressie Turcotte I', 'Wiegand', '29530687', '91861219', '1992-02-03', 'F', '847-339-6801', 'izaiah.hand@example.com', '31924 Bernier Viaduct Apt. 548\nEast Jeramy, MT 80721', 'A-', 'nam voluptas maiores', '(912) 941-0655', 'eos aut amet', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(70, 'Prof. Amara Waelchi DVM', 'Corkery', '55751823', '01779866', '1972-08-20', 'M', '+14694614515', 'ckshlerin@example.com', '50950 Carroll Manors\nHankville, AK 82582-2353', 'B+', 'qui et at', '585-780-2443', 'facilis voluptas perferendis', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(71, 'Giles Huel IV', 'Haley', '03358284', '12543191', '1972-06-30', 'F', '+1 (657) 316-8119', 'reichel.annetta@example.net', '539 Olen Orchard\nNew Heather, MI 83951-4537', 'A-', 'atque eius perferendis', '1-810-671-4801', 'est deleniti cumque', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(72, 'Braeden Rempel', 'Smith', '50918633', '90971480', '2004-05-15', 'F', '+1.445.766.5921', 'jwest@example.org', '509 Mertz Views Apt. 163\nIssacton, AL 68199', 'B-', 'nesciunt nam rem', '+1-435-309-2142', 'aut voluptatem reprehenderit', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(73, 'Prof. Vallie Willms', 'Klein', '59602929', '02713391', '2000-06-04', 'M', '(364) 258-8799', 'vicenta56@example.org', '12440 Schiller Hill\nNew Hugh, CA 72504', 'A+', 'sit aut soluta', '+19042001668', 'provident est optio', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(74, 'Christy Hessel', 'Medhurst', '61325130', '62248014', '2003-12-20', 'M', '+1-580-990-8018', 'angela00@example.net', '3783 Kaycee Harbors Apt. 371\nRaynortown, SC 96230-9977', 'O-', 'deserunt pariatur fugit', '+12234587779', 'id incidunt delectus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(75, 'Sadye Monahan II', 'Rosenbaum', '54140032', '49428731', '1996-01-06', 'F', '(458) 846-1824', 'wfeil@example.net', '6635 Elijah Summit Suite 867\nPort Edmund, TX 79649', 'O-', 'odio vitae quos', '702-782-1732', 'non aut voluptas', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(76, 'Marjory Grimes', 'Hessel', '15491838', '57258524', '1982-06-17', 'M', '+1.484.313.8419', 'ujerde@example.com', '421 Aileen Passage Apt. 991\nWest Lloyd, CA 75922-7039', 'A-', 'nihil occaecati vero', '1-747-962-8400', 'veritatis perspiciatis dolor', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(77, 'Caroline Paucek', 'Huels', '49830100', '40891983', '1997-11-19', 'F', '1-352-616-4815', 'ewunsch@example.org', '59218 Lueilwitz Forks Apt. 654\nCathrynchester, AK 80957', 'A-', 'amet non optio', '+12319528181', 'nisi voluptates exercitationem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(78, 'Markus Cruickshank Sr.', 'Quigley', '08700081', '02927307', '2008-07-31', 'M', '+1-941-657-7910', 'delphia18@example.com', '5857 Cartwright Neck\nCarrollmouth, WA 85601', 'O-', 'quod aut laborum', '276.566.3829', 'reiciendis quibusdam repellendus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(79, 'Sierra Prosacco', 'Osinski', '44111819', '57719562', '2016-02-04', 'M', '385-462-9265', 'dkessler@example.com', '44049 Elise Haven\nNorth Laurieview, MD 19118', 'A+', 'soluta quis doloremque', '+1 (216) 555-0611', 'aliquam saepe voluptate', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(80, 'Salvatore Pouros', 'Auer', '44628484', '24763260', '2018-02-17', 'M', '281-268-4392', 'myrtie.carter@example.net', '471 Lucinda Cliffs Suite 797\nLake Tannerview, ND 15693', 'B+', 'eum vel tempora', '+1.410.816.4767', 'vero amet quia', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(81, 'Misty Altenwerth Sr.', 'Schamberger', '09900515', '54854797', '2008-09-01', 'F', '+1.408.407.7622', 'doyle21@example.com', '9866 Myrtle Walk Suite 764\nBeahanville, MN 62093-0375', 'O+', 'pariatur qui qui', '(239) 877-3684', 'voluptate inventore rem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(82, 'Prof. Cordelia Kiehn PhD', 'Schinner', '37797970', '16943709', '2011-01-17', 'F', '+1-786-524-0291', 'elias70@example.net', '12293 Hauck Path\nWesthaven, MN 47718-4440', 'B-', 'quis maxime omnis', '+1.458.348.9046', 'perspiciatis nisi aut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(83, 'Yasmin Mills', 'Ebert', '06999154', '73669808', '2010-05-19', 'F', '+1-312-420-0047', 'julio.bergstrom@example.com', '334 Gage Valley\nEast Jeanne, CO 88702-9388', 'O+', 'est beatae deleniti', '+17247840289', 'ut aliquid nobis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(84, 'Ayden Price', 'Hessel', '04384600', '66278261', '1981-12-24', 'F', '+1-810-425-6148', 'spencer.felix@example.org', '486 Parisian Valley Apt. 352\nMcGlynnshire, WA 89425-4679', 'A+', 'molestiae in ut', '(561) 308-5312', 'mollitia distinctio ut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(85, 'Alison Von', 'Gaylord', '34694016', '49554676', '1986-11-22', 'F', '612.572.5672', 'nolan.friedrich@example.com', '556 Ted Roads Suite 826\nLuettgenside, PA 86129-6746', 'B+', 'aut dolores cumque', '507.888.4033', 'quia pariatur voluptates', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(86, 'Prof. Jarred Orn', 'Brekke', '65764446', '20482384', '2001-06-21', 'F', '760.217.3491', 'poconnell@example.net', '176 Champlin Trafficway\nEast Gayle, WV 10129', 'B+', 'unde possimus nulla', '714-472-3545', 'maxime laborum minima', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(87, 'Adelia Toy II', 'Collier', '96717556', '38625629', '1988-08-06', 'M', '248.959.3919', 'abshire.stuart@example.com', '6709 Wilkinson Path Apt. 730\nWest Hildegardmouth, DE 49538', 'B-', 'quia quia dolores', '346-417-6090', 'qui adipisci enim', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(88, 'Cordia Harber', 'Feil', '58046293', '04476380', '2001-01-14', 'M', '316.908.3880', 'raina.rolfson@example.com', '1183 Carroll Drives\nMarvinhaven, ID 34457', 'O+', 'dicta eos beatae', '1-920-386-7146', 'est ut blanditiis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(89, 'Dana Boehm', 'Ortiz', '12376548', '90143731', '1991-10-21', 'M', '+1.724.547.3923', 'hward@example.com', '1709 Parker Course\nChamplinmouth, UT 67153', 'O-', 'eaque qui deleniti', '+16784577684', 'consequatur odio aut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(90, 'Hazle Labadie I', 'Kuhn', '10997446', '88325625', '2000-12-09', 'M', '952-279-0806', 'katlynn.hirthe@example.org', '12748 Boyle Fall\nJovanichester, MT 57098-0179', 'A-', 'reiciendis incidunt voluptatem', '208-989-7831', 'iste eos enim', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(91, 'Dr. Tyrese Hermiston', 'Terry', '40153699', '09623283', '1989-01-21', 'M', '(930) 697-8442', 'cschuppe@example.org', '5257 McKenzie Squares\nLeonardoland, AZ 13008', 'O+', 'nostrum minus aut', '(727) 679-0819', 'molestiae porro incidunt', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(92, 'Lavonne Konopelski PhD', 'McLaughlin', '41666291', '44507556', '2009-11-19', 'F', '(559) 470-3536', 'efeil@example.org', '28954 Elza Squares Apt. 582\nSchroederfurt, DC 98176-4538', 'O-', 'ut omnis voluptatem', '702.664.2666', 'fuga rerum ducimus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(93, 'Prof. Oswaldo Borer Jr.', 'Kautzer', '06292921', '14508716', '1979-06-11', 'M', '+1 (843) 751-9097', 'amira18@example.net', '3215 Smitham Locks\nNorth Jasen, ID 07818', 'B+', 'commodi modi reprehenderit', '(434) 913-4403', 'incidunt consequatur asperiores', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(94, 'Dr. Arielle McDermott', 'Ernser', '46104829', '75961851', '2009-01-14', 'F', '+1 (919) 999-4397', 'madison.feeney@example.com', '869 Ebert Extension\nFarrellborough, MO 93763-5371', 'A-', 'et laborum non', '701.472.4915', 'eos laudantium debitis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(95, 'Rollin Erdman', 'Stroman', '85889963', '34465258', '2016-04-07', 'M', '336-234-3892', 'nikita.monahan@example.org', '725 Dare Trace\nSouth Sierrabury, NE 76724', 'O-', 'pariatur illum sapiente', '484.737.2616', 'corrupti et possimus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(96, 'Maureen Collier PhD', 'Goyette', '48057561', '48757913', '2013-01-02', 'M', '815.450.6479', 'jonatan70@example.com', '646 Crystel Camp Suite 791\nBerrymouth, OR 61719', 'B-', 'blanditiis dolores voluptatem', '(203) 858-1808', 'repellendus vitae impedit', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(97, 'Mrs. Susan Hayes', 'Ullrich', '85769652', '66186106', '1983-05-16', 'M', '(909) 560-3528', 'berenice38@example.org', '15975 Wuckert Center Suite 770\nVonburgh, WV 61307', 'B+', 'deserunt est iure', '607.774.3899', 'voluptatem neque sed', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(98, 'Isac Hoppe', 'O\'Kon', '06340255', '77750730', '1977-01-07', 'M', '(216) 723-5284', 'belle34@example.org', '1639 Erich Skyway\nDavebury, CT 37376-3603', 'O-', 'aut similique voluptate', '+1.717.872.7354', 'ratione ea doloribus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(99, 'Mohammad Waters V', 'Buckridge', '04297133', '85836980', '2003-12-08', 'F', '+1.908.293.3022', 'wschimmel@example.com', '4298 Kolby Passage\nWest Nelleburgh, ME 67062-2989', 'A-', 'ipsa deserunt qui', '+1.754.398.7697', 'optio velit sed', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(100, 'Miss Faye Altenwerth', 'Kessler', '73565652', '04979414', '2005-03-03', 'M', '816.645.9443', 'ross.kuhic@example.org', '56620 Frances Gateway\nLake Parisland, NM 29562-3353', 'B-', 'in nulla natus', '(551) 616-4421', 'a aut id', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(101, 'Orin Walter', 'Quigley', '01496400', '68101550', '1972-11-09', 'F', '+1.276.468.9217', 'denesik.ola@example.net', '1564 Dell Trafficway Suite 881\nNew Orinfurt, NC 01603-4308', 'B-', 'consequuntur ex rerum', '754.265.9761', 'voluptas quia accusamus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(102, 'Mrs. Maude Lockman', 'Ruecker', '40418459', '72507006', '2005-07-12', 'F', '+1-719-316-6108', 'lucile.mraz@example.com', '224 Rodriguez Parks\nKilbackstad, MT 38693', 'B-', 'facilis earum culpa', '(218) 427-5040', 'corrupti dicta autem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(103, 'Ines Cassin', 'Greenfelder', '99492271', '76546182', '1993-03-05', 'M', '1-360-256-3092', 'rwolf@example.org', '3791 Sauer Shoals\nConroyland, NM 34492-7088', 'A+', 'tempora et temporibus', '540.531.7567', 'ut enim eos', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(104, 'Nadia Nikolaus', 'Torp', '49147993', '52643140', '2011-07-02', 'M', '1-256-795-6966', 'parker.branson@example.net', '4032 Mann Skyway Apt. 494\nSouth Bruceville, IA 84322', 'O-', 'nobis temporibus voluptas', '531-845-5553', 'in id esse', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(105, 'Carolyn Douglas', 'Flatley', '40730582', '72126435', '1975-04-25', 'F', '+1-351-868-1495', 'kuhlman.julio@example.net', '66860 Marian Terrace Suite 309\nLake Madonna, MD 81468', 'A+', 'molestias rem neque', '+1-940-959-9454', 'qui vel aut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(106, 'Prof. Adele Kiehn DDS', 'Will', '42831282', '81252671', '2006-07-11', 'F', '(661) 500-4642', 'metz.madisyn@example.net', '5380 Cummerata Lodge Apt. 524\nPort Ernesto, NE 74235-7227', 'A-', 'omnis id eum', '1-641-987-1788', 'expedita ex tenetur', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(107, 'Prof. Haskell Gerhold', 'Mayer', '80751023', '96133871', '1979-07-27', 'F', '+1-847-298-8237', 'jeramie.herzog@example.net', '90042 Huel Ports\nLake Evan, MO 52065', 'A-', 'ut in recusandae', '346.836.6215', 'facilis et et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(108, 'Vaughn Wilderman', 'Reinger', '34847095', '04986892', '2001-09-02', 'F', '510-581-4785', 'kobe06@example.com', '921 Morar Turnpike\nWallaceville, SD 23302', 'O-', 'architecto dignissimos voluptas', '+17324880147', 'non rerum qui', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(109, 'Harmony Beer', 'Haag', '53395540', '23151368', '1988-12-04', 'F', '984-601-3714', 'amos00@example.com', '36461 Dietrich Keys Apt. 660\nEast Chanelle, LA 27315-6047', 'A+', 'labore odio praesentium', '(209) 831-1966', 'corporis voluptas voluptatem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(110, 'Prof. Adonis Gleichner', 'Schulist', '38827067', '13193141', '1987-12-03', 'M', '(220) 386-2926', 'virginia.breitenberg@example.net', '8929 Dickinson Brooks Suite 728\nSouth Jorge, AK 84732', 'B+', 'et iure cupiditate', '254.290.2146', 'corporis aut et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(111, 'Mrs. Wilma Daugherty I', 'Gutmann', '97968824', '63883149', '2005-12-22', 'F', '+1.458.619.0615', 'genesis52@example.org', '9031 Carroll Plain Suite 772\nMonahanfurt, WI 44144-8465', 'O+', 'eligendi unde optio', '+1.445.647.1989', 'voluptates consequuntur inventore', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(112, 'Isabelle Koelpin', 'Bogisich', '82035304', '08626108', '2013-01-08', 'M', '+1-971-389-2595', 'brianne46@example.net', '6681 Marcelino Spurs\nAltenwerthtown, ND 89484', 'A-', 'quasi dolores recusandae', '928-331-5780', 'autem animi enim', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(113, 'Theron Watsica', 'Ortiz', '82995285', '57139208', '1983-05-09', 'F', '+1.580.539.7349', 'hobart69@example.org', '566 Alice Lake\nEast Krystina, TX 02797', 'B+', 'vel dolores alias', '(283) 385-4302', 'eos sint ut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(114, 'Willy Harvey', 'Turner', '67266656', '67045139', '1972-07-21', 'M', '240-941-8469', 'ron37@example.net', '5317 Hintz Union\nKeenanberg, CT 22699', 'A-', 'sunt minima neque', '+1-770-349-4679', 'vero voluptas officiis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(115, 'Lupe McCullough', 'Green', '03186759', '23051226', '2019-12-08', 'F', '580.719.9324', 'auer.elnora@example.com', '4878 Ebert Canyon Apt. 393\nDarrenchester, HI 42239', 'O-', 'consequuntur vero voluptatem', '561.767.5516', 'dolore voluptatum accusamus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(116, 'Stephan Aufderhar', 'Hagenes', '00853570', '05951810', '2009-02-14', 'F', '432.530.7078', 'gutkowski.joanne@example.net', '569 Floy Ville\nKerlukemouth, VA 08237', 'O+', 'numquam a aspernatur', '+1-813-381-2855', 'sunt neque ipsa', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(117, 'Kayleigh Osinski', 'Feeney', '66808865', '34939812', '2001-05-08', 'M', '217-730-8121', 'alejandrin.leannon@example.com', '270 Hegmann Valleys\nHalvorsonview, SC 82998', 'B-', 'rerum sunt accusantium', '+1 (320) 525-5427', 'perspiciatis non animi', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(118, 'Miss Neha Bode', 'Larkin', '37193848', '21868478', '1974-12-21', 'M', '+1-602-712-7764', 'yeffertz@example.com', '8431 Enola Road\nNorth Otiliachester, IA 52446-8780', 'A-', 'qui voluptatem minima', '1-360-693-8384', 'voluptatem laborum ut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(119, 'Dr. Erick Gusikowski', 'Doyle', '96196903', '63898383', '1992-05-04', 'F', '(803) 545-3910', 'jody98@example.org', '1760 Golden Run\nChelsieborough, KY 79142-0797', 'O-', 'dolore at eaque', '(559) 617-6983', 'sed natus adipisci', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(120, 'Clemmie Herman', 'Rice', '68712123', '73033142', '2017-06-19', 'M', '475-446-2964', 'mariane.boehm@example.org', '59046 Mohr Extensions\nHazlehaven, RI 30186', 'A-', 'amet eum qui', '1-682-574-8775', 'consectetur nesciunt expedita', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(121, 'Carli Zulauf V', 'Ruecker', '64204135', '11890671', '1975-10-26', 'M', '334.327.4451', 'alek.ernser@example.com', '6134 Sid Pine\nAudratown, MO 09647', 'O+', 'maxime optio neque', '+1.667.750.6156', 'qui molestias recusandae', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(122, 'Moses Macejkovic', 'Skiles', '29298793', '97681341', '2016-07-04', 'M', '364-921-8024', 'jesse20@example.com', '4759 Destiney Drive Suite 669\nNorth Beverlytown, OR 91657', 'O-', 'reprehenderit incidunt explicabo', '334.418.2139', 'dolores rerum consequatur', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(123, 'Bridget Hintz DDS', 'Koelpin', '51365508', '56332629', '2003-08-13', 'F', '+1-734-743-5225', 'kenyon.fay@example.org', '3658 Scarlett Junctions\nLennymouth, MS 60627-4951', 'A+', 'cumque neque quasi', '231-999-7623', 'placeat sapiente et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(124, 'Mr. Collin Wehner', 'Bogan', '67558638', '17818574', '1998-03-30', 'M', '+1-425-562-9061', 'mosciski.liliana@example.org', '7166 Okuneva Highway Apt. 223\nNorth Conor, IN 97461', 'B-', 'minima quo nam', '+1 (458) 678-1239', 'molestiae sed doloremque', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(125, 'Damien Nitzsche Jr.', 'Herman', '69984555', '41516269', '1997-08-16', 'F', '(682) 842-1552', 'jyundt@example.org', '2957 Collins Streets\nHeaneyburgh, UT 47384', 'B-', 'sint corporis neque', '559-387-7599', 'dolores dolore eligendi', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(126, 'Ms. Destinee Ondricka Jr.', 'Fahey', '65330128', '17953062', '1970-12-29', 'F', '(253) 416-1653', 'nova.wilkinson@example.org', '990 Marks Bridge\nLake Justice, DC 90316-5251', 'B+', 'sunt et doloremque', '+1 (854) 336-2017', 'rem officia inventore', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(127, 'Dr. Noemie Purdy DDS', 'Feest', '23355028', '00100315', '1977-06-25', 'M', '574.569.9186', 'jarrod.jaskolski@example.org', '361 Schiller Mall Suite 137\nBritneychester, KY 33218', 'O-', 'similique consequatur dicta', '+1 (925) 281-9227', 'et perferendis voluptatum', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(128, 'Prof. Walton Schneider', 'Deckow', '50711021', '47586922', '2004-10-02', 'M', '+1-872-290-4402', 'maximillia08@example.net', '8952 Sanford Island\nEast Janet, SD 32165', 'A+', 'eos quia mollitia', '1-754-851-1667', 'pariatur quibusdam et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(129, 'Miss Marguerite Goodwin MD', 'Renner', '57261055', '50796116', '2006-12-21', 'M', '505-407-8601', 'king.joel@example.com', '544 Ledner Estates\nWalshport, WY 21616-7652', 'A+', 'dicta nulla facilis', '972.445.8676', 'excepturi debitis maxime', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(130, 'Prof. Nikko Morar', 'Purdy', '30986328', '80744376', '2016-10-01', 'F', '(214) 702-3337', 'heloise.graham@example.org', '639 Dahlia Unions\nCamronfurt, MS 20601', 'A-', 'ex itaque qui', '870-930-2869', 'in officiis expedita', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(131, 'Mario Botsford', 'Block', '54719966', '39866536', '2007-05-14', 'M', '934-268-1531', 'marcelle68@example.net', '34705 Bode Plains Suite 161\nWest Verla, OH 68026-1176', 'B+', 'voluptas deleniti voluptatibus', '(432) 652-5576', 'ducimus explicabo et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(132, 'Samantha Abernathy', 'Beer', '38639134', '97532771', '1970-08-02', 'M', '838-354-7130', 'kbruen@example.org', '4734 Trenton Loop Suite 305\nNorth Kipville, NY 36112-4500', 'A-', 'qui corrupti error', '360-983-1303', 'minima autem tempora', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(133, 'Cleve Hermann', 'Ernser', '22341337', '65885235', '2010-02-09', 'M', '+1-412-769-0010', 'ana.sanford@example.org', '119 Dietrich Mill Apt. 285\nWest Anabellefort, HI 27912', 'A-', 'aut minus consequatur', '+12403023339', 'suscipit tempore iusto', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(134, 'Prof. Torey Hessel DDS', 'Kunze', '36265541', '93190008', '1978-08-17', 'M', '1-928-884-8141', 'ernest03@example.org', '46568 Kiehn Hill Apt. 757\nMetahaven, MA 92203', 'O-', 'qui distinctio placeat', '+1 (361) 237-2354', 'similique omnis aut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(135, 'Patsy Weissnat', 'Wisozk', '03338407', '47933120', '2015-08-21', 'F', '(580) 581-1103', 'jensen08@example.com', '76435 Donny Coves\nSchmittburgh, MA 84781', 'B-', 'et nihil labore', '+1-281-366-7538', 'explicabo sequi quia', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(136, 'Dr. Allene Jakubowski', 'Ryan', '00919437', '03118549', '2000-05-16', 'M', '(701) 265-6081', 'piper.oconner@example.com', '6379 Stark Drive\nChristiansenside, IN 32100-5048', 'B+', 'id quo quas', '1-432-969-9921', 'autem molestias eum', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(137, 'Prof. Reagan Feeney', 'Terry', '79729684', '27576822', '2006-07-14', 'F', '+12257400512', 'murray.brenda@example.com', '13521 Wilfredo Prairie Suite 128\nWisokyborough, DE 39564', 'O+', 'vero atque iusto', '+1.386.587.9172', 'praesentium modi dolorem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(138, 'Miss Margot Becker', 'Schultz', '11669056', '23859833', '1996-12-25', 'F', '(938) 455-6129', 'dmurphy@example.org', '13710 Bernita Shore Apt. 451\nKayliehaven, NV 36088-4050', 'O+', 'maxime voluptatem odit', '+17743305624', 'distinctio est voluptatem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(139, 'Prof. Joanne Durgan Jr.', 'Larkin', '47780688', '68668999', '1975-07-27', 'M', '(318) 523-3593', 'sim71@example.net', '5509 Mandy Dam\nStarkburgh, IN 17601-1251', 'A+', 'distinctio provident porro', '(361) 272-5547', 'et qui eum', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(140, 'Danyka Stark', 'Zemlak', '90233553', '50111821', '1973-01-13', 'M', '+1-479-708-9580', 'yhudson@example.com', '79438 Oma Drive Suite 062\nLake Elisamouth, MA 18466', 'B+', 'nam ea et', '314-877-9931', 'aperiam at et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(141, 'Wilma Fisher PhD', 'Upton', '37352002', '97285944', '2001-01-09', 'F', '+1-606-519-4322', 'twehner@example.net', '3510 Pfeffer Road Apt. 052\nEast Juston, ND 10589-9224', 'B+', 'possimus sed sunt', '541.219.1483', 'quaerat ipsa eius', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(142, 'Arno Tillman', 'Mayer', '58980290', '98474684', '1989-07-05', 'F', '(662) 906-9183', 'mina.terry@example.net', '1219 Stark Square Apt. 509\nNorth Edview, TN 39626-7399', 'O+', 'aperiam quia ut', '1-475-313-5015', 'velit aliquid neque', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(143, 'Hilma Walter', 'Grady', '15240464', '35013326', '1997-01-08', 'F', '463.326.5212', 'cale04@example.com', '739 Lebsack Viaduct Suite 343\nConnberg, AL 24530', 'B-', 'nihil labore eius', '+1-650-842-2886', 'officia ea et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(144, 'Veda Weissnat', 'Kuphal', '92570896', '45694334', '1993-11-02', 'M', '1-310-626-5745', 'qwitting@example.com', '71070 Hill Gardens Suite 136\nLake Evietown, MN 84879', 'A-', 'animi error sunt', '1-517-432-5112', 'ipsa nostrum illo', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(145, 'Peggie Nitzsche DDS', 'Smitham', '83760192', '81352348', '1993-03-15', 'M', '1-754-203-3394', 'walsh.mateo@example.net', '88515 Kuvalis Mission Suite 911\nPort Austynport, NV 87623', 'A-', 'quae aut inventore', '315.780.5642', 'quia exercitationem blanditiis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(146, 'Jorge Emmerich', 'Schaefer', '76263526', '78913347', '1977-02-07', 'M', '+1.240.754.6774', 'emmie20@example.com', '680 Schaden Hollow\nSpinkaton, IN 36635', 'A-', 'sit dolor ut', '+1.864.748.0152', 'voluptas consequatur facilis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(147, 'Cameron Frami', 'Runte', '33173217', '46492706', '2019-04-27', 'M', '253.700.3843', 'audra36@example.com', '3829 Bruce Coves Apt. 398\nEast Carmen, NJ 36399', 'O-', 'laudantium iure doloribus', '+1 (951) 435-4345', 'repudiandae magnam quia', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(148, 'Pinkie Nitzsche', 'Schroeder', '34895528', '08638618', '1984-11-05', 'M', '205.672.1151', 'bridget.kessler@example.com', '9727 Armstrong Curve\nLake Kareem, AK 12345', 'A-', 'vel dolorem qui', '+1-504-640-6675', 'pariatur sed hic', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(149, 'Vladimir Gutkowski', 'Lebsack', '24030273', '53816654', '1996-05-27', 'M', '858-983-5475', 'nbode@example.net', '3170 Little Turnpike\nEstellemouth, AK 67348-9039', 'A+', 'sed ratione perspiciatis', '1-929-321-5748', 'dolor enim quia', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(150, 'Gwendolyn Wolf', 'Nader', '67510373', '63346214', '2005-11-10', 'F', '640-850-6669', 'norn@example.net', '83668 Tyree Club\nWildermanfurt, OR 60706-2703', 'O-', 'earum dicta vitae', '814.438.3561', 'saepe odio officiis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(151, 'Prof. Clovis Reichel', 'Hessel', '79268007', '59868090', '1971-05-19', 'F', '+1 (423) 803-2889', 'adrain48@example.net', '64003 Murphy Common Suite 792\nTremaineborough, TX 43117-2964', 'B-', 'voluptates mollitia dolores', '716-728-1462', 'illum dolore qui', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(152, 'Robin Roberts', 'Waelchi', '18068965', '60816394', '1994-11-23', 'F', '1-918-569-3524', 'xvon@example.com', '133 Feil Forge Apt. 861\nNew Johanna, NJ 30779', 'B+', 'iure nulla aliquam', '(716) 919-7363', 'eveniet fuga et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(153, 'Tyson Crooks', 'Parker', '96932701', '04747861', '1984-05-15', 'F', '+1 (726) 446-6706', 'clifton05@example.org', '18177 Kareem Tunnel Suite 181\nKeelingville, IN 05012-4106', 'A-', 'aut voluptatem eius', '+1-302-527-7986', 'dolorem consequuntur aliquam', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(154, 'Itzel Lesch DDS', 'Nolan', '35542010', '24666744', '1974-03-17', 'M', '775.951.2827', 'srau@example.org', '463 Casper Spurs\nHaneburgh, CT 74237-4666', 'B-', 'dolorem iste consequatur', '+18086292688', 'et totam ut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(155, 'Mr. Monte Swaniawski', 'Strosin', '48414197', '72819138', '2010-04-15', 'F', '567.870.3270', 'cydney85@example.net', '5389 Steuber Passage Suite 082\nNorth Kayli, AR 87721', 'B+', 'quos veniam harum', '+13257815871', 'sint dolorum perspiciatis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(156, 'Mohamed Dach', 'Schuster', '33799223', '06054359', '1988-01-23', 'F', '1-743-917-4750', 'wschaefer@example.org', '596 Cecelia Path\nHerzogmouth, NH 97135-9393', 'B-', 'ut eum maxime', '970.451.8181', 'fuga eveniet iste', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(157, 'Dennis Bartoletti', 'Hill', '31144963', '64467030', '2011-11-03', 'M', '+1 (309) 261-7052', 'braeden29@example.com', '650 Georgette Way\nPort Jarviston, UT 68888', 'O+', 'ipsa ex voluptas', '947.454.8319', 'dignissimos nihil pariatur', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(158, 'Wava Yundt', 'Reichert', '53191209', '23620574', '2015-09-28', 'F', '+14359551062', 'lind.mariane@example.net', '81510 O\'Keefe Orchard Apt. 829\nNew Cortezfurt, TN 19253', 'B+', 'odio illum enim', '1-662-520-3389', 'ea voluptatem aliquam', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(159, 'Nathanael Tremblay', 'Aufderhar', '81672882', '31738545', '1974-02-03', 'M', '+1-740-814-2427', 'wkulas@example.com', '78873 Ebert Manors\nLillafort, WY 76783', 'O-', 'maxime libero architecto', '+1 (916) 759-5262', 'enim placeat ad', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(160, 'Cornell Denesik', 'Lowe', '06920734', '64408014', '1993-01-31', 'F', '442.218.0742', 'mohamed97@example.com', '464 Meaghan Valley\nPort Conrad, AK 80384-5018', 'B-', 'maxime deleniti iure', '283.493.6720', 'dolorem placeat quod', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(161, 'Roman Smith', 'Prohaska', '29526247', '66004094', '2013-02-15', 'M', '707-972-5960', 'odeckow@example.com', '55762 Grady Court\nSouth Genesischester, TN 16718', 'A+', 'est fugiat cumque', '608-422-6068', 'iste maiores recusandae', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(162, 'Ramon Kemmer', 'Rath', '57854881', '84602204', '2017-12-24', 'F', '+1.352.847.9978', 'mark.corkery@example.org', '14016 Hulda Underpass Apt. 392\nNorth Edythe, ID 77225-9227', 'A+', 'sit corporis sed', '+1.757.722.5747', 'amet ratione voluptatem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(163, 'Evie Kozey', 'Spinka', '25964137', '07106671', '1983-04-11', 'F', '502.987.0788', 'jadyn21@example.com', '64582 Grady Rest Apt. 793\nO\'Reillyfort, PA 70793-9824', 'A+', 'et sit iusto', '+1 (301) 848-7164', 'ab itaque minima', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(164, 'Prof. Dwight Jacobson Jr.', 'Auer', '61151136', '56950070', '1992-02-08', 'F', '(908) 710-2314', 'arnold25@example.net', '391 Reymundo Terrace\nPort Shawn, CT 63027-7583', 'B+', 'quia fuga reiciendis', '(828) 324-3552', 'officia exercitationem corporis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(165, 'Jermain Upton', 'Block', '80897147', '10191689', '2009-01-24', 'F', '+1-336-709-5193', 'amiya12@example.com', '345 Mraz Ranch Suite 602\nGarrettburgh, IL 88655-9118', 'O+', 'est repudiandae odio', '386-347-4440', 'quae minus aliquam', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(166, 'Melyna Stiedemann DVM', 'Kuhn', '48619777', '96472797', '2007-03-26', 'M', '+1.283.471.2785', 'vborer@example.net', '6899 Bruen Villages\nNorth Kaitlinfort, UT 88660-8787', 'O-', 'culpa libero debitis', '864.808.6553', 'qui aut eos', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(167, 'Ms. Lizzie Boyle V', 'Beahan', '97408768', '75527111', '2003-09-04', 'F', '(857) 959-8810', 'blanda.harry@example.net', '1165 Cordie Burgs\nNorbertoville, TN 74728-1861', 'A-', 'placeat qui exercitationem', '+1.267.641.6324', 'voluptas est fugit', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(168, 'Greyson McCullough', 'Lakin', '63475670', '29102202', '1992-07-23', 'F', '(838) 305-0567', 'erik45@example.com', '3811 Sigurd Plains\nCierrafurt, WA 13905-9497', 'A+', 'perspiciatis ut quos', '806.425.6123', 'assumenda ducimus dolores', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(169, 'Eldridge Blick', 'O\'Reilly', '09749649', '81704334', '2007-05-03', 'M', '+1 (769) 384-1964', 'kelsi64@example.com', '736 Edwina Drives Suite 255\nEast Russellton, NC 14617-1097', 'O-', 'magni et quia', '(956) 460-9380', 'ipsum nobis amet', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(170, 'Kailyn Bartoletti DVM', 'Barrows', '28414899', '08867834', '2011-11-01', 'M', '+19096638312', 'champlin.genesis@example.net', '519 Zieme Lock Suite 721\nTatummouth, NE 61189', 'A-', 'eveniet esse aut', '+1-657-518-7008', 'tenetur quam doloremque', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(171, 'Dr. Marjorie Greenholt PhD', 'Fay', '71340599', '51583866', '1979-01-19', 'M', '484-465-3155', 'emory.kling@example.org', '5715 Ullrich Rapids\nCassinborough, VA 60355-2222', 'A+', 'ipsum tempore odio', '+1 (432) 200-8450', 'amet tempore aperiam', '2025-03-25 06:15:43', '2025-03-25 06:15:43');
INSERT INTO `pacientes` (`id`, `nombres`, `apellidos`, `ci`, `nro_seguro`, `fecha_nacimiento`, `genero`, `celular`, `correo`, `direccion`, `grupo_sanguineo`, `alergias`, `contacto_emergencia`, `observaciones`, `created_at`, `updated_at`) VALUES
(172, 'Prof. Carol Wisoky', 'Barrows', '56340732', '82529943', '1987-12-15', 'M', '931-304-6562', 'michaela.leannon@example.net', '1135 Rossie Stream Apt. 093\nWest Lorenzofort, WY 89601', 'A+', 'ipsam illum labore', '(743) 637-7776', 'sapiente voluptas omnis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(173, 'Dr. Emmitt Doyle Sr.', 'Dicki', '64191077', '23047621', '2016-06-21', 'M', '1-325-398-1983', 'tristian48@example.net', '56395 Pfannerstill Bypass Suite 759\nLake Ulises, OR 06335', 'B+', 'modi alias ratione', '949.218.3695', 'nihil perferendis natus', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(174, 'Ottilie Stark', 'Bednar', '26124908', '40964457', '1975-02-06', 'M', '848.934.7664', 'oswaniawski@example.net', '6397 Sanford Valleys\nNorth Adeline, OH 16902', 'O-', 'assumenda rerum rem', '+19165220779', 'totam aut et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(175, 'Miss Margarett Nienow', 'Konopelski', '46115292', '26641391', '1972-01-04', 'F', '1-864-818-1055', 'allene35@example.org', '43712 Pamela Fort Suite 505\nOrnfurt, VT 08888', 'A-', 'eum magni rerum', '1-332-891-0664', 'nulla voluptates et', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(176, 'Caesar Von', 'Nienow', '47412457', '27120706', '1991-02-16', 'F', '843-646-0567', 'jacobs.berniece@example.org', '164 Arnoldo Pines\nEdythefurt, IL 21274', 'O-', 'consequatur similique ut', '1-618-366-3762', 'fugit optio reiciendis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(177, 'Nona Mayert III', 'Collier', '95856375', '76862969', '1983-12-15', 'F', '320-572-6073', 'rashad18@example.net', '957 Rudolph Heights Suite 972\nGoodwinton, AL 34559', 'B+', 'iusto occaecati ut', '(812) 233-2727', 'qui quis magni', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(178, 'Tobin Schaefer', 'Ebert', '82730489', '53723690', '1989-02-13', 'M', '878-813-2148', 'jlangosh@example.net', '5429 Sauer Turnpike Apt. 969\nWest Lolita, HI 33619-0458', 'A-', 'occaecati voluptatem et', '(580) 528-7249', 'magni nihil sequi', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(179, 'Julianne Berge', 'Lakin', '89207481', '71324811', '1996-11-06', 'F', '(503) 830-9834', 'will21@example.com', '4968 Arch Inlet\nLake Kylieberg, IN 65478-4272', 'O-', 'ipsa vel voluptas', '445.699.4420', 'reprehenderit quis quam', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(180, 'Sydnee Mueller', 'Block', '64456018', '01036892', '2002-06-24', 'M', '443.504.4223', 'katlynn10@example.net', '209 Tremblay Branch\nNew Nikitaland, TX 32698', 'A+', 'excepturi beatae repellendus', '+1-520-898-4739', 'rem fugiat perspiciatis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(181, 'Adah Kub', 'Paucek', '58888301', '00267075', '1973-06-03', 'M', '+1.832.316.5704', 'kautzer.gerry@example.org', '154 Angel Burgs\nPfannerstillberg, SD 33394', 'A+', 'quis facilis non', '407-624-9654', 'dignissimos et dolore', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(182, 'Orville Sauer', 'Rippin', '92679287', '70803586', '1977-08-27', 'M', '1-913-886-0500', 'gaylord.freddy@example.org', '34944 Jameson Ramp\nYazminton, IA 03506', 'A-', 'eum consequuntur voluptatem', '+1.341.292.7192', 'ut maxime voluptatem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(183, 'Amelia Conroy', 'Langosh', '62165865', '99428158', '1998-09-21', 'M', '+18287296948', 'lillian47@example.com', '10250 Lemke Forks\nMarvinborough, AR 98054', 'O-', 'aut aliquam deserunt', '+1.561.761.5603', 'est eaque quisquam', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(184, 'Jessy Durgan', 'Nader', '24476757', '16799467', '2004-12-25', 'F', '+1-618-399-2482', 'lowe.walker@example.net', '39016 Pagac Green Apt. 258\nNew Ettieborough, WY 73586-0323', 'O+', 'sit sint beatae', '(380) 545-8527', 'optio facilis asperiores', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(185, 'Mrs. Madeline Schroeder', 'Doyle', '79725737', '19084752', '1987-12-17', 'F', '(707) 953-1205', 'xmoore@example.org', '539 Ansel Brooks\nNew Braxtonbury, PA 58989-5044', 'B+', 'dolorem laudantium dolor', '539.519.1107', 'dignissimos omnis asperiores', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(186, 'Dr. Katelyn Keeling PhD', 'Lindgren', '14841270', '68652775', '2015-01-25', 'F', '1-310-718-2185', 'treva08@example.com', '7572 Cindy Ford\nBritneyport, MI 03961', 'B-', 'commodi neque velit', '+1-361-238-5133', 'ut ipsa voluptatem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(187, 'Dion Moen', 'Predovic', '07880370', '49145614', '1992-02-13', 'M', '+1-308-744-5688', 'ratke.elmira@example.org', '934 Alvera Roads Suite 213\nWest Ezra, NH 92244-5545', 'O-', 'et quae iusto', '559.896.3583', 'voluptatibus necessitatibus dolorem', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(188, 'Dylan Lemke', 'Mosciski', '24406114', '52963798', '1970-07-03', 'F', '+1 (662) 816-7803', 'hershel.kozey@example.net', '3215 Lehner Place\nSouth Clifton, AR 59174-4071', 'B-', 'facilis quos fugiat', '269-967-7390', 'in eos occaecati', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(189, 'Ivory Bartoletti', 'Keeling', '30687392', '05990364', '2007-03-23', 'M', '1-878-739-4261', 'cristal53@example.org', '53107 Harber Mews Suite 569\nJaylenbury, AL 98991', 'B+', 'nulla ut dicta', '351-985-3459', 'modi voluptates vel', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(190, 'Louisa Wiza', 'Huel', '21247580', '05417987', '1977-02-03', 'M', '+1.516.435.9445', 'ward.scot@example.net', '279 Botsford Ports\nEast Crawfordton, MA 98804-7969', 'O+', 'iste eaque ab', '1-781-461-2170', 'aut repudiandae consectetur', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(191, 'Mrs. Alvena Kertzmann III', 'West', '32334775', '46398165', '1997-03-20', 'F', '678-775-5147', 'tdicki@example.org', '62521 Sauer Valley Suite 598\nSouth Paula, UT 93381', 'A+', 'nihil quod et', '+1-918-965-3203', 'quia ipsum omnis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(192, 'Peyton Fay', 'Reichel', '49771481', '14694791', '2000-03-22', 'F', '1-352-997-2720', 'jbrakus@example.net', '21960 Clovis Alley\nAftonton, FL 49280', 'B-', 'expedita illum ea', '(484) 820-9058', 'et expedita deleniti', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(193, 'Tommie Lebsack', 'Prohaska', '01229379', '40581659', '2014-05-18', 'M', '+1.423.302.8788', 'ushanahan@example.com', '705 Abigayle Throughway\nJamaalland, MS 08476-7635', 'O-', 'aut blanditiis itaque', '+1-551-356-4417', 'qui sunt ea', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(194, 'Mohammad Sporer Sr.', 'Gleason', '92037470', '07730292', '2004-08-20', 'F', '+1-509-653-1674', 'queenie12@example.com', '3961 Russel Mountains Apt. 191\nPort Joanyland, AR 09243', 'B-', 'neque quasi vitae', '719.572.3045', 'est ea iure', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(195, 'Miss Luna Haley', 'Terry', '23432806', '26367193', '1973-05-01', 'F', '(434) 556-9283', 'cmayer@example.net', '461 Kuhn Island Suite 823\nUriahfort, TX 47203-5827', 'B+', 'rem est maiores', '1-262-712-1650', 'perspiciatis impedit quibusdam', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(196, 'Mara Marquardt', 'Marks', '92293961', '08649297', '1987-08-04', 'F', '(331) 549-8334', 'kathryne89@example.org', '1260 Naomi Fork Apt. 621\nJuanitashire, MD 59590-2664', 'B+', 'sunt et deserunt', '+1 (678) 485-3754', 'omnis in consequatur', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(197, 'Gonzalo Russel', 'Kshlerin', '74849526', '29770595', '1997-10-06', 'F', '+1-820-931-8279', 'cydney.beer@example.org', '58631 Harber Dale\nFannieland, NE 06329-7098', 'A-', 'qui nihil earum', '947.738.8968', 'aspernatur rerum facilis', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(198, 'Prof. Frieda Erdman DVM', 'Turcotte', '54356280', '15575144', '1976-03-31', 'F', '+12022868847', 'stephania21@example.org', '7313 Yundt Track\nBrianashire, WY 72944', 'B-', 'nulla possimus est', '+17728223567', 'consequatur nostrum aut', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(199, 'Nat Roberts', 'Cremin', '10777926', '51631062', '2008-09-09', 'F', '+12208863825', 'adelia60@example.com', '5141 Kristopher Square Apt. 637\nWest Vivianne, NJ 12585-7356', 'B-', 'qui dolorem in', '+1-606-487-7547', 'et non iure', '2025-03-25 06:15:43', '2025-03-25 06:15:43'),
(200, 'Stephon Tromp', 'Grady', '49727843', '55654400', '1981-10-22', 'M', '346.460.0314', 'lhickle@example.org', '525 Leta Mountain Apt. 608\nWest Austenshire, TN 83010-2800', 'A+', 'ducimus animi cupiditate', '+1.248.968.5273', 'est dolorem aut', '2025-03-25 06:15:43', '2025-03-25 06:15:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `descripcion` varchar(191) NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `monto`, `fecha_pago`, `descripcion`, `paciente_id`, `doctor_id`, `created_at`, `updated_at`) VALUES
(1, 500.00, '2025-04-08', 'Primer pago de formato del permiso de trabajo', 21, 1, '2025-04-09 04:56:50', '2025-04-09 04:56:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.index', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(2, 'admin.usuarios.index', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(3, 'admin.usuarios.create', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(4, 'admin.usuarios.store', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(5, 'admin.usuarios.show', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(6, 'admin.usuarios.edit', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(7, 'admin.usuarios.update', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(8, 'admin.usuarios.confirmDelete', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(9, 'admin.usuarios.destroy', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(10, 'admin.configuraciones.index', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(11, 'admin.configuraciones.create', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(12, 'admin.configuraciones.store', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(13, 'admin.configuraciones.show', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(14, 'admin.configuraciones.edit', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(15, 'admin.configuraciones.update', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(16, 'admin.configuraciones.confirmDelete', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(17, 'admin.configuraciones.destroy', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(18, 'admin.secretarias.index', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(19, 'admin.secretarias.create', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(20, 'admin.secretarias.store', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(21, 'admin.secretarias.show', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(22, 'admin.secretarias.edit', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(23, 'admin.secretarias.update', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(24, 'admin.secretarias.confirmDelete', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(25, 'admin.secretarias.destroy', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(26, 'admin.pacientes.index', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(27, 'admin.pacientes.create', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(28, 'admin.pacientes.store', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(29, 'admin.pacientes.show', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(30, 'admin.pacientes.edit', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(31, 'admin.pacientes.update', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(32, 'admin.pacientes.confirmDelete', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(33, 'admin.pacientes.destroy', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(34, 'admin.consultorios.index', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(35, 'admin.consultorios.create', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(36, 'admin.consultorios.store', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(37, 'admin.consultorios.show', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(38, 'admin.consultorios.edit', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(39, 'admin.consultorios.update', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(40, 'admin.consultorios.confirmDelete', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(41, 'admin.consultorios.destroy', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(42, 'admin.doctores.index', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(43, 'admin.doctores.create', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(44, 'admin.doctores.store', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(45, 'admin.doctores.show', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(46, 'admin.doctores.edit', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(47, 'admin.doctores.update', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(48, 'admin.doctores.confirmDelete', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(49, 'admin.doctores.destroy', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(50, 'admin.doctores.reportes', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(51, 'admin.doctores.pdf', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(52, 'admin.horarios.index', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(53, 'admin.horarios.create', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(54, 'admin.horarios.store', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(55, 'admin.horarios.show', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(56, 'admin.horarios.edit', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(57, 'admin.horarios.update', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(58, 'admin.horarios.confirmDelete', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(59, 'admin.horarios.destroy', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(60, 'admin.horarios.cargar_datos_consultorios', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(61, 'cargar_datos_consultorios', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(62, 'cargar_reserva_doctores', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(63, 'ver_reservas', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(64, 'admin.eventos.create', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(65, 'admin.eventos.destroy', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(66, 'admin.reservas.reportes', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(67, 'admin.reservas.pdf', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(68, 'admin.reservas.pdf_fechas', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(69, 'admin.historial.index', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(70, 'admin.historial.create', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(71, 'admin.historial.store', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(72, 'admin.historial.pdf', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(73, 'admin.historial.show', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(74, 'admin.historial.edit', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(75, 'admin.historial.update', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(76, 'admin.historial.confirmDelete', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(77, 'admisn.historial.destroy', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(78, 'admin.historial.buscar_paciente', 'web', '2025-03-25 06:15:41', '2025-03-25 06:15:41'),
(79, 'admin.historial.imprimir_historial', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(80, 'admin.pagos.index', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(81, 'admin.pagos.create', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(82, 'admin.pagos.store', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(83, 'admin.pagos.pdf', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(84, 'admin.pagos.show', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(85, 'admin.pagos.edit', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(86, 'admin.pagos.update', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(87, 'admin.pagos.confirmDelete', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(88, 'admin.pagos.destroy', 'web', '2025-03-25 06:15:42', '2025-03-25 06:15:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(2, 'secretaria', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(3, 'doctor', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(4, 'paciente', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40'),
(5, 'usuario', 'web', '2025-03-25 06:15:40', '2025-03-25 06:15:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 5),
(62, 1),
(62, 5),
(63, 1),
(63, 5),
(64, 1),
(64, 5),
(65, 1),
(65, 5),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(69, 3),
(70, 1),
(70, 3),
(71, 1),
(71, 3),
(72, 1),
(72, 3),
(73, 1),
(73, 3),
(74, 1),
(74, 3),
(75, 1),
(75, 3),
(76, 1),
(76, 3),
(77, 1),
(77, 3),
(78, 1),
(78, 3),
(79, 1),
(79, 3),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretarias`
--

CREATE TABLE `secretarias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `ci` varchar(100) NOT NULL,
  `celular` varchar(100) NOT NULL,
  `fecha_nacimiento` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `secretarias`
--

INSERT INTO `secretarias` (`id`, `nombres`, `apellidos`, `ci`, `celular`, `fecha_nacimiento`, `direccion`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Secretaria', '1', '111111', '777777777', '10/10/2000', 'Zona Miraflores calle 5', 2, '2025-03-25 06:15:42', '2025-03-25 06:15:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@admin.com', NULL, '$2y$10$W2zjun2I5ORjvnWq9lvG..iLkfeo./ukATFDcl6MXU92Ard5XgwFu', NULL, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(2, 'Secretaria', 'secretaria@admin.com', NULL, '$2y$10$x3qsUk929YOU14UZKF/9KO6gXDgDZ9OIqJJcoFkYdddK7vg0Pb3Ea', NULL, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(3, 'Doctor1', 'doctor1@admin.com', NULL, '$2y$10$hUvfJlLBcXuCTAnUacfj7.va03qvoDs/E1nPp/8CKa4h/mj.UFLlG', NULL, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(4, 'Doctor2', 'doctor2@admin.com', NULL, '$2y$10$z6BU1jfxnWHXBglnzpVvuuAXUEUNkiqezS0Z1vP.1hbo6VABYtRZ2', NULL, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(5, 'Doctor3', 'doctor3@admin.com', NULL, '$2y$10$1uY9nxsinAWS2rdHev/0L.OzDMvw.i6g2.odc8173RsyyoLKgAZua', NULL, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(6, 'Paciente1', 'paciente1@admin.com', NULL, '$2y$10$BoX5.1JbfqY5lFn4lKdDyOwaDLAgceCYrQHdHokRPfoR8FR7rWOgC', NULL, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(7, 'Usuario1', 'usuario1@admin.com', NULL, '$2y$10$hB2FnvtfUl369cQi29kFFeqqbKiJCPq7PScpppss1Leq6qcfKm2Aq', NULL, '2025-03-25 06:15:42', '2025-03-25 06:15:42'),
(10, 'Abraham', 'abraham@gmail.com', NULL, '$2y$10$FZeg4wfG.3YChjKYLcroFu.d2AMVHsgww1Hmlue21cCCKePMtxFi2', NULL, '2025-03-30 19:01:41', '2025-03-30 19:01:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`),
  ADD KEY `events_doctor_id_foreign` (`doctor_id`),
  ADD KEY `events_consultorio_id_foreign` (`consultorio_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `historials`
--
ALTER TABLE `historials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historials_paciente_id_foreign` (`paciente_id`),
  ADD KEY `historials_doctor_id_foreign` (`doctor_id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `horarios_doctor_id_foreign` (`doctor_id`),
  ADD KEY `horarios_consultorio_id_foreign` (`consultorio_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pacientes_ci_unique` (`ci`),
  ADD UNIQUE KEY `pacientes_nro_seguro_unique` (`nro_seguro`),
  ADD UNIQUE KEY `pacientes_correo_unique` (`correo`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagos_paciente_id_foreign` (`paciente_id`),
  ADD KEY `pagos_doctor_id_foreign` (`doctor_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `secretarias`
--
ALTER TABLE `secretarias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `secretarias_ci_unique` (`ci`),
  ADD KEY `secretarias_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historials`
--
ALTER TABLE `historials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `secretarias`
--
ALTER TABLE `secretarias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_consultorio_id_foreign` FOREIGN KEY (`consultorio_id`) REFERENCES `consultorios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historials`
--
ALTER TABLE `historials`
  ADD CONSTRAINT `historials_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historials_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_consultorio_id_foreign` FOREIGN KEY (`consultorio_id`) REFERENCES `consultorios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `horarios_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pagos_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `secretarias`
--
ALTER TABLE `secretarias`
  ADD CONSTRAINT `secretarias_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
