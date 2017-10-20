package dream.development.dao.hibernate;

import dream.development.dao.interfaces.WarehouseDao;
import dream.development.model.Warehouse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Hibernate Warehouse DAO
 * Created by Splayd on 01.07.2017.
 */
public class HWarehouseDao implements WarehouseDao {

    private SessionFactory sessionFactory;

    public static final Logger LOGGER = LoggerFactory.getLogger(HWarehouseDao.class);

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void insert(Warehouse warehouse) {
        sessionFactory.getCurrentSession().save(warehouse);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Warehouse> getAll() {
        return sessionFactory.getCurrentSession().createQuery("SELECT w FROM Warehouse w ORDER BY w.ingredient.id").list();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Warehouse getByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT w FROM Warehouse w INNER JOIN w.ingredient WHERE w.ingredient.name LIKE :name");
        query.setParameter("name", name);
        return (Warehouse) query.uniqueResult();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public List<Warehouse> getIngredientWithConditionLess(Float amount) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT w FROM Warehouse w WHERE w.amount < :amount ORDER BY w.ingredient.id");
        query.setParameter("amount", amount);
        return query.getResultList();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void remove(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("DELETE FROM Warehouse w WHERE w IN (SELECT w FROM Warehouse w INNER JOIN w.ingredient WHERE w.ingredient.name LIKE :name)");
        query.setParameter("name", name);
        query.executeUpdate();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void removeById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("DELETE FROM Warehouse w WHERE w IN (SELECT w FROM Warehouse w INNER JOIN w.ingredient WHERE w.ingredient.id = :id)");
        query.setParameter("id", id);
        query.executeUpdate();
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public void update(Warehouse warehouse) {
        sessionFactory.getCurrentSession().saveOrUpdate(warehouse);
    }

    @Override
    @Transactional(propagation = Propagation.MANDATORY)
    public Warehouse getByNameId(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT w FROM Warehouse w INNER JOIN w.ingredient WHERE w.ingredient.id = :id");
        query.setParameter("id", id);
        return (Warehouse) query.uniqueResult();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
