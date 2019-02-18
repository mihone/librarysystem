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

<title>修改密码</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery-3.3.1.js"></script>
		<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery.validate.min.js"></script>
	<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/additional-methods.js"></script>
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/messages_zh.js"></script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"51333",secure:"51338"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/librarysystem/WebRoot/student/alterpassword.jsp">
	<!-- <c:url value='/alterPassword' /> -->
	<form id="alterform" style="text-align:center;"
		action="${pageContext.request.contextPath }/alterPassword" method="post" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/librarysystem/WebRoot/student/alterpassword.jsp">
		<!-- <h2><span style="color: red" id="errmsg"></span></h2> -->
		<br> <label for="s_password" style="font-size:20px;">旧密码：</label><input
			type="password" name="s_password"  id="s_password" style="width:200px;height:30px"><br />
		<br /> <label for="s_repassword" style="font-size:20px;">新密码：&nbsp;&nbsp;&nbsp;</label><input
			type="password" name="s_repassword" id="s_repassword" style="width:200px;height:30px">
		<br /> <br />
		<div id=alertpasswordbutton style="text-align:center;">
			<button type="button" id="confirmbutton" style="font-size:22;" ><!-- onclick="formSubmit()"  -->
				<b>确定</b>
			</button>
			<span>&nbsp;&nbsp;&nbsp;</span>
			<button id=cancelbutton style="font-size:22;" type="button"
				onclick="cancelButton()">
				<b>取消</b>

			</button>
								
		</div>
		
	</form>
 <!-- <button id="confirmbutton222" style="font-size:22;"  type="button">hahdhhk</button><br>  -->

	<script>
		
		$("#confirmbutton").click(function(){
			var o = $("#s_password").val();
			var n = $("#s_repassword").val();
			if(o !="" &&n !="" ) {
					var json = {
						s_password : o,
						s_repassword : n
					};
					$.ajax({
						url : "${pageContext.request.contextPath }/alterPassword",
						type : "post",
						data : JSON.stringify(json) ,
						contentType : "application/json;charset=UTF-8", //发送data格式是json
						dataType : "json", //回调是json格式
						success : function(data) {
							if (data.s_id == 1) {
								alert("修改密码成功");
								window.location.href = "${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/alterpassword.jsp")) + "/blank.jsp";
							} else {
								alert(data.s_id);
								window.location.href = "${pageContext.request.requestURL}";
							}
						}
					});
					}

			//alert("adasda");
		});
	
		function cancelButton() {
			//alert("${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/index.jsp"))+"/regist.jsp");
			window.location.href = "${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/alterpassword.jsp")) + "/blank.jsp";
		}
		
		$(function() {
			$("#alterform").validate({
				rules : {
					s_password : {
						required : true,
					},
					s_repassword : {
						required : true,
					}
				},
				messages : {
					s_password : {
						required : "密码不得为空！",
					},
					s_repassword : {
						required : "密码不得为空！",
					}
				}
			});
		});
	</script>
</body>
</html>
