<%@include file="checklogin.jsp" %>
<%@include file="config.jsp" %>
<%
	String work = request.getParameter("work");
	String id = request.getParameter("id");
	
	if(id==null || work==null)
	{
		response.sendRedirect("PNF.html");
	}
	else
	{
		String  update;
		if(work.equals("a"))
		{
			update="UPDATE `join` SET type="+1+" where jid="+id+";";
			String cp="select cpid from `join` where jid="+id+";";	
			ResultSet rs2=st2.executeQuery(cp);
			if(rs2.next())
			{
				String num="UPDATE pool SET num=num-1 where cpid="+rs2.getInt("cpid")+";";
				st.executeUpdate(num);
			}
		}
		else
		{
			update="DELETE from `join` where jid="+id+";";
		}
			
		st.executeUpdate(update);
		response.sendRedirect("Profile.jsp?msg=created");
	}
%>