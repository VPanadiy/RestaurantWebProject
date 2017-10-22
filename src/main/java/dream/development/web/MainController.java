package dream.development.web;

import dream.development.service.DishService;
import dream.development.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by Администратор on 13.08.2017.
 */

@Controller
@SessionAttributes("dishes")
public class MainController {

    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    private MenuService menuService;
    private DishService dishService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Map<String, Object> model, HttpServletRequest request) {

        Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
        if (map != null) {
            logger.info("Redirect!");
        } else {
            logger.info("Update!");
        }

        model.put("menu", menuService.getMenu());
        model.put("dishes", dishService.getDishes());
        return "index";
    }

    @RequestMapping(value = "/plan", method = RequestMethod.GET)
    public ModelAndView restaurantPlan(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("plan");
        return modelAndView;
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public ModelAndView contacts(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("contacts");
        return modelAndView;
    }

    @RequestMapping(value = "/searchPage", method = RequestMethod.GET)
    public ModelAndView searchPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("searchPage");
        return modelAndView;
    }

    @RequestMapping(value = "/searchPage", method = RequestMethod.POST)
    public ModelAndView searchPageResult(@ModelAttribute("searchButton") String searchString, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        if (!bindingResult.hasErrors()) {
            modelAndView.addObject("dishes", dishService.getDishesByValue(searchString));
            modelAndView.setViewName("searchPage");

            RedirectView redirectView = new RedirectView("searchPage");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("searchPage");
        }
        return modelAndView;
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
