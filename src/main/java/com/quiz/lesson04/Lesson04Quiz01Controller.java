package com.quiz.lesson04;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	// 판매자 추가 화면
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	@RequestMapping(path="/add_seller_view", method=RequestMethod.GET)
	public String addSellerView() {
		return "/lesson04/addSeller";
	}
	
}
