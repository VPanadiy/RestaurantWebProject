package dream.development.service;

import dream.development.dao.interfaces.IngredientDao;
import dream.development.dao.interfaces.WarehouseDao;
import dream.development.model.Ingredient;
import dream.development.model.Warehouse;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class WarehouseService {

    private WarehouseDao warehouseDao;
    private IngredientDao ingredientDao;

    @Transactional
    public List<Warehouse> getIngredientsFromWarehouse() {
        return warehouseDao.getAll();
    }

    @Transactional
    public void insertIngredient(Ingredient ingredient) {
        ingredientDao.insert(ingredient);
    }

    @Transactional
    public void insertIngredientInWarehouse(Warehouse warehouse) {
        warehouseDao.insert(warehouse);
    }

    @Transactional
    public void removeIngredientFromWarehouseById(Long id) {
        warehouseDao.removeById(id);
    }

    @Transactional
    public void removeIngredientById(Long id) {
        ingredientDao.removeById(id);
    }

    @Transactional
    public Warehouse getIngredientsFromWarehouseById(Long id) {
        return warehouseDao.getByNameId(id);
    }

    @Transactional
    public Ingredient getIngredientsById(Long id) {
        return ingredientDao.getById(id);
    }

    @Transactional
    public void updateIngredientInWarehouse(Warehouse warehouse) {
        warehouseDao.update(warehouse);
    }

    @Transactional
    public void updateIngredient(Ingredient ingredient) {
        ingredientDao.update(ingredient);
    }

    @Transactional
    public List<Warehouse> searchIngredientsFromWarehouseByName(String name) {
        return warehouseDao.searchListByName(name);
    }

    public void setWarehouseDao(WarehouseDao warehouseDao) {
        this.warehouseDao = warehouseDao;
    }

    public void setIngredientDao(IngredientDao ingredientDao) {
        this.ingredientDao = ingredientDao;
    }
}
