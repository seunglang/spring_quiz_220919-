package com.quiz.lesson03;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz01RestController {
	
	
	// Map map = new HashMap();
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/lesson03/quiz01/1")
	public List<RealEstate> quiz01(
			@RequestParam(value="id", required=true) int id
			) {
		
		return realEstateBO.getTest(id);
	}
	
	@RequestMapping("/lesson03/quiz01/2") 
	public List<RealEstate> quiz02(
			@RequestParam(value="rentPrice", required=true) int rentPrice
			) {
		return realEstateBO.getRealEstateRentPrice(rentPrice);
	}
	
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz03(
			@RequestParam(value="area", required=true) int area, 
			@RequestParam(value="price", required=false, defaultValue="10000") int price
			) {
		return realEstateBO.getRealEstateAP(area, price);
	}
	
}
