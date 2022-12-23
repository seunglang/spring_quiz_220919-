package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@RestController
public class Lesson02Quiz01RestController {
	
	@Autowired // 스프링빈을 DI(주입) 받음
	private StoreBO storeBO;
	// RequestMapping import 단계에서 아파치 문장이 자동 임포트 되면 지워줘야 한다.
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01() {
		List<Store> storeList = storeBO.getStoreList();
		return storeList; // json
		// return storeBO.getStoreList(); 이것도 가능
	}
}
