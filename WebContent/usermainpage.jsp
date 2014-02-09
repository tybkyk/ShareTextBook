<%@page import="java.util.ArrayList"%>
<%@page import="readlist.dao.readlistdao"%>
<%@page import="readlist.information.readlistinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
session.setAttribute("uname", "YaoKe");
//String id=(String)session.getAttribute("uid");
String id="1";
String name=(String)session.getAttribute("uname");
if(name==null)
	response.sendRedirect("userlogin.jsp");//这句话的用处如果通过url进来而不是用户的话就直接跳转到登陆界面
%>
<%
readlistdao bookmark=new readlistdao();
readlistinfo rli=new readlistinfo();
ArrayList<readlistinfo> bk=new ArrayList<readlistinfo>();
try{
bk=bookmark.findbookmark(id);
if(bk.size()==0)
	out.print("bookmark表里面没东西");//如果结果集返回是空不用出错
}
catch(IndexOutOfBoundsException e)
{
	System.out.println("arraylist打开异常");
	e.printStackTrace();
}

%>
<head>
<style type="text/css">
div#container{width:960px}
div#header {background-color:#99bbbb;}
div#menu {background-color:#dddddd; height:500px; width:200px; float:left;}
div#content {background-color:#EEEEEE; height:500px; width:760px; float:left;}
div#footer {background-color:#99bbbb; clear:both; text-align:center;}
h1 {margin-bottom:0;}
ul {margin:0;}
li {list-style:none;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=name %>'s MainPage</title>
</head>

<body>
<div id="container">
<div id="header">
<h1>User Main Page</h1>
</div>
<div id="menu">
<ul>
<li>aaaaa</li>
<li>bbbbb</li>
<li>ccccc</li>
</ul>
</div>
<div id="content">
<table border="1" cellpadding="10">

<%
for(int i=0;i<bk.size();++i){
	rli=bk.get(i);
%>
<%if(i==0){ %>
<tr>
<td>你所看的书名</td>
<td>你所看到的章节</td>
<td>读书链接</td>
</tr>
<% }%>
<tr>
<td><%=rli.getBookName() %></td>
<td><%=rli.getChapter() %></td>
<td><a href="readbook.jsp?bid=<%=rli.getBookId() %>&chapter=<%=rli.getChapter() %>">点我继续阅读</a></td>
</tr>
<% }%>
</table>
</div>
</div>
</body>
</html>