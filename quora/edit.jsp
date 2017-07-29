<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<html><body>
 <%
   int flag=0,flag1=0;
   System.out.println("uname= "+session.getAttribute("userId")+":::answer= "+request.getParameter("answer"));
   String uname=(String)session.getAttribute("userId");
   String answerId=request.getParameter("answerId");
   String answer=request.getParameter("answer");

   Connection con=Dbinfo.con;
   String query="update answer_bank set answer=? where answerId=? and userId=?";
   PreparedStatement ps=con.prepareStatement(query);
   ps.setString(1,answer);
   ps.setString(2,answerId);
   ps.setString(3,uname);
   System.out.println("-------------");
   flag1=ps.executeUpdate();
	
	System.out.println("flag1= "+flag1);
	if(flag1==1)
	response.sendRedirect("EditAnswers.jsp");
	else
   %>
    <h3>oops! something went wrong </h3>
   
</body></html>