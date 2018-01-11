<%@include file="keeplogin.jsp" %>
<html>
<head>
    <title>Tripda - Google Map</title>
    <link href="css/css_main.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="js/js.js"></script>
    <!-- Import Google Map API V3 javascript file -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>

    <link href="css/css_loc.css" rel="stylesheet" type="text/css" media="all">
</head>

<%
String from=request.getParameter("from");
String to=request.getParameter("to");

if(from==null)
	from="Ahmedabad, Gujarat, India";
if(to==null)
	to="Ahmedabad, Gujarat, India";
%>
<body>
<%@include file="Header.jsp" %>
<!--<img src="../ShareIT/ShareIT/images/logo.png" />-->
    <div class="container">
        <div class="row">
            <div class="span12">                
                <!-- Distance Calculator Form -->
                <form id="myForm" name="myForm" class="form-horizontal well">

                    <div class="control-group source-container">
                        <div class="controls">
                            <input type="text" id="fromAddress" name="from" class="input-xlarge" value="<%=from%>">
                            <a href="#" onClick="return add_waypoint();" class="button2">Add Waypoints</a>
                        </div>
                    </div>

                    <div class="control-group destination-container">
                        <div class="controls">
                            <input type="text" id="toAddress" name="to" class="input-xlarge" value="<%=to%>">
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn btn-primary"><i class="icon-thumbs-up icon-white"></i>Get Route</button>
                            <span id="loader"></span>
                        </div>
                    </div>
                </form>

                <div id="locations"></div><!-- To Display list of locations entered -->
                <div id="summary"></div><!-- To Display general summary (Distance & Duration) -->

                <!-- Modal -->
                <div id="mapModal" class="well">
                    <div id="map_area">
                        <div id="map_canvas"></div><!-- To Display Map -->
                        <div id="directions"></div><!-- To Display all directions with Waypoints -->
                    </div>
                </div>
                
            </div><!-- /.span12 -->
        </div><!-- /.row -->

    </div> <!-- /container -->
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/gmap.js"></script>
    <script>calcRoute();</script>
</body>
</html>