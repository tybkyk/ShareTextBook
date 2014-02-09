<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login</title>
</head>

<!--加session：uid uname -->
<script type="text/javascript">
    
    function checkinput()
    {
        var user=document.loginForm.userName.value;
        var pwd=document.loginForm.password.value;
        if(user.length==0)
        {
        alert("没有输入用户名！");
        return false;
        } 
        if(pwd.length==0)
        {
       	 alert("没有输入密码！");
       	 return false;
        }
    }
    
    function validate(userName,password){
    	var uname=userName.value;
    	var upwd=password.value;
    	if(userName!=null&&password!=null){
    		var xmlHttp=new XMLHttpRequest();
    	}
    }
   

</script>


<body>


	<form name="loginForm" action="userloginservlet" method="post" onsubmit="return checkinput()">

		<div align="center">
			<h2>用户登录</h2>

			用户名： <input type="text" id="userName" value="" name="userName"
				size="36" maxLength="36" /> 
			<br /><br /> 
				
			密 码:	<input type="password" id="password" value="" name="userPassword"
				size="38" maxLength="16" /> 
			<br /><br />

			<input type="Submit" name="submit" style="width: 210px" value="登录" onclick=validate(userName,password) />

		</div>

	</form>


</body>
</html>