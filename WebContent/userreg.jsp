<%@page import="user.information.userinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<title>User Register</title>
</head>

<script type="text/javascript">
    var flag=0;
    function checkinput()
    {
        var user=document.registForm.userName.value;
        var pwd=document.registForm.password.value;
        if(user.length==0){
        alert("没有输入用户名！");
        return false;
        }
  		if(user.length<6){
        alert("用户名长度小于6");
        return false;
        }
        if(user.length>20){
        alert("用户名长度大于20");
        return false;
        }
             
        if(pwd.length==0){
       	 alert("没有输入密码！");
       	 return false;
        }
        if(pwd.length<6){
        alert("密码长度小于6");
        return false;
        }       
        if(pwd.length>20){
        alert("密码长度大于20");
        return false;
        } 
        if(flag==1)//用于判定用户名是否重复
        {
        alert("用户名已经存在");
        return false;
        }
    }
    
	function validate(field) {
		if ((field.value).length!= 0){
			if((field.value).length>5&&(field.value).length<20){
			//创建Ajax核心对象XMLHttpRequest
			var xmlHttp=new XMLHttpRequest();
			var url = "user_validate.jsp?userName="+field.value+"&time="+new Date().getTime();
			//设置请求方式为GET，设置请求的URL，设置为异步提交,我觉得这句话才是核心
			xmlHttp.open("GET", url, true);
			//将设置信息发送到Ajax引擎
			xmlHttp.send();
			//将方法地址复制给onreadystatechange属性,会自动重复执行，直到4,200
			xmlHttp.onreadystatechange=function(){  
			    //alert(xmlHttp.readyState); 取消注释这句话你就会懂你上面那句话的意思
			    //Ajax引擎状态为成功  
			    if (xmlHttp.readyState == 4) {  
			        //HTTP协议状态为成功  
			        if (xmlHttp.status == 200) {  
			            if (xmlHttp.responseText==1) {  
			                //alert(xmlHttp.responseText);  
			                document.getElementById("spanalert").innerHTML = "<font color='red'>" +field.value+ " 已经存在" + "</font>";//存在该用户
			                flag=1;
			            }else{  
			                document.getElementById("spanalert").innerHTML = "<font color='red'>" +field.value+ " 可以使用" + "</font>";//不存在
			            }  
			        }else {  
			            alert("请求失败，错误码=" + xmlHttp.status);  
			        }  
			    }  
			};
		} 
			else
				document.getElementById("spanalert").innerHTML = "<font color='red'>" +"你好像输错了"+"</font>";
		}
		else {
			document.getElementById("spanalert").innerHTML = "<font color='red'>" +"你好像什么都没输入"+"</font>";
		}
	}
</script>

<body>
<form name="registForm" action = "userregservlet" method = "post" onsubmit="return checkinput()" > 
	<div align="center">
		<h1>
			用户注册
		</h1>
			用户名:
			<input type="text" id="userName" value="" name="userName" 
				size="38" maxLength="22" onblur="validate(this)"/>
			
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
		<span id="spanalert" value="" name="spanalert"></span>
		<br />

		    <input type="Submit" name="submit"  style="width: 210px" value="注册"/>		
	</div>
</form>
</body>
</html>