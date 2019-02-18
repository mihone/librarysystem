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
					<form id="addform"
						action="${pageContext.request.contextPath }/addBook"">
						<fieldset>
							<legend>添加书籍</legend>
							<label>书名</label><input id="b_name" name="b_name" type="text" />
							<span class="help-block">50字以内</span> <label>作者</label><input
								id="b_publisher" name="b_publisher" type="text" /> <span
								class="help-block">50字以内</span> <br>
							<div class="form-group">
								<label>分类</label> <select id="c_id" name="c_id"
									class="selectpicker show-tick">
								<option id="selected0" value="">请选择</option>
								<!--  	<option id="selected1" value="1">java</option>
									<option id="selected2" value="2">python</option>
									<option id="selected3" value="3">javascript</option>
									<option id="selected4" value="4">数据结构与算法</option>
									<option id="selected5" value="5">网络编程</option>-->	
								</select>
							</div><br>
							<label>简要描述</label>
							<textarea id="b_description" name="b_description"
								class="form-control" rows="4">
						</textarea>
							<span class="help-block">250字以内</span><br />
							<br />
							<!--  <label class="checkbox"><input type="checkbox" /> 勾选同意</label> -->
							<button id="addButton" type="button" class="btn btn-primary">提交</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){ 
	$.ajax({
		url : "${pageContext.request.contextPath }/admin/preAddBook",
		type : "post",
		//contentType : "application/json;charset=UTF-8", //发送data格式是json
		dataType : "json", //回调是json格式
		success : function(data) {
			$("#c_id").empty();
			$("#c_id").append("<option value=\"0\">请选择</option>");
			for(var i=0;i<data.length;i++)
				$("#c_id").append("<option value=\""+(i+1)+"\">"+data[i].c_name+"</option>");
		}
	});
});

  	$("#addButton").click(function(){
  		var n=$("#b_name").val();
  		var c=$("#c_id").val();
  		var p=$("#b_publisher").val();
  		var d=$("#b_description").val();
  		var b ={
  				b_name:n,
  				b_publisher:p,
  				b_description:d,
  				c_id: c
  		};
  		$.ajax({
  			url : "${pageContext.request.contextPath }/admin/addBook",
			type : "post",
			data : JSON.stringify(b) ,
			contentType : "application/json;charset=UTF-8", //发送data格式是json
			dataType : "json", //回调是json格式
			success : function(data) {
				//url待补充
				alert("添加"+data.b_name+"成功，返回图书界面");
				window.location.href = "${pageContext.request.requestURL}".substring(0, "${pageContext.request.requestURL}".indexOf("/teacher/addbook.jsp")) + "/admin/listAll";
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
