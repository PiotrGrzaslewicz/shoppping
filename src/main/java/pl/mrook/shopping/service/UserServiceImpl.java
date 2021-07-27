package pl.mrook.shopping.service;

import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.mrook.shopping.model.Role;
import pl.mrook.shopping.model.User;
import pl.mrook.shopping.repository.MemoRepository;
import pl.mrook.shopping.repository.RoleRepository;
import pl.mrook.shopping.repository.ShoppingListRepository;
import pl.mrook.shopping.repository.UserRepository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;

@Service
@Primary
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final MemoRepository memoRepository;
    private final ShoppingListRepository shoppingListRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, MemoRepository memoRepository, ShoppingListRepository shoppingListRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder) {
        this.memoRepository = memoRepository;
        this.shoppingListRepository = shoppingListRepository;
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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
        user.setPassword(passwordEncoder.encode("Demo1"));
        user.setLists(new ArrayList<>() {
        });
        user.setMemos(new ArrayList<>());
        user.setEnabled(1);
        memoRepository.deleteAllByUser(user);
        shoppingListRepository.deleteAllByUser(user);
        userRepository.save(user);
    }
}