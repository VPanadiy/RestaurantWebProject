package dream.development.web;

import dream.development.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
public class MenuController {

    private MenuService menuService;

    @RequestMapping(value = "/menus", method = RequestMethod.GET)
    public ModelAndView warehouse() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("menus", menuService.getMenu());
        modelAndView.setViewName("content/menus");
        return modelAndView;
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }
}
