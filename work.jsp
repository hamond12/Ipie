<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>work</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>부서근무일수집계</h1>
	<table border="1">
	<tr>
		<th>사원번호</th>
		<th>이름</th>
		<th>부서명</th>
		<th>근무일수</th>
	</tr>
	<%
	
	try{
		Connection con = Util.getConnection();
		Statement stmt = con.createStatement();
		String sql="select E.Empno, Empname, Deptcode, count(Resvno) from TBL_EMP_202108 E, TBL_RESV_202108 R where E.Empno=R.Empno group by E.Empno, Empname, Deptcode order by Deptcode ASC";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			int deptno=rs.getInt(3);
			String Deptno;
			if(deptno==10) Deptno="영업팀";
			else if(deptno==20) Deptno="총무팀";
			else Deptno="구매팀";
	%>	
		<tr>
			<td style="text-align:center"><%=rs.getString(1) %></td>
			<td style="text-align:center"><%=rs.getString(2) %></td>
			<td style="text-align:center"><%=Deptno %></td>
			<td style="text-align:center"><%=rs.getString(4) %></td>
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
