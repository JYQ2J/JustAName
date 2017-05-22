package com.test.service;

import java.util.ArrayList;
import java.util.List;

import com.test.friendmessage.FriendMessage;
import com.test.student.StudentInfo;

/**
 * 
 * @author 付豪
 *
 */

public interface FriendService {
	public StudentInfo searchFriend(String stuName);//查找朋友
	public ArrayList friendGroup(String stuName);//好友列表
	public ArrayList potentialFriendGroup(String stuName);//可能认识的人
	public boolean checkFriend(String stu1,String stu2);//验证两人是否为好友
	public String sendRequest(String stu1,String stu2);//发送好友申请
	public String handleRequest(String stu1,String stu2,int flag);//处理好友请求
	public FriendMessage notifyMessage(String stuName);//显示同意好友请求，拒绝好友请求和好友请求信息

}
