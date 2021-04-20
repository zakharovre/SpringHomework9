package ru.geekbrains.homework9.services;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import ru.geekbrains.homework9.models.dtos.ProductDto;
import ru.geekbrains.homework9.models.entities.Category;
import ru.geekbrains.homework9.models.entities.Product;
import ru.geekbrains.homework9.repositories.CategoryRepository;
import ru.geekbrains.homework9.repositories.ProductRepository;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;

    public List<ProductDto> getAllProducts(int page, int size) {
        return productRepository.findAll(PageRequest.of(page, size)).map(ProductDto::new).toList();
    }

    public ProductDto getProductByID(int id) {
        return new ProductDto(productRepository.findById(id).get());
    }

    public ProductDto saveOrUpdate(ProductDto productDto) {
        List<Category> categories = new ArrayList<>();
        for (String name: productDto.getCategories())
            categories.add(categoryRepository.findCategoryByName(name));
        if (productDto.getId() > 0)
            return new ProductDto(productRepository.save(new Product(productDto.getId(), productDto.getName(), productDto.getCost(),categories)));
        else
            return new ProductDto(productRepository.save(new Product(productDto.getName(), productDto.getCost(),categories)));
    }

    public void deleteProduct(int id) {
        productRepository.deleteById(id);
    }

    public List<Product> getProductsGrThan(int minCost) {
        return productRepository.findProductByCostGreaterThanEqual(minCost);
    }

    public List<Product> getProductsLessThan(int maxCost) {
        return productRepository.findProductByCostLessThanEqual(maxCost);
    }

    public List<Product> getProductsBetween(int minCost, int maxCost) {
        return productRepository.findProductByCostBetween(minCost, maxCost);
    }

    public List<Product> getProductsByRegex(String str) {
        return productRepository.findProductByRegex(str);
    }

}
