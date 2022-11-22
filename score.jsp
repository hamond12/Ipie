<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet">
<title>score</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>멘토 점수 조회</h1>
	<table border="1">
		<tr>
			<th>채점번호</th>
			<th>참가번호</th>
			<th>참가자명</th>
			<th>생년월일</th>
			<th>점수</th>
			<th>평점</th>
			<th>멘토명</th>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			try{
				Connection con = Util.getConnection();
				Statement stmt = con.createStatement();
				String sql="select po.serial_no, ar.artist_id, ar.artist_name, ar.birth, po.score, po.score, me.mento_name "+
				"from TBL_ARTIST_201905 ar, TBL_MENTO_201905 me, TBL_POINT_201905 po "+
				"where ar.artist_id = po.artist_id and me.mento_id=po.mento_id" +
				"";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					String birth = rs.getString(4);
					String birthday = birth.substring(0,4)+"년"+birth.substring(4,6)+"월"+birth.substring(6,8)+"일";
					int score = rs.getInt(6);
					String grade;
					if(score>=90) grade="A";
					else if(score>=80) grade="B";
					else if(score>=70) grade="C";
					else if(score>=60) grade="D";
					else grade="F";
		%>
					<tr>
						<td style="text-align:center;"><%=rs.getString(1) %></td>
						<td style="text-align:center;"><%=rs.getString(2) %></td>
						<td style="text-align:center;"><%=rs.getString(3) %></td>
						<td style="text-align:center;"><%=birthday %></td>
						<td style="text-align:center;"><%=rs.getString(5) %></td>
						<td style="text-align:center;"><%=grade %></td>
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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>