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
<title>房贷核价决策表更新</title>
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
	<p class="title">
		<a href="javascript:void(0);">核价决策</a>
	</p>
<div class="content">
<div class="easyui-layout" id="easyui_layout" style="width:100%;height:730px;" data-options="fit:true">
<div data-options="region:'center',split:true,border:false" >
	<div class="easyui-tabs" data-options="fit:true,onLoad:tabsReadOnly">
		<div title="影像资料" data-options="href:'${basePath}img/imgSlidePath.do?appId=${bean.appId}'" style="width: 100%;padding:10px"></div>
		<div title="申请信息" data-options="href:'${basePath}house/app/read1.do?id=${bean.id}'" style="width: 100%;padding:10px"></div>
		<div title="综合信息" data-options="href:'${basePath}house/verify/complexInfo.do?id=${bean.id}'" style="width: 100%;padding:10px"></div>
	</div>
</div>

<div data-options="region:'east',split:true,border:false" style="width:800px;">
	<div class="easyui-tabs" id="verify_tabs" style="height:730px;" data-options="fit:true,onLoad:tabsReadOnly">
		<div title="核价决策"  style="width: 100%;padding:10px">
		  <form id="updateForm" >
		  <input type="hidden" name="appId" value="${bean.appId}" />
			 <table width="100%">
				<tr>
					<td colspan="9">
						<div style="font-size: 14px;" >
							<strong>申请信息</strong>
							<hr width="100%" size=2 color="#D3D3D3" noshade>
						</div>
					</td>
				</tr>
			 	<tr><td>
			 		<table id="verifylAppInfo">
						<tr>
							<td align="right">借款金额：</td>
							<td><input type="text" id="amount" value="${bean.amount/10000}" class="textbox easyui-numberbox" 
								style="width:152px;" disabled="disabled" data-options="required:true,min:0,precision:2"/>万元
							</td>
