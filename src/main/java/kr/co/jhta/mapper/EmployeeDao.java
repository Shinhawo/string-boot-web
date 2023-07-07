package kr.co.jhta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.vo.Employee;

@Mapper
public interface EmployeeDao {

	List<Employee> getEmployeesByJobId(String jobId);
	List<Employee> getEmployeesByDeptId(int deptId);
	void insertEmployee(Employee employee);
}
