package com.test.service.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.test.dao.DBUtil;
import com.test.dao.MyBatisUtil;
import com.test.service.RegistService;
import com.test.student.StudentInfo;

/**
 * 
 * @author 刘沛
 *
 */

public class RegistServiceImpl implements RegistService {

	@Override
	public String regist(StudentInfo register) {
		//String stuId = UUID.randomUUID().toString().substring(0, 10).replace("-", "");
		/*String sql = "insert into stuinfo(stuname,password) values('" + stuName + "','"
				+ passWord + "')";*/
		
		if(register.getStuName() == null || register.getStuName().length() <= 0){
			return "nullStuName";
		}else if(register.getPassWord() == null || register.getPassWord().length() <= 0){
			return "nullPassWord";
		}
		
		//调用addUser
		SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
		String statement = "com.test.mapping.studentMapper.addUser";//映射sql的标识字符串
		
		int insResult=sqlSession.insert(statement,register);
		if(insResult>0)
			return "success";
		else
			return "failed";
		
		
		
		/*if (DBUtil.excute(sql)) {
			return "success";
		}else if(register.getStuName() == null || register.getStuName().length() <= 0){
			return "nullStuName";
		}else if(register.getPassWord() == null || register.getPassWord().length() <= 0){
			return "nullPassWord";
		}*/
		/*return "failed";*/
	}

}
