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

/**
 * 获取sourceData对象， 并返回给前端
 */
@WebServlet("/GetDataParam")
public class GetDataParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Log logger = LogFactory.getLog(DataParamRequest.class);
       
    public GetDataParam() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataInfoService ds = new DataInfoServiceImpl();
		logger.info(ds);
		String json = JSON.toJSONString(ds.getDataObject());
		
		logger.info("传递的json为："+json);
		response.getWriter().print(json);
		response.getWriter().flush();
		response.getWriter().close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
