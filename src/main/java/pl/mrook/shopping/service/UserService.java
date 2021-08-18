package pl.mrook.shopping.service;

import pl.mrook.shopping.model.User;

import javax.mail.MessagingException;
import java.util.Locale;

public interface UserService {
    User findByEmail(String email);
    void saveUser(User user);
    void editUser(User user);
    boolean checkMail(String email);

    boolean checkPassword(User user, String password);
    void resetDemoUser();

    void createPasswordResetTokenForUser(User user, String token);

    void sendPasswordResetEmail(User user, String token, String contextPath, Locale locale) throws MessagingException;

    String validatePasswordResetToken(String token);

    User findById(Long id);
}