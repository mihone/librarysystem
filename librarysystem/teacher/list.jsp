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

<title>图书馆后台管理-${sessionScope.teacher.t_name}</title>

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

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"51333",secure:"51338"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-25" data-genuitec-path="/librarysystem/WebRoot/teacher/list.jsp">
	<div class="container-fluid" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-25" data-genuitec-path="/librarysystem/WebRoot/teacher/list.jsp">
		<div class="row-fluid">
			<div class="span12">

				<ul class="nav nav-tabs ">
					<li class="active"><a
						href="${pageContext.request.contextPath}/admin/listAll">全部图书</a></li>
					<c:forEach items="${category }" var="c">
						<li><a href="${pageContext.request.contextPath}/admin/listAll?c_id=${c.c_id }">${c.c_name }</a></li>
					</c:forEach>
				</ul>
				<table class="table table-hover" contenteditable="false">
					<thead>
						<tr style="background-color:lightblue">
							<th><span style="font-weight: 400;">&nbsp;书名&nbsp;</span></th>
							<th><span style="font-weight: 400;">作者</span></th>
							<th><span style="font-weight: 400;">分类&nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp;</span></th>
							<th><span style="font-weight: 400;">借书人</span></th>
							<th><span style="font-weight: 400;">描述</span></th>
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
								<td style="display:none;"><p class="bid${status.index }">${book.b_id }</p></td>
								<td><span class="nam${status.index }">${book.b_name }</span></td>
								<td class="pub${status.index }">${book.b_publisher }</td>
								<td>${book.category.c_name }</td>
								<td><c:if test=" ${book.s_id  ne null}"></c:if> ${book.s_id }</td>
								<td style="display:none;"><p class="des${status.index }">${book.b_description }</p></td>
								<td>
									<button name="${status.index }" type="button"
										class="seeDescription btn btn-small btn-info"
										data-toggle="modal" data-target=".myModal${status.index }">查看描述</button>
									<div class="modal fade myModal${status.index }">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span><span
															class="sr-only">关闭</span>
													</button>
													<h4 class="child_b_name${status.index } modal-title"></h4>
												</div>
												<div class="modal-body">

													<p class="child_b_description${status.index }"></p>
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
								<td><%-- <span>${book.category.c_id }</span> --%>
											<button type="button" name="${status.index }"
												cid="${book.category.c_id }"
												class="alterBookButton btn btn-small btn-info"
												data-toggle="modal" data-target=".alterBook${status.index }">修改书籍</button>
											<div class="modal fade alterBook${status.index }">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">&times;</span><span
																	class="sr-only">关闭</span>
															</button>
															<h4 class="modal-title alterBookTitle${status.index }"></h4>
														</div>
														<div class="modal-body">
															<!-- &hellip; ->...  -->
															<div class="container-fluid">
																<div class="row-fluid">
																	<div class="span12">
																		<div class="text-center form-inline">
																			<form class="alterform${status.index }" method="post">
																				<fieldset>
																					<legend>修改书籍</legend>
																					<label>书名</label><input
																						class="b_name${status.index }" name="b_name"
																						type="text" /> <span class="help-block">50字以内</span>
																					<label>作者</label><input
																						class="b_publisher${status.index }"
																						name="b_publisher" type="text" /> <span
																						class="help-block">50字以内</span> <label>简要描述</label>
																					<textarea class="b_description${status.index }"
																						name="b_description" class="form-control" rows="4"></textarea>
																					<span class="help-block">250字以内</span><br /> <br />
																					<!--  <label class="checkbox"><input type="checkbox" /> 勾选同意</label> -->
																				</fieldset>
																			</form>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-info alterBookInfo${status.index }"
																data-dismiss="modal">确认修改</button>
															<button type="button" class="btn btn-default"
																data-dismiss="modal">关闭</button>
															<!-- <button type="button" class="btn btn-primary">Save
													 changes</button> -->
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											<!-- /.modal -->
											<button name="${book.b_id }" cid="${book.category.c_id }"
												class="btn btn-small btn-info deleteBook">删除书籍</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
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
					<li class="<c:if test="${page.currentPage eq 1 }">disabled</c:if>"><a
						class="btn btn-default " role="button"
						<c:if test="${page.currentPage ne 1 }">href="${pageContext.request.contextPath }/admin/listAll?currentPage=1&c_id=${cid}"</c:if>>首页</a></li>
					<li
						<c:if test="${page.currentPage eq 1 }">style="display:none"</c:if>><a
						class="btn btn-default " role="button"
						href="${pageContext.request.contextPath }/admin/listAll?currentPage=${page.currentPage -1 }&c_id=${cid}">上一页</a></li>

					<c:forEach begin="${startpage }" end="${endpage }" step="1" var="i">
						<li
							<c:if test="${page.currentPage eq i }"> class="disabled"</c:if>><a
							class="btn btn-default " role="button"
							href="${pageContext.request.contextPath }/admin/listAll?currentPage=${i}&c_id=${cid}">${i}</a></li>
					</c:forEach>

					<li
						<c:if test="${page.currentPage eq page.totalPages }">style="display:none"</c:if>><a
						class="btn btn-default " role="button"
						href="${pageContext.request.contextPath }/admin/listAll?currentPage=${page.currentPage +1 }&c_id=${cid}">下一页</a></li>
					<li
						<c:if test="${page.currentPage eq page.totalPages }">class="disabled"</c:if>>
						<a class="btn btn-default " role="button"
						<c:if test="${page.currentPage ne page.totalPages }">href="${pageContext.request.contextPath }/admin/listAll?currentPage=${page.totalPages}&c_id=${cid}"</c:if>>尾页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		$(".deleteBook").click(function() {
			var cid = $(this).attr("cid");
			var j = {
				b_id : $(this).attr("name")
			};
			$.ajax({
				url : "${pageContext.request.contextPath }/admin/deleteBook",
				type : "post",
				data : JSON.stringify(j),
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					//alert("adadasdadsadsadada");
					alert("删除书籍成功");
					window.location.href = "${pageContext.request.contextPath}/admin/listAll?c_id=" + cid + "&currentPage=${page.currentPage}";
				}
			});
		});
	
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
		$(".alterBookButton").click(function() {
			var cid = $(this).attr("cid");
			var index = $(this).attr("name");
			var d = $(".des" + index).text();
			var n = $(".nam" + index).text();
			var p = $(".pub" + index).text();
			var i = $(".bid" + index).text();
			/* 				$(".b_name"+index).value(n);
					$(".b_publisher"+index).value(p);
					$(".b_description"+index).text(d);
					$(".alterBookInfo"+index).attr("name", i); */
			$(".alterBook" + index).on("show.bs.modal", function(event) {
				var modal = $(this);
				modal.find(".alterBookTitle" + index).text(n);
				modal.find(".b_name" + index).val(n);
				modal.find(".b_publisher" + index).val(p);
				modal.find(".b_description" + index).text(d);
				modal.find(".alterBookInfo" + index).attr("name", i);
	
			});
			$(".alterBookInfo" + index).click(function() {
				var formdata = $(".alterform" + index).serializeArray(); //序列化表单，为一个数组。
				var j = {
					b_id : $(".alterBookInfo" + index).attr("name"),
					b_name : formdata[0].value,
					b_publisher : formdata[1].value,
					b_description : formdata[2].value
				};
				$.ajax({
					url : "${pageContext.request.contextPath }/admin/alterBookInfo",
					type : "post",
					data : JSON.stringify(j),
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(data) {
						alert("修改成功");
						//var sss="${pageContext.request.requestURL}";
						//alert(sss);
						window.location.href = "${pageContext.request.contextPath}/admin/listAll?c_id=" + cid + "&currentPage=${page.currentPage}";
					}
				});
			});
		});
	</script>
</body>
</html>
