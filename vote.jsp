<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vote</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>투표검수조회</h1>
	<table border="1">
	<tr>
		<th>성명</th>
		<th>생년월일</th>
		<th>나이</th>
		<th>성별</th>
		<th>후보번호</th>
		<th>투표시간</th>
		<th>유권자확인</th>
	</tr>
	<%
	try{
		Connection con = Util.getConnection();
		Statement stmt = con.createStatement();
		String sql = "select * from tbl_vote_202005";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String birth = rs.getString(1);
			String Birth = "19"+birth.substring(0,2)+"년"+birth.substring(4,6)+"월"+birth.substring(6,8)+"일생";
			Integer age = 2020-Integer.parseInt(Birth.substring(0,4));
			String Age="만 "+Integer.toString(age)+"세";
			String gender = rs.getString(1).substring(6,7);
			if(gender.equals("1")) gender="남";
			else gender="여";
			String check = rs.getString(6);
			if(check.equals("Y")) check="확인";
			else check = "미확인";
			String time = rs.getString(4);
			String Time = time.substring(0,2)+":"+time.substring(2,4);
	%>
		<tr>
			<td style="text-align:center"><%=rs.getString(2) %></td>
			<td style="text-align:center"><%=Birth %></td>
			<td style="text-align:center"><%=Age %></td>
			<td style="text-align:center"><%=gender %></td>
			<td style="text-align:center"><%=rs.getString(3) %></td>
			<td style="text-align:center"><%=Time %></td>
			<td style="text-align:center"><%=check %></td>
		</tr>
	<%	
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>	
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>