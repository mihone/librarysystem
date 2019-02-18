<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head data-genuitec="wc1-22-69">
<base href="<%=basePath%>" data-genuitec="wc1-22-70">

<title data-genuitec="wc1-22-71">My JSP 'menu.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache" data-genuitec="wc1-22-72">
<meta http-equiv="cache-control" content="no-cache" data-genuitec="wc1-22-73">
<meta http-equiv="expires" content="0" data-genuitec="wc1-22-74">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" data-genuitec="wc1-22-75">
<meta http-equiv="description" content="This is my page" data-genuitec="wc1-22-76">

	
<link href="${pageContext.request.contextPath }/plugins/bootstrap.css"
	type="text/css" rel="stylesheet" data-genuitec="wc1-22-77">
<link href="${pageContext.request.contextPath }/css/menu.css"
	type="text/css" rel="stylesheet" data-genuitec="wc1-22-78">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" data-genuitec="wc1-22-79">
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery-3.3.1.js" data-genuitec="wc1-22-80"></script>
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/bootstrap.js" data-genuitec="wc1-22-81"></script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"51333",secure:"51338"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec="wc1-22-50" data-genuitec-lp-enabled="true" data-genuitec-file-id="wc1-22" data-genuitec-path="/librarysystem/WebRoot/frame/teachermenu.jsp">
	<div id="jquery-accordion-menu" class="jquery-accordion-menu" data-genuitec="wc1-22-51" data-genuitec-lp-enabled="true" data-genuitec-file-id="wc1-22" data-genuitec-path="/librarysystem/WebRoot/frame/teachermenu.jsp">
		<div class="jquery-accordion-menu-header" data-genuitec="wc1-22-82">选项</div>
		<ul data-genuitec="wc1-22-83">
			<li class="active" data-genuitec="wc1-22-84"><a href="${pageContext.request.contextPath}/admin/listAll"  target="response" data-genuitec="wc1-22-85">查看所有书籍
			</a></li>
			<li data-genuitec="wc1-22-86"><a href="${pageContext.request.contextPath}/teacher/addbook.jsp"  target="response" data-genuitec="wc1-22-87"></i>添加书籍 </a></li>
			<li data-genuitec="wc1-22-88"><a href="${pageContext.request.contextPath}/teacher/addcategory.jsp"  target="response" data-genuitec="wc1-22-89">添加分类 </a></li>
			
		</ul>
		<div class="jquery-accordion-menu-footer" data-genuitec="wc1-22-90"><span class="jquery-accordion-menu-label" data-genuitec="wc1-22-91"><a href="${pageContext.request.contextPath}/index.jsp" target="_top" style="color: white; text-decoration: none" data-genuitec="wc1-22-92">退出登录</a></span></div>
		
	</div>
	</div>
</body>
</html>
