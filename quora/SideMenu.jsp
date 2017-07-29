<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<table width="200" border="0">
  <tr>
    <td height="41"><a href="User.jsp" id="demo" onclick="myFunction()" style="color:#666; text-decoration:none">Top Stories</a></td>
  </tr>
  <tr>
    <td height="30"><a href="FAnswers.jsp" style="color:#666; text-decoration:none">Followed Stories</a></td>
  </tr>
  <tr>
    <td height="36"><a href="NQuestions.jsp" style="color:#666; text-decoration:none">new Questions</a></td>
  </tr>
  <tr>
    <td height="36"><a href="askedQuestion.jsp" style="color:#666; text-decoration:none">My Questions</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<script>
function myFunction() {
    document.getElementById("demo").style.color = "black";
}
</script>
</body>
</html>