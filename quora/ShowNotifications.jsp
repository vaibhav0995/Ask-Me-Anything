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
   System.out.println("QuestionId::::::"+request.getParameter("qid"));
   String notificationId=request.getParameter("nid");
   String questionId=request.getParameter("qid");
   String notificationType=request.getParameter("ntype");
   Connection con=Dbinfo.con;
   String query1="select name from registration where userId=?";
   String questionsQuery="select * from question_bank where questionId=?";
   String answerQuery="select * from answer_bank where questionId=?";
   String query="delete from notifications where notificationid=?";
  try{
   PreparedStatement p1=con.prepareStatement(query1);
   PreparedStatement qp=con.prepareStatement(questionsQuery);
   PreparedStatement ap=con.prepareStatement(answerQuery);
   PreparedStatement ps=con.prepareStatement(query);
   
   ps.setString(1,notificationId);
   ps.executeUpdate();
   qp.setString(1,questionId);
   
   ResultSet res=qp.executeQuery();
   System.out.println("res generated::::");
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
					  p1.setString(1,res.getString(2));
					  ResultSet res1=p1.executeQuery();
					  res1.next();
					  ap.setString(1,res.getString(1));
					  ResultSet ares=ap.executeQuery();
					  
				  %>
                    <table border="0" align="left">
                       
                       <tr>
                          <td><em><strong><h2><%=res.getString(3)%></h2></strong></em></td>
                       </tr>
                       <tr>
                            <td><strong><em>asked by:</em></strong> <%=res1.getString(1)%></td>
                             
                       </tr>
                       <br>
                       <br>
                       <tr><td>
                           
                           <%
						     while(ares.next())
							 {
						       p1.setString(1,ares.getString(3));
							   res1=p1.executeQuery();
							   res1.next();
						   %> 
                              <table border="0">
                               <tr>
                                 <td><%=ares.getString(4)%></td>
                               </tr>
                               <tr>
                                 <td><strong><em>answer by:</em></strong> <%=res1.getString(1)%></td>
                               </tr>
							  </table>
							<br>
							<%
							
							 }
							%>
                       </td></tr>
                       
                       
                  </table>
                
                <%
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