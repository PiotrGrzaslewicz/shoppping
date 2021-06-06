package pl.mrook.shopping.service;

import pl.mrook.shopping.model.*;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public interface MainService {


    ShoppingList prepare(User user);

    User getUserById(long id);

    ShoppingList execute(ShoppingList baseList);

    Map<Category, List<Product>> dataFromList(ShoppingList shoppingList);

    void addProductToCategoryAndShoppingList(Long categoryId, Long shoppingListId, String name);

    void removeProduct (Long id);

    void removeCategoryFromList(Long categoryId, Long listId);

    void addNewCategoryToList(Long listId, String categoryName);

    void changeListName(Long listId, String name);

    boolean checkCategoryNameForList(Long listId, String categoryName);

    List<ShoppingList> getUserLists(long userId);

    TreeMap<ShoppingList, Integer> getOrderedUserLists (long userId);


    void loadList(Long id);

    ShoppingList createNewForUser(User user, String name, List<String> categories);

    void saveList(ShoppingList shoppingList);

    ShoppingList getListById(Long id);

    void setProductStatusById(Long productId, int status);

    List<Product> memoFromList(ShoppingList shoppingList);

    List<Product> canceledFromList(ShoppingList shoppingList);

    void resetProducts(Long id);

    void deleteListById(Long id);

    void createNewMemoForUser(String name, String description, List<Product> list, int type, Long userId);

    TreeMap<Memo, List<String>> getMemoDataByUserId(long userId);

    Memo getMemoById(Long memoId);

    void deleteMemoById(Long memoId);

    boolean testListForSuccess(ShoppingList shoppingList);
}