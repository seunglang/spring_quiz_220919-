<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<link rel="stylesheet" type="text/css" href="/css/lesson06/marondal.css">
</head>
<body>
	<div id="wrap">
		<header class="d-flex align-items-center p-4">
			<h2>Marondalgram</h2>
		</header>
		<h2 id="signUp" class="d-flex align-items-center font-weight-bold">회원 가입</h2>
		<section class="contents">
			<div class="p-3">ID</div>
			<input type="text" id="userId" class="form-control col-7 ml-3 inline-block" placeholder="ID를 입력해주세요">
			<button type="button" class="btn btn-primary ml-3 btn-check btn-sm">중복확인</button>
			<small class="d-none"></small>
			<div class="password-group">
				<div class="pl-3 pt-3 pb-2">password</div>
				<input type="password" id="password" class="form-control col-5 ml-3">
			</div>
			<div class="passwordCheck-group">
				<div class="pl-3 pb-2">confirm password</div>
				<input type="password" id="checkPassword" class="form-control col-5 ml-3">
			</div>
			<div class="name-group">
				<div class="pl-3 pb-2 pt-2">이름</div>
				<input type="text" id="userName" class="form-control col-7 ml-3">
			</div>
			<div class="email-group">
				<div class="pl-3 pb-2 pt-2">이메일</div>
				<input type="text" id="userEmail" class="form-control col-7 ml-3">
			</div>
			<div class="d-flex justify-content-center mt-2">
				<button id="btnSignUp" class="btn btn-primary">가입하기</button>
			</div>
		</section>
	</div>
</body>
</html>