<%
boolean checklogin=false;
if(session.getAttribute("email")==null)
{
	response.sendRedirect("Register.jsp?msg=needtologin");
	checklogin=true;
}

%>