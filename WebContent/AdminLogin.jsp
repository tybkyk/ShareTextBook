<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator Login</title>
<script type="text/javascript">
function adminlogin_chkinput(){
	var name=document.getElementById("AdminName").value;
	var pwd=document.getElementById("Password").value;
	if(name.length==0||pwd.length==0)
		{
			alert("用户名或密码不能空");
			return false;
		}
}
</script>
</head>
<body>
<form name="loginForm" action="adminloginservlet" method="post" onsubmit="return adminlogin_chkinput()">
		<div align="center">
			<h1>管理员登陆</h1>
			管理员名: <input type="text" id="AdminName" value="" name="AdminName"
				size="38" maxLength="22"/> 
				<br /> 
				<br /> 
			密 码：<input type="password" id="Password" value="" name="Password"
				size="38" maxLength="22"/> 
				<br /> 
				<br /> 
				<input type="Submit" name="submit" style="width: 210px" value="登陆" />
		</div>
	</form>
</body>
</html>