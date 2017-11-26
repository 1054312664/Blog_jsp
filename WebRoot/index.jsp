<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户登录</title>
<link href="CSS/style.css" type="text/css" rel="stylesheet">
<script src="JS/validate.js" language="javascript" type="text/javascript"></script>
</head>
<body onselectstart="return false">

<form name="form1" method="post" action="ConsumerServlet?method=0&sign=0" onSubmit="return userCheck()">
<table width="291" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td height="30" colspan="2" align="center">
	&nbsp;</td>
	</tr>
  <tr>
    <td width="66" height="30">用户名：</td>
    <td width="225">
      <input name="account" type="text" id="account" size="30" style="width: 200px; ">
    </td>
  </tr>
  <tr>
    <td height="30">密&nbsp;码：</td>
    <td><input name="password" type="password" id="password" size="30" style="width: 200px; "></td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="center">
	    <input type="image" class="inputinputinput" src="images/land.gif">
             &nbsp;&nbsp;
        <a href="#" onClick="javascript:form1.reset()"><img src="images/reset.gif"></a>
        &nbsp;&nbsp;
		<a href="consumer/accountAdd.jsp"><img src="images/register.gif"></a>
   </td>
  </tr>
</table>
</form>
</body>
</html>
