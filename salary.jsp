<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<section>
    <h1>회원목록조회/수정</h1><br>
    <table border=1>
    	<tr>
    		<th id="padding">회원번호</th>
    		<th id="padding">회원성명</th>
    		<th id="padding">고객등급</th>
    		<th id="padding">매출</th>
    	</tr>
    	<%
    	try{
    		Connection con = Util.getConnection();
    		Statement stmt = con.createStatement();
    		String sql="select ME.custno, ME.custname, ME.grade, sum(MO.price) "+
    		"from member_tbl_02 ME, money_tbl_02 MO "+
    		"where ME.custno=MO.custno "+
    		"group by ME.custno, ME.custname, ME.grade "+
    		"order by sum(MO.price) DESC";
    		ResultSet rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			String grade=rs.getString(3);
    			if(grade.equals("A")) grade="VIP";
    			else if(grade.equals("B")) grade="일반";
    			else if(grade.equals("C")) grade="직원";
    	%>
    		<tr>
    			<td style="text-align:center;"><%=rs.getString(1) %></td>
    			<td style="text-align:center;"><%=rs.getString(2) %></td>
    			<td style="text-align:center;"><%=grade %></td>
    			<td style="text-align:center;"><%=rs.getString(4) %></td>
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
<jsp:include page="footer.jsp" />
</body>
</html>
