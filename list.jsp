<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet">
<title>list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>참가자 목록 조회</h1>
	<table border=1>
		<tr>
			<th>참가번호</th>
			<th>참가자명</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>특기</th>
			<th>소속사</th>
		</tr>
		<%
		try{
			Connection con = Util.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from TBL_ARTIST_201905";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				String GENDER = rs.getString(4);
				if(GENDER.equals("F")) GENDER="여자";
				else GENDER="남자";
				
				String TALENT = rs.getString(5);
				if(TALENT.equals("1")) TALENT="보컬";
				else if(TALENT.equals("2")) TALENT="댄스";
				else TALENT="랩";
					
				String BIRTH = rs.getString("BIRTH");
				String BIRTHDAY = BIRTH.substring(0,4)+"년"+BIRTH.substring(4,6)+"월"+BIRTH.substring(6,8)+"일";
		%>
			<tr>
				<td style="text-align:center;"><%=rs.getString(1) %></td>
				<td style="text-align:center;"><%=rs.getString(2) %></td>
				<td style="text-align:center;"><%=BIRTHDAY %></td>
				<td style="text-align:center;"><%=GENDER %></td>
				<td style="text-align:center;"><%=TALENT %></td>
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
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>