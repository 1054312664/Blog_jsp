<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.PhotoForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-相片查询</title>
<%@ page language="java" import="java.util.*" %>
</head>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<jsp:useBean id="photoDao" class="com.wy.dao.PhotoDao" scope="session"></jsp:useBean>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=photoDao.queryPhoto();
	int pagesize=6;      //指定每页显示的记录数
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
  <td width="200" valign="top">
	  <jsp:include page="head_right.jsp" flush="true" />
	  </td>
    <td height="846" valign="top">
    <table width="341" border="1" align="center" cellpadding="1" cellspacing="1">
      <%for(int i=0;i<list.size();i++){
  PhotoForm photoForm=(PhotoForm)list.get(i);
if(i % 2 ==0 ){
%>
      <tr>
        <td width="200"><div align="center">
            <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="150"><div align="center"><a href="#" onClick="window.open('photoSelectOne.jsp?image=<%=photoForm.getPhotoAddress()%>','','width=900,height=800');"><img src="<%=photoForm.getPhotoAddress()%>" width="180" height="140"></a></div></td>
              </tr>
              <tr>
                <td height="20"><div align="center"><%=photoForm.getPhotoDescription()%></div></td>
              </tr>
              <tr>
                <td height="20"><div align="center"><%=photoForm.getPhtoTime()%></div></td>
              </tr>
            </table>
        </div></td>
        <%}else{%>
        <td width="200"><div align="center">
            <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="150"><div align="center"><a href="#" onClick="window.open('photoSelectOne.jsp?image=<%=photoForm.getPhotoAddress()%>','','width=900,height=800');"><img src="<%=photoForm.getPhotoAddress()%>" width="180" height="140"></a></div></td>
              </tr>
              <tr>
                <td height="20"><div align="center"><%=photoForm.getPhotoDescription()%></div></td>
              </tr>
              <tr>
                <td height="20"><div align="center"><%=photoForm.getPhtoTime()%></div></td>
              </tr>
            </table>
        </div></td>
      </tr>
      <%}
					}%>
</tr>
    </table>
	    <%=pagination.printCtrl(Page) %>	
    </td>
    
  </tr>
</table>
<jsp:include page="head_down.jsp" flush="true" />
</body>
</html>
