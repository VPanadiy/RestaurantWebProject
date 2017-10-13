package dream.development.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@ControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(IOException.class)
	public ModelAndView handleIOException(Exception e) {
		logger.error("IOException handler executed");
		ModelAndView modelAndView = new ModelAndView("error");
		modelAndView.addObject("error", e.getMessage());
		return modelAndView;
	}
}
