<%@include file="checklogin.jsp" %>
<%@include file="config.jsp" %>
<%
	String id = request.getParameter("id");
	String source = request.getParameter("source");
	String dest = request.getParameter("dest");
	String num = request.getParameter("num");
	String date = request.getParameter("date");
	String time = request.getParameter("hh")+":"+request.getParameter("mm")+" "+request.getParameter("am");
	
	if(id==null || source==null || dest==null || num==null || date==null || time==null)
	{
		response.sendRedirect("PNF.html");
	}
	else
	{
		String ins = "UPDATE pool SET source='"+source+"' , dest='"+dest+"' ,num="+num+" ,date='"+date+"' ,time='"+time+"' where cpid="+id+";";	
		st.executeUpdate(ins);
		response.sendRedirect("Profile.jsp?msg=saved");
	}
%>