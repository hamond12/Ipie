<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="style.css" rel="stylesheet">
<script src="check.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<section>
	<h1>홈쇼핑 회원 정보 수정</h1>
	<form method="post" action="action.jsp" name="frm2">
	<input type="hidden" name="mode" value="modify">
	<table border=1>
	<%
		String custno=request.getParameter("custno");
		try{
			Connection con = Util.getConnection();
			String sql="select * from member_tbl_02 where custno=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,custno);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
	%>
		<tr>
			<th>회원번호(자동완성)</th>
			<td style="width:50%"><input type="text" name="custno" value="<%=rs.getString(1)%>" readonly style="width:50%"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" value="<%=rs.getString(2)%>" style="width:50%"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" value="<%=rs.getString(3)%>" style="width:70%"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" value="<%=rs.getString(4)%> "style="width:90%"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" value="<%=rs.getDate(5)%>" style="width:50%"></td>
		</tr>
		<tr>
			<th>고객등급[A:VIP, B:일반, C:직원]</th>
			<td><input type="text" name="grade" value="<%=rs.getString(6)%>" style="width:50%"></td>
		</tr>
		<tr>
			<th>거주도시</th>
			<td><input type="text" name="city" value="<%=rs.getString(7)%>" style="width:50%"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" value="수정" onclick="modify()" id="padding2">
			<input type="button" value="조회" onclick="search()" id="padding2"> 
		</tr>	
	<%
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
		
	</table>
	</form>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>