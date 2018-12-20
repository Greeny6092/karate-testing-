import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class check_form_status extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");
		String course,check,cur_date_string,cur_time_string,date_string,time_string,update_time;
		int form_id;
		//res.getWriter().write("Enter a form_id and Course");
		form_id=Integer.parseInt(req.getParameter("form_id"));
		course=req.getParameter("course");
		check="select * from forms where form_id="+form_id+";";
		java.util.Date c_date=new java.util.Date();
	update_time="update forms set date=now() where form_id="+form_id+";";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection 			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/karate?useSSL=false","root","root");
			Statement stmt=conn.createStatement();		
			Statement stmt1=conn.createStatement();		
			ResultSet rs=stmt.executeQuery(check);		
			while(rs.next())
			{
				java.sql.Date date=new java.sql.Date(rs.getDate("date").getTime());
				date_string=date.toString();
				Time time=rs.getTime("date");
				time_string=time.toString();
				java.sql.Date cur_date=new java.sql.Date(c_date.getTime());
				cur_date_string=cur_date.toString();
				java.sql.Time cur_time=new java.sql.Time(c_date.getTime());
				cur_time_string=cur_time.toString();
	String cur_date_string_array[]=cur_date_string.split("-");
	String cur_time_string_array[]=cur_time_string.split(":");
	String date_string_array[]=date_string.split("-");
	String time_string_array[]=time_string.split(":");
				//res.getWriter().write("Status is :"+rs.getString("status"));
				//res.getWriter().write("Date is "+Integer.parseInt(date_string_array[0]));
				//res.getWriter().write("Time is "+Integer.parseInt(time_string_array[0]));
				//res.getWriter().write("Current Date is "+Integer.parseInt(cur_date_string_array[0]));
				//res.getWriter().write("Current Time is "+Integer.parseInt(cur_time_string_array[0]));
	if(rs.getInt("status")==1)
		{
		if(Integer.parseInt(cur_date_string_array[0])<=Integer.parseInt(date_string_array[0]))
		{
		 if(Integer.parseInt(cur_date_string_array[1])<=Integer.parseInt(date_string_array[1]))	
		  {
		   if(Integer.parseInt(cur_date_string_array[2])<=Integer.parseInt(date_string_array[2]))				{
		if(Integer.parseInt(cur_time_string_array[0])<=Integer.parseInt(time_string_array[0]))
		{
	if((Integer.parseInt(cur_time_string_array[1])-Integer.parseInt(time_string_array[1]))>=30)
		  {
			 res.getWriter().write("Permission granted ,Procceed filling the form");  
			 stmt1.execute(update_time);
		  }
		 else
		  {
		   res.getWriter().write("Permission denied ,Try again after 30 minutes!!!");
		  }
		}
		else
		{
		 res.getWriter().write("Permission granted ,Procceed filling the form");
			 stmt1.execute(update_time);
		}
			}
		   else
		     {
			 res.getWriter().write("Permission granted ,Procceed filling the form");
			 stmt1.execute(update_time);
		     }
		  }
		 else
		  {
		    res.getWriter().write("Permission granted ,Procceed filling the form");
			 stmt1.execute(update_time);
		  }
		}
		else
		{
		  res.getWriter().write("Permission granted ,Procceed filling the form");
			 stmt1.execute(update_time);
		}		
		}
		else if(rs.getInt("status")==0)
		{
			res.getWriter().write("Permission granted ,Procceed filling the form");
			stmt1.execute("update forms set status=1 where form_id="+form_id+";");
			 stmt1.execute(update_time);
		}
		else
		{
			res.getWriter().write("Permission dinied ,this form is already used!!!");			
		}
		}}
		catch(Exception e)
		{

		}
	}
}
