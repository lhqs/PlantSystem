package cn.lhqs.serviceImpl;

import java.util.List;

import cn.lhqs.bean.User;
import cn.lhqs.dao.OperatorLogDao;
import cn.lhqs.dao.UserDao;
import cn.lhqs.service.UserService;
import cn.lhqs.utils.TimeTools;

public class UserServiceImpl  implements UserService {

	@Override
	public void insert(String username, String password,String session) {
		UserDao ud = new UserDao();
		String contents = session+"添加了用户："+username;
		String current = TimeTools.getSystemDate(TimeTools.DATE_TYPE1);
		OperatorLogDao.insertLog(session, contents, current);
		ud.insertUser(username, password);
	}

	@Override
	public int update() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Boolean delete(String username,String session) {
		UserDao userDao = new UserDao();
		String contents = session+"删除了用户："+username;
		String current = TimeTools.getSystemDate(TimeTools.DATE_TYPE1);
		OperatorLogDao.insertLog(session, contents, current);
		Boolean bool = userDao.deleteByName(username);
		return bool; 
	}

	@Override
	public User getUserObject(String username) {
		UserDao userDao = new UserDao();
		return userDao.findByAdminname(username);
	}

	@Override
	public List<String> findAllUsername() {
		UserDao userDao = new UserDao();
		return userDao.findAllName();
	}

}

/*| 参数名                  | 类型      | 含义              | 说明      |
| -------------------- | ------- | --------------- | ------- |
| settlementType       | int  | 结算单类型           |         |
| orderSeq             | String  | 订单号             |         |
| settlementNo         | String  | 结算单号            |         |
| settlementTime       | datetime  | 结算时间            | 日期 / 空值 |
| pickshopAmount        | Decimal | 取车服务费           |         |
| returnshopAmount        | Decimal | 还车服务费           |         |
| crossDistrict         | Decimal | 跨区服务费           |         |
| reduceCrossDistrict   | Decimal | 跨区服务费减免         |         |
|  insurance             | Decimal | 不计免赔            |         |
|  exemptionAmount        | Decimal | 减免金额            |         |
|   memDiscountAmount        | Decimal | 会员折扣金额          |         |
|activityDiscountAmount        | Decimal | 产品折扣金额          |         |
| settlementAmount           | Decimal | 结算金额            |         |
| isFree                | int | 是否免单            | 是/否     |
|  realAmount           | Decimal | 后付费金额           |         |
|couponDiscountAamount   | Decimal | 赠送抵用券消费金额       |         |
|eamountDiscountAmount   | Decimal | E币优惠金额/赠送E币消费金额 |         |
|eamountPrechargeAmount     | datetime | E币预充值转消费金额      |         |
|payTime                | String  | 支付时间            | 日期 / 空值 |
|depositDeductionAmount     | Decimal | 押金扣除            |         |
| mobilePhone            | String  | 手机号             |         |
| authId                 | String  | 会员ID            |         |*/
