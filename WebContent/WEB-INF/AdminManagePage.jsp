<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="admin.dao.admindao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="system.comment.commenttable"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator MainPage</title>
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

<script type="text/javascript">
var uname=document.getElementById("uname").value;
var bname=document.getElementById("bname").value;
function deletecomment(comid){
	var xmlHttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlHttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	var url = "admincommentservlet?comid=" + comid + "&time=" + new Date().getTime();
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				if (xmlHttp.responseText == "1") {
					$("tr[id="+comid+"]").remove();
					alert("删除成功");
					
				} else if (xmlHttp.responseText == "2") {
					alert("删除错误");
				}
			} else {
				alert("请求失败，错误码=" + xmlHttp.status);
			}
		}
	};
	xmlHttp.send(null);
}
</script>

<%
	String uname = null;
	String bname = null;
	ArrayList<commenttable> commenttables = null;
	int flag = 0;
	commenttable comtable = new commenttable();
	if (request.getParameter("userName") != null)
		uname = (String) request.getParameter("userName");
	if (request.getParameter("bName") != null)
		bname = (String) request.getParameter("bName");
%>
<%
	if ((uname == null && bname == null)
			|| (uname == "" && bname == "")) {
		//do nothing
	} else {
		admindao admd = new admindao();
		try {
			commenttables = admd.getcomment(uname, bname);
			if (commenttables.size() != 0)
				flag = 1;//有结果集
		} catch (IndexOutOfBoundsException e) {
			System.out.println("arraylist打开异常");
			e.printStackTrace();
		}
	}
%>
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>用户留言管理</h1>
		</div>
		<div id="menu">
			<ul>
				<li>用户留言管理</li>
				<li><a href="UserManage">用户明细管理</a></li>
				<li>文章修改意见管理</li>
			</ul>
		</div>
		<div id="content">
			<form name="comment" id="comment" action="CommentManage"
				method="post">
				<table>
					<tr>
						<td>查询用户的评论</td>
						<td><input type="text" id="userName" name="userName" <%if(uname!=null) %>value="<%=uname%>"></td>
					</tr>
					<tr>
						<td>查询书名的评论</td>
						<td><input type="text" id="bName" name="bName" <%if(bname!=null) %>value="<%=bname%>"></td>
					</tr>
					<tr>
						<td><input type="Submit" id="submit"  name="submit" style="width: 100px"
							value="查询" /></td>
					</tr>
				</table>
			</form>
			<br />
			<table border="1" cellpadding="10">
				<%
					if (flag == 1) {
						for (int i = 0; i < commenttables.size(); ++i) {
							comtable = commenttables.get(i);
							String time=null;
							if (comtable.getBname() == null)//预处理
								comtable.setBname(bname);
							if (comtable.getuserName() == null)
								comtable.setuserName(uname);
							if(comtable.getDate()!=null)
								time=comtable.getDate().substring(0,16);//转化时间格式到分钟
							if (i == 0) {
				%>
				<tr>
					<th>用户的名字</th>
					<th>书的名字</th>
					<th>书的章节</th>
					<th>评论的内容</th>
					<th>评论的时间</th>
					<th>删除该评论</th>
				</tr>
				<%
					}
				%>
				<tr id="<%=comtable.getId()%>">
					<td><%=comtable.getuserName()%></td>
					<td><%=comtable.getBname()%></td>
					<td><%=comtable.getChapter()%></td>
					<td style="word-break:break-all"><%=comtable.getContent()%></td>
					<td><%=time%></td>
					<td><input type="button" id="delete" name="delete" size="5"
						value="删除" onclick="deletecomment(<%=comtable.getId()%>)" /></td>
				</tr>
				<%
				}
					} else
						out.print("无内容");
				%>
			</table>
		</div>
	</div>
				<input type="hidden" id="uname" name="uname" value="<%=uname %>" />
			 	<input type="hidden" id="bname" name="bname" value="<%=bname%>>" />
</body>
</html>