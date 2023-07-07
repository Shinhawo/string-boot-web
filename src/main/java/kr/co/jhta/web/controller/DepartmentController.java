package kr.co.jhta.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.service.HrService;
import kr.co.jhta.vo.Department;

@Controller
@RequestMapping("/dept")
public class DepartmentController {

	@Autowired
	private HrService hrService;
	
	// 요청 URL : http://localhost/dept/list
	// 요청방식 : GET
	@GetMapping("/list")
	public String list(Model model) {
		// 컨트롤러에서 jsp에 전달할 때 사용하는 것이 Model 객체
		
		List<Department> departmentList = hrService.getAllDepartments();
		model.addAttribute("depts", departmentList);
		return "departments/list"; // "WEB-INF/views/departments/list.jsp"
	}
	
	// 요청 URL : http://localhost/dept/register	
	// 요청방식 : GET
	@GetMapping("/register")
	public String form() {
		
		return "";
	}

	// 요청 URL : http://localhost/dept/register
	// 요청방식 : POST
	@PostMapping("/register")
	public String register() {
		
		return "";
	}
	
	// 요청 URL : http://localhost/dept/modify?id=10
	// 요청방식 : GET
	@GetMapping("/modify")
	public String modifyform() {
		
		return "";
	}

	// 요청 URL : http://localhost/dept/modify?id=10
	// 요청방식 : POST
	@PostMapping("/modify")
	public String modify() {
		
		return "";
	}

	// 요청 URL : http://localhost/dept/detail?id=10
	// 요청방식 : GET
	@GetMapping("/detail")
	public String detail() {
		
		return "";
	}
}
