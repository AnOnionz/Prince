package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.User;

import  conn.MySQLConnUtils;
import  util.GlobalConstants;


public class UserDAO {

	
	public static UserAccount selectUSER(String userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select user_id, username, email_verification_hash, email_verification_attempts, status, create_time, firstname, lastname, gender, date_of_birthday, age, score, code, payment, avatar, role_id from user where user_id=?");
			ps.setString(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					user = new UserAccount();
					user.setUSER_ID(res.getInt(1));
					user.setUSERNAME(res.getNString(2));
					user.setEMAIL_VERIFICATION_HASH(res.getString(3));
					user.setEMAIL_VERIFICATION_ATTEMPTS(res.getInt(4));
					user.setSTATUS(res.getInt(5));
					user.setCREATED_TIME(res.getTimestamp(6));
					user.setFIRSTNAME(res.getNString(7));
					user.setLASTNAME(res.getNString(8));
					user.setGENDER(res.getNString(9));
					user.setDATEOFBIRTH(res.getString(10));
					user.setAGE(res.getInt(11));
					user.setSCORE(res.getInt(12));
					user.setCODE(res.getString(13));
					user.setPAYMENT(res.getString(14));
					user.setAVATAR(res.getString(15));
					user.setROLE_ID(res.getInt(16));
					
				}
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);
	
		}
		return user;
	}

	public static boolean verifyEmailHash(String user_id, String hash)  {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res=null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select 1 from user where user_id = ? and email_verification_hash = ?");
			ps.setString(1, user_id);
			ps.setString(2, hash);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					verified = true;
				}
			}
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);
			e.getMessage();
			
		}
		return verified;
	}

	public static boolean isEmailExists(String email)  {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res=null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select 1 from user where email = ?");
			ps.setString(1, email);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					verified = true;
				}
			}
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);
		
		}
		return verified;
	}
	public static boolean isUserNameExists(String username)  {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res=null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select 1 from user where username = ?");
			ps.setString(1, username);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					verified = true;
				}
			}
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);
			
		}
		return verified;
	}

	public static String insertRow(UserAccount user) {
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		String id = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement("insert into user (username, email, password, create_time, email_verification_hash, status, role_id) values (?,?,?,?,?,?,?)");
			ps1.setString(1,user.getUSERNAME());
			ps1.setString(2,user.getEMAIL());
			ps1.setString(3,user.getPASSWORD());
			ps1.setTimestamp(4, user.getCREATED_TIME());
			ps1.setString(5,user.getEMAIL_VERIFICATION_HASH());
			ps1.setInt(6,user.getSTATUS());
			ps1.setInt(7,user.getROLE_ID());
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

	public static void deleteRow(UserAccount pojo){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("delete from user where user_id = ?");
			ps.setInt(1,pojo.getUSER_ID());
			ps.executeUpdate();
			ps.close();
			MySQLConnUtils.close(conn, ps);
		} catch (SQLException | ClassNotFoundException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			e.printStackTrace();
		}
	}

	public static void updateStatus(String user_id, int status) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set status = ? where user_id = ?");
			ps.setInt(1,status);
			ps.setString(2,user_id);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			
		}
	}
	public static void updateEmailVerificationHash(String user_id, String hash){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set email_verification_hash = ?, email_verification_attempts = ? where user_id = ?");
			ps.setString(1,hash);
			ps.setInt(2,0);
			ps.setString(3,user_id);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			
		}
	}

	public static int incrementVerificationAttempts(String user_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet res = null;
		int attempts = 0;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set email_verification_attempts = email_verification_attempts + 1 where user_id = ?");
			ps.setString(1,user_id);
			ps.executeUpdate();
			
			ps2 = conn.prepareStatement("SELECT email_verification_attempts from user");
			res = ps2.executeQuery();
			
			if (res != null) {
				while (res.next()) {
					attempts = res.getInt(1);
				}
			}
			MySQLConnUtils.close(conn, ps, ps2, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, ps2, res);
			
		}
		return attempts;
	}

	
	public static UserAccount verifyLogin(String inputEmail, String inputPassword)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select user_id, username, email, status, create_time, role_id from user where email =? and password =?");
			ps.setString(1, inputEmail);
			ps.setString(2, inputPassword);
			res = ps.executeQuery();
			if (res!=null) {
				user = new UserAccount();
				while (res.next()) {
					user.setUSER_ID(res.getInt(1));
					user.setUSERNAME(res.getNString(2));
					user.setEMAIL(res.getString(3));
					user.setSTATUS(res.getInt(4));
					user.setCREATED_TIME(res.getTimestamp(5));
					user.setROLE_ID(res.getInt(6));
				}
			}
				
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);
			
		}
		return user;
	}

	public static boolean verifyUserIdAndPassword(String userId,
			String inputCurrentPassword) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res=null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select 1 from user where user_id = ? and password = ?");
			ps.setString(1, userId);
			ps.setString(2, inputCurrentPassword);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					verified = true;
				}
			}
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);
			
		}
		return verified;
	}

	public static void updatePassword(String userId, String inputPassword)  {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set password = ? where user_id = ?");
			ps.setString(1,inputPassword);
			ps.setString(2,userId);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			
		}
	}

	public static void updateEmailVerificationHashForResetPassword(String inputEmail,
			String hash){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set email_verification_hash = ?, email_verification_attempts = ?, status = ? where email = ?");
			ps.setString(1,hash);
			ps.setInt(2,0);
			ps.setInt(3,GlobalConstants.IN_RESET_PASSWORD);
			ps.setString(4,inputEmail);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
			
		}
	}

	public static UserAccount selectUSERbyEmail(String inputEmail) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select user_id, username, email, email_verification_hash, email_verification_attempts, status, create_time from user where email = ?");
			ps.setString(1, inputEmail);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					user = new UserAccount();
					user.setUSER_ID(res.getInt(1));
					user.setUSERNAME(res.getNString(2));
					user.setEMAIL(res.getString(3));
					user.setEMAIL_VERIFICATION_HASH(res.getString(4));
					user.setEMAIL_VERIFICATION_ATTEMPTS(res.getInt(5));
					user.setSTATUS(res.getInt(6));
					user.setCREATED_TIME(res.getTimestamp(7));
				}
			}
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);
			
		}
		return user;
	}
	public static void main(String[] args) {
		UserDAO ud = new UserDAO();
		UserAccount user = new UserAccount();
		user.setUSERNAME("a");
		user.setEMAIL("an@gmail.com");
		user.setPASSWORD("weqe");
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		user.setCREATED_TIME(timestamp);
		user.setEMAIL_VERIFICATION_HASH("eew");
		user.setSTATUS(0);
		user.setROLE_ID(1);
		System.out.println(ud.insertRow(user));
	}
}	
