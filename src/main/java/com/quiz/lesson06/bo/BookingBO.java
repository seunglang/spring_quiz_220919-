package com.quiz.lesson06.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	// 예약목록 호출
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	// db 데이터 저장
	public void addBooking(String name, String date, int day, int headcount, String phoneNumber, String state) {
		bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, state);
	}
	
	// 예약 조회 확인 구문
	public boolean existBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		return bookingDAO.existBookingByNameAndPhoneNumber(name, phoneNumber);
	}
	
	// 예약 조회 확인 데이터 가져오기
	public List<Booking> getExistBookingList(String name, String phoneNumber) {
		return bookingDAO.selectExistBookingList(name, phoneNumber);
	}
	
	// 쿼리로 가져오기 선생님 예제 - 위 메소드와 관련있음 (컨트롤러6 예약조회 함수 내부에 있음. 참고하기)
	public Booking getLatestBookingNameAndPhoneNumber(String name, String phoneNumber) {
		return bookingDAO.selectLatestBookingNameAndPhoneNumber(name, phoneNumber);
	}
	
	// 행 삭제 구문
	public int deleteBookingRowById(int id) {
		return bookingDAO.deleteBookingRowById(id);
	}
}
