package pl.mrook.shopping.service;

import pl.mrook.shopping.model.User;

public interface UserService {
    User findByEmail(String email);
    void saveUser(User user);
    void editUser(User user);
    boolean checkMail(String email);

    boolean checkPassword(User user, String password);
    void resetDemoUser();
}