package cn.lhqs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.lhqs.bean.User;
import cn.lhqs.utils.JdbcReadUtils;
import cn.lhqs.utils.JdbcUtils;

public class UserDao {
	private static final Log logger = LogFactory.getLog(UserDao.class);
	
		// 查询所有管理员，用于判断用户名是否存在
		public List<String> findAllName() {
			PreparedStatement pstmt = null;
			Connection con = null;
			ResultSet rs = null;
			List<String> list = new ArrayList<String>();
			
			try {
				con = JdbcReadUtils.getConnection();
				StringBuffer sql = new StringBuffer();
				sql.append("select username from user");
				logger.info("sql---->" + sql);
				pstmt = con.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					list.add(rs.getString("username"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (pstmt != null) {
						pstmt.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					logger.info("数据库关闭异常");
				}
			}
			return list;
		}
	// 查询操作
	public User findByAdminname(String username) {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		User user = new User();
		try {
			con = JdbcReadUtils.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select uid, username,password  from user where username=? ");
			logger.info("sql---->" + sql);
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setUid(rs.getInt("uid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				logger.info("数据库关闭异常");
			}
		}
		return user;
	}

	// 删除操作
	public boolean deleteByName(String username) {
		PreparedStatement pstmt = null;
		Connection con = null;
		boolean execute = false;
		try {
			con = JdbcUtils.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete from user where username=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, username);
			logger.info("sql--->"+sql.toString());
			execute = pstmt.execute();
		} catch (SQLException e) {
			logger.info(e);
			logger.info("数据库连接失败");
		}finally {
			try {
				con.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return execute;
	}

	// 修改用户
	public void updateByName(String username) {
		PreparedStatement pstmt = null;
		Connection con = null;
		try {
			con = JdbcUtils.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update user set username=? where username=");
			sql.append(username);
			logger.info("sql-->"+sql);
			pstmt = con.prepareStatement(sql.toString());
			pstmt.execute();

		} catch (SQLException e) {
			logger.info("数据库连接失败");
		}finally {
			try {
				con.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 添加用户
	public void insertUser(String username,String password) {
		PreparedStatement pstmt = null;
		Connection con = null;
		try {
			con = JdbcUtils.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into  user(username,password,logintime) values(?,?,sysdate())");
			logger.info(sql.toString());
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.execute();
		} catch (SQLException e) {
			logger.info("数据库连接失败");
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
