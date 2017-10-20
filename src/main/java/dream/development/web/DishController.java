package dream.development.web;

import dream.development.service.DishService;
import dream.development.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * Created by Администратор on 25.08.2017.
 */

@Controller
public class DishController {

    private DishService dishService;
    private OrderService orderService;

    @RequestMapping(value = "/dishes", method = RequestMethod.GET)
    public ModelAndView dishes(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("dishes",dishService.getDishes());
        modelAndView.setViewName("content/dishes");
        return modelAndView;
    }

    @RequestMapping(value = "/dish/{dishName}", method = RequestMethod.GET)
    public ModelAndView dish(@PathVariable String dishName){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("dish",dishService.getDishByName(dishName));
        modelAndView.setViewName("dish");
        return modelAndView;
    }

    @RequestMapping(value = "/orderHistory", method = RequestMethod.GET)
    public ModelAndView orders(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("orders", orderService.getOrders());
        modelAndView.setViewName("content/orderHistory");
        return modelAndView;
    }

    @Autowired
    public void setDishService(DishService dishService) {
        this.dishService = dishService;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
}
