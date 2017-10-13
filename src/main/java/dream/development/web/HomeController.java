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
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MessageSource messageSource;

	private UserService userService;

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public ModelAndView accessDenied(Locale locale, Principal user) {

        ModelAndView model = new ModelAndView();

        if (user != null) {
            model.addObject("errorMsg", user.getName() + messageSource.getMessage("accessDenied", new String[] { locale.getDisplayName(locale) }, locale));
        } else {
            model.addObject("errorMsg", messageSource.getMessage("accessDeniedStringBegin", new String[] { locale.getDisplayName(locale) }, locale));
        }

        model.setViewName("/content/accessDenied");
        return model;

    }

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView userPage(Principal user) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user",userService.findUserByName(user.getName()));
		modelAndView.setViewName("content/user");
		return modelAndView;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage() {

		return "content/admin";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username or password!");
		}

		model.setViewName("login");

		return model;
	}

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
