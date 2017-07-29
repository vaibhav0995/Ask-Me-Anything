<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<html><body>

 <%
   int flag=0,flag1=0,flag2=0;
   String userId=(String)session.getAttribute("userId");
   String questionId=request.getParameter("questionId");
   String answer=request.getParameter("answer");
   String notificationId="note";
   DateFormat df = new SimpleDateFormat("dd/MM/yy");
   String formattedDate = df.format(new java.util.Date());
   System.out.println("userId= "+userId+" ::::questionId= "+questionId+"::::::answer= "+answer+":::::sdate= "+formattedDate);
   String answerId=questionId+"ans";
   for(int i=1;i<=3;i++)
   {
	 answerId=answerId+String.valueOf((int)(Math.random()*10));
   }
   System.out.println("answerId::::::"+answerId);
   Connection con=Dbinfo.con;
   String query="insert into Answer_Bank values(?,?,?,?,?,?)";
   String query1="select distinct userId from follow where following=?";
   String query2="insert into notifications value(?,?,?,?,?)";
   String query3="select userId from question_bank where questionId=?";
   PreparedStatement ps=con.prepareStatement(query);
    
   PreparedStatement ps1=con.prepareStatement(query1);
   PreparedStatement ps2=con.prepareStatement(query2);
   PreparedStatement ps3=con.prepareStatement(query3);
   
	
   ps1.setString(1,userId);
   ps.setString(1,questionId);
   ps.setString(2,answerId);
   ps.setString(3,userId);
   ps.setString(4,answer);
   ps.setString(5,formattedDate);
   ps.setString(6,"");
   ps3.setString(1,questionId);
    
   
   if(!(answer.equals(""))){
   flag=ps.executeUpdate();
   
   ResultSet res=ps1.executeQuery();
   while(res.next())
    {
	    for(int i=1;i<=3;i++)
       {
         notificationId=notificationId+String.valueOf((int)(Math.random()*10));
       }
	   ps2.setString(1,notificationId);
       ps2.setString(2,res.getString(1));
       ps2.setString(3,userId);
   	   ps2.setString(4,"answer");
       ps2.setString(5,questionId);
	   flag2=ps2.executeUpdate();
	   notificationId="note";
    }
	
	  ResultSet r=ps3.executeQuery();
	  r.next();
	 if(!(userId.equals(r.getString(1))))
	 {
	 for(int i=1;i<=3;i++)
       {
         notificationId=notificationId+String.valueOf((int)(Math.random()*10));
       }
	   ps2.setString(1,notificationId);
       ps2.setString(2,r.getString(1));
       ps2.setString(3,userId);
   	   ps2.setString(4,"answer1");
       ps2.setString(5,questionId);
	   flag2=ps2.executeUpdate();
	 }
   }
   if((flag==1)&&(flag2==1))
   response.sendRedirect("User.jsp");
   else
   {
   %>
   <h2>OOPS ! something went wrong !</h2><br><br>
   <a href="User.jsp">Back</a>
   <%
   }
  %>
</body></html>