package com.tera.sys.model;

import java.io.Serializable;

/**
 * 
 * <br>
 * <b>功能：</b>RoleDao<br>
 * <b>作者：</b>CodeGenerater<br>
 * <b>日期：</b>2014-05-26 14:09:01<br>
 * <b>版权所有：<b>天瑞兴隆<br>
 */
public class Role implements Serializable {


	private String orgRoleLever;//职务等级
	private String leverName;
	private String flag; //标记
	public String getOrgRoleLever() {
		return orgRoleLever;
	}
	public void setOrgRoleLever(String orgRoleLever) {
		this.orgRoleLever = orgRoleLever;
	}
	public String getLeverName() {
		return leverName;
	}
	public void setLeverName(String leverName) {
		this.leverName = leverName;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}