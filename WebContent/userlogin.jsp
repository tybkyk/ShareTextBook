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
	response.setHeader("Cache-Control", "No-store");//这三行用处是让后退的时候不读缓存而去刷新页面从而可以检测是否登录了
	String action = null;
	String jumppath=null;
	if (request.getParameter("action") != null) {//如果action参数中有logout，则是来退出登录的
		action = request.getParameter("action");//获取action参数，进行相应操作
		if (action.equals("logout")) {
			session.invalidate();
			response.sendRedirect("userlogin.jsp");
		}
	}
	if (request.getParameter("jumppath") != null) {
		jumppath = request.getParameter("jumppath");//获取jumppath参数，跳转回相应url
		if(request.getParameter("chapter") != null)
			jumppath+="&chapter="+request.getParameter("chapter");
	}
	
%>
</head>

<!--加session：uid uname ps:session已经在servlet中添加 -->
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
			var xmlHttp;
			if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlHttp=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
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
							if(document.getElementById("hiddenjumppath").value=="null")									
								window.location.href = "/ShareTextBook/usermainpage.jsp";
							else
								window.location.href =document.getElementById("hiddenjumppath").value;
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
<%=jumppath%>
	<%
		String uname = null;//检测登录
		try {
			uname = (String) session.getAttribute("uname");//尝试获取uname
		} catch (Exception e) {
		}
		if (uname != null) {
			//String uname=(String)session.getAttribute("uname");
			//如果调试中不需要验证是否登录把try块去掉 
	%>
	<div align="center">
		<h1><%=uname%>你已经登陆了(这段是留着代码)</h1>
		<br />
		<h3>
			<a href="userlogin.jsp?action=logout">退出登录点这里</a>
		</h3>
	</div>
	<%
		} else {
	%>
		<div align="center">
			<h2>用户登录</h2>

				用户名: 
				<input type="text" id="userName" value="" name="userName" 
				size="38" maxLength="22"/>
				<br />
				<br /> 
				密	码：
				<input type="password" id="password" value="" name="userPassword"
				size="38" maxLength="22"/>

				<br /> 
				<span id="spanalert"></span> 
				<br /> 
				<input type="button" name="button" style="width: 210px" value="登录"
				onclick="validate()" />

		</div>
	<input type="hidden" id="hiddenjumppath" value="<%=jumppath  %>">
	<%
		}
	%>
</body>
</html>