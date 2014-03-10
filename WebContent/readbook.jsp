<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="book.information.bookinfo"%>
<%@page import="book.dao.bookdao"%>
<%@page import="dbmannerger.dbconnector"%>
<%@page import="java.sql.*; "%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
div#container {
	width: 760px;
	margin : 10px 0px 15px 400px;
}
div#content {
	background-color: #EEEEEE;
	width: 760px;
	float: left;
}
div#footer {
	background-color: #99bbbb;
	clear: both;
	width: 760px;
	text-align: center;
}
h1 {
	margin-bottom: 0;
}
.img_sina_share{display:none; position:absolute; cursor:pointer;}
</style>

<style type="text/css">
* {margin: 0;padding: 0;list-style-type: none;}
a,img {border: 0;}
body {_background-image: url(about:blank); /*用浏览器空白页面作为背景*/_background-attachment: fixed;
/* prevent screen flash in IE6 确保滚动条滚动时，元素不闪动*/}
body {font: 12px/180% Arial, Helvetica, sans-serif, "新宋体";background: #E3E4E2;}/* float-news */
.float-news,.float-open {background: #fbfbfb;border: 2px solid #e1e1e1;border-left: 0 none;border-top-right-radius: 4px;border-bottom-right-radius: 4px;box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
display: inline-block;font-size: 16px;border-left: 0 none;border-top-right-radius: 4px;border-bottom-right-radius: 4px;box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
display: inline-block;font-size: 16px;border: 2px solid #e1e1e1;border-left: 0 none;border-top-right-radius: 4px;border-bottom-right-radius: 4px;box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);display: inline-block;font-size: 16px;}
.float-news {overflow: scroll;height: 550px;left: 0px;padding: 10px 15px;width: 340px;z-index: 100;top: 117px;_margin-top: 117px;}
.float-open {height: 48px;left: -70px;padding: 4px 4px 4px 6px;width: 48px;z-index: 99;top: 206px;_margin-top: 206px;}
.float-news,.float-open {position: fixed;*zoom: 1;_position: absolute;_top: expression(eval(document.documentElement.scrollTop));_top: expression(eval(document.documentElement.scrollTop));_top: expression(eval(document.documentElement.scrollTop));}
.float-close {background: url(images/nav-close.png) no-repeat left top;overflow: hidden;height: 48px;opacity: .6;filter: alpha(opacity = 60);
position: absolute;right: 9px;text-indent: 100%;top: 10px;white-space: nowrap;width: 48px;}
.open-btn {background: url(images/ml-open-demo.png) no-repeat left top;display: block;overflow: hidden;height: 48px;opacity: .6;filter: alpha(opacity = 60);text-indent: 100%;white-space: nowrap;width: 48px;}
.float-close:hover,.open-btn:hover {opacity: 1;filter: alpha(opacity = 100);}
.commentlist h3 {color: #333;border-bottom: 4px solid #F2F2F2;font-size: 26px;height: 54px;line-height: 54px;font-family: Microsoft Yahei, simsun, arial, sans-serif;}
.commentlist ul {margin-top: 10px;}
.commentlist li {position: relative;height: 30px;line-height: 30px;font-size: 14px;border-bottom: 1px #ccc dotted}
.commentlist li a {color: #404040;}
.commentlist li span {position: absolute;right: 0;color: #ccc;}
.commentlist li:last-child {border-bottom: 0;}
</style>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/mathjax/MathJax.js?config=TeX-AMS_HTML-full"></script>
<script type="text/javascript" src="js/ckeditor.js"></script>
<script type="text/javascript">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [ ['$','$'], ["\\(","\\)"] ],
    processEscapes: true
  }
});
</script>
<!-- <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full"></script>-->
<%
	String uname = null;
	String path = request.getRequestURI();
	String bid = null;//获取书签页传来的值
	String chapter = "1";
	boolean editable=false;//当前的可编辑状态
	String edit=request.getParameter("edit") ;//parameter of editable
	
	try {
		uname = (String) session.getAttribute("uname");
	} catch (Exception e) {
	}
	if (uname == null)//如果未登录，则去登陆然后再回来
	{
		if(request.getQueryString()!=null)
		response.sendRedirect("userlogin.jsp?jumppath=" + path + "?"
				+ request.getQueryString());//这句话的用处如果通过url进来而不是会员的话就直接跳转到登陆界面
		else
			response.sendRedirect("userlogin.jsp?jumppath=" + path);//这句话的用处如果通过url进来而不是会员的话就直接跳转到登陆界面
	}
	//如果调试中不需要验证是否登录把try块去掉
	else {
		bid=request.getParameter("bid");
		if (bid == null)
			response.sendRedirect("usermainpage.jsp");//如果bid值没有，则回到选书界面
		if (request.getParameter("chapter") != null)
			chapter = request.getParameter("chapter");
		if (edit!= null)
		{
			if(edit.equals("true"))
				editable=true ;
			else 
				editable=false;
		}
	}
	//以上是对于参数的校验 包括是否登录 参数是否有bid和chapter，若chapter为空，则缺省为1
%>
<%
	String bookName = null;
	String content = null;
	int maxchapter = 0;
	int chapter_int=2;//请求的章节号的int类型。即使下面转换不成功 还是可以回到第一页
	try{
		chapter_int = Integer.parseInt(chapter);
	}catch(NumberFormatException e){
		e.printStackTrace();
	}
	if (bid != null && chapter != null) {
		bookdao bd = new bookdao();
		bookinfo bi = new bookinfo();
		bi = bd.findbook(bid, chapter);
		maxchapter = bi.getmaxchapter();//单独获取最大章节
		if (maxchapter!=0) {//获取书名 书内容 
			bookName = bi.getBookName();
			content = bi.getContent();			
		}
		//else
			//response.sendRedirect("usermainpage.jsp");//无这本书
		if(chapter_int>maxchapter&&maxchapter!=0)//章节号大于真实最大章节
			response.sendRedirect("readbook.jsp?bid="+bid+"&chapter="+maxchapter);
	}
%>
<title>书名：<%=bookName%>第<%=chapter%>章</title>

<%=path%>
<%="最大章节:"+maxchapter%>
<%="bookname:"+bookName%>


<script type="text/javascript">
 function goChapter(bid){
	 var maxchapter=document.getElementById("maxchapter").value;
	 var gochapter=document.getElementById("goChapter").value;
	 if(parseInt(gochapter)>0&&parseInt(gochapter)<=parseInt(maxchapter))
	 		window.location.href="readbook.jsp?bid="+bid+"&chapter="+gochapter;
	 else
		 alert("无该章节");
}
 
function savebookmark(bid){
	var xmlHttp;
	var chapter=document.getElementById("currentchapter").value;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlHttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	var url = "useraddbookservlet?bid=" + bid + "&chapter="+chapter + "&bname=<%=bookName%>"+"&time=" + new Date().getTime();
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				if (xmlHttp.responseText == "1") {
					alert("添加成功");					
				} else if (xmlHttp.responseText == "2") {
					alert("已有该书签");
				}else if(xmlHttp.responseText == "3"){
					alert("重新登录");
				}
			} else {
				alert("请求失败，错误码=" + xmlHttp.status);
			}
		}
	};
	xmlHttp.send(null);
}

 $(document).ready(function() {

		// 更多新闻
		function ml_close_demo() {
			$('.float-news').animate({
				left : '-450px'
			}, 300, function() {
				$('.float-open').delay(50).animate({
					left : '-2px'
				}, 300);
			});
		}
		function ml_open_demo() {
			$('.float-open').animate({
				left : '-70px'
			}, 100, function() {
				$('.float-news').delay(50).animate({
					left : '0px'
				}, 300);
			});
		}

		$('.float-close').click(function() {
			ml_close_demo();
			return false;
		});
		$('.open-btn').click(function() {
			ml_open_demo();
			return false;
		});

	});
