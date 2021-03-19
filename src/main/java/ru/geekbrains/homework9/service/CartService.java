package ru.geekbrains.homework9.service;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.geekbrains.homework9.model.dtos.Cart;
import ru.geekbrains.homework9.model.dtos.ProductDto;
import ru.geekbrains.homework9.repository.ProductRepository;

@Service
@Data
@RequiredArgsConstructor
public class CartService {

    private final ProductRepository productRepository;

    private Cart cart = new Cart();

    public Cart showCart() {
        return cart;
    }

    public Cart addProduct(int id, int quantity) {
        ProductDto productDto = new ProductDto(productRepository.findById(id).get());
        cart.add(productDto, quantity);
        return cart;
    }

    public Cart removeProduct(int id, int quantity) {
        ProductDto productDto = new ProductDto(productRepository.findById(id).get());
        cart.remove(productDto, quantity);
        return cart;
    }
}
