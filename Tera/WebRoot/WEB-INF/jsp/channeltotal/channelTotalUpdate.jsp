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
<title>渠道汇总管理表更新</title>
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
		<p class="title"><a href="javascript:void(0);">更新</a></p>
		<div class="content">
			<form id="updateForm" >
				<table>
					<tbody>
					<input id="id" name="id" type="hidden" size="35" value="${ bean.id}" />
					<tr>
						<td>渠道名称:</td>
						<td><input id="channelName" name="channelName" type="text" data-options="validType:['length[0,30]']" class="textbox easyui-validatebox" value="${bean.channelName}"/></td>
					</tr>
					<tr>
						<td>渠道编码:</td>
						<td><input id="channelCode" name="channelCode" type="text" data-options="validType:['length[0,30]']" class="textbox easyui-validatebox" value="${bean.channelCode}"/></td>
					</tr>
					<tr>
						<td>备注:</td>
						<td>
<%-- 							<input id="remarks" name="remarks" type="text" data-options="validType:['length[0,100]']" class="textbox easyui-validatebox" value="${bean.remarks}"/> --%>
							<textarea id="remarks" name="remarks" value="${bean.remarks}" class="textbox easyui-validatebox" data-options="validType:['length[0,100]']" 
								style="resize: none;width:625px;height:50px!important;">${bean.remarks}</textarea>
						</td>
					</tr>
					<tr>
						<td>状态:</td>
						<td>
							<select class="easyui-combobox" name="state" editable="false" style="width:152px;">
									<option value="1">正常</option>
									<option value="2">挂起</option>
									<option value="0">停用</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="保存" class="btn" onclick="updateFunction()"/>
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

</body>
<script type="text/javascript">
//更新保存
function updateFunction() {
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
	//弹出异步加载 遮罩
	openMask();
	var params = $('#updateForm').serialize();
	//按钮失效防点击
	$(".btn").attr("disabled", true);
	$.ajax({
		type : "POST",
		url : "<%=basePath%>" + "channeltotal/save.do",
		data : encodeURI(params),
		success : function(data) {
			//关闭遮罩，弹出消息框
			closeMask();
			if ("true"==data.success) {
				$.messager.alert('消息', data.message, 'info', function(){
//	                var url= "<%=basePath%>" + "channeltotal/query.do";
//					window.location=url;
					window.history.go(-1);
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
	//填充select数据样例
	/*<%--
	var tsurl="sys/datadictionary/listjason.do?keyName=repaymethod";
	$("#repayMethod").combobox("clear");
	$('#repayMethod').combobox({url:tsurl, valueField:'keyProp', textField:'keyValue'});
	--%>*/
});

</script>
</html>

