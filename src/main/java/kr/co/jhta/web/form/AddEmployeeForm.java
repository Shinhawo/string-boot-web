package kr.co.jhta.web.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddEmployeeForm {

	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hireDate;
	private String jobId;
	private Double salary;
	private Double commissionPct;
	private Integer managerId;
	private Integer departmentId;
	private String password;
	
}