</script>
</head>
<body>
<div class="float-open" id="float-open" style="left: -2px;">
	<a class="open-btn" href="javascript:void(0);">&gt;</a>
</div>

<div class="float-news" id="float-news" style="left: -450px;">
	<a class="float-close" href="javascript:void(0);">X</a>
	<div class="commentlist">
		<h3>评论</h3>
		<ul>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
			<li>hahah</li>
		</ul>
	</div>
</div>
	<div id="container">
		<div id="content">
		<%if(editable==true) {%>
			<div id="editable" contenteditable="true">
				<%
				out.print(content);
				out.flush();
				%>
		</div>
	</div>		
		<script type="text/javascript">
		CKEDITOR.disableAutoInline = true;
		var editor = CKEDITOR.inline( document.getElementById('editable') );
		</script>
		
		<%}else{%>
			<div id="editable">
				<%
				out.print(content);
				out.flush();
				%>
		</div>
		<img id="imgSinaShare" class="img_sina_share" title="将选中内容分享到新浪微博" src="images/share.gif" />	
	</div>
		<%} %>
		
		<div id="footer">
		<%if(maxchapter!=0&&editable==false){//若最大章节存在当前状态不为编辑状态则显示导航栏
			if(chapter_int<=1)//当前页是第一页或者有异常小于1的情况
			{
			%>
				<a>上一章</a>
			<%}else{%>
				<a href="readbook.jsp?bid=<%=bid %>&chapter=<%=chapter_int-1%>">上一章</a>
			 	<%} %>
			<%
			if(chapter_int<maxchapter)//当前章节小于最大章节则显示
			{
			%>
				<a href="readbook.jsp?bid=<%=bid %>&chapter=<%=chapter_int+1%>">下一章</a>
			<%}else{%>
				<a>下一章</a>
			 	<%} %>
	     	 	<input type="text" id="goChapter" name="goChapter"  size="2" value="<%=chapter %>"/>/<%=maxchapter %>
	     	 	
			 	<input type="button" name="go"  value="Go" onclick="goChapter(<%=bid %>)"  />
			 	
			 	<%if(edit==null) {%><a href="<%=path + "?" + request.getQueryString()+"&edit=true" %>">编辑本页面</a>
			 	<%}else{%><a href="<%=path + "?" + "bid="+bid+"&chapter="+chapter+"&edit=true" %>">编辑本页面</a><%}%>
			 	
			 	<input type="hidden" id="maxchapter" name="maxchapter" value="<%=maxchapter %>" />
			 	
			 	<input type="hidden" id="currentchapter" name="currentchapter" value="<%=chapter%>" />
			 	
		<%}else if(maxchapter!=0&&editable==true){%>
		<input name="123" type="button" value="asdasd" onclick="wocao()">
		<script>
		function wocao(){
			var data = CKEDITOR.instances.editable.getData(); 
			alert(data);
		};
		</script>
		<%} %>
		</div>
	</div>



	<form id="form2" action="topdfservlet" method="post">
		<input type="submit" name="pdf" value="PDF" />
	</form>
	<input type="button" name="bookmark" id="bookmark" value="保存书签" onclick="savebookmark(<%=bid %>)" />


