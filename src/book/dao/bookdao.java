package book.dao;


import java.sql.*;
import java.util.ArrayList;

import dbmannerger.dbconnector;
//import user.information.*;
import book.information.bookinfo;;


public class bookdao{
	//寻找满足bid和chapter的书
	public bookinfo findbook(String bid,String chapter) {
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs=null;
        ResultSet rs2 = null;

		try {
			con = dbcon.initDB();
            stmt = con.createStatement();
			bookinfo bi = new bookinfo();
			int count =0;
			String sql = "select * from books where bid=? and bchapter=?";
			String sql2 = "SELECT * FROM books where bid='" + bid + "'";
			PreparedStatement psmt=con.prepareStatement(sql);
			 
			psmt.setString(1, bid);
			psmt.setString(2, chapter);
			
			rs = psmt.executeQuery();
			rs2 = stmt.executeQuery(sql2);
			//Book b = null;
			if(rs.next()){
				bi.setBookId(rs.getInt(1));
				bi.setBookName(rs.getString(2));
				bi.setChapter(rs.getInt(3));
				bi.setContent(rs.getString(4));
				while(rs2.next())
				{
					++count;//获取最大章节
				}
				bi.setmaxchapter(count);
				return bi;	
			}else {
				return null;
			}
	
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			if (rs2 != null) { // 关闭结果集
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			bid=null;
			dbcon.closeDB(rs, stmt, con);
		}
	}


	
	public ArrayList<bookinfo> findAll() {
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs=null;

		try {
			con = dbcon.initDB();
			stmt = con.createStatement();
			String sql = "select * from books";  //更改
			PreparedStatement psmt=con.prepareStatement(sql);
			 
			rs = psmt.executeQuery();

			ArrayList<bookinfo> list = new ArrayList<bookinfo>();

			while (rs.next()) {
				bookinfo b = new bookinfo();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setChapter(rs.getInt(3));
				b.setContent(rs.getString(4));;
				
				list.add(b);

			}
			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			dbcon.closeDB(rs, stmt, con);
		}

	}

}
