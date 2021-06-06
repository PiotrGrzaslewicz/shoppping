package pl.mrook.shopping.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "lists")
@Setter
@Getter

public class ShoppingList implements Comparable<ShoppingList> {


    @Override
    public int compareTo(ShoppingList list) {
        return this.getCreated().compareTo(list.getCreated());
    }

    public ShoppingList() {
        this.categories = new ArrayList<>();

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    @OneToMany(mappedBy = "id", cascade = CascadeType.ALL)
    private List<Product> products;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Category> categories;
    @ManyToOne
    private User user;
    private LocalDateTime created;
    private LocalDateTime updated;
    private int exec;


    public void update () {
        this.updated = LocalDateTime.now();
    }

    @PrePersist
    private void logCreated () {
        this.created = LocalDateTime.now();
        this.updated = LocalDateTime.now();
    }


    public void addCategory(Category category) {
        this.categories.add(category);
    }

    public void removeCategory(Category category) {
        this.categories.remove(category);
    }

    public void removeProduct(Product product) {
        this.products.remove(product);
    }

    public String getDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return this.created.format(formatter);
    }
}
