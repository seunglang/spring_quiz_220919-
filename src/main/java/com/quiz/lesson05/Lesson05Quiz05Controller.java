package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherBO weatherBO;
	
	// 기상청 홈페이지 추가 주소
	// http://localhost:8080/lesson05/quiz05/add_weather_view
	@GetMapping("add_weather_view")
	public String quiz05_1(WeatherHistory weatherHistory) {
		
		return "lesson05/addWeather";
	}
	
	// 기상청 홈페이지 주소
	// http://localhost:8080/lesson05/quiz05/add_weather
	@GetMapping("add_weather")
	public String quiz05(
			//@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			@ModelAttribute WeatherHistory weatherHistory,
			Model model
			) {
		
		// date가 왜 null로 들어오는지 생각. map주소엔 넣은 값이 제대로 나옴.
		// db insert // 객체 통으로 받아오기
		weatherBO.addWeather(weatherHistory);
		
		// model
		List<WeatherHistory> WeatherHistoryList = weatherBO.getWeatherHistoryList();
		WeatherHistoryList.add(weatherHistory);
		
		model.addAttribute("WeatherHistory", WeatherHistoryList);
		
		
		// view 응답값
		
		return "lesson05/afterAddWeather";
	}
}
