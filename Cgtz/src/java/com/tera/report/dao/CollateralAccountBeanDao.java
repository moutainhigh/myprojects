package com.tera.report.dao;

import java.util.List;
import java.util.Map;

import com.tera.audit.loan.model.Collateral;
import com.tera.report.model.CollateralAccountBean;

/**
 * 
 * 质押、抵押物信息DAO
 * <b>功能：</b>CollateralDao<br>
 * <b>作者：</b>CodeGenerater<br>
 * <b>日期：</b>2016-01-07 13:34:31<br>
 * <b>版权所有：<b>天瑞兴隆<br>
 */
public interface CollateralAccountBeanDao {
	
	public int queryCount(Map<String, Object> map);
	
	public List<CollateralAccountBean> queryList(Map<String, Object> map);

}
