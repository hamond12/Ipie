<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>교과목 목록</h1>
	<table border=1>
	<tr>
		<th>과목코드</th>
		<th>과목명</th>
		<th>학점</th>
		<th>담당강사</th>
		<th>요일</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>삭제</th>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	
	try{
		Connection con = Util.getConnection();
		String sql = 
				"select id, co.name, credit, le.name, week, start_hour, end_hour " +
				"from course_tbl co, lecturer_tbl le " +
				"where co.lecturer = le.idx order by id" ;
				
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String week = rs.getString(5);
			switch(week){
			case "1":
				week="월요일";
				break;
			case "2":
				week="화요일";
				break;
			case "3":
				week="수요일";
				break;
			case "4":
				week="목요일";
				break;
			case "5":
				week="금요일";
				break;
			}
			String start_hour = rs.getString(6);
			while(start_hour.length()<4){
				start_hour = "0" + start_hour;
			}
			String start = start_hour.substring(0,2) + "시" + start_hour.substring(2,4) + "분";
			String end_hour = rs.getString(7);
			while(end_hour.length()<4){
				end_hour = "0" + end_hour;
			}
			String end = end_hour.substring(0,2) + "시" + end_hour.substring(2,4) + "분";
	%>	
		<tr>
			<td style="text-align:center;"><a href="modify.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
			<td style="text-align:center;"><%=rs.getString(2) %></td>
			<td style="text-align:center;"><%=rs.getInt(3) %></td>
			<td style="text-align:center;"><%=rs.getString(4) %></td>
			<td style="text-align:center; width:10%;"><%=week %></td>
			<td style="text-align:center; width:10%;"><%=start %></td>
			<td style="text-align:center; width:10%;"><%=end %></td>
			<td style="text-align:center;"><a href="action.jsp?id=<%=rs.getString(1)%>&mode=delete">삭제</a></td>
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