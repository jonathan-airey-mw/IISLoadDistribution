-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `truncateIPGeoLocation`()
BEGIN
	TRUNCATE TABLE ip_location;
	TRUNCATE TABLE ip_num_blocks;
END