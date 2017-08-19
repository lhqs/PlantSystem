package cn.lhqs.bean;

import cn.lhqs.utils.TimeTools;

public class Operatorlog {
	private int uid; 
	private String operatorUser; 
	private String content; 
	private String operatorTime;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getOperatorUser() {
		return operatorUser;
	}
	public void setOperatorUser(String operatorUser) {
		this.operatorUser = operatorUser;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOperatorTime() {
		return  operatorTime;
	}
	public void setOperatorTime(String operatorTime) {
		this.operatorTime = operatorTime.substring(0,19);
	}
	@Override
	public String toString() {
		return "Operatorlog [uid=" + uid + ", operatorUser=" + operatorUser + ", content=" + content + ", operatorTime="
				+ operatorTime + "]";
	} 
	

}
