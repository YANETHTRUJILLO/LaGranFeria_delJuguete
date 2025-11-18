-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2025 a las 03:21:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `la_gran_feria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `cdped` int(11) NOT NULL,
  `cdusu` int(11) NOT NULL,
  `cdpro` int(11) NOT NULL,
  `fchped` datetime NOT NULL,
  `estado` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `dirpedusu` varchar(50) NOT NULL,
  `celusuped` varchar(15) NOT NULL,
  `sub_total` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`cdped`, `cdusu`, `cdpro`, `fchped`, `estado`, `cantidad`, `dirpedusu`, `celusuped`, `sub_total`) VALUES
(5, 1, 1, '2023-12-02 09:04:34', 2, 2, '', '', 0.000),
(7, 1, 5, '2023-12-02 09:07:17', 2, 1, '', '', 0.000),
(10, 1, 1, '2025-11-03 15:53:56', 2, 1, '', '', 0.000),
(11, 1, 8, '2025-11-03 15:54:20', 2, 1, '', '', 0.000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cdpro` int(11) NOT NULL,
  `nopro` varchar(50) DEFAULT NULL,
  `despro` varchar(100) DEFAULT NULL,
  `costpro` decimal(10,3) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `rutimg` varchar(100) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `descrip` varchar(1000) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cdpro`, `nopro`, `despro`, `costpro`, `estado`, `rutimg`, `stock`, `descrip`, `marca`, `color`) VALUES
(1, 'Cocina', 'Mi Cocina Divertida Luz y Sonido con Accesorios', 235.500, 1, 'co1.jpg', 6, '\nCon esta fantástica Cocina tu pequeña podrá divertirse en grande. Este divertido juguete incluye 27 accesorios y cuenta con luz y sonido que seguro le encantará a tu hija y así podrá recrear lindas y entretenidas aventuras. ', 'Disney Princesa', 'Rosado'),
(2, 'Lego', 'Set Minecraft El Arrecife de Coral - Lego', 85.000, 1, 'lego1.png', 5, 'Este cautivador set Minecraft lleva a los niños a una trepidante misión llena de desafíos en las profundidades del océano. Deberán construir un monumento en medio del vistoso arrecife de coral y encontrar un tesoro oculto. Esta aventura de bloques LEGO le ofrece a los niños un juego creativo y lleno de diversión.', 'Lego', 'Azul'),
(3, 'Gimnasio para Beb&eacute', 'Gimnasio de Actividades para Beb&eacute; Desmontable 5 en 1', 335.999, 1, 'bb1.jpg', 4, 'Un gimnasio didáctico es un elemento ideal para el entretenimiento y desarrollo de los niños, un espacio donde podrá moverse libremente y aprender a darse vuelta, que le ayudará a desarrollar destrezas para alcanzar cosas y fortalecer sus músculos, mejorar la coordinación ojos y manos y estimular sus habilidades sensoriales y cognoscitivas.', 'Fisher Price', 'Verde'),
(4, 'Pista Hot Wheels', 'Pista de Juguete S&uacute;per Estaci&oacuten de Bomberos', 150.000, 1, 'pista.png', 6, '¡El set de juego Estación de bomberos superloop de Hot Wheels City ofrece a los niños un loop ajustable de varios niveles que impulsa los carros de juguete a través de la estación y por una rampa transparente, como de agua.\n\nLa base cuenta con emocionantes detalles de juego de pistas que inspiran historias creativas y conectores para combinarla con otros sets de Hot Wheels. Se incluye un camión de bomberos.', 'Hot Wheels', 'Rojo'),
(5, 'Casa de Barbie', 'Set de Juegos - Nueva Casa de los Sue&ntilde;os de Barbie', 385.500, 1, 'casa.webp', 3, 'Las niñas pueden ser anfitrionas de la mejor fiesta en la piscina con la Casa de los Sueños de Barbie. Esta casa de muñecas de lujo tiene el tobogán más alto de la serie Casa de los Sueños de Barbie hasta la fecha, con un diseño en espiral de tres pisos para una diversión sinfín bajo el sol.', 'Barbie ', 'Rosado'),
(6, 'Batidora M&aacute;gica', 'Creaciones de cocina Play-Doh  Batidora M&aacute;gica', 79.999, 1, 'batidora.png', 12, 'Crea increíbles pastelitos, galletas y tartas de juguete con la Batidora mágica Play-Doh de Kitchen Creations. Los aspirantes a pasteleros pueden jugar a hornear muchas golosinas colocando 1 de las bandejas de moldes Play-Doh en el bol removible, rellenando cada molde con masa para moldear y bajando la palanca para estampar raras galletas y tartas con formas alocadas.', 'Play-Doh', 'Rojo'),
(7, 'Carro Control', 'Carro Speed Pioner Negro y Naranja', 185.900, 1, 'carro.png', 4, 'Este fabuloso Carro llenara de emoción y diversión todos los momentos de juego de tu pequeño. Su diseño con Radio Control y una velocidad máxima de 20 Km/h, le permitirá a tu hijo un juego más entretenido y realista en todo momento. Sorprende a tu niño con este maravilloso juguete y ¡Anímate a llevarlo ahora! Recomendado para niños mayores de 8 años.', 'Kiddoh', 'Naranja'),
(8, 'Caminador 3 en 1', 'Caminador 3 en 1 Multicolor- Litttle Tike - 70 actividades.', 485.900, 1, 'Caminador.png', 5, 'Este lindo Andador 3 en 1 es todo lo que tu bebé necesita para disfrutar de todo un centro de actividades que seguro le encantaran. Incluye hasta 70 actividades, además de sonidos y canciones. Este juguete es ideal para estimular las habilidades motoras gruesas y finas, la reacción causa - efecto y la coordinación y confianza de los bebés.', 'Little Tikes', 'Verde'),
(9, 'Tapete Armable', 'Tapete M&aacute;gico N&uacute;meros- incluye 9 L&aacute;minas en Espuma.', 45.000, 1, 'tapete.png', 7, 'Tu hijo disfrutará jugando en este Tapete de 9 láminas con divertidos motivos y llamativos colores. Es ideal para la decoración y adecuación de las habitaciones o espacios de juego de tu pequeño, además está elaborado en materiales de alta calidad, y lo mejor es que tiene fichas encajables tipo rompecabezas para que se sienta cómodo y seguro en cualquier ocasión', 'Ronda ', 'Multicolor'),
(10, 'Mascota Electr&oacute;nica', 'Mascota Electr&oacute;nica Fur Real Friends Poopalots.', 129.900, 1, 'Mascota.png', 5, '¿Qué es más divertido que pasear a una mascota? ¡Pasear a una que hace popó! Dale a este divertido perrito unas cuantas comiditas (incluidas), luego arma y ponle la correa para llevarla a pasear. ', 'Furreal', 'Cafe'),
(11, 'Bicicleta Impulso', 'Bicicleta Impulso Balance Bike Paw Patrol- Color Azul', 458.000, 1, 'bicicleta.jpg', 9, 'Bicicleta sin pedales, diseñada para el aprendizaje de los niños, promueve el desarrollo cognitivo como el equilibrio, la agilidad, los reflejos y la coordinación de una manera muy segura. Decorada con motivos y colores de Paw Patrol uno de los personajes favoritos de los pequeños.', 'Micro', 'Azul'),
(12, 'Ba&ntilde;era Beb&eacute', 'Ba&ntilde;era Beb&eacute; Plegable Bium Gris', 245.000, 1, 'tina.jpg', 4, 'La bañera plegable de BIUM facilitará la tarea de bañar al bebé en cualquier momento y lugar, su sistema abatible que es posible gracias a su estructura con páneles intercalados de silicona y PP permite plegarla y desplegarla muy facilmente. Además de práctica es segura ya que cuenta con un sistema de alerta en el tapón de desagüe, este cambia de color a blanco si el agua está por sobre los 37ºC que es la temperatura máxima ideal para la delicada piel de los pequeños.', 'Bium', 'Gris'),
(13, 'Scooter', 'Scooter Maxi Deluxe Negro/Naranja - Micro', 459.900, 1, 'Scooter .png', 1, 'El Scooter Maxi Deluxe es el regalo perfecto para niños y niñas aventureros, que disfruten de los juegos al aire libre. Además, el cuerpo anodizado resistente, un tabla de gran agarre y un manubrio ajustable garantizan que el scooter crezca a la par que tu hijo.', 'Micro', 'Negro'),
(14, 'Rompecabezas Playa', 'Rompecabezas amanecer tropical - 1500 Piezas', 52.900, 1, 'rompecabeza.webp', 24, 'Ejercita tu mente, desarrolla tu capacidad de análisis y síntesis, tu coordinación óculo-manual y tu visión espacial con este increíble rompecabezas. Incluye 1500 piezas para que viajes por el mundo y recrees un increíble, hermoso y fantástico lugar.', 'Clementoni', 'Multicolor'),
(15, 'Set Belleza', 'Set Muebles Rutina de Belleza - Barbie', 57.000, 1, 'Belleza.png', 13, 'Los packs de muebles y decoración de Barbie dan vida a historias con adorables piezas para contar historias. Son perfectos para utilizarlos en la casa de muñecas Barbie. No incluye la muñeca ni la casa.', 'Barbie', 'Rosado'),
(16, 'Comedor Beb&eacute', 'Silla Comedor 2 en 1 Rosado', 455.000, 1, 'silla.png', 2, 'Pensando en el bienestar, seguridad y entretenimiento a los más pequeños de la casa, te trae un nuevo diseño de la silla comedor escritorio Pcm-1O, la cual cuenta con acolchado de lujo, cinturón de seguridad, doble bandeja y dos opciones de uso silla comedor o mesa de actividades con silla, con la que tu bebé podrá disfrutar mientras crece. ', 'Fisher Price', 'Rosado'),
(17, 'Set Dentista', 'Set de Masa Moldeable Dentista- Play-Doh', 62.900, 1, 'dentista.webp', 9, 'El Dentista Bromista se encargará del paciente antes que le duelan los dientes! Aun si, da un poquito de miedo ir al dentista, pero con este set Play-Doh, los niños pueden tomar el control de la experiencia de ir al odontólogo al jugar a ser dentistas. Los niños y niñas pueden hacer que el paciente saque la lengua y luego usar el molde de dientes para crear toda una fila de dientes Play-Doh. Luego pueden comenzar a taladrar y rellenar con el taladro de juguete y el extrusor. ', 'Play-Doh', 'Amarillo'),
(18, 'Set LOL', 'Set Carrito-Parrilla LOL', 195.500, 1, 'lol.png', 7, '\n¡El Camper de Comidas Rápidas de LOL es una aventura sobre ruedas llena de diversión y sorpresas para las adorables muñecas LOL! Este set es un vehículo enérgico y colorido que ofrece una experiencia emocionante de juego para las muñecas y sus amigos.', 'Kiddoh', 'Rosado'),
(19, 'Organeta - Kiddoh', 'Set Organeta Electr&oacute;nica Azul con Silla', 232.900, 1, 'Organeta.webp', 6, 'Piano electrónico para niños con silla y micrófono, grabación y reproducción, soporte para teléfono / ipad, reproducción de música desde teléfono inteligente, 31 teclas, 12 canciones y varios efectos de sonido.\nEste piano es un juguete maravilloso para pequeños músicos. El instrumento garantiza un espectáculo perfecto.', 'Fisher Price', 'Azul'),
(20, 'Ping&uuml;ino Musical', 'Ping&uuml;ino Baila Conmigo - Fisher Price', 320.000, 1, 'musical.png', 3, 'El juguete musical Pingüino Baila Conmigo de Linkimals de Fisher-Price es el compañero de baile perfecto para los bebés gracias a sus melodías divertidas, luces multicolores y movimientos geniales. ', 'Fisher Price', 'Negro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cdusu` int(11) NOT NULL,
  `nomusu` varchar(50) DEFAULT NULL,
  `apeusu` varchar(50) DEFAULT NULL,
  `emailusu` varchar(50) NOT NULL,
  `passusu` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cdusu`, `nomusu`, `apeusu`, `emailusu`, `passusu`, `estado`) VALUES
(1, 'Carmen', 'Trujillo', 'cytrujillo@poligran.edu.co', '12345678', 1),
(2, 'Cristhian Andres', 'Vargas Cuero ', 'crisvc@hotmail.com', '123456', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`cdped`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cdpro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cdusu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `cdped` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `cdpro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cdusu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
