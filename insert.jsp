<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>교과목 추가</h1>
	<form method="post" action="action.jsp" name="frm">
	<input type="hidden" name="mode" value="insert">
	<table border="1" style="width:70%;">
	<tr>
		<th>과목 코드</th>
		<td><input type="text" name="id" style="width:98%;"/></td>
	</tr>
	<tr>
		<th>과목명</th>
		<td><input type="text" name="name" style="width:98%;"/></td>
	</tr>
	<tr>
		<th>학점</th>
		<td><input type="text" name="credit" style="width:98%;"/></td>
	</tr>
	<tr>
		<th>담당강사</th>
		<td><select name="lecturer" style="width:100%; font-size:15px;">
			<option value="" >담당강사선택</option>
			<option value="1">김교수</option>
			<option value="2">이교수</option>
			<option value="3">박교수</option>
			<option value="4">우교수</option>
			<option value="5">최교수</option>
			<option value="6">임교수</option>
		</select></td>
	</tr>
	<tr>
		<th>요일</th>
		<td style="text-align:center">
			<input type="radio" name="week" value="1"/> 월
			<input type="radio" name="week" value="2"/> 화
			<input type="radio" name="week" value="3"/> 수
			<input type="radio" name="week" value="4"/> 목
			<input type="radio" name="week" value="5"/> 금
		</td>
	</tr>
	<tr>
		<th>시작 시간</th>
		<td><input type="text" name="start_hour" style="width:98%;"/></td>
	</tr>
	<tr>
		<th>종료 시간</th>
		<td><input type="text" name="end_hour" style="width:98%;"/></td>
	</tr>
	<tr>
	<td colspan="2" style="text-align:center">
	<input type="button" value="추가" onclick="return check()" style="width:50px;">
	<input type="button" value="목록" onclick="search()" style="width:50px;">
	</tr>
	</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>