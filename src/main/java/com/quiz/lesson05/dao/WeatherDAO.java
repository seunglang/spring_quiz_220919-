package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.WeatherHistory;

@Repository
public interface WeatherDAO {
	public void insertWeather(WeatherHistory weatherHistory);
	public List<WeatherHistory> selectWeatherHistoryList();
}
