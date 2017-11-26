<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.ArticleForm"/>
<jsp:directive.page import="com.wy.form.RestoreForm"/>
<jsp:directive.page import="com.wy.form.ConsumerForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-文章详细查询</title>
<%@ page language="java" import="java.util.*" %>
</head>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<jsp:useBean id="consumerDao" class="com.wy.dao.ConsumerDao" scope="request"></jsp:useBean>
<jsp:useBean id="restoreDao" class="com.wy.dao.RestoreDao" scope="session"></jsp:useBean>
<jsp:useBean id="articleDao" class="com.wy.dao.ArticleDao" scope="request"></jsp:useBean>
<%
ConsumerForm consumerForm=(ConsumerForm)session.getAttribute("form");
String id=request.getParameter("id");
ArticleForm articleForm=articleDao.queryArticleForm(Integer.valueOf(id));
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=restoreDao.queryRestore(articleForm.getId());
	int pagesize=3;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
%>
<body>
<jsp:include page="head_top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td width="200" valign="top"><jsp:include page="head_right.jsp" flush="true" />
    </td>
    <td valign="top" width="550" height="846">
<%
out.println("<br><p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;"+articleForm.getTitle()+"</p>");
%>
	  <table width="550" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#fece62">
        <tr>
          <td valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=articleForm.getContent() %></td>
        </tr>
      </table>
	  <table width="550"  border="0">
        <tr>
          <td align="right"><%=articleForm.getPhTime()%>&nbsp;&nbsp;|&nbsp;&nbsp;阅读（<%=articleForm.getNumber()%>）&nbsp;&nbsp;|&nbsp;&nbsp;回复（<%=restoreDao.queryRestore(articleForm.getId()).size()%>）</td>
        </tr>
      </table>
	  <table width="550" border="0" cellspacing="0" cellpadding="0" style="width: 474px; ">
        <tr>
          <td height="36" align="right"><div align="center"><a href="#" onclick="javascript:history.go(-1);"><img src="images/back.gif"></a></div></td>
        </tr>
      </table>  
	  <%if(pagination.getRecordSize()>0){
for(int i=0;i<list.size();i++){
RestoreForm restoreForm=(RestoreForm)list.get(i);
 %>
	  <table width="550"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#fece62">
        <tr>
          <td width="100" bgcolor="#FFFFFF">题目：</td>
          <td width="450" bgcolor="#FFFFFF"><%=restoreForm.getReTitle() %></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF">内容：</td>
          <td bgcolor="#FFFFFF"><%=restoreForm.getReContent() %></td>
        </tr>
        <tr>
          <td colspan="2" bgcolor="#FFFFFF"><div align="right">回复人：<%=consumerDao.getConsumerForm(Integer.valueOf(restoreForm.getReAccount()))%></div></td>
        </tr>
      </table>
	  <%}
	  out.print(pagination.printCtrl(Page,id));}%>
	   <form name="form" method="post" action="ArticleServlet?method=7"  onSubmit="return addRestore()">
	  <table width="550"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#000000">
        <tr>
          <td width="100" bgcolor="#FFFFFF">回复主题：
         </td>
          <td width="450" bgcolor="#FFFFFF"><input name="reTitle" type="text" size="26" style="width: 440px; "></td>
        </tr>
        <tr>
          <td height="139" bgcolor="#FFFFFF">回复内容：</td>
          <td bgcolor="#FFFFFF"><textarea name="reContent" rows="10" style="width: 440px; "></textarea></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF">回&nbsp;复&nbsp;人：</td>
          <td bgcolor="#FFFFFF"><input name="articleId" type="hidden" size="26" value="<%=articleForm.getId()%>"><input name="accountId" type="hidden" size="26" value="<%=consumerForm.getId()%>"><%=consumerForm.getName()%></td>
        </tr>
      </table>
	   <table width="550"  border="0" align="center">
         <tr>
           <td>
             <div align="center">
  <input type="image" class="inputinputinput" src="images/save.gif">
&nbsp;&nbsp;
   <a href="#" onClick="javascript:form.reset()"><img src="images/reset.gif"></a></div></td>
         </tr>
       </table>
	   </form>
  </td>
  </tr>
</table>
<jsp:include page="head_down.jsp" flush="true" />
</body>
</html>
