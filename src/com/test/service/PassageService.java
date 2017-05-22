package com.test.service;

import java.util.ArrayList;

/**
 * 
 * @author 刘沛
 *
 */

public interface PassageService {
	
	public boolean addPassge(String stuName,String content);//发布动态
	public ArrayList showPassage(String stuName);//显示个人及好友动态
	public boolean deletePassage(String stuName,int id);//删除动态
	public ArrayList passageDisplay(String stuname);
	public ArrayList commentDisplay(int id);
	public boolean addComment(int keyId, int id, String stuName, String content);



}
