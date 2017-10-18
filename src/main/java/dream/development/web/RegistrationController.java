package dream.development.web;

import dream.development.model.Users;
import dream.development.service.UserService;
import org.bouncycastle.util.encoders.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Date;
import java.util.Locale;

@Controller
public class RegistrationController {

    private static final int WEAK_STRENGTH = 1;
    private static final int FEAR_STRENGTH = 5;
    private static final int STRONG_STRENGTH = 7;

    private static final String WEAK_COLOR = "#FF0000";
    private static final String FEAR_COLOR = "#FF9900";
    private static final String STRONG_COLOR = "#0099CC";

    private MessageSource messageSource;
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(RegistrationController.class);

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView modelAndView = new ModelAndView();
        Users user = new Users();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.addObject("users", user);
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(Locale locale, @Valid @ModelAttribute("users") Users user, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        ModelAndView modelAndView = new ModelAndView();
        Users userExistsUsername = userService.findUserByName(user.getUsername());
        Users userExistsEmail = userService.findUserByEmail(user.getEmail());
        Users userExistsSecondEmail = userService.findUserBySecondEmail(user.getSecondEmail());
        modelAndView.addObject("currentTime", new Date().toString());

        if (userExistsUsername != null) {
                bindingResult.rejectValue("username", "error.user",
                        messageSource.getMessage("usernameExistError", new String[]{locale.getDisplayName(locale)}, locale));
        }

        if (userExistsEmail != null) {
                bindingResult.rejectValue("email", "error.user",
                        messageSource.getMessage("emailError", new String[]{locale.getDisplayName(locale)}, locale));
        }

        if (userExistsSecondEmail != null) {
                bindingResult.rejectValue("secondEmail", "error.user",
                        messageSource.getMessage("emailError", new String[]{locale.getDisplayName(locale)}, locale));
        }

        if (user.getEmail().equals(user.getSecondEmail())){
            if (!(user.getEmail().equals("") && user.getSecondEmail().equals(""))) {
                bindingResult.rejectValue("secondEmail", "error.user",
                        messageSource.getMessage("emailAndSecondEmailCompareError", new String[]{locale.getDisplayName(locale)}, locale));
            }
        }

        if (!bindingResult.hasErrors()) {
            userService.saveUser(user);
            modelAndView.addObject("users", new Users());

            modelAndView = new ModelAndView();
            RedirectView redirectView = new RedirectView("/");
            redirectView.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
            modelAndView.setView(redirectView);

            redirectAttributes.addFlashAttribute("welcome", messageSource.getMessage("welcome", new String[]{locale.getDisplayName(locale)}, locale));
            redirectAttributes.addFlashAttribute("username", user.getUsername() + "!");
        } else {
            modelAndView.setViewName("registration");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/updateUserDetails", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateUserDetails(Locale locale, Principal loggedInUser, @Valid @ModelAttribute("user") Users user, BindingResult bindingResult) throws UnsupportedEncodingException {
        ModelAndView modelAndView = new ModelAndView();
        Users userExists = userService.findUserByName(loggedInUser.getName());

        Users userExistsUsername = userService.findUserByName(user.getUsername());
        Users userExistsEmail = userService.findUserByEmail(user.getEmail());
        Users userExistsSecondEmail = userService.findUserBySecondEmail(user.getSecondEmail());
        modelAndView.addObject("currentTime", new Date().toString());

        if (userExists.getImageData() != null) {
            byte[] encodeBase64 = Base64.encode(userExists.getImageData());
            String base64Encoded = new String(encodeBase64, "UTF-8");
            modelAndView.addObject("userImage", base64Encoded);
        }

        if (userExistsUsername != null) {
            if (!userExistsUsername.getUsername().equals(user.getUsername())) {
                bindingResult.rejectValue("username", "error.user",
                        messageSource.getMessage("usernameExistError", new String[]{locale.getDisplayName(locale)}, locale));
            }
        }

        if (userExistsEmail != null) {
            if (!userExistsEmail.getEmail().equals(user.getEmail())) {
                bindingResult.rejectValue("email", "error.user",
                        messageSource.getMessage("emailError", new String[]{locale.getDisplayName(locale)}, locale));
            }
        }

        if (userExistsSecondEmail != null) {
            if (!userExistsSecondEmail.getSecondEmail().equals(user.getSecondEmail())) {
                bindingResult.rejectValue("secondEmail", "error.user",
                        messageSource.getMessage("emailError", new String[]{locale.getDisplayName(locale)}, locale));
            }
        }

        if (user.getEmail().equals(user.getSecondEmail())){
            bindingResult.rejectValue("secondEmail", "error.user",
                    messageSource.getMessage("emailAndSecondEmailCompareError", new String[]{locale.getDisplayName(locale)}, locale));
        }

        if (!bindingResult.hasErrors()) {
            userExists.setUsername(user.getUsername());
            userExists.setLastName(user.getLastName());
            userExists.setFirstName(user.getFirstName());
            userExists.setEmail(user.getEmail());
            userExists.setDateBirth(user.getDateBirth());
            userExists.setGender(user.getGender());
            userExists.setPhoneNumber(user.getPhoneNumber());
            userExists.setSecondEmail(user.getSecondEmail());
            userExists.setCountry(user.getCountry());

            userService.updateUserDetails(userExists);

            RedirectView redirectView = new RedirectView("/account");
            redirectView.setStatusCode(HttpStatus.FOUND);
            modelAndView.setView(redirectView);
        } else {
            modelAndView.setViewName("content/account");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/checkStrength", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public @ResponseBody
    String checkStrength(Locale locale, @RequestParam String password) {
        String result = "<span style=\"color:%s; font-weight:bold;\">%s</span>";

        if (password.length() >= WEAK_STRENGTH & password.length() < FEAR_STRENGTH) {
            return String.format(result, WEAK_COLOR, messageSource.getMessage("week", new String[]{locale.getDisplayName(locale)}, locale));
        } else if (password.length() >= FEAR_STRENGTH & password.length() < STRONG_STRENGTH) {
            return String.format(result, FEAR_COLOR, messageSource.getMessage("normal", new String[]{locale.getDisplayName(locale)}, locale));
        } else if (password.length() >= STRONG_STRENGTH) {
            return String.format(result, STRONG_COLOR, messageSource.getMessage("strong", new String[]{locale.getDisplayName(locale)}, locale));
        }
        return "";
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
