package cn.lhqs.bean;

public class RequestData {
	private int id; 
	private String co2;
	private String h2;
	private String h2o;
	
	public RequestData(int id, String co2, String h2, String h2o) {
		super();
		this.id = id;
		this.co2 = co2;
		this.h2 = h2;
		this.h2o = h2o;
	}
	public RequestData() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCo2() {
		return co2;
	}
	public void setCo2(String co2) {
		this.co2 = co2;
	}
	public String getH2() {
		return h2;
	}
	public void setH2(String h2) {
		this.h2 = h2;
	}
	public String getH2o() {
		return h2o;
	}
	public void setH2o(String h2o) {
		this.h2o = h2o;
	}
	@Override
	public String toString() {
		return "RequestData [id=" + id + ", co2=" + co2 + ", h2=" + h2 + ", h2o=" + h2o + "]";
	}
	

}
