package cn.lhqs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.druid.util.StringUtils;

import cn.lhqs.bean.Admin;
import cn.lhqs.service.AdminService;

@WebServlet("/TempServlet")
public class TempServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Log logger = LogFactory.getLog(TempServlet.class);  
    public TempServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取客户端传递过来参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		logger.info("username--->"+username);
		logger.info("password--->"+password);
		//如果用户名和密码不为空
		HttpSession session = null;
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
			response.getWriter().print("-1");//错误码-1 :   用户名和密码不能为空！
		}else{
			//初始化LoginService
			AdminService loginService = new AdminService();
			//接下来判断用户名是否存在
			Admin admin = loginService.regist(username);
			if(admin == null){
				response.getWriter().print("-2");//错误码-2 :   用户名不存在！
			}else
				//如果用户名存在，那么验证用户名和密码是否匹配
				if(!username.equals(admin.getUsername()) || !password.equals(admin.getPassword())){
					response.getWriter().print("-3");//错误码-3 :   用户名或密码错误！
				}else{
					//如果能到这一步，就说明用户的确存在，而且账号密码也正确。那么就把user放在session中
					response.getWriter().print("1");
//					session.setAttribute("admin", admin);
//					session.setAttribute("adminname", admin.getUsername());
				}
		}
	}

}
