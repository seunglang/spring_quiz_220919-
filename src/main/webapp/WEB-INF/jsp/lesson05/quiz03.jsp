<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz03</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>1. 후보자 득표율</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>기호</th>
					<th>득표 수</th>
					<th>득표 율</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="candidate" items="${candidates}" varStatus="status">
			<fmt:formatNumber var="num" value="${candidate}" type="number" groupingUsed="true"/>
			<fmt:formatNumber var="per" value="${candidate / totalCount}" type="percent"/>
				<tr>
					<td>${status.count}</td>
					<td>${num}</td>
					<td>${per}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>	
	</div>
	
	<div class="container">
		<h1>2. 카드 명세서</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용 날자</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="cardBill" items="${cardBills}">
			<fmt:formatNumber var="won" value="${cardBill.pay}" type="currency" />
			<fmt:parseDate var="convertDate" value="${cardBill.date}" pattern="yyyy-MM-dd" /><%-- 맵에 저장되어있던 패턴 그대로 써주자 --%>
			<fmt:formatDate var="finalDate" value="${convertDate}" pattern="yyyy월 MM월 dd일" />
				<tr>
					<td>${cardBill.store}</td>
					<td>${won}</td>
					<td>${finalDate}</td>
					<td>${cardBill.installment}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>	
	</div>
</body>
</html>