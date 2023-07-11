package kr.co.jhta.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("EmployeeFile")
@Getter
@Setter
@ToString
public class EmployeeFile {

	private int id;
	private String title;
	private String name;
	private String added;
	private Date createDate;
}
