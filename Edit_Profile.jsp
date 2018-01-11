<%@include file="keeplogin.jsp" %>
<html>
<head>
	<%@include file="checklogin.jsp" %>
    <%
	String pro="select first,last,email,mobile,gender,profile from users where email='"+session.getAttribute("email")+"';";
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
    <link href="css/css_edit.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
</head>

<body>
<%@include file="Header.jsp" %>

<div class="form_div" id="signup_form">
<form action="edit_process.jsp" method="post" onSubmit="return edit()">

    <div id="profile_div">
        <div id="prodiv">
        <img id="proimg" src="images/default_profile.png" alt="Profile">
        <input type="file" name="profile" id="proinput" onChange="Profile(event)" accept="image/*">
        </div>
        <p class="protext">Profile Photo</p>
        <a class="protext" id="remove" style="color:#F00; font-size:16px; display:none;" onClick="remove_profile()">&times;[Remove]&times;</a>
    </div>

    <table>
    <tr>
    <td><h2 style="margin:0px 0px 10px 0px;"><% out.print(email); %></h2></td>
    </tr>
    
    <tr>
    <td>
    <input type="text" name="first" id="first" class="half" value="<% out.print(first); %>" placeholder="First Name"/>
    <input type="text" name="last" id="last" class="half2" value="<% out.print(last); %>" placeholder="Last Name"/>
    </td>
    </tr>
        
    <tr>
    <td><input type="text" name="mobile" id="mobile" value="<% out.print(mobile); %>" placeholder="Mobile Number"/></td>
    </tr>
    
    <tr>
    <td>
    <div><input type="radio" name="gender" value="m" <% if(gen.equals("m")) { out.print("checked"); } %> >Male</div>
    <div><input type="radio" name="gender" value="f" <% if(gen.equals("f")) { out.print("checked"); } %> >Female</div>
    </td>
    </tr>

    <tr>
    <td colspan="2">
    <button class="button" type="submit">Save</button>
    <a href="Change_Password.jsp" class="button" style="margin-left:20px;">Change Password</a>
    </td>
    </tr>
    
    </table>	
</form>
</div>

<%@include file="Footer.jsp" %>
</body>
</html>