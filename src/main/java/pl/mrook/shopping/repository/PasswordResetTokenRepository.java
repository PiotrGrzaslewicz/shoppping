package pl.mrook.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrook.shopping.model.PasswordResetToken;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {
    PasswordResetToken findByToken(String token);
}
