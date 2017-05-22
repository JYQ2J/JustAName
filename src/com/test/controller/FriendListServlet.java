package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.passage.PassageInfo;
import com.test.service.FriendService;
import com.test.service.impl.FriendServiceImpl;
import com.test.student.StudentInfo;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class FriendListServlet
 * @author 付豪
 */
@WebServlet("/FriendListServlet")
public class FriendListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FriendService friendService=new FriendServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("utf-8");
		response.setContentType("textml;charset=utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		
		HttpSession session=request.getSession();
		String stuName=(String)session.getAttribute("stuname");
		//System.out.println(stuName);
		ArrayList<StudentInfo> friends =friendService.potentialFriendGroup(stuName);
		//System.out.println(friends);
		JSONArray jsonArray = JSONArray.fromObject(friends);
		//System.out.println(jsonArray.toString());
		response.getWriter().println(jsonArray.toString());
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
		ArrayList<StudentInfo> friends =friendService.friendGroup(stuName);
		//System.out.println(friends);
		JSONArray jsonArray = JSONArray.fromObject(friends);
		//System.out.println(jsonArray.toString());
		response.getWriter().println(jsonArray.toString());
	}

}