<%--							<td align="right">借款期限：</td>--%>
<%--							<td><input id="period" type="text" data-options="required:true,validType:['length[0,10]']" --%>
<%--								class="easyui-combobox"  value="${bean.period}" editable="false" style="width:152px;" disabled="disabled"/></td>--%>
							<td align="right">渠道：</td>
							<td>
								<input id="belongChannel" type="text" data-options="required:true,validType:['length[0,50]']" 
									class="easyui-combobox"  value="${bean.belongChannel}" editable="false" style="width:152px;" disabled="disabled"/>
							</td>
							<td align="right">产品：</td>
							<td>
								<input id="product" type="text" data-options="required:true,validType:['length[0,50]']" 
									class="easyui-combobox"  value="${bean.product}" editable="false" style="width:152px;" disabled="disabled"/>
							</td>
						</tr>
					</table>
				</td></tr>
				<tr><td>
			 		<table id="verifyCarInfo">
			 			<tr>
							<td colspan="9">
								<div style="font-size: 14px;" >
									<strong>房屋基本信息</strong>
									<hr width="100%" size=2 color="#D3D3D3" noshade>
								</div>
							</td>
						</tr>
						<tr>
							<input id="id" name="houseInfo.id" type="hidden" size="35" value="${houseInfo.id}" />
							<td>房产证号:</td>
							<td><input id="houseCertificateNumber" name="houseInfo.houseCertificateNumber" type="text" data-options="required:true,validType:['length[0,50]']" 
							class="textbox easyui-validatebox" value="${houseInfo.houseCertificateNumber}" disabled="disabled"/></td>
							<td>土地证号:</td>
							<td><input id="landCertificateNumber" name="houseInfo.landCertificateNumber" type="text" data-options="required:true,validType:['length[0,50]']" 
							class="textbox easyui-validatebox" value="${houseInfo.landCertificateNumber}" disabled="disabled"/></td>
							<td>房屋年限:</td>
							<td><input id="houseYearlyLimit" name="houseInfo.houseYearlyLimit" type="text" data-options="required:true,validType:['length[0,50]']" 
							class="textbox easyui-validatebox" value="${houseInfo.houseYearlyLimit}" disabled="disabled"/></td>
						</tr>
						<tr>
						<td>房屋面积:</td>
						<td><input id="houseSpace" name="houseInfo.houseSpace" type="text" data-options="required:true,validType:['length[0,50]']" 
						class="textbox easyui-validatebox" value="${houseInfo.houseSpace}" disabled="disabled"/></td>
						<td>房屋朝向:</td>
						<td><input id="houseOrientation" name="houseInfo.houseOrientation" type="text" data-options="required:true,validType:['length[0,50]']" 
						class="textbox easyui-validatebox" value="${houseInfo.houseOrientation}" disabled="disabled"/></td>
					</tr>
					<tr>
						<td>所在地:</td>
						<td colspan="5"><input id="houseExistProvince" name="houseInfo.houseExistProvince" type="text" data-options="required:true,validType:['length[0,10]']" 
						class="easyui-combobox" value="${houseInfo.houseExistProvince}" editable="false" style="width:140px;" disabled="disabled"/>省
						<input id="houseExistCity" name="houseInfo.houseExistCity" type="text" data-options="required:true,validType:['length[0,10]']" 
						class="easyui-combobox" value="${houseInfo.houseExistCity}" editable="false" style="width:140px;" disabled="disabled"/>市
						<input id="houseExistCounty" name="houseInfo.houseExistCounty" type="text" data-options="required:true,validType:['length[0,10]']" 
						class="easyui-combobox" value="${houseInfo.houseExistCounty}" editable="false" style="width:130px;" disabled="disabled"/>区县
						<input id="houseExistAddress" name="houseInfo.houseExistAddress" type="text" data-options="required:true,validType:['length[0,100]']" 
						class="textbox easyui-validatebox" value="${houseInfo.houseExistAddress}" editable="false" disabled="disabled"/></td>
					</tr>
						<tr>
							<td colspan="9">
								<div style="font-size: 14px;" >
									<strong>房屋评估</strong>
									<hr width="100%" size=2 color="#D3D3D3" noshade>
								</div>
							</td>
						</tr>
						<tr>
							<td>评估金额:</td>
							<td><input id="assessAmount" name="houseApp.assessAmount" type="text" data-options="required:true,min:0,precision:2" 
							class="textbox easyui-numberbox" value="${bean.assessAmount}" disabled="disabled" style="width:139px;"/>元</td>
							<td>评估公司:</td>
							<td><input id="assessComp" name="houseApp.assessComp" type="text" data-options="required:true,validType:['length[0,50]']" 
							class="textbox easyui-validatebox" disabled="disabled" value="${bean.assessComp}"/></td>
						</tr>
						<tr>
							<td>评估描述：</td>
							<td colspan="5">
								<textarea id="assessRemark" name="houseApp.assessRemark" value="${bean.assessRemark}" class="textbox easyui-validatebox"  disabled="disabled" data-options="required:true,validType:['length[0,500]']" 
									style="resize: none;width:625px;height:50px!important;">${bean.assessRemark}</textarea>
							</td>
						</tr>
					</table>
				</td></tr>
				
				<tr><td>
			 		<table id="priceDecision">
			 			<tr>
							<td colspan="9">
								<div style="font-size: 14px;" >
									<strong>核价决策</strong>
									<hr width="100%" size=2 color="#D3D3D3" noshade>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right">决策：</td>
							<td><select id="decision" name="decision.decision" value="${housePrice.decision}"
									data-options="required:true,validType:['length[0,50]']
									,onChange: function(decisionVal){
										if(decisionVal == '00'){
											$('#noPassReasonDiv').show();//显示div   
											toggleValidate('#noPassReasonDiv',true);
										}else if(decisionVal == '01'){
											$('#noPassReasonDiv').hide();//隐藏div  
											$('#returnMsg').val('');
											toggleValidate('#noPassReasonDiv',false);
										}
							    	}" 
									class="easyui-combobox" editable="false" style="width:152px;">
									<option value="">请选择</option>
									<option value="00" <c:if test="${'00' eq housePrice.decision}">selected</c:if>>退回</option>
									<option value="01" <c:if test="${'01' eq housePrice.decision}">selected</c:if>>通过</option>
								</select>
							</td>
							<td align="right">核价金额：</td>
							<td><div id ="amountDiv">
								<input type="hidden" name="id" value="${bean.id}" />
								<input type="hidden" name="decision.appId" value="${bean.appId}" />
								<input id="amount" name="decision.amount" value="${housePrice.amount/10000}" type="text"
									data-options="required:true,min:0,precision:2" class="textbox easyui-numberbox" style="width:152px;" />万元
								</div>
							</td>
						</tr>
						<tr id ="noPassReasonDiv" style="display:none">
							<td align="right" >退回原因：</td>
							<td colspan="5">
								<textarea id="returnMsg" name="decision.returnMsg" value="${housePrice.returnMsg}" class="textbox easyui-validatebox"
								data-options="required:true,validType:['length[0,500]']" 
								style="resize: none;width:625px;height:50px!important;vertical-align:middle;">${housePrice.returnMsg}</textarea>
							</td>
						</tr>
						<tr>
							<td align="right">备注：</td>
							<td colspan="5">
							<textarea id="remarks" name="decision.remarks"value="${housePrice.remarks}" class="textbox easyui-validatebox" data-options="validType:['length[0,100]']"
								style="resize: none;width:625px;height:50px!important;">${housePrice.remarks}</textarea></td>
						</tr>
						<tr>
							<td colspan="6">
								<span style="float: right; padding-right: 20px;">
									<input type="button" value="提交" class="btn" onclick="updateFunction('submit')"/>
									<input type="button" value="返回" class="btn" onclick="javascript:back()"/>
								</span>
							</td>
						</tr>
					</table>
				</td></tr>
				
				<tr>
					<td colspan="9">
						<div style="font-size: 14px;" >
							<strong>反欺诈处理</strong>
							<hr width="100%" size=2 color="#D3D3D3" noshade>
						</div>
					</td>
				</tr>
			 	<tr><td>
			 		<table id="houseAntifraud">
			 			<tr>
							<td>
							<input type="button" value="提交反欺诈" class="btn" onclick="submitAntifraud('antifraud')"/></td>
							<td>
