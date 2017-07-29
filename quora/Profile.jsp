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


.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}
</style>
</head>

<body>


<%
   String userId=(String)session.getAttribute("userId");
   Connection con=Dbinfo.con;
   String query="select * from Registration where userId=?";
   
  try{
   PreparedStatement p=con.prepareStatement(query);
   p.setString(1,userId);
   
   ResultSet res=p.executeQuery();
   res.next();
   String name=res.getString(1);
   String email=res.getString(2);
   String uid=res.getString(3);
 
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
            
                    
                    <table border="0" align="left">
                       <tr>
                            <td> <h2>Welcome <%=res.getString(1)%><h2></td>
                       </tr>
                        <tr>
                        	<td> <h3>Email:  <%=res.getString(2)%><h3></td>
                       </tr>
              </table>
              
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