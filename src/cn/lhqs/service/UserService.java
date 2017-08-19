package cn.lhqs.service;

import java.util.List;

import cn.lhqs.bean.User;

public interface UserService {
	
	public List<String> findAllUsername();
	
	public void insert(String username, String password,String session);
	
	public int update();
	
	public Boolean delete(String username,String session);
	
	public User getUserObject(String username);

}
