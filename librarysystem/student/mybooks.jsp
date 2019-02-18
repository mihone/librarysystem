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

<title>我的书籍-${sessionScope.user.s_name}</title>

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
				<ul class="nav nav-pills ">
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?s_id=${sessionScope.user.s_id }">全部图书</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=1&s_id=${sessionScope.user.s_id }">java</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=2&s_id=${sessionScope.user.s_id }">python</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=4&s_id=${sessionScope.user.s_id }">数据结构与算法</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=3&s_id=${sessionScope.user.s_id }">javascript</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=5&s_id=${sessionScope.user.s_id }">网络编程</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/book/list?c_id=6&s_id=${sessionScope.user.s_id }">自定义书籍</a></li>


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
								<td style="display:none;"><p class="des${status.index }">${book.b_description }</p></td>
								<td>
									<button name="${status.index }" type="button"
										class="seeDescription btn btn-small btn-info" data-toggle="modal"
										data-target=".myModal${status.index }">查看描述</button>
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
								<td><c:choose>
										<c:when test="${book.category.c_id eq 6 }">
											<%-- <span>${book.category.c_id }</span> --%>
											<button type="button" name="${status.index }" cid="${book.category.c_id }"
												class="alterBookButton btn btn-small btn-info" data-toggle="modal"
												data-target=".alterBook${status.index }">修改书籍</button>
											<div class="modal fade alterBook${status.index }" >
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
																					<label>书名</label><input class="b_name${status.index }"
																						name="b_name" type="text"  /> <span
																						class="help-block">50字以内</span> <label>作者</label><input
																						class="b_publisher${status.index }"
																						name="b_publisher" type="text"  /> <span
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
															<button  
																type="button" class="btn btn-info alterBookInfo${status.index }" data-dismiss="modal">确认修改</button>
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
												class="btn btn-small btn-info deleteBook" >删除书籍</button>
										</c:when>
										<c:otherwise>
											<%-- <span>${book.category.c_id }</span> --%>
											<button  name="${book.b_id }" cid="${book.category.c_id }"
												class="btn btn-small btn-info returnBook">还书点击这里</button>
										</c:otherwise>
									</c:choose></td>
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
							<c:if test="${page.currentPage ne 1 }">href="${pageContext.request.contextPath }/book/list?currentPage=1&c_id=${cid}&s_id=${sessionScope.user.s_id }"</c:if>>首页</a></li>
						<li
							<c:if test="${page.currentPage eq 1 }">style="display:none"</c:if>><a
							href="${pageContext.request.contextPath }/book/list?currentPage=${page.currentPage -1 }&c_id=${cid}&s_id=${sessionScope.user.s_id }">上一页</a></li>

						<c:forEach begin="${startpage }" end="${endpage }" step="1"
							var="i">
							<li
								<c:if test="${page.currentPage eq i }"> class="disabled"</c:if>><a
								href="${pageContext.request.contextPath }/book/list?currentPage=${i}&c_id=${cid}&s_id=${sessionScope.user.s_id }">${i}</a></li>
						</c:forEach>

						<li
							<c:if test="${page.currentPage eq page.totalPages }">style="display:none"</c:if>><a
							href="${pageContext.request.contextPath }/book/list?currentPage=${page.currentPage +1 }&c_id=${cid}&s_id=${sessionScope.user.s_id }">下一页</a></li>
						<li
							<c:if test="${page.currentPage eq page.totalPages }">class="disabled"</c:if>>
							<a
							<c:if test="${page.currentPage ne page.totalPages }">href="${pageContext.request.contextPath }/book/list?currentPage=${page.totalPages}&c_id=${cid}&s_id=${sessionScope.user.s_id }"</c:if>>尾页</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
			
			$(".returnBook").click(function() {
				var cid = $(this).attr("cid");
				var j = {
					b_id : $(this ).attr("name")
				};
				$.ajax({
					url : "${pageContext.request.contextPath }/book/returnBook",
					type : "post",
					data : JSON.stringify(j),
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(data) {
						alert("成功还书" );
						window.location.href = "${pageContext.request.contextPath}/book/list?c_id="+cid+"&s_id=${sessionScope.user.s_id }&currentPage=${page.currentPage}";
					}
				});
			});

			$(".deleteBook" ).click(function() {
				var cid = $(this).attr("cid");
				var j = {
					b_id : $(this ).attr("name")
				};
				$.ajax({
					url : "${pageContext.request.contextPath }/book/deleteBook",
					type : "post",
					data : JSON.stringify(j),
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(data) {
						//alert("adadasdadsadsadada");
						alert("删除自定义书籍成功");
						window.location.href = "${pageContext.request.contextPath}/book/list?c_id="+cid+"&s_id=${sessionScope.user.s_id }&currentPage=${page.currentPage}";
					}
				});
			});
	
			$(".seeDescription").click(function() {
				var index = $(this).attr("name");
				var d = $(".des"+index).text();
				var n = $(".nam"+index).text();
				$(".myModal"+index).on("show.bs.modal",function(event){
					var modal = $(this); 
					modal.find(".child_b_name"+index).text(n);
					modal.find(".child_b_description"+index).text(d);
					
				});
				//var p = $("pub").text();
/* 				var a = document.getElementsByClassName ("child_b_name"+index)
				a[0].innerHTML=n;
				var b = document.getElementsByClassName ("child_b_description"+index)
				b[0].innerHTML=d; */
/* 				$(".child_b_name"+index).text(n);
				$(".child_b_description"+index).text(d); */
			});
			$(".alterBookButton").click(function() {
				var cid = $(this).attr("cid");
				var index = $(this).attr("name");
				var d = $(".des"+index).text();
				var n = $(".nam"+index).text();
				var p = $(".pub"+index).text();
				var i = $(".bid"+index).text();
/* 				$(".b_name"+index).value(n);
				$(".b_publisher"+index).value(p);
				$(".b_description"+index).text(d);
				$(".alterBookInfo"+index).attr("name", i); */
				$(".alterBook"+index).on("show.bs.modal",function(event){
					var modal = $(this); 
					modal.find(".alterBookTitle"+index).text(n);
					modal.find(".b_name"+index).val(n);
					modal.find(".b_publisher"+index).val(p);
					modal.find(".b_description"+index).text(d);
					modal.find(".alterBookInfo"+index).attr("name", i);
					
				});
				$(".alterBookInfo"+index ).click(function() {
					var formdata = $(".alterform"+index ).serializeArray(); //序列化表单，为一个数组。
					var j = {
						b_id : $(".alterBookInfo"+index ).attr("name"),
						b_name : formdata[0].value,
						b_publisher : formdata[1].value,
						b_description : formdata[2].value
					};
					$.ajax({
						url : "${pageContext.request.contextPath }/book/alterBookInfo",
						type : "post",
						data : JSON.stringify(j),
						dataType : "json",
						contentType : "application/json;charset=utf-8",
						success : function(data) {
							alert("修改成功");
							//var sss="${pageContext.request.requestURL}";
							//alert(sss);
							window.location.href = "${pageContext.request.contextPath}/book/list?c_id="+cid+"&s_id=${sessionScope.user.s_id }&currentPage=${page.currentPage}";
						}
					});
				});
			});
	</script>


</body>
</html>
