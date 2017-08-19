package cn.lhqs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.lhqs.bean.DataInfo;
import cn.lhqs.utils.JdbcUtils;

public class DataDaoOne {
	private static final Log logger = LogFactory.getLog(DataDaoOne.class);

	public DataInfo getRequestDataObject() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = JdbcUtils.getConnection();
			logger.info("<---get-connection ！--->");
		} catch (SQLException e) {
			logger.info("获取数据库连接失败！");
			e.printStackTrace();
		}

		StringBuffer sql = new StringBuffer();
		sql.append(
				"select did,humidity, temperature,illumination, carbon,  create_time as createTime, update_time as updateTime from data_info ORDER BY did desc limit 1");
		logger.info("sql----> " + sql);
		DataInfo di = new DataInfo();
		try {
			ps = con.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while (rs.next()) {
				di.setDid(rs.getInt("did"));
				di.setHumidity(rs.getString("humidity"));
				di.setTemperature(rs.getString("temperature"));
				di.setIllumination(rs.getString("illumination"));
				di.setCarbon(rs.getString("carbon"));
				di.setCreateTime(rs.getString("createTime"));
				di.setUpdateTime(rs.getString("updateTime"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				ps.close();
				rs.close();
				JdbcUtils.releaseConnection(con);
				logger.info("<---close-connection ！--->！");
			} catch (SQLException e) {
				logger.info("数据库关闭异常！！！");
				e.printStackTrace();
			}
		}
		return di;
	}

}
