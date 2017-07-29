<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<html><body>
 <%
   int flag=0;
   String utype="";
   String uname=request.getParameter("id");
   String pass=request.getParameter("password");
   System.out.println("userId= "+uname+" ::::password= "+pass);
   session.setAttribute("userId",uname);
   System.out.println("Session userId::::"+session.getAttribute("userId"));
   Connection con=Dbinfo.con;
   String query="select * from Login where userId=? and password=?";
   PreparedStatement ps=con.prepareStatement(query);
   ps.setString(1,uname);
   ps.setString(2,pass);
   ResultSet rs=ps.executeQuery();
   while(rs.next())
   {
    flag=1;
	utype=rs.getString(3);
	break;
  }
  if(flag==1 && utype.equalsIgnoreCase("admin"))
  response.sendRedirect("Admin.jsp");
  if(flag==1 && utype.equalsIgnoreCase("user"))
  response.sendRedirect("User.jsp");
  else
  {
  %>
  <h1 fcolor="red" align="center">Login Failed!!</h1>
  <jsp:include page="Login.html" flush="true"/>
  <%
  
  }
  %>
</body></html>