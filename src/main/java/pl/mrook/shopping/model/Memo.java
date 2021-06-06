package pl.mrook.shopping.model;


import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="memos")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Memo implements Comparable<Memo> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String description;
    private LocalDateTime created;

    private String items;

    private int type;
    @ManyToOne
    private User user;

    @PrePersist
    private void logCreated () {
        this.created = LocalDateTime.now();
    }



    public void addProduct(String product) {
        this.items = this.items + product;
    }

    @Override
    public int compareTo(Memo memo) {
        return this.created.compareTo(memo.created);
    }

    public String getDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return this.created.format(formatter);
    }
}
