<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<%
if(session.getAttribute("form")==null){
out.print("<script language=javascript>alert('您已经与服务器断开，请重新登录！');window.location.href='index.jsp';</script>");
}
%>
<script language="javascript" src="JS/onclock.js"></script>
<body width="800" onselectstart="return false" onLoad="clockon(bgclock)">

<table width="800" height="65" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="500"><div id="bgclock"></div></td>
    <td width="300">
    <a href="head_main.jsp">我的首页</a>&nbsp;&nbsp; <a href="backMainPage.jsp">管理博客</a>&nbsp;&nbsp; <a href="dealwith.jsp?sign=2">安全退出</a></td>
  </tr>
</table><hr style="width: 800px; "/>
</body>
</html>