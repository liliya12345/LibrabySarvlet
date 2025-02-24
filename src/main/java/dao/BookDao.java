package dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import model.Book;
import model.Category;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;


public class BookDao extends GenericDAO<Book,Long>{
    public BookDao() {
        super(Book.class);
    }


    public List<Book> findBooksByAuthorName(String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        String sql = "SELECT b.* FROM books b " +
                "INNER JOIN (" +
                "    SELECT ab.book_id FROM authors_books ab " +
                "    INNER JOIN (" +
                "        SELECT a.id FROM authors a " +
                "        WHERE a.firstname = :name OR a.lastname = :name" +
                "    ) AS ath ON ab.author_id = ath.id" +
                ") AS bth ON b.id = bth.book_id";

        NativeQuery<Book> query = session.createNativeQuery(sql, Book.class);
        query.setParameter("name", name);

        return query.getResultList();
    }

    public List<Book> findByCategoryId(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        String sql = "SELECT * FROM books b " +
                " WHERE b.id = :id ";

        NativeQuery<Book> query = session.createNativeQuery(sql, Book.class);
        query.setParameter("id", id);

        return query.getResultList();
    }
}
