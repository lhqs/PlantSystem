package cn.lhqs.serviceImpl;

import java.util.List;

import cn.lhqs.bean.DataInfo;
import cn.lhqs.dao.DataDao;
import cn.lhqs.dao.DataDaoOne;
import cn.lhqs.service.DataInfoService;

public class DataInfoServiceImpl implements DataInfoService {

	@Override
	public List<DataInfo> getDataInfo() {
		DataDao dd = new DataDao();
		return dd.getRequestData();
	}

	@Override
	public DataInfo getDataObject() {
		DataDaoOne dataObject = new DataDaoOne();
		return dataObject.getRequestDataObject();
	}

}
