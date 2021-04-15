package ru.geekbrains.homework9.models.dtos;

import lombok.Data;

@Data
public class AuthRequestDto {
    private String username;
    private String password;
}