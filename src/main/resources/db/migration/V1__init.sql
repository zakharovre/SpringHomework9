CREATE TABLE categories(`id` INT NOT NULL AUTO_INCREMENT,
                      `name` VARCHAR(45) NOT NULL,
                      PRIMARY KEY (`id`));
INSERT INTO categories VALUES
(1,'Drinks'),
(2,'Electronics'),
(3,'Food'),
(4,'Staff');

CREATE TABLE product_repo(`id` INT NOT NULL AUTO_INCREMENT,
                      `name` VARCHAR(45) NOT NULL,
                      `cost` INT NOT NULL,
                      `category_id` INT,
                      `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       PRIMARY KEY (`id`),
                       INDEX `cat_idx` (`category_id` ASC) VISIBLE,
                       CONSTRAINT `cat`
                       FOREIGN KEY (`category_id`)
                       REFERENCES `spring_data`.`categories` (`id`));
INSERT INTO product_repo (`id`, `name`, `cost`,`category_id`) VALUES
(1, 'Beer', 50, 1),
(2, 'Book', 1500, 4),
(3, 'Chair', 2050,4),
(4, 'Table', 3050,4),
(5, 'Beer', 150,1),
(6, 'Beer', 100,1),
(7, 'Keyboard', 500,2),
(8, 'Router', 2500,2),
(9, 'Phone', 50000,2),
(10, 'Charger', 800,2),
(11, 'Pineapple', 350,3),
(12, 'Whiskey', 3000,1),
(13, 'Chocolate', 2500,3),
(14, 'Rum', 2000,1),
(15, 'Vodka', 500,1),
(16, 'Juice', 120,1),
(17, 'Camera', 7000,2),
(18, 'Mouse', 800,2),
(19, 'Plant', 800,4),
(20, 'Vocabulary', 450,4);





