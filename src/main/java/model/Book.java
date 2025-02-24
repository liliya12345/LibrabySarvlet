package model;

import jakarta.persistence.Entity;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity


@Table(name="books")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String title;
    @Column
    private String description;
    @Column
    private String publisher;
    @Column
    private Integer year;
    @Column(name="image_path")
    private String imagePath;
//    @Enumerated(EnumType.STRING)
//    private Language language;
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Author> author;
    @ManyToOne
    private Category category;
    @OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER, mappedBy = "book")
    private List<UserBook> usersBook = new ArrayList<>();




    public Book() {
    }

    public Book(Long id, String title, String description, String publisher, Integer year, String imagePath, List<Author> author, Category category) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.publisher = publisher;
        this.year = year;
        this.imagePath = imagePath;
        this.author = author;
        this.category = category;
    }

    public Book(Long id, String title, String description, String publisher, Integer year, String imagePath, List<Author> author, Category category, List<UserBook> usersBook) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.publisher = publisher;
        this.year = year;
        this.imagePath = imagePath;
        this.author = author;
        this.category = category;
        this.usersBook = usersBook;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public List<Author> getAuthor() {
        return author;
    }

    public void setAuthor(List<Author> author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public List<UserBook> getUsersBook() {
        return usersBook;
    }

    public void setUsersBook(List<UserBook> usersBook) {
        this.usersBook = usersBook;
    }
//    @OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER, mappedBy = "book")
//    private List<UserBook> usersBook = new ArrayList<>();
//    @OneToMany (cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "book")
//    private List<Image> images = new ArrayList<>();

}
