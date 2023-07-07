package kr.co.jhta.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("Department")
@NoArgsConstructor
public class Department {
	
	private int id;
	private String name;
	private Employee manager;
	private Integer loc;
	
	public Department(int id) {
		this.id = id;
	}

}
