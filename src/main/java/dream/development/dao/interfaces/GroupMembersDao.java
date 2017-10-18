package dream.development.dao.interfaces;

import dream.development.model.GroupMembers;

import java.util.List;

public interface GroupMembersDao {

    List<GroupMembers> getRoles();

    GroupMembers getUserRole(String username);

    void insert(GroupMembers groupMembers);
}
