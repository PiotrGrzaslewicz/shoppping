package pl.mrook.shopping.service;

import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
public class CurrentUser extends User {
    private final pl.mrook.shopping.model.User user;
    public CurrentUser(String email, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       pl.mrook.shopping.model.User user) {
        super(email, password, authorities);
        this.user = user;
    }
    public pl.mrook.shopping.model.User getUser() {return user;}
}