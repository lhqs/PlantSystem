package cn.lhqs.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.lhqs.bean.Admin;
import cn.lhqs.dao.AdminDao;

public class AdminService {
	private  AdminDao adminDao = new AdminDao();
	private static final Log logger =LogFactory.getLog(AdminService.class);
	/**
	 * 注冊功能
	 */
	public Admin regist(String username) {
		Admin admin = adminDao.findByAdminname(username);
		return admin;
	}
	public void regist(Admin form) {
		Admin admin = adminDao.findByAdminname(form.getUsername());
		if(admin != null){
			try {
				throw new Exception("此用户已被注册");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		adminDao.add(form);
	}
	
	/**
	 * 登录功能
	 * @throws Exception 
	 */
	public Admin login(Admin form) throws Exception {
		Admin admin = adminDao.findByAdminname(form.getUsername());
		if(admin == null) throw new Exception("用户名不存在！");
		if(!admin.getPassword().equals(form.getPassword()))
			throw new Exception("登录密码错误！");
		
		return admin;
	}
	
	
}
