<%@page import="user.information.userinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>User Register</title>
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<%
response.setHeader("Pragma","No-Cache");
response.setHeader("Cache-Control","No-Cache");
response.setDateHeader("Expires", 0);
%>
</head>

<script type="text/javascript">
	var flag = 0;
	function checkinput() {
		var user = document.registForm.userName.value;
		var pwd = document.registForm.password.value;
		if (user.length == 0) {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"+"没有输入用户名！"+ "</font>";
			return false;
		}
		if (user.length < 6) {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"+"用户名长度小于6"+ "</font>";
			return false;
		}
		if (user.length > 20) {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"+"用户名长度大于20"+ "</font>";
			return false;
		}

		if (pwd.length == 0) {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"+"没有输入密码！"+ "</font>";
			return false;
		}
		if (pwd.length < 6) {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"+"密码长度小于6"+ "</font>";
			return false;
		}
		if (pwd.length > 20) {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"+"密码长度大于20"+ "</font>";
			return false;
		}
		if (flag == 1)//用于判定用户名是否重复
		{
			return false;
		}
	}

	function validate() {
		field = document.getElementById("userName");
		if ((field.value).length != 0) {
			if ((field.value).length > 5 && (field.value).length < 21) {
				//创建Ajax核心对象XMLHttpRequest
				var xmlHttp = new XMLHttpRequest();
				var url = "validate?userName=" + field.value
						+ "&time=" + new Date().getTime();
				//设置请求方式为GET，设置请求的URL，设置为异步提交,我觉得这句话才是核心
				xmlHttp.open("GET", url, true);
				//将设置信息发送到Ajax引擎

				xmlHttp.onreadystatechange = function() {
					//alert(xmlHttp.readyState); 取消注释这句话你就会懂你上面那句话的意思
					//Ajax引擎状态为成功  
					if (xmlHttp.readyState == 4) {
						//HTTP协议状态为成功  
						if (xmlHttp.status == 200) {
							if (xmlHttp.responseText == 1) {
								//alert(xmlHttp.responseText);  
								document.getElementById("spanalert").innerHTML = "<font color='red'>"
										+ field.value + " 已经存在" + "</font>";//存在该用户
								flag = 1;
							} else {
								flag = 0;
								document.getElementById("spanalert").innerHTML = "<font color='red'>"
										+ field.value + " 可以使用" + "</font>";//不存在     
							}
						} else {
							alert("请求失败，错误码=" + xmlHttp.status);
						}
					}
				};
				xmlHttp.send();
				//将方法地址复制给onreadystatechange属性,会自动重复执行，直到4,200
			} else
				document.getElementById("spanalert").innerHTML = "<font color='red'>"
						+ "你好像输得不符合要求" + "</font>";
		} else {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"
					+ "你好像什么都没输入" + "</font>";
		}
	}
</script>

<body>
<div id="wrap">
<div class="header">
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li><a href="index.html">Home</a></li>
            <li><a href="about.html">About us</a></li>
            <li><a href="usermainpage.jsp">My Books</a></li>
            <li><a href="userlogin.jsp">My Account</a></li>
            <li class="selected"><a href="userreg.jsp">Register</a></li>
            <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>     
</div>

<div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Register</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            Register Your Account
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">create new account</div> 
                 <form name="registForm" action="userregservlet" method="post" onsubmit="return checkinput()">      
                    <div class="form_row">
                    <label class="contact"><strong>Username:</strong></label>
                    <input type="text" class="contact_input" id="userName" value="" name="userName" 
                    		maxLength="22" onblur="validate()" /> 
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <input type="password" class="contact_input" id="password" value="" name="userPassword"
                    		maxLength="22" onblur="validate()" /> 
                    </div> 

                    <div class="form_row">
                    <label class="contact"><strong>Email:</strong></label>
                    <input type="email" class="contact_input" id="email" value="" name="userEmail" maxLength="22" />
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>Phone:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Company:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Adrres:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>                    

                    <div class="form_row">
                        <div class="terms">
                        <span id="spanalert"><br/></span>
                       	</div>
                    </div> 

                    
                    <div class="form_row">
                    <input type="Submit" class="register" name="submit"  value="注册" />
                    </div>   
                  </form>     
                </div>  
            
          </div>	
            
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        
                	<div class="languages_box">
            <span class="red">Languages:</span>
            <a href="#"><img src="images/gb.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="images/fr.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="images/de.gif" alt="" title="" border="0" /></a>
            </div>
                <div class="currency">
                <span class="red">Currency: </span>
                <a href="#">GBP</a>
                <a href="#">EUR</a>
                <a href="#"><strong>USD</strong></a>
                </div>
                
               
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Store</div> 
             <div class="about">
             <img src="images/about.gif" alt="" title="" class="right" />
            <p>about us about us about us about us about us about us about us about us about us about us about us about us about us about us about us about us about us about us about us </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>Promotions</div> 
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>              
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>                                              
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>Partners</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>                              
                </ul>      
             
             </div>         
             
        
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
       
       <div class="footer">
       	<div class="left_footer">
       	<img src="images/footer_logo.gif" alt="" title="" />
       	</div>
        <div class="right_footer">
        <a href="#">Home</a>
        <a href="about.html">About us</a>
        <a href="#">Services</a>
        <a href="#">Privacy Policy</a>
        <a href="#">Contact us</a>
       
        </div>
        
       
       </div>
       <!--end of footer content-->
</div>
</body>
</html>