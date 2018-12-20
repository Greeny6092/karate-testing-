import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class check_name extends HttpServlet
{

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{	HttpSession ses;
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");	
		String uid,name,check;
	uid=req.getParameter("uid1")+req.getParameter("uid2");
		//res.getWriter().write("uid1"+uid1);
		//res.getWriter().write("uid2"+uid2);
		//res.getWriter().write("uid"+uid);
		//res.getWriter().write("pwd"+pwd);
		check="select name from instructor_profile where uid='"+uid+"';";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection 			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/karate?useSSL=false","root","root");
			Statement stmt=conn.createStatement();		
			Statement stmt1=conn.createStatement();		
			ResultSet rs=stmt.executeQuery(check);	
			if(rs.next())	
				{
					name=rs.getString("name");
					res.getWriter().write(name);			
				}
			else
				{
					res.getWriter().write("-1");		
				}
		}
		catch(Exception e)
		{

		}
	}
}


