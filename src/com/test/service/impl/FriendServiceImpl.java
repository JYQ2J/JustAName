package com.test.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.test.dao.DBUtil;
import com.test.dao.MyBatisUtil;
import com.test.friendmessage.FriendMessage;
import com.test.passage.PassageInfo;
import com.test.service.FriendService;
import com.test.student.StudentInfo;

/**
 * 
 * @author 付豪
 *
 */

public class FriendServiceImpl implements FriendService {
	/**查找用户*/
	@Override
	public StudentInfo searchFriend(String stuName) {
		// TODO Auto-generated method stub
		String sql = "select * from stuinfo where stuName='" + stuName + "'";
		if(!DBUtil.check(sql))
			return null;
		else{
			SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
			String statement = "com.test.mapping.studentMapper.getUser";//映射sql的标识字符串
			StudentInfo searchedUser = sqlSession.selectOne(statement, stuName);
			sqlSession.close();		
			return searchedUser;
		}
	}
	
	/**好友列表*/
	@Override
	public ArrayList friendGroup(String stuName) {
		// TODO Auto-generated method stub
		ArrayList<StudentInfo> friendsList = new ArrayList<StudentInfo>();
		String sql = "select * from friends where stu1='" + stuName + "' or stu2='" + stuName + "'";
		ResultSet resultSet = DBUtil.query(sql);
		//List<String> friGroup=new ArrayList<String>();
		try {
			while(resultSet.next()){
				if(resultSet.getString("stu1")==stuName||resultSet.getString("stu1").equals(stuName)){
					//System.out.println(resultSet.getString("stu2"));
					//friGroup.add(resultSet.getString("stu2"));
					SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
					String statement = "com.test.mapping.studentMapper.getUser";//映射sql的标识字符串
					StudentInfo friend = sqlSession.selectOne(statement, resultSet.getString("stu2"));
					//System.out.println(friend);
					sqlSession.close();
					friendsList.add(friend);
				}
				else{
					//friGroup.add(resultSet.getString("stu1"));
					SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
					String statement = "com.test.mapping.studentMapper.getUser";//映射sql的标识字符串
					StudentInfo friend = sqlSession.selectOne(statement, resultSet.getString("stu1"));
					//System.out.println(friend);
					sqlSession.close();
					friendsList.add(friend);
				}
			}			
			return friendsList;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 可能认识的人
	 */
	@Override
	public ArrayList potentialFriendGroup(String stuName) {
		// TODO Auto-generated method stub
		int num=0;
		ArrayList<StudentInfo> potentialFriend = new ArrayList<StudentInfo>();
		StudentInfo userInfo=new StudentInfo();
		DBUtil.initStuInfo(stuName, userInfo);
		String school=userInfo.getSchool();
		String province=userInfo.getProvince();
		String sql = "select * from stuinfo where stuName!='" + stuName + "'";
		ResultSet resultSet = DBUtil.query(sql);
		//List<String> friGroup=new ArrayList<String>();
		
		try {
			while(resultSet.next()){
				//System.out.println(resultSet.getString("school"));
				if(resultSet.getString("school")!=null&&resultSet.getString("province")!=null){
				if(!checkFriend(stuName,resultSet.getString("stuName"))){
				if(resultSet.getString("school").equals(school)||resultSet.getString("province").equals(province)){
					//System.out.println(resultSet.getString("stu2"));
					//friGroup.add(resultSet.getString("stu2"));
					SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
					String statement = "com.test.mapping.studentMapper.getUser";//映射sql的标识字符串
					StudentInfo friend = sqlSession.selectOne(statement, resultSet.getString("stuName"));
					sqlSession.close();
					potentialFriend.add(friend);
					num++;
					if(num==4)
						break;
				}
				
			}
			}
			}
			return potentialFriend;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

	/**发送好友请求*/
	@Override
	public String sendRequest(String stu1,String stu2) {
		// TODO Auto-generated method stub
		/**
		 * stu1为发送好友请求者，stu2为接收者即处理者
		 */
		
		//先查询两人是否为好友关系
		if(checkFriend(stu1,stu2))
			return "alreadyFriends";//已经是好友
		else{
			//查询是否已经申请好友
			System.out.println(stu1);
			System.out.println(stu2);
			String sqlCheckSend = "select * from friendrequest where stu1='" + stu1 + "' and stu2='" + stu2 + "'" ;
			if(DBUtil.check(sqlCheckSend))
				return "alreadySend";//已经发送好友请求
			
			String waiting="waiting";//表示等待状态
			//获取当前时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date=new Date();
			df.format(date);
			Timestamp timestamp = new Timestamp(date.getTime()); //把date类型转换成datetime类型
			
			String sqlUpdateRequest = "insert into friendrequest(stu1,stu2,state,time) values('" + stu1 + "','"+ stu2 + "','"+ waiting + "','"+ timestamp + "')";
			if(DBUtil.excute(sqlUpdateRequest))
				return "sendSuccess";//成功发送好友请求
		}
		
		return "failed";
	}

	/**处理好友请求*/
	@Override
	public String handleRequest(String stu1, String stu2,int flag) {
		// TODO Auto-generated method stub
		/**
		 * stu1为发送好友请求者，stu2为接收者即处理者
		 */
		/*接受好友请求*/
		if(flag==0){
		//向friends表中插入一对好友
		String sqlInsert = "insert into friends(stu1,stu2) values('" + stu1 + "','"+ stu2 + "')";
		if(DBUtil.excute(sqlInsert)){
			//修改friendrequest表中的state信息为"agree"
			String sqlUpdate="update friendrequest set state='agree' where stu1='"+stu1+"' and stu2='"+stu2+"'";
			if(DBUtil.excute(sqlUpdate))
				return "agreeSuccess";
		}
		}
		
		/*拒绝好友请求*/
		if(flag==1){
			//修改friendrequest表中的state信息为"deny"
			String sqlUpdate="update friendrequest set state='deny' where stu1='"+stu1+"' and stu2='"+stu2+"'";
			if(DBUtil.excute(sqlUpdate))
				return "denySuccess";
		}
	
		return null;
	}

	@Override
	public boolean checkFriend(String stu1,String stu2) {
		// TODO Auto-generated method stub
		//查询两人是否为好友关系
		String sqlCheckFriend = "select * from friends where stu1='" + stu1 + "' and stu2='" + stu2 + "'" ;
		String sqlCheckFriend2 = "select * from friends where stu1='" + stu2 + "' and stu2='" + stu1 + "'" ;
		if(!DBUtil.checkPassageID(sqlCheckFriend)||!DBUtil.checkPassageID(sqlCheckFriend2))
			return true;//已经是好友
		else
			return false;
	}

	
	/**显示同意好友请求，拒绝好友请求和好友请求信息*/
	@Override
	public FriendMessage notifyMessage(String stuName) {
		// TODO Auto-generated method stub
		//新建FriendMessage对象
		FriendMessage friendMessage=new FriendMessage();
		/*查询同意好友请求信息*/
		String sqlCheckAgree = "select * from friendrequest where stu1='" + stuName + "' and state='agree' order by time" ;
		ResultSet resultSetAgree = DBUtil.query(sqlCheckAgree);
		
		//ArrayList对象保存查询到的名字
		ArrayList<String> agreeStus=new ArrayList<String>();
		ArrayList<String> denyStus=new ArrayList<String>();
		ArrayList<String> askStus=new ArrayList<String>();
		
		
		//把姓名加入FriendMessage对象list内
		try {
			while(resultSetAgree.next()){
				//System.out.println(resultSetAgree.getString("stu2"));
				agreeStus.add(resultSetAgree.getString("stu2"));
			}
			friendMessage.setAgreeStus(agreeStus);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		//删除已经查阅的同意好友请求信息
		String sqlDeleteAgree = "delete from friendrequest where stu1='" + stuName + "' and state='agree'";
		DBUtil.excute(sqlDeleteAgree);
		
		/*查询拒绝好友请求信息*/
		String sqlCheckDeny = "select * from friendrequest where stu1='" + stuName + "' and state='deny' order by time" ;
		ResultSet resultSetDeny = DBUtil.query(sqlCheckDeny);
		//把姓名加入FriendMessage对象list内
		try {
			while(resultSetDeny.next()){
			//friendMessage.setDenyStus(resultSetDeny.getString("stu2"));
				denyStus.add(resultSetDeny.getString("stu2"));
			}
			friendMessage.setDenyStus(denyStus);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		//删除已经查阅的拒绝好友请求信息
		String sqlDeleteDeny = "delete from friendrequest where stu1='" + stuName + "' and state='deny'";
		DBUtil.excute(sqlDeleteDeny);
		
		/*查询好友请求信息*/
		String sqlCheckAsk = "select * from friendrequest where stu2='" + stuName + "' and state='waiting' order by time" ;
		ResultSet resultSetAsk = DBUtil.query(sqlCheckAsk);
		//把姓名加入FriendMessage对象list内
		try {
			while(resultSetAsk.next()){
				//System.out.println(resultSetAsk.getString("stu1"));
			//friendMessage.setAskStus(resultSetAsk.getString("stu1"));
				askStus.add(resultSetAsk.getString("stu1"));
			}
			friendMessage.setAskStus(askStus);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
			
		return friendMessage;
	}

	

	

	

}
