package readlist.dao;

import book.information.*;
import user.information.*;
import readlist.information.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dbmannerger.dbconnector;

public class readlistdao {
	// 要注意 这个中间如果章节为0则代表为收藏，如果是其他数字则代表是书签
	public boolean addbookmark(bookinfo book, String uid) {
		PreparedStatement psmt = null;
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		ResultSet rs = null;
		int flag = 0;
		String sql = null;

		try {
			con = dbcon.initDB();
			PreparedStatement psmt2 = null;
			String sql2 = "select * from bookmark where uid=? and bid=?";
			psmt2 = con.prepareStatement(sql2);
			psmt2.setString(1, uid);
			psmt2.setInt(2, book.getBookId());
			rs = psmt2.executeQuery();
			if (rs.next()) {
				sql2 = "update bookmark set chapter=? , lastread_date=sysdate() where uid=? and bid=?";
				psmt2 = con.prepareStatement(sql2);
				psmt2.setInt(1, book.getChapter());
				psmt2.setString(2, uid);
				psmt2.setInt(3, book.getBookId());
				flag = psmt2.executeUpdate();
			} else {
				sql = "insert into bookmark(uid,bid,bname,chapter,lastread_date) values(?,?,?,?,sysdate())";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, uid);
				psmt.setInt(2, book.getBookId());
				psmt.setString(3, book.getBookName());
				psmt.setInt(4, book.getChapter());

				flag = psmt.executeUpdate();
				System.out.println(flag);				
			}
			if (flag == 1)
				return true;
			else
				return false;

		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		} finally {
			dbcon.closeDB(psmt, con);
		}
	}

	public ArrayList<readlistinfo> findbookmark(String uid) {
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<readlistinfo> bookmark = new ArrayList<readlistinfo>();

		try {
			con = dbcon.initDB();
			stmt = con.createStatement();
			String sql = "select bid,chapter,bname from bookmark where uid='"
					+ uid + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				readlistinfo rli = new readlistinfo();
				rli.setBookId(rs.getInt(1));
				rli.setChapter(rs.getInt(2));
				rli.setBookName(rs.getString(3));
				bookmark.add(rli);
				rli = null;
			}

		} catch (SQLException e) {
			System.out.println("findbookmark数据库选择异常");
			e.printStackTrace();
		} finally {
			dbcon.closeDB(rs, stmt, con);
		}
		return bookmark;
	}

}
