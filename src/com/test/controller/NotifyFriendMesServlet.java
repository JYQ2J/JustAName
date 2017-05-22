package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.test.dao.DBUtil;
import com.test.friendmessage.FriendMessage;
import com.test.service.FriendService;
import com.test.service.impl.FriendServiceImpl;

/**
 * Servlet implementation class NotifyFriendMesServlet
 * @author 付豪
 */
@WebServlet("/NotifyFriendMesServlet")
public class NotifyFriendMesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FriendService friendService=new FriendServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotifyFriendMesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//json中文问题
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		
		//获取用户名
		HttpSession session=request.getSession();
		String stuName=(String) session.getAttribute("stuname");
		
		FriendMessage friendMessage=friendService.notifyMessage(stuName);
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		String str = gson.toJson(friendMessage);	
		out.println(str.toString());
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
