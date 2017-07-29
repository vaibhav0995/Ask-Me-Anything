<%@ page import="java.sql.*" %>
<%@ page import="p1.Dbinfo" %>
<html><body>

 <%
   int flag=0,flag1=0;
   String utype="";
   String name=request.getParameter("name");
   String email=request.getParameter("myInput");
   String password=request.getParameter("password");
   String cpassword=request.getParameter("cpassword");
   String userId=email.substring(0,3);
   System.out.println("name= "+name+" ::::password= "+password+"::::::email= "+email);
   for(int i=1;i<=3;i++)
   {
	 userId=userId+String.valueOf((int)(Math.random()*10));
   }
   System.out.println("userId::::::"+userId);
   Connection con=Dbinfo.con;
   String query="insert into Registration values(?,?,?)";
   String query1="insert into Login values(?,?,?)";
   PreparedStatement ps=con.prepareStatement(query);
   
   PreparedStatement ps1=con.prepareStatement(query1);
   ps.setString(1,name);
   ps.setString(2,email);
   ps.setString(3,userId);
   ps1.setString(1,userId);
   ps1.setString(2,password);
   ps1.setString(3,"user");
   if(password.equals(cpassword)&&(name!="")){
   try{
   flag=ps.executeUpdate();
   flag1=ps1.executeUpdate();
   }
   catch(Exception e){
   e.printStackTrace();
   }
  }
   if((flag==1) && (flag1==1))
  {
  %>
  <h3 fcolor="black" align="center">Registered successfully</h3>
  <br>
  <h3 fcolor="red" align="center">User Id= <%=userId%></h3>
  <jsp:include page="Login.html" flush="true"/>
  <%
  }
   else
  {
  %>
  <h3 fcolor="red" align="center">OOPS !Something went wrong !!</h3>
  <jsp:include page="Register.html" flush="true"/>
  <%
  
  }
  %>
</body></html>