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


<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson06/style_booking.css">

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
				<li class="nav-item"><a href="#" class="nav-link font-attr">펜션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link font-attr">객실보기</a></li>
				<li class="nav-item"><a href="#" class="nav-link font-attr">예약하기</a></li>
				<li class="nav-item"><a href="http://localhost:8080/lesson06/quiz03/booking_list" class="nav-link font-attr">예약목록</a></li>
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
					<input type="text" class="form-control mb-2" id="date">
				</div>
				<div>
					<div class="mb-2">숙박일수</div>
					<input type="text" class="form-control mb-2" id="day">
				</div>
				<div>
					<div class="mb-2">숙박인원</div>
					<input type="text" class="form-control mb-2" id="headcount">
				</div>
				<div>
					<div class="mb-2">전화번호</div>
					<input type="text" class="form-control mb-2" id="phoneNumber">
				</div>
				<button type="button" id="bookingBtn"
					class="btn btn-warning form-control mt-3">예약하기</button>
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
			
			$.datepicker.setDefaults({
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] // 요일을 한글로 변경
				, dateFormat : 'yy-mm-dd'
			});
			
			// 오늘 날짜 이동 함수
			$.datepicker._gotoToday = function(date) {
                 $(date).datepicker('setDate', new Date()).datepicker('hide').blur();
            };
            
            $('#date').datepicker({
                showButtonPanel: true // 오늘 버튼 노출
                , minDate:0 // 오늘과 그 이후만 선택 가능
                , changeMonth: true
                , changeYear: true
                //, beforeShowDay: disableSomeDay // 날짜 제한
            });
            
            //var disableSomeDay = getDate;
            var state = "대기중";
            
			$('#bookingBtn').on('click', function() {
				//let state = "예약중";
	            var name = $('#name').val().trim();
	            var date = $('#date').val().trim();
	            var day = $('#day').val().trim();
	            var headcount = $('#headcount').val().trim();
	            var phoneNumber = $('#phoneNumber').val().trim();

				if (name == "") {
					alert("이름을 입력해주세요");
					return;
				}
				if (day >= 14) {
					alert("2주 이상 숙박은 제한됩니다.");
					return;
				} else if (day.length <= 0) {
					alert("숙박일수를 입력해주세요");
					return;
				}
				if (headcount > 6) {
					alert("숙박인원은 6명까지 가능합니다. 인원 추가 원하면 전화주세요");
					return;
				} else if (headcount.length <= 0) {
					alert("숙박인원을 입력해주세요");
					return;
				}
				if (phoneNumber.startsWith('010') == false) {
					alert("번호 형식 지켜서 입력 바랍니다.");
					return;
				}
				
				$.ajax({
					// request
					type:"POST"
					, url:"/lesson06/quiz03/add_booking"
					, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber, "state":state}
				
					// response
					, success:function(data) {
						if (data.result == '성공') {
							alert("예약 되었습니다.");
							location.href = "/lesson06/quiz03/booking_list";
						}
					}
					, error:function(e) {
						alert("예약 실패하였습니다.");
						alert("에러" + e);
					}
				});
				

			});
			
			// ajax 두개를 만들어서
			// 한개는 데이터 보내서 db에 저장하고
			// 한개는 db에 값을 불러와서 선택한 날짜 중복 확인과 숙박 날짜를 더해줘서 날짜 중복이 되지 않게끔 해줘야 한다.
			
			
		});
	</script>
</body>
</html>