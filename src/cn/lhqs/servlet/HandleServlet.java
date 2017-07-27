package cn.lhqs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.lhqs.utils.BaseServlet;

@WebServlet("/HandleServlet")

public class HandleServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    
    public HandleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test-one");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().println("just to test it ");
		System.out.println("test-two");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		System.out.println("name-->"+name);
		doGet(request, response);
	}

}
