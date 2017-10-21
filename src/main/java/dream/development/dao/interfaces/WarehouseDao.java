package dream.development.dao.interfaces;

import dream.development.model.Warehouse;

import java.util.List;

/**
 * Warehouse Interface
 * Created by Splayd on 01.07.2017.
 */
public interface WarehouseDao {

    void insert(Warehouse warehouse);

    List<Warehouse> getAll();

    Warehouse getByName(String name);

    List<Warehouse> getIngredientWithConditionLess(Float amount);

    void remove(String name);

    void removeById(Long id);

    void update(Warehouse warehouse);

    Warehouse getByNameId(Long id);

    List<Warehouse> searchListByName(String name);
}
