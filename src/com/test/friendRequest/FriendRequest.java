package com.test.friendRequest;

import java.sql.Timestamp;

/**
 * 
 * @author 付豪
 *
 */

public class FriendRequest {
	private String stu1;
	private String stu2;
	private String state;
	private Timestamp time;
	
	public String getStu1() {
		return stu1;
	}
	public void setStu1(String stu1) {
		this.stu1 = stu1;
	}
	public String getStu2() {
		return stu2;
	}
	public void setStu2(String stu2) {
		this.stu2 = stu2;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	

}
