package service;

import dao.UserBookDao;
import dao.UserDao;
import jakarta.servlet.http.HttpServletResponse;
import model.UserBook;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class UserBookService {
    public Boolean returnBook(int userId, Long bookId) {
        List<UserBook> byUserId = new UserBookDao().findUserBooksByUsersId(userId);
        Optional<UserBook> first = byUserId.stream().filter(u -> u.getBook().getId().equals(bookId)).findFirst();
//        Optional<UserBook> first = byUserId.stream().filter(u -> u.getBook().getId().equals(bookId)).findFirst();
        if (first.isPresent()) {
            UserBook userBook = first.get();
            if(userBook.isReturned()){
                return false;
            }
            userBook.setReturned(true);
            new UserBookDao().save(userBook);
            return true;

        }
  return false;

    }
    public void uppdateDateOfReturn(int userId, Long bookId){
        List<UserBook> byUserId = new UserBookDao().findUserBooksByUsersId(userId);
        for (UserBook userBook : byUserId) {
            if(userBook.getBook().getId().equals(bookId) && !userBook.isReturned()){
                LocalDate localDate = userBook.getDateOfReturn().plusDays(30);
                userBook.setDateOfReturn(localDate);
                new UserBookDao().save(userBook);
            }

        }



//        Optional<UserBook> first = byUserId.stream().filter(u -> u.getBook().getId().equals(bookId)).findFirst();
////        Optional<UserBook> first = byUserId.stream().filter(u -> u.getBook().getId().equals(bookId)).findFirst();
//        if (first.isPresent()) {
//            UserBook userBook = first.get();
//            LocalDate localDate = userBook.getDateOfReturn().plusDays(30);
//            userBook.setDateOfReturn(localDate);
//            new UserBookDao().save(userBook);
//
//        }

    }
}

