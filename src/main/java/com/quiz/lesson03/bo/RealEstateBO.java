package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	// getRealEstateById() 파라미터를 받는 함수는 By뒤에 파라미터 이름을 붙여준다.
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public List<RealEstate> getTest(int id) {
		return realEstateDAO.selectRealEstateId(id);
	}
	
	//input: controller 넘겨준 rentPrice
	//output: List<RealEstate> => 컨트롤러한테 넘김
	// getRealEstateListByRentPrice
	public List<RealEstate> getRealEstateRentPrice(int rentPrice) {
		return realEstateDAO.selectRealEstateRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateAP(int area, int price) {
		return realEstateDAO.selectRealEstateAP(area, price);
	}
	
	// input: RealEstate
	// output: int(성공한 행의 개수)
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	
	public int addRealEstateAsField(
			int realtorId,
			String address,
			int area,
			String type,
			int price,
			Integer rentPrice) {
		return realEstateDAO.insertRealEstateAsField(realtorId ,address, area, type, price, rentPrice);
	}
}
