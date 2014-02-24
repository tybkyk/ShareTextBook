<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>用户明细管理</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="CommentManage">用户留言管理</a></li>
				<li>用户明细管理</li>
				<li>文章修改意见管理</li>
			</ul>
		</div>
		<div id="content"></div>
	</div>

</body>
</body>
</html>