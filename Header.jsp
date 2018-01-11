<div id="logo_line">
<a href="index.jsp" id="logo"><img src="images/Logo2.PNG" width="inherit" height="inherit"/></a>
<%
if(session.getAttribute("email")==null)
{
out.print("<a href='Register.jsp' class='button2'>Login | Signup</a>");
}
else
{
out.print("<a href='login_process.jsp' class='button2'>Logout</a>");
out.print("<a href='Profile.jsp'><img src='images/default_profile.png' id='profile'/></a>");
out.print("<a class='button2' style=' padding:7px 10px 8px;' onclick='notify()' on>=</a>");
out.print("<a href='Create.jsp' class='button2'>Create Carpool</a>");
}
%>
<div id="notify">
<img src="images/arrow.png" id="arrow">
<div id="list">
	<div class="note" id="head">Notification</div>
<%
String cp="select * from pool where uid='"+session.getAttribute("email")+"';";
ResultSet rsh=st.executeQuery(cp);
while(rsh.next())
{	
	String invite="select * from `join` where cpid="+rsh.getInt("cpid")+";";
	ResultSet rsh2=st2.executeQuery(invite);
	if(rsh2.next())
	{
		String userinfo="select first,last from users where email='"+rsh2.getString("joiner")+"'";
		Statement st3 = con.createStatement();
		ResultSet rsh3=st3.executeQuery(userinfo);
		if(rsh3.next())
		{
			String list="";
			if(rsh2.getInt("type")==0)
			{
				list=""+
				"<div class='note'>"+
				"<p class='head'>"+rsh3.getString("first")+" "+rsh3.getString("last")+" want to join your carpool</p>"+
				"<p>From : "+rsh.getString("source")+"</p>"+
				"<p>To : "+rsh.getString("dest")+"</p>"+
				"<a href='accept_process.jsp?work=a&id="+rsh2.getInt("jid")+"' style='clear:both;'>Accept</a>"+
				"<a href='accept_process.jsp?work=d&id="+rsh2.getInt("jid")+"'>Decline</a>"+
				"</div>";
			}
			else if(rsh2.getInt("type")==1)
			{
				list=""+
				"<div class='note'>"+
				"<p class='head'>"+rsh3.getString("first")+" "+rsh3.getString("last")+" joined your carpool</p>"+
				"<p>From : "+rsh.getString("source")+"</p>"+
				"<p>To : "+rsh.getString("dest")+"</p>"+
				"</div>";
			}
			out.print(list);
		}
	}
}
String joiner="select * from `join` where joiner='"+session.getAttribute("email")+"';";
rsh=st.executeQuery(joiner);
while(rsh.next())
{
	if(rsh.getInt("type")==1)
	{

		String userinfo="select * from users where email in (select uid from pool where cpid="+rsh.getInt("cpid")+");";
		ResultSet rsh2=st2.executeQuery(userinfo);
		String list="";
		if(rsh2.next())
		{
			list=""+
			"<div class='note'>"+
			"<p class='head'>"+rsh2.getString("first")+" "+rsh2.getString("last")+" accepted your carpool</p>"+
			"</div>";
		 	out.print(list);
		}
	}
}
%>	
	
    <div class="note" style="text-align:center; color:#18BD9D; border-bottom:0px;">No More Notification</div>

</div>
</div>
</div>
<div class="margin_head"></div>
