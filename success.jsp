<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>success</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<%
	request.setCharacterEncoding("UTF-8");
	
	String Empno = request.getParameter("Empno");
%>
	<h1>사원번호: <%=Empno %>님의 좌석예약조회</h1>
	<form>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>근무일자</th>
			<th>좌석번호</th>
			<th>좌석위치</th>
			<th>내선번호</th>
		</tr>
<%
try{
	Connection con = Util.getConnection();
	String sql = "select E.Empno, E.Empname, R.Resvdate, S.Seatno, S.Office, S.Callno "+
	"from TBL_EMP_202108 E, TBL_SEAT_202108 S, TBL_RESV_202108 R "+
	"where S.Seatno = R.Seatno and R.Empno = E.Empno and R.Empno=?";
	PreparedStatement pstmt = con.prepareStatement(sql); 
	pstmt.setString(1, Empno);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		String date = rs.getString(3);
		String Date = date.substring(0,4)+'년'+date.substring(4,6)+'월'+date.substring(6,8)+'일';
%>
	<tr>
		<td style="text-align:center;"><%=rs.getString(1) %></td>
		<td style="text-align:center;"><%=rs.getString(2) %></td>
		<td style="text-align:center;"><%=Date %></td>
		<td style="text-align:center;"><%=rs.getString(4) %></td>
		<td style="text-align:center;"><%=rs.getString(5) %></td>
		<td style="text-align:center;"><%=rs.getString(6) %></td>
	</tr>
<%		
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
	</table>
	</form>
<p style="text-align:center;">
	<input type="button" value="돌아가기" onclick="window.location = 'list.jsp'">
</p>	
</section>
<jsp:include page="header.jsp"></jsp:include>
</body>
</html>