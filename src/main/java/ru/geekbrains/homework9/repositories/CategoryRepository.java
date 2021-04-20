package ru.geekbrains.homework9.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.geekbrains.homework9.models.entities.Category;


@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    Category findCategoryByName(String name);
}
