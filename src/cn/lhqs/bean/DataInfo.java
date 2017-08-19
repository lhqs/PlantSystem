package cn.lhqs.bean;

public class DataInfo {
	private int did; 
	private String humidity;
	private String temperature; 
	private String illumination;
	private String carbon;
	private String createTime; 
	private String updateTime;
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getIllumination() {
		return illumination;
	}
	public void setIllumination(String illumination) {
		this.illumination = illumination;
	}
	public String getCarbon() {
		return carbon;
	}
	public void setCarbon(String carbon) {
		this.carbon = carbon;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "DataInfo [did=" + did + ", humidity=" + humidity + ", temperature=" + temperature + ", illumination="
				+ illumination + ", carbon=" + carbon + ", createTime=" + createTime + ", updateTime=" + updateTime
				+ "]";
	} 
	

}
