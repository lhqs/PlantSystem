package cn.lhqs.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;

import cn.lhqs.bean.DataInfo;
import cn.lhqs.utils.JdbcUtils;

public class AddData {
	private static final Log logger = LogFactory.getLog(AddData.class);
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = JdbcUtils.getConnection();
		} catch (SQLException e) {
			logger.info("开启数据库连接异常");
			e.printStackTrace();
		}
		
		StringBuffer sql = new StringBuffer();
		sql.append("select did,humidity, temperature,illumination, carbon,  create_time as createTime, update_time as updateTime from data_info limit 3");
		logger.info("sql----> "+sql);
		List<DataInfo> list = new ArrayList<DataInfo>();
		try {
			ps = con.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while(rs.next()) {
				DataInfo di = new DataInfo();
				di.setDid(rs.getInt("did"));
				di.setHumidity(rs.getString("humidity"));
				di.setTemperature(rs.getString("temperature"));
				di.setIllumination(rs.getString("illumination"));
				di.setCarbon(rs.getString("carbon"));
				di.setCreateTime(rs.getString("createTime"));
				di.setUpdateTime(rs.getString("updateTime"));
				list.add(di);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		for(DataInfo dataInfo : list) {
			logger.info("dataInfo-->"+dataInfo);
		}
		
		try {
			JdbcUtils.releaseConnection(con);
		} catch (SQLException e) {
			logger.info("关闭数据库连接异常");
			e.printStackTrace();
		}
	}
	
	@Test
	public void addSomeDate() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = JdbcUtils.getConnection();
		} catch (SQLException e) {
			logger.info("开启数据库连接异常");
			e.printStackTrace();
		}
		DecimalFormat fmt = new DecimalFormat("0.00");
		Random rand = new Random();
		for(int i = 0; i < 10; i++) {
			float carbon = rand.nextFloat() * 10;
			float humidity = rand.nextFloat() * 25;
			float temperature = rand.nextFloat() * 40 ;
			float illumination = rand.nextFloat() * 50;
			StringBuffer insertsql = new StringBuffer();
			insertsql.append("insert into data_info(humidity, temperature,illumination, carbon,  create_time, update_time)");
			insertsql.append(" values("+fmt.format(humidity)+"," + fmt.format(temperature)+","+fmt.format(illumination)+","+fmt.format(carbon));
			insertsql.append(",now(), sysdate())");
			ps = con.prepareStatement(insertsql.toString());
			logger.info(insertsql.toString());
			boolean execute = ps.execute();
			logger.info("执行结果为："+execute);
			ps.close();
		}
		
		try {
			JdbcUtils.releaseConnection(con);
		} catch (SQLException e) {
			logger.info("关闭数据库连接异常");
			e.printStackTrace();
		}
	}

}
