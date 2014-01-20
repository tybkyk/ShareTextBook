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
	
	public boolean addbook(bookinfo book, userinfo user){
		
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;

        String sql="insert into readlist(user_id,user_name,book_id,book_name,book_chapter) values(?,?,?,?,?)"; //xiugai 
         
        try {
            con = dbcon.initDB();
            stmt = con.createStatement();
 
            PreparedStatement psmt=con.prepareStatement(sql);
            psmt.setInt(1, user.getUserId());
            psmt.setString(2, user.getUserName());
			psmt.setInt(3, book.getBookId());
			psmt.setString(4, book.getBookName());
			psmt.setInt(5, book.getChapter());
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
			throw new RuntimeException(e);

		} finally {
			dbcon.closeDB(rs, stmt, con);
		}

	}
	
	
	
	
    //public void deletebook(String sid, Cart cart) {
		
		//cart.getMap().remove(sid);
	//}
	
    
 	
	
}
	