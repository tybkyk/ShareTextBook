package book.dao;


import java.sql.*;
import java.util.ArrayList;

import dbmannerger.dbconnector;
//import user.information.*;
import book.information.*;


public class bookdao{

	public bookinfo findbook(String id) {
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs=null;

		try {
			con = dbcon.initDB();
            stmt = con.createStatement();
			String sql = "select * from book where id=?";   //更改
			PreparedStatement psmt=con.prepareStatement(sql);
			 
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			//Book b = null;
			if(rs.next()){
				bookinfo b = new bookinfo();
				
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setChapter(rs.getInt(3));
				b.setContent(rs.getString(4));;

				return b;
				
			}
			return null;
	
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
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
			String sql = "select * from book";  //更改
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
