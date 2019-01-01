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
			<form action="${ctx }/shopproduct/list" id="queryForm" method="post">
				<div class="J_toolsBar clearfix">
					<div class="t_label">商品名称</div>
					<div class="t_text ml10">
						<input placeholder="请输入商品名称" type="text" name="proName" id="proName"
							value="${queryDTO.proName }" />
					</div>
					<div class="t_label">商品状态</div>
					<div class="t_text ml10">
						<select name="status" >
							<option value=''>请选择</option>
							<option value='1'  <c:if test="${'1' eq queryDTO.status }">selected</c:if> >已上架</option>
							<option value='2' <c:if test="${'2' eq queryDTO.status }">selected</c:if> >已下架</option>
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
									<td><span>商品名称</span></td>
									<td><span>商品库存</span></td>
									<td><span>购买商品赠送积分</span></td>
									<td><span>购买商品最高抵扣积分</span></td>
									<td><span>商品价格1</span></td>
									<td><span>商品价格2</span></td>
									<td><span>商品价格3</span></td>
									<td><span>商品状态</span></td>
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
													<div class="t_text tc">${u.proName }</div>
												</td>
												<td>
													<div class="t_text tc">${u.proCount }</div>
												</td>
												<td>
													<div class="t_text tc">${u.incomeCredits }</div>
												</td>
												<td>
													<div class="t_text tc">${u.consumeCredits }</div>
												</td>
												<td>
													<div class="t_text tc">${u.price1 }</div>
												</td>
												<td>
													<div class="t_text tc">${u.price2 }</div>
												</td>
												<td>
													<div class="t_text tc">${u.price3 }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${'1' eq u.status}">
		                                     			上架
		                                     		</c:when>
															<c:otherwise>
		                                     			下架
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
				                                         	<c:when test="${u.status eq '1' }">
				                                         		<a href="javascript:updStatus('${u.id }', '2');"><i class="icon"></i>下架</a>
				                                         	</c:when>
				                                         	<c:otherwise>
				                                         		<a href="javascript:updStatus('${u.id }', '1');"><i class="icon"></i>上架</a>
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
	//编辑
	function myEdit(id){
		if(!id){
			id = '';
		}
    	window.location.href='${ctx}/shopproduct/edit?id='+id;
	} 
		/* function myEdit(id) {
			var loadIdx = layer.load();
			var title = '添加会员';
			if (!id) {
				id = '';
			} else {
				title = '修改会员';
			}
			$.post('${ctx}/shopproduct/edit?id=' + id, {}, function(str) {

				layer.close(loadIdx);
				perContent =layer.open({
					title : title,
					type : 1,
					area : [ '900px', '750px' ],
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
 */
		function mySubmit() {
			$('#editForm').submit();
		}

		function myQuery() {
			$("#queryForm").attr("action","${ctx}/shopproduct/list");
			$('#queryForm').submit();
		}
		
		function updStatus(id, status){
			var content = '';
			if(status == '1'){
				content = '确认要上架商品吗？';
			}else{
				content = '确认要下架商品吗？';
			}
			
			layer.confirm(content, function(index){
				layer.close(index);
				var loadIdx = layer.load();
				$.ajax({
					url : '${ctx}/shopproduct/upd/status',
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
			$("#queryForm").attr("action","${ctx}/shopproduct/export");
			$('#queryForm').submit();
		}
	</script>
</body>
</html>