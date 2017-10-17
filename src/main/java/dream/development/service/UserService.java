package dream.development.service;

import dream.development.dao.interfaces.GroupMembersDao;
import dream.development.dao.interfaces.UsersDao;
import dream.development.model.GroupMembers;
import dream.development.model.Users;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

public class UserService {

    private UsersDao usersDao;
    private GroupMembersDao groupMembersDao;

    @Transactional
    public void saveUser(Users user) {
        GroupMembers groupMembers = new GroupMembers();
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(11);
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        groupMembers.setId(user.getId());
        groupMembers.setUsername(user.getUsername());
        usersDao.insert(user);
        groupMembersDao.insert(groupMembers);
    }

    @Transactional
    public Users findUserByEmail(String email) {
        return usersDao.findByEmail(email);
    }

    @Transactional
    public Users findUserByName(String username) {
        return usersDao.findByName(username);
    }

    @Transactional
    public void saveProfileImage(Users user) {
        usersDao.insertProfileImage(user);
    }

    @Transactional
    public void updateUserDetails(Users user) {
        usersDao.saveUserDetails(user);
    }

    public void setUsersDao(UsersDao usersDao) {
        this.usersDao = usersDao;
    }

    public void setGroupMembersDao(GroupMembersDao groupMembersDao) {
        this.groupMembersDao = groupMembersDao;
    }
}
