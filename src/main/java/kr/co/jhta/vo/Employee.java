package kr.co.jhta.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("Employee")
@NoArgsConstructor
public class Employee {

	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private Date hireDate;
	private Job job;
	private Double salary;
	private Double commissionPct;
	private Employee manager;
	private Department department;
	
	public Employee(int id) {
		this.id = id;
	}
	
}
