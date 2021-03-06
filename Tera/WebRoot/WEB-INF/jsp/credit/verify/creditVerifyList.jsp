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
<title>信用贷款申请表列表</title>
	<link href="css/global.css" type="text/css" rel="stylesheet"/>
</head>
<body>
	<div class="content">
		<form name="queryList" id="queryList" method="post" action="${ pm.url}">
			<div id="control" class="control">
				<a href="javascript:void(0);" onclick="window.location.reload();"><img src="img/square/but_renew.png" class='dotimg' title="刷新" /></a>&nbsp;&nbsp;
			</div>
			
			<table id="table" class="datatable" summary="list of members in EE Studay">
				<tr>
					<th scope="col">序号</th>
					<th scope="col">申请编号</th>
					<th scope="col">姓名</th>
					<th scope="col">进件时间</th>
					<th scope="col">借款金额</th>
					<th scope="col">渠道</th>
					<th scope="col">产品</th>
					<th scope="col">期限</th>
					<th scope="col">状态</th>
					<th scope="col">所属机构</th>
					<th scope="col">营销人员</th>
<%--					<th scope="col">操作</th>--%>
					<c:if test="${stateType=='waitTask'}">
						<th scope="col">操作</th>
					</c:if>
					<c:if test="${stateType=='inTask'||stateType=='offTask'}">
						<th scope="col">当前处理状态</th>
					</c:if>
				</tr>

				<c:forEach items="${ pm.data}" var="data" varStatus="status">
					<tr>
						<td style="text-align: center;">${ status.index+pm.rowS+1}</td>
						<td><a href="<c:if test="${stateType eq 'offTask' or stateType eq 'inTask' }">credit/query/read.do?id=${data.id }</c:if>credit/app/read.do?id=${data.id}" target="_blank">${data.appId}</a></td>
						<td>${data.name}</td>
						<td>${data.inputTimeStr}</td>
						<td>
<%--						${data.amount}--%>
						<fmt:formatNumber value="${data.amount/10000}" type="currency"/>万元
						</td>
						<td>${data.belongChannelName}</td>
						<td>${data.product}</td>
						<td>${data.period}个月</td>
<%--						<td>--%>
<%--							<c:choose>--%>
<%--	                        <c:when test="${data.period=='1'}">12个月</c:when>--%>
<%--	                        <c:when test="${data.period=='2'}">18个月</c:when>--%>
<%--	                        <c:when test="${data.period=='3'}">24个月</c:when>--%>
<%--	                        <c:when test="${data.period=='4'}">36个月</c:when>--%>
<%--	                        <c:otherwise>未知</c:otherwise>--%>
<%--	                        </c:choose>--%>
<%--						</td>--%>
						<td>
							<c:choose>
								<c:when test="${data.state=='0'}">前端拒贷</c:when>
								<c:when test="${data.state=='1'}">录入申请</c:when>
								<c:when test="${data.state=='2'}">审核退回</c:when>
								<c:when test="${data.state=='3'}">审核</c:when>
								<c:when test="${data.state=='4'}">审批退回</c:when>
								<c:when test="${data.state=='6'}">审批</c:when>
								<c:when test="${data.state=='7'}">特殊审批退回</c:when>
								<c:when test="${data.state=='10'}">特殊审批</c:when>
								<c:when test="${data.state=='13'}">签约</c:when>
								<c:when test="${data.state=='14'}">撮合已完成</c:when>
								<c:when test="${data.state=='15'}">复核退回</c:when>
								<c:when test="${data.state=='17'}">复核</c:when>
								<c:when test="${data.state=='18'}">放款退回</c:when>
								<c:when test="${data.state=='19'}">放款</c:when>
								<c:when test="${data.state=='20'}">已确认放款</c:when>
								<c:when test="${data.state=='21'}">放款成功</c:when>
								<c:when test="${data.state=='22'}">放款失败</c:when>
								<c:when test="${data.state=='23'}">放款完成</c:when>
								<c:when test="${data.state=='24'}">拒贷</c:when>
								<c:otherwise>未知</c:otherwise>
							</c:choose>	
						</td>
						<td>${data.orgName}</td>
						<td>${data.staffName}</td>
<%--						<td>--%>
<%--							<a href="javascript:void(0);" onclick="javascript:updateData('${ data.id}');">审核</a>&nbsp;--%>
<%--						</td>--%>
						<c:if test="${stateType=='waitTask'}">
						<td>
							<a href="javascript:void(0);" onclick="javascript:updateData('${ data.id}','${data.name}');">审核</a>&nbsp;
						</td>
						</c:if>
						<c:if test="${stateType=='inTask'||stateType=='offTask'}">
						<td>
							${data.taskState}
						</td>
						</c:if>
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
function updateData(data_id,name) {
	var url="<%=basePath%>credit/verify/update.do?id="+data_id;
	addTab(name, url);
	return null;
}

//页面加载完动作
$(document).ready(function (){
			
});
</script>
</html>

