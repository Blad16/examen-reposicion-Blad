

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


DROP SCHEMA IF EXISTS `crud` ;


CREATE SCHEMA IF NOT EXISTS `crud` DEFAULT CHARACTER SET utf8 ;
USE `crud` ;


DROP TABLE IF EXISTS `crud`.`profiles` ;

CREATE TABLE IF NOT EXISTS `crud`.`profiles` (
  `profile_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`profile_id`))
ENGINE = InnoDB;



DROP TABLE IF EXISTS `crud`.`users` ;

CREATE TABLE IF NOT EXISTS `crud`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `profile_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `profile_id_users_idx` (`profile_id` ASC),
  CONSTRAINT `profile_id_users`
    FOREIGN KEY (`profile_id`)
    REFERENCES `crud`.`profiles` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


START TRANSACTION;
USE `crud`;
INSERT INTO `crud`.`profiles` (`profile_id`, `name`) VALUES (1, 'ADMIN');
INSERT INTO `crud`.`profiles` (`profile_id`, `name`) VALUES (2, 'CLIENT');

COMMIT;

