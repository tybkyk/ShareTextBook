<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Register</title>
</head>

<script type="text/javascript">
    
    function checkinput()
    {
        var user=document.registForm.userName.value;
        if(user.length==0)
        {
        alert("没有输入用户名！");
        return false;
        }
        
        if(user.length<6)
        {
        alert("用户名长度小于6");
        return false;
        }
        
        if(user.length>20)
        {
        alert("用户名长度大于20");
        return false;
        }
        
        
        
        var pwd=document.registForm.password.value;
        
        if(pwd.length==0)
        {
       	 alert("没有输入密码！");
       	 return false;
        }
        
        if(pwd.length<6)
        {
        alert("密码长度小于6");
        return false;
        }
        
        if(pwd.length>20)
        {
        alert("密码长度大于20");
        return false;
        }
        
        
    }
   

</script>


<body>

<form name="registForm" action = "userregservlet" method = "post" onsubmit="return checkinput()" > 

	<div align="center">
		<h2>
			用户注册
		</h2>
		
			用户名：
			<input type="text" id="userName" value="" name="userName" size="36"
				maxLength="36" onblur="checkun()"/>
		
		
		<br />
		
		<br />
		
			密    码：
			<input type="password" id="password" value="" name="userPassword"
				size="38" maxLength="22" onblur="checkpwd()"/>				
		
		<br />
		<h2></h2>
		    <input type="Submit" name="submit"  style="width: 210px" value="登录"/>
			
		</div>

</form>



</body>
</html>