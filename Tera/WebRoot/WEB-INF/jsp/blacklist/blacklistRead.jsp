<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/sys/include.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>黑名单表查看</title>
	<link href="css/global.css" type="text/css" rel="stylesheet"/>
	<link href="css/icon.css" type="text/css" rel="stylesheet"/>
	<link href="css/default/easyui.css" type="text/css" rel="stylesheet"/>
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/jquery.form.js" type="text/javascript"></script>
	<script src="js/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="js/easyui-lang-zh_CN.js" type="text/javascript"></script>
<style type="text/css">
</style>
</head>
<body>
<div id="main">
	<div id="part1" class="part">
		<p class="title"><a href="javascript:void(0);">查看</a></p>
		<div class="content">
			<form id="updateForm" >
				<table>
					<tbody>
					<input id="id" name="id" type="hidden" size="35" value="${ bean.id}" />
					<tr>
<td>姓名:</td>
<td><input id="name" name="name" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.name}"/></td>
</tr>
<tr>
<td>证件号码:</td>
<td><input id="idNo" name="idNo" type="text" data-options="validType:['length[0,20]']" class="textbox easyui-validatebox" value="${bean.idNo}"/></td>
</tr>
<tr>
<td>申请号:</td>
<td><input id="appId" name="appId" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.appId}"/></td>
</tr>
<tr>
<td>手机:</td>
<td><input id="mobile" name="mobile" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.mobile}"/></td>
</tr>
<tr>
<td>QQ:</td>
<td><input id="qq" name="qq" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.qq}"/></td>
</tr>
<tr>
<td>微信号:</td>
<td><input id="wechat" name="wechat" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.wechat}"/></td>
</tr>
<tr>
<td>地址:</td>
<td><input id="address" name="address" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.address}"/></td>
</tr>
<tr>
<td>单位名称:</td>
<td><input id="company" name="company" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.company}"/></td>
</tr>
<tr>
<td>逾期平台:</td>
<td><input id="platform" name="platform" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.platform}"/></td>
</tr>
<tr>
<td>逾期天数:</td>
<td><input id="defaultDays" name="defaultDays" type="text" editable="false"  data-options="min:0,precision:0" class="textbox easyui-numberbox" value="${bean.defaultDays}"/></td>
</tr>
<tr>
<td>逾期笔数:</td>
<td><input id="defaultNum" name="defaultNum" type="text" editable="false"  data-options="min:0,precision:0" class="textbox easyui-numberbox" value="${bean.defaultNum}"/></td>
</tr>
<tr>
<td>逾期金额:</td>
<td><input id="defaultAmount" name="defaultAmount" type="text" editable="false"  data-options="min:0,precision:2" class="textbox easyui-numberbox" value="${bean.defaultAmount}"/></td>
</tr>
<tr>
<td>状态:</td>
<td><input id="state" name="state" type="text" data-options="validType:['length[0,2]']" class="textbox easyui-validatebox" value="${bean.state}"/></td>
</tr>
<tr>
<td>备注:</td>
<td><input id="remark" name="remark" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.remark}"/></td>
</tr>
<tr>
<td>操作员:</td>
<td><input id="operator" name="operator" type="text" data-options="validType:['length[0,50]']" class="textbox easyui-validatebox" value="${bean.operator}"/></td>
</tr>
<tr>
<td>创建日期:</td>
<td><input id="createTime" name="createTime" type="text" editable="false" class="textbox easyui-datetimebox" value="${bean.createTimeStr}"/></td>
</tr>
<tr>
<td>修改日期:</td>
<td><input id="updateTime" name="updateTime" type="text" editable="false" class="textbox easyui-datetimebox" value="${bean.updateTimeStr}"/></td>
</tr>

					<tr>
						<td>
							<input type="button" value="返回" class="btn" onclick="javascript:back()"/>
						</td>
						<td></td>
					</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>

<div id="loading" class="easyui-window"  title="" data-options="border:false,modal:true,closed:true,draggable:false,resizable:false" >
	<img src="img/loading.gif" alt="加载中..." />
</div>

</body>

<script type="text/javascript">

//返回
function back(){
	window.history.go(-1);
}

//打开Loading遮罩并修改样式
function openLoading(){
	$('#loading').window('open');
	$("#loading").attr("class","");
	$("div[class='panel window']").css("position","absolute");
	$("div[class='panel window']").attr("class","");
	$("div[class='window-shadow']").attr("class","");
}


//页面加载完动作
$(document).ready(function (){
	//将Form元素禁用
	$("#updateForm").find("input").attr("disabled", "disabled");
	$("#updateForm").find("select").attr("disabled", "disabled");
	//将easyui控件禁用
	$("#updateForm").find(".easyui-combobox").combo('disable');
	$("#updateForm").find(".easyui-numberbox").numberbox('disable');
	$("#updateForm").find(".easyui-numberspinner").numberspinner('disable');
	$("#updateForm").find(".easyui-datebox").datebox('disable');
	$("#updateForm").find(".easyui-datetimebox").datetimebox('disable');
	
	//填充select数据样例
	/*
	var tsurl="sys/datadictionary/listjason.do?keyName=repaymethod";
	$("#repayMethod").combobox("clear");
	$('#repayMethod').combobox({url:tsurl, valueField:'keyProp', textField:'keyValue'});
	*/
});

</script>
</html>

