<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="style.css" rel="stylesheet">
<script src="check.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<section>
	<h1>홈쇼핑 회원</h1>
	<form method="post" action="action.jsp" name="frm">
	<table border=1>
	<%
		String custno="";
		try{
			Connection con = Util.getConnection();
			Statement stmt = con.createStatement();
			String sql="select max(custno)+1 as custno from member_tbl_02";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			custno=rs.getString("custno");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
		<tr>
			<th>회원번호(자동완성)</th>
			<td style="width:50%"><input type="text" name="custno" value="<%=custno %>" style="width:50%" readonly></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" style="width:50%"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" style="width:70%"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" style="width:90%"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" style="width:50%"></td>
		</tr>
		<tr>
			<th>고객등급[A:VIP, B:일반, C:직원]</th>
			<td><input type="text" name="grade" style="width:50%"></td>
		</tr>
		<tr>
			<th>거주도시</th>
			<td><input type="text" name="city" style="width:50%"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" value="등록" onclick="return check()" id="padding2">
			<input type="button" value="조회" onclick="search()" id="padding2"> 
		</tr>	
	</table>
	</form>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>