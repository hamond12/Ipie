<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lecturer</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
	<h1>강사조회</h1>
	<table border="1">
		<tr>
			<th style="width:120px;">강사코드</th>
			<th style="width:90px;">강사명</th>
			<th style="width:90px;">강의명</th>
			<th style="width:100px;">수강료</th>
			<th style="width:200px;">강사자격취득일</th>
		</tr>
	<%
	try{
		Connection con = Util.getConnection();
		Statement stmt = con.createStatement();
		String sql="select * from tbl_teacher_202201";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String price = rs.getString(4);
			String l_price = "₩"+price;
			String date = rs.getString(5);
			String l_date = date.substring(0,4)+"년"+date.substring(4,6)+"월"+date.substring(6,8)+"일";
	%>
		<tr>
			<td style="text-align:center;"><%=rs.getString(1) %></td>
			<td style="text-align:center;"><%=rs.getString(2) %></td>
			<td style="text-align:center;"><%=rs.getString(3) %></td>
			<td style="text-align:center;"><%=l_price %></td>
			<td style="text-align:center;"><%=l_date %></td>
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
<jsp:include page="footer.jsp"/>
</body>
</html>