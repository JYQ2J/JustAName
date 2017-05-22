package com.test.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.test.dao.DBUtil;
import com.test.dao.MyBatisUtil;
import com.test.service.LoginService;
import com.test.student.StudentInfo;

/**
 * 
 * @author 刘沛
 *
 */

public class LoginServiceImpl implements LoginService {

	@SuppressWarnings("unused")
	@Override
	public String login(String stuName, String passWord) {
		if( stuName == null ||stuName.length() <= 0){
			return "nullStuName";
		}else if( passWord == null || passWord.length() <= 0){
			return "nullPassWord";
		}else if((stuName.length() > 0 ) && (passWord.length() > 0 )){
			/*String sqlStuName = "select * from stuinfo where stuName='" + stuName + "'";//查询用户输入的用户名是否存在的sql语句
			String sqlPassWord = "select * from stuinfo where stuName='" + stuName + "' and passWord='" + passWord + "'";//查询用户输入的密码是否与用户名一致的sql语句
			ResultSet resultSetStuName = DBUtil.query(sqlStuName);//查询数据库中是否有该用户名
			ResultSet resultSetPassWord = DBUtil.query(sqlPassWord);*/
			
			//调用getUser查询是否有该用户名
			SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
			String statement = "com.test.mapping.studentMapper.getUser";//映射sql的标识字符串
			StudentInfo user = sqlSession.selectOne(statement, stuName);
			sqlSession.close();
		
			if(user==null||user.equals(null))
				return "stuNameFailed";
			
			
			else if(user.getPassWord()==passWord||user.getPassWord().equals(passWord)){
				return "success";
			}
			
		}
		return "passWordFailed";
	}


}
