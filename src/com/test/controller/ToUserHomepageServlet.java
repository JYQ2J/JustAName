package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.test.dao.DBUtil;
import com.test.passage.PassageInfo;
import com.test.service.FriendService;
import com.test.service.PassageService;
import com.test.service.impl.FriendServiceImpl;
import com.test.service.impl.PassageImpl;
import com.test.student.StudentInfo;
import com.test.student.UserHomepageInfo;

/**
 * Servlet implementation class ToUserHomepageServlet
 * @author 刘沛
 */
@WebServlet("/ToUserHomepageServlet")
public class ToUserHomepageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentInfo stuInfo = new StudentInfo();
	private PassageService passageService=new PassageImpl();
	private FriendService friendService=new FriendServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToUserHomepageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");	
		response.setCharacterEncoding("utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		
		String stuNameOrg = request.getParameter("stuID");
		String stuName = new String(stuNameOrg.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(stuName);
		
		//初始化个人信息并用json传给前台
		//StudentInfo stuInfo = new StudentInfo();
		DBUtil.initStuInfo(stuName, stuInfo);
		System.out.println(stuInfo);
		
		Gson gson = new Gson();
		String str = "";
		PrintWriter out = response.getWriter();
		//DBUtil.initStuInfo(stuName, stuInfo);
		str = gson.toJson(stuInfo);
		
		out.println(str.toString());
		out.flush();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");	
		response.setCharacterEncoding("utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		
		UserHomepageInfo user = new UserHomepageInfo();
		//String stuNameOrg = request.getParameter("stuID");
		//String stuName = new String(stuNameOrg.getBytes("ISO-8859-1"),"UTF-8");
		//System.out.println(stuName);
		
		//初始化个人信息并用json传给前台
		//StudentInfo stuInfo = new StudentInfo();
		//DBUtil.initStuInfo(stuName, stuInfo);
		//System.out.println(stuInfo);
		
		//个人资料
		Gson gson = new Gson();
		String str = "";
		PrintWriter out = response.getWriter();
		//DBUtil.initStuInfo(stuName, stuInfo);
		
		//判断是否为好友以便隐藏加为好友按钮
		HttpSession session=request.getSession();
		String stu1=(String) session.getAttribute("stuname");
		String stu2=stuInfo.getStuName();
		user.setIsFriend(friendService.checkFriend(stu1, stu2));
		//System.out.println(friendService.checkFriend(stu1, stu2));
		
		//个人动态
		ArrayList<PassageInfo> passages =passageService.passageDisplay(stuInfo.getStuName());
		
		user.setStuInfo(stuInfo);
		user.setPassageList(passages);
		str = gson.toJson(user);
		
		System.out.println(str);
		
		out.println(str.toString());
		out.flush();
	}

}
