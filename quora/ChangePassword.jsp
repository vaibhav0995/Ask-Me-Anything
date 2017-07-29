<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<html><body>
 <%
   int flag=0,flag1=0;
   String userId=(String)session.getAttribute("userId");
   String password=request.getParameter("currentPassword");
   String newPassword=request.getParameter("newPassword");
   String cnewPassword=request.getParameter("cnewPassword");
   
   Connection con=Dbinfo.con;
   String query="select password from Login where userId=?";
   String query1="update login set password=? where userId=?";
   PreparedStatement ps=con.prepareStatement(query);
   PreparedStatement ps1=con.prepareStatement(query1);

   ps.setString(1,userId);
   ps1.setString(1,newPassword);
   ps1.setString(2,userId);
   ResultSet rs=ps.executeQuery();
   while(rs.next())
   {
    if((rs.getString(1).equals(password))&&(newPassword.equals(cnewPassword)))
	flag=1;
	break;
  }
  if(flag==1 )
  {
	flag1=ps1.executeUpdate();
  }
  if(flag1==1)
  response.sendRedirect("Profile.jsp");
  else
  {
  %>
  <h3 fcolor="black" align="center">OOPS ! Something went wrong !!!</h3>
  <a href="Profile.jsp" align="center">BACK</a>
  <jsp:include page="ChangePassword.html" flush="true"/>
  <%
  
  }
  %>
</body></html>