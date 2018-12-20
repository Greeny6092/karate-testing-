function highlight()
 {
   //alert("Entering highlight");
   var str="hq";
   var str1="hq";
   var sPath = window.location.pathname;
   var name=sPath.substring(sPath.lastIndexOf('/') + 1,sPath.lastIndexOf('.'));
   //alert("welcome to "+name);
   if(name==="/karate/")
    document.getElementsByName('home')[0].style.color= "#fe350e";
   else
    document.getElementsByName(name)[0].style.color= "#fe350e";
   //alert("existing highlighting!!!");
 }
function val()
{
	if(!ph.test(guest_form.ph.value))
	{
		//alert("Enter a valid phone number");
		return false;
	}
	return true;
}
function sleep(milliseconds)
{
	var current=new Date().getTime();
	while(current+milliseconds>=new Date().getTime())
	{
	}
}
function rimg(n,name)
{		//alert("Entering "+name);
		var fpath=document.getElementById(name);
   		var fname=fpath.src.substring(fpath.src.lastIndexOf('_')+1,fpath.src.lastIndexOf('.'));
		fname++;
		fname=fname%n;
		path="images/"+name+"/"+name+"_"+fname+".jpg";
		//alert("Entered rimg"+fname);
		//sleep(1000);
		//alert("timer stopped!! "+path);
		document.getElementById(name).src=path;
		//alert("Existing  rimg");
}
var id;
function rimg_nav(n,name)
{
	id=setInterval(rimg,800,n,name);
}
function rimg_nav_clear()
{
	clearInterval(id);
}
function disable()
{
//alert("Entered disable");
reg_form.fname.disabled=true;
reg_form.lname.disabled=true;
reg_form.mother_name.disabled=true;
reg_form.father_name.disabled=true;
reg_form.dob.disabled=true;
reg_form.age.disabled=true;
reg_form.gen[0].disabled=true;
reg_form.gen[1].disabled=true;
reg_form.gen[2].disabled=true;
reg_form.qua[0].disabled=true;
reg_form.qua[1].disabled=true;
reg_form.qua[2].disabled=true;
reg_form.qua[3].disabled=true;
reg_form.ph.disabled=true;
reg_form.mail.disabled=true;
reg_form.address.disabled=true;
reg_form.iin.readOnly=true;
reg_form.reset_button.disabled=true;
reg_form.register_button.disabled=true;
}
function start()
{
	//alert("Entered start");
	highlight();
	disable();
}

