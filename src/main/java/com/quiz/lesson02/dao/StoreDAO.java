package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDAO {
	
	// input:X (service가(BO) 아무것도 주지않음)
	// output:List<UsedGoods>
	public List<Store> selectStoreList();
}
