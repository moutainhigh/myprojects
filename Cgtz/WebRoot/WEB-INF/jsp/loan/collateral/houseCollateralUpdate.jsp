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
<title>质押、抵押物信息更新</title>
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
		<p class="title"><a href="javascript:void(0);">房屋抵押更新</a></p>
		<div class="content">
			<form id="updateHouseForm" >
				<input id="id" name="id" type="hidden" size="35" value="${ bean.id}" />
				<input id="loanId" name="loanId" type="hidden" size="35" value="${loanId}" />
				<input id="type" name="type" type="hidden" size="35" value="${type}" />
				<div style="margin-left: 10px;margin-top: 10px; font-size: 14px;"><strong>房屋基本信息</strong></div><hr color="#D3D3D3"/>
				<table>
					<tr>
						<td>房产证号:</td>
						<td><input id="housePropertyCode" name="housePropertyCode" type="text" data-options="required:true,validType:['length[0,30]']" class="textbox easyui-validatebox" value="${bean.housePropertyCode}"/></td>
						<td>土地证号:</td>
						<td><input id="landCode" name="landCode" type="text" data-options="required:true,validType:['length[0,30]']" class="textbox easyui-validatebox" value="${bean.landCode}"/></td>
					</tr>
					<tr>
						<td>房屋面积:</td>
						<td><input id="area" name="area" type="text" data-options="min:0,precision:2,required:true,validType:['length[0,10]']" class="textbox easyui-numberbox" value="${bean.area}"/>平方米</td>
						<td>房屋朝向:</td>
						<td><input id="direction" name="direction" type="text" data-options="validType:['length[0,10]']" class="textbox easyui-validatebox" value="${bean.direction}"/></td>
						<td>购买日期:</td>
						<td><input id="buyDate" name="buyDate" type="text" editable="false" class="textbox easyui-datebox" value="${bean.buyDateStr}"/></td>
					</tr>
					<tr>
						<td>所在地:</td>
						<td colspan="6">
							<input id="prvn" name="prvn" type="text" 
								data-options="required:true,editable:false" class="textbox easyui-combobox" value="${bean.prvn}"/>省
							<input id="city" name="city" type="text" 
								data-options="required:true,editable:false" class="textbox easyui-combobox" value="${bean.city}"/>市
							<input id="ctry" name="ctry" type="text" 
								data-options="required:true,editable:false" class="textbox easyui-combobox" value="${bean.ctry}"/>区/县
							<input id="addr" name="addr" type="text" style="width: 200px"
								data-options="required:true,editable:false" class="textbox" value="${bean.addr}"/>
						</td>
					</tr>
					<tr>
							<td>说明:</td>
							<td colspan="6">
							<textarea name="remark" class="textbox easyui-validatebox" 
									data-options="validType:['length[0,500]']" 
									style="resize: none;width:625px;height:50px!important;">${bean.remark}</textarea></td>
						</tr>
				</table>
				
				<div style="margin-left: 10px;margin-top: 10px; font-size: 14px;"><strong>房屋评估</strong></div><hr color="#D3D3D3"/>
				<table>
					<tr>
						<td>评估金额:</td>
						<td><input id="evalPrice" name="evalPrice" type="text" data-options="required:true,min:0,precision:2" class="textbox easyui-numberbox" value="${bean.evalPrice}"/>元</td>
						<td>评估者:</td>
						<td><input id="evalName" name="evalName" type="text" data-options="required:true,validType:['length[0,20]']" class="textbox easyui-validatebox" value="${bean.evalName}"/></td>
					</tr>
					<tr>
						<td>评估说明:</td>
						<td colspan="6"><textarea name="evalRemark" class="textbox easyui-validatebox" 
								data-options="validType:['length[0,500]']" 
								style="resize: none;width:625px;height:50px!important;">${bean.evalRemark}</textarea></td>
					</tr>
				</table>
				
				<div style="margin-left: 10px;margin-top: 10px; font-size: 14px;"><strong>资产管理</strong></div><hr color="#D3D3D3"/>
				<table>
					<tr>
						<td>担保物权是否设定:</td>
						<td>
							<input name="isSet" type="radio" value="0" <c:if test="${bean.isSet eq '0' }">checked='checked'</c:if> checked='checked'/>否
							<input name="isSet" type="radio" value="1" <c:if test="${bean.isSet eq '1' }">checked='checked'</c:if>/>是
						</td>
					</tr>
					<tr>
						<td>资产说明:</td>
						<td colspan="6"><textarea name="assetRemark" class="textbox easyui-validatebox" 
								data-options="validType:['length[0,500]']" 
								style="resize: none;width:625px;height:50px!important;">${bean.assetRemark}</textarea></td>
					</tr>
					<tr>
						<td>保管物品说明:</td>
						<td colspan="6"><textarea name="reserveDes" class="textbox easyui-validatebox" 
								data-options="validType:['length[0,500]']" 
								style="resize: none;width:625px;height:50px!important;">${bean.reserveDes}</textarea></td>
					</tr>
				</table>
				
				<div style="margin-left: 10px;margin-top: 10px; font-size: 14px;"><strong>操作</strong></div><hr color="#D3D3D3"/>
				<table>
					<tr>
						<td>
							<input type="button" value="保存" class="btn" onclick="updateFunction()"/>
							<!-- <input type="button" value="返回" class="btn" onclick="javascript:back()"/> -->
						</td>
						<td></td>
					</tr>
				</table>
			</form>
			<div style="margin-left: 10px;margin-top: 10px; font-size: 14px;"><strong>影像</strong></div><hr color="#D3D3D3"/>
			<jsp:include page="/files/load.do">
				<jsp:param value="${loanId }" name="loId"/>
				<jsp:param value="filesce4" name="sec"/>
				<jsp:param value="${ bean.id}" name="bizKey"/>
				<jsp:param value="0" name="opt"/>
			</jsp:include>
		</div>
	</div>
