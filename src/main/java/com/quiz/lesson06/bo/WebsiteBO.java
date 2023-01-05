package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.WebsiteDAO;
import com.quiz.lesson06.model.Website;

@Service
public class WebsiteBO {
	
	@Autowired
	private WebsiteDAO websiteDAO;
	
	public void addWebsite(String name, String url) {
		websiteDAO.insertWebsite(name, url);
	}
	
	public List<Website> getWebsiteList() {
		return websiteDAO.selectWebsiteList();
	}
	
	public boolean existWebsiteByUrl(String url) {
		return websiteDAO.existWebsiteByUrl(url);
	}
	
	// 삭제 구문
	public String deleteWebsiteById(String name, String url) {
		return websiteDAO.deleteWebsiteById(name, url);
	}
}
