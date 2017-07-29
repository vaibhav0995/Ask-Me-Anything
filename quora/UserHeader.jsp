<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<style>
.btn {
    border: none;
    color: white;
    padding: 14px 26px;
    font-size: 16px;
    cursor: pointer;
}

.info {background-color: #179AC4;} /* Blue */
.info:hover {background: #2E4358;}

.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}

.default {background-color: #e7e7e7; color: black;} /* Gray */ 
.default:hover {background: #ddd;}

</style>
</head>

<body>

<table width="983" border="0">
  <tr>
    <td colspan="3"><img src="Images/ask-me-anything-title.jpg" width="983" height="301" alt="N.A." /></td>
  </tr>
  <tr>
    <td width="704" bgcolor="#FFFFFF"><div align="right">
     <!-- <input type="submit" name="read" id="read" class="btn info" value="READ"/> -->
    </div></td>
    <td width="139"><div align="right">
     <!-- <input type="submit" name="answer" id="answer" class="btn info" value="ANSWER" /> -->
    </div></td> 
    
    <form action="Profile.jsp" method="post">
    <td width="131"><div align="right">
      <div align="right">
        <input type="submit" name="profile" id="profile" class="btn info" value="PPROFILE" />
      </div>
    </td>
    </form>
  </tr>
</table>

</body>
</html>