<%@include file="checklogin.jsp" %>
<%@include file="config.jsp" %>
<%
	String cpid = request.getParameter("id");
	
	if(cpid==null)
	{
		response.sendRedirect("PNF.html");
	}
	else
	{
		String del = "delete from pool where uid='"+session.getAttribute("email")+"' and cpid="+cpid+";";
		st.executeUpdate(del);
		response.sendRedirect("Profile.jsp?msg=deleted");
	}
%>