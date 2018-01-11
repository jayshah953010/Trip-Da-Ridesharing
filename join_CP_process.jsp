<%@include file="checklogin.jsp" %>
<%@include file="config.jsp" %>
<%
	String id = request.getParameter("id");
	
	if(id==null)
	{
		response.sendRedirect("PNF.html");
	}
	else if(checklogin)
	{
	}
	else
	{
		String creator="select uid from `pool` where cpid="+id+";";
		ResultSet rs=st.executeQuery(creator);
		rs.next();
		if(rs.getString("uid").equals(session.getAttribute("email")))
		{
		response.sendRedirect("PNF.html");
		}
		else
		{
			String check="select * from `join` where joiner='"+session.getAttribute("email")+"' and cpid="+id+";";
			rs=st.executeQuery(check);
			if(rs.next())
			{
			response.sendRedirect("index.jsp?msg=exist");		
			}
			else
			{
				String ins = "insert into `join` (joiner,cpid,type) values('"+session.getAttribute("email")+"',"+id+","+0+");";
				out.print(ins);
				st.executeUpdate(ins);
				response.sendRedirect("index.jsp?msg=joined");
			}
		}
	}
%>