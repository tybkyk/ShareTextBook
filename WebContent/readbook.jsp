<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="book.information.bookinfo"%>
<%@page import="book.dao.bookdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dbmannerger.dbconnector"%>
<%@page import="java.sql.*; "%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String uname = null;
	String path = request.getRequestURI();
	String bid = null;//获取书签页传来的值
	String chapter = "1";//默认值为1，只有bid无chapter时候跳到第一章
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
		if (request.getParameter("bid") != null)
			bid = request.getParameter("bid");
		else
			response.sendRedirect("usermainpage.jsp");//如果bid值没有，则回到选书界面
		if (request.getParameter("chapter") != null)
			chapter = request.getParameter("chapter");
	}
	//以上是对于参数的校验 包括是否登录 参数礼拜是否有bid和chapter，若chapter为空，则缺省为1
%>
<%
	String bookName = null;
	String content = null;
	int maxchapter = 1;
	if (bid != null && chapter != null) {
		bookdao bd = new bookdao();
		bookinfo bi = new bookinfo();
		bi = bd.findbook(bid, chapter);
		if (bi != null) {
			bookName = bi.getBookName();
			content = bi.getContent();
			maxchapter = bi.getmaxchapter();
		}
		//else
			//response.sendRedirect("usermainpage.jsp");//无这本书
	}

%>
<%=path%>
<%="最大页数"+maxchapter%>

<style type="text/css">
div#container {
	width: 760px
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
</style>

<script type="text/javascript">
 function goChapter(bid){
	 var maxchapter=document.getElementById("maxchapter").value;
	 var gochapter=document.getElementById("goChapter").value;
	 if(parseInt(gochapter)>0&&parseInt(gochapter)<=parseInt(maxchapter))
	 		window.location.href="readbook.jsp?bid="+bid+"&chapter="+gochapter;
	 else
		 alert("无该章节");
	 
 }
</script>
</head>
<body>
	<div id="container">
		<div id="content">
		<% if(content!=null){%>
			<%
			out.print(content);
			out.flush();
			%>
		<%}else {%>	
		<%="无内容" %>	
		<%} %>
		</div>
		
		<div id="footer">
		<%if(bid!=null){
			int chapter_int=2;
			try{
				chapter_int = Integer.parseInt(chapter);
			}catch(NumberFormatException e){
				e.printStackTrace();
			}
			if(chapter_int==1)
			{
			%>
				<a>上一章</a>
			<%}else{%>
				<a href="readbook.jsp?bid=<%=bid %>&chapter=<%=chapter_int-1%>">上一章</a>
			 	<%} %>
			<%
			if(chapter_int<maxchapter)
			{
			%>
				<a href="readbook.jsp?bid=<%=bid %>&chapter=<%=chapter_int+1%>">下一章</a>
			<%}else{%>
				<a>下一章</a>
			 	<%} %>
			 	<input type="text" id="goChapter" name="goChapter"  size="3" value="<%=chapter %>"/>
			 	<input type="button" name="go" value="Go" onclick="goChapter(<%=bid %>)"  />
			 	<input type="hidden" id="maxchapter" name="maxchapter" value="<%=maxchapter %>" />
			 	<input type="hidden" id="currentchapter" name="currentchapter" value="<%=chapter%>>" />
		<%} %>
		
		
		</div>
	</div>



	<form id="form2" action="topdfservlet" method="post">

		<input type="submit" name="pdf" value="PDF" />

	</form>
</body>
</html>