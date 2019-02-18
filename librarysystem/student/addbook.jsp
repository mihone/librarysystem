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

</head>

<body>
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="text-center form-inline">
				<form  id="addform" action="${pageContext.request.contextPath }/addBook"">
					<fieldset>
						 <legend>添加书籍</legend> <label>书名</label><input id="b_name" name="b_name" type="text" /> <span class="help-block">50字以内</span> <label>作者</label><input   id="b_publisher" name="b_publisher"  type="text" /> <span class="help-block">50字以内</span> <label>简要描述</label>
						<textarea   id="b_description" name="b_description"  class="form-control" rows="4">
						</textarea> <span class="help-block">250字以内</span><br /><br /><!--  <label class="checkbox"><input type="checkbox" /> 勾选同意</label> --> <button id="addButton" type="button" class="btn btn-primary">提交</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
  </body>
  <script type="text/javascript">
  	$("#addButton").click(function(){
  		var n=$("#b_name").val();
  		var p=$("#b_publisher").val();
  		var d=$("#b_description").val();
  		var b ={
  				b_name:n,
  				b_publisher:p,
  				b_description:d
  		};
  		$.ajax({
  			url : "${pageContext.request.contextPath }/book/addBook",
			type : "post",
			data : JSON.stringify(b) ,
			contentType : "application/json;charset=UTF-8", //发送data格式是json
			dataType : "json", //回调是json格式
			success : function(data) {
				//url待补充
				alert("添加"+data.b_name+"成功，返回自定义书籍界面");
				window.location.href = "${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/student/addbook.jsp")) + "/frame/blank.jsp";
			}
  		});
  	});
	$(function() {
		$("#addform").validate({
			rules : {
				b_name : {
					required : true,
					maxlength:50
				},
				b_publisher : {
					required : true,
					maxlength:50
				},
				b_description : {
					required : true,
					maxlength:250
				}
			},
			messages : {
				b_name : {
					required : "不得为空！",
					maxlength:"最大50字符！"
					
				},
				b_publisher : {
					required : "不得为空！",
					maxlength:"最大50字符"
				},
				b_description : {
					required : "不得为空！",
					maxlength:"不能超过250字！"
				}
			}
		});
	});
  
  </script>
</html>
