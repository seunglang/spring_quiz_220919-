package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	@PostMapping("/quiz02/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> checkExist = new HashMap<>();
		checkExist.put("is_duplication", websiteBO.existWebsiteByUrl(url));
		return checkExist;

	}
	
		// url 중복확인 - AJAX 통신 요청 기존과 다른 예제
	// 그냥 가져오게 되면 toomanyresult 에러가 뜨기 때문에
	// DAO에서 객체를 리스트로 담아주면 된다.
		// http://localhost:8080/lesson06/quiz02/is_duplication
//		@ResponseBody
//		@PostMapping("/quiz02/is_duplication")
//		public Map<String, Boolean> isDuplication(
//				@RequestParam("url") String url
//				) {
//			Map<String, Boolean> checkExist = new HashMap<>();
//			// 중복확인을 위한 select를 해봐야 함
//			Website website = websiteBO.getWebsite(url);
//			if (website != null) {
//				checkExist.put("is_duplication", true);
//			} else {
//				checkExist.put("is_duplication", false);
//			}
	
	
//			checkExist.put("is_duplication", true);
//			return checkExist;
//		}
		
		
	
	// 행 삭제 api
	@ResponseBody
	@DeleteMapping("/quiz02/delete_website") // delete 방식으로하면 메소드를 delete 형식으로 보내야 한다.
	public Map<String, Object> deleteWebsiteById(
			@RequestParam("id") int id
			//@RequestParam("url") String url
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		// db delete
		int row = websiteBO.deleteFavoriteById(id);
		if (row > 0) {
			result.put("code", 1); // 1번이면 성공
			result.put("result", "성공");
		} else {
			result.put("code", 500); // 500이면 실패
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		//websiteBO.deleteWebsiteById(id);
		return result;
	}

}
