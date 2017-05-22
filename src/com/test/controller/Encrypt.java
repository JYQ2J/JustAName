package com.test.controller;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * 密码加密用函数
 * 输入密码返回加密后的字符串
 * @author 刘沛
 */

public class Encrypt {
	
	public static String makeMD5(String password) {
		// TODO Auto-generated method stub
	MessageDigest summary;
		try{
		summary = MessageDigest.getInstance("MD5");//生成一个MD5加密计算摘要
		summary.update(password.getBytes());
		String pwd = new BigInteger(1,summary.digest()).toString(16);
		System.err.println(pwd);
		return pwd;
		}catch (Exception e){
			e.printStackTrace();
		}
		return password;
	}


}
