package user.dao;

import java.sql.*;

import dbmannerger.dbconnector;
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

			// change table name！！！

			String sql = "INSERT INTO user1 (user_name,user_password,user_aurtority)VALUES ('"
					+ user.getUserName()
					+ "','"
					+ user.getUserPassword()
					+ "','" + user.getUserAurtority() + "')";
			stmt.executeUpdate(sql);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			dbcon.closeDB(stmt, con);
		}
	}

	public int check(String userName, String userPassword) {
		// 用户登录验证
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		// userinfo user = null;

		int info = 0;

		// may be have some logic problem
		try {

			if (userName.equals(null)) {
				info = 0; // yonghumingkong

			} else if (userPassword.equals(null)) {
				info = 1; // mimakong
			} else {

				con = dbcon.initDB();
				stmt = con.createStatement();

				rs = stmt
						.executeQuery("select user_password from user1 where user_name='"
								+ userName + "'");
				if (rs.next()) {

					String dbPasswd = rs.getString("user_password");

					if (dbPasswd.equals(userPassword)) {
						info = 2; // zhengque
					} else {
						info = 3; // mimayouwu
					}
				} else {
					info = 4; // yonghubucunzai
				}

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			// 执行完关闭数据库
			dbcon.closeDB(rs, stmt, con);
		}

		return info;
	}

}