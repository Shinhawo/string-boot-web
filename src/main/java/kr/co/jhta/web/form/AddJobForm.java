package kr.co.jhta.web.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 매개변수없는 디폴트 생성자를 추가시킨다
@NoArgsConstructor
// Getter, Setter 메서드를 추가한다.
@Getter
@Setter
// toString 메서드를 추가한다.
@ToString
public class AddJobForm {

	private String id;
	private String title;
	private int minSalary;
	private int maxSalary;
}
