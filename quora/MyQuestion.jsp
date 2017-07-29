<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<html><body>

 <%
   int flag=0,flag1=0,flag2=0;
   String userId=(String)session.getAttribute("userId");
   String question=request.getParameter("question");
   String notificationId="note";
   System.out.println("userId= "+userId+" ::::question= "+question);
   String questionId=userId.substring(0,2)+"q";
   for(int i=1;i<=3;i++)
   {
	 questionId=questionId+String.valueOf((int)(Math.random()*10));
   }
   System.out.println("questionId::::::"+questionId);
    DateFormat df = new SimpleDateFormat("yy/MM/dd");
   String formattedDate = df.format(new java.util.Date());
   Connection con=Dbinfo.con;
   String query="insert into Question_Bank(questionId,userId,question,sdate,likes) values(?,?,?,?,?)";
   String query1="select distinct userId from follow where following=?";
   String query2="insert into notifications value(?,?,?,?,?)";
   PreparedStatement ps=con.prepareStatement(query);
   PreparedStatement ps1=con.prepareStatement(query1);
   PreparedStatement ps2=con.prepareStatement(query2);
   

   ps1.setString(1,userId);
   ps.setString(1,questionId);
   ps.setString(2,userId);
   ps.setString(3,question);
   ps.setString(4,formattedDate);
   ps.setString(5,"1");
   
   if(!(question.equals(""))){
   try{
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
   	   ps2.setString(4,"question");
       ps2.setString(5,questionId);
	   flag2=ps2.executeUpdate();
	   notificationId="note";
    }
   }
   catch(Exception e)
   {
	e.printStackTrace();
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