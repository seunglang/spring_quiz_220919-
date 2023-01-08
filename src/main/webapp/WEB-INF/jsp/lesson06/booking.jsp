<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기 페이지</title>
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
	href="/css/lesson06/style_booking.css">
</head>
<body>
	<div id="wrap">
		<header class="d-flex align-items-center justify-content-center">
			<div class="display-4 logo-hover"><a href="http://localhost:8080/lesson06/quiz03/booking_website_view" class="logo-attr">통나무 펜션</a></div>
		</header>
		<nav id="item">
			<ul class="nav nav-fill w-100">
				<li class="nav-item"><a href="" class="nav-link font-attr">펜션소개</a></li>
				<li class="nav-item"><a href="" class="nav-link font-attr">객실보기</a></li>
				<li class="nav-item"><a href="" class="nav-link font-attr">예약하기</a></li>
				<li class="nav-item"><a href="" class="nav-link font-attr">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents">
			<article class="top mt-4 d-flex justify-content-center">
				<h2 class="font-weight-bold">예약하기</h2>
			</article>
			<article class="bottom">
				<div>
					<div class="mb-2">이름</div>
					<input type="text" class="form-control mb-2" id="name">
				</div>
				<div>
					<div class="mb-2">예약날짜</div>
					<input type="text" class="form-control mb-2" id="bookingDate">
				</div>
				<div>
					<div class="mb-2">숙박일수</div>
					<input type="text" class="form-control mb-2" id="howLongStay">
				</div>
				<div>
					<div class="mb-2">숙박인원</div>
					<input type="text" class="form-control mb-2" id="howManyPeople">
				</div>
				<div>
					<div class="mb-2">전화번호</div>
					<input type="text" class="form-control mb-2" id="phoneNumber">
				</div>
				<button type="button" id="bookingBtn" class="btn btn-warning form-control mt-3">예약하기</button>
			</article>
		</section>
		<footer>
			<small class="d-block text-secondary">제주특별자치도 제주시 애월읍</small> <small
				class="d-block text-secondary mt-1">사업자등록번호:111-22-255222/농어촌민박사업자지정/대표:김통목</small>
			<small class="d-block text-secondary mt-1">Copyright 2025
				tongnamu. All right reserved</small>
		</footer>
	</div>
</body>
</html>