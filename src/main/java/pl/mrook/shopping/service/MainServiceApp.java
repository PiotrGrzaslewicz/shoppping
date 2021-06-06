package pl.mrook.shopping.service;

import antlr.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import pl.mrook.shopping.model.*;
import pl.mrook.shopping.repository.*;

import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@Primary
public class MainServiceApp implements MainService {

    private ShoppingListRepository shoppingListRepository;
    private ProductRepository productRepository;
    private CategoryRepository categoryRepository;
    private UserRepository userRepository;
    private MemoRepository memoRepository;


    public MainServiceApp(ShoppingListRepository shoppingListRepository, ProductRepository productRepository, CategoryRepository categoryService, UserRepository userRepository, MemoRepository memoRepository) {
        this.shoppingListRepository = shoppingListRepository;
        this.productRepository = productRepository;
        this.categoryRepository = categoryService;
        this.userRepository = userRepository;
        this.memoRepository = memoRepository;

    }

    @Override
    public ShoppingList prepare(User user) {

        ShoppingList shoppingList = shoppingListRepository.getLastUpdatedByUser(user.getId());
        if (shoppingList == null) {

            List<String> categories = Arrays.asList("Nabiał", "Pieczywo", "Mięso");
            shoppingList = createNewForUser(user, "Moja lista", categories);
            shoppingListRepository.save(shoppingList);
        }
        return shoppingList;
    }

    public TreeMap<Category, List<Product>> dataFromList(ShoppingList shoppingList) {
        TreeMap<Category, List<Product>> data = new TreeMap<>();
        shoppingList.getCategories().stream()
                .forEach(c -> {
                    List<Product> list = productRepository.findAllByShoppingListAndAndCategory(shoppingList, c);
                    c.setStatus(checkSuccessForCategoryAsList(list));
                    categoryRepository.save(c);
                    data.put(c, list);
                });
        return data;
    }

    @Override
    public void changeListName(Long listId, String name) {
        ShoppingList list = shoppingListRepository.getById(listId);
        list.setName(name);
        shoppingListRepository.save(list);
    }

    private int checkSuccessForCategoryAsList(List<Product> list) {
        if (list.size() == 0) {
            return 0;
        } else if (list.stream().filter(el -> el.getStatus() == 0).collect(Collectors.toList()).size() > 0) {
            return 0;
        } else {
            return 1;
        }
    }

    public void addNewCategoryToList(Long listId, String categoryName) {

        Category category = new Category();
        category.setName(categoryName);
        ShoppingList list = shoppingListRepository.getById(listId);
        list.addCategory(category);
        categoryRepository.save(category);
        shoppingListRepository.save(list);
        log.warn("create category");
    }

    public boolean checkCategoryNameForList(Long listId, String categoryName) {

        ShoppingList list = shoppingListRepository.getById(listId);
        List<String> nameList = list.getCategories().stream()
                .map(c -> c.getName())
                .collect(Collectors.toList());
        if (nameList.contains(categoryName)) {
            return false;
        } else {
            return true;
        }
    }

    public void removeCategoryFromList(Long categoryId, Long listId) {
        ShoppingList shoppingList = shoppingListRepository.getById(listId);
        Category category = categoryRepository.getById(categoryId);
        shoppingList.removeCategory(category);
        productRepository.deleteProductsFromCategory(category);
        shoppingListRepository.save(shoppingList);
        categoryRepository.deleteById(categoryId);
        log.warn("remove category");
    }


    public List<Product> memoFromList(ShoppingList shoppingList) {
        return productRepository.findAllByStatusAndShoppingList(2, shoppingList);
    }

    public List<Product> canceledFromList(ShoppingList shoppingList) {
        return productRepository.findAllByStatusAndShoppingList(3, shoppingList);
    }

    public void addProductToCategoryAndShoppingList(Long categoryId, Long shoppingListId, String name) {
        Product product = new Product();
        product.setName(name.replaceAll(";", ""));
        ShoppingList shoppingList = shoppingListRepository.getById(shoppingListId);
        Category category = categoryRepository.getById(categoryId);
        product.setShoppingList(shoppingList);
        product.setCategory(category);
        product.setStatus(0);
        productRepository.save(product);
        log.warn("create product");
    }

    public void removeProduct(Long id) {
        Product product = productRepository.getById(id);
        ShoppingList list = product.getShoppingList();
        list.removeProduct(product);
        shoppingListRepository.save(list);
        productRepository.deleteById(id);
    }

