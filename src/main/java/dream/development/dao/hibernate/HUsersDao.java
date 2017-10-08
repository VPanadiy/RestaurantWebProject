package dream.development.dao.hibernate;

import dream.development.dao.interfaces.UsersDao;
import dream.development.model.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class HUsersDao implements UsersDao {

    private SessionFactory sessionFactory;

    public static final Logger LOGGER = LoggerFactory.getLogger(HUsersDao.class);

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void insert(Users user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Users findByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT u FROM Users u WHERE u.email LIKE :email");
        query.setParameter("email", email);
        return (Users) query.uniqueResult();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
