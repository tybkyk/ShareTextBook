<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login</title>
<%
	//验证是否登录，如果参数是logout则删除session
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", -1);
	response.setHeader("Cache-Control", "No-store");//这四行用处是让后退的时候不读缓存而去刷新页面从而可以检测是否登录了
	String action = null;
	if (request.getParameter("action") != null) {
		action = request.getParameter("action");//获取action参数，进行相应操作
		if (action.equals("logout")) {
			session.invalidate();
			response.sendRedirect("userlogin.jsp");
		}
	}
%>
</head>

<!--加session：uid uname -->
<script type="text/javascript">
	function validate() {
		var uname = document.getElementById("userName").value;
		var upwd = document.getElementById("password").value;
		if (uname.length == 0) {
			alert("没有输入用户名！");
			return false;
		}
		if (upwd.length == 0) {
			alert("没有输入密码！");
			return false;
		}

		//document.loginForm.submit();
		if (uname.length != 0 && upwd.length != 0) {
			var xmlHttp = new XMLHttpRequest();
			var url = "userloginservlet?userName=" + uname + "&userPassword="
					+ upwd + "&time=" + new Date().getTime();
			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					if (xmlHttp.status == 200) {
						if (xmlHttp.responseText == "1") {
							document.getElementById("spanalert").innerHTML = "<font color='red'>"
									+ "登陆成功...跳转中..." + "</font>";
							//document.getElementById("loginForm").submit();
							top.location = "usermainpage.jsp";
						} else if (xmlHttp.responseText == "2") {
							document.getElementById("spanalert").innerHTML = "<font color='red'>"
									+ "用户名或密码错误" + "</font>";
						}
					} else {
						alert("请求失败，错误码=" + xmlHttp.status);
					}
				}
			};
			xmlHttp.send(null);
		}
	}
</script>
<body>
	<%
		String uname = null;
		try {
			uname = (String) session.getAttribute("uname");
		} catch (Exception e) {
		}
		if (uname != null) {
			//String uname=(String)session.getAttribute("uname");
	%>
	<div align="center">
		<h1><%=uname%>你已经登陆了
		</h1>
		<br />
		<h3>
			<a href="userlogin.jsp?action=logout">退出登录点这里</a>
		</h3>
	</div>
	<%
		} else {
	%>
	<form name="loginForm" id="loginForm" action="userloginservlet"
		method="post" onsubmit="return validate()">

		<div align="center">
			<h2>用户登录</h2>

			用户名： <input type="text" id="userName" value="" name="userName"
				size="36" maxLength="36" /> <br />
			<br /> 密 码: <input type="password" id="password" value=""
				name="userPassword" size="38" maxLength="16" /> <br /> <span
				id="spanalert" value="" name="spanalert"></span> <br /> <input
				type="button" name="button" style="width: 210px" value="登录"
				onclick="validate()" />

		</div>

	</form>

	<%
		}
	%>
</body>
</html>