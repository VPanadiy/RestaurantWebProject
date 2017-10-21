package dream.development.dao.hibernate;

import dream.development.dao.interfaces.DishDao;
import dream.development.model.Dish;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Hibernate Dish DAO
 * Created by Splayd on 27.06.2017.
 */
public class HDishDao implements DishDao {

    private SessionFactory sessionFactory;

    public static final Logger LOGGER = LoggerFactory.getLogger(HDishDao.class);

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void insert(Dish dish) {
        sessionFactory.getCurrentSession().save(dish);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Dish> getAll() {
        return sessionFactory.getCurrentSession().createQuery("SELECT d FROM Dish d ORDER BY d.id").list();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Dish> getByNameValue(String nameValue) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT d FROM Dish d WHERE lower(d.name) LIKE :nameValue ORDER BY d.id");
        query.setParameter("nameValue", "%" + nameValue.toLowerCase() + "%");
        return (List<Dish>) query.list();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Dish getById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT d FROM Dish d WHERE d.id = :id");
        query.setParameter("id", id);
        return (Dish) query.uniqueResult();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Dish getByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT d FROM Dish d WHERE d.name LIKE :name");
        query.setParameter("name", name);
        return (Dish) query.uniqueResult();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void remove(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("DELETE FROM Dish d WHERE d.name LIKE :name");
        query.setParameter("name", name);
        query.executeUpdate();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void removeById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("DELETE FROM Dish d WHERE d.id = :id");
        query.setParameter("id", id);
        query.executeUpdate();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void update(Dish dish) {
        sessionFactory.getCurrentSession().saveOrUpdate(dish);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
