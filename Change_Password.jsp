<%@include file="keeplogin.jsp" %>
<html>
<head>
	<%@include file="checklogin.jsp" %>
    <%
	String pro="select first,last,email,profile from users where email='"+session.getAttribute("email")+"';";
	ResultSet rs = st.executeQuery(pro);
	String first="",last="",email="",mobile="",gen="",profile="";
	if(rs.next())
	{
		first=rs.getString("first");
		last=rs.getString("last");
		email=rs.getString("email");
		profile=rs.getString("profile");
	}
	%>
    
    <title>Profile - <% out.print(email+""); %></title>
    <link href="css/css_main.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/css_edit.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
</head>

<body>
<%@include file="Header.jsp" %>

<div class="form_div" id="signup_form">
<form action="pass_process.jsp" method="post" onSubmit="return pass()">

   	<img src="images/default_profile.png" id="pass_profile" alt="Profile"/>

    <table>
    <tr>
    <td><h2 style="margin:-10px 0px 0px;"><% out.print(first+" "+last); %></h2></td>
    </tr>
    
    <tr>
    <td><p style="margin:0px 0px 10px;"><% out.print(email); %></p></td>
    </tr>
    
    <tr>
    <td><input type="password" name="opass" id="opass" placeholder="Old Password"/></td>
    </tr>
    
    <tr>
    <td><input type="password" name="npass" id="npass" placeholder="New Password"/></td>
    </tr>
    
    <tr>
    <td><input type="password" name="rpass" id="rpass" placeholder="Retype Password"/></td>
    </tr>

    <tr>
    <td colspan="2">
    <button class="button" type="submit">Save</button>
    </td>
    </tr>
    
    </table>	

</form>
</div>

<%@include file="Footer.jsp" %>
</body>
</html>