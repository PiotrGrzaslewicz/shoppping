package pl.mrook.shopping.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.mrook.shopping.model.User;
import pl.mrook.shopping.service.CurrentUser;
import pl.mrook.shopping.service.SpringDataUserDetailsService;
import pl.mrook.shopping.service.UserService;

import javax.validation.Valid;

@Slf4j
@Controller
public class UserController {

    private final UserService userService;
    private final SpringDataUserDetailsService detailsService;


    public UserController(UserService userService, SpringDataUserDetailsService detailsService) {
        this.userService = userService;
        this.detailsService = detailsService;
    }

    @GetMapping("/user/edit")
    public String editUser(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        User user = customUser.getUser();
        model.addAttribute("user", user);
        return "/user/edit";
    }


    @PostMapping("/user/edit")
    public String editUserExecute(@AuthenticationPrincipal CurrentUser customUser, @Valid User user, BindingResult result,
                                  @RequestParam String email, Model model) {
        User userToEdit = customUser.getUser();
        if (result.hasErrors()) {
            return "/user/edit";
        } else if ((!userService.checkMail(email)) && (!email.equals(userToEdit.getEmail()))) {
            model.addAttribute("msg", "Użytkownik o podanym adresie juz istnieje");
            return "/user/edit";
        } else {

            userToEdit.setEmail(user.getEmail());
            userToEdit.setName(user.getName());
            userToEdit.setSurname(user.getSurname());
            userService.editUser(userToEdit);

            return "redirect:/list/main";
        }
    }

    @GetMapping("/register")
    public String register(Model model) {

        model.addAttribute("user", new User());
        return "/register";
    }

    @PostMapping("/register")
    public String createUser(@RequestParam String repassword, @RequestParam String password, @Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "/register";
        } else if (!userService.checkMail(user.getEmail())) {
            model.addAttribute("msg", "Użytkownik o podanym adresie juz istnieje");
            return "/register";
        } else {

            //        TODO logika tworzenia usera

            userService.saveUser(user);

            return "redirect:/login";
        }

    }

//     if (result.hasErrors()) {
//        return "/user/edit";
//    } else if (!User.checkPassword(user.getPassword())) {
//        model.addAttribute("msg", "Hasło musi mieć co najmniej jedną wielką literę, jedną małą literę i jedną cyfrę oraz długość od 5 do 30 znaków");
//        return "/user/edit";
//    } else if (!(password.equals(repassword))) {
//        model.addAttribute("msg", "Hasła nie są identyczne");
//        return "/user/edit";
//    } else if ((!userService.checkMail(email)) && (!email.equals(user.getEmail()))) {
//        model.addAttribute("msg", "Użytkownik o podanym adresie juz istnieje");
//        return "/user/edit";
//    } else {

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "/login";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        User user = userService.findByEmail(email);
        if (user == null) {
            model.addAttribute("msg", "Niepoprawne dane");
            return "/login";
        } else if (!userService.checkPassword(user, password)) {
            model.addAttribute("msg", "Niepoprawne dane");
            return "/login";
        } else {
//            TODO poprawny user
            log.warn("przeszło testy");
            UserDetails currentUser = detailsService.loadUserByUsername(email);
            return "redirect:/list/main";
        }

    }

    @GetMapping("/user/changepassword")
    public String changePassword(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        model.addAttribute("user", customUser.getUser());
        return "/user/changepassword";
    }


    @PostMapping("/user/changepassword")
    public String changePasswordExecute(@AuthenticationPrincipal CurrentUser customUser, Model model,
                                        @RequestParam String password, @RequestParam String repassword,
                                        @RequestParam String oldPassword) {
        User user = customUser.getUser();


        if (!User.checkPassword(password)) {
            model.addAttribute("msg", "Hasło musi mieć co najmniej jedną wielką literę, jedną małą literę i jedną cyfrę oraz długość od 5 do 30 znaków");
            return "/user/changepassword";
        } else if (!(password.equals(repassword))) {
            model.addAttribute("msg", "Hasła nie są identyczne");
            return "/user/changepassword";
        } else if (!userService.checkPassword(user, oldPassword)) {
            model.addAttribute("msg", "Niepoprawne hasło!!!");
            return "/user/changepassword";
        } else {
            user.setPassword(password);
            userService.saveUser(user);
            return "redirect:/list/main";
        }
    }

}