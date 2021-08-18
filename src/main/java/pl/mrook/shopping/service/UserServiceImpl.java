package pl.mrook.shopping.service;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.mrook.shopping.model.PasswordResetToken;
import pl.mrook.shopping.model.Role;
import pl.mrook.shopping.model.User;
import pl.mrook.shopping.repository.*;

import javax.mail.MessagingException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;

@Service
@Primary
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final MemoRepository memoRepository;
    private final ShoppingListRepository shoppingListRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final PasswordResetTokenRepository passwordResetTokenRepository;
    private final MailService mailService;
    private final MessageSource messageSource;

    public UserServiceImpl(UserRepository userRepository, MemoRepository memoRepository, ShoppingListRepository shoppingListRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder, PasswordResetTokenRepository passwordResetTokenRepository, MailService mailService, MessageSource messageSource) {
        this.memoRepository = memoRepository;
        this.shoppingListRepository = shoppingListRepository;
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordResetTokenRepository = passwordResetTokenRepository;
        this.mailService = mailService;
        this.messageSource = messageSource;
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public void editUser(User user) {
        userRepository.save(user);
    }

    public boolean checkMail(String email) {
        return userRepository.findByEmail(email) == null;

    }

    @Override
    public boolean checkPassword(User user, String password) {
        return passwordEncoder.matches(password, user.getPassword());
    }

    @Override
    public void resetDemoUser() {
        if (userRepository.findByEmail("demo@demo")==null) {
            User user = new User();
            user.setEmail("demo@demo");
            userRepository.save(user);
        }
        User user = userRepository.findByEmail("demo@demo");
        user.setEmail("demo@demo");
        user.setName("Demo");
        user.setSurname("Demo User");
        user.setPassword("Demo1");
        user.setLists(new ArrayList<>() {
        });
        user.setMemos(new ArrayList<>());
        user.setEnabled(1);
        memoRepository.deleteAllByUser(user);
        shoppingListRepository.deleteAllByUser(user);
        saveUser(user);
    }

    @Override
    public void createPasswordResetTokenForUser(User user, String token) {
        PasswordResetToken newToken = new PasswordResetToken(token, user);
        passwordResetTokenRepository.save(newToken);
    }

    @Override
    public void sendPasswordResetEmail(User user, String token, String contextPath, Locale locale) throws MessagingException {
        String mail = user.getEmail();
        String link = "<a href = \"" + contextPath + "/reset?token=" + token + "\">" + messageSource.getMessage("resetPasswordLinkLabbel", null, locale) + "</a>";
        StringBuilder sb = new StringBuilder();
        sb.append(messageSource.getMessage("resetPasswordDescription", null, locale));
        sb.append(link);
        mailService.sendMail(mail, messageSource.getMessage("resetPasswordMailTopic", null, locale), sb.toString(), true);
    }

    @Override
    public String validatePasswordResetToken(String token) {
        PasswordResetToken currentToken = passwordResetTokenRepository.findByToken(token);
        if (currentToken==null) {
            return "invalid";
        } else if (!currentToken.getExpiryDate().isBefore(LocalDateTime.now())) {
            return "expired";
        } else {
            return "OK";
        }
    }

    @Override
    public User findById(Long id) {
        return userRepository.findById(id).get();
    }
}