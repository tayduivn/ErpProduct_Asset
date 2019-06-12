<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="fnc" uri="/WEB-INF/tlds/fnc.tld" %>
<%@ taglib prefix="fnf" uri="/WEB-INF/tlds/fnf.tld" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<%@ taglib prefix="flow" tagdir="/WEB-INF/tags/flow" %>
<c:set var="_serverStartDate" value="${fns:formatDate(fns:getServerStartDate(),'MMddHHmm')}"/><%-- 服务器启动时间  --%>
<c:set var="_version" value="${fns:getConfig('version')}-${_serverStartDate}"/><%-- 当前系统版本号  --%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/><%-- 上下文基础路径 --%>
<c:set var="ctx" value="${ctxPath}${fns:getAdminPath()}"/><%-- 管理端上下文路径 --%>
<c:set var="ctxStatic" value="${ctxPath}/static"/><%-- 上下文静态文件路径 --%>
<c:set var="themeName" value="${fns:getConfig('web.view.themeName')}"/><%-- 当前主题名称 --%>
<c:set var="ctxStaticTheme" value="${ctxStatic}/themes/${themeName}"/><%-- 当前主题路径 --%>
<c:set var="boxStyleColor">default</c:set><%-- 页面 portlet box 颜色值 --%>