<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<html>

<%@ include file="../../common/jstl.jsp"%>

<head>
</head>

<body>


	<div id="addForm" class="mgt20">
		<form action="${ctx }/shopuser/updateUser" id="editForm" method="post">
			<input type="hidden" name="id" value="${bean.id }" /> <input
				type="hidden" name="password" value="${bean.password }" /> <input
				type="hidden" name="createDate" value="${bean.createDate }" /> <input
				type="hidden" name="jiaoyimima" value="${bean.jiaoyimima }" /> <input
				type="hidden" name="shopUserExts.id"
				value="${bean.shopUserExts.id }" /> <input type="hidden"
				name="shopUserExts.createDate"
				value="${bean.shopUserExts.createDate}" />
		<div class="J_formTable l_form_table">
			<table class="not_hightlight">
				<tr>
					<td class="l_title w150">会员账号</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <c:choose>
										<c:when test="${not empty bean }">
											<input type="text" name="account" value="${bean.account }" />
										</c:when>
										<c:otherwise>
											<input type="text" name="account" value=""
												data-rule="手机号:required;account;remote[${ctx }/shopuser/validator/account]" />
										</c:otherwise>
									</c:choose>
								</label>
							</div>
						</div>
					</td>
					<td class="l_title w150"><b class="cRed">*</b>手机号</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <c:choose>
										<c:when test="${not empty bean }">
											<input type="text" name="phone" data-rule="手机号:required;"
												value="${bean.phone }" readonly="readonly" />
										</c:when>
										<c:otherwise>
											<input type="text" name="phone"
												data-rule="手机号:required;phone;remote[${ctx }/shopuser/validator/phone]"
												value="" />
										</c:otherwise>
									</c:choose>
								</label>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td class="l_title w150">推荐人手机号</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <c:choose>
										<c:when test="${not empty bean }">
											<input type="text" name="refPhone" value="${bean.refPhone }" />
										</c:when>
										<c:otherwise>
											<input type="text" name="refPhone" value="" />
										</c:otherwise>
									</c:choose>
								</label>
							</div>
						</div>
					</td>
					<td class="l_title w150"><b class="cRed">*</b> 加盟店等级</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <c:choose>
										<c:when test="${not empty bean }">
											<select name="vipLevel" data-rule="加盟店等级:required;"
												value="${bean.vipLevel }">
												<%--                                      				<option value="v0" <c:if test="${'v0' eq bean.vipLevel }">selected</c:if> >普通会员</option>
 --%>
												<option value="v1"
													<c:if test="${'v1' eq bean.vipLevel }">selected</c:if>>无</option>
												<option value="v2"
													<c:if test="${'v2' eq bean.vipLevel }">selected</c:if>>一级加盟店</option>
												<option value="v3"
													<c:if test="${'v3' eq bean.vipLevel }">selected</c:if>>二级加盟店</option>
												<option value="v4"
													<c:if test="${'v4' eq bean.vipLevel }">selected</c:if>>三级加盟店</option>
												<option value="v5"
													<c:if test="${'v5' eq bean.vipLevel }">selected</c:if>>四级加盟店</option>
												<option value="v6"
													<c:if test="${'v6' eq bean.vipLevel }">selected</c:if>>五级加盟店</option>
												<option value="v7"
													<c:if test="${'v7' eq bean.vipLevel }">selected</c:if>>六级加盟店</option>
												<option value="v8"
													<c:if test="${'v8' eq bean.vipLevel }">selected</c:if>>七级加盟店</option>
											</select>
										</c:when>
										<c:otherwise>
											<select name="vipLevel" data-rule="加盟店等级:required;">
												<!--                                      				<option value="v0">普通会员</option>
 -->
												<option value="v1" selected>无</option>
												<option value="v2">一级加盟店</option>
												<option value="v3">二级加盟店</option>
												<option value="v4">三级加盟店</option>
												<option value="v5">四级加盟店</option>
												<option value="v6">五级加盟店</option>
												<option value="v7">六级加盟店</option>
												<option value="v8">七级加盟店</option>
											</select>
										</c:otherwise>
									</c:choose>
								</label>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td class="l_title w150">补充营业额</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <c:choose>
										<c:when test="${not empty bean }">
											<input type="text" name="shopUserExts.activeBill"
												value="${bean.shopUserExts.activeBill }" />
										</c:when>
										<c:otherwise>
											<input type="text" name="shopUserExts.activeBill"
												value="" />
										</c:otherwise>
									</c:choose>
								</label>
							</div>
						</div>
					</td>
					<td class="l_title w150">营业额</td>
					<td>
						<%-- <div class="J_toolsBar fl">
							<label><input name="status" type="radio" value="1"
								<c:if test="${bean.status == null || bean.status == 1 }">checked="checked"</c:if> />有效</label>
							<label><input name="status" type="radio" value="2"
								<c:if test="${bean.status == 2 }">checked="checked"</c:if> />无效</label>
						</div> --%>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <input type="text" name="xiaofei2"
									value="${xiaofei2+xiaofei3+bean.shopUserExts.activeBill }" />
								</label>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td class="l_title w150">个人消费</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <input type="text" name="xiaofei1"
									value="${xiaofei1 }" />
								</label>
							</div>
						</div>
					</td>
					<td class="l_title w150">直推消费</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <input type="text" name="xiaofei2"
									value="${xiaofei2 }" />
								</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l_title w150">间推消费</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <input type="text" name="xiaofei3"
									value="${xiaofei3 }" />
								</label>
							</div>
						</div>
					</td>
					<td class="l_title w150">会员等级</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <c:choose>
										<c:when test="${not empty bean }">
											<select name="level" data-rule="会员等级:required;">
												<option value="t1"
													<c:if test="${'t1' eq bean.level }">selected</c:if>>黄金会员</option>
												<option value="t2"
													<c:if test="${'t2' eq bean.level }">selected</c:if>>铂金会员</option>
												<option value="t3"
													<c:if test="${'t3' eq bean.level }">selected</c:if>>钻石会员</option>
												<option value="t0"
													<c:if test="${'t0' eq bean.level }">selected</c:if>>普通会员</option>
											</select>
										</c:when>
										<c:otherwise>
											<select name="level" data-rule="会员等级:required;">
												<option value="t0" selected>普通会员</option>
												<option value="t1">黄金会员</option>
												<option value="t2">铂金会员</option>
												<option value="t3">钻石会员</option>
											</select>
										</c:otherwise>
									</c:choose>
								</label>
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="l_title w150">直推总收入</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <input type="text" name="shouru11"
									value="${shouru12+shouru13 }" />
								</label>
							</div>
						</div>
					</td>
					<td class="l_title w150">间推总收入</td>
					<td>
						<div class="J_toolsBar fl">
							<div class="t_text w200 ml10">
								<label> <input type="text" name="shouru21"
									value="${shouru22+shouru23 }" />
								</label>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>

		</form>
		<!--  直推团队成员-->
		<%-- <c:if test="${not empty zhitui}"> --%>
		<div class="J_table mt20">
			<div class="t_table">
				<table>
					<thead>
						<tr>
							<td colspan="7"><span> 一级销售团队</span></td>
						</tr>
						<tr>
							<td><span>姓名</span></td>
							<td><span>手机号</span></td>
							<td><span>消费金额</span></td>
							<td><span>营业额</span></td>
							<td><span>会员等级</span></td>
							<td><span>加盟店等级</span></td>
							<td><span>操作</span></td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${zhitui != null }">
								<c:forEach items="${zhitui }" var="u">
									<tr>
										<td>
											<div class="t_text tc">${u.account }</div>
										</td>
										<td>
											<div class="t_text tc">${u.phone }</div>
										</td>
										<td>
											<div class="t_text tc">${u.selfyeji }</div>
										</td>
										<td>
											<div class="t_text tc">${u.zituiyeji+u.jiantuiyeji+u.activeBill }</div>
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
													<%-- <c:when test="${'v0' eq u.viplevel}">
		                                     			普通会员
		                                     		</c:when> --%>
													<c:when test="${'v1' eq u.viplevel}">
		                                     			无
		                                     		</c:when>
													<c:when test="${'v2' eq u.viplevel}">
		                                     			一级加盟店
		                                     		</c:when>
													<c:when test="${'v3' eq u.viplevel}">
		                                     			二级加盟店
		                                     		</c:when>
													<c:when test="${'v4' eq u.viplevel}">
		                                     			三级加盟店
		                                     		</c:when>
													<c:when test="${'v5' eq u.viplevel}">
		                                     			四级加盟店
		                                     		</c:when>
													<c:when test="${'v6' eq u.viplevel}">
		                                     			五级加盟店
		                                     		</c:when>
													<c:when test="${'v7' eq u.viplevel}">
		                                     			六级加盟店
		                                     		</c:when>
													<c:when test="${'v8' eq u.viplevel}">
		                                     			七级加盟店
		                                     		</c:when>
													<c:otherwise>
		                                     			普通会员
		                                     		</c:otherwise>
												</c:choose>
											</div>
										</td>
										<td>
											<div class="t_link">
												<a href="javascript:myEdit('${u.id }');">编辑</a>
												<a href="javascript:myShow('${u.id }');">团队</a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">
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

		</div>


		<div class="J_table mt20">
			<div class="t_table">
				<table>
					<thead>
						<tr>
							<td colspan="8"><span>二级销售团队 </span></td>
						</tr>
						<tr>
							<td><span>姓名</span></td>
							<td><span>手机号</span></td>
							<td><span>消费金额</span></td>
							<td><span>营业额</span></td>
							<td><span>会员等级</span></td>
							<td><span>加盟店等级</span></td>
							<td><span>推荐人手机号</span></td>
							<td><span>操作</span></td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${jiantui != null }">
								<c:forEach items="${jiantui }" var="u">
									<tr>
										<td>
											<div class="t_text tc">${u.account }</div>
										</td>
										<td>
											<div class="t_text tc">${u.phone }</div>
										</td>
										<td>
											<div class="t_text tc">${u.selfyeji }</div>
										</td>
										<td>
											<div class="t_text tc">${u.zituiyeji+u.jiantuiyeji+u.activeBill }</div>
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
													<%-- <c:when test="${'v0' eq u.viplevel}">
		                                     			普通会员
		                                     		</c:when> --%>
													<c:when test="${'v1' eq u.viplevel}">
		                                     			无
		                                     		</c:when>
													<c:when test="${'v2' eq u.viplevel}">
		                                     			一级加盟店
		                                     		</c:when>
													<c:when test="${'v3' eq u.viplevel}">
		                                     			二级加盟店
		                                     		</c:when>
													<c:when test="${'v4' eq u.viplevel}">
		                                     			三级加盟店
		                                     		</c:when>
													<c:when test="${'v5' eq u.viplevel}">
		                                     			四级加盟店
		                                     		</c:when>
													<c:when test="${'v6' eq u.viplevel}">
		                                     			五级加盟店
		                                     		</c:when>
													<c:when test="${'v7' eq u.viplevel}">
		                                     			六级加盟店
		                                     		</c:when>
													<c:when test="${'v8' eq u.viplevel}">
		                                     			七级加盟店
		                                     		</c:when>
													<c:otherwise>
		                                     			普通会员
		                                     		</c:otherwise>
												</c:choose>
											</div>
										</td>
										<td>
											<div class="t_text tc">${u.refPhone }</div>
										</td>
										<td>
											<div class="t_link">
												<a href="javascript:myEdit('${u.id }');">编辑</a>
												<a href="javascript:myShow('${u.id }');">团队</a>
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

		</div>
		<%-- </c:if> --%>
		<!-- 订单明细结束 -->



	</div>
	<script type="text/javascript">
	//表单验证
	$(function() {
		$('#editForm').validator({
			fields : {
				name : '角色名称:required;length[~50]'
			},
			valid : function(form) {
				var laodIdx = layer.load();

				$('#editForm').ajaxSubmit({
					data : {},
					traditional : true,
					success : function(result) {
						layer.close(laodIdx);
						if (result.success) {
							layer.alert('保存成功', function() {
								window.location.reload();
							});
						} else {
							layer.alert(result.msg);
						}
					}
				});
			}
		});

	});
	
		function myEdit(id) {
			var loadIdx = layer.load();
			var title = '添加会员';
			if (!id) {
				id = '';
			} else {
				title = '修改会员';
			}
			layer.close(loadIdx-1);
			$.post('${ctx}/shopuser/edit?id=' + id, {}, function(str) {
				layer.close(loadIdx);
				layer.open({
					title : title,
					type : 1,
					area : [ '860px', '600px' ],
					content : str,
					btn : [ '确定', '取消' ],
					yes : function(index, layero) {
						/* $("#editForm").attr("action","${ctx}/shopuser/save"); */
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
			layer.close(loadIdx-1);
			$.post('${ctx}/shopuser/show?id=' + id, {}, function(str) {
				layer.close(loadIdx);
				layer.open({
					title : title,
					type : 1,
					maxmin: true,
					area : [ '860px', '600px' ],
					content : str,
					btn : [ '确定', '取消' ], 
					/* btn : [ '取消' ], */
					yes : function(index, layero) {
						/* $("#editForm").attr("action","${ctx}/shopuser/updateUser"); */
						$('#editForm').submit();
					},
					btn2 : function(index, layero) {
						layer.close(index);
					}
				});
			});
		}
	</script>
</body>
</html>