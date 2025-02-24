package dao;

import model.Author;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import util.HibernateUtil;

import java.util.List;

public class AuthorDao extends GenericDAO<Author, Long> {
    public AuthorDao() {
        super(Author.class);
    }
    public List<Author> authorListByBookId(Long bookId){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = " SELECT id, firstname, lastname FROM public.authors AS aut  INNER JOIN\n" +
                "                (SELECT author_id, book_id\n" +
                "                        FROM public.authors_books  WHERE book_id =:bookId ) AS dt\n" +
                "        ON dt.author_id = aut.id";


        NativeQuery<Author> query = session.createNativeQuery(sql, Author.class);
        query.setParameter("bookId", bookId);

        return query.getResultList();
    }
}
