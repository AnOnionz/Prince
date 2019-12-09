package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import conn.MySQLConnUtils;
import util.GlobalConstants;

public class CommentDAO {
	public static boolean insertCmt(Comment cmt)  {
		Connection conn = null;
		PreparedStatement ps1 = null;
		
		ResultSet res = null;
		boolean complete = false;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement("insert into comment(user_id, post_id, content, created_time) values (?,?,?,?)");
			ps1.setInt(1, cmt.getUser_id());
			ps1.setInt(2, cmt.getPost_id());
			ps1.setString(3, cmt.getContent());
			ps1.setTimestamp(4, cmt.getCreate_time());
			ps1.executeUpdate();
			conn.commit();
			MySQLConnUtils.close(conn, ps1, res);
			complete = true;
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			MySQLConnUtils.close(conn, ps1, res);
		}
		return complete;
	}
	public static boolean insertSubCmt(Comment cmt)  {
		Connection conn = null;
		PreparedStatement ps1 = null;
		
		ResultSet res = null;
		boolean complete = false;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement("insert into comment(user_id, post_id, content, created_time, root_id, reply_id) values (?,?,?,?,?,?)");
			ps1.setInt(1, cmt.getUser_id());
			ps1.setInt(2, cmt.getPost_id());
			ps1.setString(3, cmt.getContent());
			ps1.setTimestamp(4, cmt.getCreate_time());
			ps1.setInt(5, cmt.getRoot_id());
			ps1.setInt(6, cmt.getReply_id());
			ps1.executeUpdate();
			conn.commit();
			MySQLConnUtils.close(conn, ps1, res);
			complete = true;
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			MySQLConnUtils.close(conn, ps1, res);
		}
		return complete;
	}
	public static Comment selectCommentById(int cmtId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		Comment cmt  = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select comment_id, user_id, post_id, content, created_time, root_id, reply_id from comment where comment_id = ?");
			ps.setInt(1, cmtId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					cmt = new Comment();
					cmt.setComment_id(res.getInt(1));
					cmt.setUser_id(res.getInt(2));
					cmt.setPost_id(res.getInt(3));
					cmt.setContent(res.getNString(4));
					cmt.setCreate_time(res.getTimestamp(5));
					cmt.setRoot_id(res.getInt(6));
					cmt.setReply_id(res.getInt(7));
				}
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return cmt;
	}
	public static ArrayList<Comment> selectParentComment(String postId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<Comment> listCMT = new ArrayList<Comment>();
		Comment cmt  = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select comment_id, user_id, post_id, content, created_time, root_id from comment where post_id = ? and root_id IS NULL");
			ps.setString(1, postId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					cmt = new Comment();
					cmt.setComment_id(res.getInt(1));
					cmt.setUser_id(res.getInt(2));
					cmt.setPost_id(res.getInt(3));
					cmt.setContent(res.getNString(4));
					cmt.setCreate_time(res.getTimestamp(5));
					cmt.setRoot_id(res.getInt(6));
					listCMT.add(cmt);
					
				}
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listCMT;
	}
	public static ArrayList<Comment> selectSubComment(int comment_id)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<Comment> listCMT = new ArrayList<Comment>();
		Comment cmt  = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select comment_id, user_id, post_id, content, created_time, root_id, reply_id from comment where root_id = ?");
			ps.setInt(1, comment_id);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					cmt = new Comment();
					cmt.setComment_id(res.getInt(1));
					cmt.setUser_id(res.getInt(2));
					cmt.setPost_id(res.getInt(3));
					cmt.setContent(res.getNString(4));
					cmt.setCreate_time(res.getTimestamp(5));
					cmt.setRoot_id(res.getInt(6));	
					cmt.setReply_id(res.getInt(7));
					listCMT.add(cmt);
					
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listCMT;
	}
	public static int countComment(int userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		int count = 0;
		Comment cmt  = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select count(user_id) from comment where user_id = ?");
			ps.setInt(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					count = res.getInt(1);
					
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return count;
	}
	public static void deleteCMT(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("delete from comment where comment_id = ?");
			ps.setInt(1,id);
			ps.executeUpdate();
			ps.close();
			MySQLConnUtils.close(conn, ps);
		} catch (SQLException | ClassNotFoundException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			e.printStackTrace();
		}
	}
public static void main(String[] args) {
	Comment cmt = new Comment();
	cmt.setContent("ad");
	cmt.setUser_id(12);
	cmt.setPost_id(79);
	cmt.setCreate_time(Timestamp.valueOf(LocalDateTime.now()));
	cmt.setRoot_id(1);
	
	System.out.println(CommentDAO.countComment(12));
}
}
