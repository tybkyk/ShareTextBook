<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dbmannerger.dbconnector" %>   
<%@page import= "java.sql.*; " %> 
    
    
    <%!
    dbconnector dbcon = new dbconnector();
    
    public ResultSet GetRs(final String SQL) {
 try {
     Connection con = dbcon.initDB();
     Statement smt = con.createStatement();
     ResultSet rs = smt.executeQuery(SQL);
     return rs;
 } catch (SQLException e) {
  System.out.println("记录数量获取失败！");
  return null;
 }
    }%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>

  <style type="text/css">
<!--
.style1 {
 font-size: 18px;
 font-weight: bold;
 color: #660099;
}
.style2 {font-size: 12px}
-->
    </style>
 </head>

 <body>
  <p>
   &nbsp;


  </p>
  <table width="401" border="0" align="center">
   <tr>
    <td width="391">
     <div id="div1" align="center">
      <span class="style1">内容简介</span>
    

   
     <% 
     int id = 3;
     ResultSet rs = GetRs("Select content From book where bookid=3" );    
    %>
    
    <script>
    document.getElement("div1").InnerHtml = '<p>This is some <strong>sample text</strong>. You are using <a href=\"http://ckeditor.com/\">CKEditor</a>.</p>\n\n<p>&nbsp;</p>\n\n<p>我是一个人，<strong>哈哈哈哈</strong></p>'
;
    </script>
   
   
   </div>
    </td>
   </tr>
  </table>
 

 </body>
</html>
   
   
 
   