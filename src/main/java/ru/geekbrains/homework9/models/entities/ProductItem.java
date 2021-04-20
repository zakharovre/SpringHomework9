package ru.geekbrains.homework9.models.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product_item")
@Data
@NoArgsConstructor
public class ProductItem {

    public ProductItem(Product product){
        name = product.getName();
        cost = product.getCost();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "cost")
    private int cost;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToMany
    @JoinTable(
            name = "orders_proditems",
            joinColumns = @JoinColumn(name = "proditem_id"),
            inverseJoinColumns = @JoinColumn(name = "order_id")
    )
    private List<Order> orders;

    @ManyToOne
    @JoinColumn(name = "storage_id")
    private Storage storage;
}
