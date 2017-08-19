package cn.lhqs.bean;

import java.io.Serializable;

public class JsonData implements Serializable{

	private static final long serialVersionUID = 1L;

	// 处理结果
	private boolean success = false;

	// 消息
	private String msg = "";

	// 处理内容
	private Object obj = null;
	// 处理内容2
	private Object obj2 = null;
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public Object getObj2() {
		return obj2;
	}
	public void setObj2(Object obj2) {
		this.obj2 = obj2;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
