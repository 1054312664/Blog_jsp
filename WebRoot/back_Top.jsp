<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<%
if(session.getAttribute("form")==null){
out.print("<script language=javascript>alert('���Ѿ���������Ͽ��������µ�¼��');window.location.href='index.jsp';</script>");
}
%>
<script language="javascript" src="JS/onclock.js"></script>
<body width="800" onselectstart="return false" onLoad="clockon(bgclock)">

<table width="800" height="65" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="500"><div id="bgclock"></div></td>
    <td width="300">
    <a href="head_main.jsp">�ҵ���ҳ</a>&nbsp;&nbsp; <a href="backMainPage.jsp">������</a>&nbsp;&nbsp; <a href="dealwith.jsp?sign=2">��ȫ�˳�</a></td>
  </tr>
</table><hr style="width: 800px; "/>
</body>
</html>