<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>

<style type="text/css">
.my_button {
	width: 10%;
	padding: 7px;
	border: none;
	border-radius: 5px;
	color: #F2C2CB;
	background-color: #9cb395;
	cursor: pointer;
	outline: none;
}
</style>

</head>
<body>

	<%
	//로그인 검사하기
	if (session.getAttribute("mid") == null) {
		response.sendRedirect("./login");
	}
	%>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
			<div class="main">
			<div class="mainStyle">
			<div>
				<article>
					<h1>마이페이지</h1>
					${myInfo.mname }/ ${myInfo.mid }/
					<div>
						<form action="./myInfo" method="post" onsubmit="return check()">
							<input type="password" name="newPW" id="newPW" placeholder="변경할 암호를 입력하세요">
							<button type="submit" class=my_button>수정하기</button>
						</form>
					</div>
					<!-- 2024-01-23 -->
				</article>
				<article>
				<h2>방문흔적찾아가기</h2>
					<table>
						<thead>
						<tr>
							<td>글제목</td>
							<td>읽은 날짜</td>
						</tr>
						</thead>
						<tbody>
							<c:forEach items="${readData }" var="d">
						<tr>
						 <td onclick="location.href='./detail?no=${d.board_no}'">${d.board_title }</td>
						 <td>
						 <fmt:parseDate value="${d.vdate }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                       	 <fmt:formatDate value="${date }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
						 </td>						 
						</tr>	
						</c:forEach>
						</tbody>
					</table>
				</article>
			</div>
		</div>
		<footer>
			<c:import url="footer.jsp" />
		</footer>
	</div>
	<script type="text/javascript">
		function check() {
			//var pw = document.getElementById("newPW");
			//let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/
			var pw = document.querySelector("#newPW");
			if(pw.value.length < 5){
				alert("암호는 5글자 이상이어야 합니다.");
				return false;				
			}
		}
	</script>
</body>
</html>


