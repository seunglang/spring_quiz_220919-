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
		<label for="title">제목</label>
		<input type="text" id="name" class="form-control" name="name">
		<label for="url">주소</label>
		<input type="text" id="url" class="form-control" name="url">
		<input type="button" id="join" value="추가" class="btn btn-success form-control mt-3">
	</div>
	
	<script>
		$(document).ready(function(){
			$('#join').on('click', function(){
				let name = $('#name').val().trim();
				let url = $('#url').val().trim();
				if (name.length < 1) {
					alert("이름을 입력하세요");
					return;
				}
				// url.startsWith("https://") == false || url.startsWith("www") == false
				if (url.length < 1) {
					alert("주소 형식을 제대로 입력해주세요");
					return;
				}
				console.log(name);
				console.log(url);
				
				// ajax 통신 시작
				$.ajax({
					// request
					type:"POST"
					, url:"/lesson06/quiz01/add_website"
					, data:{"name":name, "url":url}
				
					// response
					// 응답을 받으면 응답값을 받아야 하고 파라미터는 data로 받아오는게 좋다. data는 그냥 변수 이름이다.
					, success:function(data) {
						alert(data);
						location.href = "/lesson06/quiz01/after_add_website_view";
					}
					, error:function(e) {
						alert("에러");
					}
				});
			});
		});
	</script>
</body>
</html>