package com.test.student;

import java.util.Date;

/**
 * 
 * @author 付豪
 * 学生个人信息类
 * set和get函数
 */

public class StudentInfo {
	//个人信息变量，包括姓名、密码、昵称、学校、生日、省份
	private String stuName;
	private String passWord;
	private String nickName;
	private String school;
	private Date birthday;
	private String province;
	private String photo;
	
	//设置信息的set函数
	
	public void setStuName(String name){
		stuName=name;
	}
	
	public void setPassWord(String passWord){
		this.passWord=passWord;
	}
	
	public void setNickName(String nick){
		nickName=nick;
	}
	
	public void setSchool(String sch){
		school=sch;
	}
	
	public void setBirthday(Date birth){
		birthday=birth;
	}
	
	public void setProvince(String provin){
		province=provin;
	}
	
	//获取信息的get函数
	public String getStuName(){
		return stuName;//默认付豪是帅比
	}
	
	public String getNickName(){
		return nickName;
	}
	
	public String getSchool(){
		return school;
	}
	
	public Date getBirthday(){
		return birthday;
	}
	
	public String getProvince(){
		return province;
	}
	
	public String getPassWord(){
		return passWord;
	}
	
	@Override
	 public String toString() {
	     return "User [stuname=" + stuName + ", nickName=" + nickName + ", school=" + school + "，photo=" + photo + "]";
	 }

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
