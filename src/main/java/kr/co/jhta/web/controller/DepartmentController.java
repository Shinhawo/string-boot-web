package kr.co.jhta.web.controller;

import java.util.List;
import java.util.Map;

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
	@ResponseBody
	public Map<String, Object> detail(@RequestParam("id") int deptId) {
		
		Department dept = hrService.getDepartment(deptId);
		List<Employee> employees = hrService.getEmployeesByDeptId(deptId);
		
		/*
		 * {"dept": {"id:20, 
		 * 			 "name":"Marketing", 
		 * 			 "manager":{"id":201,
		 * 						 "firstName":"Michael",
		 * 						 "lastName":"Hartstein",
		 * 						 "email":null,
		 * 						 "phoneNumber":null
		 * 						},
		 * 			 "loc":1700
		 * 			},
		 * 	"employees":[{"id":201,
		 * 				  "firstName":"Michael",
		 * 				  "lastName":"Hartstein",
		 * 				  "job":{"id":"MK_MAN", "title":"...."},
		 * 				  "salary":13000.0
		 * 				  "department":{"id":20, 
		 * 								"name":"Marketing", 
		 * 								"manager":null,
		 * 								"loc":0
		 * 								}
		 * 				...
		 * 				]
		 * }
		 */
		return Map.of("dept", dept, "employees", employees);
	}
}
