<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="book.information.bookinfo"%>
<%@page import="book.dao.bookdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@page import="dbmannerger.dbconnector"%>
<%@page import="java.sql.*; "%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<script type="text/javascript" src="js/ckeditor.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%
	String path = request.getRequestURI();
	String bid = "1";//获取书签页传来的值
	String chapter = "1";//默认值为1，只有bid无chapter时候跳到第一章
	String bookName = null;
	String content = null;
	//int maxchapter = 1;
	if (bid != null && chapter != null) {
		bookdao bd = new bookdao();
		bookinfo bi = new bookinfo();
		bi = bd.findbook(bid, chapter);
		content = bi.getContent();			
		
	}

%>


<title>edit</title>
</head>
<body>
<script type="text/javascript">CKEDITOR.replace('editor01');</script>


<textarea class="ckeditor" name="editor1">

<% if(content!=null){%>
			<%
			out.print(content);
			out.flush();
			%>
		<%}else {%>	
		<%="无内容" %>	
		<%} %>

</textarea>





</body>
</html>