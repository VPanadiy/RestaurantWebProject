package dream.development.web;

import dream.development.model.Dish;
import dream.development.model.Menu;
import dream.development.service.DishService;
import dream.development.service.MenuService;
import dream.development.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Date;
import java.util.Locale;

/**
 * Created by Администратор on 25.08.2017.
 */

@Controller
@SessionAttributes("dishes")
public class DishController {

    private DishService dishService;
    private OrderService orderService;
    private MenuService menuService;

    @RequestMapping(value = "/dishes", method = RequestMethod.GET)
    public ModelAndView dishes(@ModelAttribute("dishName") String dishName){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dishes", dishService.getDishesByValue(dishName));
        modelAndView.setViewName("content/dishes");
        return modelAndView;
    }

    @RequestMapping(value = "/dish/{dishName}", method = RequestMethod.GET)
    public ModelAndView dish(@PathVariable String dishName){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dish",dishService.getDishByName(dishName));
        modelAndView.setViewName("dish");
        return modelAndView;
    }

    @RequestMapping(value = "/addNewDish", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView addNewDish(Locale locale, @ModelAttribute("menuName") String menuName, @ModelAttribute("dish") Dish dish, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dishes", dishService.getDishes());
        Menu menu = menuService.getMenuByName(menuName);

        if (!bindingResult.hasErrors()) {
            Dish newDish = new Dish();
            newDish.setName(dish.getName());
            newDish.setCost(dish.getCost());
            newDish.setWeight(dish.getWeight());
            newDish.setMenu(menu);

            dishService.insertDish(newDish);

            RedirectView redirectView = new RedirectView("dishes");
            redirectView.setStatusCode(HttpStatus.FOUND);
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/dishes");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteDish", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteDish(@ModelAttribute("dishId") Long id, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dish", dishService.getDishes());

        if (!bindingResult.hasErrors()) {
            dishService.removeDishById(id);

            RedirectView redirectView = new RedirectView("dishes");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/dishes");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/updateDish", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateDish(@ModelAttribute("dishId") Long id, @ModelAttribute("menuName") String menuName, @ModelAttribute("dish") Dish dish, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dish", dishService.getDishes());
        Dish existDish = dishService.getDishById(id);
        Menu menu = menuService.getMenuByName(menuName);

        if (!bindingResult.hasErrors()) {
            existDish.setId(dish.getId());
            existDish.setName(dish.getName());
            existDish.setCost(dish.getCost());
            existDish.setWeight(dish.getWeight());
            existDish.setMenu(menu);

            dishService.updateDish(existDish);

            RedirectView redirectView = new RedirectView("dishes");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/dishes");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/dishFilter", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView dishFilter(@ModelAttribute("dishName") String dishName, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        if (!bindingResult.hasErrors()) {
            modelAndView.addObject("dishes", dishService.getDishesByValue(dishName));

            RedirectView redirectView = new RedirectView("dishes");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/dishes");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/orderHistory", method = RequestMethod.GET)
    public ModelAndView orders(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orders", orderService.getOrders());
        modelAndView.setViewName("content/orderHistory");
        return modelAndView;
    }

    @RequestMapping(value = "/tableFilter", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView tableFilter(@ModelAttribute("tableNumber") Integer tableNumber, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        if (!bindingResult.hasErrors()) {
            modelAndView.addObject("orders", orderService.getOrdersByTableNumber(tableNumber));

            RedirectView redirectView = new RedirectView("orderHistory");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/orderHistory");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/dateOrderFilter", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView dateOrder(@ModelAttribute("dateOrder") Date dateOrder, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        if (!bindingResult.hasErrors()) {
            modelAndView.addObject("orders", orderService.getOrdersByDateOrder(dateOrder));

            RedirectView redirectView = new RedirectView("orderHistory");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/orderHistory");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/employeeFilter", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView employeeFilter(@ModelAttribute("employee") String employeeName, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        if (!bindingResult.hasErrors()) {
            modelAndView.addObject("orders", orderService.getOrdersByEmployeeName(employeeName));

            RedirectView redirectView = new RedirectView("orderHistory");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/orderHistory");
        }
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

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }
}
