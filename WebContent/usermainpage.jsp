<%@page import="java.util.ArrayList"%>
<%@page import="readlist.dao.readlistdao"%>
<%@page import="readlist.information.readlistinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", -1);
	response.setHeader("Cache-Control", "No-store");//这三行用处是让后退的时候不读缓存而去刷新页面从而可以检测是否登录了	
	String uid=null;
	String uname = null;
	String path = request.getRequestURI();//当前url
	//uid = "274140416";//假定用户uid为1  实际把下面注释取消
	try {
		uid = (String) session.getAttribute("uid");
	} catch (Exception e) {
	}
	try {
		uname = (String) session.getAttribute("uname");//获取uname
	} catch (Exception e) {
	}
	if (uname == null)
		response.sendRedirect("userlogin.jsp?jumppath="+path);//这句话的用处如果通过url进来而不是用户的话就直接跳转到登陆界面*/
		//如果调试中不需要验证是否登录把try块去掉 
%>
<%
	readlistdao bookmark = new readlistdao();
	readlistinfo rli = new readlistinfo();
	ArrayList<readlistinfo> bk = new ArrayList<readlistinfo>();
	int flag = 1;
	try {
		bk = bookmark.findbookmark(uid);
		if (bk.size() == 0) {
			out.print("这个用户bookmark表里面没东西");//如果结果集返回是空不用出错
			flag = 0;//结果集为空；
		}
	} catch (IndexOutOfBoundsException e) {
		System.out.println("arraylist打开异常");
		e.printStackTrace();
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title><%=uname%>'s Category </title>
</head>

<body>
<div id="wrap">
<div class="header">
       	<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li><a href="index.html">Home</a></li>
            <li><a href="about.html">About us</a></li>
            <li class="selected"><a href="usermainpage.jsp">My Books</a></li>
            <li><a href="userlogin.jsp">My Account</a></li>
            <li><a href="userreg.jsp">Register</a></li>
            <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>     
</div> 

<div class="center_content">
	<div class="left_content">
		<div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Category books</div>
           
           <div class="new_products">
           		<%
					if (flag == 1) {//如果有结果集则显示
						for (int i = 0; i < bk.size(); ++i) {
							rli = bk.get(i);
				%>
                    <div class="new_prod_box">
                        <a href="readbook.jsp?bid=<%=rli.getBookId()%>&chapter=<%=rli.getChapter()%>">Book:<%=rli.getBookName()%> Chapter:<%=rli.getChapter()%></a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="readbook.jsp?bid=<%=rli.getBookId()%>&chapter=<%=rli.getChapter()%>">
                        	<img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" />
                        </a>
                        </div>           
                    </div>
                    
                    	<%}
					}else{ %>
					<p><a href="index.html">add some book</a></p>
					<%} %>                          
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