<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연동 확인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" type="text/css" href="/css/lesson05/style.css">
</head>
<body>
	<div id="wrap">
		<section class="contents d-flex pt-3">
			<article class="col-2 bg-color pl-0 pr-0">
				<jsp:include page="menu.jsp" />
			</article>
			<article class="col-10">
				<h2 class="pt-4 pl-4">과거 날씨</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${WeatherHistory}" var="weather">
						<tr>
							<td>
								<fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 d일" />
							</td>
							<td>
								<c:choose>
									<c:when test="${weather.weather eq '맑음'}">
										<img src="/img/lesson05/sunny.jpg" alt="날씨">
									</c:when>
									<c:when test="${weather.weather eq '구름조금'}">
										<img src="/img/lesson05/partlyCloudy.jpg" alt="날씨">
									</c:when>
									<c:when test="${weather.weather eq '흐림'}">
										<img src="/img/lesson05/cloudy.jpg" alt="날씨">
									</c:when>
									<c:when test="${weather.weather eq '비'}">
										<img src="/img/lesson05/rainy.jpg" alt="날씨">
									</c:when>
									<c:otherwise>
										${weather.weather}
									</c:otherwise>
								</c:choose>
							</td>
							<td>${weather.temperatures}℃</td>
							<td>${weather.precipitation}mm</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}km/h</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</article>
		</section>
		<footer>
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
	
	<!-- <script> 데이트 피커로 사용하는 방법 - 제이쿼리 슬림버전 빼주고 datepicker 구문 추가해주자
					파라미터를 추가주소칸에 다 받아줘야 함
		$(document).ready(function({
			$('input[name=date]').datepicker({
				dateFormat: "yy-mm-dd"
			});
		});
	</script> -->
</body>
</html>