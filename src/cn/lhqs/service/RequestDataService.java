package cn.lhqs.service;

import java.util.List;

import cn.lhqs.bean.RequestData;
import cn.lhqs.dao.RequestDataDao;

public class RequestDataService {
	RequestDataDao rdd = new RequestDataDao();
	
	public List<RequestData> getDataList() {
		return rdd.getRequestData();
	}
}
