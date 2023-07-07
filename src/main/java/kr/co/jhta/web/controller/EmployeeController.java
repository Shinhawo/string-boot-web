package kr.co.jhta.web.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.HrService;
import kr.co.jhta.vo.Department;
import kr.co.jhta.vo.Employee;
import kr.co.jhta.vo.Job;
import kr.co.jhta.web.form.AddEmployeeForm;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	private HrService hrService;
	
	// 직원목록화면 요청과 매핑되는 요청핸들러 메서드
	@GetMapping("/list")
	public String list() {
		return "employees/list";
	}
	
	// 신규직원 등록폼화면 요청과 매핑되는 요청핸들러 메서드
	@GetMapping("/add")
	public String form(Model model) {
		// 부서목록
		List<Department> depts = hrService.getAllDepartments();
		// 직종목록
		List<Job> jobs = hrService.getAllJobs();
		
		model.addAttribute("depts", depts);
		model.addAttribute("jobs", jobs);
		
		return "employees/form";
	}
	
	// 신규직원 등록 요청과 매핑되는 요청핸들러 메서드
	@PostMapping("/add")
	public String createEmployee(AddEmployeeForm form) {
		hrService.createEmployee(form);
		return "redirect:list";
	}
	
	// 직원상세정보 화면 요청과 매핑되는 요청핸들러 메서드
	
	// 직원수정폼화면 요청과 매핑되는 요청핸들러 메서드
	
	// 직원정보 수정요청과 매핑되는 요청핸들러 메서드
	
	// 직원목록정보 요청을 처리하는 요청핸들러 메서드
	@GetMapping("/empsByDept")
	@ResponseBody
	public List<Employee> getEmpsByDept(@RequestParam("deptId") int deptId) {
		List<Employee> employees = hrService.getEmployeesByDeptId(deptId);
		return employees;
	}
}
