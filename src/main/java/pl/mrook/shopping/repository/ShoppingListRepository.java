package pl.mrook.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.mrook.shopping.model.Category;
import pl.mrook.shopping.model.Product;
import pl.mrook.shopping.model.ShoppingList;
import pl.mrook.shopping.model.User;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface ShoppingListRepository extends JpaRepository<ShoppingList, Long> {


    @Query(value = "SELECT * FROM lists WHERE user_id = ?1 ORDER BY updated DESC LIMIT 1",
            nativeQuery = true)

    ShoppingList getLastUpdatedByUser(long id);

    List<ShoppingList> findAllByUser(User user);

    @Modifying
    @Transactional
    @Query(value = "DELETE from products WHERE list_id = ?1", nativeQuery = true)
    void clearListProducts(Long id);

    @Modifying
    @Transactional
    @Query(value = "DELETE from products WHERE category_id = ?1", nativeQuery = true)
    void clearListCategories(Long id);

    @Modifying
    @Transactional
    void deleteAllByUser(User user);


}
