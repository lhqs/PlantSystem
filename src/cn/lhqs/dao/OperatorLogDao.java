package cn.lhqs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.lhqs.bean.Operatorlog;
import cn.lhqs.utils.JdbcReadUtils;
import cn.lhqs.utils.JdbcUtils;

public class OperatorLogDao {
	private final Log logger = LogFactory.getLog(OperatorLogDao.class);
	
	public List<Operatorlog> getOperatorLog() {
		Connection con = null;
		try {
			con = JdbcReadUtils.getConnection();
		} catch (SQLException e1) {
			logger.info("连接数据库异常");
		}
		PreparedStatement psmt = null; 
		ResultSet rs = null; 
		List<Operatorlog> list = new ArrayList<Operatorlog>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select content, operator_user, operator_time from operator_logger");
			psmt = con.prepareStatement(sql.toString());
			rs = psmt.executeQuery();
			int oid = 1; 
			while(rs.next()) {
				Operatorlog ol = new Operatorlog();
				ol.setUid(oid++);
				ol.setContent(rs.getString("content"));
				ol.setOperatorUser(rs.getString("operator_user"));
				ol.setOperatorTime(rs.getString("operator_time"));
				list.add(ol);
			}
			
		}catch(SQLException e) {
			logger.info(e);
		}finally {
			try {
				psmt.close();
				rs.close();
				con.close();
			} catch (SQLException e) {
				logger.info("数据库关闭失败");
			}
		}
		return list; 
	}
	
	public static void insertLog(String username, String content, String insertTime) {
		Connection con = null;
		try {
			con = JdbcUtils.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		StringBuffer sql = new StringBuffer();
		sql.append("insert into operator_logger (operator_user , content , operator_time )values(?,?,?)");
		PreparedStatement psmt = null;
		try {
			psmt = con.prepareStatement( sql.toString());
			psmt.setString(1, username);
			psmt.setString(2, content);
			psmt.setString(3, insertTime);
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
