package cn.lhqs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.lhqs.bean.JsonData;
import cn.lhqs.bean.User;
import cn.lhqs.service.UserService;
import cn.lhqs.serviceImpl.UserServiceImpl;

/**
 * 登陆处理类
 */
@WebServlet("/LoginHandleServlet")
public class LoginHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoginHandleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonData jd = new JsonData();  
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserService userService = new UserServiceImpl();
		User userObject = userService.getUserObject(username);
		
		int temp = 0;
		for(String user : userService.findAllUsername()) {
			if(user.equals(username)) {temp ++;}
		}
		if(temp == 0) {
			jd.setSuccess(false);
			jd.setMsg("你输入的用户名不存在！");
		}else if(userObject.getPassword().equals(password)) {
			jd.setSuccess(true);
			request.getSession().setAttribute("username", username);
		} else {
			jd.setSuccess(false);
			jd.setMsg("你输入的用户名与密码不匹配");
		}
		String json = JSON.toJSONString(jd);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.print(json);
		writer.flush();
		writer.close();
	}

}
