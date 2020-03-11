package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import conn.MySQLConnUtils;
import util.BCrypt;
import util.GlobalConstants;
import util.Utils;

public class UserDAO {

	public static UserAccount selectUSER(String identify) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement(
					"select user_id, username, status, created_time, firstname, lastname, gender, date_of_birth, age, score, code, payment, avatar, role_id, identify from user where identify=?");
			ps.setString(1, identify);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					user = new UserAccount();
					user.setUSER_ID(res.getInt(1));
					user.setUSERNAME(res.getNString(2));
					user.setSTATUS(res.getInt(3));
					user.setCREATED_TIME(res.getTimestamp(4));
					user.setFIRSTNAME(res.getNString(5));
					user.setLASTNAME(res.getNString(6));
					user.setGENDER(res.getNString(7));
					user.setDATEOFBIRTH(res.getDate(8));
					user.setAGE(res.getInt(9));
					user.setSCORE(res.getInt(10));
					user.setCODE(res.getString(11));
					user.setPAYMENT(res.getString(12));
					user.setAVATAR(res.getString(13));
					user.setROLE_ID(res.getInt(14));
					user.setIDENTIFY(res.getString(15));

				}
			}
			MySQLConnUtils.close(conn, ps, res);
			;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);

		}
		return user;
	}

	public static boolean verifyEmailHash(String user_id, String hash) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res = null;
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

	public static boolean isEmailExists(String email) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res = null;
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

	public static boolean isUserNameExists(String username) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res = null;
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
			ps1 = conn.prepareStatement(
					"insert into user (username, email, password, created_time, email_verification_hash, score, code, role_id,status, date_of_birth) values (?,?,?,?,?,?,?,?,?,?)");
			ps1.setString(1, user.getUSERNAME());
			ps1.setString(2, user.getEMAIL());
			ps1.setString(3, user.getPASSWORD());
			ps1.setTimestamp(4, user.getCREATED_TIME());
			ps1.setString(5, user.getEMAIL_VERIFICATION_HASH());
			ps1.setInt(6, user.getSCORE());
			ps1.setString(7, user.getCODE());
			ps1.setInt(8, user.getROLE_ID());
			ps1.setInt(9, user.getSTATUS());
			ps1.setDate(10, user.getDATEOFBIRTH());
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

	public static void deleteRow(UserAccount pojo) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("delete from user where user_id = ?");
			ps.setInt(1, pojo.getUSER_ID());
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
			ps.setInt(1, status);
			ps.setString(2, user_id);
			int i = ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);

		}

	}

	public static void updateIdentify(String user_id, String identify) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set identify = ? where user_id = ?");
			ps.setString(1, identify);
			ps.setString(2, user_id);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);

		}
	}

	public static void updateEmailVerificationHash(String user_id, String hash) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement(
					"update user set email_verification_hash = ?, email_verification_attempts = ? where user_id = ?");
			ps.setString(1, hash);
			ps.setInt(2, 0);
			ps.setString(3, user_id);
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
			ps = conn.prepareStatement(
					"update user set email_verification_attempts = email_verification_attempts + 1 where user_id = ?");
			ps.setString(1, user_id);
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

	public static UserAccount verifyLogin(String inputEmail, String inputPassword) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement(
					"select user_id, username, email, status, created_time, role_id, password, score from user where email =? and password =?");
			ps.setString(1, inputEmail);
			ps.setString(2, inputPassword);
			res = ps.executeQuery();
			if (res != null) {
				user = new UserAccount();
				while (res.next()) {
					user.setUSER_ID(res.getInt(1));
					user.setUSERNAME(res.getNString(2));
					user.setEMAIL(res.getString(3));
					user.setSTATUS(res.getInt(4));
					user.setCREATED_TIME(res.getTimestamp(5));
					user.setROLE_ID(res.getInt(6));
					user.setPASSWORD(res.getString(7));
					user.setSCORE(res.getInt(8));
				}
			}

			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);

		}
		return user;
	}

	public static boolean verifyUserIdAndPassword(String userId, String inputCurrentPassword) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res = null;
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

	public static boolean verifyIdentify(String identify) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean verified = false;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select 1 from user where identify = ?");
			ps.setString(1, identify);
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

	public static void updatePassword(String userId, String inputPassword) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set password = ? where user_id = ?");
			ps.setString(1, inputPassword);
			ps.setString(2, userId);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);

		}
	}

	public static void updateRole(String userId, int role) {
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		ResultSet res = null;
		String id =null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select 1 from post where author_id=?");
			ps.setString(1, userId);
			res = ps.executeQuery();

			if (res != null) {
				while (res.next()) {
					id = res.getString(1);
				}
			}
			if(id!=null) {
				ps1 = conn.prepareStatement("update user set role_id = 2 where user_id = ?");
				ps1.setString(1, userId);
				ps1.executeUpdate();
			}
			MySQLConnUtils.close(conn, ps, ps1, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, ps1, res);

		}
	}

	public static void updateEmailVerificationHashForResetPassword(String inputEmail, String hash) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement(
					"update user set email_verification_hash = ?, email_verification_attempts = ?, status = ? where email = ?");
			ps.setString(1, hash);
			ps.setInt(2, 0);
			ps.setInt(3, GlobalConstants.IN_RESET_PASSWORD);
			ps.setString(4, inputEmail);
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
		ResultSet res = null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement(
					"select user_id, username, status, created_time, firstname, lastname, gender, date_of_birth, age, score, code, payment, avatar, role_id, identify from user where email = ?");
			ps.setString(1, inputEmail);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					user = new UserAccount();
					user.setUSER_ID(res.getInt(1));
					user.setUSERNAME(res.getNString(2));
					user.setSTATUS(res.getInt(3));
					user.setCREATED_TIME(res.getTimestamp(4));
					user.setFIRSTNAME(res.getNString(5));
					user.setLASTNAME(res.getNString(6));
					user.setGENDER(res.getNString(7));
					user.setDATEOFBIRTH(res.getDate(8));
					user.setAGE(res.getInt(9));
					user.setSCORE(res.getInt(10));
					user.setCODE(res.getString(11));
					user.setPAYMENT(res.getString(12));
					user.setAVATAR(res.getString(13));
					user.setROLE_ID(res.getInt(14));
					user.setIDENTIFY(res.getString(15));
					user.setEMAIL(res.getString(16));
				}
			}
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);

		}
		return user;
	}
	public static UserAccount selectUserById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement(
					"select user_id, username, status, created_time, firstname, lastname, gender, date_of_birth, age, score, code, payment, avatar, role_id, identify, email from user where user_id = ?");
			ps.setInt(1, id);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					user = new UserAccount();
					user.setUSER_ID(res.getInt(1));
					user.setUSERNAME(res.getNString(2));
					user.setSTATUS(res.getInt(3));
					user.setCREATED_TIME(res.getTimestamp(4));
					user.setFIRSTNAME(res.getNString(5));
					user.setLASTNAME(res.getNString(6));
					user.setGENDER(res.getNString(7));
					user.setDATEOFBIRTH(res.getDate(8));
					user.setAGE(res.getInt(9));
					user.setSCORE(res.getInt(10));
					user.setCODE(res.getString(11));
					user.setPAYMENT(res.getString(12));
					user.setAVATAR(res.getString(13));
					user.setROLE_ID(res.getInt(14));
					user.setIDENTIFY(res.getString(15));
					user.setEMAIL(res.getString(16));
				}
			}
			MySQLConnUtils.close(conn, ps, res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps, res);

		}
		return user;
	}
	public static UserAccount updateScore(int userId, int score) {
		Connection conn = null;
		PreparedStatement ps = null;
		UserAccount user = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update user set score = ? where user_id = ?");
			ps.setInt(1, score);
			ps.setInt(2, userId);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
			user = selectUserById(userId);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
		}
		return user;
	}
	//Thay đổi thông tin user
		public void updateInformation(String userId, String firstname, String lastname, String birthday, String gender, String avatar) throws ParseException {
			Connection conn = null;
			PreparedStatement ps = null;
			try {
				conn = MySQLConnUtils.getMySQLConnection();
				ps = conn.prepareStatement("update user set firstname = ? , lastname = ? , date_of_birth = ? , gender = ? ,avatar =? where user_id = ?");
				ps.setString(1, firstname);
				ps.setString(2, lastname);
				
				int day = UserAccount.getDay(birthday);
				int month = UserAccount.getMonth(birthday);
				int year = UserAccount.getYear(birthday);	
				Date date = new Date(year, month, day);
				
				ps.setDate(3, date);
				ps.setString(4, gender);
				ps.setString(5, avatar);
				ps.setString(6, userId);
				
				ps.executeUpdate();
				MySQLConnUtils.close(conn, ps);
			} catch (ClassNotFoundException | SQLException e) {
				e.getMessage();
				MySQLConnUtils.close(conn, ps);
			}
		}
		

	public static void main(String[] args) throws ParseException {
		UserDAO ud = new UserDAO();
		UserAccount user = new UserAccount();
		user.setUSERNAME("aauqqq");
		user.setEMAIL("aaqq@gmail.com");
		user.setPASSWORD("weqe");
		user.setCREATED_TIME(Timestamp.valueOf(LocalDateTime.now()));
		user.setEMAIL_VERIFICATION_HASH("eeww");
		user.setSTATUS(0);
		user.setCODE(Utils.prepareRandomString(8));
		user.setSCORE(10000);
		user.setROLE_ID(1);
		String date2 = "2018-9-2";
		user.setDATEOFBIRTH(Date.valueOf("2019-2-2"));
		// System.out.println(ud.insertRow(user));
		// System.out.println(verifyLogin("an170998.22@gmail.com",
		// "$2a$10$DOWSDz/CyKaJ40hslrk5fe0bsQa.Lg7u5LXl6uYx.b3bxaDaPM7Xm"));
		//System.out.println(selectUSER("12"));
		UserDAO.updateScore(27,UserDAO.selectUserById(27).getSCORE()+10);
		//System.out.println(ud.verifyLogin("an170998.22@gmail.com", BCrypt.hashpw("123456", GlobalConstants.SALT)).getSCORE());
	}
}
