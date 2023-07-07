package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.mapper.DepartmentDao;
import kr.co.jhta.mapper.EmployeeDao;
import kr.co.jhta.mapper.JobDao;
import kr.co.jhta.vo.Department;
import kr.co.jhta.vo.Employee;
import kr.co.jhta.vo.Job;
import kr.co.jhta.web.form.AddEmployeeForm;
import kr.co.jhta.web.form.AddJobForm;

/**
 * 부서관리, 직원관리, 직종관리 관련 업무로직이 구현된 클래스다.
 * @author jhta
 *
 */
@Service
public class HrService {

	@Autowired
	private DepartmentDao departmentDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private JobDao jobDao;
	
	public List<Department> getAllDepartments() {
		return departmentDao.getDepartments();
	}
	
	public List<Job> getAllJobs() {
		return jobDao.getAllJobs();
	}
	
	public List<Employee> getEmployeesByJobId(String jobId){
		return employeeDao.getEmployeesByJobId(jobId);
	}
	
	/**
	 * 지정된 부서아이디의 부서에 소속된 사원목록을 반환한다.
	 * @param deptId 부서아이디
	 * @return 해당 부서에 소속된 직원목록
	 */
	public List<Employee> getEmployeesByDeptId(int deptId){
		return employeeDao.getEmployeesByDeptId(deptId);
	}
	
	/**
	 * 폼입력값을 포함하는 Form객체를 전달받아서 신규 직종정보를 추가한다.
	 * @param form 신규 직종정보가 포함된 form 객체
	 */
	public void createJob(AddJobForm form) {
		Job job = new Job();
		BeanUtils.copyProperties(form, job);
		
		jobDao.insertJob(job);
	}
	
	/**
	 * 폼입력값을 포함하는 Form객체를 전달받아서 신규 직원정보를 추가한다.
	 * @param form 신규 직원정보가 포함된 Form객체
	 */
	public void createEmployee(AddEmployeeForm form) {
		Employee employee = new Employee();
		// jobId, departmentId, manageId를 제외한 다른 프로퍼티값이 전부 복사됨
		BeanUtils.copyProperties(form, employee);
		
		Job job = new Job(form.getJobId());
		employee.setJob(job);
		
		if (form.getDepartmentId() != null) {
			Department department = new Department(form.getDepartmentId());
			employee.setDepartment(department);
		}
		if (form.getManagerId() != null) {
			Employee manager = new Employee(form.getManagerId());
			employee.setManager(manager);
		}
		employeeDao.insertEmployee(employee);
	}
}
