import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class check_slog_session extends HttpServlet
{

	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{	HttpSession ses;
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");	
		PrintWriter out=res.getWriter();
		String uid;
		int ses_check=0;
		out.println("before try!!");
		try
		{	ses=req.getSession(false);
		Cookie c[]=req.getCookies();
		for(int i=0;i<c.length;i++)
			if(c[i].getName().equals("JSESSIONID"))
				{
					ses_check=1; break;
				}
		out.println("ses_check is "+ses_check);
		if(c.length>=1&&ses_check==0){
		out.println("Cookies exist!!");
		for(int i=0;i<c.length;i++)
		{	out.println("Checking cookies..."+c[i].getName());
			if(c[i].getName().equals("suid"))
			{	out.println("suid exist!!");										if(ses==null||ses.getAttribute("suid")==null)						{ 	out.println("suid exist!! but Session does not exist");
					ses=req.getSession();
			ses.setAttribute("suid",c[i].getValue());
				}
		res.sendRedirect("s_welcome.jsp");
			}		
		}
		out.println("Exiting for loop!!\nses is "+ses+"\nses.getAttribute is "+ses.getAttribute("suid"));
}
	else if(ses==null||ses.getAttribute("suid")==null)
			res.sendRedirect("s_log.html");
		else
			res.sendRedirect("s_welcome.jsp");
	   }
	catch(Exception e)	
		{
			out.println(e);
			out.println("Cookies does not exist!!!");		
			ses=req.getSession(false);
			if(ses==null||ses.getAttribute("suid")==null)
				res.sendRedirect("s_log.html");
			else
					res.sendRedirect("s_welcome.jsp");
		}
	}
}



