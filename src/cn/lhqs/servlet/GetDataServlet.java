package cn.lhqs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.lhqs.serviceImpl.RequestDataService;

@WebServlet("/GetDataServlet")
public class GetDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetDataServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDataService rds = new RequestDataService();
		
//		List<DataInfo> dataList = rds.getDataList();
//		Object json = JSON.toJSON(dataList);
//		response.getWriter().print(json);
		
//		System.out.println(dataList);
		RequestDataService rds1 = new RequestDataService();
		List<Float> dataArray = rds1.getDataArray();
		System.out.println(dataArray);
		for(Float f  :  dataArray) {
			System.out.println(f);
		}
		Object json = JSON.toJSON(dataArray);
//		Object[] arr = dataArray.toArray();
//		double[] myList = {1,9, 2,9, 3,4, 3,5,8,6};
//		System.out.println(arr);
		PrintWriter writer = response.getWriter();
		writer.print(json);
		writer.flush();
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
