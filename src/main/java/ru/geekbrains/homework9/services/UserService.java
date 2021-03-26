package ru.geekbrains.homework9.services;

import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.geekbrains.homework9.models.dtos.UserDto;
import ru.geekbrains.homework9.models.entities.User;
import ru.geekbrains.homework9.repositories.RoleRepository;
import ru.geekbrains.homework9.repositories.UserRepository;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Data
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public List<UserDto> findAllUsers(){
        return userRepository.findAll().stream().map(UserDto::new).collect(Collectors.toList());
    }

    public void saveUser(User user) {
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    public User findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public User findByUsernameAndPassword(String username, String password) {
        User userEntity = findUserByUsername(username);
        if (userEntity != null) {
            if (passwordEncoder.matches(password, userEntity.getPassword()))
                return userEntity;
        }
        return null;
    }
}
