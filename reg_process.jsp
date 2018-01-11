<%@include file="config.jsp" %>
<%
	String email = request.getParameter("email");
	String first = request.getParameter("first");
	String last = request.getParameter("last");
	String pass = request.getParameter("pass");
	String mobile = request.getParameter("mobile");
	String gender = request.getParameter("gender");
	String profile = request.getParameter("profile");				
	
	
		out.print("::"+email+"::"+pass+"::"+mobile+"::"+gender);	
	if(email==null || pass==null || mobile==null || gender==null)
	{
	//	response.sendRedirect("PNF.html");
	}
	else
	{
		out.print("::"+profile);
		String check = "select COUNT(email) from users where email='"+email+"';";
		ResultSet rs = st.executeQuery(check);
		
		int row=0;
		if(rs.next())
		{
			String str=rs.getString("COUNT(email)");
			row=Integer.parseInt(str);
		}
		if(row==0)
		{
			String ins = "insert into users (first,last,email,password,mobile,gender,type,profile,login) values('"+first+"','"+last+"','"+email+"','"+pass+"',"+mobile+",'"+gender+"','u','jpg','0');";
			
			st.executeUpdate(ins);
			response.sendRedirect("Register.jsp?msg=success");
		}
		else
		{
			response.sendRedirect("Register.jsp?msg=exist");	
		}
	}
	//else not null
%>