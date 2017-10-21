package dream.development.service;

import dream.development.dao.interfaces.DishDao;
import dream.development.model.Dish;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Администратор on 24.08.2017.
 */
public class DishService {

    private DishDao dishDao;

    @Transactional
    public List<Dish> getDishes() {
        return dishDao.getAll();
    }

    @Transactional
    public Dish getDishByName(String dishName) {
        return dishDao.getByName(dishName);
    }

    @Transactional
    public Dish getDishById(Long id) {
        return dishDao.getById(id);
    }

    @Transactional
    public List<Dish> getDishesByValue(String nameValue) {
        return dishDao.getByNameValue(nameValue);
    }

    @Transactional
    public void insertDish(Dish dish) {
        dishDao.insert(dish);
    }

    @Transactional
    public void updateDish(Dish dish) {
        dishDao.update(dish);
    }

    @Transactional
    public void removeDishById(Long id) {
        dishDao.removeById(id);
    }

    public void setDishDao(DishDao dishDao) {
        this.dishDao = dishDao;
    }
}
