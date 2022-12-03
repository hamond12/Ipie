<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="style.css" rel="stylesheet">
<script src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>좌석예약조회</h1>
	<form method="post" action="action.jsp" name="frm2"  >
	<input type="hidden" name="mode" value="list">
	<table border="1">
		<tr>
			<td>사원번호를 입력 하시오.</td>
			<td><input type="text" name="Empno"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="button" value="좌석예약조회" onclick="search()">
				<input type="button" value="홈으로" onclick="window.location = 'index.jsp'">
			</td>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>