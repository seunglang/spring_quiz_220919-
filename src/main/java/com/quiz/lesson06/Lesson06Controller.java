package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

	// AJAX 통신으로 오는 요청, AJAX는 자체로 view를 절대 내려줄 수 없다.
//	@ResponseBody // 어떤 값을 리턴하면 리턴되는 값 통째로 responseBody에 들어간다
//	@PostMapping("/quiz01/add_website")
//	public String addWebsite(
//			@RequestParam("name") String name,
//			@RequestParam("url") String url
//			) {
//		// db insert
//		websiteBO.addWebsite(name, url);
//		
//		return "성공";
//	}
	@ResponseBody // 어떤 값을 리턴하면 리턴되는 값 통째로 responseBody에 들어간다
	@PostMapping("/quiz01/add_website")
	public Map<String, String> addFavorite(@RequestParam("name") String name, @RequestParam("url") String url) {
		// db insert
		websiteBO.addWebsite(name, url);

		// 성공 값 응답값
		Map<String, String> result = new HashMap<>();
		result.put("result", "성공");

		return result; // jackson => JSON String(잭슨 라이브러리가 잭슨으로 변환됨)
	}

	// AJAX 통신으로 온 요청을 완료 후 원하고자 하는 페이지로 넘기기
	@GetMapping("/quiz01/after_add_website_view")
	public String afterAddWebsite(Model model
	// , @ModelAttribute Website website
	) {

		List<Website> websiteList = websiteBO.getWebsiteList();

		model.addAttribute("list", websiteList);

		return "lesson06/afterAddWebsite";
	}

	
	// url 중복확인 - AJAX 통신 요청
	// http://localhost:8080/lesson06/quiz02/is_duplication
	@ResponseBody
	@GetMapping("/quiz02/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> checkExist = new HashMap<>();
		checkExist.put("is_duplication", websiteBO.existWebsiteByUrl(url));
		return checkExist;

	}
	
	// 행 삭제 api
	@ResponseBody
	@GetMapping("/quiz03/delete")
	public String deleteWebsiteById(
			@RequestParam("name") String name
			//@RequestParam("url") String url
			) {
		System.out.println(name);
		//websiteBO.deleteWebsiteById(name, url);
		System.out.println("테스트");
		return "삭제 완료";
	}
	

}
