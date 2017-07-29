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
   boolean flag=false;
   String userId=(String)session.getAttribute("userId");
   System.out.println("userId:::::"+userId);
   Connection con=Dbinfo.con;
   String query="select * from follow where userId=?";
   String query1="select name from registration where userId=?";
   String questionsQuery="select question from question_bank where questionId=?";
   String answerQuery="select * from answer_bank where questionId=?";
  try{
   PreparedStatement p=con.prepareStatement(query);
   PreparedStatement p1=con.prepareStatement(query1);
   PreparedStatement qp=con.prepareStatement(questionsQuery);
   PreparedStatement ap=con.prepareStatement(answerQuery);
   p.setString(1,userId);
   
   ResultSet res=p.executeQuery();
   System.out.println("res generated::::");
%>

<div align="center">
  <table width="1028" height="534" border="0">
    
    <tr>
      <td width="974" height="150" bgcolor="#FFFFFF"><jsp:include page="UserHeader.jsp" flush="true"/> &nbsp;</td>
    </tr>
  
    <tr>
      <td bgcolor="#FFFFFF">&nbsp;
        <table width="983" height="270" border="0">
          
          <tr>
    
            <td width="167" height="244"> 
                <jsp:include page="SideMenu.jsp" flush="true"/> &nbsp;
                <div align="center"></div>  
            </td>
             <form action="MyQuestion.jsp" method="post">
             <td width="800">
            
            <label for="question"></label>
              <input type="text" name="question" id="question" placeholder="What is your question ?" style="height:35px; width:600px"/>
              <input type="submit" name="submit" id="submit" value="ASK" class="btn danger" />
            </div></td>
            </form>
            
            <tr>
            <td></td>
            <td width="800">
            
                    
                  <% 
                    while(res.next())
					{ 
                      flag=true;
					  String followingId=res.getString(2);
					  String questionId=res.getString(3);
					  p1.setString(1,followingId);
					   System.out.println("Question Id:::::"+questionId);
					  qp.setString(1,questionId);
					  ap.setString(1,questionId);
					  ResultSet res1=p1.executeQuery();
					  res1.next();
					  ResultSet qres=qp.executeQuery();
					  qres.next();
					  ResultSet ares=ap.executeQuery();
					  
					  System.out.println("res1 generated");
					  
					  
				  %>
                    <table width="806" border="0" align="left">
                       
                       <tr>
                          <td width="166"><em><strong><h2><%=qres.getString(1)%></h2></strong></em></td>
                       </tr>
                       <tr>
                         
                         
                            <input type="hidden" name="followingId" value=<%=followingId%> />
                            <input type="hidden" name="questionId" value=<%=questionId%> />
                            <td> asked by: <%=res1.getString(1)%></td>
                              &emsp; &emsp; &emsp; &emsp; 
                        	
                         
                          
                       </tr>
                       <br>
                       
                       <tr><td>
                           
                           <%
						     while(ares.next())
							 {
						       p1.setString(1,ares.getString(3));
							   res1=p1.executeQuery();
							   res1.next();
						   %> 
                              <table width="785" height="55" border="0">
                               <tr>
                                 <td width="196"><%=ares.getString(4)%></td>
                               </tr>
                               <tr>
                                 <td>answered by: <%=res1.getString(1)%></td>
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
					if(!flag){
				 %>
                  <h2 fcolor="blue">You are not having any followed stories !<h2>
                 <%
				    }
				 %>
                 
            </td>
            </tr>
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