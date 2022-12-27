package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public List<RealEstate> selectRealEstateId(int id);
	public List<RealEstate> selectRealEstateRentPrice(int rentPrice);
	public List<RealEstate> selectRealEstateAP(
			// @Param 어노테이션에 의해서 하나의 맵이 된 것
			@Param("area") int area,
			@Param("price") int price);
	
	public int insertRealEstate(RealEstate realEstate);
	
	
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") int price,
			@Param("rentPrice") Integer rentPrice);
	
	public int updateRealEstateById(
			@Param("id") int id,
			@Param("type") String type,
			@Param("price") int price);
	
	public void deleteRealEstateById(int id);
}
