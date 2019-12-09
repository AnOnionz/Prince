package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import conn.MySQLConnUtils;
import util.GlobalConstants;

public class PostDAO {
	public static ArrayList<Post> selectPostByUser(String userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<Post> listPost = new ArrayList<Post>();
		Post post = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select post_id, category_id, author_id, click, created_time, title, subtitle1, subtitle2, image, image1, image2, figure, figure1, figure2, url, video, startdate, enddate, cost, cost_per_click, score, content1, content2, format, visiter, status from post where author_id=? and format=1 order by created_time desc");
			ps.setString(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					post = new Post();
					post.setPost_id(res.getInt(1));
					post.setCategory_id(res.getInt(2));
					post.setAuthor_id(res.getInt(3));
					post.setClick(res.getInt(4));
					post.setCreated_time(res.getTimestamp(5));
					post.setTitle(res.getString(6));
					post.setSubTitle1(res.getString(7));
					post.setSubTitle2(res.getString(8));
					post.setImage(res.getString(9));
					post.setImage1(res.getString(10));
					post.setImage2(res.getString(11));
					post.setFigure1(res.getString(12));
					post.setFigure2(res.getString(13));
					post.setFigure3(res.getString(14));
					post.setUrl(res.getString(15));
					post.setVideo(res.getString(16));
					post.setStartDate(res.getDate(17));
					post.setEndDate(res.getDate(18));
					post.setCost(res.getInt(19));
					post.setCostPerClick(res.getDouble(20));
					post.setScore(res.getInt(21));	
					post.setContent1(res.getNString(22));
					post.setContent2(res.getNString(23));
					post.setFormat(res.getInt(24));
					post.setVisiter(res.getInt(25));
					post.setStatus(res.getInt(26));
					listPost.add(post);
					
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listPost;
	}
	public static Post selectPostById(String PostId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		Post post = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select post_id, category_id, author_id, click, created_time, title, subtitle1, subtitle2, image, image1, image2, figure, figure1, figure2, url, video, startdate, enddate, cost, cost_per_click, score, content1, content2, format, visiter, status from post where post_id=?");
			ps.setString(1,PostId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					post = new Post();
					post.setPost_id(res.getInt(1));
					post.setCategory_id(res.getInt(2));
					post.setAuthor_id(res.getInt(3));
					post.setClick(res.getInt(4));
					post.setCreated_time(res.getTimestamp(5));
					post.setTitle(res.getString(6));
					post.setSubTitle1(res.getString(7));
					post.setSubTitle2(res.getString(8));
					post.setImage(res.getString(9));
					post.setImage1(res.getString(10));
					post.setImage2(res.getString(11));
					post.setFigure1(res.getString(12));
					post.setFigure2(res.getString(13));
					post.setFigure3(res.getString(14));
					post.setUrl(res.getString(15));
					post.setVideo(res.getString(16));
					post.setStartDate(res.getDate(17));
					post.setEndDate(res.getDate(18));
					post.setCost(res.getInt(19));
					post.setCostPerClick(res.getDouble(20));
					post.setScore(res.getInt(21));	
					post.setContent1(res.getNString(22));
					post.setContent2(res.getNString(23));
					post.setFormat(res.getInt(24));
					post.setVisiter(res.getInt(25));
					post.setStatus(res.getInt(26));
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return post;
	}
	public static ArrayList<Post> selectVideoByUser(String userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<Post> listPost = new ArrayList<Post>();
		Post post = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select post_id, category_id, author_id, click, created_time, title, subtitle1, subtitle2, image, image1, image2, figure, figure1, figure2, url, video, startdate, enddate, cost, cost_per_click, score, content1, content2, format, visiter, status from post where author_id=? and format=2");
			ps.setString(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					post = new Post();
					post.setPost_id(res.getInt(1));
					post.setCategory_id(res.getInt(2));
					post.setAuthor_id(res.getInt(3));
					post.setClick(res.getInt(4));
					post.setCreated_time(res.getTimestamp(5));
					post.setTitle(res.getString(6));
					post.setSubTitle1(res.getString(7));
					post.setSubTitle2(res.getString(8));
					post.setImage(res.getString(9));
					post.setImage1(res.getString(10));
					post.setImage2(res.getString(11));
					post.setFigure1(res.getString(12));
					post.setFigure2(res.getString(13));
					post.setFigure3(res.getString(14));
					post.setUrl(res.getString(15));
					post.setVideo(res.getString(16));
					post.setStartDate(res.getDate(17));
					post.setEndDate(res.getDate(18));
					post.setCost(res.getInt(19));
					post.setCostPerClick(res.getDouble(20));
					post.setScore(res.getInt(21));	
					post.setContent1(res.getNString(22));
					post.setContent2(res.getNString(23));
					post.setFormat(res.getInt(24));
					post.setVisiter(res.getInt(25));
					post.setStatus(res.getInt(26));
					listPost.add(post);
					
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listPost;
	}
	public static ArrayList<Post> selectBannerByUser(String userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<Post> listPost = new ArrayList<Post>();
		Post post = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select post_id, category_id, author_id, click, created_time, title, subtitle1, subtitle2, image, image1, image2, figure, figure1, figure2, url, video, startdate, enddate, cost, cost_per_click, score, content1, content2, format, visiter from post where author_id=? and format=3");
			ps.setString(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					post = new Post();
					post.setPost_id(res.getInt(1));
					post.setCategory_id(res.getInt(2));
					post.setAuthor_id(res.getInt(3));
					post.setClick(res.getInt(4));
					post.setCreated_time(res.getTimestamp(5));
					post.setTitle(res.getString(6));
					post.setSubTitle1(res.getString(7));
					post.setSubTitle2(res.getString(8));
					post.setImage(res.getString(9));
					post.setImage1(res.getString(10));
					post.setImage2(res.getString(11));
					post.setFigure1(res.getString(12));
					post.setFigure2(res.getString(13));
					post.setFigure3(res.getString(14));
					post.setUrl(res.getString(15));
					post.setVideo(res.getString(16));
					post.setStartDate(res.getDate(17));
					post.setEndDate(res.getDate(18));
					post.setCost(res.getInt(19));
					post.setCostPerClick(res.getDouble(20));
					post.setScore(res.getInt(21));	
					post.setContent1(res.getNString(22));
					post.setContent2(res.getNString(23));
					post.setFormat(res.getInt(24));
					post.setVisiter(res.getInt(25));
					post.setStatus(res.getInt(26));
					listPost.add(post);
					
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listPost;
	}
	public static ArrayList<Post> selectPostPresent(String userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<Post> listPost = new ArrayList<Post>();
		Post post = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select post_id, category_id, author_id, click, created_time, title, subtitle1, subtitle2, image, image1, image2, figure, figure1, figure2, url, video, startdate, enddate, cost, cost_per_click, score, content1, content2, format, visiter, status from post where post_id not in (select post_id from tmdt.watch_history where user_id = ? and post_id = post_id and isclick = 1) and status = 1 and format = 1 and startdate <= now() order by startdate desc limit 5");
			ps.setString(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					post = new Post();
					post.setPost_id(res.getInt(1));
					post.setCategory_id(res.getInt(2));
					post.setAuthor_id(res.getInt(3));
					post.setClick(res.getInt(4));
					post.setCreated_time(res.getTimestamp(5));
					post.setTitle(res.getString(6));
					post.setSubTitle1(res.getString(7));
					post.setSubTitle2(res.getString(8));
					post.setImage(res.getString(9));
					post.setImage1(res.getString(10));
					post.setImage2(res.getString(11));
					post.setFigure1(res.getString(12));
					post.setFigure2(res.getString(13));
					post.setFigure3(res.getString(14));
					post.setUrl(res.getString(15));
					post.setVideo(res.getString(16));
					post.setStartDate(res.getDate(17));
					post.setEndDate(res.getDate(18));
					post.setCost(res.getInt(19));
					post.setCostPerClick(res.getDouble(20));
					post.setScore(res.getInt(21));	
					post.setContent1(res.getNString(22));
					post.setContent2(res.getNString(23));
					post.setFormat(res.getInt(24));
					post.setVisiter(res.getInt(25));
					post.setStatus(res.getInt(26));
					listPost.add(post);
					
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listPost;
	}
	public static ArrayList<String> selectFileUrl()  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<String> listFile = new ArrayList<>();
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select image, image1, image2, video from post");
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					for(int i = 1; i <= 4 ; i++) {
					if(res.getString(i)!="" && res.getString(i)!=null) {
						listFile.add(res.getString(i));
					}
					}
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listFile;
	}
	public static String insertOption1(Post post)  {
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		String id = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement("insert into post(category_id, author_id, click, created_time, title, score, subtitle1, subtitle2, content1, content2, image, image1, image2, figure, figure1, figure2, url, video, startdate, enddate, cost, cost_per_click, format, visiter, status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, post.getCategory_id());
			ps1.setInt(2, post.getAuthor_id());
			ps1.setInt(3, post.getClick());
			ps1.setTimestamp(4, post.getCreated_time());
			ps1.setString(5, post.getTitle());
			ps1.setInt(6, post.getScore());
			ps1.setString(7, post.getSubTitle1());
			ps1.setString(8, post.getSubTitle2());
			ps1.setString(9, post.getContent1());
			ps1.setString(10, post.getContent2());
			ps1.setString(11, post.getImage());
			ps1.setString(12, post.getImage1());
			ps1.setString(13, post.getImage2());
			ps1.setString(14, post.getFigure1());
			ps1.setString(15, post.getFigure2());
			ps1.setString(16, post.getFigure3());
			ps1.setString(17, post.getUrl());
			ps1.setString(18, post.getVideo());
			ps1.setDate(19, post.getStartDate());
			ps1.setDate(20, post.getEndDate());
			ps1.setInt(21, post.getCost());
			ps1.setDouble(22, post.getCostPerClick());
			ps1.setInt(23,  post.getFormat());
			ps1.setInt(24, post.getVisiter());
			ps1.setInt(25,  1);
			ps1.executeUpdate();
			
			ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
			res = ps2.executeQuery();
			
			if (res != null) {
				while (res.next()) {
					id = res.getString(1);
				}
			}
			conn.commit();
			MySQLConnUtils.close(conn, ps1, ps2, res);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			MySQLConnUtils.close(conn, ps1, ps2, res);
		}
		return id;
		
	}
	public static String insertOption2(Post post)  {
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		String id = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement("insert into post (category_id, author_id, click, created_time, title, score, video, startdate, enddate, cost, cost_per_click, format, visiter, url,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, post.getCategory_id());
			ps1.setInt(2, post.getAuthor_id());
			ps1.setInt(3, post.getClick());
			ps1.setTimestamp(4, post.getCreated_time());
			ps1.setString(5, post.getTitle());
			ps1.setInt(6, post.getScore());
			ps1.setString(7, post.getVideo());
			ps1.setDate(8, post.getStartDate());
			ps1.setDate(9, post.getEndDate());
			ps1.setInt(10, post.getCost());
			ps1.setDouble(11, post.getCostPerClick());
			ps1.setInt(12, post.getFormat());
			ps1.setInt(13, post.getVisiter());
			ps1.setString(14, post.getUrl());
			ps1.setInt(15, post.getStatus());
			ps1.executeUpdate();
			ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
			res = ps2.executeQuery();
			
			if (res != null) {
				while (res.next()) {
					id = res.getString(1);
					
				}
			}
			conn.commit();
			MySQLConnUtils.close(conn, ps1, ps2, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps1, ps2, res);
		}
		return id;
	}
	public static String insertOption3(Post post)  {
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		String id = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement("insert into post (category_id, author_id, click, created_time, title, score, image, startdate, enddate, cost, cost_per_click, format, visiter) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, post.getCategory_id());
			ps1.setInt(2, post.getAuthor_id());
			ps1.setInt(3, post.getClick());
			ps1.setTimestamp(4, post.getCreated_time());
			ps1.setString(5, post.getTitle());
			ps1.setInt(6, post.getScore());			
			ps1.setString(7, post.getImage());			
			ps1.setDate(8, post.getStartDate());
			ps1.setDate(9, post.getEndDate());
			ps1.setInt(10, post.getCost());
			ps1.setDouble(11, post.getCostPerClick());
			ps1.setInt(12, post.getFormat());
			ps1.setInt(13, post.getVisiter());
			ps1.setInt(14, post.getStatus());
			ps1.executeUpdate();
			ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
			res = ps2.executeQuery();
			
			if (res != null) {
				while (res.next()) {
					id = res.getString(1);
				}
			}
			conn.commit();
			MySQLConnUtils.close(conn, ps1, ps2, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps1, ps2, res);
		}
		return id;
	}
	public static boolean updatePost(int id, int status) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update post set status = ?, created_time = ? where post_id = ?");
			ps.setInt(1,status);
			ps.setTimestamp(2,Timestamp.valueOf(LocalDateTime.now()));
			ps.setInt(3,id);
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
	public static void deletePost(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("delete from post where post_id = ?");
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
		PostDAO post = new PostDAO();
		Post p = new Post();
		p.setAuthor_id(13);
		p.setCategory_id(1);
		//java.util.Date date = new java.util.Date();
		//java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		p.setCreated_time(Timestamp.valueOf(LocalDateTime.now()));
		p.setStartDate(Date.valueOf("2019-2-2"));
		p.setEndDate(Date.valueOf("2019-3-3"));
		p.setFormat(1);
		
		//System.out.println(post.insertOption1(p));
		//System.out.println(PostDAO.selectPostByUser("12"));
		//System.out.println(PostDAO.deletePost("47", GlobalConstants.DELETED));	
		//System.out.println(PostDAO.selectPostById("69"));
		//System.out.println(PostDAO.selectFileUrl());
		System.out.println(selectPostById("91"));
		
	}
}
