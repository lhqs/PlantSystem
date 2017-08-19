package cn.lhqs.serviceImpl;

import java.util.List;

import cn.lhqs.bean.Operatorlog;
import cn.lhqs.dao.OperatorLogDao;

public class OperatorLogService {
	public List<Operatorlog> getLogger() {
		OperatorLogDao old = new OperatorLogDao();
		return old.getOperatorLog();
	}
}
