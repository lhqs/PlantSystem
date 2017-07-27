package cn.lhqs.test;

import java.util.List;

import org.junit.Test;

import cn.lhqs.bean.Admin;
import cn.lhqs.bean.RequestData;
import cn.lhqs.dao.AdminDao;
import cn.lhqs.dao.RequestDataDao;

public class DaoTest {
	public static void main(String[] args) {
		AdminDao adminDao = new AdminDao();
		Admin admin = adminDao.findByAdminname("lhqs");
		System.out.println(admin.getMail());
	}
	@Test
	public void Test_one() {
		RequestDataDao rdd = new RequestDataDao();
		List<RequestData> dataList = rdd.getRequestData();
		for(RequestData rData : dataList) {
			System.out.println("rData--> " +rData);
		}
	}

}
