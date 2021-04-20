package ru.geekbrains.homework9.models.dtos;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import ru.geekbrains.homework9.models.entities.Category;
import ru.geekbrains.homework9.models.entities.Product;


@Data
@NoArgsConstructor
@EqualsAndHashCode
public class ProductDto {
    private int id;
    private String name;
    private int cost;
    private String[] categories;

    public ProductDto(Product product){
        this.id = product.getId();
        this.name = product.getName();
        this.cost = product.getCost();
        this.categories = product.getCategories().stream().map(Category::getName).toArray(String[]::new);
    }

}
