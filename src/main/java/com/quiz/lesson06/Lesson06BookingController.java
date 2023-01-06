package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson06")
@Controller
public class Lesson06BookingController {

	// http://localhost:8080/lesson06/quiz03/booking_website_view
	@GetMapping("/quiz03/booking_website_view")
	public String quiz03() {
		return "lesson06/bookingWebsite";
	}
}
