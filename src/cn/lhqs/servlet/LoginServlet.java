package cn.lhqs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.lhqs.bean.Admin;
import cn.lhqs.service.AdminService;
import cn.lhqs.utils.BaseServlet;
import cn.lhqs.utils.CommonUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends BaseServlet {
	private static final long serialVersionUID = 1234L;
	private static final Log logger = LogFactory.getLog(LoginServlet.class);
	private AdminService adminService = new AdminService();

	public String quit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		return "r:/index.jsp";
	}

	public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Admin form = CommonUtil.toBean(request.getParameterMap(), Admin.class);
		try {
			Admin admin = adminService.login(form);
			request.getSession().setAttribute("session_admin", admin);
			logger.info("get sesstion_admin");
			return "r:/index.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			logger.info("get error.jsp");
			return "f:/error/error.jsp";
		}
	}

}