</body>
<%if(editable==false){ %>
<!-- 下面是划词的js  必须放在最下面  -->
<script>
var eleImgShare = document.getElementById("imgSinaShare");

var $sinaMiniBlogShare = function(eleShare, eleContainer) {
	var eleTitle = document.getElementsByTagName("title")[0];
	eleContainer = eleContainer || document;
	var funGetSelectTxt = function() {
		var txt = "";
		if(document.selection) {
			txt = document.selection.createRange().text;	// IE
		} else {
			txt = document.getSelection();
		}
		return txt.toString();
	};
	eleContainer.onmouseup = function(e) {
		e = e || window.event;
		var txt = funGetSelectTxt(), sh = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
		var left = (e.clientX - 40 < 0) ? e.clientX + 20 : e.clientX + 10, top = (e.clientY - 40 < 0) ? e.clientY + sh + 20 : e.clientY + sh + 10;
		if (txt) {
			eleShare.style.display = "inline";
			eleShare.style.left = left + "px";
			eleShare.style.top = top + "px";
		} else {
			eleShare.style.display = "none";
		}
	};
	eleShare.onclick = function() {
		var txt = funGetSelectTxt(), title = (eleTitle && eleTitle.innerHTML)? eleTitle.innerHTML : "未命名页面";
		if (txt) {
			window.open('http://v.t.sina.com.cn/share/share.php?title=' + txt + '→来自页面"' + title + '"的文字片段&url=' + window.location.href);	
		}
	};
}(eleImgShare);
</script>
<%} %>
</html>