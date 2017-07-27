package cn.lhqs.utils;

import java.io.InputStream;
import java.sql.DriverManager;
import java.util.Properties;

import com.mysql.jdbc.Connection;

public class JdbcUtil {
    private static final String dbconfig = "jdbc.properties";
    private static Properties prop = new Properties();
    static {
	try {
	    InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(dbconfig);
	    prop.load(in);
	    Class.forName(prop.getProperty("jdbc.driverClassName"));
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    public static Connection getConnection() {
	try {
	    return (Connection) DriverManager.getConnection(prop.getProperty("jdbc.url"),
		    prop.getProperty("jdbc.username"), prop.getProperty("jdbc.password"));
	} catch (Exception e) {
	    throw new RuntimeException(e);
	}
    }

}


