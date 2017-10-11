package dream.development.web;

import dream.development.model.Users;
import dream.development.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;
import java.util.Locale;

@Controller
public class UserController {

    @Autowired
    private MessageSource messageSource;

    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView modelAndView = new ModelAndView();
        Users user = new Users();
        modelAndView.addObject("users", user);
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(Locale locale, @Valid @ModelAttribute("users") Users user, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        ModelAndView modelAndView = new ModelAndView();
        Users userExists = userService.findUserByEmail(user.getEmail());

        if (userExists != null) {
            bindingResult.rejectValue("email", "error.user",
                    "There is already a user registered with the email provided");
        }

        if (!bindingResult.hasErrors()) {
            userService.saveUser(user);
            modelAndView.addObject("users", new Users());

            modelAndView = new ModelAndView();
            RedirectView redirectView = new RedirectView("/");
            redirectView.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
            modelAndView.setView(redirectView);

            redirectAttributes.addFlashAttribute("welcome", messageSource.getMessage("welcome", new String[] { locale.getDisplayName(locale) }, locale));
            redirectAttributes.addFlashAttribute("username",user.getUsername()+"!");
        } else {
            modelAndView.setViewName("registration");
        }
        return modelAndView;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
