package service;

import dao.UserDao;
import dto.UserDto;
import model.User;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    public List<UserDto> getAllUsers() {
        List<UserDto> userDtoList = new ArrayList<>();
        List<User> all = new UserDao().findAll();
        for (User user : all) {
            UserDto userDto = new UserDto();
            userDto.setId(user.getId());
            userDto.setUsername(user.getUsername());
            userDto.setFirstname(user.getFirsName());
            userDto.setLastname(user.getLastName());
            userDto.setRole(user.getRole());
            userDto.setCreated(user.getCreated().toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
            userDtoList.add(userDto);
        }
        return userDtoList;


    }
}
