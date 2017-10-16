package dream.development.web;

import dream.development.model.Users;
import dream.development.model.objects.UploadedFile;
import dream.development.service.UserService;
import dream.development.validators.FileValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.Locale;

@Controller
@SessionAttributes("filename")
public class FileController {

    private MessageSource messageSource;
    private FileValidator fileValidator;
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadFile(Locale locale, Principal user, @ModelAttribute("uploadedFile") UploadedFile uploadedFile, BindingResult result) throws IOException {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("currentTime", new Date().toString());

        String fileName;

        MultipartFile file = uploadedFile.getFile();
        fileValidator.validate(uploadedFile, result);

        if (result.hasErrors()) {
            modelAndView.setViewName("content/user");
        } else {

            try {
                byte[] bytes = file.getBytes();

                fileName = file.getOriginalFilename();

                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");

                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File loadFile = new File(dir.getAbsolutePath() + File.separator + fileName);

                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(loadFile));
                stream.write(bytes);
                stream.flush();
                stream.close();

                Users loggedInUser = userService.findUserByName(user.getName());
                loggedInUser.setImageData(uploadedFile.getFile().getBytes());
                userService.saveProfileImage(loggedInUser);
                logger.info("uploaded: " + loadFile.getAbsolutePath());

                RedirectView redirectView = new RedirectView("fileUploaded");
                redirectView.setStatusCode(HttpStatus.FOUND);
                modelAndView.setView(redirectView);
                modelAndView.addObject("filename", fileName);

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
