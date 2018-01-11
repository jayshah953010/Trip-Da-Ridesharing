var Profile = function(event) {
	var output = document.getElementById('proimg');
	output.src = URL.createObjectURL(event.target.files[0]);
	document.getElementById("remove").style.display="block";
  };
function remove_profile()
{
	document.getElementById("proimg").src="images/default_profile.png";
	document.getElementById("proinput").value="";
	document.getElementById("remove").style.display="none";	
}

function login()
{
	var flag=true;
	var	x=document.getElementById("lemail");
	if(x.value.lastIndexOf('@')<x.value.lastIndexOf('.'))
	{
		x.style.border="1px solid #69F";
	}
	else
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	
	x=document.getElementById("lpass");
	if(x.value.length<8||x.value.length>25)
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}

	return flag;
}

function sign_up()
{
	var flag=true;
	var x=document.getElementById("first");
	if(x.value=="")
	{	
	 	flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	
	x=document.getElementById("last");
	if(x.value=="")
	{	
	 	flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}

	x=document.getElementById("email");
	if(x.value.lastIndexOf('@')<x.value.lastIndexOf('.'))
	{
		x.style.border="1px solid #69F";
	}
	else
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	
	x=document.getElementById("mobile");
	if(x.value=="" || !parseInt(x.value))
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	
	x=document.getElementById("pass");
	if(x.value.length<8||x.value.length>25)
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	
	var y=document.getElementById("rpass");
	if(x.value!=y.value)
	{
		flag=false;
		y.style.border="2px solid #F90";
	}
	else
	{
		y.style.border="1px solid #69F";
	}
	return flag;
}

function edit()
{
	var flag=true;
	var x=document.getElementById("first");
	if(x.value=="")
	{	
	 	flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	
	x=document.getElementById("last");
	if(x.value=="")
	{	
	 	flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	
		x=document.getElementById("mobile");
	if(x.value=="" || !parseInt(x.value))
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	return flag
}

function pass()
{
	var flag=true;
	var x=document.getElementById("opass");
	if(x.value.length<8||x.value.length>25)
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	x=document.getElementById("npass");
	if(x.value.length<8||x.value.length>25)
	{
		flag=false;
		x.style.border="2px solid #F90";
	}
	else
	{
		x.style.border="1px solid #69F";
	}
	
	var y=document.getElementById("rpass");
	if(x.value!=y.value)
	{
		flag=false;
		y.style.border="2px solid #F90";
	}
	else
	{
		y.style.border="1px solid #69F";
	}
	return flag;
}