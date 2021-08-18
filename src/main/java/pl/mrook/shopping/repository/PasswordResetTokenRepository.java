package pl.mrook.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrook.shopping.model.PasswordResetToken;
import pl.mrook.shopping.model.User;

import java.util.List;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {
    PasswordResetToken findByToken(String token);
    List<PasswordResetToken> findAllByUser(User user);
}
