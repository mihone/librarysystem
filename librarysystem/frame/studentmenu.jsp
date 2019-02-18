<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'menu.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<link href="${pageContext.request.contextPath }/plugins/bootstrap.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/menu.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery-3.3.1.js"></script>
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/bootstrap.js"></script>
</head>

<body>
	<div id="jquery-accordion-menu" class="jquery-accordion-menu">
		<div class="jquery-accordion-menu-header">选项</div>
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/book/list"  target="response"><!-- <i class="fa fa-home"></i> -->查看图书馆书籍
			</a></li>
			<li><a href="${pageContext.request.contextPath}/book/list?s_id=${sessionScope.user.s_id}"  target="response"><!-- <i class="fa fa-glass"> --></i>我的书籍 </a></li>
			<li><a href="${pageContext.request.contextPath}/student/addbook.jsp"  target="response"><!-- <i class="fa fa-file-image-o"> --></i>添加自定义书籍 </a></li>
			<li><a href="${pageContext.request.contextPath}/student/advancedsearch.jsp"  target="response"><!-- <i class="fa fa-cog"></i> -->高级搜索 </a></li>
			<li><a href="${pageContext.request.contextPath}/student/alterpassword.jsp"  target="response"><!-- <i class="fa fa-newspaper-o"></i> -->修改密码 </a></li>
			<!-- <li><a href="#"><i class="fa fa-suitcase"></i>Portfolio </a></li>
			<li><a href="#"><i class="fa fa-user"></i>About </a></li>
			<li><a href="#"><i class="fa fa-envelope"></i>Contact </a></li> -->
		</ul>
		<div class="jquery-accordion-menu-footer"><span class="jquery-accordion-menu-label"><a href="${pageContext.request.contextPath}/index.jsp" target="_top" style="color: white; text-decoration: none">退出登录</a></span></div>
		<!-- target="_top"实现整个页面跳转 
				<a href="${pageContext.request.contextPath}/index.jsp" target="_top"  >退出登录</a> 
		-->
	</div>
	</div>
</body>
</html>
