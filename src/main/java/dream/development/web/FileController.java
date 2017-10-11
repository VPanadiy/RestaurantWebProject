package dream.development.web;

import dream.development.model.objects.UploadedFile;
import dream.development.validators.FileValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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


@Controller
@SessionAttributes("filename")
public class FileController {

	@Autowired
	private FileValidator fileValidator;

	private static final Logger logger = LoggerFactory.getLogger(FileController.class);

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uploadFile(@ModelAttribute("uploadedFile") UploadedFile uploadedFile, BindingResult result) {// имена параметров - как на форме jsp

		ModelAndView modelAndView = new ModelAndView();

		String fileName = null;

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

				logger.info("uploaded: " + loadFile.getAbsolutePath());

				RedirectView redirectView = new RedirectView("fileUploaded");
				redirectView.setStatusCode(HttpStatus.FOUND);
				modelAndView.setView(redirectView);
				modelAndView.addObject("filename", fileName);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return modelAndView;
	}

	@RequestMapping(value = "/fileUploaded", method = RequestMethod.GET)
	public String fileUploaded() {
		return "content/fileUploaded";
	}

}