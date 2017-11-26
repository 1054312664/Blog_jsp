<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.ArticleTypeForm"/>
<jsp:directive.page import="com.wy.form.ArticleForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-首页</title>
<%@ page language="java" import="java.util.*" %>
</head>
<jsp:useBean id="articleTypeDao" scope="request" class="com.wy.dao.ArticleTypeDao"></jsp:useBean>
<jsp:useBean id="articleDao" scope="request" class="com.wy.dao.ArticleDao"></jsp:useBean>
<jsp:useBean id="restoreDao" scope="request" class="com.wy.dao.RestoreDao"></jsp:useBean>
<%
Integer typeId=null;
List articleList=articleDao.queryArticle(typeId);
int articleNumber=articleList.size();
if(articleNumber>5){
articleNumber=5;
}

%>
<body>
<!--网页头部分-->
<jsp:include page="head_top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td width="200" valign="top">
	  <jsp:include page="head_right.jsp" flush="true" />
    </td>
    <td height="846" valign="top">
		<jsp:include page="head_Consumer.jsp" flush="true" />&nbsp;
<table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" style="width: 500px; ">
    <%
    List list=articleTypeDao.queryArticleType();
    for(int i=0;i<list.size();i++){
    ArticleTypeForm articleTypeForm=(ArticleTypeForm)list.get(i);
    %>
   <a href="head_ArticleList.jsp?typeId=<%=articleTypeForm.getId()%>"> [<%=articleTypeForm.getTypeName()%>]</a>&nbsp;
    <%}%>
    
    </td>
  </tr>
</table>
<%
for(int articleI=0;articleI<articleNumber;articleI++){
ArticleForm articleForm=(ArticleForm)articleList.get(articleI);
String articleContent=articleForm.getContent();
if(articleContent.length()>100){
articleContent=articleContent.substring(0,100)+"...";
}
%><hr>
<table width="550" border="0" align="center">
  <tr>
    <td width="550" height="22"><b><%=articleForm.getTitle()%></b></td>
  </tr>
  <tr>
    <td valign="top"><%=articleContent%></td>
  </tr>
  <tr>
    <td height="17"><a href="head_ArticleForm.jsp?id=<%=articleForm.getId()%>">阅读全文&gt;&gt;</a></td>
  </tr>
  <tr>
    <td height="17" align="right"><%=articleForm.getPhTime()%>&nbsp;|&nbsp;阅读（<%=articleForm.getNumber()%>）&nbsp;|&nbsp;回复（<%=restoreDao.queryRestore(articleForm.getId()).size() %>）</td>
  </tr>
</table>
<%} %>
</td>
  </tr>
</table>
<jsp:include page="head_down.jsp" flush="true" />
</body>
</html>
