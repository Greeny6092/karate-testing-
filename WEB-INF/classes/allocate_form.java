import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class allocate_form extends HttpServlet
{

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{	HttpSession ses;
		String course,form_id="000000",check,ph_no;
		course=req.getParameter("course");
		ph_no=req.getParameter("ph_no");
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");
		int n;	
		//res.getWriter().write("course"+course);
		//res.getWriter().write("ph_no"+ph_no);
		//res.getWriter().write("uid"+uid);
		//res.getWriter().write("pwd"+pwd);
		check="select * from forms where form_id='"+form_id+"';";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection 			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/karate?useSSL=false","root","root");
			Statement stmt=conn.createStatement();		
			Statement stmt1=conn.createStatement();
			ResultSet rs;	
		do{
			n=(int)(Math.random()*1000000);
			form_id=Integer.toString(n);
			//res.getWriter().write("Checking database for "+form_id);
			rs=stmt.executeQuery(check);			
		  }while(rs.next());	
		//res.getWriter().write("Exited loop!!");		   
			stmt1.execute("insert into forms(form_id,course,date,ph_no) values('"+form_id+"','"+course+"',now(),'"+ph_no+"');");
		//res.getWriter().write("Entered new form id into database "+form_id);
		  res.getWriter().write(form_id);
		}
		catch(Exception e)
		{

		}
	}
}


