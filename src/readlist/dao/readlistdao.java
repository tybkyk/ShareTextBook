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


//用于代表购买的商品（书）。包括书的数量。（购物项，购物车的一行）
public class readlistdao {
	//要注意 这个中间如果章节为0则代表为收藏，如果是其他数字则代表是书签
	public boolean addbookmark(bookinfo book, userinfo user){
		
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;
        
        String sql="insert into bookmark(uid,bid,bname,chapter,lastread_date) values(?,?,?,?,sysdate())";  
         
        try {
            con = dbcon.initDB();
            stmt = con.createStatement();
 
            PreparedStatement psmt=con.prepareStatement(sql);
            psmt.setInt(1, user.getUserId());
			psmt.setInt(2, book.getBookId());
			psmt.setString(3, book.getBookName());
			psmt.setInt(4, book.getChapter());
			//psmt.setString(6, book.getContent());
			
			psmt.executeUpdate();
	
			return true;

            
        }catch (SQLException e) {

            e.printStackTrace();
            return false;
        } finally {
            dbcon.closeDB(stmt, con);
        }
	}
	
	public ArrayList<readlistinfo> findbookmark(String uid){
		dbconnector dbcon = new dbconnector();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<readlistinfo> bookmark=new ArrayList<readlistinfo>();

		try {
			con = dbcon.initDB();
			stmt = con.createStatement();
			String sql = "select bid,chapter,bname from bookmark where uid='"+uid+"'";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				readlistinfo rli=new readlistinfo();
				rli.setBookId(rs.getInt(1));
				rli.setChapter(rs.getInt(2));
				rli.setBookName(rs.getString(3));
				bookmark.add(rli);
				rli=null;
			}
			
		} catch (SQLException e) {
			System.out.println("findbookmark数据库选择异常");
			e.printStackTrace();
		} finally {
			dbcon.closeDB(rs, stmt, con);
		}
		return bookmark;
	}
	
	public ArrayList<readlistinfo> findAll() {
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

			ArrayList<readlistinfo> list = new ArrayList<readlistinfo>();

			while (rs.next()) {
				
				readlistinfo rl = new readlistinfo();

				rl.setBookId(rs.getInt(1));
				rl.setBookName(rs.getString(2));
				rl.setChapter(rs.getInt(3));
				rl.setUserId(rs.getInt(4));
				rl.setUserName(rs.getString(5));
				
				list.add(rl);

			}
			return list;

		} catch (Exception e) {
			System.out.println("findall数据库选择异常");
			throw new RuntimeException(e);

		} finally {
			dbcon.closeDB(rs, stmt, con);
		}

	}
	
	
	
	
    //public void deletebook(String sid, Cart cart) {
		
		//cart.getMap().remove(sid);
	//}
	
    
 	
	
}
	