<%@include file="config.jsp" %>
<%
	String email = session.getAttribute("email").toString();
	String opass = request.getParameter("opass");
	String npass = request.getParameter("npass");
	
	if(npass==null || opass==null)
	{
		response.sendRedirect("PNF.html");
	}
	else
	{
		String check = "select password from users where email='"+email+"';";
		ResultSet rs = st.executeQuery(check);
		if(rs.next())
		{
			String realpass=rs.getString("password");
			if(realpass.equals(opass))
			{
				String update = "update users set password='"+npass+"' where email='"+email+"';";

				out.print(update);
				st.executeUpdate(update);
				response.sendRedirect("Profile.jsp");
			}
			else
			{
				response.sendRedirect("Change_Password.jsp?msg=wrong");
			}
		}
		else
		{
			response.sendRedirect("Change_Password.jsp?msg=nodata");
		}
	}//else not null
%>