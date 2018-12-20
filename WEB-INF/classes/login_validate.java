import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class login_validate extends HttpServlet
{

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{	HttpSession ses;
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");	
		String uid,pwd,check,kmsin;
	uid=req.getParameter("uid1")+req.getParameter("uid2");
		pwd=req.getParameter("pwd");
		kmsin=req.getParameter("kmsin");
		//res.getWriter().write("uid1"+uid1);
		//res.getWriter().write("uid2"+uid2);
		//res.getWriter().write("uid"+uid);
		//res.getWriter().write("pwd"+pwd);
		check="select * from login where uid='"+uid+"';";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection 			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/karate?useSSL=false","root","root");
			Statement stmt=conn.createStatement();		
			Statement stmt1=conn.createStatement();		
			ResultSet rs=stmt.executeQuery(check);	
			if(rs.next())	
				{
					res.getWriter().write("1");
					if(pwd.equals(rs.getString("pwd")))
					{	Cookie c;
						res.getWriter().write("1");
						ses=req.getSession();
						if(req.getParameter("uid1").equals("IN"))
						{ 
						ses.setAttribute("iuid",uid); 
						c=new Cookie("iuid",uid);
						c.setMaxAge(2592000);
						if(kmsin.equals("true"))
						 {
							res.addCookie(c);
						 }
						}
					else
						{ 
						c=new Cookie("suid",uid);
						c.setMaxAge(259200);
						ses.setAttribute("suid",uid);
						if(kmsin.equals("true"))
						 {
							res.addCookie(c);		
						 }						
						}
					}
					else
					{ 
					res.getWriter().write("0");	
					}			
				}
			else
				{
					res.getWriter().write("0");		
				}
		}
		catch(Exception e)
		{

		}
	}
}

