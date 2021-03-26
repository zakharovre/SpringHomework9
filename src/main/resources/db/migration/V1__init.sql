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

CREATE TABLE users
(
    `id`       INT          NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20)  NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `cart` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE roles
(
    `id`   INT         NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE users_roles
(
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    CONSTRAINT `uq` UNIQUE (user_id, role_id),
    CONSTRAINT `us_id`
        FOREIGN KEY (`user_id`)
            REFERENCES `spring_data`.`users` (`id`),
    CONSTRAINT `r_id`
        FOREIGN KEY (`role_id`)
            REFERENCES `spring_data`.`roles` (`id`)
);

INSERT INTO users(id, username, password)
VALUES (1, 'user1', '$2y$12$ShPpZKdk25GU1mNmtt8xqOIJw0R2hENA0ziZk1Jd92RBzYddR8EVm'),
       (2, 'user2', '$2y$12$dIzCx4ZgO1RynpU1Q7ARpu/cmtIhuJeiXHOms.H7Z3u0Sv5/bzNhW'),
       (3, 'user3', '$2y$12$bTi4JxSC4M/ZUOrwoWsqF.BMmZ7cJ72cRaZ6oJjxkpXwz5ynkOmnW'),
       (4, 'admin', '$2y$12$akZyBZEZvfJzxNC7X8qKquaTs/ynmwnCDPi0Y2SwpWFaLpwZnSMqK');

INSERT INTO roles(id, name)
VALUES (1, 'ROLE_USER'),
       (2, 'ROLE_ADMIN');

INSERT INTO users_roles (user_id, role_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (4, 2);








