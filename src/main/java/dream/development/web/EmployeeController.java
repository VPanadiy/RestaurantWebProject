package dream.development.web;

import dream.development.model.Employee;
import dream.development.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


/**
 * Created by Администратор on 14.08.2017.
 */

@Controller
@SessionAttributes("employee")
public class EmployeeController {

    private EmployeeService employeeService;

    @InitBinder("employee")
    public void customizeBinding(WebDataBinder binder) {
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        dateFormatter.setLenient(false);
        binder.registerCustomEditor(Date.class, "dateBirth",
                new CustomDateEditor(dateFormatter, true));
    }

    @RequestMapping(value = "/personal", method = RequestMethod.GET)
    public ModelAndView personal() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("personal", employeeService.getEmployees());
        modelAndView.setViewName("personal");
        return modelAndView;
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public ModelAndView employees() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("employee", new Employee());
        modelAndView.addObject("employees", employeeService.getEmployees());
        modelAndView.setViewName("content/employees");
        return modelAndView;
    }

    @RequestMapping(value = "/employee/{employeeId}_{employeeSurname}_{employeeName}", method = RequestMethod.GET)
    public ModelAndView employee(@PathVariable Long employeeId, @PathVariable String employeeName, @PathVariable String employeeSurname) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("employee", employeeService.getEmployeeById(employeeId));
        modelAndView.setViewName("content/employee");
        return modelAndView;
    }

    @RequestMapping(value = "/addNewEmployee", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView addNewEmployee(Locale locale, @ModelAttribute("employee") Employee employee, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("employees", employeeService.getEmployees());
        modelAndView.addObject("currentTime", new Date().toString());

        if (!bindingResult.hasErrors()) {
            employeeService.insertEmployee(employee);

            RedirectView redirectView = new RedirectView("employees");
            redirectView.setStatusCode(HttpStatus.FOUND);
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/employees");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteEmployee", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteEmployee(@ModelAttribute("employeePage") boolean employeePage, @ModelAttribute("idEmployee") Long id, @ModelAttribute("employee") Employee employee, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("employees", employeeService.getEmployees());
        Employee existEmployee = employeeService.getEmployeeById(id);
        String employeeSurname = existEmployee.getSurname();
        String employeeName = existEmployee.getName();

        if (!bindingResult.hasErrors()) {
            employeeService.removeEmployeeById(id);

            RedirectView redirectView = new RedirectView("employees");
            modelAndView.setView(redirectView);
        } else {
            if (employeePage) {
                modelAndView.setViewName("redirect:employee/" + employee.getId() + "_" + employeeSurname + "_" + employeeName);
            } else {
                modelAndView.setViewName("content/employees");
            }
        }
        return modelAndView;
    }

    @RequestMapping(value = "/updateEmployee", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateEmployee(@ModelAttribute("idEmployee") Long id, @ModelAttribute("employee") Employee employee, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        Employee existEmployee = employeeService.getEmployeeById(id);
        String employeeSurname = existEmployee.getSurname();
        String employeeName = existEmployee.getName();

        if (!bindingResult.hasErrors()) {
            existEmployee.setSurname(employee.getSurname());
            existEmployee.setName(employee.getName());
            existEmployee.setDateBirth(employee.getDateBirth());
            existEmployee.setPhoneNumber(employee.getPhoneNumber());
            existEmployee.setPosition(employee.getPosition());
            existEmployee.setSalary(employee.getSalary());

            employeeService.updateEmployee(existEmployee);

            RedirectView redirectView = new RedirectView();

            redirectView.setUrl("employee/" + employee.getId() + "_" + employee.getSurname() + "_" + employee.getName());
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("redirect:employee/" + employee.getId() + "_" + employeeSurname + "_" + employeeName);
        }
        return modelAndView;
    }

    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }
}
