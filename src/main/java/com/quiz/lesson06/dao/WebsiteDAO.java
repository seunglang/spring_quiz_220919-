package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Website;

@Repository
public interface WebsiteDAO {
	// db 데이터 저장 구문
	public void insertWebsite(
			@Param("name") String name,
			@Param("url") String url);
	
	// db 데이터 호출 구문
	public List<Website> selectWebsiteList();
	
	// url 중복 확인 구문
	public boolean existWebsiteByUrl(String url);
	
	// 다른 예제 - 중복 확인 구문
	//public Website selectWebsiteByUrl(String url);
	
	// 행 삭제
	public int deleteWebsiteById(int id);
}
