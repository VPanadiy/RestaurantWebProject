package dream.development.web;

import dream.development.model.Menu;
import dream.development.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Date;
import java.util.Locale;

@Controller
public class MenuController {

    private MenuService menuService;

    @RequestMapping(value = "/menus", method = RequestMethod.GET)
    public ModelAndView warehouse(@ModelAttribute("menuName") String menuName) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("menus", menuService.getMenuByNameValue(menuName));
        modelAndView.setViewName("content/menus");
        return modelAndView;
    }

    @RequestMapping(value = "/addNewMenu", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView addNewMenu(Locale locale, @ModelAttribute("menu") Menu menu, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("menus", menuService.getMenu());
        modelAndView.addObject("currentTime", new Date().toString());

        if (!bindingResult.hasErrors()) {
            Menu newMenu = new Menu();
            newMenu.setName(menu.getName());

            menuService.insertMenu(newMenu);

            RedirectView redirectView = new RedirectView("menus");
            redirectView.setStatusCode(HttpStatus.FOUND);
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/menus");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteMenu", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteMenu(@ModelAttribute("menuId") Long id, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("menus", menuService.getMenu());

        if (!bindingResult.hasErrors()) {
            menuService.removeMenuById(id);

            RedirectView redirectView = new RedirectView("menus");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/menus");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/updateMenu", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateMenu(@ModelAttribute("menuId") Long id, @ModelAttribute("menu")Menu menu, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("menus", menuService.getMenu());
        Menu existMenu = menuService.getMenuById(id);

        if (!bindingResult.hasErrors()) {
            existMenu.setName(menu.getName());

            menuService.updateMenu(existMenu);

            RedirectView redirectView = new RedirectView("menus");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/menus");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/menuFilter", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView menuFilter(@ModelAttribute("menuName") String menuName, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        if (!bindingResult.hasErrors()) {
            modelAndView.addObject("currentTime", new Date().toString());
            modelAndView.addObject("menus", menuService.getMenuByNameValue(menuName));

            RedirectView redirectView = new RedirectView("menus");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/menus");
        }
        return modelAndView;
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }
}
