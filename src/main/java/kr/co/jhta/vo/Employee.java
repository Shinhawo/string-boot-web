package kr.co.jhta.vo;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("Employee")
@NoArgsConstructor
public class Employee implements UserDetails{

	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private Date hireDate;
	private Job job;
	private Double salary;
	private Double commissionPct;
	private Employee manager;
	private Department department;
	private String encryptedPassword;
	
	public Employee(int id) {
		this.id = id;
	}

	// 직원(사용자)의 보유권한을 반환한다.
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return List.of(new SimpleGrantedAuthority("USER_ROLE"));
	}
	
	// 직원(사용자)의 비밀번호를 반환한다.
	@Override
	public String getPassword() {
		System.out.println("비밀번호- "+ encryptedPassword);
		return encryptedPassword;
	}

	// 직원(사용자)의 고유한 식별정보를 반환한다.
	@Override
	public String getUsername() {
		return email;
	}

	// 직원(사용자)의 계정 만료여부를 반환한다. true - 계정만료되지 않았음
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	// 직원(사용자)의 계정잠김여부를 반환한다. true - 계정잠기지 않았음
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	// 직원(사용자)의 비밀번호 만료여부를 반환한다. true - 비밀번호 만료되지 않았음
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 직원(사용자)의 활성화 여부를 반환한다. true - 계정이 사용가능함.
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
