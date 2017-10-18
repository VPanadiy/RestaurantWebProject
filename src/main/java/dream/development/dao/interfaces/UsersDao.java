package dream.development.dao.interfaces;

import dream.development.model.Users;

import java.util.List;

public interface UsersDao {

    List<Users> getAllUsers();

    void insert(Users user);

    Users findByEmail(String email);

    Users findBySecondEmail(String email);

    Users findByName(String username);

    void insertProfileImage(Users user);

    void saveUserDetails(Users user);
}
