package pl.mrook.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.mrook.shopping.model.Category;
import pl.mrook.shopping.model.Product;
import pl.mrook.shopping.model.ShoppingList;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findAllByShoppingListAndAndCategory(ShoppingList shoppingList, Category category);

    List<Product> findAllByStatusAndShoppingList(int i, ShoppingList shoppingList);

    @Modifying
    @Transactional
    @Query("delete from Product p where p.category = ?1")
    void deleteProductsFromCategory(Category category);

    @Modifying
    @Transactional
    @Query("update Product p set p.status=0 where p.shoppingList = ?1")
    void resetProductsFromList(ShoppingList shoppingList);

    @Override
    @Modifying
    @Transactional
    @Query(value = "delete from products where id=?1", nativeQuery = true)
    void deleteById(Long id);

    @Query("select p from Product p where p.shoppingList = ?1 and p.status = 0")
    List<Product> checkSuccess(ShoppingList shoppingList);
}
