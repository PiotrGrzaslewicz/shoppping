package pl.mrook.shopping.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.mrook.shopping.model.Memo;
import pl.mrook.shopping.model.Product;
import pl.mrook.shopping.model.ShoppingList;
import pl.mrook.shopping.model.User;
import pl.mrook.shopping.service.CurrentUser;
import pl.mrook.shopping.service.MainService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/memo")
public class MemoController {

    private MainService mainService;

    public MemoController(MainService mainService) {
        this.mainService = mainService;
    }

    @PostMapping("/add")
    public String addMemo(@RequestParam String name, @RequestParam String description, @RequestParam Long listId, @RequestParam int type, @AuthenticationPrincipal CurrentUser customUser) {
        ShoppingList shoppingList = mainService.getListById(listId);
        List<Product> products;
        if (type == 2) {
            products = mainService.memoFromList(shoppingList);
        } else if (type == 3) {
            products = mainService.canceledFromList(shoppingList);
        } else {
            products = new ArrayList<>();
        }
        User user = customUser.getUser();
        mainService.createNewMemoForUser(name, description, products, type, user.getId());
        return "redirect:/shop/main";
    }

    @RequestMapping("/saved")
    public String savedMemos(Model model, @AuthenticationPrincipal CurrentUser customUser) {

        //TODO user!!!!!!!!!!!!
        User user = customUser.getUser();
        ShoppingList shoppingList = mainService.prepare(user);

        model.addAttribute("data", mainService.getMemoDataByUserId(user.getId()));
        model.addAttribute("user", user);
        model.addAttribute("list", shoppingList);


        return "/memo/saved";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id, Model model, @AuthenticationPrincipal CurrentUser customUser) {

        Memo memo = mainService.getMemoById(id);

//        TODO user!!!!!

        User user = customUser.getUser();
        model.addAttribute("memo", memo);
        model.addAttribute("user", user);

        return "/memo/confirmdelete";
    }

    @GetMapping("/confirmdelete/{id}")
    public String confirmDelete(@PathVariable Long id){
        mainService.deleteMemoById(id);
        return "redirect:/memo/saved";
    }
}
