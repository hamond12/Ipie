<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h1>회원매출조회</h1>
<table border=1>
<tr>
	<th style="width:40%">회원번호</th>
	<th style="width:30%">회원성명</th>
	<th style="width:30%">고객등급</th>
	<th style="width:30%">매출</th>
</tr>
<%
request.setCharacterEncoding("UTF-8");
String grade="";
try{
	Connection con = Util.getConnection();
	Statement stmt = con.createStatement();
	String sql = "select me.custno, me.custname, me.grade, sum(mo.price) as price " +
				 "from member_tbl_02 me, money_tbl_02 mo " +
				 "where me.custno=mo.custno " +
				 "group by me.custno, me.custname, me.grade " +
				 "order by price desc"; 
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		grade = rs.getString("grade");
		switch(grade){
		case "A":
			grade="VIP";
			break;
		case "B":
			grade="일반";
			break;
		case "C":
			grade="직원";
			break;
		}
		%>
		<tr>
			<td style="text-align:center"><%=rs.getString("custno") %></td>
			<td style="text-align:center"><%=rs.getString("custname") %></td>
			<td style="text-align:center"><%=grade %></td>
			<td style="text-align:center"><%=rs.getString("price") %></td>
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