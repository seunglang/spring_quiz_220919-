package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06")
@Controller
public class Lesson06BookingController {
	
	@Autowired
	private BookingBO bookingBO;

	// http://localhost:8080/lesson06/quiz03/booking_website_view
	@GetMapping("/quiz03/booking_website_view")
	public String quiz03() {
		return "lesson06/bookingWebsite";
	}

	// http://localhost:8080/lesson06/quiz03/booking
	@GetMapping("/quiz03/booking")
	public String quiz03_1() {
		return "lesson06/booking";
	}

	// http://localhost:8080/lesson06/quiz03/booking_list
	@GetMapping("/quiz03/booking_list")
	public String afterAddBooking(Model model) {
			
		List<Booking> bookingList = bookingBO.getBookingList();
		
		model.addAttribute("list", bookingList);
		
		return "afterAddBooking";
	}
}
