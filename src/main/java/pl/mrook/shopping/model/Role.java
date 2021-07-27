package pl.mrook.shopping.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name="roles", uniqueConstraints = @UniqueConstraint(name="UniqueRole", columnNames = {"name"}))
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(unique = true, name = "name")
    private String name;

}