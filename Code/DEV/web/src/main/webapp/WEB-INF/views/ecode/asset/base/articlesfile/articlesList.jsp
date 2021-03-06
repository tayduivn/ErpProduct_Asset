<%@ page contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set var="extLibs" value="grid"/>
<c:set var="extHead">
<style type="text/css">
<!--
div.tagsinput { border:1px solid #ccc; background:#fff; margin-top:9px; padding:5px; padding-bottom:0; overflow-y: auto;width:auto;min-height:42px; height:42px;}
div.tagsinput span.tag { border: 1px solid #a5d24a; -moz-border-radius:2px; -webkit-border-radius:2px; display: block; float: left; padding: 5px; text-decoration:none; background: #cde69c; color: #638421; margin-right: 5px; margin-bottom:5px;}
div.tagsinput span.tag a { font-weight: bold; color: #82ad2b; text-decoration:none; font-size: 11px;  } 
div.tagsinput input { width:80px; margin:0px; font-family: helvetica; font-size: 13px; border:1px solid transparent; padding:5px; background: transparent; color: #000; outline:0px;  margin-right:5px; margin-bottom:5px; }
div.tagsinput div { display:block; float: left; } 
.tags_clear { clear: both; width: 100%; height: 0px; }
.not_valid {background: #fbd8db !important; color: #90111a !important;}
.breadcrumb{padding-top:4px;}
-->
</style>
</c:set>
<sys:header title="办公用品档案管理管理" extLibs="${extLibs}" extHead="${extHead}" />
<div class="portlet box ${boxStyleColor}">
	<div class="portlet-body list">
		<form:form id="searchForm" modelAttribute="articlesFile" action="${ctx}/articlesfile/articlesFile/listData" method="post" class="breadcrumb form-inline"
				data-page-no="${page.pageNo}" data-page-size="${page.pageSize}" data-order-by="${page.orderBy}">
				<form:hidden path="articlesCodes"/>
				<form:hidden path="articleCodes"/>
		            <div class="row">
		             <div class="col-xs-4">
						<div class="form-group">
							<label class="control-label col-sm-5" title="">
								办公用品名称：<i class="fa icon-question hide"></i></label>
							<div class="col-sm-7">
								<form:input path="articlesName" htmlEscape="false" maxlength="64" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="form-group">
							<label class="control-label col-sm-4" title="">
								办公用品分类：<i class="fa icon-question hide"></i></label>
							  <sys:treeselect url="${ctx}/articlesfile/articlesFile/sortTreeData" id="sortCode"
                                   value="${articlesFile.sortName}" labelName="sortName"
                                   labelValue="${articlesFile.sortName}" title="办公用品分类" name="sortCode"
                                   cssClass="rightBorder" allowClear="true"
                                   notAllowSelectParent="true" isAll="true">
                                </sys:treeselect>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="form-group">
							<input class="btn btn-primary btn-sm" type="submit" value="查询"/>&nbsp;
				            <input class="btn default btn-sm" type="reset" value="重置"/>
						</div>
					</div>
				</div>
		</form:form>
		<table id="dataGrid"></table>
		<div id="dataGridPage"></div>
		<div id="selectProjects" class="tagsinput"></div>
	</div>
</div>
<sys:footer extLibs="${extLibs}" />
<script type="text/javascript">
	var dataMap = {};
	var  dataSize = 0; // 获取数据MAP
	$(document).ready(function() {
	// 初始化DataGrid对象
	$("#dataGrid").dataGrid({
		
		searchForm: $("#searchForm"), // 数据来源表单
		tabPageId: '${param.tabPageId}',// 当前页签编号
		showCheckbox : true, // 是否显示复选框
		
		
		// 设置数据表格列
		columnModel: [
			{header:'办公用品名称', name:'id', index:'a.id', width:150, align:"left",hidden:true},
			{header:'办公用品编码', name:'articlesCode', index:'a.articles_code', width:180, align:"left", frozen:true/* , formatter: function(val, obj, row, act){
				return '<a href="${ctx}/articlesfile/articlesFile/form?id='+row.id+'" class="btnList" data-title="编辑办公用品档案管理">'+(val ? val : row.id)+'</a>';
			} */},
			{header:'办公用品名称', name:'articlesName', index:'a.articles_name', width:150, align:"left"},
            {header:'办公用品分类编码', name:'sortCode', index:'a.sort_code', width:120, align:"left",hidden:true},
			{header:'办公用品分类', name:'sortName', index:'a.sort_name', width:120, align:"left"},
			{header:'品牌名称', name:'brand', index:'a.brand', width:150, align:"left"},
			{header:'规格型号', name:'version', index:'a.version', width:90, align:"left"},
			{header:'单位', name:'unit', index:'a.unit', width:90, align:"left"},
			{header:'行数据', name:'rowData', hidden:true, formatter: function(val, obj, row, act){
                  return JSON.stringify(row);
              }}
		],
		ajaxSuccess: function(data){ // 加载成功后执行方法

		},
		onSelectRow: function(id, isSelect, event){//单选
			if(isSelect){
				dataMap[id] = JSON.parse($('#dataGrid').dataGrid('getRowData', id).rowData);
			}else{
				delete dataMap[id];
			}
		selectProjects();
	},
	onSelectAll: function(ids, isSelect){//全选
	    console.log("123789",ids);
			for (var i=0; i<ids.length; i++){
				if(isSelect){
					dataMap[ids[i]] = JSON.parse($('#dataGrid').dataGrid('getRowData',ids[i]).rowData);
				}else{
					delete dataMap[ids[i]];
				}
			}
		selectProjects();
	}
	});
});
	function selectProjects(){
		dataSize = 0;
		var selectHtml = "";
		$.each(dataMap, function(key, value){

			dataSize ++;
			selectHtml += '<span class="tag" id="'+key+'_tagsinput"><span>'+value.articlesCode+'&nbsp;&nbsp;</span><a href="#" onclick="removingTag(\''+key+'\');" title="Removing tag">x</a></span>';
		});
		selectHtml = '<span class="tag" style="border-color:#fff;background:#fff;"><span>&nbsp;当前已选择<span id="dataSize">'+dataSize+'</span>项：</span></span>' + selectHtml + '<div class="tags_clear"></div>';
		$('#selectProjects').empty().append(selectHtml); 
	}

	function removingTag(key){
		$('#dataGrid').dataGrid('resetSelection', key);
		delete dataMap[key];
		$('#dataSize').html(--dataSize);
		$('#'+key+'_tagsinput').remove();
	}

	function getDataMap(){
		return dataMap;
	}
</script>