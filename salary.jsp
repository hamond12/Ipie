<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet">
<title>salary</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
	<h1>강사매출현황</h1>
	<table style="width:400px">
	<tr>
		<th>강사코드</th>
		<th>강의명</th>
		<th>강사명</th>
		<th>총매출</th>
	</tr>
	<%
		request.setCharacterEncoding("UTF-8");
		try{
			Connection con = Util.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select T.teacher_code, T.class_name, T.teacher_name, sum(C.tution) as price "+
			"from tbl_teacher_202201 T, tbl_class_202201 C "+
			"where T.teacher_code = C.teacher_code "+
			"group by T.teacher_code, T.class_name, T.teacher_name "+
			"order by T.teacher_code";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()){
				String price = rs.getString(4);
				String Price = "₩"+price; 	
	%>
			<tr>
				<td style="text-align:center"><%=rs.getString(1) %></td>
				<td style="text-align:center"><%=rs.getString(2) %></td>
				<td style="text-align:right"><%=rs.getString(3) %></td>
				<td style="text-align:right"><%=Price %></td>
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
<jsp:include page="header.jsp"/>
</body>
</html>