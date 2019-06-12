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
-->
</style>
</c:set>
<sys:header title="用户查询" extLibs="${extLibs}" extHead="${extHead}"/>
<div class="portlet box">
	<div class="portlet-body list">
		<form:form id="searchForm" modelAttribute="flowBusiness" action="${ctx}/usedinfo/assetUsedInfo/listNextApprovalData" method="post" class="breadcrumb form-inline "
				data-page-no="${page.pageNo}" data-page-size="${page.pageSize}" data-order-by="${page.orderBy}">
			<!-- 传入step、bizKey两个参数 或 nextFlowBusinessId 一个参数 可查询下一步审批人列表-->
			<form:hidden path="step"/>
			<form:hidden path="bizKey"/>
			<form:hidden path="nextFlowBusinessId"/>
			<!-- 审批人编码不等于 -->
			<form:hidden path="approvalCodeNe"/>
				<div class="form-group">
					<label class="control-label">用户名称：</label>
						<form:input path="approvalName" htmlEscape="false" maxlength="50" class="form-control input-sm width-90"/>
				</div>
			<div class="form-group" > &nbsp;&nbsp;
				<input class="btn btn-primary btn-sm" type="submit" value="查询"/>&nbsp;
				<input class="btn default btn-sm" type="reset" value="重置"/>
			</div>	
		</form:form>
		<table id="dataGrid"></table>
	    <div id="dataGridPage"></div>
		<div id="selectUsers" class="tagsinput hide"></div>
	</div>
</div>
<sys:footer extLibs="${extLibs}" />
<script type="text/javascript">
	var dataMap = {}, dataSize = 0; // 获取数据MAP
	$(document).ready(function() {
		//<c:if test="${not empty selectData && selectData!=''}">
		var selectData="${selectData}";
		selectData = selectData.replace(new RegExp("\'","g"),"\"");
		dataMap = JSON.parse(selectData);
		selectUsers();
		//</c:if>
		// 初始化DataGrid对象
		$('#dataGrid').dataGrid({
            sortable:false,
			// 当前页签编号
			tabPageId: '${param.tabPageId}',
			// 设置数据表格列
			columnModel: [
                {header:'用户编码', name:'userCode', index:'user_code', width:200, align:"left",sortable:false},
                {header:'用户名称', name:'userName', index:'user_name', width:200, align:"left",sortable:false},
                {header:'行数据', name:'rowData', hidden:true, formatter: function(val, obj, row, act){
                        return JSON.stringify(row);
                    }}
			],
			multiboxonly: false,
			showCheckbox: '${param.mul}' == 'true',
			ajaxSuccess: function(data){ // 加载成功后执行方法
				$.each(dataMap, function(key, value){
					$('#dataGrid').dataGrid('setSelectRow', key);
				});
			},
			onSelectRow: function(id, isSelect, event){
				if ('${param.mul}' == 'true'){
					if(isSelect){
						dataMap[id] = JSON.parse($('#dataGrid').dataGrid('getRowData', id).rowData);
					}else{
						delete dataMap[id];
					}
				}else{
					dataMap = {};
					dataMap[id] = JSON.parse($('#dataGrid').dataGrid('getRowData', id).rowData);
				}
				selectUsers();
			},
			onSelectAll: function(ids, isSelect){
				if ('${param.mul}' == 'true'){
					for (var i=0; i<ids.length; i++){
						if(isSelect){
							dataMap[ids[i]] = JSON.parse($('#dataGrid').dataGrid('getRowData', ids[i]).rowData);
						}else{
							delete dataMap[ids[i]];
						}
					}
				}
				selectUsers();
			},
			ondblClickRow: function(id, rownum, colnum, event){
				if ('${param.mul}' != 'true'){
					var $jBox = getJBox();
					$jBox.getBox().find("button[value='ok']").trigger("click");
				}
				selectUsers();
			}
		});
		
	});
	
	// 废弃方法，不建议使用，see: getDataMap()
	function getDatas(){
		var retIds = [], retRows = [];
		if('${param.mul}' == 'false'){
			var id = $('#dataGrid').dataGrid('getSelectRow');
			if (id){
				retIds.push(id);
				retRows.push(JSON.parse($('#dataGrid').dataGrid('getRowData', id).rowData));
			}
		}else{
			var ids = $('#dataGrid').dataGrid('getSelectRows');
			for(var i=ids.length-1; i>=0; i--){
				retIds.unshift(ids[i]);
				retRows.unshift(JSON.parse($('#dataGrid').dataGrid('getRowData', ids[i]).rowData));
			}
		}
		return {ids: retIds, rows: retRows};
	}
	
	function selectUsers(){
		dataSize = 0;
		var selectHtml = "";
		$.each(dataMap, function(key, value){
			dataSize ++;
			selectHtml += '<span class="tag" id="'+key+'_tagsinput"><span>'+value.userName+'&nbsp;&nbsp;</span><a href="#" onclick="removingTag(\''+key+'\');" title="Removing tag">x</a></span>';
		});
		selectHtml = '<span class="tag" style="border-color:#fff;background:#fff;"><span>&nbsp;当前已选择<span id="dataSize">'+dataSize+'</span>项：</span></span>' + selectHtml + '<div class="tags_clear"></div>';
		$('#selectUsers').empty().append(selectHtml); 
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