package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {
	
	@Autowired // 스프링빈을 주입받음 (Dependency Injection)
	private StoreDAO storeDAO; // private 다음 StoreDAO는 자료형이다.
	
	// input:X (컨트롤러가 아무것도 주지않음)
	// output:List<UsedGoods>
	public List<Store> getStoreList() {
		return storeDAO.selectStoreList();
	}
}
