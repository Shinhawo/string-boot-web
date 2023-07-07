package kr.co.jhta.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.service.HrService;
import kr.co.jhta.vo.Employee;
import kr.co.jhta.vo.Job;
import kr.co.jhta.web.form.AddJobForm;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/job")
@Slf4j
public class JobController {

	@Autowired
	private HrService hrService;
	
	// 전체 직종목록화면 요청과 매핑되는 요청핸들러 메서드
	@GetMapping("/list")
	public String getAllJobs(Model model){
		
		List<Job> jobList = hrService.getAllJobs();
		model.addAttribute("jobs", jobList);
		
		return "jobs/list";
	}
	
   // 직종별 직원목록화면 요청과 매핑되는 요청핸들러 메서드
   @GetMapping("/emps")
   public String employees(@RequestParam("id") String jobId, Model model) {
      log.info("직종아이디: " +jobId);
      
      List<Employee> empList = hrService.getEmployeesByJobId(jobId);
      model.addAttribute("emps", empList);
      
      return "jobs/employees";
   }
   
   // 신규 직종 등록폼화면 요청과 매핑되는 요청핸들러 메서드
   @GetMapping("/add")
   public String form() {
	   return "jobs/form";
   }
   
   @PostMapping("/add")
   public String createJob(AddJobForm form) {
	   log.info("신규 직종 입력정보 : {}",form);
	   
	   hrService.createJob(form);
	   return "redirect:list";
   }
   
	  
}
