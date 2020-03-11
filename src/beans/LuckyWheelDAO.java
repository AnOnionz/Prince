package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.MySQLConnUtils;

public class LuckyWheelDAO {
	public static LuckyWheel selectLuckyWheel(String userId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		LuckyWheel lw = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn
					.prepareStatement("select luckywheel_id, user_id, date_luckywheel from luckywheel where user_id=?");
			ps.setString(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					lw = new LuckyWheel();
					lw.setId(res.getInt(1));
					lw.setUser_id(res.getInt(2));
					lw.setDate_luckywheel(res.getString(3));

				}
			}
			MySQLConnUtils.close(conn, ps, res);
			;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);
		}
		return lw;

	}

	public static void updateDateLuckyWheel(int userId) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("update luckywheel set date_luckywheel = ? where user_id = ?");
			java.util.Date date = new java.util.Date();
			java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
			ps.setTimestamp(1, timestamp);
			ps.setInt(2, userId);
			ps.executeUpdate();
			MySQLConnUtils.close(conn, ps);
		} catch (ClassNotFoundException | SQLException e) {
			e.getMessage();
			MySQLConnUtils.close(conn, ps);
		}
	}

	public static void main(String[] args) {
		LuckyWheelDAO lwdao = new LuckyWheelDAO();
		LuckyWheel lw;
		lw = lwdao.selectLuckyWheel("1");
		System.out.println(lw.getId());
		System.out.println(lw.getUser_id());
		System.out.println(lw.getDate_luckywheel());
		lwdao.updateDateLuckyWheel(1);
	}
}
