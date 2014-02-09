package system.dao;


import java.awt.Insets;
import java.io.File;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.sql.*;
import java.util.ArrayList;

import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;

import dbmannerger.dbconnector;
//import user.information.*;
import system.comment.*;

public class systemdao {
	
	//插入用户留言
	public boolean insertComment(commenttable comt){
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;

        String sql="insert into liuyan(c_id,c_date,c_title,c_content) values(?,?,?,?)";
        
        try {
            con = dbcon.initDB();
            stmt = con.createStatement();
 
            PreparedStatement psmt=con.prepareStatement(sql);
			psmt.setInt(1, comt.getId());
			psmt.setDate(2, comt.getDate());
			psmt.setString(3, comt.getTitle());
			psmt.setString(4, comt.getContent());
			psmt.executeUpdate();
	
			return true;

            
        }catch (SQLException e) {

            e.printStackTrace();
            return false;
        } finally {
            dbcon.closeDB(stmt, con);
        }
	}
	
	
	
	
	//查找
	public ArrayList<commenttable> findAll() {
		
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;

		String sql="select * from liuyan ";
		ResultSet rs=null;
		ArrayList<commenttable> al=new ArrayList<commenttable>();
		

		try{
			 con = dbcon.initDB();
			 stmt = con.createStatement();
	 
	         PreparedStatement psmt=con.prepareStatement(sql);
	         rs=psmt.executeQuery();
	         while(rs.next()){
	        	 commenttable comt=new commenttable();
	        	 comt.setId(rs.getInt(1));
	        	// comt.setUserId(rs.getInt(2));
	        	 comt.setDate(rs.getDate(2));
	        	 comt.setTitle(rs.getString(3));
	        	 comt.setContent(rs.getString(4));
				 al.add(comt);
					//System.out.println(comt.getDate());
				}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
            dbcon.closeDB(rs, stmt, con);
        }
		return al;
		}
	
	
	
	
	//删除留言
	public boolean deleteComment(int CommentId) {
        // 批量刪除记录方法
		dbconnector dbcon = new dbconnector();
        Connection con = null;
        Statement stmt = null;

        try {
        	 con = dbcon.initDB();
			 stmt = con.createStatement();
            String sql = "delete liuyan  WHERE c_id =" + CommentId; //yujubianhua
            stmt.executeUpdate(sql);
   
            return true;
        } catch (SQLException e) {
        	
            e.printStackTrace();
            return false;
            
        } finally {
        	dbcon.closeDB(stmt, con);
        }

    }
	
	
	
	//转换PDF(中文问题后续处理)
	public void generatePDF_1(File outputPDFFile, StringReader strReader) throws Exception {  
        FileOutputStream fos = new FileOutputStream(outputPDFFile);  
        PD4ML pd4ml = new PD4ML();  
        pd4ml.setPageInsets(new Insets(20, 10, 10, 10));  
        pd4ml.setHtmlWidth(950);  
        pd4ml.setPageSize(pd4ml.changePageOrientation(PD4Constants.A4));  
        pd4ml.useTTF("java:fonts", true);  
        pd4ml.setDefaultTTFs("KaiTi_GB2312", "Arial", "Courier New");  
        pd4ml.enableDebugInfo();  
        pd4ml.render(strReader, fos);  
    }  
	
	
	
	
  }
	
	
	
	

	

	
	
	
	


