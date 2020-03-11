package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import conn.MySQLConnUtils;

public class TransactionDAO {
	public static String insertRow(Transaction tran) {
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		String id = null;
		ResultSet res = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			conn.setAutoCommit(false);
			ps1 = conn.prepareStatement(
					"insert into history_transaction(transaction_name, user_id, created_time, score, status) values (?,?,?,?,?)");
			ps1.setString(1, tran.getTransaction_name());
			ps1.setInt(2, tran.getUser_id());
			ps1.setTimestamp(3, tran.getCreate_time());
			ps1.setInt(4, tran.getScore());
			ps1.setInt(5, tran.getStatus());
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
	public static ArrayList<Transaction> getListTransaction(int userId)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		ArrayList<Transaction> listTran = new ArrayList<Transaction>();
		Transaction tran = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select transaction_id, transaction_name, user_id, created_time, score, status from history_transaction where user_id = ?");
			ps.setInt(1, userId);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					tran = new Transaction();
					tran.setTransaction_id(res.getInt(1));
					tran.setTransaction_name(res.getString(2));
					tran.setUser_id(res.getInt(3));
					tran.setCreate_time(res.getTimestamp(4));
					tran.setScore(res.getInt(5));
					tran.setStatus(res.getInt(6));
					listTran.add(tran);
					
					
				}
				
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return listTran;
	}
	

}
