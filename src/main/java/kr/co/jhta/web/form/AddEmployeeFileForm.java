package kr.co.jhta.web.form;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddEmployeeFileForm {

	private String title;
	private MultipartFile xlsfile;
}
