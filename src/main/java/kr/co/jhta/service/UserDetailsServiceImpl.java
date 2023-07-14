package kr.co.jhta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.jhta.mapper.EmployeeDao;
import kr.co.jhta.vo.Employee;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Employee employee = employeeDao.getEmployeeByEmail(email);
		if (employee == null) {
			throw new UsernameNotFoundException("직원정보가 존재하지 않습니다.");
			
		}
		
		return employee;
	}
}
