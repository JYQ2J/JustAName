package com.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库连�?
 * 
 * @author 付豪
 * @TIME 2016�?�?�?
 */
public class ConnUtil {
	public static final String URL = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=UTF-8";
	public static final String NAME = "root";// 数据库用户名
	public static final String PASS = "root";// 数据库用户名密码
	//加载驱动�?
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取连接
	 * 
	 * @return Connection
	 */
	public static Connection getConn() {
		try {
			return DriverManager.getConnection(URL, NAME, PASS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 关闭连接
	 * 
	 * @param conn
	 * @param st
	 * @param rs
	 */
	public static void close(Connection conn, Statement st, ResultSet rs) {
		try {
			if (conn != null)
				conn.close();
			if (st != null)
				st.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
