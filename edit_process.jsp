<%@include file="config.jsp" %>
<%
	String email = session.getAttribute("email").toString();
	String first = request.getParameter("first");
	String last = request.getParameter("last");
	String mobile = request.getParameter("mobile");
	String gender = request.getParameter("gender");
	String profile = request.getParameter("profile");				
	
	out.print(request.getParameter("first")+"f:"+first);
	if(first==null || last==null || mobile==null || gender==null)
	{
		response.sendRedirect("PNF.html");
	}
	else
	{			
		String update = "update users set first='"+first+"' , last='"+last+"' , mobile="+mobile+" , gender='"+gender+"' where email='"+email+"';";
		
		st.executeUpdate(update);
		response.sendRedirect("Profile.jsp");
	}//else not null
%>