package dream.development.dao.hibernate;

import dream.development.dao.interfaces.GroupMembersDao;
import dream.development.model.GroupMembers;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class HGroupMembersDao implements GroupMembersDao {

    private SessionFactory sessionFactory;

    public static final Logger LOGGER = LoggerFactory.getLogger(HGroupMembersDao.class);

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<GroupMembers> getRoles() {
        return sessionFactory.getCurrentSession().createQuery("SELECT g FROM GroupMembers g ORDER BY g.id").list();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public GroupMembers getUserRole(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT g FROM GroupMembers g WHERE g.username LIKE :username");
        query.setParameter("username", username);
        return (GroupMembers) query.uniqueResult();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void insert(GroupMembers groupMembers) {
        sessionFactory.getCurrentSession().save(groupMembers);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
