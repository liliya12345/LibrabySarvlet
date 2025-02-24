package model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table( name="user_books")
public class UserBook {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(cascade = CascadeType.ALL)
    private User user;
    @ManyToOne(cascade = CascadeType.ALL)
    private Book book;
    @Column (name="date_of_loans")
    private LocalDate dateOfLoan;
    @Column (name="date_of_return")
    private LocalDate dateOfReturn;
    @Column(name="returned")
    private boolean returned;

    public UserBook(Long id, User user, Book book, LocalDate dateOfLoan, LocalDate dateOfReturn, boolean returned) {
        this.id = id;
        this.user = user;
        this.book = book;
        this.dateOfLoan = dateOfLoan;
        this.dateOfReturn = dateOfReturn;
        this.returned = returned;
    }

    public UserBook() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public LocalDate getDateOfLoan() {
        return dateOfLoan;
    }

    public void setDateOfLoan(LocalDate dateOfLoan) {
        this.dateOfLoan = dateOfLoan;
    }

    public LocalDate getDateOfReturn() {
        return dateOfReturn;
    }

    public void setDateOfReturn(LocalDate dateOfReturn) {
        this.dateOfReturn = dateOfReturn;
    }

    public boolean isReturned() {
        return returned;
    }

    public void setReturned(boolean returned) {
        this.returned = returned;
    }
}
