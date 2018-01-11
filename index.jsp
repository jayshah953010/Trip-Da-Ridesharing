<%@include file="keeplogin.jsp" %>
<html>
<head>
    <title>Tripda - Home</title>
    <link href="css/css_main.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="js/js.js"></script>
</head>

<body>
<%@include file="Header.jsp" %>
<script>active("Home");</script>

<div id="slideshow">
<img src="images/slider_0.jpg">
</div>

<div id="how" onClick="how(0)"><a>How It Works</a></div>
<div id="howitwork"><img src="images/How.PNG"><a onClick="how(1)">&times;</a></div>

<div align="center" style="clear:both; float:left; width:inherit; margin-top:20px;">
    <h2 align="center">How Does (NAME) WORKS?</h2>
    <p>(NAME) Carpooling enables you to find nearby people going your way so you can share your commute.</p>
    <p>By Logging your trips, you can share costs of the journey and resuce traffic and emission in your community.</p>
    <h4>How much does a (Name) Carpool cost?</h4>
    <img src="images/pro_1.png" width="70%" />
    <p>If you have a car, split costs by offering carpools.If you don't have car, use the system to find a carpool</p>
</div>

<%@include file="Footer.jsp" %>
</body>
</html>