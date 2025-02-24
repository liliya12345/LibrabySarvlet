package transform;

import dao.AuthorDao;
import dto.AuthorDto;
import dto.BookDto;
import dto.CategoryDto;
import model.Author;
import model.Book;

import java.util.ArrayList;
import java.util.List;

public class BookToBookDtoTransformer {
    public BookDto transform(Book book) {
        BookDto bookDto = new BookDto();
        bookDto.setId(book.getId());
        bookDto.setTitle(book.getTitle());
        bookDto.setDescription(book.getDescription());
        bookDto.setYear(book.getYear());
        bookDto.setPublisher(book.getPublisher());
        bookDto.setImagePath(book.getImagePath());
        bookDto.setCategoryDto(new CategoryDto(book.getCategory().getId(),book.getCategory().getName()));
        List<Author> authors = new AuthorDao().authorListByBookId(book.getId());
        List<AuthorDto> authorsDto = new ArrayList<>();
        authors.forEach(author ->  { authorsDto.add(new AuthorDto(author.getId(),author.getFirstName(),author.getLastName()));
        });
        bookDto.setAuthor(authorsDto);
        return bookDto;
    }
}
