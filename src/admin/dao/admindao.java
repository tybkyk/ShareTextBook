package admin.dao;

import java.sql.*;
import java.util.ArrayList;

import system.comment.commenttable;
import dbmannerger.dbconnector;

public class admindao {

	public int check(String adminName, String Password) {
		// 用户登录验证
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		int flag = 0;
		try {
			con = dbcon.initDB();
			stmt = con.createStatement();

			rs = stmt
					.executeQuery("select adminpassword from admin where adminname='"
							+ adminName + "'");
			if (rs.next()) {

				String dbPasswd = rs.getString("adminpassword");
				if (dbPasswd.equals(Password)) {
					flag = 1;// password is right
				} else {
					flag = 2; // upassword is wrong
				}
			} else {
				flag = 3; // no such user
			}

		} catch (SQLException e) {
			System.out.println("adminname check 数据库选择异常");
			e.printStackTrace();
		} finally {
			// 执行完关闭数据库
			dbcon.closeDB(rs, stmt, con);
		}

		return flag;
	}

	public ArrayList<commenttable> getcomment(String uname, String bname) {
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<commenttable> commenttables = new ArrayList<commenttable>();

		if (uname != null && bname != null && uname != "" && bname != "") {// uname和bname都存在
			try {
				con = dbcon.initDB();
				stmt = con.createStatement();

				rs = stmt
						.executeQuery("select comid,userbk_c.bchapter,ucomment,ucomment_date "
								+ "from userbk_c,users "
								+ "where users.uid=userbk_c.uid "
								+ "and users.uname='"
								+ uname
								+ "' "
								+ "and userbk_c.bid="
								+ "(select distinct bid from books where bname='"
								+ bname + "')");
				while (rs.next()) {
					commenttable comt = new commenttable();
					comt.setId(rs.getInt(1));
					comt.setChapter(rs.getInt(2));
					comt.setContent(rs.getString(3));
					comt.setDate(rs.getDate(4));
					commenttables.add(comt);
					comt = null;
				}

			} catch (SQLException e) {
				System.out.println("getcomment uname bname 数据库选择异常");
				e.printStackTrace();
			} finally {
				// 执行完关闭数据库
				dbcon.closeDB(rs, stmt, con);
			}
		}

		else if (uname != null && bname == ""&&uname!="") {// uname存在 bname不存在
			try {
				con = dbcon.initDB();
				stmt = con.createStatement();

				rs = stmt
						.executeQuery("select distinct comid,books.bname,userbk_c.bchapter,ucomment,ucomment_date "
								+ "from userbk_c,users,books "
								+ "where users.uid=userbk_c.uid and "
								+ "users.uname='"
								+ uname
								+ "'"
								+ " and userbk_c.bid=books.bid");
				while (rs.next()) {
					commenttable comt = new commenttable();
					comt.setId(rs.getInt(1));
					comt.setBname(rs.getString(2));
					comt.setChapter(rs.getInt(3));
					comt.setContent(rs.getString(4));
					comt.setDate(rs.getDate(5));
					commenttables.add(comt);
					comt = null;
				}

			} catch (SQLException e) {
				System.out.println("getcomment uname数据库选择异常");
				e.printStackTrace();
			} finally {
				// 执行完关闭数据库
				dbcon.closeDB(rs, stmt, con);
			}
		}

		else if (uname == "" && bname != null&&bname!="") {// uname不存在 bname存在
			try {
				con = dbcon.initDB();
				stmt = con.createStatement();

				rs = stmt
						.executeQuery("select comid,userbk_c.bchapter,uname,ucomment,ucomment_date "
								+ "from userbk_c,users where bid="
								+ "(select distinct bid from books where bname='"
								+ bname + "') " + "and users.uid=userbk_c.uid");
				while (rs.next()) {
					commenttable comt = new commenttable();
					comt.setId(rs.getInt(1));
					comt.setChapter(rs.getInt(2));
					comt.setuserName(rs.getString(3));
					comt.setContent(rs.getString(4));
					comt.setDate(rs.getDate(5));
					commenttables.add(comt);
					comt = null;
				}

			} catch (SQLException e) {
				System.out.println("getcomment bname数据库选择异常");
				e.printStackTrace();
			} finally {
				// 执行完关闭数据库
				dbcon.closeDB(rs, stmt, con);
			}
		}
		return commenttables;
	}
	
	public int deletecomt(String comid){
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int flag=0;
		try {
			con = dbcon.initDB();
			stmt = con.createStatement();

			// cast是个函数 所以不能用''包括
			String sql = "delete from userbk_c where comid='"+comid+"'";
			stmt.executeUpdate(sql);
			rs=stmt.executeQuery("select * from userbk_c where comid='"+comid+"'");
			if(!rs.next())
				flag=1;
		} catch (SQLException e) {
			System.out.println("comid数据库删除异常");
			e.printStackTrace();
		} finally {
			dbcon.closeDB(stmt, con);
		}
		return flag;
	}
}
