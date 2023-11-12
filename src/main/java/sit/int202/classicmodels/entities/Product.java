package sit.int202.classicmodels.entities;

import jakarta.persistence.*;


@NamedQueries({
        @NamedQuery(name = "Product.FindAll", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "Product.count", query = "SELECT COUNT(p) FROM Product p")
})
@Table(name = "products", indexes = {
        @Index(name = "productLine", columnList = "productLine")
})
@Entity
public class Product {
    @Id
    @Column(name = "productCode", nullable = false, length = 15)

    private String id;

    @Column(name = "productLine")
    private String productLine;
}