package com.test.service;

import java.util.ArrayList;

/**
 * 
 * @author 刘沛
 *
 */

public interface PhotoService {
	public boolean updatePhoto( String filename, String stuname);
	public boolean uploadPhoto( String filename, String stuname, String title, String description);
	public ArrayList displayPhoto( String stuname );


}
