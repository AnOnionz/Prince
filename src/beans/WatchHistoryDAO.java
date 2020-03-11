package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

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
	public static boolean maxWatchHistory() {
		LocalDate date = LocalDate.now();
		String sday = date + " 00:00:00 ";
		String eday = date.plusDays(1) + " 00:00:00 "; 
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		int watched = 0;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("SELECT count(post_id) from tmdt.watch_history where isclick = 1 and created_time > ? and created_time < ?");	
			ps.setString(1,sday);
			ps.setString(2,eday);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					watched = res.getInt(1);
					System.out.println(watched);
				}
				
			}
			MySQLConnUtils.close(conn, ps);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			return false;
			
		}
		if(watched > 10) {
			//maximum
			return false;
		}
		return true;
	}
	public static void main(String[] args) {
		WatchHistoryDAO.maxWatchHistory();
	}
	

}
