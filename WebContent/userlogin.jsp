<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>My Account</title>
<%
	//验证是否登录，如果参数是logout则删除session
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", -1);
	response.setHeader("Cache-Control", "No-store");//这三行用处是让后退的时候不读缓存而去刷新页面从而可以检测是否登录了
	String action = request.getParameter("action") ;//获取action参数，进行相应操作
	String jumppath=request.getParameter("jumppath") ;//获取jumppath参数，跳转回相应url
	if (action!= null) {//如果action参数中有logout，则是来退出登录的
		if (action.equals("logout")) {
			session.invalidate();
			response.sendRedirect("userlogin.jsp");
		}
	}
	if (jumppath!= null) {
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
			document.getElementById("spanalert").innerHTML = "<font color='red'>"
				+ "没有输入用户名！" + "</font>";
			return false;
		}
		if (upwd.length == 0) {
			document.getElementById("spanalert").innerHTML = "<font color='red'>"
				+ "没有输入密码！" + "</font>";
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
<div id="wrap">
<div class="header">
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li><a href="index.html">Home</a></li>
            <li><a href="about.html">About us</a></li>
            <li><a href="usermainpage.jsp">My Books</a></li>
            <li class="selected"><a href="userlogin.jsp">My Account</a></li>
            <li><a href="userreg.jsp">Register</a></li>
            <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>     
</div>
<div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My account</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            Welcome To OpenTextBook
            </p>
<%
		String uname = null;//检测登录
		try {
			uname = (String) session.getAttribute("uname");//尝试获取uname
		} catch (Exception e) {
		}
%>
              	<div class="contact_form">
              	<%if(uname==null){ %>
                <div class="form_subtitle">login into your account</div>
                 <form name="register" action="#">          
                    <div class="form_row">
                    <label class="contact"><strong>Username:</strong></label>
                    <input type="text" class="contact_input" id="userName" value="" name="userName" maxLength="22"/>
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <input type="password" class="contact_input" id="password" value="" name="userPassword" maxLength="22"/>
                    </div>                     

                    <div class="form_row">
                        <div class="terms">
                    	<span id="spanalert"><br/></span>
                        </div>
                    </div> 

                    
                    <div class="form_row">
                    <input type="button" name="button" class="register" value="登录" onclick="validate()" />
					<input type="hidden" id="hiddenjumppath" value="<%=jumppath  %>">
                    </div>   
                    <%}else{ %>
                    <div align="center">
						<h1><%=uname%>你已经登陆了</h1>
						<br />
						<h3>
						<a href="userlogin.jsp?action=logout">退出登录点这里</a>
						</h3>
					</div>
                    <%} %>
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