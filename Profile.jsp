<%@include file="keeplogin.jsp" %>
<html>
<head>
	<%@include file="checklogin.jsp" %>
    <%
	String pro="select * from users where email='"+session.getAttribute("email")+"';";
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
	%>
    
    <title>Profile - <% out.print(email+""); %></title>
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
    <a href="Edit_Profile.jsp" class="button">Edit Profile</a>
    <a href="Change_Password.jsp" class="button" style="margin-left:20px;">Change Password</a>
    </div>
</div>

<div id="latest">
<h1>Latest Carpool</h1>

<%
String clear="";
String pool="select * from pool where uid='"+session.getAttribute("email")+"';";
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
	"<a href='Edit_CP.jsp?id="+rs.getInt("cpid")+"' class='button_c'>Edit Carpool</a>"+
	"<a href='Del_CP.jsp?id="+rs.getInt("cpid")+"' class='button_c' style='margin-left:2%;'>Delete Carpool</a>"+
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