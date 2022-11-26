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
<jsp:include page="header.jsp"/>
<section>
	<h1>수강신청</h1>
	<form method="post" name="frm" action="action.jsp">
	<table border="1">
		<tr>
			<th style="width:140px">수강월</th>
			<td><input type="text" name="regist_month" maxlength="6"> 2022년03월 예)202203</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td><select name="c_name" onchange="change1();">
			<option value="">회원명</option>
			<option value="10001">홍길동</option>
			<option value="10002">장발장</option>
			<option value="10003">임꺽정</option>
			<option value="20001">성춘향</option>
			<option value="20002">이몽룡</option>
			</select></td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="c_no" readonly> 예)10001</td>
		</tr>
		<tr>
			<th>강의장소</th>
			<td><select name="class_area" >
			<option value="">강의장소</option>
			<option value="10001">서울본원</option>
			<option value="10002">성남본원</option>
			<option value="10003">대전본원</option>
			<option value="20001">부산본원</option>
			<option value="20002">대구본원</option>
			</select></td>
		</tr>
		<tr>
			<th>강의명</th>
			<td><select name="class_name" onchange="change2();">
			<option value="">강의신청</option>
			<option value="100">초급반</option>
			<option value="200">중급반</option>
			<option value="300">고급반</option>
			<option value="400">심화반</option>
			</select></td>
		</tr>
		<tr>
			<th>수강료</th>
			<td><input type="text" name="tution" readonly> 원</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
				<button type="button" onclick="return check();">수강신청</button>
				<button type="button" onclick="res();">다시쓰기</button>
			</td>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>