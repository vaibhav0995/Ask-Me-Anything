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
   boolean flag=true;
   String userId=(String)session.getAttribute("userId");
   System.out.println("userId:::::"+userId);
   Connection con=Dbinfo.con;
   
   String questionsQuery="select question from question_bank where questionId=?";
   String answerQuery="select * from answer_bank where userId=?";
  try{
   PreparedStatement qp=con.prepareStatement(questionsQuery);
   PreparedStatement ap=con.prepareStatement(answerQuery);
   ap.setString(1,userId);
   
   ResultSet res=ap.executeQuery();
   System.out.println("res generated::::");
%>

<div align="center">
  <table width="1028" height="534" border="0">
    
    <tr>
      <td width="974" height="150" bgcolor="#FFFFFF"><jsp:include page="UserProfileHeader.jsp" flush="true"/> &nbsp;</td>
    </tr>
    
    <tr>
      <td bgcolor="#FFFFFF">&nbsp;
        <table width="983" height="534" border="0">
          
          <tr>
    
            <td width="167"> 
                <jsp:include page="ProfileSideMenu.jsp" flush="true"/>  &nbsp;
                <div align="center"></div>  
            </td>
      
            
            
            <td width="800">
            
                    
                  <% 
                    while(res.next())
					{ 
                      flag=false;
					  String questionId=res.getString(1);
					  qp.setString(1,questionId);
					  ResultSet qres=qp.executeQuery();
					  System.out.println("Question Id:::::"+questionId);
					  qres.next();
					  
					  
				  %>
                    <table width="800" border="0" align="left">
                       
                       <tr>
                          <td><em><strong><h2><%=qres.getString(1)%></h2></strong></em></td>
                       </tr>
                       <br>
                       <tr>
                          <td><%=res.getString(4)%></td>
                       </tr>
                       <br>
                       <form action="edit.jsp" method="get">
                       <tr><td>
                          <input type="hidden" name="answerId" value="<%=res.getString(2)%>"/>
                          <input type="text" name="answer"  id="answer" placeholder="edit your answer here" style="height:25px; width:400px"/>
                          &emsp;&emsp;&emsp;
                          <input type="submit" name="edit" value="edit"/>
                       </td></tr>
                       </form>
                       
                  </table>
                
                <%
					}
					if(flag)
					{
				 %>
                       <h2 align="center">No answers to edit !</h2>       
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