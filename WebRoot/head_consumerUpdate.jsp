<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>ǰ̨-�����û���¼��Ϣ</title>
<%@ page language="java" import="java.util.*" %>
</head>
<%
com.wy.form.ConsumerForm consumerForm=(com.wy.form.ConsumerForm)session.getAttribute("form");
%>
<body>
<jsp:include page="head_top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
      <td width="200" valign="top">
	  <jsp:include page="head_right.jsp" flush="true" />
	  </td>
    <td height="846" valign="top">
		<jsp:include page="head_Consumer.jsp" flush="true" />&nbsp;
		  <%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;�����û���Ϣ</p>");%>
		  <form name="form" method="post" action="ConsumerServlet?method=6&id=<%=consumerForm.getId() %>" onSubmit="return hostUpdate()">
		  
            <table width="400" border="1" align="center" cellpadding="1" cellspacing="1">
              <tr>
                <td width="100" height="30"><div align="center">�û�����</div></td>
                <td width="300" bgcolor="#FFFFFF"><div align="center"><input name="account" type="text" size="40" value="<%=consumerForm.getAccount()%>" readonly="readonly" onclick="alert('���ı�������Ϊֻ�����û������޸�')"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">���룺</div></td>
                <td><div align="center"><input name="password" type="password" size="40" value="<%=consumerForm.getPassword()%>"></div></td>
              </tr>
			   <tr>
                <td height="30"><div align="center">�ظ����룺</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="repeatPassword" type="password" value="<%=consumerForm.getPassword()%>"  size="40">
                </div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">������</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="name" type="text" size="40" value="<%=consumerForm.getName()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">�Ա�</div></td>
                <td bgcolor="#FFFFFF"><div align="center">
				<input name="sex" type="radio" value="��" <%if(consumerForm.getSex().trim().equals("��")){%>checked<%}%> >
       			 ��
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="sex" type="radio" value="Ů" <%if(consumerForm.getSex().trim().equals("Ů")){%>checked<%}%> > 
        		Ů
		</div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">QQ���룺</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="QQnumber" type="text" size="40" value="<%=consumerForm.getQQNumber()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">��ҳ��</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="mainPage" type="text" size="40" value="<%=consumerForm.getMainPage()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">��Ȥ���ã�</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="interest" type="text" size="40" value="<%=consumerForm.getInterest()%>"></div></td>
              </tr>
              <tr>
                <td height="30"><div align="center">�������䣺</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="eMail" type="text" size="40" value="<%=consumerForm.getEMail()%>"></div></td>
              </tr>
            </table>
            <div align="center"><br>
              <input type="image" src="images/save.gif">
            </div>
		  </form>
		</td>
  </tr>
</table>
<jsp:include page="head_down.jsp" flush="true" />
</body>
</html>
