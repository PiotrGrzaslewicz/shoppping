package pl.mrook.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.mrook.shopping.repository.CategoryRepository;
import pl.mrook.shopping.repository.ProductRepository;
import pl.mrook.shopping.repository.ShoppingListRepository;
import pl.mrook.shopping.service.MainService;

@Controller
public class TestController {



    private MainService mainService;
    private ShoppingListRepository shoppingListRepository;
    private CategoryRepository categoryRepository;
    private ProductRepository productRepository;

    public TestController(MainService mainService, ShoppingListRepository shoppingListRepository, CategoryRepository categoryRepository, ProductRepository productRepository) {

        this.mainService = mainService;
        this.shoppingListRepository = shoppingListRepository;
        this.categoryRepository = categoryRepository;
        this.productRepository = productRepository;
    }


//    @RequestMapping("/")
//    public String test () {
//        return "main";
//    }

    @RequestMapping("/memos")
    public String memos() {
        return "saved";
    }

    @RequestMapping("/memo")
    public String memo() {
        return "memo/memo";
    }

    @RequestMapping("/lists")
    public String lists() {
        return "saved";
    }

    @RequestMapping("/test")

    public String test() {



        return "main_templ";
    }

    @RequestMapping("/testname")
    @ResponseBody
    public String testName() {


        boolean nameCheck = mainService.checkCategoryNameForList(1L, "aaa");

        return Boolean.toString(nameCheck);
    }

}