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
	
	// db에 데이터 저장 구문
	public void addWebsite(String name, String url) {
		websiteDAO.insertWebsite(name, url);
	}
	
	// db 데이터 값 호출 구문
	public List<Website> getWebsiteList() {
		return websiteDAO.selectWebsiteList();
	}
	
	// 중복 확인 구문
	public boolean existWebsiteByUrl(String url) {
		return websiteDAO.existWebsiteByUrl(url);
	}
	
	// 다른 예시 - 중복 확인 구문
//	public Website getWebsite(String url) {
//		List<Website> websiteList = websiteDAO.selectWebsiteByUrl(url);
//		// 0 1(index) [] null 인지 체크해봐야 함
//		if (websiteList.isEmpty() == false) { // 리스트가 채워져 있을 때
//			websiteList.get(0);
//		}
		
		// 여기까지 왔다면 비어있다는 것. 비어있는 경우
//		return null;
//	}
	
	// 삭제 구문
//	public String deleteWebsiteById(int id) {
//		return websiteDAO.deleteWebsiteById(id);
//	}
	
	
	public int deleteFavoriteById(int id) {
		return websiteDAO.deleteWebsiteById(id);
	}
}
