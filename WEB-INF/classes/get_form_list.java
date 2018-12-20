import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class get_form_list extends HttpServlet
{

	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{	HttpSession ses;
		String query,data="";
		int index=0;
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");	
		//res.getWriter().write("course"+course);
		//res.getWriter().write("ph_no"+ph_no);
		//res.getWriter().write("uid"+uid);
		//res.getWriter().write("pwd"+pwd);
		query="select * from forms;";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection 			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/karate?useSSL=false","root","root");
			Statement stmt=conn.createStatement();		
			Statement stmt1=conn.createStatement();
			ResultSet rs=stmt.executeQuery(query);	
	   		while(rs.next())
			{	
			res.getWriter().write("Enterd loop");			
			for(index=1;index<=5;index++)
			{										res.getWriter().write("Enterd for loop\n");	
				data=data+"+"+rs.getString(index);
				res.getWriter().write("data is "+data);
			}
			res.getWriter().write(data);
			}
			res.getWriter().write("-1000");
		}
		catch(Exception e)
		{

		}
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{	HttpSession ses;
		String query,data="";
		int index=0;
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");	
		//res.getWriter().write("course"+course);
		//res.getWriter().write("ph_no"+ph_no);
		//res.getWriter().write("uid"+uid);
		//res.getWriter().write("pwd"+pwd);
		query="select * from forms;";
		try
		{
			//res.getWriter().write("POST request!!");
			Class.forName("com.mysql.jdbc.Driver");
			Connection 			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/karate?useSSL=false","root","root");
			Statement stmt=conn.createStatement();		
			Statement stmt1=conn.createStatement();
			ResultSet rs=stmt.executeQuery(query);	
	   		while(rs.next())
			{	
			//res.getWriter().write("Enterd loop");					data=data+rs.getString(1);
			for(index=1;index<=5;index++)
			{	
				data=data+"+"+rs.getString(index);
			}
				data=data+"&";
			}
			res.getWriter().write(data);
		}
		catch(Exception e)
		{

		}
	}
}



