package ru.geekbrains.homework9.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.geekbrains.homework9.models.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername (String username);

}
