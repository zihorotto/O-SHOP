USE `full-stack-ecommerce`;

CREATE TABLE product_category (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);
INSERT INTO product_category (id, category_name) VALUES 
(1, 'PlayStation 5'), 
(2, 'PlayStation 4'), 
(3, 'PlayStation 3'), 
(4, 'Xbox');

CREATE TABLE IF NOT EXISTS product (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
   `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
);

-- -----------------------------------------------------
-- PlayStation 5 Games
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) VALUES
('PS5-1001', 'Ratchet & Clank: Rift Apart', 'Jump between dimensions with Ratchet and Clank as they take on an evil emperor from another reality.', 'assets/images/products/games/ps5/ps5-1001.jpg', 1, 100, 69.99, 1, NOW()),
('PS5-1002', 'Returnal', 'Fight to break the cycle of chaos on an ever-changing alien planet.', 'assets/images/products/games/ps5/ps5-1002.jpg', 1, 100, 59.99, 1, NOW()),
('PS5-1003', 'Horizon Forbidden West', 'Embark on an epic quest through lush forests and dangerous machine-ridden lands.', 'assets/images/products/games/ps5/ps5-1003.jpg', 1, 60, 59.99, 1, NOW()),
('PS5-1004', 'Gran Turismo 7', 'Experience the real driving simulator with over 420 cars and racing across 90 tracks.', 'assets/images/products/games/ps5/ps5-1004.jpg', 1, 70, 69.99, 1, NOW()),
('PS5-1005', 'Final Fantasy XVI', 'Journey through the realm of Valisthea, where crystals dictate the flow of life.', 'assets/images/products/games/ps5/ps5-1005.jpg', 1, 80, 59.99, 1, NOW()),
('PS5-1006', 'Resident Evil Village', 'Survive a terrifying experience in a deadly village haunted by dark secrets.', 'assets/images/products/games/ps5/ps5-1006.jpg', 1, 40, 49.99, 1, NOW()),
('PS5-1007', 'Cyberpunk 2077', 'Dive into the neon-lit dystopian world of Night City in this futuristic action RPG.', 'assets/images/products/games/ps5/ps5-1007.jpg', 1, 50, 39.99, 1, NOW()),
('PS5-1008', 'The Elder Scrolls V: Skyrim', 'Explore an open world of fantasy and adventure in the land of Tamriel.', 'assets/images/products/games/ps5/ps5-1008.jpg', 1, 70, 19.99, 1, NOW()),
('PS5-1009', 'Grand Theft Auto V', 'Explore the sprawling, satirical open world of Los Santos in this action-packed crime saga.', 'assets/images/products/games/ps5/ps5-1009.jpg', 1, 100, 29.99, 1, NOW()),
('PS5-1010', 'Assassin\'s Creed Valhalla', 'Become a legendary Viking raider on a quest for glory in Assassin\'s Creed Valhalla.', 'assets/images/products/games/ps5/ps5-1010.jpg', 1, 100, 59.99, 1, NOW()),
('PS5-1011', 'Doom Eternal', 'Rip and tear through hordes of demons in this intense, action-packed shooter.', 'assets/images/products/games/ps5/ps5-1011.jpg', 1, 100, 49.99, 1, NOW()),
('PS5-1012', 'Far Cry 6', 'Join the revolution and liberate the island of Yara from a ruthless dictator.', 'assets/images/products/games/ps5/ps5-1012.jpg', 1, 100, 59.99, 1, NOW()),
('PS5-1013', 'The Witcher 3: Wild Hunt', 'Embark on an epic journey as Geralt of Rivia to find Ciri in this award-winning RPG.', 'assets/images/products/games/ps5/ps5-1013.jpg', 1, 100, 49.99, 1, NOW()),
('PS5-1014', 'Star Wars Jedi: Fallen Order', 'Follow Cal Kestis on an epic adventure to restore the Jedi Order.', 'assets/images/products/games/ps5/ps5-1014.jpg', 1, 100, 49.99, 1, NOW()),
('PS5-1015', 'The Last of Us Part I', 'Experience the critically acclaimed story that set the bar for narrative-driven gaming.', 'assets/images/products/games/ps5/ps5-1015.jpg', 1, 60, 59.99, 1, NOW()),
('PS5-1016', 'Spider-Man: Miles Morales', 'Experience the rise of Miles Morales as the new hero masters incredible, explosive new powers to become his own Spider-Man.', 'assets/images/products/games/ps5/ps5-1016.jpg', 1, 100, 49.99, 1, NOW()),
('PS5-1017', 'Demon\'s Souls', 'Experience the remake of the classic from the ground up, exclusively on the PlayStation 5.', 'assets/images/products/games/ps5/ps5-1017.jpg', 1, 100, 69.99, 1, NOW()),
('PS5-1018', 'Ghost of Tsushima: Director\'s Cut', 'Explore the hauntingly beautiful landscapes of Tsushima in this enhanced edition.', 'assets/images/products/games/ps5/ps5-1018.jpg', 1, 100, 59.99, 1, NOW()),
('PS5-1019', 'Sackboy: A Big Adventure', 'Join Sackboy in a platforming adventure for all ages.', 'assets/images/products/games/ps5/ps5-1019.jpg', 1, 100, 49.99, 1, NOW()),
('PS5-1020', 'Deathloop', 'In Deathloop, two rival assassins are trapped in a mysterious time loop on the island of Blackreef, doomed to repeat the same day for eternity.', 'assets/images/products/games/ps5/ps5-1020.jpg', 1, 100, 59.99, 1, NOW());


-- -----------------------------------------------------
-- PlayStation 4 Games
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) VALUES
('PS4-1001', 'Bloodborne', 'Hunt your nightmares in the gothic city of Yharnam, a land filled with unspeakable horrors.', 'assets/images/products/games/ps4/ps4-1001.jpg', 1, 60, 19.99, 2, NOW()),
('PS4-1002', 'Horizon Forbidden West', 'Embark on an epic quest through lush forests and dangerous machine-ridden lands.', 'assets/images/products/games/ps4/ps4-1002.jpg', 1, 60, 59.99, 2, NOW()),
('PS4-1003', 'Gran Turismo 7', 'Experience the real driving simulator with over 420 cars and racing across 90 tracks.', 'assets/images/products/games/ps4/ps4-1003.jpg', 1, 70, 69.99, 2, NOW()),
('PS4-1004', 'Resident Evil Village', 'Survive a terrifying experience in a deadly village haunted by dark secrets.', 'assets/images/products/games/ps4/ps4-1004.jpg', 1, 40, 49.99, 2, NOW()),
('PS4-1005', 'Cyberpunk 2077', 'Dive into the neon-lit dystopian world of Night City in this futuristic action RPG.', 'assets/images/products/games/ps4/ps4-1005.jpg', 1, 50, 39.99, 2, NOW()),
('PS4-1006', 'The Elder Scrolls V: Skyrim', 'Explore an open world of fantasy and adventure in the land of Tamriel.', 'assets/images/products/games/ps4/ps4-1006.jpg', 1, 70, 19.99, 2, NOW()),
('PS4-1007', 'Batman: Arkham City', 'Battle the rogue gallery of Gotham in this action-packed superhero adventure.', 'assets/images/products/games/ps4/ps4-1007.jpg', 1, 50, 14.99, 2, NOW()),
('PS4-1008', 'Metal Gear Solid 4: Guns of the Patriots', 'Join Solid Snake on his final mission to take down Liquid Ocelot.', 'assets/images/products/games/ps4/ps4-1008.jpg', 1, 60, 9.99, 2, NOW()),
('PS4-1009', 'Dark Souls', 'Prepare to die in the iconic and brutal world of Dark Souls.', 'assets/images/products/games/ps4/ps4-1009.jpg', 1, 50, 19.99, 2, NOW()),
('PS4-1010', 'Grand Theft Auto V', 'Explore the sprawling, satirical open world of Los Santos in this action-packed crime saga.', 'assets/images/products/games/ps4/ps4-1010.jpg', 1, 100, 29.99, 2, NOW()),
('PS4-1011', 'Assassin\'s Creed Valhalla', 'Become a legendary Viking raider on a quest for glory in Assassin\'s Creed Valhalla.', 'assets/images/products/games/ps4/ps4-1011.jpg', 1, 100, 59.99, 2, NOW()),
('PS4-1012', 'Doom Eternal', 'Rip and tear through hordes of demons in this intense, action-packed shooter.', 'assets/images/products/games/ps4/ps4-1012.jpg', 1, 100, 49.99, 2, NOW()),
('PS4-1013', 'Far Cry 6', 'Join the revolution and liberate the island of Yara from a ruthless dictator.', 'assets/images/products/games/ps4/ps4-1013.jpg', 1, 100, 59.99, 2, NOW()),
('PS4-1014', 'The Witcher 3: Wild Hunt', 'Embark on an epic journey as Geralt of Rivia to find Ciri in this award-winning RPG.', 'assets/images/products/games/ps4/ps4-1014.jpg', 1, 100, 49.99, 2, NOW()),
('PS4-1015', 'Star Wars Jedi: Fallen Order', 'Follow Cal Kestis on an epic adventure to restore the Jedi Order.', 'assets/images/products/games/ps4/ps4-1015.jpg', 1, 100, 49.99, 2, NOW()),
('PS4-1016', 'The Last of Us Part I', 'Experience the critically acclaimed story that set the bar for narrative-driven gaming.', 'assets/images/products/games/ps4/ps4-1016.jpg', 1, 60, 59.99, 2, NOW()),
('PS4-1017', 'The Last of Us Part II', 'Explore a post-apocalyptic world in this critically acclaimed action-adventure game.', 'assets/images/products/games/ps4/ps4-1017.jpg', 1, 60, 59.99, 2, NOW()),
('PS4-1018', 'Uncharted 4: A Thief\'s End', 'Join Nathan Drake on his final adventure, uncovering historical mysteries and hidden treasures.', 'assets/images/products/games/ps4/ps4-1018.jpg', 1, 100, 19.99, 2, NOW()),
('PS4-1019', 'God of War', 'Follow Kratos and his son Atreus on an epic journey in the realms of Norse mythology.', 'assets/images/products/games/ps4/ps4-1019.jpg', 1, 100, 29.99, 2, NOW()),
('PS4-1020', 'Red Dead Redemption 2', 'Experience an epic tale of life in America at the dawn of the modern age.', 'assets/images/products/games/ps4/ps4-1020.jpg', 1, 100, 39.99, 2, NOW());

-- -----------------------------------------------------
-- PlayStation 3 Games
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) VALUES
('PS3-1001', 'The Elder Scrolls V: Skyrim', 'Explore an open world of fantasy and adventure in the land of Tamriel.', 'assets/images/products/games/ps3/ps3-1001.jpg', 1, 70, 19.99, 3, NOW()),
('PS3-1002', 'Batman: Arkham City', 'Battle the rogue gallery of Gotham in this action-packed superhero adventure.', 'assets/images/products/games/ps3/ps3-1002.jpg', 1, 50, 14.99, 3, NOW()),
('PS3-1003', 'Metal Gear Solid 4: Guns of the Patriots', 'Join Solid Snake on his final mission to take down Liquid Ocelot.', 'assets/images/products/games/ps3/ps3-1003.jpg', 1, 60, 9.99, 3, NOW()),
('PS3-1004', 'Dark Souls', 'Prepare to die in the iconic and brutal world of Dark Souls.', 'assets/images/products/games/ps3/ps3-1004.jpg', 1, 50, 19.99, 3, NOW()),
('PS3-1005', 'Grand Theft Auto V', 'Explore the sprawling, satirical open world of Los Santos in this action-packed crime saga.', 'assets/images/products/games/ps3/ps3-1005.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1006', 'Red Dead Redemption', 'Explore the American frontier in this epic tale of law and disorder.', 'assets/images/products/games/ps3/ps3-1006.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1007', 'Uncharted 2: Among Thieves', 'Join Nathan Drake on a thrilling treasure hunt around the world.', 'assets/images/products/games/ps3/ps3-1007.jpg', 1, 100, 19.99, 3, NOW()),
('PS3-1008', 'Uncharted 3: Drake\'s Deception', 'Join Nathan Drake in this action-packed third installment of the Uncharted series.', 'assets/images/products/games/ps3/ps3-1008.jpg', 1, 100, 19.99, 3, NOW()),
('PS3-1009', 'Metal Gear Solid V: The Phantom Pain', 'Experience the groundbreaking stealth-action game from Hideo Kojima.', 'assets/images/products/games/ps3/ps3-1009.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1010', 'BioShock Infinite', 'Explore the floating city of Columbia in this critically acclaimed FPS.', 'assets/images/products/games/ps3/ps3-1010.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1011', 'The Last of Us', 'Join Joel and Ellie as they traverse a post-apocalyptic world.', 'assets/images/products/games/ps3/ps3-1011.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1012', 'Mass Effect 3', 'Experience the epic conclusion of the Mass Effect trilogy.', 'assets/images/products/games/ps3/ps3-1012.jpg', 1, 100, 19.99, 3, NOW()),
('PS3-1013', 'Batman: Arkham Asylum', 'Fight through the Asylum as Batman and bring order to Gotham.', 'assets/images/products/games/ps3/ps3-1013.jpg', 1, 100, 19.99, 3, NOW()),
('PS3-1014', 'God of War III', 'Join Kratos in his epic quest to conquer the Gods of Olympus.', 'assets/images/products/games/ps3/ps3-1014.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1015', 'Resident Evil 5', 'Survive the horror in Africa with Chris Redfield and Sheva Alomar.', 'assets/images/products/games/ps3/ps3-1015.jpg', 1, 100, 19.99, 3, NOW()),
('PS3-1016', 'Call of Duty: Black Ops II', 'Fight through the Cold War era missions in this hit FPS game.', 'assets/images/products/games/ps3/ps3-1016.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1017', 'Far Cry 3', 'Survive the insanity on a tropical island filled with chaos.', 'assets/images/products/games/ps3/ps3-1017.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1018', 'Assassin\'s Creed IV: Black Flag', 'Sail the seas as a pirate and assassin in the Caribbean.', 'assets/images/products/games/ps3/ps3-1018.jpg', 1, 100, 29.99, 3, NOW()),
('PS3-1019', 'Journey', 'Embark on a mystical journey in this critically acclaimed indie game.', 'assets/images/products/games/ps3/ps3-1019.jpg', 1, 100, 19.99, 3, NOW()),
('PS3-1020', 'GTA IV', 'Experience the rise of Niko Bellic in the criminal underworld of Liberty City.', 'assets/images/products/games/ps3/ps3-1020.jpg', 1, 100, 29.99, 3, NOW());

-- -----------------------------------------------------
-- Xbox Games
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created) VALUES
('XBOX-1001', 'Halo: The Master Chief Collection', 'Play through the Halo saga with improved graphics and gameplay.', 'assets/images/products/games/xbox/xbox-1001.jpg', 1, 100, 39.99, 4, NOW()),
('XBOX-1002', 'Gears 5', 'Join Kait Diaz on her journey to uncover her connection to the enemy.', 'assets/images/products/games/xbox/xbox-1002.jpg', 1, 100, 49.99, 4, NOW()),
('XBOX-1003', 'Fable Anniversary', 'Revisit the classic RPG with enhanced graphics and sound.', 'assets/images/products/games/xbox/xbox-1003.jpg', 1, 100, 29.99, 4, NOW()),
('XBOX-1004', 'Sea of Thieves', 'Explore, plunder, and battle as a pirate in a shared world.', 'assets/images/products/games/xbox/xbox-1004.jpg', 1, 100, 39.99, 4, NOW()),
('XBOX-1005', 'Ori and the Blind Forest: Definitive Edition', 'Experience the beautiful and emotional platformer.', 'assets/images/products/games/xbox/xbox-1005.jpg', 1, 100, 19.99, 4, NOW()),
('XBOX-1006', 'Sunset Overdrive', 'Save Sunset City from a mutant apocalypse in this over-the-top action game.', 'assets/images/products/games/xbox/xbox-1006.jpg', 1, 100, 29.99, 4, NOW()),
('XBOX-1007', 'Resident Evil Village', 'Survive a terrifying experience in a deadly village haunted by dark secrets.', 'assets/images/products/games/xbox/xbox-1007.jpg', 1, 40, 49.99, 4, NOW()),
('XBOX-1008', 'Cyberpunk 2077', 'Dive into the neon-lit dystopian world of Night City in this futuristic action RPG.', 'assets/images/products/games/xbox/xbox-1008.jpg', 1, 50, 39.99, 4, NOW()),
('XBOX-1009', 'The Elder Scrolls V: Skyrim', 'Explore an open world of fantasy and adventure in the land of Tamriel.', 'assets/images/products/games/xbox/xbox-1009.jpg', 1, 70, 19.99, 4, NOW()),
('XBOX-1010', 'Batman: Arkham City', 'Battle the rogue gallery of Gotham in this action-packed superhero adventure.', 'assets/images/products/games/xbox/xbox-1010.jpg', 1, 50, 14.99, 4, NOW()),
('XBOX-1011', 'Dark Souls', 'Prepare to die in the iconic and brutal world of Dark Souls.', 'assets/images/products/games/xbox/xbox-1011.jpg', 1, 50, 19.99, 4, NOW()),
('XBOX-1012', 'Grand Theft Auto V', 'Explore the sprawling, satirical open world of Los Santos in this action-packed crime saga.', 'assets/images/products/games/xbox/xbox-1012.jpg', 1, 100, 29.99, 4, NOW()),
('XBOX-1013', 'Assassin\'s Creed Valhalla', 'Become a legendary Viking raider on a quest for glory in Assassin\'s Creed Valhalla.', 'assets/images/products/games/xbox/xbox-1013.jpg', 1, 100, 59.99, 4, NOW()),
('XBOX-1014', 'Doom Eternal', 'Rip and tear through hordes of demons in this intense, action-packed shooter.', 'assets/images/products/games/xbox/xbox-1014.jpg', 1, 100, 49.99, 4, NOW()),
('XBOX-1015', 'Far Cry 6', 'Join the revolution and liberate the island of Yara from a ruthless dictator.', 'assets/images/products/games/xbox/xbox-1015.jpg', 1, 100, 59.99, 4, NOW()),
('XBOX-1016', 'The Witcher 3: Wild Hunt', 'Embark on an epic journey as Geralt of Rivia to find Ciri in this award-winning RPG.', 'assets/images/products/games/xbox/xbox-1016.jpg', 1, 100, 49.99, 4, NOW()),
('XBOX-1017', 'Star Wars Jedi: Fallen Order', 'Follow Cal Kestis on an epic adventure to restore the Jedi Order.', 'assets/images/products/games/xbox/xbox-1017.jpg', 1, 100, 49.99, 4, NOW()),
('XBOX-1018', 'Halo Infinite', 'Step inside the armor of humanity’s greatest hero to experience an epic adventure and explore the expansive Halo universe.', 'assets/images/products/games/xbox/xbox-1018.jpg', 1, 100, 59.99, 4, NOW()),
('XBOX-1019', 'Forza Horizon 5', 'Explore the vibrant open-world landscapes of Mexico in the world’s greatest driving adventure.', 'assets/images/products/games/xbox/xbox-1019.jpg', 1, 100, 69.99, 4, NOW()),
('XBOX-1020', 'Gears of War: Ultimate Edition', 'Experience the original Gears of War, rebuilt from the ground up.', 'assets/images/products/games/xbox/xbox-1020.jpg', 1, 100, 29.99, 4, NOW());





