package com.test.friendmessage;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author 付豪
 *
 */

public class FriendMessage {
	private ArrayList<String> agreeStus;
	private ArrayList<String> denyStus;
	private ArrayList<String> askStus;
	
	public ArrayList<String> getAgreeStus() {
		return agreeStus;
	}
	public void setAgreeStus(ArrayList<String> agreeStus) {
		//this.agreeStus.add(stuName);
		this.agreeStus=agreeStus;
	}
	public ArrayList<String> getDenyStus() {
		return denyStus;
	}
	public void setDenyStus(ArrayList<String> denyStus) {
		//denyStus.add(stuName);
		this.denyStus=denyStus;
	}
	public ArrayList<String> getAskStus() {
		return askStus;
	}
	public void setAskStus(ArrayList<String> askStus) {
		//askStus.add(stuName);
		this.askStus=askStus;
	}
	
	
	
	

}
