package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06")
@Controller
public class Lesson06BookingController {

	@Autowired
	private BookingBO bookingBO;

	// 메인 화면 뷰
	// http://localhost:8080/lesson06/quiz03/booking_website_view
	@GetMapping("/quiz03/booking_website_view")
	public String quiz03() {
		return "lesson06/bookingWebsite";
	}

	// 주소 추가 뷰
	// http://localhost:8080/lesson06/quiz03/add_booking_view
	@GetMapping("/quiz03/add_booking_view")
	public String addBooking() {

		return "lesson06/booking";
	}

	// db에 주소 추가 기능 실행
	@ResponseBody // 어떤 값을 리턴하면 리턴되는 값 통째로 responseBody에 들어간다
	@PostMapping("/quiz03/add_booking")
	public Map<String, Object> addBooking(@RequestParam("name") String name, @RequestParam("date") String date,
			@RequestParam("day") int day, @RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("state") String state, Model model) {
		

		// db insert
		bookingBO.addBooking(name, date, day, headcount, phoneNumber, state);
		
		// date 가져와서 예약된 날짜인지 확인하는 
		List<Booking> bookingList = bookingBO.getBookingList();

//		List<String> getDate = new ArrayList<>();
//		for (int i = 0; i < bookingList.size(); i++) {
//			getDate.add(bookingList.get(i).getDate());
//		}
		

		// 성공 값 응답값
		Map<String, Object> result = new HashMap<>();
		result.put("result", "성공");
		//result.put("getdate", getDate);

		return result; // jackson => JSON String(잭슨 라이브러리가 잭슨으로 변환됨)
	}

	// 예약 목록 출력
	// http://localhost:8080/lesson06/quiz03/booking_list
	@GetMapping("/quiz03/booking_list")
	public String afterAddBooking(Model model) {

		List<Booking> bookingList = bookingBO.getBookingList();

		model.addAttribute("list", bookingList);

		return "lesson06/afterAddBooking";
	}

	// 예약 조회
	// http://localhost:8080/lesson06/quiz03/is_duplication
	@ResponseBody
	@PostMapping("/quiz03/is_duplication")
	public Map<String, Object> isDuplication(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {

		Map<String, Object> checkExist = new HashMap<>();
		checkExist.put("is_duplication", bookingBO.existBookingByNameAndPhoneNumber(name, phoneNumber));
		
		
		List<Booking> bookingList = bookingBO.getExistBookingList(name, phoneNumber);
		
		
		checkExist.put("Name", bookingList.get(0).getName());
		checkExist.put("Date", bookingList.get(0).getDate());
		checkExist.put("Day", bookingList.get(0).getDay());
		checkExist.put("HeadCount", bookingList.get(0).getHeadcount());
		checkExist.put("State", bookingList.get(0).getState());
		
		
//		model.addAttribute("Name", bookingList.get(0).equals(name)); 
//		model.addAttribute("Date", bookingList.get("date")); 
//		model.addAttribute("Headcount", bookingList.get("Headcount")); 
//		model.addAttribute("Day", bookingList.get("day")); 
//		model.addAttribute("State", bookingList.get("state")); 
		
		return checkExist;

	}

	// 행 삭제 api
	@ResponseBody
	@DeleteMapping("/quiz03/delete_booking")
	public Map<String, Object> deleteBookingById(@RequestParam("id") int id) {
		Map<String, Object> deleteBooking = new HashMap<>();

		// db delete
		int deletedRow = bookingBO.deleteBookingRowById(id);

		if (deletedRow > 0) {
			deleteBooking.put("code", 1); // 1번이면 성공
			deleteBooking.put("result", "성공");
		} else {
			deleteBooking.put("code", 500); // 500번이면 실패
			// deleteBooking.put("result", "실패");
			deleteBooking.put("error_message", "삭제된 행이 없습니다."); // 500번이면 실패
		}

		return deleteBooking;
	}

}
