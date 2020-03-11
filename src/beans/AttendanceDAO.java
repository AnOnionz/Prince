package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import conn.MySQLConnUtils;

public class AttendanceDAO {
	
	public static Attendance selectAttendance(String userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		Attendance ace = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select attendance_id, user_id, date_attendance, count_attendance from attendance where user_id=?");
			ps.setString(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					ace = new Attendance();
					ace.setId(res.getInt(1));
					ace.setUser_id(res.getInt(2));
					ace.setDate_attendance(res.getString(3));
					ace.setCount_attendance(res.getInt(4));

				}
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);
		}
		return ace;
	}
	
	public static void updateCountAttendance(int userId, int number)  {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update attendance set count_attendance = ? where user_id = ?");
			ps.setInt(1,number);
			ps.setInt(2,userId);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
		}
	}
	
	public static void updateDateAttendance(int userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update attendance set date_attendance = ? where user_id = ?");
			java.util.Date date = new java.util.Date();
			java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
			ps.setTimestamp(1,timestamp);
			ps.setInt(2,userId);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
		}
	}
	
	public static void insertRow(int user_id) {
		Connection conn = null;
		PreparedStatement ps1 = null;
		//PreparedStatement ps2 = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement(
					"insert into attendance (user_id, date_attendance, count_attendance) values(?,?,?)");
			ps1.setInt(1, user_id);
			ps1.setNull(2, java.sql.Types.TIMESTAMP);
			ps1.setInt(3, 0);
//			ps1.execute();
			ps1.executeUpdate();
			//ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
			//res = ps2.executeQuery();
//			if (res != null) {
//				while (res.next()) {
//					id = res.getString(1);
//				}
//			}
			conn.commit();
			MySQLConnUtils.close(conn, ps1,  res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			System.out.println(e);

			MySQLConnUtils.close(conn, ps1,  res);
		}
	}
	//them user vao luckywheel tabel
	public static void insertToLuckyWheel(int user_id) {
		Connection conn = null;
		PreparedStatement ps1 = null;
		//PreparedStatement ps2 = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement(
					"insert into luckywheel (user_id, date_luckywheel) values(?,?)");
			ps1.setInt(1, user_id);
			ps1.setNull(2, java.sql.Types.TIMESTAMP);
//			ps1.execute();
			ps1.executeUpdate();
			//ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
			//res = ps2.executeQuery();
//			if (res != null) {
//				while (res.next()) {
//					id = res.getString(1);
//				}
//			}
			conn.commit();
			MySQLConnUtils.close(conn, ps1,  res);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			System.out.println(e);

			MySQLConnUtils.close(conn, ps1,  res);
		}
	}
	public static void main(String[] args) {
		AttendanceDAO ad = new AttendanceDAO();

	//	ad.insertRow(6);
		ad.insertToLuckyWheel(7);
		

	}
}

