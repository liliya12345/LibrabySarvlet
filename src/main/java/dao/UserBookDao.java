package dao;


import model.Book;
import model.User;
import model.UserBook;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class UserBookDao extends GenericDAO<UserBook,Long>{
    public UserBookDao() {
        super(UserBook.class);
    }
    public List<UserBook> findUserBooksByUsersId(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        String sql = "SELECT * FROM user_books b " +
                "        WHERE b.user_id = :id";

        NativeQuery<UserBook> query = session.createNativeQuery(sql, UserBook.class);
        query.setParameter("id", id);

        return query.getResultList();
    }
    public List<UserBook> findUserBooksByBookId(Long bookId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "SELECT * FROM public.user_books  b WHERE b.book_id=:bookId AND b.returned='false'";
        NativeQuery<UserBook> query = session.createNativeQuery(sql, UserBook.class);
        query.setParameter("bookId", bookId);
        return query.getResultList();
    }


}
