<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<html>

<%@ include file="../../common/jstl.jsp"%>

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
</script>

<head>
</head>

<body>


	<div id="addForm" class="mgt20">
		<form action="${ctx }/shopuser/save" id="editForm" method="post">
			<input type="hidden" name="id" value="${bean.id }" /> <input
				type="hidden" name="password" value="${bean.password }" /> <input
				type="hidden" name="createDate" value="${bean.createDate }" /> <input
				type="hidden" name="jiaoyimima" value="${bean.jiaoyimima }" /> <input
				type="hidden" name="shopUserExts.id"
				value="${bean.shopUserExts.id }" /> <input type="hidden"
				name="shopUserExts.createDate"
				value="${bean.shopUserExts.createDate}" />
			<div class="">
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
													<input type="text" name="refPhone"
														value="${bean.refPhone }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="refPhone" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
							<td class="l_title w150"><b class="cRed">*</b> 会员等级</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<select name="vipLevel" data-rule="会员等级:required;"
														value="${bean.vipLevel }">
														<option value="v0"
															<c:if test="${'v0' eq bean.vipLevel }">selected</c:if>>普通会员</option>
														<option value="v1"
															<c:if test="${'v1' eq bean.vipLevel }">selected</c:if>>个人vip</option>
														<option value="v2"
															<c:if test="${'v2' eq bean.vipLevel }">selected</c:if>>初级代理</option>
														<option value="v3"
															<c:if test="${'v3' eq bean.vipLevel }">selected</c:if>>中级代理</option>
														<option value="v4"
															<c:if test="${'v4' eq bean.vipLevel }">selected</c:if>>高级代理</option>
														<option value="v5"
															<c:if test="${'v5' eq bean.vipLevel }">selected</c:if>>核心代理</option>
														<option value="v6"
															<c:if test="${'v6' eq bean.vipLevel }">selected</c:if>>运营中心</option>
														<option value="v7"
															<c:if test="${'v7' eq bean.vipLevel }">selected</c:if>>公司合伙人</option>
													</select>
												</c:when>
												<c:otherwise>
													<select name="vipLevel" data-rule="会员等级:required;">
														<option value="v0">普通会员</option>
														<option value="v1" selected>个人vip</option>
														<option value="v2">初级代理</option>
														<option value="v3">中级代理</option>
														<option value="v4">高级代理</option>
														<option value="v5">核心代理</option>
														<option value="v6">运营中心</option>
														<option value="v7">公司合伙人</option>
													</select>
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td class="l_title w150">地址</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="address" value="${bean.address }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="address" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
							<td class="l_title w150"><b class="cRed">*</b>状态</td>
							<td>
								<div class="J_toolsBar fl">
									<label><input name="status" type="radio" value="1"
										<c:if test="${bean.status == null || bean.status == 1 }">checked="checked"</c:if> />有效</label>
									<label><input name="status" type="radio" value="2"
										<c:if test="${bean.status == 2 }">checked="checked"</c:if> />无效</label>
								</div>
							</td>
						</tr>

						<tr>
							<td class="l_title w150"><b class="cRed">*</b>购物积分</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.credits"
														data-rule="购物积分:required;"
														value="${bean.shopUserExts.credits }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.credits"
														data-rule="购物积分:required;" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
							<td class="l_title w150"><b class="cRed">*</b>共享上限</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.bill"
														data-rule="共享上限:required;"
														value="${bean.shopUserExts.bill }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.bill"
														data-rule="共享上限:required;" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td class="l_title w150"><b class="cRed">*</b>共享积分</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.activeBill"
														data-rule="共享积分:required;"
														value="${bean.shopUserExts.activeBill }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.activeBill"
														data-rule="共享积分:required;" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
							<td class="l_title w150"><b class="cRed">*</b>广告上限</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.tradeBill"
														data-rule="广告上限:required;"
														value="${bean.shopUserExts.tradeBill }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.tradeBill"
														data-rule="广告上限:required;" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td class="l_title w150"><b class="cRed">*</b>广告积分</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.tuiguang"
														data-rule="广告积分:required;"
														value="${bean.shopUserExts.tuiguang }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.tuiguang"
														data-rule="广告积分:required;" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
							<td class="l_title w150"><b class="cRed">*</b>会员状态</td>
							<td>
								<div class="J_toolsBar fl">
									<label><input name="vipStatus" type="radio" value="1"
										<c:if test="${bean.vipStatus == null || bean.vipStatus == 1 }">checked="checked"</c:if> />参与分红</label>
									<label><input name="vipStatus" type="radio" value="2"
										<c:if test="${bean.vipStatus == 2 }">checked="checked"</c:if> />不参与</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="l_title w150">消费积分</td>
							<td colspan="">
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.balance"
														value="${bean.shopUserExts.balance }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.balance" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
							<td class="l_title w150">银行卡号</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.bankCard"
														value="${bean.shopUserExts.bankCard }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.bankCard" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td class="l_title w150">银行卡户主名字</td>
							<td colspan="">
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.bankOwer"
														value="${bean.shopUserExts.bankOwer }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.bankOwer" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
							<td class="l_title w150">开户行</td>
							<td>
								<div class="J_toolsBar fl">
									<div class="t_text w200 ml10">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<input type="text" name="shopUserExts.bankDeposit"
														value="${bean.shopUserExts.bankDeposit }" />
												</c:when>
												<c:otherwise>
													<input type="text" name="shopUserExts.bankDeposit" value="" />
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</div>
							</td>
						</tr>

					</table>
				</div>
			</div>
		</form>
	</div>

</body>
</html>