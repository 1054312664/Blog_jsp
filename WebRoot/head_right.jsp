<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>
<%@ page language="java" import="java.util.*" %>
<%! String days[]; %>
<%
days=new String[42];
for(int i=0;i<42;i++)
{
days[i]="";
}
%>

<%
GregorianCalendar currentDay = new GregorianCalendar();
int today=currentDay.get(Calendar.DAY_OF_MONTH);
int month=currentDay.get(Calendar.MONTH);
int year= currentDay.get(Calendar.YEAR);
Calendar thisMonth=Calendar.getInstance();
thisMonth.set(Calendar.MONTH, month );
thisMonth.set(Calendar.YEAR, year );
thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
thisMonth.set(Calendar.DAY_OF_MONTH,1);
int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i=0;i<maxIndex;i++)
{
days[firstIndex+i]=String.valueOf(i+1);
}
%>
<body onselectstart="return false">


	<table width="200"  height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><a href="head_main.jsp"><input id="Button1" type="button" value="首页" style="width: 190px; height: 30px"></a></td>
      </tr>
    </table>
    <table width="200"  height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><a href="head_ArticleList.jsp"><input id="Button2" type="button" value="文章" style="width: 190px; height: 30px"></a></td>
      </tr>
    </table>
    <table width="200"  height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><a href="head_photoSelect.jsp"><input id="Button3" type="button" value="相册" style="width: 190px; height: 30px"></a></td>
      </tr>
    </table>
      <table width="200" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/head_16.jpg" width="184" height="16"></td>
        </tr>
        <tr>
          <td><img src="images/head_17.jpg" width="184" height="17"></td>
        </tr>
      </table>
      <table width="200" height="179" border="0" cellpadding="0" cellspacing="0" background="images/head_18.jpg" bgcolor="#FAFAFA">
        <tr>
          <td>
            <table width="180" height="81" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="CBB180">
              <tr bgcolor="FFFCF1">
                <td height="15" colspan="7" align="center"><%=year%>年<%=month+1%>月</td>
              </tr>
              <tr bgcolor="C9B65A">
                <td width="25" height="15" ><font color="red">日</font> </td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">一</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">二</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">三</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">四</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">五</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><font color="red">六</font></td>
              </tr>
              <% for(int j=0;j<6;j++) { %>
              <tr bgcolor="FFFCF1">
                <% for(int i=j*7;i<(j+1)*7;i++) { %>
                <td width="25" height="15" align="center" valign="middle">
                  <%if((i-firstIndex+1)==today){
%>
                  <b> <font color="red"><%=days[i]%></font></b>
                  <%
} else {
%>
                  <%=days[i]%>
                  <%
}
%></td>
                <% } %>
              </tr>
              <% } %>
          </table></td>
        </tr>
</table>
      <table width="200" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/head_23.jpg" width="200" height="34"></td>
        </tr>
      </table>
      <table width="200" height="96" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" align="center"><a href="http://howlove.cc" title="请单击">Aoda'Cat</a></td>
        </tr>
      </table>
</body>
</html>