    public void setProductStatusById(Long productId, int status) {
        Product product = productRepository.getById(productId);
        product.setStatus(status);
        productRepository.save(product);
    }


    public void productReset(Product product) {
        product.setStatus(0);
    }

//    public void createMemo(ShoppingList shoppingList, String name, User user, int type) {
//        Memo memo = new Memo();
//        memo.setName(name);
//        memo.setType(type);
//        memo.setUser(user);
//        List<Product> list = productRepository.findAllByStatusAndShoppingList(2, shoppingList);
//        memo.setProducts(list);
//        memoRepository.save(memo);
//    }


    @Override
    public User getUserById(long id) {
        return userRepository.getById(id);
    }


    public ShoppingList execute(ShoppingList baseList) {
        ShoppingList execList = new ShoppingList();
        List<Product> productList = new ArrayList<>();
        baseList.getProducts().stream()
                .forEach(el -> productList.add(el));
        execList.setProducts(productList);
        execList.setUser(baseList.getUser());
        execList.setName(baseList.getName() + " w SKLEPIE");
        execList.setExec(1);
        shoppingListRepository.save(execList);
        baseList.update();
        shoppingListRepository.save(baseList);
        return execList;
    }

    public void resetProducts(Long id) {
        ShoppingList shoppingList = shoppingListRepository.getById(id);

        productRepository.resetProductsFromList(shoppingList);

    }

    public ShoppingList createNewForUser(User user, String name, List<String> categories) {

        ShoppingList shoppingList = new ShoppingList();
        categories.forEach(el -> {
            Category category = new Category();
            category.setName(el);
            shoppingList.addCategory(category);
        });

        shoppingList.setUser(user);
        shoppingList.setName(name);
        return shoppingList;
    }

    public List<ShoppingList> getUserLists(long userId) {
        User user = userRepository.getById(userId);
        List<ShoppingList> list = shoppingListRepository.findAllByUser(user);
        return list;
    }

    public TreeMap<ShoppingList, Integer> getOrderedUserLists(long userId) {
        List<ShoppingList> list = getUserLists(userId);
        TreeMap<ShoppingList, Integer> map = new TreeMap<>(Collections.reverseOrder());
        for (int i = 0; i < list.size(); i++) {
            map.put(list.get(i), i);
        }
        return map;
    }

    public void loadList(Long id) {
        ShoppingList list = shoppingListRepository.getById(id);
        list.update();
        shoppingListRepository.save(list);
    }

    public void saveList(ShoppingList shoppingList) {
        log.info("saving");
        shoppingListRepository.save(shoppingList);
    }

    public ShoppingList getListById(Long id) {
        return shoppingListRepository.getById(id);
    }

    @Override
    public void deleteListById(Long id) {
//        ShoppingList shoppingList = shoppingListRepository.getById(id);
//        shoppingList.getProducts().forEach(productRepository::delete);
//        shoppingList.getCategories().forEach(categoryRepository::delete);
//        shoppingListRepository.deleteById(id);
        shoppingListRepository.clearListProducts(id);
        shoppingListRepository.clearListCategories(id);
        shoppingListRepository.deleteById(id);

    }


    public void createNewMemoForUser(String name, String description, List<Product> list, int type, Long userId) {
        User user = getUserById(userId);
        Memo memo = Memo.builder().name(name).description(description).type(type).user(user).items("").build();

        list.forEach(p -> memo.addProduct(p.getName() + ";"));
        memoRepository.save(memo);

    }

    @Override
    public TreeMap<Memo, List<String>> getMemoDataByUserId(long userId) {
        User user = userRepository.getById(userId);
        TreeMap<Memo, List<String>> map = new TreeMap<>(Collections.reverseOrder());
        List<Memo> list = memoRepository.findAllByUser(user);
        list.forEach(memo -> {
            List<String> items = Arrays.asList(memo.getItems().split(";"));
            map.put(memo, items);
        });

        return map;
    }

    @Override
    public Memo getMemoById(Long memoId) {
        return memoRepository.getById(memoId);
    }

    @Override
    public void deleteMemoById(Long memoId) {
        memoRepository.deleteById(memoId);
    }

    @Override
    public boolean testListForSuccess(ShoppingList shoppingList) {
        boolean test = true;
        if (productRepository.checkSuccess(shoppingList).size() > 0) {
            test = false;
        }
        return test;
    }

}