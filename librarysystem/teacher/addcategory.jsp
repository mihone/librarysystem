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

<title>My JSP 'list.jsp' starting page</title>

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
<link
	href="${pageContext.request.contextPath }/plugins/bootstrap-theme.css"
	type="text/css" rel="stylesheet">
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

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"51333",secure:"51338"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-27" data-genuitec-path="/librarysystem/WebRoot/teacher/addcategory.jsp">
	<div class="container-fluid" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-27" data-genuitec-path="/librarysystem/WebRoot/teacher/addcategory.jsp">
	<div class="row-fluid">
		<div class="span12">
			<div class="text-center form-inline">
				<form  id="addform" action="${pageContext.request.contextPath }/admin/addCategory"">
					<fieldset>
						 <legend>添加分类</legend> <label>分类名</label><input id="c_name" name="c_name" type="text" /> <span class="help-block">50字以内</span> 
						  <button id="addButton" type="button" class="btn btn-primary">提交</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
  </body>
  <script type="text/javascript">
  	$("#addButton").click(function(){
  		var n=$("#c_name").val();
  		var c ={
  				c_name:n,
  		};
  		$.ajax({
  			url : "${pageContext.request.contextPath }/admin/addCategory",
			type : "post",
			data : JSON.stringify(c) ,
			contentType : "application/json;charset=UTF-8", //发送data格式是json
			dataType : "json", //回调是json格式
			success : function(data) {
				//url待补充
				alert("添加"+data.c_name+"成功");
				window.location.href = "${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/addcategory.jsp")) + "/frame/blank.jsp";
			}
  		});
  	});
	$(function() {
		$("#addform").validate({
			rules : {
				c_name : {
					required : true,
					maxlength:50
				},
				},
			messages : {
				c_name : {
					required : "不得为空！",
					maxlength:"最大50字符！"
					
				},
				}
		});
	});
  
  </script>
</html>
