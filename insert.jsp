<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link href="style.css" rel="stylesheet">
<script src="check.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h1>투표하기</h1>
<form method="post" action="action.jsp" name="frm">
<table border="1">
	<tr>
		<th>주민번호</th>
		<td><input type="text" name="v_jumin"> 예 : 8906153154726</td>
	</tr>
	<tr>
		<th>성명</th>
		<td><input type="text" name="v_name"></td>
	</tr>
	<tr>
		<th>투표번호</th>
		<td><select name="m_no">
		<option></option>
		<option value="1">김후보</option>
		<option value="2">이후보</option>
		<option value="3">박후보</option>
		<option value="4">조후보</option>
		<option value="5">최후보</option>
		</select></td>
	</tr>
	<tr>
		<th>투표시간</th>
		<td><input type="text" name="v_time"></td>
	</tr>
	<tr>
		<th>투표장소</th>
		<td><input type="text" name="v_area"></td>
	</tr>
	<tr>
		<th>유권자확인</th>
		<td>
			<input type="radio" name="v_confirm" value="Y">확인
			<input type="radio" name="v_confirm" value="N">미확인
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="button" value="투표하기" onclick="return check()">
			<input type="button" value="다시하기" onclick="res()">
		</th>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>