<%--								<input id=submitInfo name="submitInfo" type="text"--%>
<%--									data-options="validType:['length[0,500]']"--%>
<%--									class="textbox easyui-validatebox" style="width:304px;"/>--%>
								<textarea id="submitInfo" name="submitInfo"  value="" class="textbox easyui-validatebox" data-options="validType:['length[0,500]']" 
										style="resize: none;width:600px;height:50px!important;"></textarea>
							</td>
						</tr>
<%--						<tr>--%>
<%--							<td><input type="button" name="relieveAntifraud" value="解除反欺诈"/></td>--%>
<%--							<td><input id="relieveAntifraud" name="relieveAntifraud" type="text" data-options="validType:['length[0,50]']" --%>
<%--								class="easyui-combobox" editable="false" />--%>
<%--							</td>--%>
<%--						</tr>--%>
<%--						<tr>--%>
<%--							<td></td>--%>
<%--							<td ><textarea id="houseAntifraud" name="houseAntifraud.remarks" style="resize: none;width:304px;height:60px;"></textarea></td>--%>
<%--						</tr>--%>
					</table>
				</td></tr>
			</table>
		  </form>
		</div>
		<div title="流程报告" data-options="href:'${basePath}bpm/getBpmLogs.do?bizKey=${bean.appId}'" style="width: 100%;padding:10px"></div>
	</div>

</div>
</div>
</div>
</div>
</div>

</body>
<script type="text/javascript" >

window.parent.openMask();
$(window).load(function (){
	window.parent.closeMask();
});
</script>

<script type="text/javascript">
//只读页 设置为只读
function tabsReadOnly(redinfo){

	redinfo.find("input[type='radio']").attr('disabled',true);
	redinfo.find("input[type='hidden']").attr('disabled',true);
	redinfo.find("input[type='checkbox']").attr('disabled',true);
	redinfo.find("textarea").attr('disabled',true);
	redinfo.find("input[value='添加']").attr('disabled',true);
	redinfo.find("input[value='算']").attr('disabled',true);
	redinfo.find("input[value='全']").attr('disabled',true);

	redinfo.find('.easyui-validatebox').attr('disabled', 'disabled');
	redinfo.find('.easyui-validatebox').validatebox('disableValidation');
	redinfo.find('.easyui-combobox').combo('disableValidation');
	redinfo.find('.easyui-numberbox').numberbox('disableValidation');
	redinfo.find('.easyui-datebox').datebox('disableValidation');
	redinfo.find('.easyui-combobox').combo('disable');
	redinfo.find('.easyui-numberbox').numberbox('disable');
	redinfo.find('.easyui-datebox').datebox('disable');
	redinfo.find('div.panel div.panel-tool>a.icon-cancel').hide();
	redinfo.find('div.panel div.panel-tool>a.icon-add').hide();
	redinfo.find('div.panel div[class="panel-body accordion-body"]>table img[src$="deleteItem2.png"]').hide();
	redinfo.find('div.panel div[class="panel-body accordion-body"]>table img[src$="img/addItem.gif"]').hide();
// 	redinfo.find('div.panel div[class="panel-body accordion-body"]>table a').hide();
}

//切换 是否验证
function toggleValidate(objId,isValidete){
	var state=!isValidete;
	var obj=$(objId);
	obj.find('.easyui-validatebox').validatebox({novalidate:state});
	//obj.find('.easyui-combobox').combobox({novalidate:state});
	obj.find('.easyui-numberbox').validatebox({novalidate:state});
	obj.find('.easyui-datebox').datebox({novalidate:state});
}

