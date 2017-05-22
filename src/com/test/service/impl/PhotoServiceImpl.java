package com.test.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.test.dao.DBUtil;
import com.test.service.PhotoService;
import com.test.student.Photo;


/**
 * 
 * @author 刘沛
 *
 */

public class PhotoServiceImpl implements PhotoService{

	@Override
	public boolean updatePhoto(String filename, String stuname) {
		 String fileNameReplace = filename.replace("\\", "\\\\");
		 System.out.println(fileNameReplace);
		 String sqlPhotoUpdate = "update stuinfo set photo = '"+fileNameReplace+"'where stuname = '"+stuname+"'";
		 if(DBUtil.excute(sqlPhotoUpdate))
				return true;
			return false;
	}

	//向相册中添加相片及相片描述至数据库
	public boolean uploadPhoto(String filename, String stuname, String title, String description){
		 String fileNameReplace = filename.replace("\\", "\\\\");
		 System.out.println(fileNameReplace);
		//获取当前时间
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date=new Date();
			df.format(date);
			Timestamp timestamp = new Timestamp(date.getTime()); //把date类型转换成datetime类型
			
		 String sqlPhotoInsert = "insert into photo(photo, stuname, title, description, time) values('" + filename + "','" + stuname + "','" + title + "','" + description + "','" + timestamp + "')";
		 if(DBUtil.excute(sqlPhotoInsert))
				return true;
		return false;
		
	}

	@Override
	public ArrayList displayPhoto(String stuname) {
		
		
		try {
			String sqlPhotoDisplay ="select * from photo where stuname='" + stuname + "' order by time";
			ResultSet resultSetPhoto = DBUtil.query(sqlPhotoDisplay);
			ArrayList<Photo> photoList = new ArrayList<Photo>();
			
			while( resultSetPhoto.next()){
				Photo photo = new Photo();
				photo.setStuname(resultSetPhoto.getString("stuname"));
				photo.setPhoto(resultSetPhoto.getString("photo"));
				photo.setTitle(resultSetPhoto.getString("title"));
				photo.setDescription(resultSetPhoto.getString("description"));
				photoList.add(photo);
			}
			return photoList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


}
