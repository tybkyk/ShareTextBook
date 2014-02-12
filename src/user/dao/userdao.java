package user.dao;

import java.sql.*;

import dbmannerger.dbconnector;
import system.dao.systemdao;
import user.information.*;

public class userdao {
	// 插入用户信息
	public void insertUser(userinfo user) {
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;

		try {
			con = dbcon.initDB();
			stmt = con.createStatement();

			// cast是个函数 所以不能用''包括
			String sql = "INSERT INTO users (uid,uname,upassword,uauthority,uemail,ureg_date)VALUES ("
					+ "cast(concat(2,right(UUID_SHORT(),8)) as signed)"
					+ ",'"
					+ user.getUserName()
					+ "','"
					+ user.getUserPassword()
					+ "','"
					+ user.getUserAurtority()
					+ "','"
					+ user.getUserEmail() + "'," + "sysdate()" + ")";
			stmt.executeUpdate(sql);

		} catch (SQLException e) {
			System.out.println("数据库插入异常");
			e.printStackTrace();
		} finally {
			dbcon.closeDB(stmt, con);
		}
	}

	public int checkuser_exists(String userName) {
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			con = dbcon.initDB();
			stmt = con.createStatement();
			String sql = "SELECT uname FROM users where uname='" + userName
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = 1;// 1为已经存在这个用户
			} else
				flag = 2;// 2为不存在这个用户
		} catch (SQLException e) {
			System.out.println("数据库选择异常");
			e.printStackTrace();
		} finally {
			dbcon.closeDB(rs, stmt, con);
		}
		return flag;
	}

	public String[] check(String userName, String userPassword) {
		// 用户登录验证
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String [] arrStrings=new String[2];
		// userinfo user = null;

		String info = null;

		// may be have some logic problem
		try {
				con = dbcon.initDB();
				stmt = con.createStatement();

				rs = stmt.executeQuery("select uid,upassword from users where uname='"+ userName + "'");
				if (rs.next()) {
					
					String uid=rs.getString("uid");
					String dbPasswd = rs.getString("upassword");
					if (dbPasswd.equals(userPassword)) {
						info = "2"; // upassword is right
						arrStrings[0]=uid;
						arrStrings[1]=info;
					} else {
						info = "3"; // upassword is wrong
						arrStrings[1]=info;
					}
				} else {
					info = "4"; // no such user
					arrStrings[1]=info;
				}

		} catch (SQLException e) {
			System.out.println("check pwd 数据库选择异常");
			e.printStackTrace();
		} finally {
			// 执行完关闭数据库
			dbcon.closeDB(rs, stmt, con);
		}

		return arrStrings;
	}

}