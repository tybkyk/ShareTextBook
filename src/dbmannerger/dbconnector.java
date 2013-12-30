package dbmannerger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class dbconnector {
	public Connection initDB() {
		// 初始化数据库连接方法

		String DBDRIVER = "com.mysql.jdbc.Driver";
		// 定义MySQL数据库的连接地址
		String DBURL = "jdbc:mysql://localhost:3306/test";
		// MySQL数据库的连接用户名(需要改变)
		String DBUSER = "root";
		// MySQL数据库的连接密码
		String DBPASSWORD = "12345678";

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		// 创建一个Connection句柄
		try {
			Class.forName(DBDRIVER);
			// 加载数据库驱动
			// 定义数据库地址url，并设置编码格式
			con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			// 得到数据连接
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return con;
		// 返回数据库连接
	}

	public void closeDB(Statement stmt, Connection con) {
		// 关闭数据库连接（无结果集）
		try {
			stmt.close();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void closeDB(ResultSet rs, Statement stmt, Connection con) {
		// 关闭数据库连接（有结果集）
		try {
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
}