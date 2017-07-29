<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="p1.Dbinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ask me Anything</title>
<style>
.btn {
    border: none;
    color: white;
    padding: 28px 28px;
    font-size: 16px;
    cursor: pointer;
}

.vg {
    padding: 5px;
    background-color: #E3EAE9; /* Red */
    color: black;
    margin-bottom: 7px;
}
.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}
</style>
</head>

<body>


<%
   boolean flag=true;
   String userId=(String)session.getAttribute("userId");
   Connection con=Dbinfo.con;
   String query="select * from Registration where userId=?";
   String query1="select * from notifications where notify=?";
  try{
   PreparedStatement p=con.prepareStatement(query);
   PreparedStatement p1=con.prepareStatement(query1);
   p1.setString(1,userId);
   
   ResultSet res=p1.executeQuery();
 
%>

<div align="center">
  <table width="1028" height="534" border="0">
    
    <tr>
      <td width="974" height="150" bgcolor="#FFFFFF"><jsp:include page="UserProfileHeader.jsp" flush="true"/> &nbsp;</td>
    </tr>
    
    <tr>
      <td bgcolor="#FFFFFF">&nbsp;
        <table width="983" height="358" border="0">
          
          <tr>
    
            <td width="167" height="193"> 
                <jsp:include page="ProfileSideMenu.jsp" flush="true"/>  &nbsp;
                <div align="center"></div>  
            </td>
            <td width="800">
            <%
			    while(res.next())
				{
				   flag=false;
				   p.setString(1,res.getString(3));
				   ResultSet r=p.executeQuery();
				   r.next();
				   if(res.getString(4).equals("question"))
				  {
  			%>     
                    <div class="vg" align="left">
                       <a href="ShowNotifications.jsp?nid=<%=res.getString(1)%>&qid=<%=res.getString(5)%>&ntype=question"" style="color:#A18EA4; text-decoration:none"><h2><%=r.getString(1)%> has asked a question !</h2></a>
                     </div>              
                   
           <%
				 }
				   if(res.getString(4).equals("answer"))
				  {
  			%>     
                    <div class="vg" align="left">
                       <a href="ShowNotifications.jsp?nid=<%=res.getString(1)%>&qid=<%=res.getString(5)%>&ntype=answer"" style="color:#A18EA4; text-decoration:none"><h2><%=r.getString(1)%> has answered a question !</h2></a>
                     </div>              
                   
           <%
				 }
				 
				 if(res.getString(4).equals("follow"))
				  {
  			%>     
                    <div class="vg" align="left">
                       <a href="ShowNotifications.jsp?nid=<%=res.getString(1)%>&qid=<%=res.getString(5)%>&ntype=follow" style="color:#A18EA4; text-decoration:none"><h2><%=r.getString(1)%> has followed a story !</h2></a>
                     </div>              
                   
           <%
				 }
				 
				if(res.getString(4).equals("answer1"))
				  {
  			%>     
                    <div class="vg" align="left">
                       <a href="ShowNotifications.jsp?nid=<%=res.getString(1)%>&qid=<%=res.getString(5)%>&ntype=follow" style="color:#A18EA4; text-decoration:none"><h2><%=r.getString(1)%> has answered your question !</h2></a>
                     </div>              
                   
           <%
				 }
				 
			   }
			   if(flag)
					{
				 %>
                        <h2 align="center">No notifications to show !</h2>
                 <%
					}
				
			%>
           
		   </td>
            
         </tr>
        </tr>
    
  </table>
  
  <%
   
     }
   catch(Exception e)
   {
	 e.printStackTrace();
   }

    
  %>
  
  
</body>
</html>