</div>

</body>

<script type="text/javascript">
//更新保存
function updateFunction() {
	//验证表单验证是否通过
	if(false == $('#updateHouseForm').form('validate') ){
		$.messager.confirm('消息', "页面有必输字段，但未填值！");
		return;
	}
	var now=new Date();
	//房屋的购买日期不能晚于当前日期	
	var buyDate=$("#buyDate").datebox('getValue');
	var myBuyDate=new Date(buyDate);
	if(myBuyDate>now){
		$.messager.confirm('消息', "房屋购买日期不能晚于当前日期！");
		return;
	}
	//去掉 input 输入的 前后空格
	$('#updateHouseForm').find('input').each(function(){
		if($(this).attr("type")!="file"){
			$(this).val($.trim($(this).val()));
		}
	});
	//弹出异步加载 遮罩
	openMask();
	var params = $('#updateHouseForm').serialize();
	//按钮失效防点击
	$(".btn").attr("disabled", true);
	$.ajax({
		type : "POST",
		url : "<%=basePath%>" + "loan/collateral/save.do",
		data : encodeURI(params),
		success : function(data) {
			//关闭遮罩，弹出消息框
			closeMask();
			if ("true"==data.success) {
				$.messager.alert('消息', data.message, 'info', function(){
					//window.parent.refreshTab("appUpdateTabs");
					var url = "loan/collateral/update.do?id=" + data.id +"&loanId="+data.loanId+"&type="+data.type;
					window.parent.refreshCollateralTab('collQueryTabs',url);
            	});
            } else {				
    			$.messager.alert('消息', data.message);
				//按钮生效
				$(".btn").removeAttr("disabled");
            }
		},
		error : function() {
			//关闭遮罩，弹出消息框
			closeMask();
			$.messager.confirm('消息', '数据加载失败,请联系系统管理员！');
			//按钮生效
			$(".btn").removeAttr("disabled");
		}
	});
}

//返回
function back(){
	window.history.go(-1);
}

//页面加载完动作
$(document).ready(function (){
	// 所在地-省
	var provinceUrl = "sys/datadictionary/listjason.do?keyName=province";
	$("#prvn").combobox("clear");
	$('#prvn').combobox({
		url: provinceUrl,
		valueField: 'keyProp',
		textField: 'keyValue',
		onChange: function(newValue, oldValue){
	        $('#city').combobox('clear');
	        $('#ctry').combobox('clear');
	        var cityUrl = "sys/datadictionary/listjason.do?keyName=city&parentKeyProp=" + encodeURI(newValue);
	        $('#city').combobox('reload',cityUrl); 
    	},
    	loadFilter:function(data){
			var comVal = $(this).combobox("getValue");
			if(comVal == '' || comVal == null) {
		   		var opts = $(this).combobox('options');
		   		var emptyRow = {};
				emptyRow[opts.valueField] = '';
				emptyRow[opts.textField] = '请选择';
				data.unshift(emptyRow);
				$(this).combobox("setValue",'');
			}
			return data;
		}
	});
	
	// 所在地-市
	var homePrvn = $('#prvn').combobox('getValue');
	var cityUrl = "sys/datadictionary/listjason.do?keyName=city&parentKeyProp=" + encodeURI(homePrvn);
	$("#city").combobox("clear");
	$('#city').combobox({
		url: cityUrl,
		valueField: 'keyProp',
		textField: 'keyValue',
		onChange: function(newValue, oldValue){
            $('#ctry').combobox('clear');
            var countyUrl = "sys/datadictionary/listjason.do?keyName=county&parentKeyProp=" + encodeURI(newValue);
            $('#ctry').combobox('reload',countyUrl); 
		}
	});
	
	// 所在地-区/县
	var homeCity = $('#city').combobox('getValue');
	var countyUrl = "sys/datadictionary/listjason.do?keyName=county&parentKeyProp=" + encodeURI(homeCity);
	$("#ctry").combobox("clear");
	$('#ctry').combobox({
		url: countyUrl, 
		valueField: 'keyProp',
		textField: 'keyValue'
	});
});

</script>
</html>

