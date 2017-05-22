package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.test.dao.DBUtil;
import com.test.dao.MyBatisUtil;
import com.test.service.FriendService;
import com.test.service.LoginService;
import com.test.service.impl.FriendServiceImpl;
import com.test.service.impl.LoginServiceImpl;
import com.test.student.StudentInfo;

/**
 * Servlet implementation class LoginServlet
 * @author 刘沛
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService loginService = new LoginServiceImpl();
	private StudentInfo user=new StudentInfo();
	private FriendService friendService=new FriendServiceImpl();

	/**
	 * Default constructor.
	 */
	public LoginServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		response.setCharacterEncoding("utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");

		/*8.27 解决了一天的汉字乱码问题*/
		String stuNameOrg = request.getParameter("stuname");
		String stuName = new String(stuNameOrg.getBytes("ISO-8859-1"),"UTF-8");

		/*密码加密*/
		String passWordOrg = request.getParameter("password");
		String passWord=Encrypt.makeMD5(passWordOrg);
		
		//测试前后台数据交互
		//StudentInfo test=new StudentInfo();
		//test.setStuName(stuName);
		//request.setAttribute("tset", test);
		
		//用session保存用户名字和头像
		HttpSession session=request.getSession();
		session.setAttribute("stuname", stuName);
		
		//System.out.println(session.getAttribute("stuname"));
		
		
		
		String result = loginService.login(stuName, passWord);
		
		
		//测试mybatis
		/*SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
		String statement = "com.test.mapping.studentMapper.getUser";//映射sql的标识字符串
		StudentInfo user = sqlSession.selectOne(statement, stuName);
        System.out.println(user);*/
		
		if (result == "success" && result.equals("success")) {
			//初始化个人资料
			//DBUtil.initStuInfo(stuName, user);
			SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
			String statement = "com.test.mapping.studentMapper.getUser";//映射sql的标识字符串
			StudentInfo user = sqlSession.selectOne(statement, stuName);
	        //System.out.println(user);
			session.setAttribute("nickName", user.getNickName());
			session.setAttribute("school", user.getSchool());
			session.setAttribute("birthday", user.getBirthday());
			session.setAttribute("province", user.getProvince());
			session.setAttribute("photo", user.getPhoto().replace("\\","\\\\"));
			
			//返回结果为“success”，成功登录
			System.out.println(stuName+"登录成功");
			 response.getWriter().write("success");
			 
		}
		else if(result == "stuNameFailed" && result.equals("stuNameFailed")){//返回结果为“stuNameFailed”，用户名不存在
			 response.getWriter().write("stuNameFailed");
		}
		else if(result == "passWordFailed" && result.equals("passWordFailed")){//返回结果为“passWordFailed”，密码错误
			response.getWriter().write("passWordFailed");
		}
		else if(result == "nullStuName" && result.equals("nullStuName")){//返回结果为“null",用户未输入用户名
			 response.getWriter().write("nullStuName");
		}
		else if(result == "nullPassWord" && result.equals("nullPassWord")){//返回结果为“null",用户未输入密码
			 response.getWriter().write("nullPassWord");
		}
		
		
		//测试好友列表
		/*List<String> friends=friendService.friendGroup(stuName);
		for(int i=0;i<friends.size();i++){
			String a=friends.get(i);
			System.out.println(a);
		}*/
		


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
