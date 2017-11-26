<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.ArticleTypeForm"/>
<jsp:directive.page import="com.wy.form.ArticleForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-全部文章</title>
<%@ page language="java" import="java.util.*" %>
</head>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<jsp:useBean id="articleTypeDao" scope="session" class="com.wy.dao.ArticleTypeDao"></jsp:useBean>
<jsp:useBean id="articleDao" scope="session" class="com.wy.dao.ArticleDao"></jsp:useBean>
<jsp:useBean id="restoreDao" scope="session" class="com.wy.dao.RestoreDao"></jsp:useBean>
<%
Integer typeId=null;
if(request.getParameter("typeId")!=null){
typeId=Integer.valueOf(request.getParameter("typeId"));
}
String str=(String)request.getParameter("Page");
int Page=1;
List articleList=null;
if(str==null){
	articleList=articleDao.queryArticle(typeId);
	int pagesize=5;      //指定每页显示的记录数
	articleList=pagination.getInitPage(articleList,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	articleList=pagination.getAppointPage(Page);     //获取指定页的数据
}
%>
<body>
<jsp:include page="head_top.jsp" flush="true" />



<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td width="200" valign="top">
	  <jsp:include page="head_right.jsp" flush="true" />
    </td>
    <td height="846" valign="top">
<table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
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
<hr>
<%
for(int articleI=0;articleI<articleList.size();articleI++){
	ArticleForm articleForm=(ArticleForm)articleList.get(articleI);
	String articleContent=articleForm.getContent();
	if(articleContent.length()>100){
		articleContent=articleContent.substring(0,100)+"...";
}
%>
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
    <td height="17" align="right"><%=articleForm.getPhTime()%>&nbsp;|&nbsp;阅读（<%=articleForm.getNumber()%>）&nbsp;|&nbsp;回复（<%=restoreDao.queryRestore(articleForm.getId()).size()%>）</td>
  </tr>
</table>
<hr>
<%} %>
 <%=pagination.printCtrl(Page) %>
</td>
    
  </tr>
</table>
<jsp:include page="head_down.jsp" flush="true" />
</body>
</html>
