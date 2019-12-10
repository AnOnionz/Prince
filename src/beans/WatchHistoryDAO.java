package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import conn.MySQLConnUtils;

public class WatchHistoryDAO {
	public static void insertRow(int userId, int postId, int isvote, int isclick)  {
		Connection conn = null;
		PreparedStatement ps1 = null;
		String id = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement("insert into watch_history(user_id, post_id, isvote, isclick, created_time) values (?,?,?,?,?)");
			ps1.setInt(1, userId);
			ps1.setInt(2, postId);
			ps1.setInt(3, isvote);	
			ps1.setInt(4, isclick);
			ps1.setTimestamp(5,Timestamp.valueOf(LocalDateTime.now()));
			ps1.executeUpdate();
			conn.commit();
			MySQLConnUtils.close(conn, ps1, res);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			MySQLConnUtils.close(conn, ps1, res);
		}
		
	}
	public static boolean updateVote(int userId, int postId) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update tmdt.watch_history set isvote = 1 where post_id = ? and user_id = ?");	
			
			ps.setInt(1,postId);
			ps.setInt(2,userId);
			i = ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			return false;
			
		}
		if(i>0) {
			return true;
		}
		return false;
	}
	public static boolean updateClick(int userId, int postId) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update tmdt.watch_history set isclick = 1 where post_id = ? and user_id = ?");	
			
			ps.setInt(1,postId);
			ps.setInt(2,userId);
			i = ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			return false;
			
		}
		if(i>0) {
			return true;
		}
		return false;
	}
	

}
