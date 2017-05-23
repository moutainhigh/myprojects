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
<title>数据字典列表</title>
	<link href="css/global.css" type="text/css" rel="stylesheet"/>
</head>
<body>
	<div class="content">
		<form name="queryList" id="queryList" method="post" action="${ pm.url}">
			<div id="control" class="control">
				<a href="javascript:void(0);" onclick="add();"><img src="img/square/sys_but_add.png" class='dotimg' title="添加" /></a>&nbsp;
				<a href="javascript:void(0);" onclick="window.location.reload();"><img src="img/square/but_renew.png" class='dotimg' title="刷新" /></a>&nbsp;&nbsp;
			</div>
			
			<table id="table" class="datatable" summary="list of members in EE Studay">
				<tr>
					<th scope="col">序号</th>
<th scope="col">字典名称</th>
<th scope="col">字典属性</th>
<th scope="col">字典值</th>
<th scope="col">描述</th>
<th scope="col">字典父属性</th>

					<th scope="col" width="160">操作</th>
				</tr>
				<c:forEach items="${ pm.data}" var="data" varStatus="status">
					<tr>
						<td style="text-align: center;">${ status.index+pm.rowS+1}</td>
<td>${data.keyName}</td>
<td>${data.keyProp}</td>
<td>${data.keyValue}</td>
<td>${data.description}</td>
<td>${data.parentKeyProp}</td>

						<td>
							<a href="javascript:void(0);" onclick="javascript:updateData('${ data.id}');">更新</a>&nbsp;
							<a href="javascript:void(0);" onclick="javascript:deleteData('${ data.id}');">删除</a>&nbsp;
						</td>
					</tr>
				</c:forEach>
			</table>
	
			<div id="pageStyle">
			${ pm.pageNavigation}
			</div>
		</form>
	</div>
</body>

<script language="javascript">
//更新
function updateData(data_id) {
	window.location = "<%=basePath%>" + "sys/datadictionary/update.do?id=" + data_id;
	
	return;
}
//删除
function deleteData(data_id) {
	
	$.messager.confirm('消息', '您确认要删除？', function(ok){
		if (ok){
			$.ajax({
				url : "<%=basePath%>" + "sys/datadictionary/delete.do",
				// 防止浏览器缓存，在URL后加时间戳 "&timestamp=" + (new Date()).getTime()
				data : encodeURI("id=" + data_id + "&timestamp=" + (new Date()).getTime()),
				async : false,// 同步提交
				success : function(data) {
					if ("true"==data.success) {
						// form刷新防提示
						
						$.messager.alert('消息', data.message,"info", function(){
			                   	window.location = window.location + "&timestamp=" + (new Date()).getTime();
								window.location.reload();
								return true;
		            	});
					} else {
						alert("删除错误");
					}
				}
			});
		}
	});
	
}

//添加
function add(){
	window.location = "<%=basePath%>" + "sys/datadictionary/update.do";
	
	return;
}
</script>
</html>

