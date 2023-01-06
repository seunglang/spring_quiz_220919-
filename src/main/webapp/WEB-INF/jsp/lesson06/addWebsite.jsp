<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹사이트 추가하기</title>
	<%-- AJAX를 사용할때는 jquery가 원본이어야 한다. --%>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<label for="name">제목</label>
		<input type="text" id="name" class="form-control" name="name">
		<label for="url">주소</label>
		<div class="d-flex">
			<input type="text" id="url" class="form-control" name="url">
			<button type="button" id="checkExistUrlBtn" class="btn btn-primary ml-3">중복확인</button>
		</div>
		<small id="nameStatusArea"></small>
		<!-- <small id="duplicationText" class="text-danger d-none">중복된 url입니다.</small> -->
		<!-- <small id="avaliableText" class="text-success d-none">저장 가능한 url입니다.</small>
		숨겨놨다가 중복확인 후에 제이쿼리를 이용해서 처리
		 -->
		<input type="button" id="join" value="추가" class="btn btn-success form-control mt-3">
	</div>
	
	<script>
		$(document).ready(function(){
			
			$('#checkExistUrlBtn').on('click', function() {
				let url = $('#url').val().trim();
				$('#nameStatusArea').empty();
				//alert('sdf');
				
				if(url == '') {
					alert("주소를 입력하세요");
				}
				if (url.startsWith('http') == false && url.startsWith('https') == false) {
					alert("주소 형식을 제대로 입력해주세요");
					return;
				}
				
				$.ajax({
					//request
					type:"post"
					, url:"/lesson06/quiz02/is_duplication"
					, data: {"url":url}
					
					//response
					, success:function(data) {
						alert(data.is_duplication);
						if (data.is_duplication) {
							$('#nameStatusArea').append('<span class="text-danger">중복된 url입니다.</span>');
						} else {
							$('#nameStatusArea').append('<span class="text-danger">저장 가능한 url입니다.</span>');
						}
						
						<%-- 다른 예제의 예시 --%>
						<%--if (data.is_duplication) {
							// 중복
							$('#avaliableText').addClass("d-none");
							$('#duplicationText').removeClass("d-none");
						} else{
							// 사용가능한 url
							$('#duplicationText').addClass("d-none");
							$('#avaliableText').removeClass("d-none");
						}--%>
						
					}
					, error:function(e){
						alert("실패" + e);
					}
					
				});
			});
			
			$('#join').on('click', function(){
				let name = $('#name').val().trim();
				let url = $('#url').val().trim();
				if (name.length < 1) {
					alert("이름을 입력하세요");
					return;
				}
				// url.startsWith("https://") == false || 
				// http로 시작하지도 않고, https로도 시작하지 않으면 alert
				if (url.startsWith('http') == false && url.startsWith('https') == false) {
					alert("주소 형식을 제대로 입력해주세요");
					return;
				}
				//if (url.startsWith("www") == false) {
					//alert("주소 형식을 제대로 입력해주세요 ex)www... or https://...");
					//return;
				//}
				console.log(name);
				console.log(url);
				
				// ajax 통신 시작
				$.ajax({
					// request
					type:"POST" // 키명은 대소문자 구분 해줘야 하고, 값은 상관없다.
					, url:"/lesson06/quiz01/add_website"
					, data:{"name":name, "url":url}
				
					// response
					// 응답을 받으면 응답값을 받아야 하고 파라미터는 data로 받아오는게 좋다. data는 그냥 변수 이름이다.
					, success:function(data) { // String json => object로 다 바꿔준다.
						//alert(data);
						if (data.result == '성공') { //data 후에 .을 붙이면 그 안에 있는 값이 나온다.
							location.href = "/lesson06/quiz01/after_add_website_view";
						}
					}
					, error:function(e) {
						alert("에러" + e);
					}
				});
				
			});
		
		});
	</script>
</body>
</html>