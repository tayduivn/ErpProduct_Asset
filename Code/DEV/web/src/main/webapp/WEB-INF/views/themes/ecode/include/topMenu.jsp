<%@ page contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="navbar-buttons navbar-header pull-right collapse navbar-collapse" role="navigation">
	<ul class="nav ace-nav">
		<li class="green">
			<a href="javascript:" data-href="${ctxPath}/licence" data-title="许可授权" title="许可授权" class="addTab btn-lic">${_info_title}</a>
		</li>
		<li class="green">
			<a href="javascript:" data-href="${ctx}/sys/user/info?qtype=0" data-title="${fns:text('个人中心')}" title="${fns:text('个人中心')}" class="addTab">
<!-- 				<i class="ace-icon data-icon icon-user"></i> -->
				<i class="ecode-icon usericon"></i>
				<span class="title">${fns:text('个人中心')}</span>
			</a>
			<!-- 请勿删除，修改密码a标签，否则初始密码提醒将不可用。 -->
			<a id="modifyPassword" href="javascript:" data-href="${ctx}/sys/user/info?qtype=2" class="addTab hide">修改密码</a>
		</li>
		<c:if test="${fns:getConfig('sys.home.isShowOnlineNum') eq 'true'}">
			<li class="green">
				<shiro:hasPermission name="sys:online:view"><c:set var="onlineAddTab" value="addTab"/></shiro:hasPermission>
				<a href="javascript:" data-href="${ctx}/sys/online/list" data-title="${fns:text('在线人员')}" title="${fns:text('在线人员')}" class="${onlineAddTab}">
	<!-- 				<i class="ace-icon fa icon-user-following"></i> -->
					<i class="ecode-icon onlineicon"></i>
					<span id="onlineCount" class="badge badge-success">0</span>
				</a>
				<script type="text/javascript">
					function refreshOnlineCount(){
						$.get('${ctx}/sys/online/count?__notUpdateSession=true', function(data){
							try{$('#onlineCount').html(Number(data))}catch(e){}
						})
					}
					refreshOnlineCount(); // 先执行一次
					setInterval(refreshOnlineCount, 180000); // 3分钟执行一次
				</script>
			</li>
		</c:if>
		<c:if test="${fns:getModule('msg').isEnable && fns:getConfig('sys.home.isShowMsgNum') eq 'true'}">
			<!-- BEGIN NOTIFICATION DROPDOWN -->
			<li class="purple">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#" title="消息提醒">
<!-- 					<i class="ace-icon fa fa-bell-o icon-animated-bell"></i> -->
					<i class="ecode-icon msgicon icon-animated-vertical"></i>
					<span class="badge badge-important" id="msgNumber">0</span>
				</a>
				<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
					<li class="dropdown-header">
						<i class="ace-icon fa fa-exclamation-triangle"></i>
						<span id="msgTitle">暂无最新消息<%-- 您还有 5 项未读消息 --%></span>
					</li>
					<li class="dropdown-content">
						<ul class="dropdown-menu dropdown-navbar navbar-pink" id="msgList"></ul>
					</li>
					<li class="dropdown-footer">
						<a href="javascript:" data-href="${ctx}/sys/msg/list" data-title="消息管理" class="addTab">查看所有消息 <i class="ace-icon fa fa-arrow-right"></i></a>
					</li>
				</ul>
			</li>
			<!-- END NOTIFICATION DROPDOWN -->
		</c:if>
		<c:if test="${fns:getModule('eflow').isEnable}">
			<li class="green">
				<a href="javascript:" data-href="${ctx}/eflow/flowBusiness/flowTodoList" data-title="待办业务" title="待办业务" class="addTab">
<!--	 				<i class="ace-icon fa icon-user-following"></i> -->
					<i class="ecode-icon todoicon" ></i>
					<span id="flowTodoCount" class="badge badge-success">0</span>
				</a>
				<script type="text/javascript">
					function refreshFlowTodoCount(){
						$.get('${ctx}/eflow/flowBusiness/flowTodoListData', function(data){
							try{$('#flowTodoCount').html(Number(data.count))}catch(e){}
						})
					}
					refreshFlowTodoCount(); // 先执行一次
					setInterval(refreshFlowTodoCount, 180000); // 3分钟执行一次
				</script>
			</li>
		</c:if>
		<c:if test="${fns:getConfig('sys.home.helpIconHref') != 'false'}">
			<li class="green">
				<a  href="${fns:getConfigDefault('sys.home.helpIconHref', '#')}" title="帮助" target="_blank">
	<!-- 					<i class="ace-icon data-icon icon-question"></i> -->
						<i class="ecode-icon helpicon"></i>
					<span class="title">帮助</span>
				</a>
			</li>
		</c:if>

			<!-- BEGIN NOTIFICATION DROPDOWN -->
			<li class="purple">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#" title="App">
					<i class="fa fa-qrcode" style="font-size:22px;margin-top:12px;display:block;"></i>
				</a>
				<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
						<img src="${ctxStatic}/modules/sys/img/appimg.jpg" style="height: 100%;width: 100%" alt="请使用浏览器扫描图片下载app">
				</ul>
			</li>
			<!-- END NOTIFICATION DROPDOWN -->

		<%--<!-- #section:basics/navbar.user_menu -->--%>
		<%--<li class="purple">--%>
			<%--<a data-toggle="dropdown" class="dropdown-toggle" href="#" title="语言切换">--%>
				<%--<i class="icon-globe" style="font-size:18px;margin-top:12px;display:block;"></i>--%>
			<%--</a>--%>
			<%--<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">--%>
				<%--<c:forEach items="${fns:getDictList('sys_lang_type')}" var="dict">--%>
					<%--<li><a href="${ctxPath}/lang/${dict.value}">${dict.label}</a></li>--%>
				<%--</c:forEach>--%>
			<%--</ul>--%>
		<%--</li>--%>
	</ul>
