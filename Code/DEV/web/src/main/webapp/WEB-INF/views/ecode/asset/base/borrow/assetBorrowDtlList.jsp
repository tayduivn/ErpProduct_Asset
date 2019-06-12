<%@ page contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set var="extLibs" value="grid"/>
<sys:header title="资产借用归还子表管理" extLibs="${extLibs}" />
<div class="portlet box ${boxStyleColor}">
	<div class="portlet-title">
		<div class="caption"><i class="fa fa-coffee"></i> 资产借用归还子表管理</div>
		<div class="actions">
			<a href="#" class="btn btn-default btn-sm" id="btnSearch" title="查询"><i class="fa fa-search"></i> 查询</a>
			<shiro:hasPermission name="borrow:assetBorrowDtl:edit">
				<a href="${ctx}/borrow/assetBorrowDtl/form" class="btn btn-default btn-sm btnTool" title="新增资产借用归还子表"><i class="fa fa-plus"></i> 新增</a>
			</shiro:hasPermission>
		</div>
	</div>
	<div class="portlet-body list">
		<form:form id="searchForm" modelAttribute="assetBorrowDtl" action="${ctx}/borrow/assetBorrowDtl/listData?isAll=${param.isAll}" method="post" class="breadcrumb form-inline hide"
				data-page-no="${page.pageNo}" data-page-size="${page.pageSize}" data-order-by="${page.orderBy}">
			<%-- <div class="form-group">
				<label class="control-label">借用编码：</label>
				<div class="input-inline">
					<form:input path="borrowCode" htmlEscape="false" maxlength="64" class="form-control input-sm width-160"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">资产编码：</label>
				<div class="input-inline">
					<form:input path="assetCode" htmlEscape="false" maxlength="64" class="form-control input-sm width-160"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">资产名称：</label>
				<div class="input-inline">
					<form:input path="assetName" htmlEscape="false" maxlength="100" class="form-control input-sm width-160"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">资产分类编码：</label>
				<div class="input-inline">
					<form:input path="sortCode" htmlEscape="false" maxlength="64" class="form-control input-sm width-160"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">资产分类名称：</label>
				<div class="input-inline">
					<form:input path="sortName" htmlEscape="false" maxlength="100" class="form-control input-sm width-160"/>
				</div>
			</div>
			<div class="form-group" style="margin-left:10px;"> 
				<input class="btn btn-primary btn-sm" type="submit" value="查询"/>&nbsp;
				<input class="btn default btn-sm" type="reset" value="重置"/>
			</div> --%>
		</form:form>
		<table id="dataGrid"></table>
		<div id="dataGridPage"></div>
		<div id="selectProjects" class="tagsinput"></div>
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
			{header:'借用编码', name:'borrowCode', index:'a.borrow_code', width:200, align:"left", frozen:true, formatter: function(val, obj, row, act){
				return '<a href="${ctx}/borrow/assetBorrowDtl/form?id='+row.id+'" class="btnList" data-title="编辑资产借用归还子表">'+(val ? val : row.id)+'</a>';
			}},
			{header:'资产编码', name:'assetCode', index:'a.asset_code', width:200, align:"left"},
			{header:'资产名称', name:'assetName', index:'a.asset_name', width:200, align:"left"},
			{header:'资产分类编码', name:'sortCode', index:'a.sort_code', width:200, align:"left"},
			{header:'资产分类名称', name:'sortName', index:'a.sort_name', width:200, align:"left"},
			{header:'品牌', name:'brand', index:'a.brand', width:200, align:"left"},
			{header:'型号', name:'version', index:'a.version', width:200, align:"left"},
			 {header:'存放地点', name:'storagePlace', index:'a.storage_place', width:200, align:"left"}, 
		/* 	{header:'公司编码', name:'companyCode', index:'a.company_code', width:200, align:"left"}, */
			{header:'公司名称', name:'companyName', index:'a.company_name', width:200, align:"left"},
			/*  {header:'使用部门编码', name:'office.officeName', index:'a.office_code', width:200, align:"center"}, */
			{header:'使用部门', name:'officeName', index:'a.office_name', width:200, align:"left"},
			/*{header:'使用人编码', name:'user.userName', index:'a.user_code', width:200, align:"center"},
			{header:'使用人名称', name:'userName', index:'a.user_name', width:200, align:"left"},
			{header:'备注信息', name:'remarks', index:'a.remarks', width:200, align:"left"},
			{header:'更新时间', name:'updateDate', index:'a.update_date', width:200, align:"left"}, */
			{header:'操作', name:'actions', width:100, fixed:true, sortable:false, formatter: function(val, obj, row, act){
				var actions = [];
				if (row.status == Global.STATUS_NORMAL){
					actions.push('<a href="${ctx}/borrow/assetBorrowDtl/form?id='+row.id+'" class="btnList" title="编辑资产借用归还子表"><i class="fa fa-pencil"></i></a>&nbsp;');
					actions.push('<a href="${ctx}/borrow/assetBorrowDtl/delete?id='+row.id+'" class="btnList" title="删除该资产借用归还子表" data-confirm="确认要删除该资产借用归还子表吗？"><i class="fa fa-trash-o"></i></a>&nbsp;');
				}
				return actions.join('');
			}}
		],
		ajaxSuccess: function(data){ // 加载成功后执行方法
			
		}
	});
</script>