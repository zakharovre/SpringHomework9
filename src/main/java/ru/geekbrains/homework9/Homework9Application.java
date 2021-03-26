package ru.geekbrains.homework9;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Homework9Application {

    //users(can use ProductController and CartController)
    //user1 pass1
    //user2 pass2
    //user3 pass3
    //admin admin (has ROLE_ADMIN, can use UserController)

    public static void main(String[] args) {
        SpringApplication.run(Homework9Application.class, args);
    }

}
