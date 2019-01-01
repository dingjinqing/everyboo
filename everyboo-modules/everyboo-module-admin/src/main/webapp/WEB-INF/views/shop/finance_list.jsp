<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../common/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${menu_name }-${title }</title>
</head>
<link href="${ctx }/static/plugins/chosen_v1.6.2/chosen.css"
	rel="stylesheet" />
<body <%@ include file="../common/skin.jsp" %>>
	<%@ include file="../common/head.jsp"%>
	<%@ include file="../common/menu.jsp"%>
	<div class="J_content">
		<div class="mt20 plr20">
			<form action="" id="queryForm" method="post">
				<input type="hidden" name="from" value="2"/><!--   财务管理与订单管理分开-->
				<div class="J_toolsBar clearfix">
					<div class="t_label">订单状态</div>
					<div class="t_text ml10">
						<select name="status" value="${queryDTO.status }">
							<option value=0>请选择</option>
							<option value=1
								<c:if test="${1 eq queryDTO.status }">selected</c:if>>待审核</option>
							<option value=2
								<c:if test="${2 eq queryDTO.status }">selected</c:if>>已确认</option>
							<option value=3
								<c:if test="${3 eq queryDTO.status }">selected</c:if>>已完成</option>
						</select>
					</div>
					<div class="t_label">订单类型</div>
					<div class="t_text ml10">
						<select name="jtype" value="${queryDTO.jtype }">
							<option value="">请选择</option>
							<option value=14
								<c:if test="${14 eq queryDTO.jtype }">selected</c:if>>提现</option>
							<option value=15
								<c:if test="${15 eq queryDTO.jtype }">selected</c:if>>充值</option>
						</select>
					</div>

					<div class="t_button mgl30">
						<a class="abtn red" href="javascript:myQuery();"> <i
							class="icon"></i>查询
						</a>
					</div>
					<!-- <div class="t_button ml10">
						<a class="abtn blue" href="javascript:myEdit();"> <i
							class="icon"></i>新增
						</a>
					</div> -->
					<div class="t_button ml10">
	               		<a class="abtn maxblue" href="javascript:myExport();">
	               			<i class="icon"></i>导出
	               		</a>
	               	</div>
					<div class="t_label ml10">
						记录数：<label style="color: red;" id="total">${page.totalCount }</label>
					</div>
				</div>

				<div class="J_table mt20">
					<div class="t_table">
						<table>
							<thead>
								<tr>
									<td><span>订单编号</span></td>
									<td><span>金额</span></td>
									<td><span>客户姓名</span></td>
									<td><span>联系方式</span></td>
									<td><span>卡主姓名</span></td>
									<td><span>银行卡号</span></td>
									<td><span>类型</span></td>
									<td><span>订单状态</span></td>
									<td><span>创建时间</span></td>
									<td><span>操作</span></td>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${page.list != null && page.totalCount > 0 }">
										<c:forEach items="${page.list }" var="u">
											<tr>
												<td>
													<div class="t_text tc">${u.tradeNo }</div>
												</td>
												<td>
													<div class="t_text tc">${u.price }</div>
												</td>
												<td>
													<div class="t_text tc">${u.account }</div>
												</td>
												<td>
													<div class="t_text tc">${u.phone }</div>
												</td>
												<td>
													<div class="t_text tc">${u.bankOwer }</div>
												</td>
												<td>
													<div class="t_text tc">${u.bankCard }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${14 eq u.jtype}">
		                                     			提现
		                                     		</c:when>
															<c:when test="${15 eq u.jtype}">
		                                     			充值
		                                     		</c:when>
															<c:otherwise>
		                                     			未知类型
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${1 eq u.status}">
				                                     			待审核
				                                     		</c:when>
															<c:when test="${2 eq u.status}">
				                                     			已确认
				                                     		</c:when>
															<c:when test="${3 eq u.status}">
				                                     			已完成
				                                     		</c:when>
															<c:otherwise>
				                                     			未知状态
				                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<fmt:formatDate value="${u.createDate }"
															pattern="yyyy-MM-dd HH:mm:ss" />
													</div>
												</td>

												<td>
													<div class="t_link">
														<a href="javascript:myEdit('${u.id }');"><i
															class="icon"></i>编辑</a>
														<c:choose>
															<c:when test="${u.status eq 1 }">
															<!-- 14提现余额15充值   提现需要用户确认，充值直接后台结束流程-->
																<c:if test="${14 eq u.jtype }">
																	<a href="javascript:updStatus('${u.id }', '3');"><i
																	class="icon"></i>审核通过</a>
																</c:if>
																<c:if test="${15 eq u.jtype }">
																<a href="javascript:updStatus('${u.id }', '3');"><i
																	class="icon"></i>审核通过</a>
																</c:if>
															</c:when>
															<%-- <c:when test="${u.status eq 2 }">
																<a href="javascript:updStatus('${u.id }', '3');"><i
																	class="icon"></i>确认收货</a>
															</c:when> --%>
															<c:otherwise>
																<!-- <a href="#"><i class="icon"></i>已完成</a> -->
															</c:otherwise>
														</c:choose>
														<a href="javascript:deleteinfo('${u.id }');"><i
															class="icon"></i>删除</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="8">
												<div class="J_null mt40">
													<img src="${ctx }/static/images/null.png">
													<p>暂无相关数据</p>
												</div>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<%@ include file="../common/pager.jsp"%>
				</div>
			</form>
		</div>
	</div>
	<script src="${ctx }/static/plugins/chosen_v1.6.2/chosen.jquery.js"></script>
	<script type="text/javascript">
		function myEdit(id) {
			var loadIdx = layer.load();
			var title = '财务管理';
			if (!id) {
				id = '';
			} else {
				title = '财务管理';
			}
			$.post('${ctx}/shoptrade/editf?id=' + id, {}, function(str) {

				layer.close(loadIdx);
				layer.open({
					title : title,
					type : 1,
					area : [ '860px', '500px' ],
					content : str,
					btn : [ '确定', '取消' ],
					yes : function(index, layero) {
						$('#editForm').submit();
					},
					btn2 : function(index, layero) {
						layer.close(index);
					}
				});
			});
		}

		function mySubmit() {
			$('#editForm').submit();
		}

		function myQuery() {
			$("#queryForm").attr("action", "${ctx}/shoptrade/listf");
			$('#queryForm').submit();
		}

		function updStatus(id, status) {
			var content = '';
			content = '确认审核通过吗？';
			/* if (status == '1') {
			} else {
				content = '确认要确认收货吗？';
			} */

			layer.confirm(content, function(index) {
				layer.close(index);
				var loadIdx = layer.load();
				$.ajax({
					url : '${ctx}/shoptrade/upd/status',
					type : 'post',
					data : {
						'id' : id,
						'status' : status
					},
					traditional : true,
					success : function(result) {
						layer.close(loadIdx);
						if (result.success) {
							layer.alert('操作成功', function() {
								window.location.reload();
							});
						} else {
							layer.alert('操作失败');
						}
					}
				});
			});
		}
		
		function deleteinfo(id) {
			var content = '';
			content = '确认删除吗？';
			/* if (status == '1') {
			} else {
				content = '确认要确认收货吗？';
			} */

			layer.confirm(content, function(index) {
				layer.close(index);
				var loadIdx = layer.load();
				$.ajax({
					url : '${ctx}/shoptrade/delete',
					type : 'post',
					data : {
						'id' : id
					},
					traditional : true,
					success : function(result) {
						layer.close(loadIdx);
						if (result.success) {
							layer.alert('操作成功', function() {
								window.location.reload();
							});
						} else {
							layer.alert('操作失败');
						}
					}
				});
			});
		}

		function myExport() {
			$("#queryForm").attr("action", "${ctx}/shoptrade/export");
			$('#queryForm').submit();
		}
	</script>
</body>
</html>