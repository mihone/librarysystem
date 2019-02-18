<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="${pageContext.request.contextPath }/plugins/bootstrap.css"  type="text/css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath }/css/regist.css"  type="text/css" rel="stylesheet" >
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
			label.error {
							  color: red;
							}
	
	
	</style>
  </head>
  
  <body style="background-color:#d6d6d6;">
   	<div id="login">
    <h1 class=" text-white pt-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎注册</h1>
    <div class="container  ">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div class="login-box col-md-12">
                    <form id="login-form"  class="form" action="${pageContext.request.contextPath }/user/regist" method="post">
                       <!--  <h3 class="text-center text-info"></h3> -->
                        <div class="form-group">
                            <label for="s_name" class="text-info">用户名</label><em style="color: red;">*</em><br>
                            <input type="text" name="s_name" id="s_name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="s_password" class="text-info">密码</label><em style="color: red;">*</em><br>
                            <input type="password" name="s_password"" id="s_password" class="form-control">
                        </div>
                         <div class="form-group">
                            <label for="comfirmPassword" class="text-info">确认密码</label><em style="color: red;">*</em><br>
                            <input type="password" name="comfirmPassword"" id="comfirmPassword" class="form-control">
                        </div>
                        <div class="form-group">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button id=registForm class="btn btn-primary btn-sm" onclick="registButton()">注册</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button   id=cancel type="button" class="btn btn-primary btn-sm" onclick="cancelButton()">取消</button><br>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--     <h1 style="text-align:center;">欢迎注册</h1>
	<hr />
	<!-- ${pageContext.request.contextPath}/LogInServlet-->
	<form style="text-align:center;" action="<c:url value='/RegistServlet' />" method="POST">
	<label for="username" style="font-size:20px;">用户名：</label><input type="text"   name="username" style="width:200px;height:30px" value="${requestScope.formuser.username}"><span style="color: red"><b>${requestScope.unmsg}</b></span><br /><br />
	<label for="password" style="font-size:20px;">密码：&nbsp;&nbsp;&nbsp;</label><input type="password"   name="password" style="width:200px;height:30px"><span style="color: red"><b>${requestScope.pwdmsg}</b></span>
	<br /><br />
	<label for="captcha" style="font-size:20px;">验证码：</label><input type="text"   name="captcha" style="width:100px;height:30px">
	<img src="${pageContext.request.contextPath}/CaptchaImgServlet"  id="captchaimg" onclick="changeCaptcha()" /><span style="color: red"><b>${requestScope.cmsg}</b></span><br /><br />
	<div id=indexbutton style="text-align:center;">
		<button id=regist style="font-size:22;" onclick="registButton()"><b>注册</b></button>
		<span>&nbsp;&nbsp;&nbsp;</span>
		<button id=cancel style="font-size:22;" type="button" onclick="cancelButton()"><b>取消</b></button>
	
	</div>
	</form> --%>
	<script>
		function registButton(){
			document.getElementById("regist").submit();
		}
		function cancelButton(){
			window.location.href="${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/regist.jsp"))+"/index.jsp";
		}
		jQuery.validator.addMethod("passwordregex", function(value, element) {
			var regex = /^(?![^0-9]+$)(?![^a-zA-Z]+$)[0-9a-zA-Z]{6,15}$/;
			var r = regex.test(value);
			// alert(r);
			return r;
		}, "密码必须由6-15位的字母和数字构成");

			$(function() {
				$("#login-form").validate({
					rules : {
						s_name : {
							required : true,
							minlength : 3,
							maxlength : 12
						},
						s_password : {
							required : true,
							minlength : 6,
							maxlength : 15,
							passwordregex : true
						},
						comfirmPassword : {
							required : true,
							minlength : 6,
							maxlength : 15,
							passwordregex : true,
							equalTo : "#s_password"
						},
					},
					messages : {
						s_name : {
							required : "用户名不能为空！",
							minlength : "用户名不得小于3个字符！",
							maxlength : "用户名不得超过12个字符！"
						},
						s_password : {
							required : "密码不得为空！",
							minlength : "密码不得小于6位！",
							maxlength : "密码不得大于15位！",
							passwordregex : "密码必须由数字和字母构成"
						},
						comfirmPassword : {
							required : "没有重新输入密码",
							minlength : "两次输入的密码不一致！",
							maxlength : "两次输入的密码不一致！",
							equalTo : "两次输入的密码不一致！",
							passwordregex : "两次输入的密码不一致"
						},
					}
				});
			});
	</script>
  </body>
</html>
