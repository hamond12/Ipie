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
	<h1>회원정보조회</h1>
	<table border="1">
		<tr>
			<th style="width:120px">수강월</th>
			<th style="width:90px">회원번호</th>
			<th style="width:70px">회원명</th>
			<th style="width:70px">강의명</th>
			<th style="width:90px">강의장소</th>
			<th style="width:90px">수강료</th>
			<th style="width:60px">등급</th>
		</tr>
	<%
	try{
		request.setCharacterEncoding("UTF-8");
		
		Connection con = Util.getConnection();
		Statement stmt = con.createStatement();
		String sql="select T.teacher_regist_date, M.c_no, M.c_name, T.class_name, C.class_area, C.tution, M.grade "+
		"from tbl_teacher_202201 T, tbl_member_202201 M, tbl_class_202201 C "+
		"where M.c_no=C.c_no and T.teacher_code=C.teacher_code";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String trd = rs.getString(1);
			String TRD = trd.substring(0,4)+"년"+trd.substring(4,6)+"월";
			String tution = rs.getString(6);
			String Tution = "₩"+tution;
	%>
		<tr>
			<td style="text-align:center;"><%=TRD %></td>
			<td style="text-align:center;"><%=rs.getString(2) %></td>
			<td style="text-align:center;"><%=rs.getString(3) %></td>
			<td style="text-align:center;"><%=rs.getString(4) %></td>
			<td style="text-align:center;"><%=rs.getString(5) %></td>
			<td style="text-align:center;"><%=Tution %></td>
			<td style="text-align:center;"><%=rs.getString(7) %></td>
			
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