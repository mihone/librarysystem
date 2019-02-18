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

<title>图书馆藏书-${sessionScope.user.s_name}</title>

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
	src="${pageContext.request.contextPath }/plugins/bootstrap-paginator.js"></script>

</head>

<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list">全部图书</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=1">java</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=2">python</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=4">数据结构与算法</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=3">javascript</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=5">网络编程</a></li>
					<!-- 					<li class="dropdown pull-right"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">下拉<strong
							class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#">操作</a></li>
							<li><a href="#">设置栏目</a></li>
							<li><a href="#">更多设置</a></li>
							<li class="divider"></li>
							<li><a href="#">分割线</a></li>
						</ul></li> -->
				</ul>
				<table class="table table-hover" contenteditable="false">
					<thead>
						<tr style="background-color:lightblue">
							<th><span style="font-weight: 400;">&nbsp;书名&nbsp;</span></th>
							<th><span style="font-weight: 400;">作者</span></th>
							<th><span style="font-weight: 400;">分类&nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp;</span></th>
							<th><span style="font-weight: 400;">查看描述</span></th>
							<th><span style="font-weight: 400;">操作</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.listPerPage }" var="book"
							varStatus="status">
							<tr
								<c:choose>
								<c:when test="${(status.index eq 1) or (status.index+1 eq 6) }">class="success"</c:when>
								<c:when test="${(status.index eq 2) or (status.index+1 eq 7) }">class="error"</c:when>
								<c:when test="${(status.index eq 3) or (status.index+1 eq 8) }">class="warning"</c:when>
								<c:when test="${(status.index eq 4) or (status.index+1 eq 9) }">class="info"</c:when>
								<c:otherwise></c:otherwise>
								</c:choose>>
								<td><span class="nam${status.index }">${book.b_name }</span></td>
								<td>${book.b_publisher }</td>
								<td>${book.category.c_name }</td>
								<td style="display:none;"><p class="des${status.index }">${book.b_description }</p></td>
								<td>
									<button type="button" class="btn btn-small btn-info seeDescription" name="${status.index }"
										data-toggle="modal" data-target=".myModal${status.index }">查看描述</button>
									<div class="modal fade myModal${status.index }">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span><span
															class="sr-only">关闭</span>
													</button>
													<h4 class="modal-title child_b_name${status.index }"></h4>
												</div>
												<div class="modal-body">
													<p class="child_b_description${status.index }">&hellip;</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">关闭</button>
													<!-- <button type="button" class="btn btn-primary">Save
													 changes</button> -->
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div> <!-- /.modal -->
								</td>
								<td><button name="${book.b_id }" cid="${book.category.c_id }"
										class="btn btn-small btn-info borrowBook">借书点击这里</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<c:choose>
					<c:when test="${page.totalPages le 5 }">
						<c:set var="startpage" value="1"></c:set>
						<c:set var="endpage" value="${page.totalPages}"></c:set>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${(page.currentPage -2) le  1 }">
								<c:set var="startpage" value="1"></c:set>
								<c:set var="endpage" value="5"></c:set>
							</c:when>
							<c:when test="${(page.currentPage +4) ge page.totalPages}">
								<c:set var="startpage" value="${page.totalPages - 4 }"></c:set>
								<c:set var="endpage" value="${page.totalPages}"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="startpage" value="${page.currentPage - 2 }"></c:set>
								<c:set var="endpage" value="${page.currentPage +2}"></c:set>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>


				<div class="text-center">
					<ul class="pagination pagination-lg  ">
						<li <c:if test="${page.currentPage eq 1 }">class="disabled"</c:if>><a
							<c:if test="${page.currentPage ne 1 }">href="${pageContext.request.contextPath }/book/list?currentPage=1&c_id=${cid}"</c:if>>首页</a></li>
						<li
							<c:if test="${page.currentPage eq 1 }">style="display:none"</c:if>><a
							href="${pageContext.request.contextPath }/book/list?currentPage=${page.currentPage -1 }&c_id=${cid}">上一页</a></li>

						<c:forEach begin="${startpage }" end="${endpage }" step="1"
							var="i">
							<li
								<c:if test="${page.currentPage eq i }"> class="disabled"</c:if>><a
								href="${pageContext.request.contextPath }/book/list?currentPage=${i}&c_id=${cid}">${i}</a></li>
						</c:forEach>

						<li
							<c:if test="${page.currentPage eq page.totalPages }">style="display:none"</c:if>><a
							href="${pageContext.request.contextPath }/book/list?currentPage=${page.currentPage +1 }&c_id=${cid}">下一页</a></li>
						<li
							<c:if test="${page.currentPage eq page.totalPages }">class="disabled"</c:if>>
							<a
							<c:if test="${page.currentPage ne page.totalPages }">href="${pageContext.request.contextPath }/book/list?currentPage=${page.totalPages}&c_id=${cid}"</c:if>>尾页</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		$(".seeDescription").click(function() {
			var index = $(this).attr("name");
			var d = $(".des" + index).text();
			var n = $(".nam" + index).text();
			$(".myModal" + index).on("show.bs.modal", function(event) {
				var modal = $(this);
				modal.find(".child_b_name" + index).text(n);
				modal.find(".child_b_description" + index).text(d);
			});
		});
		$(".borrowBook").click(function() {
			var cid= $(this).attr("cid");
			var id=$(this).attr("name");
			var j = {
				b_id : id
			};
			$.ajax({
				url : "${pageContext.request.contextPath }/book/borrowBook",
				type : "post",
				data : JSON.stringify(j),
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					alert("成功借书" );
					window.location.href = "${pageContext.request.contextPath}/book/list?c_id="+cid+"&currentPage=${page.currentPage}";
				}
			});
		});
	</script>
</body>
</html>
