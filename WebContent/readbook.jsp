<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dbmannerger.dbconnector" %>   
<%@page import= "java.sql.*; " %> 
    
<%@ page session="true"%>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme() + "://"
   + request.getServerName() + ":" + request.getServerPort()
   + path + "/";
%>


  <%!
    public ResultSet GetRs(final String SQL) {
	  
	  dbconnector dbcon = new dbconnector();
      Connection con = null;
      Statement stmt = null;

      try {
          con = dbcon.initDB();
          stmt = con.createStatement();

     ResultSet rs = stmt.executeQuery(SQL);
     return rs;
    
 } catch (SQLException e) {
  System.out.println("记录数量获取失败！");
  return null;
 }
    }
 %>


<%
//当前页码
int pageNo = 1;
//最大页数
int MAX_PAGE_NUM;
//每页的开始页
int chapter=1;
//从请求中获取分页变量的值

String chapter1=request.getParameter("chapter");
//接受从go中传来的页面数
String GoPage=request.getParameter("GoPage");


if(chapter1!=null)
{
	chapter=Integer.parseInt(chapter1);
	pageNo=chapter;
	
}

if(GoPage!=null)
{
	chapter=Integer.parseInt(GoPage);
	pageNo=chapter;
}


//查询最大页数
String id = request.getParameter("bid") ;
   
 int CountPage = 0;
     ResultSet rs = GetRs("select * from books where bid=" + id);
     
     while(rs.next()) 
  	{
    	CountPage = CountPage + 1;
  	}
     
     MAX_PAGE_NUM = CountPage;
     //System.out.print(MAX_PAGE_NUM);

 %> 
 
 
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>read</title>

<script language="javascript">
//下拉列表框实现翻页
function GoPageSelect(flag)
{
	window.location.href="readbook.jsp?GoPage="+form1.textPage.value+"";
}
//输入相应页数时候点击按钮进行翻页
function GoPageText(id)
{
	var chapter=document.getElementById("textPage").value;
	window.location.href="readbook.jsp?chapter="+chapter+"&bid="+id;
;
}
</script>
  </head>
  
  
  <body>
  <form id="form1">
  <table width="100%" border="1" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC">
  
  <%
     rs = GetRs("select * from books where bchapter="+chapter+" and bid='"+id+"'" );
     //int CurrentPage = 0;
     
     while(rs.next()) 
 	{
    	// CurrentPage= rs.getInt("chapter");
    %>
    	 <%= rs.getString("content")  %>
     	
     <%  	
 	}
     %> 
     
     
  </table>
    <table width="100%" border="1" cellpadding="3" cellspacing="1" > 
<tr> 
<td valign="top" > 
<div align="left"> 

</div></td> 
</tr> 
</table> 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor=> 
 <tr>
 <td>
 	<a href="readbook.jsp?id=<%=id%>&chapter=1">首页</a>
 </td>
 <td>
 	<% if(pageNo>1)
 	{%>
    <a href="readbook.jsp?id=<%=id%>&chapter=<%=(chapter-1) %>">上一页</a>
    <%}
    else
    { %>
    上一页
   <% } %>
 </td>
 <td>
 	<% if(pageNo<MAX_PAGE_NUM)
 	{%>
    <a href="readbook.jsp?id=<%=id%>&chapter=<%=(chapter+1) %>">下一页</a>
     <%}
    else
    { %>
    下一页
   <% } %>
 </td>
 <td>
    <a href="readbook.jsp?id=<%=id%>&chapter=<%=MAX_PAGE_NUM %>">末页</a>
 </td>
 <td>
 	第<%=pageNo %>/<%=MAX_PAGE_NUM %>页
 </td>
 <td>
 
 <select name="SelectPage" onchange="GoPageSelect()">
 <% for(int i=0;i<MAX_PAGE_NUM;i++)
	 {%>
	 <option value="<%=i+1 %>"
	<% if(pageNo==i+1)
	{%> 
	selected
	<%} %>
	 >
	 <%=i+1 %>
	 </option>
	 <%} %>
	 </select>
 </td>
 <td>
 <input type="text" id="textPage" name="textPage" value="<%=pageNo%>"> 
 </td>
 
 <td>
 	<input type="button" name="go" value="Go" onclick="GoPageText(<%=id %>)"  />
 </td>
 
 </tr>
</table>
  </body>
  </form>
  
    <form id="form2"  action = "topdfservlet" method = "post" >
    <td>
 	<input type="submit" name="pdf" value="PDF" />
 </td>
    </form>
  
  

</html>
