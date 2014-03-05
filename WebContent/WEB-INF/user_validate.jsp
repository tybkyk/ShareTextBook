<%@page import="user.dao.userdao"%>
<%@page import="dbmannerger.dbconnector"%>
<%@page import="java.sql.*;"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userName = null;
	int result = 0;
	if (request.getParameter("userName") != null) {
		userName = request.getParameter("userName");
		userName = new String(userName.getBytes("iso-8859-1"), "utf-8");
	} else
		userName = null;

	/*dbconnector dbcon = new dbconnector();
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		con = dbcon.initDB();
		stmt = con.createStatement();
		String sql = "SELECT uname FROM users where uname='" + userName
				+ "'";
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println(userName + " 已经存在");
		}
		else
			out.println(userName + " 可以使用");
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		dbcon.closeDB(rs,stmt, con);
		userName=null;
	}
	把这段代码移主要是想把模块功能独立了*/
	userdao userDao = new userdao();
	result = userDao.checkuser_exists(userName);
	if (result == 1) {
		out.println("1");
	}
	else
		out.println("don't watch");
%>
