<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String message = (String)session.getAttribute("message"); // 第二步：获取servlet中存入session的消息
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login</title>
</head>


<script type="text/javascript">
    
    function checkinput()
    {
        var user=document.loginForm.userName.value;
        if(user.length==0)
        {
        alert("没有输入用户名！");
        return false;
        }
        
        var pwd=document.loginForm.password.value;
        
        if(pwd.length==0)
        {
       	 alert("没有输入密码！");
       	 return false;
        }
    }
   

</script>


<body>


	<form name="loginForm" action="userloginservlet" method="post"
		onsubmit="return checkinput()">

		<div align="center">
			<h2>用户登录</h2>

			用户名： <input type="text" id="userName" value="" name="userName"
				size="36" maxLength="36" onblur="checkun()" /> <br /> <br /> 密 码：
			<input type="password" id="password" value="" name="userPassword"
				size="38" maxLength="16" onblur="checkpwd()" /> <br />


			<h2></h2>
			<input type="Submit" name="submit" style="width: 210px" value="登录" />

		</div>

	</form>

	<% 
  if(message != null) {    //第三步：在需要弹窗的页面的尾部展现消息
      out.print(message);
      session.removeAttribute("message");
  }
%>

</body>
</html>