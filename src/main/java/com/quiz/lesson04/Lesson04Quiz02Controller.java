package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02/")
@Controller
public class Lesson04Quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;
	
	// 공인중개사 추가 화면
	// http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("add_realtor_view")
	public String addRealtorView(Realtor realtor) {
		
		return "lesson04/addRealtor";
	}
	
	// insert => 방금 추가된 공인중개사 정보
	@PostMapping("add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor, // jsp 태그에있던 name(form태그 속성)과 필드명이 일치하는 것이 담긴다.
			Model model) {
		
		// db insert // 객체를 통째로 받아오기
		realtorBO.addRealtor(realtor);
		
		
		// 방금 인서트된 정보 가져오기 db select // 방금 가입된 사람
		realtor = realtorBO.getRealtorById(realtor.getId());
		
		// model
		model.addAttribute("result", realtor);
		model.addAttribute("title", "공인중개사 정보");
		
		// view 응답값
		
		return "lesson04/afterAddRealtor";
	}
}
