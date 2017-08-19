package cn.lhqs.service;

import java.util.List;

import cn.lhqs.bean.DataInfo;

public interface DataInfoService {
	
	/**
	 * 获取十条数据， 用于记录历史信息
	 * @return
	 */
	public List<DataInfo> getDataInfo(); 
	/**
	 * 获取单条数据
	 * @return
	 */
	public DataInfo getDataObject();

}
