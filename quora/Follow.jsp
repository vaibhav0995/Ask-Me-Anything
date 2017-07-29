<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<html><body>
 <%
   int flag=0,flag1=0,flag2=0;
   System.out.println("uname= "+session.getAttribute("userId")+":::askedId= "+request.getParameter("askedId"));
   String uname=(String)session.getAttribute("userId");
   String askedId=request.getParameter("askedId");
   String questionId=request.getParameter("followquestionId");
   String notificationId="note";
   //String askedId=request.getParameter("askedId");
   System.out.println("userId= "+uname+" ::::::AskedId= "+askedId);
 
   Connection con=Dbinfo.con;
   String query="select * from follow where userId=? and following=? and questionId=?";
   String query3="insert into follow values(?,?,?)";
   String query1="select distinct userId from follow where following=?";
   String query2="insert into notifications value(?,?,?,?,?)";
   PreparedStatement ps=con.prepareStatement(query);
   PreparedStatement ps3=con.prepareStatement(query3);
   
   PreparedStatement ps1=con.prepareStatement(query1);
   PreparedStatement ps2=con.prepareStatement(query2);
   
   ps1.setString(1,uname);
   ps.setString(1,uname);
   ps.setString(2,askedId);
   ps.setString(3,questionId);
   ps3.setString(1,uname);
   ps3.setString(2,askedId);
   ps3.setString(3,questionId);
   
   ResultSet rs=ps.executeQuery();
   while(rs.next())
   {
    flag=1;
	break;
  }
  
  if(flag==1 || uname.equals(askedId))
  {
     response.sendRedirect("User.jsp");
  }
  else
  {
	flag1=ps3.executeUpdate();
	ResultSet res=ps1.executeQuery();
   while(res.next())
    {
	    for(int i=1;i<=3;i++)
       {
         notificationId=notificationId+String.valueOf((int)(Math.random()*10));
       }
	   ps2.setString(1,notificationId);
       ps2.setString(2,res.getString(1));
       ps2.setString(3,uname);
   	   ps2.setString(4,"follow");
       ps2.setString(5,questionId);
	   flag2=ps2.executeUpdate();
	   notificationId="note";
    }
	if((flag1==1) && (flag2==1))
	response.sendRedirect("User.jsp");
	else
   %>
    <h3>oops! something went wrong </h3>
   <%  	
  }
   %>
</body></html>