package ru.geekbrains.homework9.models.entities;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "products")
@Data
@NoArgsConstructor
public class Product {

    public Product(int id, String name, int cost, List<Category> categories) {
        this.id = id;
        this.name = name;
        this.cost = cost;
        this.categories = categories;
    }

    public Product(String name, int cost, List<Category> categories) {
        this.name = name;
        this.cost = cost;
        this.categories = categories;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "cost")
    private int cost;

    @Column(name = "description")
    private String description;

    @Column(name = "created_at")
    @CreationTimestamp
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    @UpdateTimestamp
    private LocalDateTime updatedAt;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "products_categories", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<Category> categories;

    @OneToOne
    @JoinColumn(name = "discount_id")
    private Discount discount;

}
