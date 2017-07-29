<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="p1.Dbinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ask me Anything</title>

</head>
<body>
<div align="center">
  <table width="993" height="674" border="0">
    <tr>
      <td width="983" height="290" bgcolor="#FFFFFF"><jsp:include page="Header.jsp" flush="true"/>&nbsp;</td>
    </tr>
    <tr>
    <td height="304" bgcolor="#FFFFFF">
        <%
   session.setAttribute("userId",null);
   System.out.println("session USER ID: "+session.getAttribute("userId"));
   Connection con=Dbinfo.con;
   String query="select * from Question_Bank order by number DESC";
   String query1="select * from Registration where userId=?";
   String query2="select * from Answer_Bank where questionId=?";
   try{
   PreparedStatement p=con.prepareStatement(query);
   PreparedStatement p1=con.prepareStatement(query1);
   PreparedStatement p2=con.prepareStatement(query2);
   ResultSet res=p.executeQuery();
   String userId="";
   String questionId="";
   String ansUid="";
   int a=0;
   while(a!=5)
   {
    a++;
	res.next();
	userId=res.getString(2);
	questionId=res.getString(1);
  
   p1.setString(1,userId);
    p2.setString(1,questionId);
    ResultSet res1=p1.executeQuery();
    ResultSet res2=p2.executeQuery();
         %>
	  <table width="993" border="0">
	    <tr>
		    <td bgcolor="#FFFFFF" ><strong><em> <h2><%=res.getString(3)%> </h2></em></strong>
		  &nbsp;</td>
	      </tr>
	    
        <tr>
	      <td bgcolor="#FFFFFF"><strong>asked by :</strong> 
          <%
		   while(res1.next())
		   {
			%>
            <%=res1.getString(1)%>
            <%
			}
		  %>
          &nbsp;</td>
	      </tr>
	    
        <tr>
	      <td>
          <%
		   while(res2.next())
		   {
			%>
            <%=res2.getString(4)%>
			<%
			  ansUid=res2.getString(3);
              break;
			}
		  %>
          &nbsp;</td>
	      </tr>
	    
        <tr>
	      <td> <strong>answer by:</strong>
            <%
			    p1.setString(1,ansUid);
				ResultSet r=p1.executeQuery();
				while(r.next())
				{
            %>
                  <%=r.getString(1)%> ( <%=r.getString(2)%> )
            <%
			    break;
				}
			%>
          &nbsp;</td>
	      </tr>
	    
        <tr>
	      <td>&nbsp;
	        <div align="right"><button type="button" onclick="alert('You must be Logged In to use this feature !')">MORE</button></div>
            <hr></td>
	      </tr>
      </table>
      <%
		}

	  %>
      </td>
      <%

   }
   catch(Exception e)
   {
	   e.printStackTrace();
	   }
	  %>
    </tr>
    <tr>
      <td height="34" bgcolor="#179AC4"><jsp:include page="footer.jsp" flush="true"/>&nbsp;</td>
    </tr>
  </table>
</div>

<script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}
</script> 

</body>
</html>