<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="p1.Dbinfo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>

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
    background-color: #EFF3F9; /* Red */
    color: black;
    margin-bottom: 7px;
}
.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}
</style>
</head>

<body>


<%
   DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
   String sdate = df.format(new java.util.Date());
   //System.out.println("Date before 7 days: "+(String)sdate.minusDays(7));
   
   String dt = sdate;
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   Calendar c = Calendar.getInstance();
   c.setTime(sdf.parse(dt));
   c.add(Calendar.DATE, -3);  
   dt = sdf.format(c.getTime());  
   System.out.println("Date before 3 days: "+dt+" Today::::::"+sdate);
   Connection con=Dbinfo.con;
   String query="select * from Question_Bank where sdate >= ? order by number DESC";
   String query1="select * from Registration where userId=?";
   String query2="select * from Answer_Bank where questionId=?";
   String query3="select count(notify) from notifications where notify=?";
  try{
   PreparedStatement p=con.prepareStatement(query);
   PreparedStatement p1=con.prepareStatement(query1);
   PreparedStatement p2=con.prepareStatement(query2);
   PreparedStatement p3=con.prepareStatement(query3);
   
   String id=(String)session.getAttribute("userId");
   System.out.println("Value of id:::::"+id);
   p3.setString(1,id);
   p.setString(1,dt);
   ResultSet res=p.executeQuery();
   ResultSet resnote=p3.executeQuery();
   resnote.next();
   int flag=Integer.parseInt(resnote.getString(1));
   System.out.println("Value of flag:::::"+flag);
   String userId="";
   String questionId="";
   String ansUid="";
   
%>

<div align="center">
  <table width="983" height="534" border="0">
<tr>
      <td width="983" height="150" bgcolor="#FFFFFF"><jsp:include page="UserHeader.jsp" flush="true"/> &nbsp;</td>
    </tr>
    <%
	  if(flag>0)
	  {
	%>
      <tr><td width="500" align="right"><a href="Notifications.jsp" style="color:#4FA22A; text-decoration:none"><h3>you have <%=flag%> notifications !</h3></a></td></tr>
    <%
	  }
	%>
    <tr>
      <td bgcolor="#FFFFFF">&nbsp;
        <table width="983" height="534" border="0">
          
          <form action="MyQuestion.jsp" method="post">
          <!--<tr>
            <td colspan="2"><div align="center">
              <label for="question"></label>
              <input type="text" name="question" id="question" placeholder="What is your question ?" style="height:35px; width:600px"/>
              <input type="submit" name="submit" id="submit" value="ASK" class="btn danger" />
            </div></td>
          <tr>
          </form> -->
            <td width="167"> 
                <jsp:include page="SideMenu.jsp" flush="true"/>  &nbsp;
                <div align="center"></div>  
            </td>
      
            <td width="800">
            
            <label for="question"></label>
              <input type="text" name="question" id="question" placeholder="What is your question ?" style="height:35px; width:600px"/>
              <input type="submit" name="submit" id="submit" value="ASK" class="btn danger" />
            </div></td>
            </form>
        
         <%
  
			   while(res.next())
			   {
				userId=res.getString(2);
				questionId=res.getString(1);
			    p1.setString(1,userId);
				p2.setString(1,questionId);
				ResultSet res1=p1.executeQuery();
				ResultSet res2=p2.executeQuery();
         %>

    <tr>
    <td></td>
    <td colspan="2" align="center"><div class="vg" align="center">
     <form action="Follow.jsp" method="get">
       <table width="800" border="0">
	    <tr>
	      <td><strong><em> <h2><%=res.getString(3)%> </h2></em></strong>
		  &nbsp;</td>
        </tr>
	     
        <tr>
	      <td><strong>asked by :</strong> 
          <%
		   String askedId=res.getString(2);
		    while(res1.next())
		   {
			%>
             <%=res1.getString(1)%>
             
             <input type="hidden" name="askedId" value=<%=askedId%> /> 
             <input type="hidden" name="followquestionId" value=<%=questionId%> />

			<%
			}
		  %>
        &emsp; &emsp; &emsp; &emsp; <input type="submit" value="FOLLOW" onclick="return change(this);" /> &nbsp;</td>
        </tr>
	   </form>
        <tr>
	      <td>
          <%
		   while(res2.next())
		   {
			%>
               
               <table width="792" height="98">
               <br><br>
                <tr>
			     <td><%=res2.getString(4)%></td>
                  <%
				     ansUid=res2.getString(3);
				  %>   
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
          &nbsp;
              <!-- &emsp; &emsp;<input type="checkbox" name="bookmark" id="bookmark" />
               <label for="bookmark">Bookmark</label> -->
            </td>
	      </tr>
               </table>
	      
		  <% 
			}
		  %>
          &nbsp;</td>
        </tr>
        <form action="MyAnswer.jsp" method="get">
        <tr>
	      <td>&nbsp;
              <div align="left">
              <label for="question"></label>
              <input type="text" name="answer" id="answer" placeholder="write your answer " style="height:25px; width:400px"/>
             &ensp; 
             <input type="submit" name="submit" id="submit" value="Submit" style="height:20px; width:80px"/>
            
             <input type="hidden" name="questionId" value=<%=questionId%> />
             
            </div>
          </td>
        </tr>
      </table>
      </td><tr>
       </form>
      <%
		}

	  %>
      </td></td>
      <%

   }
   catch(Exception e)
   {
	   e.printStackTrace();
	   }
	  %>
            
            
            &nbsp;</td>
          </tr>
          <tr>
             <td></td>
             <td>
             <div class="vg" align="center">
                       <a href="UserViewMore.jsp" style="color:#A18EA4; text-decoration:none"><h2>View Old Stories</h2></a>
                     </div>       
             </td>
          </tr>
  </table>
</div>
 <script>
function changeText(id) {
    id.innerHTML = "view less";
}
</script>

<script type="text/javascript">
function change( el )
{
    if ( el.value === "FOLLOW" )
	{
        el.value = "UNFOLLOW";
	     //location.reload();
	}
	else
        el.value = "FOLLOW";
}
</script>  

<script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no-back-button";}
</script> 


</body>
</html>