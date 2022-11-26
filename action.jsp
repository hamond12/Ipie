<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DBPKG.Util" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String regist_month = request.getParameter("regist_month");
	String c_no = request.getParameter("c_no");
	String class_area = request.getParameter("class_area");
	String tution = request.getParameter("tution");
	String teacher_code = request.getParameter("teacher_code");
	
	try{
		Connection con = Util.getConnection();
		String sql = "insert into tbl_class_202201 values(?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, regist_month);
		pstmt.setString(2, c_no);
		pstmt.setString(3, class_area);
		pstmt.setInt(4, Integer.parseInt(tution));
		pstmt.setString(5, teacher_code);
		
		pstmt.executeUpdate();
%>
	<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>