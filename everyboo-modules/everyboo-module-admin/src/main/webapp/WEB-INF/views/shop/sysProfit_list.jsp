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
			<form action="${ctx }/sysProfit/list" id="queryForm" method="post">
				<div class="J_toolsBar clearfix">
					<div class="t_label">类型</div>
					<div class="t_text ml10">
						<select name="type" 
							value="${userQueryDTO.type }">
							<option value=0>请选择</option>
							<option value=1  <c:if test="${1 eq queryDTO.type }">selected</c:if> >日利润</option>
							<option value=2 <c:if test="${2 eq queryDTO.type }">selected</c:if> >月利润</option>
						</select>
					</div>
					<div class="t_label">开始时间</div>
					<div class="t_text ml10">
						<input placeholder="请输入开始时间" type="text" name="sdateStart" value="${queryDTO.sdateStart }" />
					</div>
					<div class="t_label">结束时间</div>
					<div class="t_text ml10">
						<input placeholder="请输入结束时间" type="text" name="sdateEnd" value="${queryDTO.sdateEnd }" />
					</div>
					<div class="t_button mgl30">
						<a class="abtn red" href="javascript:myQuery();"> <i
							class="icon"></i>查询
						</a>
					</div>
					<%-- <div class="t_button ml10">
						<a class="abtn blue" href="javascript:myEdit();"> <i
							class="icon"></i>新增
						</a>
					</div> --%>
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
									<!-- <td><span>id</span></td> -->
									<td><span>类型</span></td>
									<td><span>利润</span></td>
									<td><span>利润对应时间</span></td>
									<td><span>创建时间</span></td>
									<td><span>操作</span></td>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${page.list != null && page.totalCount > 0 }">
										<c:forEach items="${page.list }" var="u">
											<tr>
												<%-- <td>
													<div class="t_text tc">${u.id }</div>
												</td> --%>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${1 eq u.type}">
		                                     			日利润
		                                     		</c:when>
															<c:otherwise>
		                                     			月利润
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">${u.profit }</div>
												</td>
												<td>
													<div class="t_text tc">${u.dateString }</div>
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
		                                         		<%-- <a href="javascript:updStatus('${u.id }');"><i class="icon"></i>删除</a> --%>
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
			var title = '添加参数';
			if (!id) {
				id = '';
			} else {
				title = '修改参数';
			}
			$.post('${ctx}/sysProfit/edit?id=' + id, {}, function(str) {

				layer.close(loadIdx);
				perContent =layer.open({
					title : title,
					type : 1,
					area : [ '500px', '400px' ],
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
			$("#queryForm").attr("action","${ctx}/sysProfit/list");
			$('#queryForm').submit();
		}
		
		function updStatus(id){
			var content = '确认要删除数据吗？';
			
			layer.confirm(content, function(index){
				layer.close(index);
				var loadIdx = layer.load();
				$.ajax({
					url : '${ctx}/sysProfit/doDelete',
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
			$("#queryForm").attr("action","${ctx}/sysProfit/export");
			$('#queryForm').submit();
		}
	</script>
</body>
</html>