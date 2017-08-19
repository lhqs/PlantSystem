package cn.lhqs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;

import cn.lhqs.service.DataInfoService;
import cn.lhqs.serviceImpl.DataInfoServiceImpl;

@WebServlet("/DataParamRequest")
public class DataParamRequest extends HttpServlet {
	private static final Log logger = LogFactory.getLog(DataParamRequest.class);
	private static final long serialVersionUID = 1L;
       
    public DataParamRequest() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		DataInfoService ds = new DataInfoServiceImpl();
		String json = JSON.toJSONString(ds);
		
		logger.info("传递的json为："+json);
		response.getWriter().print(json);
		response.getWriter().flush();
		response.getWriter().close();
	}

}
