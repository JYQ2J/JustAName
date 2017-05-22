package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.test.dao.DBUtil;
import com.test.student.StudentInfo;

/**
 * 修改个人资料用servlet
 * Servlet implementation class ModifyInfoServlet
 * @author 付豪
 */
@WebServlet("/ModifyInfoServlet")
public class ModifyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyInfoServlet() {
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
		
		//获取个人资料
		HttpSession session=request.getSession();
		String stuName=(String) session.getAttribute("stuname");
		System.out.println(stuName);
		
		
		
		
		
		String nickNameOrg = request.getParameter("nickName");
		String nickName = new String(nickNameOrg.getBytes("ISO-8859-1"),"UTF-8");
		
		String schoolOrg = request.getParameter("school");
		String school = new String(schoolOrg.getBytes("ISO-8859-1"),"UTF-8");
		
		String birthdayOrg = request.getParameter("birthday");
		String birthday = new String(birthdayOrg.getBytes("ISO-8859-1"),"UTF-8");
				
		String provinceOrg = request.getParameter("province");
		String province = new String(provinceOrg.getBytes("ISO-8859-1"),"UTF-8");
		
		//调用DBUtil.modifyInfo()修改个人资料
		if(DBUtil.modifyInfo(stuName, nickName, school,strToDate(birthday), province))
			{
			//新建stuInfo对象并赋值用json传送给前台
			StudentInfo stuInfo = new StudentInfo();
			DBUtil.initStuInfo(stuName, stuInfo);
			Gson gson = new Gson();
			String str = "";
			PrintWriter out = response.getWriter();
			DBUtil.initStuInfo(stuName, stuInfo);
			str = gson.toJson(stuInfo);
			
			out.println(str.toString());
			out.flush();

			
			
			
			
				/*System.out.println("成功");
				StudentInfo user=new StudentInfo();
				DBUtil.initStuInfo(stuName, user);
				PrintWriter out = response.getWriter();
				//out.print("<script charset='utf-8' language='javascript' type='text/javascript'>alert('修改成功！');window.location.href='information.jsp';</script>"); 
				out.write(user.getNickName());
				//out.print("<script charset='utf-8' language='javascript' type='text/javascript'>alert('修改成功！');window.location.href='information.jsp';</script>"); 
*/			}
		else
			System.out.println("失败");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//json中文问题
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		response.setHeader("pragma","no-cache");
		response.setHeader("cache-control","no-cache");
				
		String nickNameOrg = request.getParameter("dipan");
		String nickName = new String(nickNameOrg.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(nickName);
				
		//获取个人资料
		HttpSession session=request.getSession();
		String stuName=(String) session.getAttribute("stuname");
		
		//System.out.println(stuName);
				
		//test用json初始化个人资料
		StudentInfo stuInfo = new StudentInfo();
		DBUtil.initStuInfo(stuName, stuInfo);
		Gson gson = new Gson();
		String str = "";
		PrintWriter out = response.getWriter();
		str = gson.toJson(stuInfo);
		out.println(str.toString());
		out.flush();
	}
	
	/**
	 * 将String转换成sql.date的函数
	 * @param strDate
	 * @return
	 */
	
	public static java.sql.Date strToDate(String strDate) {  
        String str = strDate;  
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        java.util.Date d = null;  
        try {  
            d = format.parse(str);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        java.sql.Date date = new java.sql.Date(d.getTime());  
        return date;  
    }  

}
