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
 * Servlet implementation class AddFriendServlet
 * @author 付豪
 */
@WebServlet("/AddFriendServlet")
public class AddFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FriendService friendService=new FriendServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFriendServlet() {
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
		
		/**发送好友请求的人*/
		String stu2Org = request.getParameter("stuName");
		String stu2 = new String(stu2Org.getBytes("ISO-8859-1"),"UTF-8");
		
		/**处理好友请求的本对象*/
		HttpSession session=request.getSession();
		String stuName=(String) session.getAttribute("stuname");
		
		/**从前台获取接受或拒绝flag*/
		String flagOrg = request.getParameter("flag");
		String f = new String(flagOrg.getBytes("ISO-8859-1"),"UTF-8");
		int flag=Integer.parseInt(f);
		System.out.println(flag);

		/**调用handleRequest处理好友请求*/
		String result=friendService.handleRequest(stu2, stuName, flag);
		
		if(result.equals("agreeSuccess"))
			response.getWriter().write("agreeSuccess");//同意成功
		else if(result.equals("denySuccess"))
			response.getWriter().write("denySuccess");//拒绝成功
		else if(result.equals(null))
			response.getWriter().write("error");//出错
					
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
