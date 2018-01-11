function initialize() {

var input = document.getElementById('searchTextField');
var input1 = document.getElementById('searchTextField1');
var autocomplete = new google.maps.places.Autocomplete(input);
var autocomplete = new google.maps.places.Autocomplete(input1);
}

function notify()
{
 if( document.getElementById("notify").style.display=="block")
 	document.getElementById("notify").style.display="none";
 else
 	document.getElementById("notify").style.display="block";
}

function how(a)
{
 if(a==0)
	 document.getElementById("howitwork").style.display="block";
 else
 	 document.getElementById("howitwork").style.display="none";
}

google.maps.event.addDomListener(window, 'load', initialize);// JavaScript Document