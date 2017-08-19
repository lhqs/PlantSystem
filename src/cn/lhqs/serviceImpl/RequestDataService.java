package cn.lhqs.serviceImpl;

import java.util.List;

import cn.lhqs.bean.DataInfo;
import cn.lhqs.dao.RequestDataDao;

public class RequestDataService {
	RequestDataDao rdd = new RequestDataDao();
	
	public List<DataInfo> getDataList() {
		return rdd.getRequestDataList();
	}
	
	public List<Float> getDataArray() {
		List<Float> requestDataArray = rdd.getRequestDataArray();
		return requestDataArray;
	}
}
