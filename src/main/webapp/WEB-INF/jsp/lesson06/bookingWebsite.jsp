<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 마지막 문제</title>
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

<link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">
</head>
<body>
	<div id="wrap">
		<header class="d-flex align-items-center justify-content-center">
			<div class="display-4 logo-hover"><a href="http://localhost:8080/lesson06/quiz03/booking_website_view" class="logo-attr">통나무 펜션</a></div>
		</header>
		<nav id="item">
			<ul class="nav nav-fill w-100">
				<li class="nav-item"><a href="#" class="nav-link font-attr">펜션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link font-attr">객실보기</a></li>
				<li class="nav-item"><a href="http://localhost:8080/lesson06/quiz03/add_booking_view" class="nav-link font-attr">예약하기</a></li>
				<li class="nav-item"><a href="http://localhost:8080/lesson06/quiz03/booking_list" class="nav-link font-attr">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents">
			<article class="top">
				<img src="/img/lesson06/test06_banner1.jpg" id="img"
					alt="mainBanner" height="455px" width="1200px">
			</article>
			<article class="banner">
				<div class="d-flex">
					<div
						class="d-flex align-items-center justify-content-center booking1 col-4">
						<div>
							<div class="display-4 font-color-white">실시간</div>
							<div class="display-4 font-color-white">예약하기</div>
						</div>
					</div>
					<div class="booking2 col-4">
						<h4 class="p-3 font-color-white">예약 확인</h4>
						<!-- 수정 요망 -->
						<div class="groupingMem mr-4">
                            <div class="d-flex align-items-center justify-content-center">
                                 <label class="mr-4">이름 :</label>
                                 <input type="text" id="name" class="ml-3 form-control col-8 text-size">
                            </div>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                 <div class="mr-3">전화번호 :</div>
                                 <input type="text" id="phoneNumber" class="mr-2 form-control col-8 text-size">
                            </div>
                            <div class="d-flex justify-content-end mr-3">
                           <%--  <c:forEach items="${test}" var="t" begin="0" end="1" step="1"> --%>
                                 <button type="button" id="btnSearchMem" data-booking-name="${t.name}" class="form-control mt-3 col-4 btn-success">조회 하기</button>
                          <%--   </c:forEach> --%>
                            </div>
                        </div>
					</div>
					<div
						class="d-flex align-items-center justify-content-center booking3 col-4">
						<div class="mr-4">
							<h4 class="font-color-white">예약문의:</h4>
							<h1 class="font-color-white">010-</h1>
							<h1 class="font-color-white">0000-111</h1>
						</div>
					</div>
				</div>
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
		$(document).ready(
				function() {
					let images = [ '/img/lesson06/test06_banner1.jpg',
							'/img/lesson06/test06_banner2.jpg',
							'/img/lesson06/test06_banner3.jpg',
							'/img/lesson06/test06_banner4.jpg' ];
					let changeEvThreSec = 0;
					// var imgChange = document.getElementById('img');
					setInterval(function() {
						changeEvThreSec++;
						// imgChange.src='test06_banner'+changeEvThreSec+'.jpg';
						$('#img').attr('src', images[changeEvThreSec])
						if (changeEvThreSec >= 3) {
							changeEvThreSec = 0
						}
					}, 3000)
					
					
					$('#btnSearchMem').on('click', function() {
						let name = $('#name').val().trim();
						let phoneNumber = $('#phoneNumber').val().trim();
						//let test = $(this).data('booking-name');
						//let test = $()
						
						if (name.length <= 0) {
							alert("이름을 입력해주세요");
							return;
						}
						if (!phoneNumber.startsWith('010')) {
							alert("번호 형식을 제대로 입력해주세요 ex)010-1111-2222");
						}
						
						$.ajax({
							// request
							type:"POST"
							, url:"/lesson06/quiz03/is_duplication"
							, data: {"name":name, "phoneNumber":phoneNumber}
							
							// response
							, success:function(data) {
								if (data.is_duplication) {
									alert("이름 : " + data.Name + "\n날짜 : " + data.Date.substring(0,10) + "\n일수 : " + data.Day + "\n인원 : " + data.HeadCount + "\n상태 : " + data.State);
								} else {
									alert("예약된 내역이 없습니다.");
								}
							}
						});
						
					});
				});
	</script>
</body>
</html>