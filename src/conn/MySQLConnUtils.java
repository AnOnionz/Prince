package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
  
public class MySQLConnUtils {
  
 public static Connection getMySQLConnection()
         throws ClassNotFoundException, SQLException {
     Connection conn = null;
     String driver = "com.mysql.cj.jdbc.Driver";
     String url ="jdbc:mysql://127.0.0.1:3306/tmdt";
     String userName = "root";
     String password = "1709";
     try {
    	 Class.forName(driver);
    	 conn = DriverManager.getConnection(url,userName,password);
     }catch(Exception e) {
    	 e.printStackTrace();
     }
     return conn;
 }
 /**
	 * @param con
	 * @param stmt
	 * @param rs
	 * To close statements, result sets and Connection 
	 */
	public static void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.getMessage();
		} catch (Exception e) {
			e.getMessage();
		}
	}

	/**
	 * @param con
	 * @param stmt
	 * To close statements and Connection
	 */
	public static void close(Connection con, Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.getMessage();
		} catch (Exception e) {
			e.getMessage();
		}
	}

	/**
	 * @param con
	 * @param pstmt
	 * @param rs
	 * To Close PreparedStatement and Connection
	 */
	public static void close(Connection con, PreparedStatement pstmt,
			ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.getMessage();
		} catch (Exception e) {
			e.getMessage();
		}
	}

	/**
	 * @param con
	 * @param pstmt
	 * @param rs
	 * To Close PreparedStatement and Connection
	 */
	public static void close(Connection con, PreparedStatement pstmt, PreparedStatement pstmt2,
			ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (pstmt2 != null) {
				pstmt2.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.getMessage();
		} catch (Exception e) {
			e.getMessage();
		}
	}

	/**
	 * @param con
	 * To close connection
	 */
	public static void closeConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.getMessage();
		} catch (Exception e) {
			e.getMessage();
		}
	}

	/**
	 * @param conn
	 * @throws SQLException
	 * To Commit and Close the connection
	 */
	public static void commitAndClose(Connection conn) throws SQLException {
		conn.commit();
		conn.close();
	}

  public static void main(String[] args) throws ClassNotFoundException, SQLException {
	 Connection conn = MySQLConnUtils.getMySQLConnection();
	 if(conn!=null) {
		 System.out.println("Connected!");
	 }else {
		 System.out.println("can't connect to database");
	 }
}
}