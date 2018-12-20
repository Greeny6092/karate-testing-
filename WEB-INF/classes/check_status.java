import java.util.*;
import java.sql.*;
class check_status
{
	public static void main(String args[])
	{	
		String course,check,cur_date_string,cur_time_string,date_string,time_string;
		int form_id;
		Scanner in=new Scanner(System.in);
		System.out.println("Enter a form_id and Course");
		form_id=in.nextInt();
		course=in.nextLine();
		check="select * from forms where form_id="+form_id+";";
		java.util.Date c_date=new java.util.Date();
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
				System.out.println("Status is :"+rs.getString("status"));
				System.out.println("Date is "+Integer.parseInt(date_string_array[0]));
				System.out.println("Time is "+Integer.parseInt(time_string_array[0]));
				System.out.println("Current Date is "+Integer.parseInt(cur_date_string_array[0]));
				System.out.println("Current Time is "+Integer.parseInt(cur_time_string_array[0]));
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
			 System.out.println("Permission granted");  
		  }
		 else
		  {
		   System.out.println("Permission denied!!!");
		  }
		}
		else
		{
		 System.out.println("Permission granted");
		}
			}
		   else
		     {
			 System.out.println("Permission granted");
		     }
		  }
		 else
		  {
		    System.out.println("Permission granted");
		  }
		}
		else
		{
		  System.out.println("Permission granted");
		}		
		}
		else if(rs.getInt("status")==0)
		{
			System.out.println("status :0 Permission granted");
			stmt1.execute("update forms set status=1 where form_id="+form_id+";");
		}
		else
		{
			System.out.println("status :2 Permission dinied");			
		}
		}}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}