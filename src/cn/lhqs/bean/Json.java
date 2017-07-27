package cn.lhqs.bean;

public class Json implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 10L;

	//处理结果
	private boolean success = false;

	// 消息
	private String msg = "";

	// 处理内容
	private Object obj = null;
	// 处理内容2
	private Object obj2 =null;
	/**
	 * @return the success true:成功 false：失败
	 */
	public boolean isSuccess() {
		return success;
	}
	/**
	 * @param success the success to set true
	 */
	public void setSuccess(boolean success) {
		this.success = success;
	}
	/**
	 * @return 处理消息
	 */
	public String getMsg() {
		return msg;
	}
	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	/**
	 * @return the obj
	 */
	public Object getObj() {
		return obj;
	}
	/**
	 * @param obj the obj to set
	 */
	public void setObj(Object obj) {
		this.obj = obj;
	}
	/**
	 * @return the obj2
	 */
	public Object getObj2() {
		return obj2;
	}
	/**
	 * @param obj2 the obj2 to set
	 */
	public void setObj2(Object obj2) {
		this.obj2 = obj2;
	}
	
}
