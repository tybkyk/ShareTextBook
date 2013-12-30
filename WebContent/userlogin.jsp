<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login</title>
</head>
<body>


<form id = "form1" action = "userloginservlet" method = "post">
        <table border="1" style="border-collapse:collapse;">
            <tr align = "center">
                <td colspan="2">用户登录</td>    
            </tr>
            <tr>
                <td>用户名：</td>
                <td>
                    <input type = "text" name = "userName"/>
                </td>
                
            </tr>
            <tr>
                <td>密码：</td>
                <td>
                    <input type = "password" name = "userPassword"/>        
                   
                </td>
            </tr>
            <tr align = "center">
                <td colspan = "2">
                    <input type = "submit" name="register" value ="注册" onclick="changeR()" />
                    <input type = "submit" name="login" value ="登录"/>
                </td>    
            </tr>
            
             
        </table>
        
        
    </form>



</body>
</html>