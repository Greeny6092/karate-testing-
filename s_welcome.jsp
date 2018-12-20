<%@ page import="javax.servlet.http.*"%>
<%! HttpSession ses;
    String uid;
%>
<%
    ses=request.getSession();
    uid=ses.getAttribute("suid").toString();
%>
<html>
 <head>
  <title>Karate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="kar.png"\>
  <link rel="stylesheet" type="text/css" href="index.css"\>
  <script rel="javascript" type="text/javascript" src="kar_script.js"> </script>
 </head>
 <body onload="start();">
  <div class="head">
   <img src="left.png"  height="230" width="230" style="float:left;">
   <h1 style="text-shadow:0.5vw 0.5vw 0.5vw grey;">CHALLENGERS SPORTS ACADEMY </h1>
   <h1 style="position:absolute;top:80px;left:450px;text-shadow:0.5vw 0.5vw 0.5vw grey;">OF MARTIAL ARTS</h1>  
   <img src="right.png" height="230" width="230" style="float:right;padding-top:-100px;">
  </div>
  <div class="nav">
	<a class="nav" class="nav" href="home.html" name="home">Home</a>
	<a class="nav" class="nav" href="about.html" name="about">About Us</a>
	<span class="b" style="left:0%;">
		<a class="nav" href="">Martial Arts</a>
			<span class="bcn" style="left:0%;width:180%;top:180%;height:30vw;width:65.55vw;overflow:scroll;">
				<table style="margin:0px 0px;background-color:#191eec;text-align:center;">
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
	    	<a class="nav" href=""><%=uid%></a>
	</span>
	<a class="b nav"  name="register" style="left:33vw;" href="/karate/s_logout">Log Out</a>
  </div>
  <div style="position:relative;top:5%;left:13%;z-index:-2" name="body">
	<p style="font-size:20pt">welcome<%out.println(uid);%></p>
  </div>
 </body>
</html>