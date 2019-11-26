package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import conn.MySQLConnUtils;

public class CategoryDAO {
	public static Map<Integer, String> getCategory()  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		Map<Integer, String> list = new HashMap<Integer, String>();
		Category cat = null;
		
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select category_id, name from category");
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					cat = new Category();
					list.put(res.getInt(1), res.getString(2));
				}
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return list;
	}
	public static String getCategoryName(String id)  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res=null;
		String categoryName = null;
		try {
			conn = MySQLConnUtils.getMySQLConnection();
			ps = conn.prepareStatement("select name from category where category_id=?");
			ps.setString(1, id);
			res = ps.executeQuery();
			if (res != null) {
				while (res.next()) {
					categoryName = res.getString(1);
				}
			}
			MySQLConnUtils.close(conn, ps, res);;
		} catch (ClassNotFoundException | SQLException e) {
			MySQLConnUtils.close(conn, ps, res);	
	
		}
		return categoryName;
	}

}
