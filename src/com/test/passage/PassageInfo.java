package com.test.passage;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;


/**
 * 保存动态信息的类
 * @author 刘沛
 *
 */

public class PassageInfo {
	int id;
	String stuName;
	String content;
	String time;//本来是mysql的timestamp类型用来接收datetime格式，但是为了在前端展示转换成了string格式
	ArrayList<CommentInfo> commentList;
	private String photo;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setCommentList(ArrayList<CommentInfo> commentList) {
		this.commentList = commentList;
	}
	
    public ArrayList<CommentInfo> getCommentList() {
		return commentList;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}



}
