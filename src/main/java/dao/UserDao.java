package dao;

import model.Book;
import model.User;
import org.hibernate.*;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import util.HibernateUtil;


import java.util.List;

public class UserDao extends GenericDAO<User, Integer> {

    public UserDao() {
        super(User.class);
    }

    public User getUser(String username) throws HibernateException {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {


            String sql = "SELECT * FROM appusers b " +
                    "        WHERE b.username = :username ";

            NativeQuery<User> query = session.createNativeQuery(sql, User.class);
            query.setParameter("username", username);
            User users = query.getSingleResultOrNull();
            if (users==null) {
                return null;
            }
            return users;
        }
    }

}
