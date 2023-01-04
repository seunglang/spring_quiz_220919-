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
}