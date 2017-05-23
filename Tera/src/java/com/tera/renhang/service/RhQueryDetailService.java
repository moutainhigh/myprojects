package com.tera.renhang.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tera.renhang.dao.RhQueryDetailDao;
import com.tera.renhang.model.RhQueryDetail;

/**
 * 
 * 信用贷款人行报告查询明细服务类
 * <b>功能：</b>RhQueryDetailDao<br>
 * <b>作者：</b>CodeGenerater<br>
 * <b>日期：</b>2015-01-14 16:07:46<br>
 * <b>版权所有：<b>天瑞兴隆<br>
 */
@Service("rhQueryDetailService")
public class RhQueryDetailService {

	private final static Logger log = Logger.getLogger(RhQueryDetailService.class);

	@Autowired(required=false)
    private RhQueryDetailDao dao;

	@Transactional
	public void add(RhQueryDetail... objs)  throws Exception {
		if(objs == null || objs.length < 1){
			return;
		}
		for(RhQueryDetail obj : objs ){
			dao.add(obj);
		}
	}
	
	@Transactional
	public void update(RhQueryDetail obj)  throws Exception {
		dao.update(obj);
	}
	
	@Transactional
	public void updateOnlyChanged(RhQueryDetail obj)  throws Exception {
		dao.updateOnlyChanged(obj);
	}
	
	@Transactional
	public void delete(Object... ids) throws Exception {
		if(ids == null || ids.length < 1){
			return;
		}
		for(Object id : ids ){
			dao.delete(id);
		}
	}
	
	public int queryCount(Map<String, Object> map)throws Exception {
		return dao.queryCount(map);
	}
	
	public List<RhQueryDetail> queryList(Map<String, Object> map) throws Exception {
		return dao.queryList(map);
	}

	public RhQueryDetail queryByKey(Object id) throws Exception {
		return (RhQueryDetail)dao.queryByKey(id);
	}
	
}
