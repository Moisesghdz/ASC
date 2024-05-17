-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2024 a las 23:11:27
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
-- Base de datos: `medidor_agua`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE `consumo` (
  `id` int(11) NOT NULL,
  `flujo` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consumo`
--

INSERT INTO `consumo` (`id`, `flujo`, `fecha`, `usuario_id`) VALUES
(1350, 0, '2024-05-17 03:42:32', 0),
(1351, 0, '2024-05-17 03:42:36', 0),
(1352, 0, '2024-05-17 03:42:39', 0),
(1353, 0, '2024-05-17 03:42:42', 0),
(1354, 0, '2024-05-17 03:42:44', 0),
(1355, 0, '2024-05-17 03:42:47', 0),
(1356, 0, '2024-05-17 03:42:50', 0),
(1357, 0, '2024-05-17 03:42:53', 0),
(1358, 0, '2024-05-17 03:42:56', 0),
(1359, 0, '2024-05-17 03:42:59', 0),
(1360, 0, '2024-05-17 03:43:02', 0),
(1361, 0, '2024-05-17 03:43:05', 0),
(1362, 0, '2024-05-17 03:43:08', 0),
(1363, 0, '2024-05-17 03:43:11', 0),
(1364, 0, '2024-05-17 03:43:14', 0),
(1365, 0, '2024-05-17 03:43:20', 0),
(1366, 0, '2024-05-17 03:43:23', 0),
(1367, 0, '2024-05-17 03:43:26', 0),
(1368, 0, '2024-05-17 03:43:29', 0),
(1369, 0, '2024-05-17 03:43:32', 0),
(1370, 0, '2024-05-17 03:43:35', 0),
(1371, 0, '2024-05-17 03:43:38', 0),
(1372, 0, '2024-05-17 03:43:41', 0),
(1373, 0, '2024-05-17 03:43:45', 0),
(1374, 0, '2024-05-17 03:43:49', 0),
(1375, 0, '2024-05-17 03:43:52', 0),
(1376, 0, '2024-05-17 03:43:55', 0),
(1377, 0, '2024-05-17 03:43:58', 0),
(1378, 0, '2024-05-17 03:44:01', 0),
(1379, 0, '2024-05-17 03:44:04', 1),
(1380, 0, '2024-05-17 03:44:06', 1),
(1381, 0, '2024-05-17 03:44:09', 1),
(1382, 0, '2024-05-17 03:44:13', 1),
(1383, 0, '2024-05-17 03:44:17', 1),
(1384, 0, '2024-05-17 03:44:21', 1),
(1385, 0, '2024-05-17 03:44:24', 1),
(1386, 0, '2024-05-17 03:44:27', 1),
(1387, 0, '2024-05-17 03:44:30', 1),
(1388, 0, '2024-05-17 03:44:33', 1),
(1389, 0, '2024-05-17 03:44:36', 1),
(1390, 0, '2024-05-17 03:44:39', 1),
(1391, 0, '2024-05-17 03:44:42', 1),
(1392, 0, '2024-05-17 03:44:45', 1),
(1393, 0, '2024-05-17 03:51:25', 0),
(1394, 0, '2024-05-17 03:51:29', 0),
(1395, 0, '2024-05-17 03:51:33', 0),
(1396, 0, '2024-05-17 03:51:36', 0),
(1397, 0, '2024-05-17 03:51:39', 0),
(1398, 0, '2024-05-17 03:51:42', 0),
(1399, 0, '2024-05-17 03:51:45', 0),
(1400, 0, '2024-05-17 03:51:48', 0),
(1401, 0, '2024-05-17 03:51:51', 0),
(1402, 0, '2024-05-17 03:51:54', 0),
(1403, 0, '2024-05-17 03:51:57', 0),
(1404, 0, '2024-05-17 03:52:00', 0),
(1405, 0, '2024-05-17 03:52:03', 0),
(1406, 0, '2024-05-17 03:52:06', 0),
(1407, 0, '2024-05-17 03:52:52', 1),
(1408, 0, '2024-05-17 03:52:55', 1),
(1409, 0, '2024-05-17 03:52:59', 1),
(1410, 0, '2024-05-17 03:53:02', 1),
(1411, 0, '2024-05-17 03:53:05', 1),
(1412, 0, '2024-05-17 03:53:08', 1),
(1413, 0, '2024-05-17 03:53:11', 1),
(1414, 0, '2024-05-17 03:53:14', 1),
(1415, 0, '2024-05-17 03:53:17', 1),
(1416, 0, '2024-05-17 03:53:20', 1),
(1417, 0, '2024-05-17 03:53:23', 1),
(1418, 0, '2024-05-17 03:53:26', 1),
(1419, 0, '2024-05-17 03:53:28', 1),
(1420, 0, '2024-05-17 03:53:31', 1),
(1421, 0, '2024-05-17 03:53:34', 1),
(1422, 0, '2024-05-17 03:53:37', 1),
(1423, 0, '2024-05-17 04:08:59', 1),
(1424, 0, '2024-05-17 04:09:03', 1),
(1425, 0, '2024-05-17 04:09:07', 1),
(1426, 0, '2024-05-17 04:09:10', 1),
(1427, 0, '2024-05-17 04:09:14', 1),
(1428, 0, '2024-05-17 04:09:17', 1),
(1429, 0, '2024-05-17 04:09:22', 1),
(1430, 0, '2024-05-17 04:09:26', 1),
(1431, 0, '2024-05-17 04:09:29', 1),
(1432, 0, '2024-05-17 04:09:32', 1),
(1433, 0, '2024-05-17 04:10:30', 1),
(1434, 0, '2024-05-17 04:10:34', 1),
(1435, 0, '2024-05-17 04:10:37', 1),
(1436, 0, '2024-05-17 04:10:39', 1),
(1437, 0, '2024-05-17 04:10:42', 1),
(1438, 0, '2024-05-17 04:10:46', 1),
(1439, 0, '2024-05-17 04:10:49', 1),
(1440, 0, '2024-05-17 04:10:52', 1),
(1441, 0, '2024-05-17 04:10:56', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_control`
--

CREATE TABLE `nivel_control` (
  `id` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nivel_control`
--

INSERT INTO `nivel_control` (`id`, `nivel`, `fecha`) VALUES
(1, 255, '2024-05-17 03:56:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contrasena`) VALUES
(1, 'Moises', '$2y$10$.vGA1O9wmRjrwAVXD98HNOgsNpDczlqm3Jq7KnEd1rVAGv3Fykk1a');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nivel_control`
--
ALTER TABLE `nivel_control`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consumo`
--
ALTER TABLE `consumo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1442;

--
-- AUTO_INCREMENT de la tabla `nivel_control`
--
ALTER TABLE `nivel_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
