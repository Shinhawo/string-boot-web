package kr.co.jhta.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class WebSecurityConfig {

	/*
	 * SecurityFriltrChain을 설정해서 반환한다.
	 * 		SecurityfilterChain은 인증을 처리하는 여러 개의 시큐리티 필터를 담는 필터 체인이다.
	 * 		아래의 메서드는 인증/인가 관련 보안 설정을 포함하는 SecurityFilterChain을 
	 * 		구성해서 반환하고, 반환된 SecurityfilterChain은 스프링 컨테이너의 빈으로 등록된다. 
	 */
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		return http
				// 사이트간 요청위조 방지 기능을 비활성화 시킨다.
				.csrf()
					.disable()		
					// Form 로그인 인증 기능을 사용한다.
					.formLogin()
					// 사용자정의 로그인 페이지를 요청하는 URL을 지정한다.
					.loginPage("/emp/loginform")
					// 아이디에 해당하는 파라미터값의 이름을 지정한다.
					.usernameParameter("email")
					// 비밀번호에 해당하는 파라미터값의 이름을 지정한다.
					.passwordParameter("password")
					// Form 로그인 인증작업을 요청하는 URL을 지정한다.
					.loginProcessingUrl("/emp/login")
					// 로그인 성공시 재요청 URL을 지정한다.
					.defaultSuccessUrl("/")
					// 로그인 실패시 재요청 URL을 지정한다.
					.failureUrl("/emp/loginform?error=fail")
				.and()
					// 로그아웃 기능을 사용한다.
					.logout()
					// 로그아웃을 요청하는 URL을 지정한다.
					.logoutUrl("/emp/logout")
					// 로그아웃 성공시 재요청 URL을 지정한다.
					.logoutSuccessUrl("/")
					// 세션객체를 무효화 시킨다.
					.invalidateHttpSession(true)
				.and()
					.exceptionHandling()
					// authenticationEntryPoint : 인증이 필요한 서비스를 요청했는데 인증이 되지 않은 경우 
					.authenticationEntryPoint((req,res,ex) -> res.sendRedirect("/emp/loginform?error=denied"))
				.and()
					.exceptionHandling()
					// accessDeniedHandler
					.accessDeniedHandler((req,res,ex) -> res.sendRedirect("/emp/loginform?error=forbidden"))
				.and()
					.build();
	}
	
	/*
	 * 비밀번호 인코딩을 지원하는 BCryptPasswordEncoder객체를 
	 * 스프링컨테이너의 빈으로 등록시킨다.
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
