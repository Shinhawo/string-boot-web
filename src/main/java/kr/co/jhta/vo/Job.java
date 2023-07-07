package kr.co.jhta.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("Job")
public class Job {

	private String id;
	private String title;
	private int minSalary;
	private int maxSalary;
	
	public Job(String id) {
		this.id = id;
	}
	
}
