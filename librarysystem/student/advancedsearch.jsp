<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/jquery-3.3.1.js"></script>
<script type="text/javascript "
	src="${pageContext.request.contextPath }/plugins/bootstrap.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="text-center form-inline">
					<form action="${pageContext.request.contextPath }/book/query"
						method="post">
						<fieldset>
							<legend>高级搜索</legend>
							<label>书名</label><input id="b_name" name="b_name"  type="text"  value="${param.b_name}"/><br />
							<br /> <label>作者</label><input id="b_publisher"
								name="b_publisher" type="text"  value="${param.b_publisher }"/><br /> <br />
							<div class="form-group">
								<label>分类</label> <select  id="c_id" name="c_id"  class="selectpicker show-tick" >
									<option id="selected0" value="">请选择</option>
									<option  id="selected1"  value="1" >java</option>
									<option  id="selected2"  value="2">python</option>
									<option  id="selected3"  value="3">javascript</option>
									<option  id="selected4"  value="4">数据结构与算法</option>
									<option  id="selected5"  value="5">网络编程</option>
								</select>
							</div>
							<br /> <label>简要描述</label>
							<textarea id="b_description" name="b_description"
								class="form-control" rows="4"><c:if test="${param.b_description ne null && param.b_description ne ''}">${param.b_description }</c:if></textarea>
							<br /> <br />
							<button class="btn btn-info" type="submit">提交</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	switch(${param.c_id})
	{
	case 1:
		$("#selected1").attr("selected","selected");
		break;
	case 2:
		$("#selected2").attr("selected","selected");
		break;
	case 3:
		$("#selected3").attr("selected","selected");
		break;
	case 4:
		$("#selected4").attr("selected","selected");
		break;
	case 5:
		$("#selected5").attr("selected","selected");
		break;	
	default:
		$("#selected0").attr("selected","selected");
	}
	
});

</script>

</body>



</html>
