<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../common/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${menu_name }- ${title }</title>
</head>
<link href="${ctx }/static/plugins/chosen_v1.6.2/chosen.css"
	rel="stylesheet" />
<body <%@ include file="../common/skin.jsp" %>>
	<%@ include file="../common/head.jsp"%>
	<%@ include file="../common/menu.jsp"%>
	<div class="J_content">
		<div class="mt20 plr20">
			<form action="${ctx }/shopbilltrade/list" id="queryForm" method="post">
				<div class="J_toolsBar clearfix">
					<div class="t_label">操作类型</div>
					<div class="t_text ml10">
						<select name="tradeStatus" >
							<option value=0>请选择</option>
							<option value=1  <c:if test="${1 eq queryDTO.tradeStatus }">selected</c:if> >提现</option>
							<option value=2 <c:if test="${2 eq queryDTO.tradeStatus }">selected</c:if> >转让</option>
							<option value=3 <c:if test="${2 eq queryDTO.tradeStatus }">selected</c:if> >捐赠</option>
						</select>
					</div>
					<div class="t_label">商品状态</div>
					<div class="t_text ml10">
						<select name="type" >
							<option value=0>请选择</option>
							<option value=1  <c:if test="${1 eq queryDTO.type }">selected</c:if> >待审核</option>
							<option value=2 <c:if test="${2 eq queryDTO.type }">selected</c:if> >已完成</option>
						</select>
					</div>
					<div class="t_button mgl30">
						<a class="abtn red" href="javascript:myQuery();"> <i
							class="icon"></i>查询
						</a>
					</div>
					<div class="t_button ml10">
						<a class="abtn blue" href="javascript:myEdit();"> <i
							class="icon"></i>新增
						</a>
					</div>
					<!-- <div class="t_button ml10">
	               		<a class="abtn maxblue" href="javascript:myExport();">
	               			<i class="icon"></i>导出
	               		</a>
	               	</div> -->
					<div class="t_label ml10">
						记录数：<label style="color: red;" id="total">${page.totalCount }</label>
					</div>
				</div>

				<div class="J_table mt20">
					<div class="t_table">
						<table>
							<thead>
								<tr>
									<td><span>用户id</span></td>
									<td><span>操作类型</span></td>
									<td><span>受让人手机号</span></td>
									<td><span>数量</span></td>
									<td><span>交易状态</span></td>
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
													<div class="t_text tc">${u.userId }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${1 eq u.type}">
		                                     			提现
		                                     		</c:when>
															<c:when test="${2 eq u.type}">
		                                     			转让
		                                     		</c:when>
															<c:when test="${3 eq u.type}">
		                                     			捐赠
		                                     		</c:when>
															<c:otherwise>
		                                     			转让
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">${u.tradePhone }</div>
												</td>
												<td>
													<div class="t_text tc">${u.count }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${1 eq u.tradeStatus}">
		                                     			待审核
		                                     		</c:when>
															<c:otherwise>
		                                     			已完成
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
				                                         	<c:when test="${u.tradeStatus eq '1' }">
				                                         		<a href="javascript:updStatus('${u.id }', '2');"><i class="icon"></i>审核通过</a>
				                                         	</c:when>
				                                         	<c:otherwise>
				                                         	</c:otherwise>
				                                         </c:choose>
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
			var title = '添加会员';
			if (!id) {
				id = '';
			} else {
				title = '修改会员';
			}
			$.post('${ctx}/shopbilltrade/edit?id=' + id, {}, function(str) {

				layer.close(loadIdx);
				perContent =layer.open({
					title : title,
					type : 1,
					area : [ '800px', '500px' ],
					content : str,
					btn : [ '确定', '取消' ],
					yes : function(index, layero) {
						$('#editForm').submit();
					},
					btn2 : function(index, layero) {
						layer.close(index);
					}
				});
				//layer.full(perContent);
			});
		}

		function mySubmit() {
			$('#editForm').submit();
		}

		function myQuery() {
			$("#queryForm").attr("action","${ctx}/shopbilltrade/list");
			$('#queryForm').submit();
		}
		
		function updStatus(id, status){
			var content = '确认要通过数据吗？';
			/* if(status == '1'){
				content = '确认要通过数据吗？';
			}else{
				content = '确认要失效数据吗？';
			} */
			
			layer.confirm(content, function(index){
				layer.close(index);
				var loadIdx = layer.load();
				$.ajax({
					url : '${ctx}/shopbilltrade/upd/status',
					type : 'post',
					data : {
						'id' : id,
						'status' : status
					},
					traditional : true,
					success : function(result){
						layer.close(loadIdx);
						if(result.success){
							layer.alert('操作成功', function(){
								window.location.reload();
							});
						}else{
							layer.alert('操作失败');
						}
					}
				});
			});
		}
		
		function myExport(){
			$("#queryForm").attr("action","${ctx}/shopbilltrade/export");
			$('#queryForm').submit();
		}
	</script>
</body>
</html>