package service;

import dao.UserBookDao;
import dao.UserDao;
import jakarta.servlet.http.HttpServletResponse;
import model.UserBook;

import java.util.List;
import java.util.Optional;

public class UserBookService {
    public void returnBook(int userId, Long bookId) {
        List<UserBook> byUserId = new UserBookDao().findUserBooksByUsersId(userId);
        Optional<UserBook> first = byUserId.stream().filter(u -> u.getBook().getId().equals(bookId)).findFirst();
//        Optional<UserBook> first = byUserId.stream().filter(u -> u.getBook().getId().equals(bookId)).findFirst();
        if (first.isPresent()) {
            UserBook userBook=  first.get();
            userBook.setReturned(true);
            new UserBookDao().save(userBook);
        }
    }
//    public boolean findStatus(Long bookId) {
//
//    }

}
