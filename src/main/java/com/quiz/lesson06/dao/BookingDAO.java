package com.quiz.lesson06.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	// 예약 목록 호출
	public List<Booking> selectBookingList();
	
	// 행 삭제 구문
	public int deleteBookingRowById(int id);
	
	// 예약 조회 확인
	public boolean existBookingByNameAndPhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
	
	// 예약 조회 확인한 데이터 가져오기
	public List<Booking> selectExistBookingList(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
	
	// db 데이터 저장
	public void insertBooking(
			@Param("name") String name,
			@Param("date") String date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber,
			@Param("state") String state);
}
