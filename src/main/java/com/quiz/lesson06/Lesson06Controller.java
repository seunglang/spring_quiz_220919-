package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.WebsiteBO;
import com.quiz.lesson06.model.Website;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private WebsiteBO websiteBO;
	
	// 웹사이트 주소 추가 페이지 화면
	// http://localhost:8080/lesson06/quiz01/add_website_view
	@GetMapping("/quiz01/add_website_view")
	public String addWebsiteView() {
		return "lesson06/addWebsite";
	}
	
	// AJAX 통신으로 오는 요청
	@ResponseBody // 어떤 값을 리턴하면 리턴되는 값 통째로 responseBody에 들어간다
	@PostMapping("/quiz01/add_website")
	public String addWebsite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		// db insert
		websiteBO.addWebsite(name, url);
		
		return "성공";
	}
	
	// AJAX 통신으로 온 요청을 완료 후 원하고자 하는 페이지로 넘기기
	@GetMapping("/quiz01/after_add_website_view")
	public String afterAddWebsite(
			Model model
			, @ModelAttribute Website website
			) {
		
		List<Website> websiteList = websiteBO.getWebsiteList();
		
		model.addAttribute("list", websiteList);
		
		return "lesson06/afterAddWebsite";
	}
}