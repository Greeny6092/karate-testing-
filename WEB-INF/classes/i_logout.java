import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class i_logout extends HttpServlet
{

	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
	{	HttpSession ses;
		res.setContentType("text/plain");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out=res.getWriter();	
		//res.getWriter().write("uid1"+uid1);
		//res.getWriter().write("uid2"+uid2);
		//res.getWriter().write("uid"+uid);
		//res.getWriter().write("pwd"+pwd);
		try
		{	Cookie c[]=req.getCookies();
			ses=req.getSession(false);
			if(ses!=null)
			{
				ses.setAttribute("iuid",null);
			out.println("session variable "+ses.getAttribute("iuid")+"Cookie length "+c.length);

				for(int i=0;i<c.length;i++)
				{	out.println("Cookie found "+c[i].getName());
					if(c[i].getName().equals("iuid"))
						{
					Cookie d=new Cookie("iuid",null);
					d.setMaxAge(0);
					res.addCookie(d);
						}
				}	
				res.sendRedirect("i_log.html");
				//out.println("called sendRedirect!!!");
			}
		}
		catch(Exception e)
		{

		}
	}
}