//更新保存
function updateFunction(buttonType) {
	//去掉 input 输入的 前后空格
	$('#updateForm').find('input').each(function(){
		if($(this).attr("type")!="file"){
			$(this).val($.trim($(this).val()));
		}
	});
	//验证表单验证是否通过
	if(false == $('#updateForm').form('validate') ){
		$.messager.confirm('消息', "页面有必输字段，但未填值！");
		return;
	}

	if('submit' == buttonType){
		if('' == $("#priceDecision").find("#decision").combobox('getValue')){
			$.messager.confirm('消息', "请选择决策！");
			return;
		}
		if('00'==$("#priceDecision").find("#decision").combobox('getValue')){
			if($("#priceDecision").find("#returnMsg").val() == ''){
				$.messager.confirm('消息', "请填写退回原因！");
				return;
			}
		}
	}
	
	//弹出异步加载 遮罩
 	try{  
 		window.parent.openMask();
	}catch(e){
		//按钮失效防点击
		$(".btn").attr("disabled", true);
	}
	var params = $('#updateForm').serialize();
	
	$.ajax({
		type : "POST",
		url : "<%=basePath%>house/price/save.do",
		data : params+"&buttonType="+buttonType,
		success : function(data) {
			//关闭遮罩，弹出消息框
			try{  
				window.parent.closeMask();
			}catch(e){
				$(".btn").removeAttr("disabled");
			}
			if ("true"==data.success) {
				$.messager.alert('消息', "操作成功", 'info', function(){
					$("input[name='decision.id']").val(data.message);
//	                var url= "<%=basePath%>" + "house/decision/query.do";
//					window.location=url;
					//window.history.go(-1);
					if('submit' == buttonType){
						window.parent.removeTab();
					}
            	});
            } else {				
    			$.messager.alert('消息', data.message);
				//按钮生效
            }
		},
		error : function() {
			//关闭遮罩，弹出消息框
			try{  
				window.parent.closeMask();
			}catch(e){
				$(".btn").removeAttr("disabled");
			}
			$.messager.alert('消息', '数据加载失败,请联系系统管理员！');
		}
	}); 
}

function submitAntifraud(buttonType){
//弹出异步加载 遮罩
	window.parent.openMask();
	var params = $('#updateForm').serialize();
	//按钮失效防点击
	$(".btn").attr("disabled", true);
	$.ajax({
		type : "POST",
		url : "<%=basePath%>" + "house/antifraud/save.do",
		data : params+"&buttonType="+buttonType,
		success : function(data) {
			//关闭遮罩，弹出消息框
			window.parent.closeMask();
			if ("true"==data.success) {
				$.messager.alert('消息', data.message, 'info', function(){
					//window.history.go(-1);
					//location.replace(location.href);
					//return;
					window.parent.removeTab();
				});
            } else {				
    			$.messager.alert('消息', data.message);
				//按钮生效
				$(".btn").removeAttr("disabled");
            }
		},
		error : function() {
			//关闭遮罩，弹出消息框
			window.parent.closeMask();
			$.messager.alert('消息', '数据加载失败,请联系系统管理员！');
			//按钮生效
			$(".btn").removeAttr("disabled");
		}
	});
}

//返回
function back(){
	//window.history.go(-1);
	window.parent.removeTab();
}
//页面加载完动作
$(document).ready(function (){
	
	if('${housePrice.decision}' == '00'){
		$('#noPassReasonDiv').show();//显示div   
		toggleValidate('#noPassReasonDiv',true);
	}else if('${housePrice.decision}' == '01'){
		$('#noPassReasonDiv').hide();//隐藏div    
		toggleValidate('#noPassReasonDiv',false);
	}
	
	//拖动时 调节 下拉框 宽度
	$('#easyui_layout').layout('panel', 'east').panel({
		onResize:function(w,h){
			$("#verify_tabs").tabs('getSelected').find(".easyui-accordion").accordion("resize");
			return true;
		  }
		});

	//填充select数据 渠道
	var channelurl="channeltotal/listjason.do";
	$("#verifylAppInfo").find("#belongChannel").combobox("clear");
	$("#verifylAppInfo").find('#belongChannel').combobox({
		url:channelurl,
		valueField:'channelCode', 
		textField:'channelName',
		onChange: function(newValue, oldValue){             
			$("#verifylAppInfo").find('#product').combobox('clear');
			var producturl = "product/hedao/listjason.do?type=5&belongChannel=" + encodeURI(newValue);
			$("#verifylAppInfo").find('#product').combobox('reload',producturl); 
		}
	});
	//填充select数据 产品
	var belongChannel = $("#verifylAppInfo").find('#belongChannel').combobox('getValue');
	var producturl = "product/hedao/listjason.do?type=5&belongChannel=" + encodeURI(belongChannel);
	$("#verifylAppInfo").find("#product").combobox("clear");
	$("#verifylAppInfo").find('#product').combobox({
		url:producturl,
		valueField:'name', 
		textField:'name'
	});
	
});

</script>
</html>

