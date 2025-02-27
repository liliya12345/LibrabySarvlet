package service;

import dao.AuthorDao;
import dto.AuthorDto;
import model.Author;

import java.util.List;

public class AuthorService {
    public void add (Author author) {
        new AuthorDao().save(author);

    }
    public Author findById(Long id) {
       return new AuthorDao().findById(id);
    }
}
