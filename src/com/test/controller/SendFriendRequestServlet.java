package com.test.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.service.FriendService;
import com.test.service.impl.FriendServiceImpl;

/**
 * Servlet implementation class SendFriendRequestServlet
 * @author 付豪
 */
@WebServlet("/SendFriendRequestServlet")
public class SendFriendRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FriendService friendService=new FriendServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendFriendRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//数据传输格式问题
		response.setContentType("text/html;charset=UTF-8");
		
		response.setCharacterEncoding("utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
		
		/**接收好友请求的人*/
		String stu2Org = request.getParameter("resultName");
		String stu2 = new String(stu2Org.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(stu2);
		
		/**发送好友请求的本对象*/
		HttpSession session=request.getSession();
		String stuName=(String) session.getAttribute("stuname");
		
		String result=friendService.sendRequest(stuName, stu2);
		
		if(result=="alreadyFriends"||result.equals("alreadyFriends"))
			response.getWriter().write("alreadyFriends");//已经是好友
		else if(result=="alreadySend"||result.equals("alreadySend"))
			response.getWriter().write("alreadySend");//已经发送好友请求
		else if(result=="sendSuccess"||result.equals("sendSuccess"))
			response.getWriter().write("sendSuccess");//发送成功
		else if(result=="failed"||result.equals("failed"))
			response.getWriter().write("failed");//出错
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
