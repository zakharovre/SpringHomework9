package ru.geekbrains.homework9.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import ru.geekbrains.homework9.models.dtos.ProductDto;
import ru.geekbrains.homework9.models.entities.Product;
import ru.geekbrains.homework9.services.ProductService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/products")
public class ProductController {

    private final ProductService productService;

    @GetMapping
    public List<ProductDto> getAllProd(@RequestParam(defaultValue = "1") int p,
                                       @RequestParam(defaultValue = "100") int s){
        if (p < 1)
            p = 1;
        return productService.getAllProducts(p-1,s);
    }

    @GetMapping("/{id}")
    public ProductDto getProdById(@PathVariable int id) {
        return productService.getProductByID(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ProductDto addProd(@RequestBody ProductDto productDto) {
        return productService.saveOrUpdate(productDto);
    }

    @PutMapping
    public ProductDto updateProd(@RequestBody ProductDto productDto) {
        return productService.saveOrUpdate(productDto);
    }

    @DeleteMapping("/{id}")
    public void deleteProd(@PathVariable int id) {
        productService.deleteProduct(id);
    }

    @GetMapping("/grthan/{minCost}")
    public List<Product> greaterThan(@PathVariable int minCost) {
        return productService.getProductsGrThan(minCost);
    }

    @GetMapping("/lessthan/{maxCost}")
    public List<Product> lessThan(@PathVariable int maxCost) {
        return productService.getProductsLessThan(maxCost);
    }

    @GetMapping("/between")
    public List<Product> between(@RequestParam int min, @RequestParam int max) {
        return productService.getProductsBetween(min, max);
    }
    @GetMapping("/regex")
    public List<Product> getProdByReg(@RequestParam String str) {
        return productService.getProductsByRegex(str);
    }
}
