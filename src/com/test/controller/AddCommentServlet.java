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
import com.test.service.PassageService;
import com.test.service.impl.PassageImpl;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class AddCommentServlet
 * @author 刘沛
 */
@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PassageService passageService=new PassageImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommentServlet() {
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
				
				String commentOrg = request.getParameter("comment");
				String idOrg = request.getParameter("id");
				String comment = new String(commentOrg.getBytes("ISO-8859-1"),"UTF-8");
				
				int id = Integer.parseInt(idOrg);
				int keyId = (int)(1+Math.random()*(1000-1+1));
				
				//从session中获取stuname
				HttpSession session=request.getSession();
				String stuname=(String)session.getAttribute("stuname");
				
				if(passageService.addComment(keyId, id, stuname, comment)){
					System.out.println("发表评论成功");
					String stuName=(String)session.getAttribute("stuname");//从session中获取用户名
					ArrayList<PassageInfo> passages =passageService.passageDisplay(stuName);
					JSONArray jsonArray = JSONArray.fromObject(passages);
					//System.out.println(jsonArray);
					response.getWriter().println(jsonArray);	
				}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
