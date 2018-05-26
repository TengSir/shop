package com.oracle.shop.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public abstract class BaseDAOImp implements BaseDAO {
	/*
	 * private ComboPooledDataSource source; { try { source=new
	 * ComboPooledDataSource(); source.setDriverClass("com.mysql.jdbc.Driver");
	 * source.setJdbcUrl(
	 * "jdbc:mysql://127.0.0.1:3306/shop?useUnicode=true&amp;characterEncoding=UTF8"
	 * ); source.setUser("root"); source.setPassword("root");
	 * source.setMaxPoolSize(50); source.setInitialPoolSize(20); } catch
	 * (Exception e) { e.printStackTrace(); } }
	 */

	/*
	 * private Properties p;//定义一个键值对的properties集合对象，用来读取配置文件中的连接数据库的参数 { p=new
	 * Properties(); try { // File f=new File("src/database.properties"); File
	 * path=new File(ClassPath.getClassPath()); File f=new File(new File(new
	 * File(path.toString().split(";")[0]).getParent()).getParent()+
	 * "/webapps/shop/WEB-INF/database.properties");
	 * System.out.println(f.getAbsolutePath()); p.load(new FileInputStream(f));
	 * } catch (FileNotFoundException e) { e.printStackTrace(); } catch
	 * (IOException e) { e.printStackTrace(); } }
	 */

	private Connection con;
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shop?useUnicode=true&amp;characterEncoding=UTF-8", "root",
					"root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * final的获取连接的方法，
	 * 
	 * @return
	 */
	public final Connection getConnection() {
		try {
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shop?useUnicode=true&characterEncoding=UTF8", "root","root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		Connection con = null;
//		try {
//			con = source.getConnection();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		return con;
	}

	public void disposeResource(Connection c, PreparedStatement pre) {
		if (pre != null) {

			try {
				pre.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (c != null) {
			try {
				c.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

	public void disposeResource(Connection c, PreparedStatement pre, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pre != null) {

			try {
				pre.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (c != null) {
			try {
				c.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}
}
