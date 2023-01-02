package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Quiz05Controller {

	// 기상청 홈페이지 주소
	// http://localhost:8080/lesson05/quiz05
	@GetMapping("/quiz05")
	public String quiz05() {

		return "lesson05/quiz05";
	}
	
	// 기상청 홈페이지 추가 주소
	// http://localhost:8080/lesson05/quiz05_1
	@GetMapping("/quiz05_1")
	public String quiz05_1() {

		return "lesson05/quiz05_1";
	}
}
