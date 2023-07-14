package kr.co.jhta.web.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.service.HrService;
import kr.co.jhta.vo.Department;
import kr.co.jhta.vo.Employee;
import kr.co.jhta.vo.EmployeeFile;
import kr.co.jhta.vo.Job;
import kr.co.jhta.web.form.AddEmployeeFileForm;
import kr.co.jhta.web.form.AddEmployeeForm;
import kr.co.jhta.web.model.EmployeeList;
import kr.co.jhta.web.view.EmployeesExcelView;
import kr.co.jhta.web.view.FileDownloadView;
import lombok.val;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/emp")
@Slf4j
public class EmployeeController {

	@Value("${hr.employee.xls.save-directory}")
	private String directory;
	
	@Autowired
	private FileDownloadView fileDownloadView;
	
	@Autowired
	private EmployeesExcelView employeesExcelView;
	
	@Autowired
	private HrService hrService;
	
	// 로그인 화면 요청을 처리하는 요청핸들러 메서드
	@GetMapping("/loginform")
	public String form() {
		return "employees/loginform";
	}
	
	// 직원목록화면 요청과 매핑되는 요청핸들러 메서드
	@GetMapping("/list")
	public String list(@RequestParam(name = "sort", required = false, defaultValue = "id") String sort,
			@RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
			@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			@RequestParam(name = "opt", required = false, defaultValue = "") String opt,
			@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
			Model model) {
//		log.info("sort='{}', rows='{}', page='{}', opt='{}', keyword='{}'", sort, rows, page, opt, keyword);
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("sort", sort);
		param.put("rows", rows);
		param.put("page", page);
		// stringframework의 StringUtils
		if(StringUtils.hasText(opt) && StringUtils.hasText(keyword)) {
			param.put("opt", opt);
			param.put("keyword", keyword);
		}
		
		EmployeeList result = hrService.getEmployees(param);
		
		/*
		 *  아래의 코드를 실행하면 Model객체에 (직원목록과 페이징정보를 포함하고 있는)EmployeeList가 저장된다.
		 *  
		 *  JSP에서 페이징처리정보를 조회할 때는 ${result.pagination.xxx} 
		 *  	   직원목록정보를 조회할 때는 ${result.employees}
		 *  	   
		 */
		
		model.addAttribute("result", result);
		
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
//		throw new RuntimeException("파이널 프로젝트 잘하장!!");
		hrService.createEmployee(form);
		return "redirect:/";
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
	
	// 3. 직원상세정보를 응답으로 보내는 요청핸들러 메서드
	@GetMapping("/detail")
	@ResponseBody
	public Employee getEmployeeDetail(@RequestParam("id") int empId) {
		Employee employee = hrService.getEmployee(empId);
		return employee;
	}
	
	@PostMapping("/upload")
	public String uploadEmployeeFile(AddEmployeeFileForm form) throws Exception{
		hrService.createEmployeeFile(form);
		
		return "redirect:files";
	}
	
	@GetMapping("/files")
	public String files(Model model) {
		List<EmployeeFile> files = hrService.getAllEmployeeFiles();
		model.addAttribute("files",files);
		return "employees/files";
	}
	
	@GetMapping("/add-all")
	public String addEmployees(@RequestParam("id") int fileId) throws Exception{
		hrService.addEmployees(fileId);
		
		return "redirect:files";
	}
	
	// 엑셀파일 다운로드 요청
	// 요청방식 : Get
	// 요청 URL : http://localhost/emp/download?id=10001
	@GetMapping("/download")
	public ModelAndView fileDownload(@RequestParam("id") int fileId) throws Exception{
		
		EmployeeFile employeeFile = hrService.getEmployeeFile(fileId);
		
		// ModelAndView 객체에 파일다운로드 응답을 보내는 View 객체를 저장한다.
		//					 디렉토리 경로를 저장한다.
		//                   파일명을 저장한다.
		
		ModelAndView mav = new ModelAndView();
		
		// 파일을 응답으로 보내는 FieDownloadView 객체를 ModelAndView객체에 저장함.
		mav.setView(fileDownloadView);
		// FileDownloadView 객체에 전달할 정보를 ModelAndView객체에 저장함.
		// 요것들은 FiledownloadView, renderMergedOutputModel 메서드의 model에 전달됨
		mav.addObject("directory", directory);
		mav.addObject("filename", employeeFile.getName());
		
		return mav;
	}
	
	// 전체 직원 목록에 대한 엑셀파일 요청
	// 요청방식 : GET
	// 요청URL : http://localhost/emp/xls
	@GetMapping("/xls")
	public ModelAndView downloadEmployeesXls() {
		List<Employee> employees = hrService.getAllEmployees();
		
		ModelAndView mav = new ModelAndView();
		mav.setView(employeesExcelView);
		mav.addObject("items", employees);
		
		return mav;
	}
}
