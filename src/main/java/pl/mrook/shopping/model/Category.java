package pl.mrook.shopping.model;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="categories")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data

public class Category implements Comparable<Category> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private int status = 0;
    @OneToMany(mappedBy = "id", cascade = CascadeType.ALL)
    private List<Product> products;


//    public void removeProduct(Product product) {
//        this.products.remove(product);
//    }
//
//    public void clearProducts() {
//        this.products = new ArrayList<>();
//
//    }


    @Override
    public int compareTo(Category o) {
        return this.getName().compareTo(o.getName());
    }
}