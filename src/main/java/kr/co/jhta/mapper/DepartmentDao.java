package kr.co.jhta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.vo.Department;

@Mapper
public interface DepartmentDao {

	List<Department> getDepartments();
}
