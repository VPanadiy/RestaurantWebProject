package dream.development.validators;

import dream.development.model.objects.UploadedFile;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class FileValidator implements Validator {

	@Override
	public void validate(Object uploadedFile, Errors errors) {

		UploadedFile file = (UploadedFile) uploadedFile;

		if (file.getFile().getSize() == 0) {
			errors.rejectValue("file", "uploadForm.selectFile", "Please select a file!");
		}

		if (file.getFile().getSize() > 100000) {
			errors.rejectValue("file", "uploadForm.selectFile", "Max size of selected file must be not more then 100KB!");
		}

	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}
}