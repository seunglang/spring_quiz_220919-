<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson05/style_1.css">
</head>
<body>
	<div id="wrap">
		<section class="contents d-flex pt-3">
			<article class="col-2 bg-primary pl-0 pr-0">
				<jsp:include page="menu.jsp" />
			</article>
			<article class="col-10 bg-danger">
				<h2 class="p-3">날씨 입력</h2>
				<form method="post" action="">
					<div class="d-flex justify-content-between">
						<label for="date">날짜</label> 
							<input type="text" id="date" name="date" class="ml-3 form-control col-3"> 
								<label for="weather">날씨</label>
						    <select name="weather" id="weather" class="form-control col-2">
								<option>맑음</option>
								<option>비</option>
								<option>흐림</option>
								<option>구름조금</option>
							</select> 
							<label for="dust">미세먼지</label> 
							<select name="dust" id="dust" class="form-control col-2">
								<option>좋음</option>
								<option>최악</option>
								<option>보통</option>
								<option>나쁨</option>
							</select>
					</div>
					<div class="d-flex align-items-center justify-content-between mt-5">
						<div class="input-group col-3">
							<label for="temperature">기온</label>
							<input type="text" class="form-control" name="temperature" id="temperature">
							<div class="input-group-append">
								<span class="input-group-text">°C</span>
							</div>
						</div>
					
						<div class="input-group col-3">
							<label for="precipitation">강수량</label>
							<input type="text" class="form-control" name="precipitation" id="precipitation">
							<div class="input-group-append">
								<span class="input-group-text">mm</span>
							</div>
						</div>
						<div class="input-group col-3">
							<label for="windSpeed">풍속</label>
							<input type="text" class="form-control" name="windSpeed" id="windSpeed">
							<div class="input-group-append">
								<span class="input-group-text">km/h</span>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-end mt-3">
						<input type="submit" class="btn btn-success" value="저장">
					</div>
				</form>
			</article>
		</section>
		<footer class="bg-warning">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
</body>
</html>