package dream.development.service;

import dream.development.dao.interfaces.OrdersDao;
import dream.development.model.Orders;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public class OrderService {

    private OrdersDao ordersDao;

    @Transactional
    public List<Orders> getOrders() {
        return ordersDao.getAll();
    }

    @Transactional
    public List<Orders> getOrdersByTableNumber(Integer tableNumber) {
        return ordersDao.getByTableNumber(tableNumber);
    }

    @Transactional
    public List<Orders> getOrdersByDateOrder(Date dateOrder) {
        return ordersDao.getByDateOrder(dateOrder);
    }

    @Transactional
    public List<Orders> getOrdersByEmployeeName(String employeeName) {
        return ordersDao.getByEmployeeName(employeeName);
    }

    public void setOrdersDao(OrdersDao ordersDao) {
        this.ordersDao = ordersDao;
    }
}
