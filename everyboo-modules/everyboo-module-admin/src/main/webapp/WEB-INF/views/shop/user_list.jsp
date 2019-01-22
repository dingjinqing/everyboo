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
			<form action="${ctx }/shopuser/list" id="queryForm" method="post">
				<div class="J_toolsBar clearfix">
					<div class="t_label">账号</div>
					<div class="t_text ml10">
						<input placeholder="请输入账号" type="text" name="account" id="account"
							value="${userQueryDTO.account }" />
					</div>
					<div class="t_label">手机号</div>
					<div class="t_text ml10">
						<input placeholder="请输入手机号" type="text" name="phone" id="phone"
							value="${userQueryDTO.phone }" />
					</div>
					<div class="t_label">会员状态</div>
					<div class="t_text ml10">
						<select name="status" >
							<option value=0>请选择</option>
							<option value=1  <c:if test="${1 eq userQueryDTO.status }">selected</c:if> >有效</option>
							<option value=2 <c:if test="${2 eq userQueryDTO.status }">selected</c:if> >无效</option>
						</select>
					</div>
					<div class="t_label">会员等级</div>
					<div class="t_text ml10">
						<select name="level" >
							<option value="">请选择</option>
							<option value="t0" <c:if test="${'t0' eq userQueryDTO.level }">selected</c:if> >普通会员</option>
							<option value="t1" <c:if test="${'t1' eq userQueryDTO.level }">selected</c:if> >黄金会员</option>
							<option value="t2" <c:if test="${'t2' eq userQueryDTO.level }">selected</c:if> >铂金会员</option>
							<option value="t3" <c:if test="${'t3' eq userQueryDTO.level }">selected</c:if> >钻石会员</option>
						</select>
					</div>
					<div class="t_label">加盟店等级</div>
					<div class="t_text ml10">
						<select name="vipLevel" >
							<option value="">请选择</option>
							<%-- <option value="v0" <c:if test="${'v0' eq userQueryDTO.vipLevel }">selected</c:if> >普通会员</option> --%>
							<option value="v1" <c:if test="${'v1' eq userQueryDTO.vipLevel }">selected</c:if> >无</option>
							<option value="v2" <c:if test="${'v2' eq userQueryDTO.vipLevel }">selected</c:if> >一级加盟店</option>
							<option value="v3" <c:if test="${'v3' eq userQueryDTO.vipLevel }">selected</c:if> >二级加盟店</option>
							<option value="v4" <c:if test="${'v4' eq userQueryDTO.vipLevel }">selected</c:if> >三级加盟店</option>
							<option value="v5" <c:if test="${'v5' eq userQueryDTO.vipLevel }">selected</c:if> >四级加盟店</option>
							<option value="v6" <c:if test="${'v6' eq userQueryDTO.vipLevel }">selected</c:if> >五级加盟店</option>
							<option value="v7" <c:if test="${'v7' eq userQueryDTO.vipLevel }">selected</c:if> >六级加盟店</option>
							<option value="v8" <c:if test="${'v8' eq userQueryDTO.vipLevel }">selected</c:if> >七级加盟店</option>
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
					<div class="t_button ml10">
	               		<a class="abtn maxblue" href="javascript:myExport();">
	               			<i class="icon"></i>导出
	               		</a>
	               	</div>
					<div class="t_label ml10">
						记录数：<label style="color: red;" id="total">${page.totalCount }</label>
					</div>
					
					<div class="t_label">&nbsp;&nbsp;&nbsp;&nbsp;</div>
					<div class="t_label">分红金额</div>
					<div class="t_text ml10">
						<input placeholder="请输入分红金额" type="text" name="shouyi" id="shouyi" />
					</div>
					<div class="t_label">分红时间</div>
					<div class="t_text ml10">
						<input type="text" name="createDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"/>
					</div>
					<div class="t_label">分红类型</div>
					<div class="t_text ml10">
						<select name="fenhongtype" >
							<option value=1 selected  >平台分红</option>
							<option value=2 >加盟店奖励</option>
						</select>
					</div>
					<div class="t_button ml10">
	               		<a class="abtn maxblue" href="javascript:fenhong();">
	               			<i class="icon"></i>分红
	               		</a>
	               	</div>
				</div>

				<div class="J_table mt20">
					<div class="t_table">
						<table>
							<thead>
								<tr>
									<td><span>账户名</span></td>
									<td><span>手机号</span></td>
									<td><span>推荐人手机号</span></td>
									<td><span>会员等级</span></td>
									<td><span>加盟店等级</span></td>
									<td><span>账号状态</span></td>
									<!-- <td><span>会员状态</span></td> -->
									<td><span>健康余额</span></td>
									<td><span>兑换积分</span></td>
									<td><span>共享收益</span></td>
									<td><span>消费积分</span></td>
									<td><span>销售收益</span></td>
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
													<div class="t_text tc">${u.account }</div>
												</td>
												<td>
													<div class="t_text tc">${u.phone }</div>
												</td>
												<td>
													<div class="t_text tc">${u.refPhone }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${'t1' eq u.level}">
		                                     			黄金会员
		                                     		</c:when>
															<c:when test="${'t2' eq u.level}">
		                                     			铂金会员
		                                     		</c:when>
															<c:when test="${'t3' eq u.level}">
		                                     			钻石会员
		                                     		</c:when>	
															<c:otherwise>
		                                     			普通会员
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<%-- <c:when test="${'v0' eq u.vipLevel}">
		                                     			普通会员
		                                     		</c:when> --%>
															<c:when test="${'v1' eq u.vipLevel}">
		                                     			无
		                                     		</c:when>
															<c:when test="${'v2' eq u.vipLevel}">
		                                     			一级加盟店
		                                     		</c:when>
															<c:when test="${'v3' eq u.vipLevel}">
		                                     			二级加盟店
		                                     		</c:when>
															<c:when test="${'v4' eq u.vipLevel}">
		                                     			三级加盟店
		                                     		</c:when>
															<c:when test="${'v5' eq u.vipLevel}">
		                                     			四级加盟店
		                                     		</c:when>
															<c:when test="${'v6' eq u.vipLevel}">
		                                     			五级加盟店
		                                     		</c:when>
															<c:when test="${'v7' eq u.vipLevel}">
		                                     			六级加盟店
		                                     		</c:when>
															<c:when test="${'v8' eq u.vipLevel}">
		                                     			七级加盟店
		                                     		</c:when>
															<c:otherwise>
		                                     			普通会员
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${'1' eq u.status}">
		                                     			有效
		                                     		</c:when>
															<c:otherwise>
		                                     			无效
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<%-- <td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${'1' eq u.status}">
		                                     			参与分红
		                                     		</c:when>
															<c:otherwise>
		                                     			不参与
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td> --%>
												<td>
													<div class="t_text tc">${u.shopUserExts.balance }</div>
												</td>
												<td>
													<div class="t_text tc">${u.shopUserExts.duihuan }
													</div>
												</td>
												<td>
													<div class="t_text tc">${u.shopUserExts.tuiguang }
													</div>
												</td>
												<td>
													<div class="t_text tc">${u.shopUserExts.credits }</div>
												</td>
												<td>
													<div class="t_text tc">${u.shopUserExts.xiaoshou }</div>
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
														<a href="javascript:myShow('${u.id }');"><i
															class="icon"></i>团队</a>
														<c:choose>
				                                         	<c:when test="${u.status eq '1' }">
				                                         		<a href="javascript:updStatus('${u.id }', '2');"><i class="icon"></i>失效</a>
				                                         	</c:when>
				                                         	<c:otherwise>
				                                         		<a href="javascript:updStatus('${u.id }', '1');"><i class="icon"></i>生效</a>
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
			$.post('${ctx}/shopuser/edit?id=' + id, {}, function(str) {

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
		
		function myShow(id) {
			var loadIdx = layer.load();
			var title = '团队显示';
			if (!id) {
				id = '';
			} else {
				title = '团队显示';
			}
			$.post('${ctx}/shopuser/show?id=' + id, {}, function(str) {

				layer.close(loadIdx);
				layer.open({
					title : title,
					type : 1,
					area : [ '860px', '600px' ],
					content : str,
					/* btn : [ '确定', '取消' ], */
					btn : [ '取消' ],
					/* yes : function(index, layero) {
						$('#editForm').submit();
					}, */
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
			$("#queryForm").attr("action","${ctx}/shopuser/list");
			$('#queryForm').submit();
		}
		function fenhong() {
			$("#queryForm").attr("action","${ctx}/shopuser/fenhong");
			$('#queryForm').submit();
		}
		
		function updStatus(id, status){
			var content = '';
			if(status == '1'){
				content = '确认要解禁用户吗？';
			}else{
				content = '确认要拉黑用户吗？';
			}
			
			layer.confirm(content, function(index){
				layer.close(index);
				var loadIdx = layer.load();
				$.ajax({
					url : '${ctx}/shopuser/upd/status',
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
			$("#queryForm").attr("action","${ctx}/shopuser/export");
			$('#queryForm').submit();
		}
	</script>
</body>
</html>