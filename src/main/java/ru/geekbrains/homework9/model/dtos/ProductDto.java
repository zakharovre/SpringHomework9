package ru.geekbrains.homework9.model.dtos;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import ru.geekbrains.homework9.model.entities.Product;

@Data
@NoArgsConstructor
@EqualsAndHashCode
public class ProductDto {
    private int id;
    private String name;
    private int cost;
    private String category;

    public ProductDto(Product product){
        this.id = product.getId();
        this.name = product.getName();
        this.cost = product.getCost();
        this.category = product.getCategory().getName();
    }

}
