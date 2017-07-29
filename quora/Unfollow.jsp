<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<html><body>
 <%
   int flag=0,flag1=0;
   System.out.println("uname= "+session.getAttribute("userId")+":::followingId= "+request.getParameter("followingId"));
   String uname=(String)session.getAttribute("userId");
   String followingId=request.getParameter("followingId");
   String questionId=request.getParameter("questionId");
   //String questionId=request.getParameter("followquestionId");
   //String askedId=request.getParameter("askedId");
  
 
   Connection con=Dbinfo.con;
   String query="delete from follow where userId=? and following=? and questionId=?";
   PreparedStatement ps=con.prepareStatement(query);
   ps.setString(1,uname);
   ps.setString(2,followingId);
   ps.setString(3,questionId);
   
	flag1=ps.executeUpdate();
	if(flag1==1)
	response.sendRedirect("Following.jsp");
	else
   %>
    <h3>oops! something went wrong </h3>
   
</body></html>