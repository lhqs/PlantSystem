package cn.lhqs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import cn.lhqs.bean.Admin;
import cn.lhqs.utils.JdbcUtil;
import cn.lhqs.utils.QueryRunerExtends;

public class AdminDao {
	private QueryRunner qr = new QueryRunerExtends();
	private static final Log logger =LogFactory.getLog(AdminDao.class);
	/**
	 * 按用户名查询
	 * @param adminName
	 * @return
	 */
	public Admin findByAdminname(String adminName) {
		try {
			String sql = "select * from admin_list where username=?";
			logger.info("sql---> "+sql);
			return qr.query(sql, new BeanHandler<Admin>(Admin.class), adminName);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void findByAdminname() {
		PreparedStatement pstmt = null;
		List<Admin> list = new ArrayList<Admin>();
		Connection con = null;
		ResultSet rs = null;
		try {
			con = JdbcUtil.getConnection();
			System.out.println(con);
			String sql = "select aid, username, password, mail  from admin_list ";
			logger.info("sql---->"+sql);
			pstmt = (PreparedStatement) con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Admin admin = new Admin();
				admin.setAid(rs.getInt("aid"));
				admin.setUsername(rs.getString("username"));
				admin.setPassword(rs.getString("password"));
				admin.setMail(rs.getString("mail"));
				list.add(admin);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			} catch(SQLException e) {
				logger.info("数据库关闭异常");
			}
		}
	}
	
	
	/**
	 * 插入admin
	 * @param admin
	 */
	public void add(Admin admin) {
		try {
			String sql = "insert into admin_list values(?,?,?,?)";
			Object[] params = {admin.getAid(), admin.getUsername(), 
					admin.getPassword(), admin.getMail()};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	

}
