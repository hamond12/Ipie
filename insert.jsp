<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link href="style.css" rel="stylesheet">
<script src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>근무좌석예약</h1>
	<form method="post" action="action.jsp" name="frm">
	<table border="1">
		<tr>
			<td>예약번호</td>
			<td><input type="text" name="Resvno">예) 2021001</td>
		</tr>
		<tr>
			<td>사원번호</td>
			<td><input type="text" name="Empno">예) 1001</td>
		</tr>
		<tr>
			<td>근무일자</td>
			<td><input type="text" name="Resvdate">예) 20211231</td>
		</tr>
		<tr>
			<td>좌석번호</td>
			<td><input type="text" name="Seatno">예) S001 ~ S009</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="button" value="등록" onclick="return check()">
				<input type="button" value="다시쓰기" onclick="res()">
			</td>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>