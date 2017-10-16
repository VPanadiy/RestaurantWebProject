package dream.development.web;

import dream.development.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Date;
import java.util.Locale;

/**
 * Created by Администратор on 13.08.2017.
 */
@Controller
@SessionAttributes("user")
public class UserController {

    private MessageSource messageSource;
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(Locale locale, @RequestParam(value = "error", required = false) String error) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());

        if (error != null) {
            modelAndView.addObject("error", messageSource.getMessage("invalidUserPass", new String[]{locale.getDisplayName(locale)}, locale));
        }

        modelAndView.setViewName("login");

        return modelAndView;
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public ModelAndView accessDenied(Locale locale, Principal user) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());

        if (user != null) {
            modelAndView.addObject("errorMsg", user.getName() + messageSource.getMessage("accessDeniedForUser", new String[]{locale.getDisplayName(locale)}, locale));
        } else {
            modelAndView.addObject("errorMsg", messageSource.getMessage("accessDeniedAnonymous", new String[]{locale.getDisplayName(locale)}, locale));
        }

        modelAndView.setViewName("/content/accessDenied");
        return modelAndView;

    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public ModelAndView userPage(Principal user) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("user", userService.findUserByName(user.getName()));
        modelAndView.setViewName("content/user");
        return modelAndView;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView adminPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.setViewName("content/admin");
        return modelAndView;
    }

    @RequestMapping(value = "/downloadPDF", method = RequestMethod.GET)
    public ModelAndView downloadPDF() {

        return new ModelAndView("pdfView");
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
}
