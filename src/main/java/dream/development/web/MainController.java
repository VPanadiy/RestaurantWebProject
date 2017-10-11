package dream.development.web;

import dream.development.service.DishService;
import dream.development.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * Created by Администратор on 13.08.2017.
 */

@Controller
public class MainController {

    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    private MenuService menuService;
    private DishService dishService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Map<String, Object> model, HttpServletRequest request) {

        Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
        if (map != null) {
            logger.info("redirect!");
        } else {
            logger.info("update!");
        }

        model.put("currentTime", new Date().toString());
        model.put("menu", menuService.getMenu());
        model.put("dishes", dishService.getDishes());
        return "index";
    }

    @RequestMapping(value = "/plan", method = RequestMethod.GET)
    public String restaurantPlan() {
        return "plan";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String contacts() {
        return "contacts";
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Autowired
    public void setDishService(DishService dishService) {
        this.dishService = dishService;
    }
}
