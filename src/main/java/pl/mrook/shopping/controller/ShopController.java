package pl.mrook.shopping.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mrook.shopping.model.ShoppingList;
import pl.mrook.shopping.model.User;
import pl.mrook.shopping.service.CurrentUser;
import pl.mrook.shopping.service.MainService;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {

    private MainService mainService;

    public ShopController(MainService mainService) {
        this.mainService = mainService;
    }


    @RequestMapping("/main")
    public String main(HttpSession session, Model model, @AuthenticationPrincipal CurrentUser customUser) {
//TODO user !!!!
        //tu bedzie zmiana jak zrobie funkcjonalnosc user
        User user = customUser.getUser();
        ShoppingList shoppingList = mainService.prepare(user);
//        ShoppingList shoppingList = mainService.getListById(id);
        model.addAttribute("data", mainService.dataFromList(shoppingList));
        model.addAttribute("list", shoppingList);
        model.addAttribute("user", user);
        model.addAttribute("memo", mainService.memoFromList(shoppingList));
        model.addAttribute("cancelled", mainService.canceledFromList(shoppingList));
        model.addAttribute("success", mainService.testListForSuccess(shoppingList));

        return "shop/main";
    }

    @RequestMapping("/reset/{id}")
    public String resetList(@PathVariable Long id) {
        mainService.resetProducts(id);
        return "redirect:/shop/main";
    }

    @RequestMapping("/reset/product/{id}/{listId}")
    public String resetProduct(@PathVariable Long id, @PathVariable Long listId) {
        mainService.setProductStatusById(id, 0);
        return "redirect:/shop/main";
    }


    @RequestMapping("/success/product/{id}/{listId}")
    public String successProduct(@PathVariable Long id, @PathVariable Long listId) {
        mainService.setProductStatusById(id, 1);
        return "redirect:/shop/main";
    }

    @RequestMapping("/memo/product/{id}/{listId}")
    public String memoProduct(@PathVariable Long id, @PathVariable Long listId) {
        mainService.setProductStatusById(id, 2);
        return "redirect:/shop/main";
    }

    @RequestMapping("/cancel/product/{id}/{listId}")
    public String cancelProduct(@PathVariable Long id, @PathVariable Long listId) {
        mainService.setProductStatusById(id, 3);
        return "redirect:/shop/main";
    }


}

