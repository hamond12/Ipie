<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet">
<title>rank</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>오디션 참가 신청</h1>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			try{
				Connection con = Util.getConnection();
				Statement stmt = con.createStatement();
				String sql="select ar.artist_id, artist_name, sum(score), TO_CHAR(avg(score),'99.99'), rank() over(order by sum(score) desc) "+
				"from TBL_ARTIST_201905 ar, TBL_POINT_201905 po "+
				"where ar.artist_id = po.artist_id " +
				"group by ar.artist_id, artist_name";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
		%>
					<tr>
						<td style="text-align:center;"><%=rs.getString(1) %></td>
						<td style="text-align:center;"><%=rs.getString(2) %></td>
						<td style="text-align:center;"><%=rs.getString(3) %></td>
						<td style="text-align:center;"><%=rs.getString(4) %></td>
						<td style="text-align:center;"><%=rs.getString(5) %></td>
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