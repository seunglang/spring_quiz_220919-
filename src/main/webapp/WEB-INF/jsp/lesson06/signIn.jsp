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

<link rel="stylesheet" type="text/css"
	href="/css/lesson06/marondalSignIn.css">
</head>
<body>
	<div id="wrap">
		<header class="d-flex align-items-center p-4">
			<h2>Marondalgram</h2>
		</header>
		<h2 id="signUp" class="d-flex align-items-center font-weight-bold">로그인</h2>
		<section class="contents">
			<div>
				<div class="d-flex justify-content-center align-items-center input-group pt-5">
					<div class="input-group-append">
						<span class="input-group-text">℃</span>
					</div>
					<input type="text" class="form-control col-4" name="temperatures">
				</div>
			</div>
			<div class="mt-2">
				<div
					class="d-flex justify-content-center align-items-center input-group">
					<div class="input-group-append">
						<span class="input-group-text">℃</span>
					</div>
					<input type="text" class="form-control col-4" name="temperatures">
				</div>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<button type="button" class="btn btn-dark mr-2 btnSignUp">회원가입</button>
				<button type="button" class="btn btn-primary ml-2 btnSignIn">로그인</button>
			</div>
		</section>
	</div>
</body>
</html>