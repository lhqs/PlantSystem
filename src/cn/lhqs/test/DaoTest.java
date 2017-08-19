package cn.lhqs.test;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

import org.junit.Test;

import com.alibaba.fastjson.JSON;

import cn.lhqs.bean.Admin;
import cn.lhqs.bean.DataInfo;
import cn.lhqs.bean.RequestData;
import cn.lhqs.bean.User;
import cn.lhqs.dao.AdminDao;
import cn.lhqs.dao.OperatorLogDao;
import cn.lhqs.dao.RequestDataDao;
import cn.lhqs.dao.UserDao;
import cn.lhqs.dao.UserListDao;
import cn.lhqs.service.UserService;
import cn.lhqs.serviceImpl.RequestDataService;
import cn.lhqs.serviceImpl.UserListServiceImpl;
import cn.lhqs.serviceImpl.UserServiceImpl;
import cn.lhqs.servlet.GetDataServlet;

public class DaoTest {
	// public static void main(String[] args) {
	// AdminDao adminDao = new AdminDao();
	// Admin admin = adminDao.findByAdminname("lhqs");
	// System.out.println(admin.getMail());
	// }
	// @Test
	// public void Test_one() {
	// RequestDataDao rdd = new RequestDataDao();
	// List<RequestData> dataList = rdd.getRequestData();
	// for(RequestData rData : dataList) {
	// System.out.println("get Data--> " +rData);
	// }
	// }
	@Test
	public void testLogin() {
		String username = "lhqs";
		UserService userService = new UserServiceImpl();
		
		int temp = 0;
		for(String user : userService.findAllUsername()) {
			if(user.equals(username))
			{
				temp ++;
			}
			System.out.println(user);
		}
		System.out.println(temp);
	}
	
	@Test 
	public void testServlet() {
		RequestDataService rds = new RequestDataService();
		
		List<DataInfo> dataList = rds.getDataList();
		Object json = JSON.toJSON(dataList);
//		Object json = collection.toArray(new type[collection.size()])
		System.out.println(dataList);
		System.out.println(json);
	}
	
	
	public static void main(String[] args) {
		int max = 20;
		int min = 10;
		Random random = new Random();

		int s = random.nextInt(max) % (max - min + 1) + min;
		System.out.println(s);
	}

	@Test
	public void suiji() {
		for (int i = 0; i < 10; i++) {
			System.out.println((float) Math.random() * 100);

		}
	}

	@Test
	public void formatmins() {
		DecimalFormat dcmFmt = new DecimalFormat("0.00");
		Random rand = new Random();
		for(int i = 0; i < 10; i++) {
			float f = rand.nextFloat() * 50;
			System.out.println(dcmFmt.format(f));
		}
	}
	
	@Test
	public void userList() {
			UserListDao list = new UserListDao();
			List<User> sublist = list.getUserList();
			for(User user : sublist) {
				System.out.println(user.getUsername());
			}
	}
	@Test
	public void userdeteleResult() {
		UserDao userdao = new UserDao();
		boolean deleteByName = userdao.deleteByName("temp");
		System.out.println(deleteByName);
	}
	
	@Test
	public void boolTest() {
		System.out.println(!false);
	}
	@Test
	public void insertLogTest() {
		OperatorLogDao ol = new OperatorLogDao();
		ol.insertLog("iandi", "why it finds 字体", "2017-08-20 12:23:55");
	}
	
	@Test
	public void insetUser() {
		UserDao userdao = new UserDao();
		userdao.insertUser("temptmep", "test");
	}
	@Test
	public void testFormatter() {
		UserListServiceImpl userlist = new UserListServiceImpl();
		List<User> userTable = userlist.getUserTable();
		for(User user : userTable) {
			System.out.println(user.getLoginTime());
		}
	}
}
