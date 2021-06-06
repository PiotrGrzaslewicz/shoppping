package pl.mrook.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {
        return "redirect:/list/main";
    }

//    @RequestMapping("/error")
//    public String error() {
//        return "404";
//    }

}
