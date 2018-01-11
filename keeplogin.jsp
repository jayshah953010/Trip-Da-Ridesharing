<%@include file="config.jsp" %>
<%
String email_ck = "";
Cookie[] ck = request.getCookies();		
for(int i=0; i<ck.length; i++)
{
	if(ck[i].getName().equals("email"))
	{
		email_ck = ck[i].getValue();
		break;
	}
}

String check = "select login from users where email='"+email_ck+"';";
ResultSet rs_ex = st.executeQuery(check);
if(rs_ex.next())
{
	String pin=rs_ex.getString("login");
	for(int i=0; i<ck.length; i++)
	{
		if(ck[i].getName().equals("login"))
		{
			if( pin.equals(ck[i].getValue()) )
			{
				session.setAttribute("email",email_ck);
			}
			break;
		}
	}	
}
%>