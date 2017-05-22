package com.test.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.test.dao.DBUtil;
import com.test.passage.CommentInfo;
import com.test.passage.PassageInfo;
import com.test.service.FriendService;
import com.test.service.PassageService;
import com.test.student.StudentInfo;


/**
 * 
 * @author 刘沛
 *
 */

public class PassageImpl implements PassageService {
	private FriendService friendService=new FriendServiceImpl();

	@Override
	public boolean addPassge(String stuName, String content) {
		// TODO Auto-generated method stub
		//获取随机的passage的唯一id，最大值1000，最小值1
		int id =randomNum();
		String sqlCheckID = "select * from passage where id='" + id + "'";
		//确认数据库中没有重复的id
		while(true){
			if(DBUtil.checkPassageID(sqlCheckID))
				break;
			else
				id=randomNum();//重新生成随机数
		}
		
		/*添加passage*/
		
		//获取当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();
		df.format(date);
		Timestamp timestamp = new Timestamp(date.getTime()); //把date类型转换成datetime类型
		
		String sqlAddPassage = "insert into passage(stuname,id,content,time) values('" + stuName + "','"+ id + "','"+ content + "','"+ timestamp + "')";
		if(DBUtil.excute(sqlAddPassage))
			return true;
		return false;
	}

	@Override
	public boolean deletePassage(String stuName, int id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	//产生passage id随机数函数
	public int randomNum(){
		return (int)(1+Math.random()*(1000-1+1));
	}

	//展示个人及好友动态
	@Override
	public ArrayList showPassage(String stuName) {
		
		// TODO Auto-generated method stub
		try {
			ArrayList<PassageInfo> passageList = new ArrayList<PassageInfo>();
			String sqlPassage = "select * from passage order by time" ;//
			ResultSet resultSetPassage = DBUtil.query(sqlPassage);
			//List<String> friends=friendService.friendGroup(stuName);//获取好友列表
			
			while(resultSetPassage.next()){
				//查验是否为好友的或自己的动态
				
				String nameNow=resultSetPassage.getString("stuName");
				if(nameNow.equals(stuName)||friendService.checkFriend(nameNow, stuName)){
					StudentInfo stuInfo2 = new StudentInfo();
					DBUtil.initStuInfo(nameNow, stuInfo2);

				PassageInfo passage = new PassageInfo();
				passage.setId(resultSetPassage.getInt("id"));
				passage.setContent(resultSetPassage.getString("content"));
				passage.setStuName(nameNow);
				passage.setPhoto(stuInfo2.getPhoto());

				
				ArrayList<CommentInfo> commentList = commentDisplay(resultSetPassage.getInt("id"));//commentDisplay返回与动态相匹配的评论list
				passage.setCommentList(commentList);

				//passage.setTime(resultSetPassage.getTimestamp("time"));
				
				/*把从数据库取出的datetime格式的timestamp类型转换成string类型以便传到前端展示*/
				Timestamp ts = resultSetPassage.getTimestamp("time");   
		        String tsStr = "";   
		        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");   
		        try {   
		            tsStr = sdf.format(ts);  
		            passage.setTime(tsStr);
		             
		        } catch (Exception e) {   
		            e.printStackTrace();   
		        }  
				
				
				passageList.add(passage);
				}
			}
			return passageList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public ArrayList passageDisplay(String stuName){
		try {
			ArrayList<PassageInfo> passageList = new ArrayList<PassageInfo>();
			String sqlPassage = "select id,content,time from passage where stuName='" + stuName + "' order by time" ;//查询当前用户是否存在动态的sql语句
			ResultSet resultSetPassage = DBUtil.query(sqlPassage);
			
			
			while(resultSetPassage.next()){
				StudentInfo stuInfo2 = new StudentInfo();
				DBUtil.initStuInfo(stuName, stuInfo2);
				PassageInfo passage = new PassageInfo();
				passage.setId(resultSetPassage.getInt("id"));
				passage.setContent(resultSetPassage.getString("content"));
				passage.setPhoto(stuInfo2.getPhoto());

				
				ArrayList<CommentInfo> commentList = commentDisplay(resultSetPassage.getInt("id"));//commentDisplay返回与动态相匹配的评论list
				passage.setCommentList(commentList);
				//passage.setTime(resultSetPassage.getTimestamp("time"));
				
				/*把从数据库取出的datetime格式的timestamp类型转换成string类型以便传到前端展示*/
				Timestamp ts = resultSetPassage.getTimestamp("time");   
		        String tsStr = "";   
		        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");   
		        try {   
		            tsStr = sdf.format(ts);  
		            passage.setTime(tsStr);
		             
		        } catch (Exception e) {   
		            e.printStackTrace();   
		        }  
				
				
				passageList.add(passage);
			}
			return passageList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	@Override
	public boolean addComment(int keyId, int id, String stuName, String content) {
		String sqlAddComment = "insert into comment(keyId,stuname,id,content) values('" + keyId + "','" + stuName + "','"+ id + "','"+ content + "')";
		if(DBUtil.excute(sqlAddComment))
			return true;
		return false;
	}

	@Override
	public ArrayList commentDisplay(int id) {
		try {
			ArrayList<CommentInfo> commentList = new ArrayList<CommentInfo>();
			String sqlComment = "select content,stuName from comment where id='" + id + "'" ;
			ResultSet resultSetComment = DBUtil.query(sqlComment);
			while(resultSetComment.next()){
				CommentInfo comment = new CommentInfo();
				comment.setStuName(resultSetComment.getString("stuName"));
				comment.setId(id);
				comment.setContent(resultSetComment.getString("content"));				
				
				commentList.add(comment);
			}
			return commentList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}


	

}
