<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="system.comment.*"%>
<%@ page import="dbmannerger.dbconnector"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>comment record</title>
</head>
<body>
	<form action="comment.jsp" method="post">
		<table border="1">
			<caption>所有留言信息</caption>
			<tr bordercolor="#ccc">
				<!-- <td>留言人姓名</td>> -->
				<td>留言时间</td>
				<td>留言标题</td>
				<td>留言内容</td>
			</tr>


			<%
			//从数据库中查询记录显示于此
			ArrayList<commenttable> al=(ArrayList<commenttable>)session.getAttribute("al");
			Iterator<commenttable> iter=al.iterator();
			while(iter.hasNext()){
				commenttable comt=(commenttable)iter.next();		
		 %>

			<tr>
				<td><%=comt.getDate().toString()%></td>
				<td><%=comt.getTitle() %></td>
				<td><%=comt.getContent() %></td>
				<td><a href="deletecommservlet?CommentId=<%=comt.getId() %>">删除</a></td>
				<td><a
					href="servlet/ServletToUserUpdate?userId=<%=comt.getId() %>">修改</a></td>
			</tr>


			<%} %>


		</table>
		<input type="submit" value="留言">
	</form>
</body>
</html>