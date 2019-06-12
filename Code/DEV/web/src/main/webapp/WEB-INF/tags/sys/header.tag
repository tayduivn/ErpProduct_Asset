<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="页面标题"%>
<%@ attribute name="extLibs" type="java.lang.String" required="false" description="扩展库（jbox、ztree、fileupload、validate、grid、tabpanel、ueditor、supcan）"%>
<%-- <%@ attribute name="loadThemeHead" type="java.lang.Boolean" required="false" description="此属性不建议使用了，重命名为loadTheme属性"%> --%>
<%@ attribute name="useTheme" type="java.lang.String" required="false" description="使用主题风格，设置为true为当前主题，否则为主题名称，自动引用主题下的/include/head.jsp文件"%>
<%@ attribute name="extHead" type="java.lang.String" required="false" description="扩展Head内容，输出到head标签尾部"%>
<%@ attribute name="htmlClass" type="java.lang.String" required="false" description="HTML Class"%>
<%@ attribute name="bodyClass" type="java.lang.String" required="false" description="Body Class"%>
<!DOCTYPE html><c:set var="htmlClass" value="${not empty htmlClass ? htmlClass : 'scroll-y'}"></c:set>
<!--[if IE 8 ]><html class="ie8 ${htmlClass}"><![endif]--><!--[if IE 9 ]><html class="ie9 ${htmlClass}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="${htmlClass}"><!--<![endif]-->
<head><meta charset="utf-8"/><meta content="webkit" name="renderer"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
<meta http-equiv="Pragma" content="no-cache"/><meta http-equiv="Expires" content="0"/>
<meta content="width=device-width, initial-scale=1, user-scalable=1" name="viewport"/>
<meta content="${fns:getConfig('productName')}" name="description"/>
<meta content="http://www.ecode.net.cn" name="author"/>
<title>${title}${not empty title ? ' - ' : ''}资产管理系统</title>
<link rel="shortcut icon" href="${ctxPath}/favicon.ico"/>
<c:set var="extLibs" value=",${extLibs}," />
<%-- 加载主题的herader.jsp文件 --%>
<c:choose><c:when test="${!fn:contains(extLibs, ',custom,') || (not empty useTheme && useTheme eq 'true')}">
	<c:set var="includeThemeName" value="${not empty useTheme && useTheme eq 'true' ? themeName : 'metronic'}"/>
	<jsp:include page="/WEB-INF/views/themes/${includeThemeName}/include/header.jsp">
		<jsp:param name="extLibs" value="${extLibs}"/>
	</jsp:include>
</c:when><c:otherwise>
	<jsp:include page="/WEB-INF/views/include/csslibs.jsp">
		<jsp:param name="extLibs" value="${extLibs}"/>
	</jsp:include>
</c:otherwise></c:choose>
<%-- 扩展Head，请参考默认主题的 sysIndex.jsp --%>
<c:out value="${extHead}" escapeXml="false"/>
</head><body class="${not empty bodyClass ? bodyClass : ''}">
<c:if test="${fn:contains(extLibs, ',validate,')}"><%-- 有表单的情况下，ie8下延迟加载，防止看出不整齐的页面 --%>
<!--[if lt IE 9]><script type="text/javascript">$('body').addClass('hide');$(document).ready(function(){
setTimeout(function(){$('body').removeClass('hide');},300);});</script><![endif]-->
</c:if>
<%-- <a style="color:#f00;text-decoration:underline;position:absolute;left:25px;bottom:45px;z-index:999999999"
	href="javascript:" target="_blank">未注册，请购买正版授权</a> --%>