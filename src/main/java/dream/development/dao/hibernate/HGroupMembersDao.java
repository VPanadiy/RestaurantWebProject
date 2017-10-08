package dream.development.dao.hibernate;

import dream.development.dao.interfaces.GroupMembersDao;
import dream.development.model.GroupMembers;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class HGroupMembersDao implements GroupMembersDao {

    private SessionFactory sessionFactory;

    public static final Logger LOGGER = LoggerFactory.getLogger(HGroupMembersDao.class);

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void insert(GroupMembers groupMembers) {
        sessionFactory.getCurrentSession().save(groupMembers);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
