<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<title>博客天空-后台管理</title>
<style type="text/css">
<!--
.style4 {color: #666666}
-->
</style>
</head>

<body>
<jsp:include page="back_Top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="200" valign="top">
		<jsp:include page="back_Left.jsp" flush="true" />   </td>
    <td width="600" valign="top">
     <table width="550" align="center" border="0" cellpadding="0" cellspacing="0">
       <tr>
           <td width="88" height="88"><img src="images/article.jpg" width="81" height="72"></td>
           <td height="88"><a href="back_ArticleAdd.jsp">发表博客文章</a><br>
    	<span class="style4">这里提供最方便的方式来发表你的博客文章，由你选择。</span></td>
         </tr>
         <tr>
           <td height="88"><img src="images/photo.jpg" width="81" height="72"></td>
           <td height="88"><a href="back_PhotoInsert.jsp">相册添加</a><br>
             <span class="style4">这里提供最方便的方式来上传你的照片，由你选择。</span></td>
         </tr>
         <tr>
           <td height="88"><img src="images/manager.jpg" width="81" height="72"></td>
           <td height="88"><a href="ConsumerServlet?method=4">博主设置</a><br>
             <span class="style4">这里提供最方便的方式来设置你自己的个人信息，由你选择。</span></td>
         </tr>

         <tr>
           <td height="88"><img src="images/account.jpg" width="81" height="72"></td>
           <td height="88"><a href="back_consumerSelect.jsp">用户设置</a><br>
             <span class="style4">这里提供最方便的方式来管理可以登录你的博客用户，由你选择。</span></td>
           </tr>
         </table>
</table>
<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>
