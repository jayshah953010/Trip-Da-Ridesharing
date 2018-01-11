<%@ page import="java.util.Random.*" %>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("email")==null)
{	
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String keep = request.getParameter("keep");
	if(keep==null)
		keep="n";

	Cookie cok = new Cookie("email",email);
	cok.setMaxAge(3600);
	response.addCookie(cok);

	String check = "select password from users where email='"+email+"';";
	ResultSet rs = st.executeQuery(check);
	if(rs.next())
	{
		String realpass=rs.getString("password");
		if(realpass.equals(pass))
		{
			session.setAttribute("email",email);
			if(keep.equals("y"))
			{
				Random R=new Random();
				String pin=R.nextInt(99999999)+"";
				Cookie ck= new Cookie("login",pin);
				ck.setMaxAge(3600);
				response.addCookie(ck);

				String login="UPDATE users SET login='"+pin+"';";
				st.executeUpdate(login);
			}
			response.sendRedirect("Profile.jsp?keep="+keep+"");
		}
		else
		{
			response.sendRedirect("Register.jsp?msg=pass");
		}
	}
	else
	{
		response.sendRedirect("Register.jsp?msg=email");
	}
}//if not login
else
{
	session.removeAttribute("email");
	String login="UPDATE users SET login='0';";
	st.executeUpdate(login);

	Cookie ck=new Cookie("login","0");
	ck.setMaxAge(0);
	response.addCookie(ck);

	response.sendRedirect("Register.jsp?msg=logout");
}
%>