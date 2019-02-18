<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookindexheader.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${pageContext.request.contextPath }/plugins/bootstrap.css"  type="text/css" rel="stylesheet" >
	<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery-3.3.1.js"></script>
	<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/bootstrap.js"></script>
  </head>
 
  <body>
    	<hr size="5px" color="lightblue"/>
	<h1>
		图书<!--  <span style="text-align:right;float:right">
			<button class="btn btn-primary" style="width:150px;height:60px" onclick="returnBookIndex()">
				<h3>退出登录</h3>
			</button>

		</span> -->
	</h1>
	<hr size="5px" color="lightblue" />
  </body>
  <script>
	function returnBookIndex() {
		window.location.href = "${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/book/bookindex.jsp")) + "/userindex.jsp";
	}
</script>
</html>
