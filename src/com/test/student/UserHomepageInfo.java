package com.test.student;

import java.util.ArrayList;

/**
 * @author 刘沛
 */

import com.test.passage.PassageInfo;

//类UserHomepageInfo用于加载UserHomepage，包含stuInfo和passage
public class UserHomepageInfo {

	private ArrayList<PassageInfo> passageList;
	private StudentInfo stuInfo;
	private boolean isFriend;

	public ArrayList<PassageInfo> getPassageList() {
		return passageList;
	}
	public void setPassageList(ArrayList<PassageInfo> passageList) {
		this.passageList = passageList;
	}
	public StudentInfo getStuInfo() {
		return stuInfo;
	}
	public void setStuInfo(StudentInfo stuInfo) {
		this.stuInfo = stuInfo;
	}
	public void setIsFriend(boolean isFriend){
		this.isFriend=isFriend;
	}
}
