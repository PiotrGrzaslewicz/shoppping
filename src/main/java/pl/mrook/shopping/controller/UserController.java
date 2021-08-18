package pl.mrook.shopping.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.mrook.shopping.model.PasswordResetToken;
import pl.mrook.shopping.model.User;
import pl.mrook.shopping.repository.PasswordResetTokenRepository;
import pl.mrook.shopping.service.CurrentUser;
import pl.mrook.shopping.service.MailService;
import pl.mrook.shopping.service.SpringDataUserDetailsService;
import pl.mrook.shopping.service.UserService;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Locale;
import java.util.UUID;

@Slf4j
@Controller
public class UserController {

    private final UserService userService;
    private final SpringDataUserDetailsService detailsService;
    private final MessageSource messageSource;
    private final PasswordResetTokenRepository passwordResetTokenRepository;


    public UserController(UserService userService, SpringDataUserDetailsService detailsService, MailService mailService, MessageSource messageSource, PasswordResetTokenRepository passwordResetTokenRepository) {
        this.userService = userService;
        this.detailsService = detailsService;
        this.messageSource = messageSource;
        this.passwordResetTokenRepository = passwordResetTokenRepository;
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
        } else if (!User.checkPassword(user.getPassword())) {
            model.addAttribute("msg", "Hasło musi mieć co najmniej jedną wielką literę, jedną małą literę i jedną cyfrę oraz długość od 5 do 30 znaków");
            return "/register";
        } else if (!(password.equals(repassword))) {
            model.addAttribute("msg", "Hasła nie są identyczne");
            return "/register";
        } else if (!userService.checkMail(user.getEmail())) {
            model.addAttribute("msg", "Użytkownik o podanym adresie juz istnieje");
            return "/register";
        } else {

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
//
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

    @GetMapping("/demo")
    public String launchDemo(HttpServletRequest request) {
        userService.resetDemoUser();
        authWithHttpServletRequest(request, "demo@demo", "Demo1");
        return "redirect:/list/main";
    }

    public void authWithHttpServletRequest(HttpServletRequest request, String username, String password) {
        try {
            request.login(username, password);
        } catch (ServletException e) {
            log.error("Error while login ", e);
        }
    }

    @GetMapping("/resetPassword")
    public String resetPasswordForm() {
        return "resetPasswordInput";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(Model model, @RequestParam String username, HttpServletRequest request) throws MessagingException {
        String msg;
        User user = userService.findByEmail(username);
        if (user == null) {
            msg = messageSource.getMessage("noUserFound", null, request.getLocale());
        } else {

            String token = UUID.randomUUID().toString();
            userService.createPasswordResetTokenForUser(user, token);
            userService.sendPasswordResetEmail(user, token, request.getRequestURL().toString(), request.getLocale());

            msg = messageSource.getMessage("resetEmailSent", null, request.getLocale());
        }
        model.addAttribute("msg", msg);
        return "resetPasswordEffect";
    }

    @GetMapping("/resetPassword/reset")
    public String resetPasswordCheckToken(@RequestParam String token, Locale locale, Model model) {
        String result = userService.validatePasswordResetToken(token);
        switch (result) {
            case "OK":
                PasswordResetToken currentToken = passwordResetTokenRepository.findByToken(token);
                User user = currentToken.getUser();
                model.addAttribute("user", user);
                model.addAttribute("token", token);
                return "getNewPassword";
            case "invalid":
                model.addAttribute("msg", messageSource.getMessage("invalidResetPasswordToken", null, locale));
                break;
            case "expired":
                model.addAttribute("msg", messageSource.getMessage("expiredResetPasswordToken", null, locale));
                break;
        }
        return "resetPasswordEffect";
    }

    @PostMapping("/resetPasswordConfirmed")
    public String resetPasswordFinal(@RequestParam String password, @RequestParam String repassword, Model model, Locale locale, @RequestParam Long id
            , @RequestParam String token) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        if (!User.checkPassword(password)) {
            model.addAttribute("msg", "Hasło musi mieć co najmniej jedną wielką literę, jedną małą literę i jedną cyfrę oraz długość od 5 do 30 znaków");
            return "/getNewPassword";
        } else if (!(password.equals(repassword))) {
            model.addAttribute("msg", "Hasła nie są identyczne");
            return "getNewPassword";
        } else  {
            user.setPassword(password);
            userService.saveUser(user);
            model.addAttribute("msg", messageSource.getMessage("passwordResetConfirmed", null, locale));
            return "resetPasswordEffect";
        }
    }

}