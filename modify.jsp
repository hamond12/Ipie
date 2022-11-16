<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>교과목 수정</h1>
	<form method="post" action="action.jsp" name="frm2">
	<input type="hidden" name="mode" value="modify">
	<table border="1" style="width:70%;">
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = "";
		String credit = "";
		String lecturer = "";
		String week = "";
		String start_hour = "";
		String end_hour = "";
		try{
			Connection con = Util.getConnection();
			String sql = "select * from course_tbl where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			name = rs.getString(2);
			credit = rs.getString(3);
			lecturer = rs.getString(4);
			week = rs.getString(5);
			start_hour = rs.getString(6);
			while(start_hour.length()<4){
				start_hour = "0" + start_hour;
			}
			end_hour = rs.getString(7);
			while(end_hour.length()<4){
				end_hour = "0" + end_hour;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
	<tr>
		<th>과목 코드</th>
		<td><input type="text" name="id" style="width:98%;" value="<%=id %>"/></td>
	</tr>
	<tr>
		<th>과목명</th>
		<td><input type="text" name="name" style="width:98%;" value="<%=name %>"/></td>
	</tr>
	<tr>
		<th>학점</th>
		<td><input type="text" name="credit" style="width:98%;" value="<%=credit %>"/></td>
	</tr>
	<tr>
		<th>담당강사</th>
		<td><select name="lecturer" style="width:100%; font-size:15px;">
			<option value="" >담당 강사</option>
			<option value="1" <% if(lecturer.equals("1")) out.println("selected");%>>김교수</option>
			<option value="2" <% if(lecturer.equals("2")) out.println("selected");%>>이교수</option>
			<option value="3" <% if(lecturer.equals("3")) out.println("selected");%>>박교수</option>
			<option value="4" <% if(lecturer.equals("4")) out.println("selected");%>>우교수</option>
			<option value="5" <% if(lecturer.equals("5")) out.println("selected");%>>최교수</option>
			<option value="6" <% if(lecturer.equals("6")) out.println("selected");%>>임교수</option>
		</select></td>
	</tr>
	<tr>
		<th>요일</th>
		<td style="text-align:center">
			<input type="radio" name="week" value="1" <% if(lecturer.equals("1")) out.println("checked");%>/> 월
			<input type="radio" name="week" value="2" <% if(lecturer.equals("2")) out.println("checked");%>/> 화
			<input type="radio" name="week" value="3" <% if(lecturer.equals("3")) out.println("checked");%>/> 수
			<input type="radio" name="week" value="4" <% if(lecturer.equals("4")) out.println("checked");%>/> 목
			<input type="radio" name="week" value="5" <% if(lecturer.equals("5")) out.println("checked");%>/> 금
		</td>
	</tr>
	<tr>
		<th>시작 시간</th>
		<td><input type="text" name="start_hour" style="width:98%;" value="<%=start_hour %>"/></td>
	</tr>
	<tr>
		<th>종료 시간</th>
		<td><input type="text" name="end_hour" style="width:98%;" value="<%=end_hour %>"/></td>
	</tr>
	<tr>
	<td colspan="2" style="text-align:center">
	<input type="submit" value="수정" onclick="modify()" style="width:50px;">
	<input type="button" value="취소" onclick="reset()" style="width:50px;">
	</tr>
	</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>