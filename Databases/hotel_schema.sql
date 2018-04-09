SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS travel_agent;
CREATE SCHEMA travel_agent;
USE travel_agent;

CREATE TABLE hotel(
	  hotel_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	  hotel_name VARCHAR(45) NOT NULL,
	  owner_name VARCHAR(45) NOT NULL,
	  owner_contact VARCHAR(45) NOT NULL,
	  Email_id VARCHAR(45) NOT NULL,
	  address_id SMALLINT UNSIGNED NOT NULL, 
	  rating_of_hotel VARCHAR(45) NOT NULL, 
	  facility_id SMALLINT UNSIGNED NOT NULL,
	  amenity_id SMALLINT UNSIGNED NOT NULL,
	  availability INT NOT NULL,
	  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  PRIMARY KEY  (hotel_id),

	  KEY idx_fk_facility_id (facility_id),
	  CONSTRAINT `fk_facility` FOREIGN KEY (facility_id) REFERENCES facility (facility_id) ON DELETE RESTRICT ON UPDATE CASCADE,

	  KEY idx_fk_address_id (address_id),
	  CONSTRAINT `fk_address_city` FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE,

	  KEY idx_fk_amenity_id (amenity_id),
	  CONSTRAINT `fk_amenity_city` FOREIGN KEY (amenity_id) REFERENCES amenity (amenity_id) ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE facility(
	facility_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	facility_ac SMALLINT NOT NULL,
	facility_wifi SMALLINT NOT NULL,
	facility_bedroom SMALLINT NOT NULL,
	facility_freebreakfast SMALLINT NOT NULL,
	facility_geyser SMALLINT NOT NULL,
	price INT NOT NULL,
	taken INT NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	PRIMARY KEY  (facility_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE address(
	address_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	longitude FLOAT NOT NULL,
	latitude FLOAT NOT NULL,
	address_line1 VARCHAR(197) NOT NULL, 
	address_line2 VARCHAR(197) NOT NULL,
	city VARCHAR(97) NOT NULL,
	state VARCHAR(99) NOT NULL,
	pincode INT NOT NULL, 

	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	PRIMARY KEY  (address_id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE amenity(
	amenity_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	parking INT NOT NULL,
	laundry INT NOT NULL,
	room_service INT NOT NULL,
	restaurent INT NOT NULL,
	swimming_pool INT NOT NULL,
	spa INT NOT NULL,
	gym INT NOT NULL,
	any_other VARCHAR(109) NOT NULL, 

	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	PRIMARY KEY  (amenity_id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8;