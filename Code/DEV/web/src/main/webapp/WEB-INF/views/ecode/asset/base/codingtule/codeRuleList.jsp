<%@ page contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set var="extLibs" value="grid"/>
<sys:header title="编码规则管理" extLibs="${extLibs}" />
<div class="portlet box ${boxStyleColor}">
	<div class="portlet-title">
		<div class="caption"><i class="fa fa-coffee"></i> 编码规则管理</div>
		<div class="actions">
			<a href="#" class="btn btn-default btn-sm" id="btnSearch" title="查询"><i class="fa fa-search"></i> 查询</a>
			<shiro:hasPermission name="ass:codeRule:edit">
			<%-- 	<a href="${ctx}/ass/codeRule/form" class="btn btn-default btn-sm btnTool" title="新增编码规则"><i class="fa fa-plus"></i> 新增</a> --%>
			</shiro:hasPermission>
		</div>
	</div>
	<div class="portlet-body list">
		<form:form  id="searchForm" modelAttribute="codeRule" action="${ctx}/ass/codeRule/listData" method="post" class="breadcrumb form-inline hide"
				data-page-no="${page.pageNo}" data-page-size="${page.pageSize}" data-order-by="${page.orderBy}">
			<div class="form-group">
				<label class="control-label">编码对象：</label>
				<div class="input-inline">
					<form:input path="codeObject" htmlEscape="false" maxlength="64" class="form-control input-sm width-160"/>
				</div>
			</div>
			<div class="form-group" style="margin-left:10px;"> 
				<input class="btn btn-primary btn-sm" type="submit" value="查询"/>&nbsp;
				<input class="btn default btn-sm" type="reset" value="重置"/>
			</div>
		</form:form>
		<table id="dataGrid"></table>
		<div id="dataGridPage"></div>
	</div>
</div>
<sys:footer extLibs="${extLibs}" />
<script type="text/javascript">
	// 初始化DataGrid对象
	$("#dataGrid").dataGrid({
		
		searchForm: $("#searchForm"), // 数据来源表单
		tabPageId: '${param.tabPageId}',// 当前页签编号
		
		// 设置数据表格列
		columnModel: [
			{header:'编码对象', name:'codeObject', index:'a.code_object', width:60,align:"center", frozen:true, formatter: function(val, obj, row, act){
				return '<a href="${ctx}/ass/codeRule/form?codeId='+row.codeId+'" class="btnList" data-title="编辑编码规则">'+(val ? val : row.codeId)+'</a>';
			}},
			{header:'编码规则', name:'codeNow', index:'a.code_now', width:250, align:"left"},
			{header:'更新时间', name:'updateDate', index:'a.update_date', width:80, align:"center", },
			{header:'操作', name:'actions', width:80, fixed:true, sortable:false,align:"center", formatter: function(val, obj, row, act){
				var actions = [];
				if (row.status == Global.STATUS_NORMAL){
					actions.push('<a href="${ctx}/ass/codeRule/form?codeId='+row.codeId+'" class="btnList" title="编辑编码规则"><i class="fa fa-pencil"></i></a>&nbsp;');
				}
				return actions.join('');
			}}
		],
		ajaxSuccess: function(data){ // 加载成功后执行方法
			
		}
	});
</script>