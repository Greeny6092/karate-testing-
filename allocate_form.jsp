<%@ page import="javax.servlet.http.*"%>
<%! HttpSession ses;
    String uid;
%>
<%
    ses=request.getSession();
    uid=ses.getAttribute("iuid").toString();
%>
<html>
 <head>
  <title>Karate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="kar.png"\>
  <link rel="stylesheet" type="text/css" href="index.css"\>
  <script rel="javascript" type="text/javascript" src="kar_script.js"> </script>
 <style>
  	a.i_welcome
	{
		position:absolute;
		top:30vw;
		left:13vw;
		padding:2vw 4vw;
		text-decoration:none;
		border-radius:1vw 0vw 1vw 0vw;
		background-color:rgba(255,0,0,0.8);
		color:#ffffff;
		font-family:bebas;
		border:solid rgba(255,0,0,1.0);
		transform :rotatey(180deg)  rotatez(0deg);
		transition:background-color 1s,border-radius 1s,transform 0.7s,color 1s;
	}
 	a.i_welcome:hover
	{
		background-color:#0000ff;
		color:rgba(255, 129, 0,1.0);
		border-radius:0vw 1vw 0vw 1vw;	
		transform:   rotatey(360deg) rotatez(360deg);				
	}
   #field
   {
	font-family:Constantia;
	font-size:15pt;
	padding-left:4vw;
	width:10vw;
	height:3vw;
   }
   .input
   {
	padding-left:0vw;
   }
   input[type="submit"],input[type="reset"]
   {
	height:3vw;
	width:15vw;
	border:transparent;
	border-radius:15px;
	background-color:rgba(180,180,180,1.0);
	transition: background-color 0.7s,color 0.7s;
   }
  </style>
  <script>
   var req;
   var form_id;
   var course,ph_no;
   function create_form()
   { 
    alert("Enetered create_form");
    //document.getElementById("checking").style="display:block-inline;";
    //document.getElementById("alert_row").style="display:none;";
    req=new XMLHttpRequest();
    alert("created XML request!!");
    //form_id=document.getElementById("form_id").value;
    course=document.getElementById("course").value;
    ph_no=document.getElementById("ph_no").value;
    alert("after fetching course!!!! course is "+course);
    alert("after fetching Ph_no!!!! ph_no is "+ph_no);
    var url="/karate/allocate_form";
    alert("created request!!! URL is "+url);
    try
    {	var par="course="+course+"&ph_no="+ph_no;
	req.onreadystatechange=status_info;
	req.open("POST",url,false);
	//alert("opened!!");
	req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	req.setRequestHeader("Content-length", par.length);
	req.send(par);
	alert("sent the request!!");
	return false;
    }
    catch(e)
    {
      alert("Unable to connect to server!!!");
    }
   }
   function status_info()
   {
//alert("Entered status_info");
    if(req.readyState==4)
     {
	var val=req.responseText;	
	alert("done "+val);
	document.getElementById("form_id").value=val;
	//document.getElementById("alert_row").style="display:block-inline;";
	//document.getElementById("checking").style="display:none;";
	//document.getElementById("alert").innerHTML=val;
     }
   }
  </script>
 </head>
 <body onload="start();">
  <div class="head">
   <img src="left.png"   style="float:left;width:17vw;height:17vw;">
   <h1 style="text-shadow:0.5vw 0.5vw 0.5vw grey;">CHALLENGERS SPORTS ACADEMY </h1>
   <h1 style="position:absolute;top:6vw;left:34vw;text-shadow:0.5vw 0.5vw 0.5vw grey;">OF MARTIAL ARTS</h1>  
   <img src="right.png" style="float:right;width:17vw;height:17vw;">
  </div>
  <div class="nav">
	<a class="nav" class="nav" href="home.html" name="home">Home</a>
	<a class="nav" class="nav" href="about.html" name="about">About Us</a>
	<span class="b" style="left:0vw;">
		<a class="nav" href="">Martial Arts</a>
			<span class="bcn" style="left:0vw;width:18vw;top:2.3vw;height:30vw;width:65.55vw;overflow:scroll;">
				<table style="margin:0vw 0vw;background-color:#191eec;text-align:center;">
				<tr> 
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#bo-kata"><img class="nav" src="images/bo-kata/bo-kata_0.jpg" id="bo-kata" onmouseover="rimg_nav(3,'bo-kata')" onmouseout="rimg_nav_clear()"><br>BO-KATA</a> </td> 
					<td class="nav"> <a  class="nav_sub" href="martial_arts_info.html#gymnastics"><img class="nav" src="images/gymnastics/gymnastics_0.jpg" id="gymnastics" onmouseover="rimg_nav(3,'gymnastics')" onmouseout="rimg_nav_clear()"><br>GYMNASTICS</a> </td> 					
					<td class="nav"> <a  class="nav_sub" href="martial_arts_info.html#karate"><img class="nav" src="images/karate/karate_0.jpg" id="karate" onmouseover="rimg_nav(3,'karate')" onmouseout="rimg_nav_clear()"><br>KARATE</a> </td> 
				</tr>
				<tr> 
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#kick-boxing"><img class="nav" src="images/kick-boxing/kick-boxing_0.jpg" id="kick-boxing" onmouseover="rimg_nav(3,'kick-boxing')" onmouseout="rimg_nav_clear()"><br>KICK-BOXING</a> </td> 
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#nunchacku"><img class="nav" src="images/nunchacku/nunchacku_0.jpg" id="nunchacku" onmouseover="rimg_nav(3,'nunchacku')" onmouseout="rimg_nav_clear()"><br>NUNCHACKU</a> </td> 					
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#sai"><img class="nav" src="images/sai/sai_0.jpg" id="sai" onmouseover="rimg_nav(3,'sai')" onmouseout="rimg_nav_clear()"><br>SAI</a> </td> 
				</tr>
				<tr> 
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#self_defence"><img class="nav" src="images/self_defence/self_defence_0.jpg" id="self_defence" onmouseover="rimg_nav(3,'self_defence')" onmouseout="rimg_nav_clear()"><br>SELF DEFENCE</a> </td> 
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#silambam"><img class="nav" src="images/silambam/silambam_0.jpg" id="silambam" onmouseover="rimg_nav(3,'silambam')" onmouseout="rimg_nav_clear()"><br>SILAMBAM</a> </td> 					
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#taichi"><img class="nav" src="images/taichi/taichi_0.jpg" id="taichi" onmouseover="rimg_nav(3,'taichi')" onmouseout="rimg_nav_clear()"><br>TAICHI</a> </td> 
				</tr>
				<tr class="nav"> 
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#tonfa"><img class="nav" src="images/tonfa/tonfa_0.jpg" id="tonfa" onmouseover="rimg_nav(3,'tonfa')" onmouseout="rimg_nav_clear()"><br>TONFA</a> </td> 
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#yoga"><img class="nav" src="images/yoga/yoga_0.jpg" id="yoga" onmouseover="rimg_nav(3,'yoga')" onmouseout="rimg_nav_clear()"><br>YOGA</a> </td> 					
					<td class="nav"> <a class="nav_sub" href="martial_arts_info.html#boxing"><img class="nav" src="images/boxing/boxing_0.jpg" id="boxing" onmouseover="rimg_nav(3,'boxing')" onmouseout="rimg_nav_clear()"><br>BOXING</a> </td> 					
				</tr>
				</table>
			</span>
	</span>
	<a class="nav" href="gallery.html" name="gallery">Gallery</a>
  	<a class="nav" href="get_contact.html" name="contact">Contact</a>
	<span class="b" style="left:33vw;">
	    	<a class="nav" href="i_welcome.jsp"><%=uid%></a>
	</span>
	<a class="b nav"  name="register" style="left:33vw;" href="/karate/i_logout">Log Out</a>
  </div>
  <div class="body">
	<p style="font-size:20pt;font-family:bebas;">welcome&nbsp&nbsp&nbsp&nbsp<%out.println("\t"+uid);%></p>
	<table cellspacing="2"  style="box-shadow:0.5vw 0.5vw 0.7vw tomato;background-color:rgba(211,211,211,0.8);border-radius:10px;border:0.1vw solid rgba(255,0,0,0.7);margin:5vw 10vw 0vw 25vw;">
		<form action="" method="post" onsubmit="return create_form();">
			<tr>
				<th colspan=2 style="font-family:Charlemagne Std;font-size:20pt;color:#fe350e;"> Form Allocation </th>
			</tr>
			<tr>
				<td> <label for="uid2"> <p id="field"> Course </p> </label> </td>
			        <td> 
					<select name="course" id="course" size="1">
						 <option value="none" selected>Select Course</option>	
				        	 <option value="karate">Karate</option>
					         <option value="self_defence">Self defence</option>
					         <option value="silambam">Silambam</option>
					         <option value="boxing">Boxing</option>
					         <option value="kick-boxing">Kick-Boxing</option>
				        	 <option value="taichi">Taichi</option>
					         <option value="nunchacku">Nunchaku</option>
					         <option value="tonfa">Tonfa</option>
					         <option value="bo-kata">Bo-katas</option>
					         <option value="yoga">Yoga</option>
					         <option value="gymnastics">Gymnastics</option>
				        </select>
			       </td>
			</tr>
			<tr>
				<td> <label for="ph_no"> <p id="field">Phone Number</p> </label> </td>
				<td> <input type="text" id="ph_no" name="ph_no" style="width:16.5vw" class="input" placeholder="Your Phone Number"> </td>
			</tr>
			<tr>
				<td> <label for="name"> <p id="field"> Form ID is</p> </label> </td>
				<td> <input type="text" id="form_id" name="form_id" style="width:16.5vw" class="input" placeholder="Your Form ID" readOnly> </td>
			</tr>
			<tr>
				<td></td><td> <span id="message" style="padding-left:1vw">testing...</span> </td>
			</tr>
			<tr>
				<td style="padding-left:2.5vw;padding-top:1vw;"> <input type="submit" value="Create Form" > </td>
				<td style="padding-left:2.5vw;padding-top:1vw;"> <input type="reset" value="Reset" > </td>
			</tr>
		</form>
	</table>	
  </div>
 </body>
</html>