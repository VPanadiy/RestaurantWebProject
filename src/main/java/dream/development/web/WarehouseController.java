package dream.development.web;

import dream.development.model.Ingredient;
import dream.development.model.Warehouse;
import dream.development.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Locale;

@Controller
@SessionAttributes("warehouse")
public class WarehouseController {

    private WarehouseService warehouseService;

    @RequestMapping(value = "/warehouse", method = RequestMethod.GET)
    public ModelAndView warehouse(@ModelAttribute("ingredientName") String ingredientName) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("warehouse", warehouseService.searchIngredientsFromWarehouseByName(ingredientName));
        modelAndView.setViewName("content/warehouse");
        return modelAndView;
    }

    @RequestMapping(value = "/addNewIngredient", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView addNewIngredient(Locale locale, @ModelAttribute("ingredient") Warehouse warehouse, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("warehouse", warehouseService.getIngredientsFromWarehouse());

        if (!bindingResult.hasErrors()) {
            Ingredient ingredient = new Ingredient();
            ingredient.setName(warehouse.getIngredient().getName());

            Warehouse newWarehouse = new Warehouse();
            newWarehouse.setIngredient(ingredient);
            newWarehouse.setAmount(warehouse.getAmount());
            newWarehouse.setUnit(warehouse.getUnit());

            warehouseService.insertIngredient(ingredient);
            warehouseService.insertIngredientInWarehouse(newWarehouse);

            RedirectView redirectView = new RedirectView("warehouse");
            redirectView.setStatusCode(HttpStatus.FOUND);
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/warehouse");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteIngredient", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteIngredient(@ModelAttribute("ingredientId") Long id, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("warehouse", warehouseService.getIngredientsFromWarehouse());

        if (!bindingResult.hasErrors()) {
            warehouseService.removeIngredientFromWarehouseById(id);
            warehouseService.removeIngredientById(id);

            RedirectView redirectView = new RedirectView("warehouse");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/warehouse");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/updateIngredient", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateIngredient(@ModelAttribute("ingredientId") Long id, @ModelAttribute("warehouse") Warehouse warehouse, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("warehouse", warehouseService.getIngredientsFromWarehouse());
        Warehouse existWarehouse = warehouseService.getIngredientsFromWarehouseById(id);
        Ingredient existIngredient = warehouseService.getIngredientsById(id);

        if (!bindingResult.hasErrors()) {
            existIngredient.setName(warehouse.getIngredient().getName());
            existWarehouse.setAmount(warehouse.getAmount());
            existWarehouse.setUnit(warehouse.getUnit());

            warehouseService.updateIngredient(existIngredient);
            warehouseService.updateIngredientInWarehouse(existWarehouse);

            RedirectView redirectView = new RedirectView("warehouse");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/warehouse");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/ingredientFilter", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView ingredientFilter(@ModelAttribute("ingredientName") String ingredientName, BindingResult bindingResult){
        ModelAndView modelAndView = new ModelAndView();

        if (!bindingResult.hasErrors()) {
            modelAndView.addObject("warehouse", warehouseService.searchIngredientsFromWarehouseByName(ingredientName));

            RedirectView redirectView = new RedirectView("warehouse");
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/warehouse");
        }
        return modelAndView;
    }

    @Autowired
    public void setWarehouseService(WarehouseService warehouseService) {
        this.warehouseService = warehouseService;
    }
}
