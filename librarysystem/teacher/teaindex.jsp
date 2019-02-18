<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-24" data-genuitec-path="/librarysystem/WebRoot/teacher/teaindex.jsp">
<head>
<base href="<%=basePath%>">

<title>图书馆后台管理-${sessionScope.teacher.t_name}
<%-- <c:choose>
	<c:when test="${sessionScope.user. } ">${sessionScope.user.t_name}</c:when>
	<c:otherwise>${sessionScope.user.s_name}</c:otherwise>
</c:choose> --%>

</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"51333",secure:"51338"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<!-- noresize="noresize"  frameborder="0"  border="0"-->
<frameset rows="18%,82%"  noresize="noresize"  frameborder="0"  border="0" >
	<frame
		src="${pageContext.request.contextPath}/frame/teacherheader.jsp">
	<frameset cols="15%,85%">
		<frame src="${pageContext.request.contextPath}/frame/teachermenu.jsp" scrolling="no">
		<%-- <frame src="${pageContext.request.contextPath}/index.jsp"> --%>
		<%--   <frame src="${pageContext.request.contextPath}/regist.jsp"> --%>
		<frame  name="response" src="${pageContext.request.contextPath}/frame/blank.jsp">

	</frameset>

</frameset>
</html>
