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
        var pwd=document.registForm.password.value;
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
			用户名:
			<input type="text" id="userName" value="" name="userName" 
				size="38" maxLength="22" />

		<br />
		<br />
			密    码：
			<input type="password" id="password" value="" name="userPassword"
				size="38" maxLength="22"/>				

		<br />
		<br />
			邮    箱：
			<input type="text" id="email" value="" name="userEmail"
				size="38" maxLength="22"/>
							
		<br />
		<br />
		    <input type="Submit" name="submit"  style="width: 210px" value="注册" oncilck="checkinput()"/>		
	</div>

</form>



</body>
</html>