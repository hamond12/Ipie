<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>후보조회</h1>
	<table border="1">
	<tr>
		<th>후보번호</th>
		<th>성명</th>
		<th>총투표건수</th>
	</tr>
	<%
	try{
		Connection con = Util.getConnection();
		Statement stmt = con.createStatement();
		String sql = "select M.m_no, M.m_name, count(*) as v_total " + 
		"from tbl_member_202005 M, tbl_vote_202005 V " +
		"where M.m_no = V.m_no and V.v_confirm = 'Y' " +
		"group by M.m_no, M.m_name " +
		"order by v_total desc";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
	%>
		<tr>
			<td style="text-align:center"><%=rs.getString(1) %></td>
			<td style="text-align:center"><%=rs.getString(2) %></td>
			<td style="text-align:center"><%=rs.getString(3) %></td>
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