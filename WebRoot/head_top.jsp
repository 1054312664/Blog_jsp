<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
.style1 {color: #c97802}
.style2 {color: #976600}
-->
</style>
</head>
<%
//�жϷ�����form�Ƿ����
if(session.getAttribute("form")==null){
out.print("<script language=javascript>alert('���Ѿ���������Ͽ��������µ�¼��');window.location.href='index.jsp';</script>");
}
//��ҳ������
Integer number=1;
if(application.getAttribute("number")!=null){
  number=(Integer)application.getAttribute("number");
  number++;
}
application.setAttribute("number",number);
//������Ϣ
com.wy.dao.ConsumerDao consumerDao=new com.wy.dao.ConsumerDao();
com.wy.form.ConsumerForm consumerForm1=(com.wy.form.ConsumerForm)session.getAttribute("form");
java.util.List consumerlist=consumerDao.getConsumerList("�߼�");
//����������Ӧ��
%>


<script language="javascript" src="JS/validate.js"></script>
<body>

<table width="700" height="26" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
	         <marquee direction="left" scrollAmount="1" scrollDelay="1" class="tdtd">
            <span class="style4 style1">��ӭ�������ҵĲ������,��������ҷ����������п���,��Ը����½��лظ�.</span>
      </marquee></td>
  </tr>
</table><table width="780" height="71" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780"><table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
      <%
        for(int host=0;host<consumerlist.size();host++){
        com.wy.form.ConsumerForm consumerHostForm=(com.wy.form.ConsumerForm)consumerlist.get(host);
         %>
      <tr>
        <td  height="20"><span class="style1">������Ϣ&nbsp;��<a href="dealwith.jsp?sign=2">���µ�¼</a>��</span></td>
        <td colspan="2">
          <%if(consumerForm1.getManageLevel().equals("�߼�")){%>
          <div align="right"><span class="style2">��</span><a href="backMainPage.jsp" class="in">�����̨</a><span class="style2">��&nbsp;</span></div>
          <%}%>
        </td>
      </tr>
      <tr>
        <td height="20"><span class="style3 style2">������<%=consumerHostForm.getName()%></span></td>
        <td width="240"><span class="style3 style2">�Ա�<%=consumerHostForm.getSex()%></span></td>
        <td width="240"><span class="style3 style2">��Ȥ��<%=consumerHostForm.getInterest()%></span></td>
      </tr>
      <tr>
        <td height="20"><span class="style3 style2">QQ���룺<%=consumerHostForm.getQQNumber()%></span></td>
        <td><span class="style3 style2">E-Mail��<%=consumerHostForm.getEMail()%></span></td>
        <td><span class="style3 style2">��ҳ��<%=consumerHostForm.getMainPage() %></span></td>
      </tr>
      <%} %>
    </table></td>
  </tr>
</table>
</body>
</html>
