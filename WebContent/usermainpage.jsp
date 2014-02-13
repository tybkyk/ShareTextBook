<%@page import="java.util.ArrayList"%>
<%@page import="readlist.dao.readlistdao"%>
<%@page import="readlist.information.readlistinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String uid=null;
	String uname = null;
	uid = "1";//假定用户uid为1  实际把下面注释取消
	/*try {
		uid = (String) session.getAttribute("uid");
	} catch (Exception e) {
	}*/
	try {
		uname = (String) session.getAttribute("uname");
	} catch (Exception e) {
	}
	if (uname == null)
		response.sendRedirect("userlogin.jsp");//这句话的用处如果通过url进来而不是用户的话就直接跳转到登陆界面
%>
<%
	readlistdao bookmark = new readlistdao();
	readlistinfo rli = new readlistinfo();
	ArrayList<readlistinfo> bk = new ArrayList<readlistinfo>();
	int flag = 1;
	try {
		bk = bookmark.findbookmark(uid);
		if (bk.size() == 0) {
			out.print("这个用户bookmark表里面没东西");//如果结果集返回是空不用出错
			flag = 0;//结果集为空；
		}
	} catch (IndexOutOfBoundsException e) {
		System.out.println("arraylist打开异常");
		e.printStackTrace();
	}
%>
<head>
<style type="text/css">
div#container {
	width: 960px
}

div#header {
	background-color: #99bbbb;
}

div#menu {
	background-color: #dddddd;
	height: 500px;
	width: 200px;
	float: left;
}

div#content {
	background-color: #EEEEEE;
	height: 500px;
	width: 760px;
	float: left;
}

div#footer {
	background-color: #99bbbb;
	clear: both;
	text-align: center;
}

h1 {
	margin-bottom: 0;
}

ul {
	margin: 0;
}

li {
	list-style: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=uname%>'s MainPage</title>
</head>

<body>
	<div id="container">
		<div id="header">
			<h1>User MainPage</h1>
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
					if (flag == 1) {//如果有结果集则显示
						for (int i = 0; i < bk.size(); ++i) {
							rli = bk.get(i);
				%>
				<%
					if (i == 0) {
				%>
				<tr>
					<th>你所看的书名</th>
					<th>你所看到的章节</th>
					<th>读书链接</th>
				</tr>
				<%
					}
				%>
				<tr>
					<td><%=rli.getBookName()%></td>
					<td><%=rli.getChapter()%></td>
					<td><a
						href="readbook.jsp?bid=<%=rli.getBookId()%>&chapter=<%=rli.getChapter()%>">点我继续阅读</a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>