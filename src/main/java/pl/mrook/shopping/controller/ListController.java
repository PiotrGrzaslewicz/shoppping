package pl.mrook.shopping.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.mrook.shopping.model.Memo;
import pl.mrook.shopping.model.ShoppingList;
import pl.mrook.shopping.model.User;
import pl.mrook.shopping.service.CurrentUser;
import pl.mrook.shopping.service.MainService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.TreeMap;

@Slf4j
@Controller
@RequestMapping("/list")
public class ListController {

    private MainService mainService;


    public ListController(MainService mainService) {
        this.mainService = mainService;
    }


    @RequestMapping("/main")
    public String start(Model model, @AuthenticationPrincipal CurrentUser customUser) {

//TODO user !!!!

        //tu bedzie zmiana jak zrobie funkcjonalnosc user
//        User user = mainService.getUserById(1);

        User user = customUser.getUser();

        String message = (String) model.getAttribute("msg");
        model.addAttribute("message", message);
        ShoppingList shoppingList = mainService.prepare(user);
        model.addAttribute("data", mainService.dataFromList(shoppingList));
        model.addAttribute("list", shoppingList);
        model.addAttribute("user", user);
        model.addAttribute("nameCheck", true);

        return "list/main";
    }

    @PostMapping("/addproduct")
    public String addProduct(@RequestParam String name, @RequestParam Long listId, @RequestParam Long categoryId) {

        mainService.addProductToCategoryAndShoppingList(categoryId, listId, name);

        return "redirect:/list/main";
    }

    @GetMapping("/removeproduct/{id}")
    public String removeProduct(@PathVariable Long id) {

        mainService.removeProduct(id);

        return "redirect:/list/main";
    }

    @GetMapping("/removecategory/{categoryId}/{listId}")
    public String removeCategory(@PathVariable Long categoryId, @PathVariable Long listId) {

        mainService.removeCategoryFromList(categoryId, listId);

        return "redirect:/list/main";
    }

    @PostMapping("/addcategory")
    public String addCategory(@RequestParam String name, @RequestParam Long listId, Model model, @AuthenticationPrincipal CurrentUser customUser) {

        boolean nameCheck = mainService.checkCategoryNameForList(listId, name);
        if (nameCheck) {
            mainService.addNewCategoryToList(listId, name);
        }
        model.addAttribute("nameCheck", nameCheck);

//TODO user !!!!
        //tu bedzie zmiana jak zrobie funkcjonalnosc user
        User user = customUser.getUser();
        ShoppingList shoppingList = mainService.prepare(user);
        model.addAttribute("data", mainService.dataFromList(shoppingList));
        model.addAttribute("list", shoppingList);
        model.addAttribute("user", user);

        return "list/main";
    }

    @PostMapping("/changename")
    public String changeName(@RequestParam String name, @RequestParam Long listId) {

        mainService.changeListName(listId, name);

        return "redirect:/list/main";
    }

    @GetMapping("/saved")
    public String savedLists(Model model, @AuthenticationPrincipal CurrentUser customUser) {

//TODO user !!!!
        User user = customUser.getUser();

        TreeMap<ShoppingList, Integer> lists = mainService.getOrderedUserLists(user.getId());
        model.addAttribute("lists", lists);
        model.addAttribute("user", user);
        return "list/saved";
    }

    @GetMapping("/loadlist/{id}")
    public String loadList(@PathVariable Long id) {
        mainService.loadList(id);
        return "redirect:/list/main";
    }

    @PostMapping("/add")
    public String createList(@RequestParam String name, @RequestParam(required = false) List<String> categories, RedirectAttributes redirectAttributes, @AuthenticationPrincipal CurrentUser customUser) {

        User user = customUser.getUser();
        if (categories==null) {redirectAttributes.addFlashAttribute("msg", "Musisz wybrać co najmniej jedną kategorię");} else {
        ShoppingList list = (mainService.createNewForUser(user, name, categories));
        mainService.saveList(list);}
        return "redirect:/list/main";
    }


    @GetMapping("/delete/{id}")
    public String deleteList(@PathVariable Long id, Model model, @AuthenticationPrincipal CurrentUser customUser) {
        ShoppingList shoppingList = mainService.getListById(id);

//        TODO user!!!!!

        User user = customUser.getUser();
        model.addAttribute("list", shoppingList);
        model.addAttribute("user", user);
        return "/list/confirmdelete";
    }

    @GetMapping("/confirmdelete/{id}")
    public String confirmDelete(@PathVariable Long id){
        mainService.deleteListById(id);
        return "redirect:/list/saved";
    }

}