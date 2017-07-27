package cn.lhqs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


import cn.lhqs.bean.RequestData;
import cn.lhqs.utils.JdbcUtils;
import cn.lhqs.utils.QueryRunerExtends;

public class RequestDataDao {
	private static final Log logger =LogFactory.getLog(RequestDataDao.class);
	private QueryRunner qr = new QueryRunerExtends();
	
	public List<RequestData> getRequestData() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = JdbcUtils.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		logger.info("getConnection()");
		
		StringBuffer sql = new StringBuffer();
		sql.append("select id, co2, h2, h2o from parm_one");
		logger.info("sql----> "+sql);
		List<RequestData> list = new ArrayList<RequestData>();
		try {
			ps = con.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while(rs.next()) {
				RequestData rd = new RequestData();
				rd.setId(rs.getInt("id"));
				rd.setCo2(rs.getString("co2"));
				rd.setH2(rs.getString("h2"));
				rd.setH2o(rs.getString("h2o"));
				list.add(rd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				rs.close();
				JdbcUtils.releaseConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
		
		
	}

}
