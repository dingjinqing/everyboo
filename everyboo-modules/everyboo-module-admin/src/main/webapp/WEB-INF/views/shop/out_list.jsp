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
				<input type="hidden" name="from" value="3"/>
				<div class="J_toolsBar clearfix">
					<div class="t_label">订单状态</div>
					<div class="t_text ml10">
						<select name="status" value="${queryDTO.status }">
							<option value=0>请选择</option>
							<option value=1
								<c:if test="${1 eq queryDTO.status }">selected</c:if>>待审核</option>
							<option value=2
								<c:if test="${2 eq queryDTO.status }">selected</c:if>>审核通过</option>
							<option value=3
								<c:if test="${3 eq queryDTO.status }">selected</c:if>>已完成</option>
						</select>
					</div>
					<div class="t_label">订单类型</div>
					<div class="t_text ml10">
						<select name="jtype" value="${queryDTO.jtype }">
							<option value="">请选择</option>
							<%-- <option value=1
								<c:if test="${1 eq queryDTO.jtype }">selected</c:if>>购买会员大礼包</option>
							<option value=2
								<c:if test="${2 eq queryDTO.jtype }">selected</c:if>>复购产品</option> --%>
							<option value=3
								<c:if test="${3 eq queryDTO.jtype }">selected</c:if>>直推奖励</option>
							<option value=4
								<c:if test="${4 eq queryDTO.jtype }">selected</c:if>>间推奖励</option>
							<option value=5
								<c:if test="${5 eq queryDTO.jtype }">selected</c:if>>管理奖</option>
							<option value=6
								<c:if test="${6 eq queryDTO.jtype }">selected</c:if>>股份收益</option>
							<option value=7
								<c:if test="${7 eq queryDTO.jtype }">selected</c:if>>平台分红</option>
							<option value=8
								<c:if test="${8 eq queryDTO.jtype }">selected</c:if>>捐赠</option>
							<option value=9
								<c:if test="${9 eq queryDTO.jtype }">selected</c:if>>购买返点</option>
							<option value=10
								<c:if test="${10 eq queryDTO.jtype }">selected</c:if>>直推购买返点</option>
							<option value=11
								<c:if test="${11 eq queryDTO.jtype }">selected</c:if>>间推购买返点</option>
							<option value=12
								<c:if test="${12 eq queryDTO.jtype }">selected</c:if>>提现健康值</option>
							<%-- <option value=13
								<c:if test="${13 eq queryDTO.jtype }">selected</c:if>>项目合作</option> --%>
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
									<td><span>价格</span></td>
									<td><span>客户姓名</span></td>
									<td><span>联系方式</span></td>
									<td><span>交易类型</span></td>
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
													<div class="t_text tc">
														<c:choose>
															<%-- <c:when test="${1 eq u.jtype}">
		                                     			购买会员大礼包
		                                     		</c:when>
															<c:when test="${2 eq u.jtype}">
		                                     			复购产品
		                                     		</c:when> --%>
															<c:when test="${3 eq u.jtype}">
		                                     			直推奖励
		                                     		</c:when>
															<c:when test="${4 eq u.jtype}">
		                                     			间推奖励
		                                     		</c:when>
															<c:when test="${5 eq u.jtype}">
		                                     			管理奖
		                                     		</c:when>
															<c:when test="${6 eq u.jtype}">
		                                     			股份收益
		                                     		</c:when>
															<c:when test="${7 eq u.jtype}">
		                                     			平台分红
		                                     		</c:when>
															<c:when test="${8 eq u.jtype}">
		                                     			捐赠余额
		                                     		</c:when>
															<c:when test="${9 eq u.jtype}">
		                                     			购买返点
		                                     		</c:when>
															<c:when test="${10 eq u.jtype}">
		                                     			直推购买返点
		                                     		</c:when>
															<c:when test="${11 eq u.jtype}">
		                                     			间推购买返点
		                                     		</c:when>
															<c:when test="${12 eq u.jtype}">
		                                     			提现健康值
		                                     		</c:when>
															<%-- <c:when test="${13 eq u.jtype}">
		                                     			项目合作
		                                     		</c:when> --%>
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
				                                     			审核通过
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
														<%-- <c:choose>
															<c:when test="${u.status eq 1 }">
																<a href="javascript:updStatus('${u.id }', '2');"><i
																	class="icon"></i>发货</a>
															</c:when>
															<c:when test="${u.status eq 2 }">
																<a href="javascript:updStatus('${u.id }', '3');"><i
																	class="icon"></i>确认收货</a>
															</c:when>
															<c:otherwise>
																<!-- <a href="#"><i class="icon"></i>已完成</a> -->
															</c:otherwise>
														</c:choose> --%>
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
			if(!id){
				id = '';
			}
			var loadIdx = layer.load();
			var title = '修改支出';
			$.post('${ctx}/shoptrade/edito?id=' + id, {}, function(str) {

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
			$("#queryForm").attr("action", "${ctx}/shoptrade/listo");
			$('#queryForm').submit();
		}

		function updStatus(id, status) {
			var content = '';
			content = '确认要发货吗？';
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

		function myExport() {
			$("#queryForm").attr("action", "${ctx}/shoptrade/export");
			$('#queryForm').submit();
		}
	</script>
</body>
</html>