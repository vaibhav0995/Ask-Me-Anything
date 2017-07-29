package p1;
import java.sql.*;

public class Dbinfo
{
  public static Connection con;
  static
  {
    
	try{
 		System.out.println("Inside Dbinfo...");
		Class.forName("com.mysql.jdbc.Driver");
 		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quora","root","rat");
 		System.out.println("Connection Established !!!!!!!!!!!"+con);
		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
  }
}