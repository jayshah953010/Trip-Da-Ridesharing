<%@include file="keeplogin.jsp" %>
<html>
<head>
    <title>Tripda - Search</title>
    <link href="css/css_main.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/css_search.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="js/js.js"></script>
</head>

<body>
<%@include file="Header.jsp" %>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

<div class="margin_head" style="height:30px;"></div>
<div id="search">
    <form action="Search.jsp" method="post">
    <input id="searchTextField" name="from" type="text" placeholder="From">
	<input id="searchTextField1" name="to" type="text" placeholder="To">
    <button class="button_r">Search</button>
    </form>
</div>

<script>initialize();</script>
<%
String from=request.getParameter("from");
String to=request.getParameter("to");
%>

<div id="result">
<h1><p>Result From</p> <%=from%> <p>To</p> <%=to%></h1>

<%
String search="select * from pool where source like '%"+from+"%' or dest like '%"+to+"%';";
ResultSet rs = st.executeQuery(search);
ResultSet rs2;
while(rs.next())
{
	String user="select * from users where email='"+rs.getString("uid")+"';";
	rs2=st2.executeQuery(user);
	if(rs2.next())
	{
	String buttons="";	
	if(rs.getString("uid").equals(session.getAttribute("email")))
	{
		buttons=""+
		"<a href='Edit_CP.jsp?id="+rs.getInt("cpid")+"' class='button_c'>Edit Carpool</a>"+
		"<a href='Del_CP.jsp?id="+rs.getInt("cpid")+"' class='button_c' style='margin-left:2%;'>Delete Carpool</a>"+
		"<a href='Map.jsp?from="+rs.getString("source")+"&to="+rs.getString("dest")+"' class='button_c' style='float:right;'>View On Map</a>";
	}
	else
	{
		String join="select type from `join` where joiner='"+session.getAttribute("email")+"' and cpid="+rs.getInt("cpid")+";";
		Statement st3 = con.createStatement();
		ResultSet rs3=st3.executeQuery(join);
		if(rs3.next())
		{
			if(rs3.getInt("type")==0)
				join="<a href='#' class='button_c' style='margin-left:2%'>Requested</a>";
			else if(rs3.getInt("type")==1)
				join="<a href='#' class='button_c' style='margin-left:2%'>Joined</a>";
			else
				join="";
		}
		else
		{
			join="<a href='join_CP_process.jsp?id="+rs.getInt("cpid")+"' class='button_c' style='margin-left:2%;'>Join Carpool</a>";
		}
		
		buttons=""+
		"<a href='User_Profile.jsp?email="+rs.getString("uid")+"' class='button_c'>Profile</a>"+
		join+
		"<a href='Map.jsp?from="+rs.getString("source")+"&to="+rs.getString("dest")+"' class='button_c' style='float:right;'>View On Map</a>";
	}

	String print=""+
	"<div class='cp_detail'>"+
	"<div class='detail'>"+
		"<img src='images/default_profile.png' style='float:left;' width='80px' height='80px'>"+
		"<div class='profile'>"+
			"<a>"+rs2.getString("first")+" "+rs2.getString("last")+"</a>"+
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
	buttons+
	"</div>"+
	"</div>";
	out.print(print);
	}
}

%>
</div>

<div class="margin_head"></div>
<%@include file="Footer_ex.jsp" %>
</body>
</html>