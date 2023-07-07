package kr.co.jhta.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping(value = "/")
	public String home(Model model) {
		// Model객체에는 뷰템플릿에 전달할 값을 담을 수 있다.
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		
		return "home";  // "/WEB-INF/views/home.jsp"로 내부이동시키라는 의미
	}
}
