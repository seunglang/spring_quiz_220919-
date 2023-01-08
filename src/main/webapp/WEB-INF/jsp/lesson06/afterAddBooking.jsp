<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<%-- AJAX를 사용할때는 jquery가 원본이어야 한다. --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="/css/lesson06/style_afterBooking.css">
</head>
<body>
	<div id="wrap">
		<header class="d-flex align-items-center justify-content-center">
			<div class="display-4 logo-hover">
				<a href="http://localhost:8080/lesson06/quiz03/booking_website_view"
					class="logo-attr">통나무 펜션</a>
			</div>
		</header>
		<nav id="item">
			<ul class="nav nav-fill w-100">
				<li class="nav-item"><a href="" class="nav-link font-attr">펜션소개</a></li>
				<li class="nav-item"><a href="" class="nav-link font-attr">객실보기</a></li>
				<li class="nav-item"><a href="http://localhost:8080/lesson06/quiz03/add_booking_view" class="nav-link font-attr">예약하기</a></li>
				<li class="nav-item"><a href="http://localhost:8080/lesson06/quiz03/booking_list" class="nav-link font-attr">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents">
			<article class="top mt-4 d-flex justify-content-center">
				<h2 class="font-weight-bold">예약 목록 보기</h2>
			</article>
			<article class="bottom">
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="item">
						<tr>
							<td>${item.name}</td>
							<td>
								<fmt:formatDate value="${item.date}" pattern="yyyy년 M월 d일" />
							</td>
							<td>${item.day}</td>
							<td>${item.headcount}</td>
							<td>${item.phoneNumber}</td>
							<td>
								<c:choose>
									<c:when test="${item.state eq '대기중'}"> 
										<span class="text-primary">${item.state}</span>
									</c:when>
									<c:when test="${item.state eq '확정'}">
										<span class="text-success">${item.state}</span>
									</c:when>
								</c:choose>
							</td>
							<td><button type="button" class="btn btn-danger del-btn" data-booking-id="${item.id}">삭제</button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</article>
		</section>
		<footer>
			<small class="d-block text-secondary">제주특별자치도 제주시 애월읍</small> <small
				class="d-block text-secondary mt-1">사업자등록번호:111-22-255222/농어촌민박사업자지정/대표:김통목</small>
			<small class="d-block text-secondary mt-1">Copyright 2025
				tongnamu. All right reserved</small>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			$('.del-btn').on('click', function() {
				//alert("테스트"); 
				let id = $(this).data('booking-id');
				
				$.ajax({
					// request
					type:"delete"
					, url:"/lesson06/quiz03/delete_booking"
					, data:{"id":id}
					
					// response
					, success:function(data) { // 응답값으로 dictionary가 내려온다.
						if (data.code == 1) {
							// 1이 넘어오면 성공이다.
							document.location.reload(true); // 새로고침
						} else if (data.code == 500) {
							// 500이 넘어오면 실패
							alert(data.error_message);
						}
					}
					, error:function (e) {
						alert("에러" + e);
					}	
				});
			});
		});
	</script>
</body>
</html>