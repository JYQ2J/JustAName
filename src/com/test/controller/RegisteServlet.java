package com.test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.service.RegistService;
import com.test.service.impl.RegistServiceImpl;
import com.test.student.StudentInfo;

/**
 * Servlet implementation class RegisteServlet
 * @author 刘沛
 */
public class RegisteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegistService registService = new RegistServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*8.27 解决了一天的汉字乱码问题*/
		String stuNameOrg = request.getParameter("stuname");
		String stuName = new String(stuNameOrg.getBytes("ISO-8859-1"),"UTF-8");
		/*
		 * 密码加密
		 */
		String passWordOrg = request.getParameter("password");
		String passWord=Encrypt.makeMD5(passWordOrg);
		
		//用session保存用户名字
		HttpSession session=request.getSession();
		session.setAttribute("stuname", stuName);
		System.out.println(session.getAttribute("stuname"));
		
		//新建studentInfo对象
		StudentInfo register=new StudentInfo();
		register.setStuName(stuName);
		register.setPassWord(passWord);
		register.setPhoto("images/photo1.jpg");
		
		String result = registService.regist(register);
		if (result == "success" && result.equals("success")) {
			response.getWriter().write("success");
		}else if(result == "nullStuName" && result.equals("nullStuName")){//返回结果为“nullStuName",用户未输入用户名
			response.getWriter().write("nullStuName");
		}else if(result == "nullPassWord" && result.equals("nullPassWord")){//返回结果为“nullPassWord",用户未输入密码
			response.getWriter().write("nullPassWord");
		}else {
			response.sendRedirect("failed.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
