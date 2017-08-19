package cn.lhqs.dao;

import cn.lhqs.bean.User;
import cn.lhqs.utils.JdbcReadUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class UserListDao {
	private static final Log logger = LogFactory.getLog(UserListDao.class);

	@SuppressWarnings("null")
	public List<User> getUserList() {
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		
		List<User> list = new ArrayList<User>();
		try {
			con = JdbcReadUtils.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select uid,username,logintime from user ");
			logger.info("sql---->" + sql);
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			int uid = 1;
			while (rs.next()) {
				User user = new User();
				user.setUid(uid++);
				user.setUsername(rs.getString("username"));
				user.setLoginTime(rs.getString("logintime"));
				list.add(user);
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
}
