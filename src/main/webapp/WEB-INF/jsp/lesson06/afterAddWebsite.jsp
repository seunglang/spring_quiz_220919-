<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가된 웹사이트 화면</title>
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
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item" varStatus="status">
					<tr>
						<td id="${item.id}">${item.id}</td>
						<td id="${item.name}">${item.name}</td>
						<td>${item.url}</td>
						<!-- <input type="hidden" value=""> 이런 방식도 있다.-->
						<%-- 1) name속성 + value속성 삭제 --%>
						<%-- <td><button type="button" name="delBtn" class="del-btn btn btn-danger" value="${item.id}">삭제</button></td> --%>
						
						<%-- 2) data를 이용해서 태그에 임시저장하기 --%>
						<td><button type="button" class="del-btn btn btn-danger" data-website-id="${item.id}">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
		$(document).ready(function() {
			//$('button[name=delBtn]').on('click', function(e){
				
				// 1) name속성 + value속성 삭제
				//let id = $(this).val(); 이 방식도 있음
				//let id = $(this).attr('value'); value의 값을 가져오는 방식도 있음
				//let id = e.target.value;
				//alert(id);
				
				<%--$.ajax({
					// request
					type:"get"
					, url:"/lesson06/quiz03/delete"
					, dataType:'json'
					//, data:{"name":name}
				
				
					// response
					, success.function(data) {
						if (data = "삭제 완료") {
							location.href = "/lesson06/quiz01/after_add_website_view"
						}
					}
					, error:function(e) {
						alert("에러" + e);
					}
				});--%>
			//});
			
			// 2) data를 이용해서 태그에 임시저장하기
			// 태그: data-website-id      data- 뒤에 우리가 이름을 정한다.(대문자 절대 안됨)
			// 스크립트: $(this).data('website-id');
			$('.del-btn').on('click', function(){
				let id = $(this).data('website-id');
				//alert(id);
				
				$.ajax({
					//request
					type:"delete"
					, url:"/lesson06/quiz02/delete_website"
					, data:{"id":id}
				
					//response
					, success:function(data) { // 응답값으로 dictionary가 내려옴
						if (data.code == 1) {
							// 성공
							//location.href = // 스크롤이 다시 위로 올라감
							document.location.reload(true); //()비어도 되는데 안될땐 true를 써줘야 함 그래도 안되면 window.location.reload(true); window를 앞에 붙여주자 혹은 document
							// 새로고침
						} else if (data.code == 500) {
							// 실패(에러)
							alert(data.error_message);
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