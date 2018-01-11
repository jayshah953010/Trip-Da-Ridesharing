<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carpool","root","");
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();
%>