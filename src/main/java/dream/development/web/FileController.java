package dream.development.web;

import dream.development.model.Users;
import dream.development.model.objects.UploadedFile;
import dream.development.service.UserService;
import dream.development.validators.FileValidator;
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
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.Locale;

@Controller
public class FileController {

    private MessageSource messageSource;
    private FileValidator fileValidator;
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadFile(Locale locale, Principal user, @ModelAttribute("uploadedFile") UploadedFile uploadedFile, BindingResult bindingResult) throws IOException {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        Users loggedInUser = userService.findUserByName(user.getName());

        if (loggedInUser.getImageData() != null) {
            byte[] encodeBase64 = Base64.encode(loggedInUser.getImageData());
            String base64Encoded = new String(encodeBase64, "UTF-8");
            modelAndView.addObject("userImage", base64Encoded);
        }

        fileValidator.validate(uploadedFile, bindingResult);

        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("content/user");
        } else {

            try {
                loggedInUser.setImageData(uploadedFile.getFile().getBytes());
                userService.saveProfileImage(loggedInUser);
                logger.info("Profile image uploaded successful!");

                RedirectView redirectView = new RedirectView("/user");
                redirectView.setStatusCode(HttpStatus.FOUND);
                modelAndView.setView(redirectView);

            } catch (IOException e) {
                throw new IOException(messageSource.getMessage("errorMain", new String[]{locale.getDisplayName(locale)}, locale));
            }

        }

        return modelAndView;
    }

    @RequestMapping(value = "/fileUploaded", method = RequestMethod.GET)
    public ModelAndView fileUploaded() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());
        modelAndView.setViewName("content/fileUploaded");
        return modelAndView;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Autowired
    public void setFileValidator(FileValidator fileValidator) {
        this.fileValidator = fileValidator;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
