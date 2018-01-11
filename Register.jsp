<%@include file="config.jsp" %>
<%
if(session.getAttribute("email")!=null)
{
	response.sendRedirect("PNF.html");
}
%>
<html>
<head>
	<title>Tripda - Login or Signup</title>
    <link href="css/css_main.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/css_reg.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
</head>

<body>
<%@include file="Header.jsp" %>

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
%>
<div class="form_div" id="login_form">
<h1>Login</h1>
<h3>Login To See Your Profile</h3>
<form action="login_process.jsp" method="post" onSubmit="return login()">
    <table>
	<tr>
    <td><input type="email" name="email" id="lemail" placeholder="Email" value="<%=email_ck%>"/></td>
    </tr>
    
    <tr>
    <td><a><input type="checkbox" name="keep" value="y" style="width:auto;"> Keep Me Logged In</a></td>
    </tr>
    
    <tr>
    <td><input type="password" name="pass" id="lpass" placeholder="Password"/></td>
    </tr>
    
    <tr>
    <td><a href="Need.jsp">Need Help???</a></td>
    </tr>
    
    <tr>
    <td colspan="2"><button class="button" type="submit">Login</button></td>
    </tr>
    
    </table>
</form>
</div>


<div class="form_div" id="signup_form">
<h1>Sign Up</h1>
<h3>It's free and always will be.</h3>
<form action="reg_process.jsp" method="post" onSubmit="return sign_up()">
    <table>
    <tr>
    <td>
    <input type="text" name="first" id="first" class="half" placeholder="First Name"/>
    <input type="text" name="last" id="last" class="half2" placeholder="Last Name"/>
    </td>
    </tr>

	<tr>
    <td><input type="email" name="email" id="email" placeholder="Email"/></td>
    </tr>
    
    <tr>
    <td><input type="password" name="pass" id="pass" placeholder="Password"/></td>
    </tr>
    
    <tr>
    <td><input type="password" name="rpass" id="rpass" placeholder="Retype Password"/></td>
    </tr>
    
    <tr>
    <td><input type="text" name="mobile" id="mobile" placeholder="Mobile Number"/></td>
    </tr>
    
    <tr>
    <td>
    <div><input type="radio" name="gender" value="m" checked>Male</div>
    <div><input type="radio" name="gender" value="f">Female</div>
    </td>
    </tr>

    <tr>
    <td colspan="2"><button class="button" type="submit">Sign Up</button></td>
    </tr>
    
    </table>
    
    <div id="profile_div">
        <div id="prodiv">
        <img id="proimg" src="images/default_profile.png" alt="Profile">
        <input type="file" name="profile" id="proinput" onChange="Profile(event)" accept="image/*">
        </div>
        <p class="protext">Profile Photo</p>
        <a class="protext" id="remove" style="color:#F00; font-size:16px; display:none;" onClick="remove_profile()">&times;[Remove]&times;</a>
    </div>
	
</form>
</div>

<%@include file="Footer.jsp" %>


</body>
</html>