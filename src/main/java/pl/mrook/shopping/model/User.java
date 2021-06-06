package pl.mrook.shopping.model;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Size(min=3, max=20)
    private String name;
    @Size(min=3, max=30)
    private String surname;
    @Email
    @Column(unique = true)
    private String email;
    private String password;
    private int enabled;
    @OneToMany(mappedBy = "user")
    private List<ShoppingList> lists;
    @OneToMany(mappedBy = "user")
    private List<Memo> memos;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    public static boolean checkPassword(String pass) {
        int count = 0;

        if( 5 <= pass.length() && pass.length() <= 30  )
        {
            if( pass.matches(".*\\d.*") )
                count ++;
            if( pass.matches(".*[a-z].*") )
                count ++;
            if( pass.matches(".*[A-Z].*") )
                count ++;
        }
        return count >= 2;
    }
}