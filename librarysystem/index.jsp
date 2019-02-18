<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${pageContext.request.contextPath }/plugins/bootstrap.css"  type="text/css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath }/css/login.css"  type="text/css" rel="stylesheet" >
	<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery-3.3.1.js"></script>
	<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/bootstrap.js"></script>
		<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery.validate.min.js"></script>
	<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/additional-methods.js"></script>
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/messages_zh.js"></script>
	<style>
		.font {
					background: #EEE url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAIAAAAmkwkpAAAAHklEQVQImWNkYGBgYGD4//8/A5wF5SBYyAr+//8PAPOCFO0Q2zq7AAAAAElFTkSuQmCC) repeat;
					text-shadow: 5px -5px black, 4px -4px white;
					font-weight: bold;
					font-size:22px;
					-webkit-text-fill-color: transparent;
					-webkit-background-clip: text;
					text-align: center;
				}
	</style>
  </head>
  <body style="background: lightblue;">
  <c:remove var="user" scope="session" />
    <div class="font" >
    <h1 >欢迎来到图书管理系统！</h1></div>
	<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
		
    <!-- 图标 -->
    <div class="fadeIn first">
      <img src="https://i.loli.net/2019/02/12/5c62ea93140ec.jpg" id="icon" alt="User Icon" style="width:100px; height:100px"/>
    </div>

    <!--登录表格 -->
    <form  id="loginform" action="${pageContext.request.contextPath}/user/login" method="post">
      <input type="text" id="name" class="fadeIn second" name="name" placeholder="姓名">
      <input type="password" id="password" class="fadeIn third" name="password" placeholder="密码">
       <div>
               <input type="radio"  name="login" value="student"> 学生登录&nbsp;&nbsp;&nbsp;
               <input type="radio" name="login"  value="teacher"> 教师登录<br /><br />
       </div>
      <input type="submit" class="fadeIn fourth" value="登录">
    </form>
    <span style="color: red"><b>${requestScope.errmsg}</b></span><br>
    <!-- 注册 -->
    <div id="formFooter">
      <a class="underlineHover" href="${pageContext.request.contextPath }/regist.jsp">学生注册请点这里</a>
    </div>
  </div>
</div>
	<script type="text/javascript">
	$(function() {
		$("#loginform").validate({
			rules : {
				name : {
					required : true,
				},
				password : {
					required : true,
				},
				login : {
					required : true,
				}
			},
			messages : {
				name : {
					required : " ",
				},
				password : {
					required : " ",
				},
				login : {
					required : "",
				}
			}
		});
	});
	</script>
  </body>
</html>
