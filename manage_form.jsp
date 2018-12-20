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
   th
   {
 	border-right:0.1vw solid rgba(255,0,0,0.7);
 	border-left:0.1vw solid rgba(255,0,0,0.7);
 	border-bottom:0.1vw solid rgba(255,0,0,0.7);
   }
   td
   {
 	border-right:0.1vw dashed rgba(255,0,0,0.7);
 	border-bottom:0.1vw dashed rgba(255,0,0,0.7);
   }
  </style>
  <script>
   var req;
   var form_id;
   var course,ph_no;
   function get_form_list()
   { 	clear_table();
	document.getElementById("checking").style="height:20vw;width:20vw;padding-left:37vw;display:inline-block;";
    //alert("Enetered get_form_list");
    //document.getElementById("checking").style="display:block-inline;";
    //document.getElementById("alert_row").style="display:none;";
    req=new XMLHttpRequest();
    //alert("created XML request!!");
    //form_id=document.getElementById("form_id").value;
    var url="/karate/get_form_list";
    //alert("created request!!! URL is "+url);
    try
    {	var par="";
	req.onreadystatechange=status_info;
	req.open("POST",url,false);
	//alert("opened!!");
	req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	req.setRequestHeader("Content-length", par.length);
	req.send(par);
	//alert("sent the request!!");
	return false;
    }
    catch(e)
    {
      //alert("Unable to connect to server!!!");
    }
   }
   function status_info()
   {
//alert("Entered status_info");
    if(req.readyState==4)
     { 	document.getElementById("checking").style="height:20vw;width:20vw;padding-left:37vw;display:none;";
	var i,row,j=1,k=0,cell,result,record;
	var table=document.getElementById("form_list");
	var val,res=1;	
	//row=table.insertRow(j);
	val=req.responseText;
	//alert(val);
	var result=val.split("&");	
	//alert("length od result "+result.length);
	for(k=0;k<(result.length)-1;k++)
	{
		//alert("Entered result "+k+"J is "+j);
		record=result[k].split("+");
		//alert(record);
		row=table.insertRow(j);
		for(i=0;i<7;i++)
		{
			if(i==0)
			{
				cell=row.insertCell(i);
				cell.innerHTML="<input type='checkbox' name='select' id='select' oninput='check_if_all_checked()'>";
			}
			else
			if(i==6)
			{
				cell=row.insertCell(i);
				cell.innerHTML="<input type='button' value='view'>";				
			}
			else
			{
				cell=row.insertCell(i);	
				cell.innerHTML=record[i];			
			}
		}
		j++;			
	}
	//document.getElementById("form_id").value=val;
	//document.getElementById("alert_row").style="display:block-inline;";
	//document.getElementById("checking").style="display:none;";
	//document.getElementById("alert").innerHTML=val;
     }
   }
    function select_all()
    {   //alert("Entering select all");
	var i;
	var checkboxes=document.getElementsByName("select");
	//alert("after getting checkboxes");
	for(i=0;i<checkboxes.length;i++)	
	{
		//alert("checking all checkboxes");
	  if(document.getElementById("select_all").checked)
		checkboxes[i].checked=true;
	  else
		checkboxes[i].checked=false;
	}
    }
   function clear_table()
   {	//alert("clearing table!!");
	var table=document.getElementById("form_list");
	var child=table.childNodes;
	var removed;
	var grand_child=child[0].childNodes;
	const len=grand_child.length;
	//alert("created grand_child "+grand_child.length+"\nchild's child count "+child[0].childElementCount);
	//for(i=0;i<child.length;i++)
		//alert("child "+i+" :"+child[i].nodeType);
	//for(i=0;i<grand_child.length;i++)
		//alert("grand_child "+i+" :"+grand_child[i].nodeType+" "+grand_child[i].tagName);	
	for(m=1;m<len;m++)		
		{
		//alert("clearing grand child "+m+" :"+grand_child[m].tagName+"\n m is "+m+"\nlen is "+len); 
		removed=child[0].removeChild(child[0].childNodes[1]);
		//alert("removed "+removed.tagName);
		}
	//alert("cleared table");
   }
  function check_if_all_checked()
   {	//alert("entered check_if_all_checked");
	var selects=document.getElementsByName("select");
	var sum=true;
	for(i=0;i<selects.length;i++)
		sum=sum & selects[i].checked;
	//alert("sum is "+sum);
	if(sum==1)
		document.getElementById("select_all").checked=true;
	else
		document.getElementById("select_all").checked=false;
   }
  function delete_data()
   {	alert("Entered delete data");
	var deleting_data;
	var selects=document.getElementsByName("select");
	var table=document.getElementById("form_list");
	var child=table.childNodes;
	var grand_child=child[0].childNodes;
	let lenn=grand_child.length;
	alert("acquired table child nodes and grand_child nodes lenn is "+lenn);
	for(n=0;n<lenn;n++)
	 {	alert("Entered loop n is "+n);
		if(selects[n].checked==true)
		{	alert("Entered if");
			deleting_data+=grand_child[n+1].childNodes[1];
			deleting_data+="+";
		}
	 }
	alert("exited loop!!");
	//alert("deleting nodes is "+deleting_data);	
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
	<div style="padding-left:20vw;"><label for="search"><span id="field">Search:</span></label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Search here!!" id="search" style="background-color:rgba(200,244,66,0.8);font-family:bebas;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" onclick="get_form_list();" value="Retrieve Forms"></div>
	<input type="button" onclick="delete_data();" style="position:relative;top:4.7vw;left:55vw;" value="Delete">
	<table cellspacing="2"  id="form_list" style="box-shadow:0.5vw 0.5vw 0.7vw tomato;background-color:rgba(211,211,211,0.8);border-radius:10px;border:0.1vw solid rgba(255,0,0,0.7);margin:5vw 10vw 0vw 25vw;text-align:center;" cellspacing="7" cellpadding="5"><tr><th><input type="checkbox" id="select_all" onclick="select_all();"></th><th>Form ID</th><th>Course</th><th>Last Accessed Date</th><th>status</th><th>Phone Number</th><th>View Form</th></tr></table>	
	<img src="check_name_gif.gif" style="height:20vw;width:20vw;padding-left:37vw;display:none;" id="checking">
  </div>
 </body>
</html>