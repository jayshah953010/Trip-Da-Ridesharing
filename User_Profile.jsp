<%@include file="keeplogin.jsp" %>
<html>
<head>
    <%
	String usermail=request.getParameter("email");
	if(usermail==null)
	{
		response.sendRedirect("PNF.html");
	}
	else if(usermail.equals(session.getAttribute("email")))
	{
		response.sendRedirect("Profile.jsp");
	}
	String pro="select * from users where email='"+usermail+"';";
	ResultSet rs = st.executeQuery(pro);
	String first="",last="",email="",mobile="",gen="",profile="";
	if(rs.next())
	{
		first=rs.getString("first");
		last=rs.getString("last");
		email=rs.getString("email");
		mobile=rs.getString("mobile");
		gen=rs.getString("gender");
		profile=rs.getString("profile");
	}
	else
	{
		response.sendRedirect("PNF.html");
	}
	%>
    
    <title>Profile - <% out.print(first+" "+last); %></title>
    <link href="css/css_main.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/css_profile.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
</head>

<body>
<%@include file="Header.jsp" %>

<div id="info_div">
    <img src="images/default_profile.png" id="profile" />
    <div id="txt_info">
    <h2><% out.print(first+" "+last);  %></h2>
    <p><% out.print(email);  %></p>
    <p><% out.print("Contact : "+mobile);  %></p>
    <p>Gender : <% if(gen.equals("m")) { out.print("Male"); } else { out.print("Female"); }  %></p>
    </div>
</div>

<div id="latest">
<h1>Carpool</h1>

<%
String clear="";
String pool="select * from pool where uid='"+email+"';";
rs = st.executeQuery(pool);
while(rs.next())
{
	String print=""+
	"<div class='cp_detail' "+clear+">"+
	"<div class='detail'>"+
		"<img src='images/default_profile.png' style='float:left;' width='80px' height='80px'>"+
		"<div class='profile'>"+
			"<a>"+first+" "+last+"</a>"+
			"<p>"+rs.getString("source")+"</p>"+
			"<p>To , "+rs.getString("dest")+"</p>"+
		"</div>"+
		"<div class='time'>"+
			"<p>Need : "+rs.getString("num")+"</p>"+
			"<p>"+rs.getString("time")+"</p>"+
			"<p>"+rs.getString("date")+"</p>"+
		"</div>"+
	"</div>"+
	"<div style='clear:both;'>"+
	"<a href='User_Profile.jsp?email="+rs.getString("uid")+"' class='button_c'>Profile</a>"+
	"<a href='Join_CP.jsp?id="+rs.getInt("cpid")+"' class='button_c' style='margin-left:2%;'>Join Carpool</a>"+
	"<a href='Map.jsp?from="+rs.getString("source")+"&to="+rs.getString("dest")+"' class='button_c' style='float:right;'>View On Map</a>"+
	"</div>"+
	"</div>";
	out.print(print);
}

%>
</div>

<div class="margin_head"></div>
<%@include file="Footer.jsp" %>
</body>
</html>