package cn.lhqs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.lhqs.service.UserService;
import cn.lhqs.serviceImpl.UserServiceImpl;
import cn.lhqs.utils.BaseServlet;

@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		if (username == null) {
			return "r:/index.jsp";
		}
		String session  = (String) request.getSession().getAttribute("username");
		UserService service = new UserServiceImpl();
		Boolean bool = service.delete(username,session);
		if(bool == false) {
			request.setAttribute("msg", "删除成功！");
			return "r:/demo/userList.jsp";
			
		}else {
//			PrintWriter writer = response.getWriter();
//			String header = "<script type=\"text/javascript\">alert(\"删除失败\")</script>";
//			writer.print(header);
//			writer.flush();
//			writer.close();
			return null;
		}
	}
	/**
	 * 修改用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String username = request.getParameter("username");
//		UserService us = new UserServiceImpl();
		
	}
	/**
	 * 添加用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String session  = (String) request.getSession().getAttribute("username");
		UserService us = new UserServiceImpl();
		us.insert(username, password,session);
		return "r:/demo/userList.jsp";
		
	}

}
