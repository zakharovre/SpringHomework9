package ru.geekbrains.homework9.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.geekbrains.homework9.models.dtos.Cart;
import ru.geekbrains.homework9.services.CartService;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/cart")

public class CartController {

    private final CartService cartService;

    @GetMapping
    public Cart showCart() {
        return cartService.showCart();
    }

    @GetMapping("/add")
    public Cart addProduct(@RequestParam int id, @RequestParam(defaultValue = "1") int q) {
        if (q < 1)
            q = 1;
        return cartService.addProduct(id, q);
    }

    @GetMapping("/remove")
    public Cart removeProduct(@RequestParam int id, @RequestParam(defaultValue = "0") int q) {
        if (q < 0)
            q = 1;
        return cartService.removeProduct(id, q);
    }
}