</div>
<c:if test="${menuStyle eq '2'}">
	<div class="navbar-menu navbar-header pull-left collapse navbar-collapse" role="navigation">
	
		<%-- 一级菜单 --%>
		<c:set var="menuList" value="${fns:getMenuListByParentCode('0')}"/>
		<ul class="nav navbar-nav ${fn:length(menuList) eq 1 ? 'hide' : ''}">
			<c:choose>
				<c:when test="${fn:length(menuList) gt 6}">
					<c:forEach items="${menuList}" var="menu" begin="0" end="5">
						<c:if test="${menu.isMenu && menu.parentCode eq '0' && menu.isShow eq '1'}">
							<li>
								<a data-id="${menu.id}" ${not empty menu.target ? '' : 'href="javascript:" data-'}href="${menu.url}" data-href2="${ctx}/sys/menu/tree?parentCode=${menu.menuCode}" 
									target="${not empty menu.target ? menu.target : ''}" class="${not empty menu.target ? '' : 'menu'}" data-id="${menu.menuCode}" style="color:${menu.color}">
									<i class="ace-icon ${not empty menu.icon ? menu.icon : 'fa fa-caret-right'}" style="color:${menu.color}"></i>
									${menu.localeName}
								</a>
							</li>
						</c:if>
					</c:forEach>
					 <li class="dropdown more">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:forEach items="${menuList}" var="menu" begin="6" end="${fn:length(menuList) - 1}">
								<li>
									<a ${not empty menu.target ? '' : 'href="javascript:" data-'}href="${menu.url}" data-href2="${ctx}/sys/menu/tree?parentCode=${menu.menuCode}" 
										target="${not empty menu.target ? menu.target : ''}" class="${not empty menu.target ? '' : 'menu'}" data-id="${menu.menuCode}" style="color:${menu.color}">
										<i class="ace-icon ${not empty menu.icon ? menu.icon : 'fa fa-caret-right'}" style="color:${menu.color}"></i>
										${menu.localeName}
									</a>
								</li>
							</c:forEach>
						</ul>
					</li>
					
				</c:when>
				<c:otherwise>
					<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
						<c:if test="${menu.isMenu && menu.parentCode eq '0' && menu.isShow eq '1'}">
							<li>
								<a ${not empty menu.target ? '' : 'href="javascript:" data-'}href="${menu.url}" data-href2="${ctx}/sys/menu/tree?parentCode=${menu.menuCode}" 
									target="${not empty menu.target ? menu.target : ''}" class="${not empty menu.target ? '' : 'menu'}" data-id="${menu.menuCode}" style="color:${menu.color}">
									<i class="ace-icon ${not empty menu.icon ? menu.icon : 'fa fa-caret-right'}" style="color:${menu.color}"></i>
									${menu.localeName}
								</a>
							</li>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<li class="dropdown more">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown">常用<b class="caret"></b></a>
				<ul class="dropdown-menu" id="used-menu-ul">
					
				</ul>
			</li>
		</ul>
		<%-- 一级菜单 END --%>
	</div>
</c:if>
<script type="text/javascript">
initMenu();
function initMenu(){
	$("#used-menu-ul").empty();
	var top = 15;
	$.post('${ctx}/sys/usedMenu/findUsedMenuTop10',{},function(data){
		if(data.length > 0){
			$.each(data,function(idx,mu){
				var menu = mu.menu;
				if (menu){
					var i_class = "ace-icon "+(menu.icon!=undefined && menu.icon != '' ? menu.icon : "fa fa-caret-right");
					var target = menu.target != ''?(menu.target==undefined?"":menu.target):"";
					var color = menu.color==undefined?"":menu.color;
					var html = '<li><a href=\"javascript:\" data-href="${ctx}'+menu.href
						+'" data-href2="${ctx}/sys/menu/tree?parentCode='+menu.menuCode
						+'" target="'+target+'" class="addTab" data-id="'+mu.menuId
						+'" style="color:'+color+'"><i class="'+i_class+' fa-fw" style="color:'+color
						+'"></i>&nbsp;'+menu.name+'</a><i class="fa fa-remove" style="position: absolute;right: 10px;top: '+top+'px;color:#fea988;cursor:pointer;" onclick="removeUsedMenu(\''+mu.menuId+'\',\''+menu.name+'\')"></i></li>';
					$("#used-menu-ul").append(html);
					top = top+34;
				}
			});
		}else{
			$("#used-menu-ul").append("<li><a href=\"javascript:void(0);\">你还没有常用菜单</a></li>");
		}
		
	},'json');
}
	
function removeUsedMenu(id,name){
	var submit = function (v, h, f) {
	    if (v == 'ok'){
	    	$.post('${ctx}/sys/usedMenu/deleteUsedMenu',{menuId:id},function(data){
	    		showMessage(data.message);
	    		initMenu();
	    	},'json');
	    }else if (v == 'cancel'){
	    	
	    }
	    return true; //close
	};
	$.jBox.confirm("确定要删除【"+name+"】这个菜单吗？", "提示", submit);
}
</script>