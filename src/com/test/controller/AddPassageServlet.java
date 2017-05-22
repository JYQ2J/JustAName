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
import com.test.service.RegistService;
import com.test.service.impl.FriendServiceImpl;
import com.test.service.impl.PassageImpl;
import com.test.service.impl.RegistServiceImpl;
import com.test.student.StudentInfo;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class AddPassageServlet
 * @author 刘沛
 */
@WebServlet("/AddPassageServlet")
public class AddPassageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PassageService passageService = new PassageImpl();
	private FriendService friendService=new FriendServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPassageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//json中文问题
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		
		
		//获取passage内容
		String passageOrg = request.getParameter("content");
		String passage = new String(passageOrg.getBytes("ISO-8859-1"),"UTF-8");

		

		//从session中获取stuname
		HttpSession session=request.getSession();
		String stuname=(String)session.getAttribute("stuname");
		

		//添加passage
		if(passageService.addPassge(stuname,passage)){
			System.out.println(stuname+": "+"发布的动态是： "+passage);
			System.out.println("发布动态成功");
			String stuName=(String)session.getAttribute("stuname");//从session中获取用户名
			ArrayList<PassageInfo> passages =passageService.passageDisplay(stuName);
			JSONArray jsonArray = JSONArray.fromObject(passages);
			System.out.println(jsonArray);
			response.getWriter().println(jsonArray);
			

			}


		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("textml;charset=utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		
		HttpSession session=request.getSession();
		String stuName=(String)session.getAttribute("stuname");
		ArrayList<PassageInfo> passages =passageService.showPassage(stuName);
		//ArrayList<StudentInfo> friends =friendService.friendGroup(stuName);
		JSONArray jsonArray = JSONArray.fromObject(passages);
		//JSONArray jsonArray2 = JSONArray.fromObject(friends);
		//System.out.println(jsonArray);
		//System.out.println(jsonArray2);
		response.getWriter().println(jsonArray);

	}

}
