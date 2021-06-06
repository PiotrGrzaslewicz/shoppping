package pl.mrook.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.mrook.shopping.model.Category;
import pl.mrook.shopping.model.ShoppingList;
import pl.mrook.shopping.model.User;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface UserRepository extends JpaRepository<User, Long> {


    User findByEmail(String email);

}
