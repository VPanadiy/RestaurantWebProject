package dream.development.dao.interfaces;

import dream.development.model.Users;

public interface UsersDao {

    void insert(Users user);

    Users findByEmail(String email);

    Users findBySecondEmail(String email);

    Users findByName(String username);

    void insertProfileImage(Users user);

    void saveUserDetails(Users user);
}
