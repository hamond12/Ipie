<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String mode=request.getParameter("mode");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

try{
	Connection con = Util.getConnection();
	String sql="";
	switch(mode){
	case "insert":
		sql="insert into member_tbl_02 values(?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		
		pstmt.executeUpdate();
%>
<jsp:forward page="join.jsp"></jsp:forward>
<%
		break;

	case "modify":
		sql="update member_tbl_02 set custname=?, phone=?, address=?, joindate=to_date(?,'yyyy-mm-dd'),grade=?,city=? where custno=?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		
		pstmt.executeUpdate();
%>
<jsp:forward page="list.jsp"></jsp:forward>
<%
		break;
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>
