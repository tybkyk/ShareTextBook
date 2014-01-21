<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="readlist.information.*"%>
<%@ page import="book.dao.*"%>
<%@ page import="book.information.*"%>
<%@ page import="dbmannerger.dbconnector"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User MainPage</title>
</head>
<body>
	<form action="useraddbookservlet" method="post">

		<table align="center" border="1" style="border-collapse: collapse;">
			<tr>
				<td colspan="2">User Select Book Page</td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td><%= session.getAttribute("name")%></td>
				<td></td>

			</tr>
			<tr>
				<td>图书名：</td>
				<td><input type="text" name="bookname" /></td>
			</tr>
			<tr>
				<td class="tdstyle" colspan="2"><input type="submit"
					value="add" /></td>
			</tr>
		</table>

		<table align="center" border="1">
			<caption>所有书本</caption>
			<tr bordercolor="#ccc">
				<!-- <td>留言人姓名</td>> -->
				<td>书ID</td>
				<td>书名</td>

			</tr>



			<%
			bookdao bdao = new bookdao();
			ArrayList<bookinfo> list=bdao.findAll();
			Iterator<bookinfo> iter=list.iterator();
			while(iter.hasNext()){
				bookinfo b=(bookinfo)iter.next();		
		 %>

			<tr>
				<td><%=b.getBookId()%></td>
				<td><%=b.getBookName() %></td>

				<td><a href="deletecommservlet?CommentId=<%=b.getBookId() %>">删除</a></td>
				<td><a
					href="servlet/ServletToUserUpdate?userId=<%=b.getBookId() %>">修改</a></td>
			</tr>


			<%} %>


		</table>




	</form>