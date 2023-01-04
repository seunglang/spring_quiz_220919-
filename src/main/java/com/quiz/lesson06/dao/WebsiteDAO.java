package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Website;

@Repository
public interface WebsiteDAO {
	public void insertWebsite(
			@Param("name") String name,
			@Param("url") String url);
	
	public List<Website> selectWebsiteList();
}
