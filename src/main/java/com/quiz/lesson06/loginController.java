package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson06")
@Controller
public class loginController {
	
	// http://localhost:8080/lesson06/login_view
	@GetMapping("/login_view")
	public String login() {
		return "lesson06/login";
	}
	
	// http://localhost:8080/lesson06/sign_in_view
		@GetMapping("/sign_in_view")
		public String sign_in() {
			return "lesson06/signIn";
		}
}
