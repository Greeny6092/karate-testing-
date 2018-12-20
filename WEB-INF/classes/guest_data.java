import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class guest_data extends HttpServlet
{	RequestDispatcher fdis;
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		String name=req.getParameter("name");
		String mail=req.getParameter("mail");
		String ph=req.getParameter("ph");
		String insert="insert into guest_reg values('"+name+"','"+mail+"','"+ph+"');";
		try{
		fdis=req.getRequestDispatcher("contact.html");
		Class.forName("com.mysql.jdbc.Driver");
		out.println("Connection before!!");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/karate?useSSL=false","root","root");
		out.println("Connection esatblished!!");
		Statement stmt=conn.createStatement();		
		stmt.executeUpdate(insert);
		fdis.forward(req,res);
		}
		catch(Exception e)
		{
			fdis.include(req,res);
			System.out.println(""+e.getMessage());
		}
	}
}