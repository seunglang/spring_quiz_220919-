package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherBO;
import com.quiz.lesson05.model.WeatherHistory;

import jakarta.servlet.http.HttpServletResponse;

@RequestMapping("/lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherBO weatherBO;
	
	// 기상청 홈페이지 추가 주소
	// http://localhost:8080/lesson05/quiz05/add_weather_view
	@GetMapping("add_weather_view")
	public String quiz05_1(WeatherHistory weatherHistory) {
		
		// 추가 => 결과화면 목록 화면 이동(redirect)
		return "lesson05/addWeather";
		//return "redirect:/lesson05/add_weather";
	}
	
	//@PostMapping
//	public String addWeather(
//			@RequestParam("date") String date, // String으로 insert를 해도 DB에서는 date타입으로 잘 저장된다.
//			@RequestParam("weather") String weather,
//			@RequestParam("microDust") String microDust,
//			@RequestParam("temperatures") double temperatures,
//			@RequestParam("precipitation") double precipitation,
//			@RequestParam("windSpeed") double windSpeed,
//			HttpServletResponse response
//			) {
//		
//		//response.sendRedirect("/lesson05/add_weather");
//		return "redirect:/lesson05/add_weather";
//	}
	
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
		if (weatherHistory.getDate() != null) {
			weatherBO.addWeather(weatherHistory);
		}
		List<WeatherHistory> WeatherHistoryList = weatherBO.getWeatherHistoryList();
		
		model.addAttribute("WeatherHistory", WeatherHistoryList);
		
		// model
		//List<WeatherHistory> WeatherHistoryList = weatherBO.getWeatherHistoryList();
		//WeatherHistoryList.add(weatherHistory);
		
		//model.addAttribute("WeatherHistory", WeatherHistoryList);
		
		
		// view 응답값
		
		return "lesson05/afterAddWeather";
	}
}
