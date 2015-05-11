-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: papw
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Temporary table structure for view `anuncios_mascaros`
--

DROP TABLE IF EXISTS `anuncios_mascaros`;
/*!50001 DROP VIEW IF EXISTS `anuncios_mascaros`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `anuncios_mascaros` (
  `idAnuncio` tinyint NOT NULL,
  `vigenciaAnuncio` tinyint NOT NULL,
  `fechaPublicacion` tinyint NOT NULL,
  `thumbnailAnuncio` tinyint NOT NULL,
  `Producto_id` tinyint NOT NULL,
  `MetodoPago_id` tinyint NOT NULL,
  `estadoAnuncio` tinyint NOT NULL,
  `precioProducto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `anuncios_recientes`
--

DROP TABLE IF EXISTS `anuncios_recientes`;
/*!50001 DROP VIEW IF EXISTS `anuncios_recientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `anuncios_recientes` (
  `idAnuncio` tinyint NOT NULL,
  `vigenciaAnuncio` tinyint NOT NULL,
  `fechaPublicacion` tinyint NOT NULL,
  `thumbnailAnuncio` tinyint NOT NULL,
  `Producto_id` tinyint NOT NULL,
  `MetodoPago_id` tinyint NOT NULL,
  `estadoAnuncio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `anuncios_mascomentados`
--

DROP TABLE IF EXISTS `anuncios_mascomentados`;
/*!50001 DROP VIEW IF EXISTS `anuncios_mascomentados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `anuncios_mascomentados` (
  `idAnuncio` tinyint NOT NULL,
  `vigenciaAnuncio` tinyint NOT NULL,
  `fechaPublicacion` tinyint NOT NULL,
  `thumbnailAnuncio` tinyint NOT NULL,
  `Producto_id` tinyint NOT NULL,
  `MetodoPago_id` tinyint NOT NULL,
  `estadoAnuncio` tinyint NOT NULL,
  `preguntas` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `anuncios_masvendidos`
--

DROP TABLE IF EXISTS `anuncios_masvendidos`;
/*!50001 DROP VIEW IF EXISTS `anuncios_masvendidos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `anuncios_masvendidos` (
  `idAnuncio` tinyint NOT NULL,
  `vigenciaAnuncio` tinyint NOT NULL,
  `fechaPublicacion` tinyint NOT NULL,
  `thumbnailAnuncio` tinyint NOT NULL,
  `Producto_id` tinyint NOT NULL,
  `MetodoPago_id` tinyint NOT NULL,
  `estadoAnuncio` tinyint NOT NULL,
  `ventas` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `anuncios_mascaros`
--

/*!50001 DROP TABLE IF EXISTS `anuncios_mascaros`*/;
/*!50001 DROP VIEW IF EXISTS `anuncios_mascaros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `anuncios_mascaros` AS select `a`.`idAnuncio` AS `idAnuncio`,`a`.`vigenciaAnuncio` AS `vigenciaAnuncio`,`a`.`fechaPublicacion` AS `fechaPublicacion`,`a`.`thumbnailAnuncio` AS `thumbnailAnuncio`,`a`.`Producto_id` AS `Producto_id`,`a`.`MetodoPago_id` AS `MetodoPago_id`,`a`.`estadoAnuncio` AS `estadoAnuncio`,`p`.`precioProducto` AS `precioProducto` from (`anuncio` `a` join `producto` `p` on((`p`.`idProducto` = `a`.`Producto_id`))) order by `p`.`precioProducto` desc limit 0,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `anuncios_recientes`
--

/*!50001 DROP TABLE IF EXISTS `anuncios_recientes`*/;
/*!50001 DROP VIEW IF EXISTS `anuncios_recientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `anuncios_recientes` AS select `anuncio`.`idAnuncio` AS `idAnuncio`,`anuncio`.`vigenciaAnuncio` AS `vigenciaAnuncio`,`anuncio`.`fechaPublicacion` AS `fechaPublicacion`,`anuncio`.`thumbnailAnuncio` AS `thumbnailAnuncio`,`anuncio`.`Producto_id` AS `Producto_id`,`anuncio`.`MetodoPago_id` AS `MetodoPago_id`,`anuncio`.`estadoAnuncio` AS `estadoAnuncio` from `anuncio` order by `anuncio`.`fechaPublicacion` desc limit 0,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `anuncios_mascomentados`
--

/*!50001 DROP TABLE IF EXISTS `anuncios_mascomentados`*/;
/*!50001 DROP VIEW IF EXISTS `anuncios_mascomentados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `anuncios_mascomentados` AS select `a`.`idAnuncio` AS `idAnuncio`,`a`.`vigenciaAnuncio` AS `vigenciaAnuncio`,`a`.`fechaPublicacion` AS `fechaPublicacion`,`a`.`thumbnailAnuncio` AS `thumbnailAnuncio`,`a`.`Producto_id` AS `Producto_id`,`a`.`MetodoPago_id` AS `MetodoPago_id`,`a`.`estadoAnuncio` AS `estadoAnuncio`,count(`p`.`idPregunta`) AS `preguntas` from (`anuncio` `a` join `pregunta` `p` on((`p`.`Anuncio_id` = `a`.`idAnuncio`))) order by count(`p`.`idPregunta`) desc limit 0,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `anuncios_masvendidos`
--

/*!50001 DROP TABLE IF EXISTS `anuncios_masvendidos`*/;
/*!50001 DROP VIEW IF EXISTS `anuncios_masvendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `anuncios_masvendidos` AS select `a`.`idAnuncio` AS `idAnuncio`,`a`.`vigenciaAnuncio` AS `vigenciaAnuncio`,`a`.`fechaPublicacion` AS `fechaPublicacion`,`a`.`thumbnailAnuncio` AS `thumbnailAnuncio`,`a`.`Producto_id` AS `Producto_id`,`a`.`MetodoPago_id` AS `MetodoPago_id`,`a`.`estadoAnuncio` AS `estadoAnuncio`,sum(`c`.`cantidadCompra`) AS `ventas` from (`anuncio` `a` join `compra` `c` on((`c`.`Anuncio_id` = `a`.`idAnuncio`))) order by sum(`a`.`idAnuncio`) desc limit 0,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'papw'
--
/*!50003 DROP PROCEDURE IF EXISTS `agregar_respuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_respuesta`(
	in sp_textoRespuesta				text,
    in sp_fechaRespuesta				timestamp,
    in sp_idPregunta					int)
begin
update Pregunta
    set
		   textoRespuesta = sp_textoRespuesta,
           fechaRespuesta = sp_fechaRespuesta,
           respuestaRealizada = 1
	where idPregunta = sp_idPregunta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_anuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_anuncio`(in id int)
begin
delete from Anuncio
where idAnuncio = id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_pregunta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_pregunta`(in sp_idPregunta int)
begin
delete from pregunta
where idPregunta = sp_idPregunta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_producto`(in productoid int)
begin
delete from Producto
where idProducto = productoid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_user`(in userid int)
begin
delete from usuario
where idUsuario=userid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_anuncio_del_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_anuncio_del_usuario`(in id int)
begin
select idAnuncio, vigenciaAnuncio, fechaPublicacion, thumbnailAnuncio, Producto_id, MetodoPago_id, estadoAnuncio
from Anuncio
where idAnuncio = id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_metodosPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_metodosPago`()
begin
select idMetodoPago, nombreMetodoPago
from MetodoPago;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_preguntas_por_anuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_preguntas_por_anuncio`(in idAnuncio int)
begin
select idPregunta, textoPregunta, fechaPregunta, textoRespuesta, fechaRespuesta, respuestarealizada, Usuario_id, Anuncio_id
from Pregunta
where Anuncio_id = idAnuncio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_producto`(in id int)
begin
select idProducto, descripcionCorta, descripcionLarga, precioProducto, existenciaProducto, vigenciaProducto, imagenProducto1, imagenProducto2,
imagenProducto3, videoProducto1, videoProducto2, videoProducto3, Usuario_id, S.idSubcategoria, S.nombreSubcategoria 
from Producto as P
join subcategoria as S on P.subcategoria_id = S.idsubcategoria
where idProducto = id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_subcategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_subcategorias`()
begin
select idSubcategoria, nombreSubcategoria, categoria_id
from subcategoria;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_todos_anuncios_del_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_todos_anuncios_del_usuario`()
begin
select idAnuncio, vigenciaAnuncio, fechaPublicacion, thumbnailAnuncio, P. descripcioncorta,  Producto_id, MetodoPago_id,
nombremetodopago, estadoAnuncio
from Anuncio as A
join Producto as P on P.idProducto = A.producto_id
join metodopago as M on M.idmetodopago = a.MetodoPago_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_todos_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_todos_productos`()
begin
select idProducto, descripcionCorta, descripcionLarga, precioProducto, existenciaProducto, vigenciaProducto, imagenProducto1, imagenProducto2,
imagenProducto3, videoProducto1, videoProducto2, videoProducto3, Usuario_id, S.idSubcategoria, S.nombreSubcategoria 
from Producto as P
join subcategoria as S on P.subcategoria_id = S.idsubcategoria;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_todos_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_todos_usuarios`()
begin
select idUsuario, nickName, contraseniaUsuario, mailUsuario, nombreUsuario, apellidoPaterno, apellidoMaterno, fechaNacimiento, sexoUsuario, coloniaUsuario, calleUsuario,
numeroCasa, codigoPostal, ciudadUsuario, estadoUsuario, paisUsuario
from usuario;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_usuario`(in userid int)
begin
select nickName, contraseniaUsuario, mailUsuario, nombreUsuario, apellidoPaterno, apellidoMaterno, fechaNacimiento, sexoUsuario, coloniaUsuario, calleUsuario,
numeroCasa, codigoPostal, ciudadUsuario, estadoUsuario, paisUsuario
from usuario
where idUsuario = userid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_imagen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_imagen`(IN archivoParam MEDIUMBLOB, IN userID int, IN col int)
BEGIN
	set @id = if(userID=0, (select max(idUsuario) from usuario), userID);
	UPDATE usuario set usuario.imagenUsuario = archivoParam
    where usuario.idUsuario = @id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_imagen_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_imagen_producto`(IN archivoParam MEDIUMBLOB, IN productID int, IN col int)
BEGIN
	set @id = if(productID=0, (select max(idProducto) from producto), productID);
    case col
    when 0 then
    UPDATE producto
    set producto.imagenProducto1 = archivoParam
    where producto.idProducto = @id;
    when 1 then
    UPDATE producto
    set producto.imagenProducto2 = archivoParam
    where producto.idProducto = @id;
    when 2 then
    UPDATE producto
    set producto.imagenProducto3 = archivoParam
    where producto.idProducto = @id;
    end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_video_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_video_producto`(IN ubicacionParam VARCHAR(200), IN productID int, IN col int)
BEGIN
	set @id = if(productID=0, (select max(idProducto) from producto), productID);
    case col
    when 3 then
    UPDATE producto
    set producto.videoProducto1 = ubicacionParam
    where producto.idProducto = @id;
    when 4 then
    UPDATE producto
    set producto.videoProducto2 = ubicacionParam
    where producto.idProducto = @id;
    when 5 then
    UPDATE producto
    set producto.videoProducto3 = ubicacionParam
    where producto.idProducto = @id;
    end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mod_anuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mod_anuncio`(
	in sp_vigencia					date,
    in sp_fechaPublicacion			date ,
    in sp_thumbnail					blob,
    in sp_producto_id				int ,
    in sp_metodoPago_id				int,
    in sp_idAnuncio				int)
begin
update Producto
    set
		   vigenciaAnuncio = sp_vigencia,
           fechaPublicacion = sp_fechaPublicacion,
           thumbnailAnuncio = sp_thumbnail,
           Producto_id = sp_producto_id,
           MetodoPago_id = sp_metodoPago_id,
           estadoAnuncio = 1
           
	where idAnuncio = sp_idAnuncio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mod_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mod_producto`(
	in sp_descCorta					char(100),
    in sp_descLarga					text,
    in sp_precio					numeric,
    in sp_existencia	            int,
    in sp_vigencia					date,
    in sp_imagen1 					blob,
    in sp_imagen2 					blob,
    in sp_imagen3 					blob,
    in sp_video1 					blob,
    in sp_video2 					blob,
    in sp_video3 					blob,
    in sp_idUsuario		            int,
    in sp_idSubcategoria            int,
    in sp_idProducto 				int)
begin
update Producto
    set
		   descripcionCorta = sp_descCorta,	
           descripcionLarga = sp_descLarga,	
           precioProducto = sp_precio,		
           existenciaProducto = sp_existencia,
           vigenciaProducto = sp_vigencia,	
           imagenProducto1 = sp_imagen1,	
           imagenProducto2 = sp_imagen2,	
           imagenProducto3 = sp_imagen3, 		
           videoProducto1 = sp_video1, 		
           videoProducto2 = sp_video2, 		
           videoProducto3 = sp_video3, 		
           Usuario_id = sp_idUsuario,		
           Subcategoria_id = sp_idSubcategoria
           
	where idProducto = sp_idProducto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mod_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mod_usuario`(
	in sp_nickName varchar(30),
    in sp_contraseniaUsuario		varchar(30),
    in sp_mailUsuario				varchar(30),
    in sp_imagenUsuario				blob,
    in sp_nombreUsuario				char(50),
    in sp_apellidoPaterno			char(50),
    in sp_apellidoMaterno			char(50),
	in sp_fechaNacimiento			date,
	in sp_sexoUsuario				enum('M','F'),
    in sp_coloniaUsuario			char(20),
	in sp_calleUsuario				char(20),
    in sp_numeroCasa				varchar(10),
    in sp_codigoPostal				int,
    in sp_ciudadUsuario				char(30),
    in sp_estadoUsuario				char(30),
    in sp_paisUsuario				char(30),
    in sp_idUsuario 				int)
begin
update Usuario
    set
		   nickName = sp_nickname,		
           contraseniaUsuario = sp_contraseniaUsuario,	
		   mailUsuario = sp_mailUsuario,
           imagenUsuario = sp_imagenUsuario,
           nombreUsuario = sp_nombreUsuario,		
           apellidoPaterno = sp_apellidoPaterno,		
           apellidoMaterno = sp_apellidoMaterno,		
           fechaNacimiento = sp_fechaNacimiento,	
           sexoUsuario = sp_sexoUsuario,		
           coloniaUsuario = sp_coloniaUsuario,		
           calleUsuario = sp_calleUsuario,	
           numeroCasa = sp_numeroCasa,		
           codigoPostal = sp_codigoPostal,			
           ciudadUsuario = sp_ciudadUsuario,		
           estadoUsuario = sp_estadoUsuario,		
           paisUsuario = sp_paisUsuario
           
           where idUsuario = sp_idUsuario;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_imagen_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_imagen_producto`(IN prodID int, IN col int)
BEGIN
	case col
    when 1 then
    select producto.imagenProducto1 from producto
    where producto.idProducto = prodID;
    when 2 then
    select producto.imagenProducto2 from producto
    where producto.idProducto = prodID;
    when 3 then
    select producto.imagenProducto3 from producto
    where producto.idProducto = prodID;
    end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_imagen_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_imagen_user`(IN userID int)
BEGIN
	select usuario.imagenUsuario from usuario
    where usuario.idUsuario = userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_busqueda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_busqueda`(in texto varchar(50), in titulo boolean, in usuario boolean, in fecha boolean, in fechaD date, in fechaH date)
begin
select U.nickName, P.descripcionCorta, A.idAnuncio, A.vigenciaAnuncio, A.fechaPublicacion, A.thumbnailAnuncio, A.Producto_id, A.MetodoPago_id, A.estadoAnuncio
from anuncio as A
join producto as P on A.Producto_id = P.idProducto
join usuario as U on U.idUsuario = P.Usuario_id
where if(titulo, P.descripcionCorta like CONCAT('%', texto, '%'), false) OR
    if(usuario, U.nickName like CONCAT('%', texto, '%'), false) OR
    if(fecha, A.fechaPublicacion BETWEEN fechaD and fechaH, false);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevaCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevaCategoria`(
	in sp_idCategoria			int,
    in sp_nombreCategoria			char(50),
    in sp_opcion			int
    )
begin
    
    if sp_opcion = 1 then 
    insert into Categoria
    values(null,
		   sp_nombreCategoria);
	end if;
	
    if sp_opcion = 2 then 
     update Categoria
    set
		   nombreCategoria = sp_nombreCategoria
           where idCategoria = sp_idCategoria;
	end if;

	if sp_opcion = 3  then	
		delete from Categoria where idCategoria = sp_idCategoria;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevaCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevaCompra`(
    in sp_cantidad					int,
    in sp_total						decimal(10,2),
    in sp_estadoCompra				int ,
    in sp_comprador_id				int,
    in sp_anuncio_id				int
    )
begin 
    insert into compra
    values(null,
    sp_cantidad,		
     null,		
     sp_total,			
     sp_estadoCompra,	
     sp_comprador_id,		
     sp_anuncio_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevaMetodoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevaMetodoPago`(
	in sp_idMetodoPago			int,
    in sp_nombreMetodoPago			char(50),
    in sp_opcion			int
    )
begin
    
    if sp_opcion = 1 then 
    insert into MetodoPago
    values(null,
		   sp_nombreMetodoPago);
	end if;
	
    if sp_opcion = 2 then 
     update MetodoPago
    set
		   nombreMetodoPago = sp_nombreMetodoPago
           where idMetodoPago = sp_idMetodoPago;
	end if;

	if sp_opcion = 3  then	
		delete from MetodoPago where idMetodoPago = sp_idMetodoPago;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevaPregunta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevaPregunta`(
    in textoPregunta				text,
    in idUsuario					int ,
    in idAnuncio					int
    )
begin 
    insert into pregunta
    values(null,
     textoPregunta,		
     null,		
     null,			
     null,	
     0,		
     idUsuario,
     idAnuncio);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevaSubCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevaSubCategoria`(
	in sp_idSubCategoria			int,
    in sp_nombreSubCategoria		char(50),
    in sp_idCategoria					int,
    in sp_opcion					int
    )
begin
    
    if sp_opcion = 1 then 
    insert into SubCategoria
    values(null,
		   sp_nombreSubCategoria,
           sp_idCategoria);
	end if;
	
    if sp_opcion = 2 then 
     update SubCategoria
    set
		   nombreSubCategoria = sp_nombreSubCategoria,
           idCategoria = sp_idCategoria
           where idSubCategoria = sp_idSubCategoria;
	end if;

	if sp_opcion = 3  then	
		delete from SubCategoria where idSubCategoria = sp_idSubCategoria;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevoAnuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevoAnuncio`(
    in sp_vigencia					date,
    in sp_fechaPublicacion			date ,
    in sp_thumbnail					blob,
    in sp_producto_id				int ,
    in sp_metodoPago_id				int
    )
begin
set @imagen = (select imagenProducto1 from producto join producto as P on P.idProducto = sp_producto_id);
    insert into Anuncio
    values(null,
     sp_vigencia,		
     sp_fechaPublicacion,		
     @imagen,			
     sp_producto_id,	
     sp_metodoPago_id,		
     1);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevoProducto`(
    in sp_descripcionCorta			char(100) ,
    in sp_descripcionLarga			text ,
    in sp_precioProducto			numeric ,
    in sp_existenciaProducto		int ,
    in sp_vigenciaProducto		date ,
    in sp_imagenProducto1			blob,
    in sp_imagenProducto2			blob,
    in sp_imagenProducto3			blob,
    in sp_videoProducto1			blob,
    in sp_videoProducto2			blob,
    in sp_videoProducto3			blob,
    in sp_Usuario_id				int ,
    in sp_Subcategoria_id			int
    )
begin 
    insert into Producto
    values(null,
     sp_descripcionCorta,		
     sp_descripcionLarga,		
     sp_precioProducto,			
     sp_existenciaProducto,	
     sp_vigenciaProducto,		
     sp_imagenProducto1,			
     sp_imagenProducto2,			
     sp_imagenProducto3,			
     sp_videoProducto1,			
     sp_videoProducto2,			
     sp_videoProducto3,			
     sp_Usuario_id,			
     sp_Subcategoria_id	
          );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NuevoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NuevoUsuario`(
	in sp_nickName					varchar(30),
    in sp_contraseniaUsuario		varchar(30),
    in sp_mailUsuario				varchar(30),
    in sp_imagenUsuario				blob,
    in sp_nombreUsuario				char(50),
    in sp_apellidoPaterno			char(50),
    in sp_apellidoMaterno			char(50),
	in sp_fechaNacimiento			date,
	in sp_sexoUsuario				enum('M','F'),
    in sp_coloniaUsuario			char(20),
	in sp_calleUsuario				char(20),
    in sp_numeroCasa				varchar(10),
    in sp_codigoPostal				int,
    in sp_ciudadUsuario				char(30),
    in sp_estadoUsuario				char(30),
    in sp_paisUsuario				char(30),
    in sp_opcion 						int
    )
begin
    
    if sp_opcion = 1 then 
    insert into Usuario
    values(null,
		   sp_nickName,		
           sp_contraseniaUsuario,	
		   sp_mailUsuario,			
           sp_imagenUsuario,		
           sp_nombreUsuario,		
           sp_apellidoPaterno,		
           sp_apellidoMaterno,		
           sp_fechaNacimiento,	
           sp_sexoUsuario	,		
           sp_coloniaUsuario,		
           sp_calleUsuario	,	
           sp_numeroCasa	,		
           sp_codigoPostal,			
           sp_ciudadUsuario,		
           sp_estadoUsuario,		
           sp_paisUsuario
          );
	end if;
	
    if sp_opcion = 2 then 
     update Usuario
    set
		   nickName = sp_nickname,		
           contraseniaUsuario = sp_contraseniaUsuario,	
		   mailUsuario = sp_mailUsuario,			
           imagenUsuario = sp_imagenUsuario,		
           nombreUsuario = sp_nombreUsuario,		
           apellidoPaterno = sp_apellidoPaterno,		
           apellidoMaterno = sp_apellidoMaterno,		
           fechaNacimiento = sp_fechaNacimiento,	
           sexoUsuario = sp_sexoUsuario,		
           coloniaUsuario = sp_coloniaUsuario,		
           calleUsuario = sp_calleUsuario,	
           numeroCasa = sp_numeroCasa,		
           codigoPostal = sp_codigoPostal,			
           ciudadUsuario = sp_ciudadUsuario,		
           estadoUsuario = sp_estadoUsuario,		
           paisUsuario = sp_paisUsuario
           where idUsuario = sp_idUsuario;
	end if;

	if sp_opcion = 3  then	
		delete from usuario where idUsuario = sp_idUsuario;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Paises` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Paises`()
begin

select nickName from Usuario;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validar_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validar_login`(in user varchar(50), in pass varchar(50))
begin

select idUsuario, mailUsuario
from usuario
where nickName = user AND contraseniaUsuario = pass;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-11  3:56:42
