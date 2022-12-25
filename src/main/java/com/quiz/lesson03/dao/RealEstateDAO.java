package com.quiz.lesson03.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public List<RealEstate> selectRealEstateId(int id);
	public List<RealEstate> selectRealEstateRentPrice(int rentPrice);
	public List<RealEstate> selectRealEstateAP(int area, int price);
}
