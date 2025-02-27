package service;
import dao.AuthorDao;
import dao.BookDao;
import dao.UserBookDao;
import dao.UserDao;
import dto.AuthorDto;
import dto.BookDto;
import model.Book;
import model.User;
import model.UserBook;
import transform.BookToBookDtoTransformer;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class BookService {
  public List<Book> findByTitle(String title) {
   return new BookDao().findAll()
              .stream()
              .filter(book->book.getTitle().contains(title))
              .toList();
  }
  public List<Book> findByAuthor(String author) {

return new BookDao().findBooksByAuthorName(author);
  }

  public List<BookDto> findAllBookDto(){
      List<Book> allBook = new BookDao().findAll();
      List<BookDto> bookDtos = new ArrayList<>();
      allBook.forEach(book -> bookDtos.add(new BookToBookDtoTransformer().transform(book)));
  return bookDtos;
  }

public List<BookDto> findAllBookDtoByCategoryId(Long id) {
          List<Book> allBook = new BookDao().findByCategoryId(id);
          List<BookDto> bookDtos = new ArrayList<>();
          allBook.forEach(book -> bookDtos.add(new BookToBookDtoTransformer().transform(book)));
          return bookDtos;
      }


  public Set<BookDto> findAllBookDtoByAuthorOrByTitle(String text){
      List<BookDto> allBookDto = findAllBookDto();
      Set<BookDto> bookDtos = new HashSet<>();
      for (BookDto book : allBookDto) {
          if(book.getTitle().contains(text)){
              bookDtos.add(book);
          }
          for (AuthorDto authorDto : book.getAuthor()) {
              if(authorDto.getFirstName().contains(text) || authorDto.getLastName().contains(text)){
                  bookDtos.add(book);
              }
          }
      }

   return bookDtos;
  }

  public void booking(Long bookId, int userId){
      Book book = new BookDao().findById(bookId);
      UserBook userBook = new UserBook();
      userBook.setBook(book);
      User user = new UserDao().findById(userId);
      userBook.setUser(user);
      userBook.setDateOfLoan(LocalDate.now());
      userBook.setDateOfReturn(LocalDate.now().plusMonths(1));
      userBook.setReturned(false);
//      userBook.setId(1L);
       new UserBookDao().save(userBook);


  }
}
