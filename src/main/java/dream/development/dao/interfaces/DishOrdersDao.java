package dream.development.dao.interfaces;

import dream.development.model.DishOrders;

import java.util.List;

/**
 * DishOrder interface
 * Created by Splayd on 29.07.2017.
 */
public interface DishOrdersDao {

    List<DishOrders> getOpened();

    DishOrders getById(Long id);

    void update(DishOrders dishOrders);
}
