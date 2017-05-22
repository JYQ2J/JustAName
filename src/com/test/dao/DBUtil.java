package com.test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.test.student.StudentInfo;

public class DBUtil {
	/**
	 * 执行添加删除修改
	 * @author 付豪
	 * @param sql
	 * @return boolean
	 */
	public static boolean excute(String sql) {
		Connection con = ConnUtil.getConn();
		Statement stmt = null;
		try {
			stmt = con.createStatement();
			int num = stmt.executeUpdate(sql);
			return num > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			ConnUtil.close(con, stmt, null);
		}
	}

	/**
	 * 执行查询
	 * 
	 * @param sql
	 * @return ResultSet
	 */
	public static ResultSet query(String sql) {
		Connection con = ConnUtil.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 从数据库中取出个人资料并赋值给StudentInfo对象
	 * @param name
	 * @param student
	 */
	
	public static void initStuInfo(String name,StudentInfo student){
		String sql = "select * from stuinfo where stuname='" + name + "'";
		Connection con = ConnUtil.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			student.setStuName(name);
			student.setNickName(rs.getString("nickName"));
			student.setSchool(rs.getString("school"));
			student.setBirthday(rs.getDate("birthday"));
			student.setProvince(rs.getString("province"));
			student.setPhoto(rs.getString("photo"));

			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			ConnUtil.close(con, stmt, null);
		}
		
	}
	
	/**
	 * 修改个人资料用函数
	 * @param stuName
	 * @param nickName
	 * @param school
	 * @param province
	 * @return
	 */
	
	public static boolean modifyInfo(String stuName,String nickName,String school,Date birthday,String province){
		Connection con = ConnUtil.getConn();
		Statement stmt = null;
		String sql = "update stuinfo set nickName='"+nickName+"',school='"+school+"',birthday='"+birthday+"',province='"+province+"'where stuName='"+stuName+"'";
		try {
			stmt = con.createStatement();
			int num = stmt.executeUpdate(sql);
			return num > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			ConnUtil.close(con, stmt, null);
		}
	}
	
	/**
	 * 查询有无重复passage id
	 * @param sql
	 * @return
	 */
	
	public static boolean checkPassageID(String sql){
		Connection con = ConnUtil.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			return false;
			}	
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			ConnUtil.close(con, stmt, null);
		}
		return false;
	}
	
	public static boolean check(String sql){
		Connection con = ConnUtil.getConn();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			return true;
			}	
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			ConnUtil.close(con, stmt, null);
		}
		return false;
	}
	
	
}
