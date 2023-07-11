package kr.co.jhta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.vo.EmployeeFile;

@Mapper
public interface EmployeeFileDao {

	void insertEmployeeFile(EmployeeFile employeeFile);
	List<EmployeeFile> getEmployeeFiles();
	EmployeeFile getEmployeeFileById(int id);
	void updateEmployeeFile(EmployeeFile employeeFile);
}
