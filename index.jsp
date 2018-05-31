<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="test.DbManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MySql Database</title>
</head>
<body>
<table>
<%
DbManager db = new DbManager();
java.sql.Connection conn = db.getConnection();
if(conn == null)
{
	out.print("Connection not established");
}else
{
	out.print("Connection Established");
	String query="select * from equipment";
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next())
	{

	%>
	    <tr><td><%=rs.getInt("equip_id") %></td></tr>
	    <tr><td><%=rs.getString("type") %></td></tr>
	    <tr><td><%=rs.getDate("install_date") %></td></tr> 
	 <%}
}
        %>
</table>
</body>
</html>