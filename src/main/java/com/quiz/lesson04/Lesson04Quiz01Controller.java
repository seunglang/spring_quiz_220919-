package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller // jsp가 나올땐 무조건 rest말고 controller로 해줘야 함
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// 판매자 추가 화면
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	@GetMapping()
	@RequestMapping(path="/add_seller_view", method=RequestMethod.GET)
	public String addSellerView() {
		return "/lesson04/addSeller";
	}
	
	// 판매자 입력 성공
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature // 이 필드는 null 허용이어야 함. 집컴 mysql 수정하기
			) {
		// DB import
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/afterAddSeller"; 
	}
	
	// http://localhost:8080/lesson04/quiz01/get_last_seller_view
	// http://localhost:8080/lesson04/quiz01/get_last_seller_view?id=1
	@GetMapping("/get_last_seller_view")
	public String getLastSellerView(Model model,
			@RequestParam(value="id", required=false) Integer id
			) {
		
		// db select
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		
		model.addAttribute("seller", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "/lesson04/getLastSeller";
	}
	
}
