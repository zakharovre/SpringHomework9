package ru.geekbrains.homework9.models.dtos;

import lombok.Data;

@Data
public class SignUpRequestDto {

    private String username;

    private String password;
}
