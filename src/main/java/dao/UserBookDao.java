package dao;


import model.User;
import model.UserBook;

public class UserBookDao extends GenericDAO<UserBook,Long>{
    public UserBookDao() {
        super(UserBook.class);
    }


}
