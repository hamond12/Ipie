<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
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
    		<th id="p_phone">전화번호</th>
    		<th id="p_address">주소</th>
    		<th id="padding">가입일자</th>
    		<th id="padding">고객등급</th>
    		<th id="padding">거주지역</th>
    	</tr>
    	<%
    	try{
    		Connection con = Util.getConnection();
    		Statement stmt = con.createStatement();
    		String sql="select * from member_tbl_02";
    		ResultSet rs = stmt.executeQuery(sql);
    		while(rs.next()){
    			String grade=rs.getString("grade");
    			switch(grade){
    			case "A":
    				grade="VIP";
    				break;
    			case "B":
    				grade="일반";
    				break;
    			case "C":
    				grade="직원";
    				break;
    			}
    	%>
    		<tr>
    			<td style="text-align:center"> <a href="modify.jsp?custno=<%=rs.getString("custno") %>"><%=rs.getString("custno") %> </a></td>
    			<td style="text-align:center"><%=rs.getString("custname") %></td>
    			<td style="text-align:center"><%=rs.getString("phone") %></td>
    			<td style="text-align:center"><%=rs.getString("address") %></td>
    			<td style="text-align:center"><%=rs.getDate("joindate") %></td>
    			<td style="text-align:center"><%=grade %></td>
    			<td style="text-align:center"><%=rs.getString("city") %></td>
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
