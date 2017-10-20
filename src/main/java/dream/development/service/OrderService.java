package dream.development.service;

import dream.development.dao.interfaces.OrdersDao;
import dream.development.model.Orders;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class OrderService {

    private OrdersDao ordersDao;

    @Transactional
    public List<Orders> getOrders() {
        return ordersDao.getAll();
    }

    public void setOrdersDao(OrdersDao ordersDao) {
        this.ordersDao = ordersDao;
    }
}
