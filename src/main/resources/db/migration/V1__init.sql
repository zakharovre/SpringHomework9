CREATE TABLE discount
(
    `id`         INT NOT NULL AUTO_INCREMENT,
    `percentage` INT NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO discount
VALUES (1, 0),
       (2, 10),
       (3, 20);


CREATE TABLE categories
(
    `id`          INT         NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(45) NOT NULL,
    `discount_id` INT         NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `catdis_id`
        FOREIGN KEY (`discount_id`)
            REFERENCES `spring_data`.`discount`(`id`)
);

CREATE TABLE products
(
    `id`          INT         NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(45) NOT NULL,
    `cost`        INT         NOT NULL,
    `description` VARCHAR(200),
    `created_at`  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `discount_id` INT         NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `proddis_id`
        FOREIGN KEY (`discount_id`)
            REFERENCES `spring_data`.`discount` (`id`)
);

CREATE TABLE products_categories
(
    `product_id`  INT NOT NULL,
    `category_id` INT NOT NULL,
    CONSTRAINT `pcuniq` UNIQUE (product_id, category_id),
    CONSTRAINT `prod_id`
        FOREIGN KEY (`product_id`)
            REFERENCES `spring_data`.`products` (`id`),
    CONSTRAINT `cat_id`
        FOREIGN KEY (`category_id`)
            REFERENCES `spring_data`.`categories` (`id`)
);

INSERT INTO categories
VALUES (1, 'Ale', 1),
       (2, 'Lagger', 1),
       (3, 'Stout', 1),
       (4, 'Wheat', 1),
       (5, 'Pilsner', 1),
       (6, 'England', 1),
       (7, 'Belgium', 1),
       (8, 'Germany', 1);



INSERT INTO products (`id`, `name`, `cost`, `description`, `discount_id`)
VALUES (1, 'Boddingtons Pub Ale', 146, 'Alc 4.7%, volume 0.5', 1),
       (2, 'Fuller''s Frontier', 228, 'Alc 4.5%, volume 0.5', 1),
       (3, 'St. Peter’s Honey Porter', 242, 'Alc 4.5%, volume 0.5', 1),
       (4, 'Blanche De Bruxelles', 147, 'Alc 4.5%, volume 0.5', 1),
       (5, 'Silly Pils', 149, 'Alc 5.0%, volume 0.25', 1),
       (6, 'ABK Hefeweizen Anno 25', 162, 'Alc 5.3%, volume 0.5', 1),
       (7, 'Altmuller Hell', 140, 'Alc 4.9%, volume 0.5', 1),
       (8, 'Andechser Vollbier Hell', 200, 'Alc 4.8%, volume 0.5', 1),
       (9, 'Gulden Draak', 346, 'Alc 12.0%, volume 0.33', 1),
       (10, 'Franziskaner Hefe-Weissbier', 149, 'Alc 5.0%, volume 0.5', 1);



INSERT INTO products_categories (product_id, category_id)
VALUES (1, 1),
       (1, 6),
       (2, 2),
       (2, 6),
       (3, 3),
       (3, 6),
       (4, 4),
       (4, 7),
       (5, 5),
       (5, 7),
       (6, 8),
       (6, 1),
       (7, 2),
       (7, 8),
       (8, 5),
       (8, 8),
       (9, 3),
       (9, 7),
       (10, 4),
       (10, 8);

CREATE TABLE users
(
    `id`          INT          NOT NULL AUTO_INCREMENT,
    `username`    VARCHAR(20)  NOT NULL,
    `password`    VARCHAR(100) NOT NULL,
    `discount_id` INT          NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `usdis_id`
        FOREIGN KEY (`discount_id`)
            REFERENCES `spring_data`.`discount` (`id`)
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

INSERT INTO users(id, username, password, discount_id)
VALUES (1, 'user1', '$2y$12$ShPpZKdk25GU1mNmtt8xqOIJw0R2hENA0ziZk1Jd92RBzYddR8EVm', 1),
       (2, 'user2', '$2y$12$dIzCx4ZgO1RynpU1Q7ARpu/cmtIhuJeiXHOms.H7Z3u0Sv5/bzNhW', 1),
       (3, 'user3', '$2y$12$bTi4JxSC4M/ZUOrwoWsqF.BMmZ7cJ72cRaZ6oJjxkpXwz5ynkOmnW', 1),
       (4, 'admin', '$2y$12$akZyBZEZvfJzxNC7X8qKquaTs/ynmwnCDPi0Y2SwpWFaLpwZnSMqK', 1);

INSERT INTO roles(id, name)
VALUES (1, 'ROLE_USER'),
       (2, 'ROLE_ADMIN');

INSERT INTO users_roles (user_id, role_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (4, 2);

CREATE TABLE storages
(
    `id`      INT          NOT NULL AUTO_INCREMENT,
    `name`    VARCHAR(45)  NOT NULL,
    `address` VARCHAR(150) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE product_item
(
    `id`         INT         NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(45) NOT NULL,
    `cost`       INT         NOT NULL,
    `product_id` INT         NOT NULL,
    `storage_id` INT         NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `proditem_id`
        FOREIGN KEY (`product_id`)
            REFERENCES `spring_data`.`products` (`id`),
    CONSTRAINT `storage_id`
        FOREIGN KEY (`storage_id`)
            REFERENCES `spring_data`.`storages` (`id`)
);

CREATE TABLE order_status
(
    `id`   INT         NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO order_status(id, name)
VALUES (1, 'New'),
       (2, 'Pending Payment'),
       (3, 'Confirmed'),
       (4, 'Delivered'),
       (5, 'Cancelled');

CREATE TABLE orders
(
    `id`        INT NOT NULL AUTO_INCREMENT,
    `user_id`   INT NOT NULL,
    `status_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `ordstat_idx` (`status_id` ASC) VISIBLE,
    CONSTRAINT `order_status_id`
        FOREIGN KEY (`status_id`)
            REFERENCES `spring_data`.`order_status` (`id`)
);

CREATE TABLE orders_proditems
(
    `order_id`    INT NOT NULL,
    `proditem_id` INT NOT NULL,
    CONSTRAINT `or_id`
        FOREIGN KEY (`order_id`)
            REFERENCES `spring_data`.`orders` (`id`),
    CONSTRAINT `pi_id`
        FOREIGN KEY (`proditem_id`)
            REFERENCES `spring_data`.`product_item` (`id`)
);









