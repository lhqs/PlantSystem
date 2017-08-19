package cn.lhqs.serviceImpl;

import java.util.List;

import cn.lhqs.bean.User;
import cn.lhqs.dao.UserListDao;

public class UserListServiceImpl {
	public List<User> getUserTable() {
		UserListDao list = new UserListDao();
		return list.getUserList();
	}

}
