package com.webjjang.member.util.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {
	public final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public final static String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public final static String UID = "JAVA00";
	public final static String UPW = "JAVA00";

	private static boolean checkDriver = false;
	static {
		try {
			Class.forName(DRIVER);
			checkDriver = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws Exception {
		if (checkDriver)
			return DriverManager.getConnection(URL, UID, UPW);
		throw new Exception("DB 드라이버가 읎으");
	}

	public static void close(Connection con, PreparedStatement pstmt) {
		if (con != null)
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		close(con, pstmt);
		if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

	}
}